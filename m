Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB7CCD3420
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241072AbjIRJBB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240923AbjIRJAS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F46D18C
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008IR-Cz; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-007B5m-Qg; Mon, 18 Sep 2023 10:59:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-002Z8m-HU; Mon, 18 Sep 2023 10:59:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 02/24] hwmon: (abituguru) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:29 +0200
Message-Id: <20230918085951.1234172-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hr0l0aXjbLsXopIASPHUOnQPED/fbQwnTgx8hLnCzpc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAskSBM9rJwPhp+qrZhIofZIQUoNQoDweS14 iIIV3U6/yqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQLAAKCRCPgPtYfRL+ ThZvB/0VZzwpYArp+d/nosnbgJlmjNmAdqE2j7cS16yGy/awFC+rZTwsWYbsj+C4IYI7q3IheIu RpZf1MNHwafAr/WSwL4FoXMWTmo4ZRl1IqMT/ekQMt8jkSJYDcakQy5C+TrvsKDXzH/C8NiB4Pd 8VsfSDH2BFFChyEnzAmj6sv7osObtCo4d/Enn8pgGU+8hwK39Ip9jUcCoKyb4KMnFsQArirrtVg 4c9HkDXd8zLcEz4aqUj/a4UZqR3a7izXh9ZEDpCbAHoPBvbyQha31LPDiHVZGJqMUmXjGa60/Ej JbJZqEixDwTZJVDUd5dAQ8m+eXlzydXx0I+2oCxDwShdMZhK
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
 drivers/hwmon/abituguru.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index a7cae6568155..93653ea05430 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -1428,7 +1428,7 @@ static int abituguru_probe(struct platform_device *pdev)
 	return res;
 }
 
-static int abituguru_remove(struct platform_device *pdev)
+static void abituguru_remove(struct platform_device *pdev)
 {
 	int i;
 	struct abituguru_data *data = platform_get_drvdata(pdev);
@@ -1439,8 +1439,6 @@ static int abituguru_remove(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(abituguru_sysfs_attr); i++)
 		device_remove_file(&pdev->dev,
 			&abituguru_sysfs_attr[i].dev_attr);
-
-	return 0;
 }
 
 static struct abituguru_data *abituguru_update_device(struct device *dev)
@@ -1533,7 +1531,7 @@ static struct platform_driver abituguru_driver = {
 		.pm	= pm_sleep_ptr(&abituguru_pm),
 	},
 	.probe		= abituguru_probe,
-	.remove		= abituguru_remove,
+	.remove_new	= abituguru_remove,
 };
 
 static int __init abituguru_detect(void)
-- 
2.40.1

