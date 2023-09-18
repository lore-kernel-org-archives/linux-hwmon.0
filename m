Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574F8CD37B0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbjIRJAp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240931AbjIRJAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3C110A
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008Is-D1; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-007B64-0Y; Mon, 18 Sep 2023 10:59:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-002Z9B-Nd; Mon, 18 Sep 2023 10:59:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 08/24] hwmon: (i5k_amb) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:35 +0200
Message-Id: <20230918085951.1234172-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VWlulYbPf5rVhjZ/FS6dh3ZqMiObZmpW+i9lXbXxNzY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAzg9nONqAZlycztBd3aNaztUl5VazT+fjp4 mvKGDH18CGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQMwAKCRCPgPtYfRL+ TpMlB/0SmI105rutpO8FVoQAM5wVPJlhXcHPwGX4wkTBAXrvzcx0GZjjcm0HFkcu0vV7EtErNKr 0nMP4GrOdfwG3jthrUkYEGaucmP0XYq2tlJWpi8nRtNEcnCGZecGeA4wlDDPOxhknk/hXM/i+iI rV+YfTkSz9sP1CP+CgdJ2sJRx6pfIBaLxh7PP6lDtQRz8GyC7hQv8DPiuSJwtiDqDho1VxF+Ism CWAuTZiXdn5Y971IfEbewD/5ByXtkSjJMyjbXJFjP90U+T2BKBCS9OIszuY4/tTYa4ioa1XjIoG tpSKlZi60cvclqFOqVavilfGbfUdKEfwA+rlr3GIukGvCnYa
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
 drivers/hwmon/i5k_amb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index 783fa936e4d1..ff48913fe6bf 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -555,7 +555,7 @@ static int i5k_amb_probe(struct platform_device *pdev)
 	return res;
 }
 
-static int i5k_amb_remove(struct platform_device *pdev)
+static void i5k_amb_remove(struct platform_device *pdev)
 {
 	int i;
 	struct i5k_amb_data *data = platform_get_drvdata(pdev);
@@ -568,7 +568,6 @@ static int i5k_amb_remove(struct platform_device *pdev)
 	iounmap(data->amb_mmio);
 	release_mem_region(data->amb_base, data->amb_len);
 	kfree(data);
-	return 0;
 }
 
 static struct platform_driver i5k_amb_driver = {
@@ -576,7 +575,7 @@ static struct platform_driver i5k_amb_driver = {
 		.name = DRVNAME,
 	},
 	.probe = i5k_amb_probe,
-	.remove = i5k_amb_remove,
+	.remove_new = i5k_amb_remove,
 };
 
 static int __init i5k_amb_init(void)
-- 
2.40.1

