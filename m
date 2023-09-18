Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D338C46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbjIRJAl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240933AbjIRJAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E00D8
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008JI-M8; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-007B69-8p; Mon, 18 Sep 2023 10:59:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-002Z9F-Vg; Mon, 18 Sep 2023 10:59:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/24] hwmon: (max197) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:36 +0200
Message-Id: <20230918085951.1234172-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MWVb3o3fYD3B/3RNm0kBj7/nNllWuIZC/s7a5ncXA04=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQOARMNvd9xMnNcFE59kr/i8tU4P9DRVNz+6YwcB/7iB G+j6QKdjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEzEgZ39fyzXYR6R5Ru2yHyR mC6Yudg3i23ZutkGbNt2u27ZvnfasU9nS2UrJyY9eHTq20sOweS+dCkZs6L7qnZBRufEC9kqd3x WFekR1WSQe3F16dSsfnPbi0/537Xztd1OXO/+r4YnZmPS851LHr5N1Pb/37P5SHJiZVTQ/8QElv Mt+S9+XWPc5fs/927ph4vd3E5TGfY2/jiep2AY86bxYfTT0DrlN0oWH3NTnv2JeXgr20ZhU2A5Y 5FBHuNa78/Hc+5mzIrY+32m/r/5iVuTc+6Ften5bjiaVvUv9aTOPH+lU/Oql/6Vqb/cWL8813ul jbcAH/NqYZtTuV3VTYWZh/uFhTTeSt++/nRmjuzTTd1vAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/max197.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max197.c b/drivers/hwmon/max197.c
index 56add579e32f..bb30403f81ca 100644
--- a/drivers/hwmon/max197.c
+++ b/drivers/hwmon/max197.c
@@ -312,14 +312,12 @@ static int max197_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int max197_remove(struct platform_device *pdev)
+static void max197_remove(struct platform_device *pdev)
 {
 	struct max197_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &max197_sysfs_group);
-
-	return 0;
 }
 
 static const struct platform_device_id max197_device_ids[] = {
@@ -334,7 +332,7 @@ static struct platform_driver max197_driver = {
 		.name = "max197",
 	},
 	.probe = max197_probe,
-	.remove = max197_remove,
+	.remove_new = max197_remove,
 	.id_table = max197_device_ids,
 };
 module_platform_driver(max197_driver);
-- 
2.40.1

