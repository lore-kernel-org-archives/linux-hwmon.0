Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9C3CD13D3
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241020AbjIRJA4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240884AbjIRJAP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:15 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E07E12F
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-0008TU-18; Mon, 18 Sep 2023 11:00:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-007B6o-3F; Mon, 18 Sep 2023 11:00:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-002Z9p-QF; Mon, 18 Sep 2023 10:59:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 18/24] hwmon: (via-cputemp) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:45 +0200
Message-Id: <20230918085951.1234172-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UeAJlM9DxFPVPTGLYJAguFg8qxQfa7bWZe0XLxihHUw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA+smKiUGTLyJGMWf+g5p9Efx6fJT1/+x4Dt OKZ/nuIvW+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQPgAKCRCPgPtYfRL+ TpHYB/4ueF3eHyI/yy6Xz2OeSXY7PaY6a308blHyEBYgD8Z79VSONx8F55krqo4X4quvv96WVPs z/F5J+mFEFRfUQPxDhCd79C+BE1zMkS6f0Qw9bQQTqPwjQwubVLj6vKvB3HezpC2x4m6Flb8DJt GNnWjZpFFF6b0SqCm6Nk184yv5NwU2EA7SoUVM9VtGNOxUXBfrcJowUmtwEYYf+B5mckcqzYGRB 1dkXfWQfAHSBt9+Jamf3FR04w/qTdoHNNKmB3X5jfVfAujPMLMXVkL8W8XmiFFtS5X05sgHoVAD cMlDMhFaaQubo+sI313GwGpA2pt2gAMaQ8OMvMrcSA6D6zlz
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
 drivers/hwmon/via-cputemp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index e5d18dac8ee7..5abe95b683c0 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -182,7 +182,7 @@ static int via_cputemp_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int via_cputemp_remove(struct platform_device *pdev)
+static void via_cputemp_remove(struct platform_device *pdev)
 {
 	struct via_cputemp_data *data = platform_get_drvdata(pdev);
 
@@ -190,7 +190,6 @@ static int via_cputemp_remove(struct platform_device *pdev)
 	if (data->vrm)
 		device_remove_file(&pdev->dev, &dev_attr_cpu0_vid);
 	sysfs_remove_group(&pdev->dev.kobj, &via_cputemp_group);
-	return 0;
 }
 
 static struct platform_driver via_cputemp_driver = {
@@ -198,7 +197,7 @@ static struct platform_driver via_cputemp_driver = {
 		.name = DRVNAME,
 	},
 	.probe = via_cputemp_probe,
-	.remove = via_cputemp_remove,
+	.remove_new = via_cputemp_remove,
 };
 
 struct pdev_entry {
-- 
2.40.1

