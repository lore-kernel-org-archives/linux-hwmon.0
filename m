Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF52CD13D2
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240868AbjIRJAo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240934AbjIRJAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC329102
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008Jp-RI; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-007B6C-Dr; Mon, 18 Sep 2023 10:59:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-002Z9J-4j; Mon, 18 Sep 2023 10:59:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 10/24] hwmon: (mc13783-adc) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:37 +0200
Message-Id: <20230918085951.1234172-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nn5xrq7DX7lu5wY9Yint50s0zoLGHsO0W7k4UgigcaI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA17cNiFpctvRTnAn3v4gg4T0+PrYy7+nSul mo7SP048AOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQNQAKCRCPgPtYfRL+ TvPyCACRc1aPEDmh3ydUXn5OQ3Kn++FFtDyc3ghOsYWy4aykVuOAcK9iZgRYO9UzJfqHRZuBLaT 0Fu3yn/B5W3G2AbfcZrPQjdUPQ0KsttOFnaz9UXayEExjwIQK5fuorCeRzzJLd7kkJr3Pgdo+K6 DPp/ieomVNTw6eFJXkpY1aukwEO1ULLGPWry3rnJc453SG5wwBxHl4I7ri00Bob3/mqAEMEejan be87MURKlqGajCory3AtCFWA8dUMDxUbkds5DV+mysc6Ve95qESSovVIM7pFnoak1Dkdmm+wN03 Bq1E1ZcvSbEj4DisxQ22hGWvI2gNfIgHnI0vVV1sl2aljp97
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
 drivers/hwmon/mc13783-adc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/mc13783-adc.c b/drivers/hwmon/mc13783-adc.c
index ff147e5e1b8c..67471c9cd4d4 100644
--- a/drivers/hwmon/mc13783-adc.c
+++ b/drivers/hwmon/mc13783-adc.c
@@ -285,7 +285,7 @@ static int __init mc13783_adc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mc13783_adc_remove(struct platform_device *pdev)
+static void mc13783_adc_remove(struct platform_device *pdev)
 {
 	struct mc13783_adc_priv *priv = platform_get_drvdata(pdev);
 	kernel_ulong_t driver_data = platform_get_device_id(pdev)->driver_data;
@@ -299,8 +299,6 @@ static int mc13783_adc_remove(struct platform_device *pdev)
 		sysfs_remove_group(&pdev->dev.kobj, &mc13783_group_16chans);
 
 	sysfs_remove_group(&pdev->dev.kobj, &mc13783_group_base);
-
-	return 0;
 }
 
 static const struct platform_device_id mc13783_adc_idtable[] = {
@@ -317,7 +315,7 @@ static const struct platform_device_id mc13783_adc_idtable[] = {
 MODULE_DEVICE_TABLE(platform, mc13783_adc_idtable);
 
 static struct platform_driver mc13783_adc_driver = {
-	.remove		= mc13783_adc_remove,
+	.remove_new	= mc13783_adc_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 	},
-- 
2.40.1

