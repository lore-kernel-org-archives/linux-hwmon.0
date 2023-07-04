Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB38EB64DA
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Jul 2023 13:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjGDNSZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Jul 2023 09:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGDNSX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Jul 2023 09:18:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395E21727;
        Tue,  4 Jul 2023 06:17:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 72B9261261;
        Tue,  4 Jul 2023 13:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E24CC433C7;
        Tue,  4 Jul 2023 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688476669;
        bh=oE4RQqmUGY45i8W34rZXtMiLxR88iomAGlfzs9Qo+uE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dyRF5n39RMpeVXrd/SkpRtifqXWamCc2n5HL5pJgSuVEAXiCf275TeAdj12L2Q7ZX
         L4EURs9/spJk4gkI9jttM3vApNu9km6ou9slVa7Lul1cXreUIF9lVDC5WbrseAc262
         bxKNuSCvHPtIwrCFK5Sp63oWSOYcyXzyykCh9Z2A=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, samsagax@gmail.com,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] hwmon: (oxp-sensors): move to use dev_groups from platform device
Date:   Tue,  4 Jul 2023 14:17:18 +0100
Message-ID: <20230704131715.44454-7-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704131715.44454-5-gregkh@linuxfoundation.org>
References: <20230704131715.44454-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423; i=gregkh@linuxfoundation.org; h=from:subject; bh=oE4RQqmUGY45i8W34rZXtMiLxR88iomAGlfzs9Qo+uE=; b=owGbwMvMwCRo6H6F97bub03G02pJDClLpO9Fr31+uEZO6Xabxkr9JI6XPT9O+LyXcjr0fcusD V7205eLdcSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEpgsxzFPqEN9+ufSF0ran Ym/fXxVy/fRNuZBhnnVL+Ebn2b3uU0PaRVp/lG6p0v50EQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

A driver should not be manually adding groups in its probe function (it
will race with userspace), so replace the call to
devm_device_add_groups() to use the platform dev_groups callback
instead.

This is the last in-kernel user of devm_device_add_groups(), so it can
be successfully removed at this point in time.

Cc: Joaquín Ignacio Aramendía <samsagax@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hwmon/oxp-sensors.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index 3bcba0c476c4..34e561ba9e8b 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -408,12 +408,33 @@ static const struct hwmon_channel_info * const oxp_platform_sensors[] = {
 	NULL,
 };
 
+static umode_t oxp_ec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	switch (get_board_type()) {
+	case aok_zoe_a1:
+	case oxp_mini_amd_a07:
+	case oxp_mini_amd_pro:
+		return attr->mode;
+	default:
+		break;
+	}
+	return 0;
+}
+
 static struct attribute *oxp_ec_attrs[] = {
 	&dev_attr_tt_toggle.attr,
 	NULL
 };
 
-ATTRIBUTE_GROUPS(oxp_ec);
+static struct attribute_group oxp_ec_attribute_group = {
+	.is_visible = oxp_ec_is_visible,
+	.attrs = oxp_ec_attrs,
+};
+
+static const struct attribute_group *oxp_ec_groups[] = {
+	&oxp_ec_attribute_group,
+	NULL
+};
 
 static const struct hwmon_ops oxp_ec_hwmon_ops = {
 	.is_visible = oxp_ec_hwmon_is_visible,
@@ -431,19 +452,6 @@ static int oxp_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device *hwdev;
-	int ret;
-
-	switch (get_board_type()) {
-	case aok_zoe_a1:
-	case oxp_mini_amd_a07:
-	case oxp_mini_amd_pro:
-		ret = devm_device_add_groups(dev, oxp_ec_groups);
-		if (ret)
-			return ret;
-		break;
-	default:
-		break;
-	}
 
 	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
 						     &oxp_ec_chip_info, NULL);
@@ -454,6 +462,7 @@ static int oxp_platform_probe(struct platform_device *pdev)
 static struct platform_driver oxp_platform_driver = {
 	.driver = {
 		.name = "oxp-platform",
+		.dev_groups = oxp_ec_groups,
 	},
 	.probe = oxp_platform_probe,
 };
-- 
2.41.0

