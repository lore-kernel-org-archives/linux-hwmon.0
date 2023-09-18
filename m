Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D377CD13D3
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbjIRJAs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240837AbjIRJAL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5DB116
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-0008Kq-6V; Mon, 18 Sep 2023 10:59:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-007B6P-Pf; Mon, 18 Sep 2023 10:59:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-002Z9Q-GK; Mon, 18 Sep 2023 10:59:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Jim Cromie <jim.cromie@gmail.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 12/24] hwmon: (pc87360) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:39 +0200
Message-Id: <20230918085951.1234172-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rLYFljyEvQKJvsuc8knRlHVTk+M9jk+lmoFGTyz1Qcs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA3hsWDb6t3JHWYxY6QzZTJG67z9NZ5OJQ6M ocofTTGlKeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQNwAKCRCPgPtYfRL+ TnA2B/9iEXXbkksa5gAneOEJJ5niV7lHbQorfxVNFRaX4xYKVfnUgrqiJEUiEoLdwdXKEOorYIA Tb057aiSoOYg0jiRiKY8CV/BKED3in7eMHj4znVKijv7/3jojGoPxcB9+YtRyfC39VCBwHyYqY0 hsy16VPif/iNzkv8ezmJ8q8j4zdqKRTJUVd/nst4BaT7G2bjN6WDjn7MjVBNlO09asebflLyDuc IeLmh2Wd4DUhfp/u145Jd+xFqya7Ug8zQMYr/v1/M5K1kfEGs+KUyLTEa1p94i5kJ7CGcP59Tih XW7Mu7aYStP3982723LrQ7Y9rS3KqUMrWqsxp2ucxXuzA5JB
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
 drivers/hwmon/pc87360.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index a4adc8bd531f..926ea1fe133c 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -1586,14 +1586,12 @@ static int pc87360_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int pc87360_remove(struct platform_device *pdev)
+static void pc87360_remove(struct platform_device *pdev)
 {
 	struct pc87360_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	pc87360_remove_files(&pdev->dev);
-
-	return 0;
 }
 
 /*
@@ -1604,7 +1602,7 @@ static struct platform_driver pc87360_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= pc87360_probe,
-	.remove		= pc87360_remove,
+	.remove_new	= pc87360_remove,
 };
 
 /*
-- 
2.40.1

