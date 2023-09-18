Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DCECD13DD
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241035AbjIRJA6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbjIRJAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:17 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E135185
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-000068-Q4; Mon, 18 Sep 2023 11:00:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-007B78-84; Mon, 18 Sep 2023 11:00:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-002ZA9-Us; Mon, 18 Sep 2023 11:00:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 23/24] hwmon: (w83781d) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:50 +0200
Message-Id: <20230918085951.1234172-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rOKuEs91KkITMwg+W+2TRDUVHiFdyRY4k6XBTAySM/4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBBEs4Mc3V0cW13vfHqk5JtKTat9YGojQlLj3 QOA5KEubZeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQRAAKCRCPgPtYfRL+ Tut2B/4pZ2jrYma3zQYBgw02Y9ShjLz1CwNkLDG86Rc9cZWTNMBReQSnE1IkB1LtYCfzSI6XZyJ dOcixJDWuVpgfL4WkmYOvbJ3yE+LHiQTIi6G7I1zkbC8x7PS8zbSSfOJF0ubECpsdiOmlTcrEfB UWJLQiqeFVpkMQMnIXCxBuoxXxRlfVy8Nd+AqmqvDKGKFVMLHks/3V78/EPNkyp3wjL7l8i5Ten 1Ft+AaBmPo8zxnHfZ2ttlWhytZe6G9SVCblGzKJnTPmBKnKpx0Y1/X4H0wSHKxB2lNt99B68Rov XW3teThm2ZlzRUkVxdxBFnSUuRQfyo9CjeuZiceV9ByJ0ijD
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
 drivers/hwmon/w83781d.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index b33f382f238d..cba5ec432e6d 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -1816,16 +1816,13 @@ w83781d_isa_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int
-w83781d_isa_remove(struct platform_device *pdev)
+static void w83781d_isa_remove(struct platform_device *pdev)
 {
 	struct w83781d_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	w83781d_remove_files(&pdev->dev);
 	device_remove_file(&pdev->dev, &dev_attr_name);
-
-	return 0;
 }
 
 static struct platform_driver w83781d_isa_driver = {
@@ -1833,7 +1830,7 @@ static struct platform_driver w83781d_isa_driver = {
 		.name = "w83781d",
 	},
 	.probe = w83781d_isa_probe,
-	.remove = w83781d_isa_remove,
+	.remove_new = w83781d_isa_remove,
 };
 
 /* return 1 if a supported chip is found, 0 otherwise */
-- 
2.40.1

