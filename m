Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A015ACD13DA
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240943AbjIRJAr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbjIRJAK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:10 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D20B10D
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008IS-Hb; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-007B5p-1L; Mon, 18 Sep 2023 10:59:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-002Z8r-OH; Mon, 18 Sep 2023 10:59:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Alistair John Strachan <alistair@devzero.co.uk>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 03/24] hwmon: (abituguru3) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:30 +0200
Message-Id: <20230918085951.1234172-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=goNf4rLekOcsxbVlk/nlpWJi0z9FI8unadeLWY5YZK4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAtutzZk79bx1i5R05/IJGuuTpyVtsEjDpK6 PLDh8WHuymJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQLQAKCRCPgPtYfRL+ TiPZB/9vohH9EgHa2h3tILvPx2aNOK1B/K5+7MR8OBrk3nfsPMGGvUECA0IsCYs17ILkULlYLIi 4olDOT6a2EZibI7HiHuzfDz6tZOWREpXi6mRWrJb7YQ1nCcia1BE8U8IP/3Zw5XvdMM2sXmAsZr 1/cKtlutGpe33uUhZjZGHTKPZKO3X3r72qx9+0ktphPODp8XLlfdDjxhxEy8Vf3Vt/67hS85qJI taTvkcQJmJsS7oZgbkTVS+CMWhUQWFMsumSUqzC02u/IHosWKtykTYk6UbChUcmGglZCyxymV+C LGtMWawTvolVdRBuDgX+3xj5/lAW4vbNqkOVMTCXAcU+BGAj
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
 drivers/hwmon/abituguru3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/abituguru3.c b/drivers/hwmon/abituguru3.c
index afb21f73032d..4501f0e49efb 100644
--- a/drivers/hwmon/abituguru3.c
+++ b/drivers/hwmon/abituguru3.c
@@ -1061,7 +1061,7 @@ static int abituguru3_probe(struct platform_device *pdev)
 	return res;
 }
 
-static int abituguru3_remove(struct platform_device *pdev)
+static void abituguru3_remove(struct platform_device *pdev)
 {
 	int i;
 	struct abituguru3_data *data = platform_get_drvdata(pdev);
@@ -1072,7 +1072,6 @@ static int abituguru3_remove(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(abituguru3_sysfs_attr); i++)
 		device_remove_file(&pdev->dev,
 			&abituguru3_sysfs_attr[i].dev_attr);
-	return 0;
 }
 
 static struct abituguru3_data *abituguru3_update_device(struct device *dev)
@@ -1153,7 +1152,7 @@ static struct platform_driver abituguru3_driver = {
 		.pm	= pm_sleep_ptr(&abituguru3_pm),
 	},
 	.probe	= abituguru3_probe,
-	.remove	= abituguru3_remove,
+	.remove_new = abituguru3_remove,
 };
 
 static int __init abituguru3_dmi_detect(void)
-- 
2.40.1

