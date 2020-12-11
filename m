Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5885EC4167B
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 13:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ACBF23E21
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 13:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbgLKNgI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Dec 2020 08:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgLKNf7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Dec 2020 08:35:59 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27932C0613D6
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 05:35:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id 31bD2400Z4C55Sk011bDtf; Fri, 11 Dec 2020 14:35:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kniZl-009hkM-Kk; Fri, 11 Dec 2020 14:35:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kniZl-00CSdD-61; Fri, 11 Dec 2020 14:35:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] hwmon: (iio_hwmon) Drop bogus __refdata annotation
Date:   Fri, 11 Dec 2020 14:35:12 +0100
Message-Id: <20201211133512.2969952-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As the IIO hardware monitoring driver does not have any code or data
located in initmem, there is no need to annotate the iio_hwmon_driver
structure with __refdata.  Drop the annotation, to avoid suppressing
future section warnings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/hwmon/iio_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index b85a125dd86f46a2..580a7d125b88667b 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -169,7 +169,7 @@ static const struct of_device_id iio_hwmon_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, iio_hwmon_of_match);
 
-static struct platform_driver __refdata iio_hwmon_driver = {
+static struct platform_driver iio_hwmon_driver = {
 	.driver = {
 		.name = "iio_hwmon",
 		.of_match_table = iio_hwmon_of_match,
-- 
2.25.1

