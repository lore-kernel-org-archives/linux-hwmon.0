Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DE4C6FA8B
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 07:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiIVHtS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiIVHtS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 03:49:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E728BD33FA
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 00:49:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1obGxO-0005GY-8H; Thu, 22 Sep 2022 09:49:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1obGxO-002D8q-1r; Thu, 22 Sep 2022 09:49:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1obGxL-002fH2-Ng; Thu, 22 Sep 2022 09:49:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     kernel@pengutronix.de, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: sis5595: Introduce a #define for the driver name and use it
Date:   Thu, 22 Sep 2022 09:48:59 +0200
Message-Id: <20220922074900.2763331-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=X03tB9ZtHbleU7cV3FyA/HMHgoW4USKMTPOzf3m5KWk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjLBNlXraPrhy62cBPUYaxcVoE1+72ceY9zulvdHVp MqMhCJKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYywTZQAKCRDB/BR4rcrsCV9cB/ wMZaP8tLD0vZGnrsnQLrH1jxkkhuNKZbaTvkyyiLA7YhKQZ9qR/QZknfQUl7yzun0QWJy9P75kzdpm MftV9a7GgkYBOLSs8JT3fp6hFgurTHAHl+HZ/pGEUfcCw/lLiRMiUtmKFAVrtRXxnYlLO1S4pQOkTw n34+QmzslUSjJ4K77kchHXq5EVr5TqiK/M/GgFzsrQslf37UzfC/7BeXDpd0WPcgmssiDUQ8wGuA8C oIzMl9iogeu18iZy1Agowt/cE3whK9T38H2qpjevI1L3dFltB/R6zJqJyHkQl1lqh2pUtRv+Ubl084 vzmrAQzZCyca3l7IYRuv/wWGHCDjbO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Make use of the cpp symbol DRIVER_NAME to set the driver's name and use
it instead of all explicit usages of the same string. Also make use of
it instead of sis5595_driver.driver.name which breaks a cyclic dependency
between sis5595_probe() and sis5595_driver that in the next commit allows
to drop some forward declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/sis5595.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 018cb5a7651f..013f87da6fff 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -37,6 +37,7 @@
  *	 735		0008		0735
  */
 
+#define DRIVER_NAME "sis5595"
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
@@ -201,7 +202,7 @@ static void sis5595_init_device(struct sis5595_data *data);
 
 static struct platform_driver sis5595_driver = {
 	.driver = {
-		.name	= "sis5595",
+		.name	= DRIVER_NAME,
 	},
 	.probe		= sis5595_probe,
 	.remove		= sis5595_remove,
@@ -580,7 +581,7 @@ static int sis5595_probe(struct platform_device *pdev)
 	/* Reserve the ISA region */
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!devm_request_region(&pdev->dev, res->start, SIS5595_EXTENT,
-				 sis5595_driver.driver.name))
+				 DRIVER_NAME))
 		return -EBUSY;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(struct sis5595_data),
@@ -591,7 +592,7 @@ static int sis5595_probe(struct platform_device *pdev)
 	mutex_init(&data->lock);
 	mutex_init(&data->update_lock);
 	data->addr = res->start;
-	data->name = "sis5595";
+	data->name = DRIVER_NAME;
 	platform_set_drvdata(pdev, data);
 
 	/*
@@ -764,7 +765,7 @@ static int sis5595_device_add(unsigned short address)
 	struct resource res = {
 		.start	= address,
 		.end	= address + SIS5595_EXTENT - 1,
-		.name	= "sis5595",
+		.name	= DRIVER_NAME,
 		.flags	= IORESOURCE_IO,
 	};
 	int err;
@@ -773,7 +774,7 @@ static int sis5595_device_add(unsigned short address)
 	if (err)
 		goto exit;
 
-	pdev = platform_device_alloc("sis5595", address);
+	pdev = platform_device_alloc(DRIVER_NAME, address);
 	if (!pdev) {
 		err = -ENOMEM;
 		pr_err("Device allocation failed\n");
@@ -886,7 +887,7 @@ static int sis5595_pci_probe(struct pci_dev *dev,
 }
 
 static struct pci_driver sis5595_pci_driver = {
-	.name            = "sis5595",
+	.name            = DRIVER_NAME,
 	.id_table        = sis5595_pci_ids,
 	.probe           = sis5595_pci_probe,
 };

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

