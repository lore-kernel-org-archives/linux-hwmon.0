Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E7ACD13D1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238933AbjIRJAm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240935AbjIRJAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759B9D9
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008Iq-Cv; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-007B5y-KI; Mon, 18 Sep 2023 10:59:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-002Z92-Ai; Mon, 18 Sep 2023 10:59:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/24] hwmon: (f71805f) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:33 +0200
Message-Id: <20230918085951.1234172-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fdxXzCVZhTMr0kPb4TAF1QYRebcQPTKZmZ5e2WrPjHo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAw8sLYB9fdLOj4Rs5AzQuS9+3xmMtI9hsUe wce3V3OVW2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQMAAKCRCPgPtYfRL+ Tp6gB/9FZ/TD6hfOARe0B3sOF3QoyFdlsZnS7vy1UsCQLmSj7r7Xfg7Qh8YfqpuNuP3mYIH5UyB RVsYP7uaP36W2HaQnavzt2V602NFI4q5+T1kjSEJ5moeGBW8yGoLWkuSnVbztCvXe4qU5lPSLod oOnHQI7bF0fDxM0Q7feIxRdMjTJC0JdlhOMi4FtO1S/ihjkkP/uzjB5gJjtEt6AjNytYlyIhaMi CaNEYWIJwfDYpzbgZ7N/f3C1UdPqfYquZ+0a88qWtYUde6F8bHM65qEp27GbfPzS3ZIt3u/m01M 3jyMenCyN8LQIvDc3IyFJFnBXFnwQhrbtXZc5g06MiWOCg5M
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
 drivers/hwmon/f71805f.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/f71805f.c b/drivers/hwmon/f71805f.c
index 7f20edb0677c..243c570dee4c 100644
--- a/drivers/hwmon/f71805f.c
+++ b/drivers/hwmon/f71805f.c
@@ -1480,7 +1480,7 @@ static int f71805f_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int f71805f_remove(struct platform_device *pdev)
+static void f71805f_remove(struct platform_device *pdev)
 {
 	struct f71805f_data *data = platform_get_drvdata(pdev);
 	int i;
@@ -1490,8 +1490,6 @@ static int f71805f_remove(struct platform_device *pdev)
 	for (i = 0; i < 4; i++)
 		sysfs_remove_group(&pdev->dev.kobj, &f71805f_group_optin[i]);
 	sysfs_remove_group(&pdev->dev.kobj, &f71805f_group_pwm_freq);
-
-	return 0;
 }
 
 static struct platform_driver f71805f_driver = {
@@ -1499,7 +1497,7 @@ static struct platform_driver f71805f_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= f71805f_probe,
-	.remove		= f71805f_remove,
+	.remove_new	= f71805f_remove,
 };
 
 static int __init f71805f_device_add(unsigned short address,
-- 
2.40.1

