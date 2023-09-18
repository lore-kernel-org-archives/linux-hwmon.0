Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DC2CD13D1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237689AbjIRJAz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240881AbjIRJAO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:14 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28CD12A
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-0008Qx-Il; Mon, 18 Sep 2023 11:00:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-007B6h-KT; Mon, 18 Sep 2023 10:59:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-002Z9g-BI; Mon, 18 Sep 2023 10:59:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 16/24] hwmon: (sis5595) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:43 +0200
Message-Id: <20230918085951.1234172-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=S1ts/lyOk18OE3/RHR+4V/NjuO0HJyUoYjNx0bxf1lQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA8cbOlf3w1lu7ElrBc515qDWh9lWLFlanZj zZEheO3bU2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQPAAKCRCPgPtYfRL+ ToqNCACICBMDN40GXNFQmD6H1/y3t3d0YyJpO2npOX3vFwE0ev08rZZgmu9Bxk7q61zOf/FyX0p 1765xjvuJF+xb/QPfk9jniikr8+jpTP96HF6aFHkPbOvTFfi8hTYlLo6B1RE8Hu/DCYwz+utS73 H1u/X14u3TSoptRNQRqcJsPmKjYzG40uEIAga4rq/qbGptf16r1BXJ3bDieT/s+aMxPJGGuTSi6 8+1aDZAVkq5M21So28ZlNf7fnokuukYk3ngB0yEQI4rYf4tuemTG/4o94pyr3/9nM1Ox+y4bbDa KPxgyxJI8DkUvf+zExoC8MrPKNypIeQrw4D9Z/ksMhhWLYsa
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
 drivers/hwmon/sis5595.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 0a0479501e11..641be1f7f9cd 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -709,7 +709,7 @@ static int sis5595_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int sis5595_remove(struct platform_device *pdev)
+static void sis5595_remove(struct platform_device *pdev)
 {
 	struct sis5595_data *data = platform_get_drvdata(pdev);
 
@@ -717,8 +717,6 @@ static int sis5595_remove(struct platform_device *pdev)
 	sysfs_remove_group(&pdev->dev.kobj, &sis5595_group);
 	sysfs_remove_group(&pdev->dev.kobj, &sis5595_group_in4);
 	sysfs_remove_group(&pdev->dev.kobj, &sis5595_group_temp1);
-
-	return 0;
 }
 
 static const struct pci_device_id sis5595_pci_ids[] = {
@@ -790,7 +788,7 @@ static struct platform_driver sis5595_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= sis5595_probe,
-	.remove		= sis5595_remove,
+	.remove_new	= sis5595_remove,
 };
 
 static int sis5595_pci_probe(struct pci_dev *dev,
-- 
2.40.1

