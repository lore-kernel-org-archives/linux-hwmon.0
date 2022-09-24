Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28696C07E9D
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 13:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIXN54 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 09:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiIXN5z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 09:57:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E6CE5109
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 06:57:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc5fD-0005Gm-6u; Sat, 24 Sep 2022 15:57:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc5fC-002eww-9Z; Sat, 24 Sep 2022 15:57:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc5fA-003E0y-7s; Sat, 24 Sep 2022 15:57:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] hwmon: via686a: Introduce a #define for the driver name and use it
Date:   Sat, 24 Sep 2022 15:57:37 +0200
Message-Id: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2805; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uEeNRH9eGOL9BGbHebRmN53ewT6Gw3IExbA4QknW0Rs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjLwzLRpnY111d8+9SJJN25oO2S8ZjQPshFpijwiBX JciZ9SGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYy8MywAKCRDB/BR4rcrsCdhuCA CPvZcoYfg1E8QLN7xfU9isVjcnt+YjX18OBOvQH3Q06o0AenHGTqfibWewqa3NEP9ls60JEOYK+F1F mRS5+zo0v6FzUf/enA1fthk+1mCTqGXcWpcZMr72ed5JPoGJkV1vPyp0twL+TucSOlWvzlRUKLNdV5 IZHKBvZsEsIVZmdBcVqXGZgXec2yLurqilPr3GpsUgAGLCI1wJrIJwUCiffZyR5Z/Wic2WwOEwMxVc 65w9bn41u+9OZC0k5aPSqEnx5up4Ex14L1CWwcIrfQZWlXnQaYt/BeeCwFki/Bv65OzXiebNPJc6ur ecyQbjLZvnNJwTI+q/CvLCr4Jr00j7
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
to drop some forward declarations. For an amd64 allyesconfig this even
reduces the size of the driver by 3 bytes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/via686a.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index 55634110c2f9..b17121881235 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -34,6 +34,8 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
+#define DRIVER_NAME "via686a"
+
 /*
  * If force_addr is set to anything different from 0, we forcibly enable
  * the device at the given address.
@@ -656,7 +658,7 @@ static const struct attribute_group via686a_group = {
 
 static struct platform_driver via686a_driver = {
 	.driver = {
-		.name	= "via686a",
+		.name	= DRIVER_NAME,
 	},
 	.probe		= via686a_probe,
 	.remove		= via686a_remove,
@@ -672,7 +674,7 @@ static int via686a_probe(struct platform_device *pdev)
 	/* Reserve the ISA region */
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!devm_request_region(&pdev->dev, res->start, VIA686A_EXTENT,
-				 via686a_driver.driver.name)) {
+				 DRIVER_NAME)) {
 		dev_err(&pdev->dev, "Region 0x%lx-0x%lx already in use!\n",
 			(unsigned long)res->start, (unsigned long)res->end);
 		return -ENODEV;
@@ -685,7 +687,7 @@ static int via686a_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 	data->addr = res->start;
-	data->name = "via686a";
+	data->name = DRIVER_NAME;
 	mutex_init(&data->update_lock);
 
 	/* Initialize the VIA686A chip */
@@ -819,7 +821,7 @@ static int via686a_device_add(unsigned short address)
 	struct resource res = {
 		.start	= address,
 		.end	= address + VIA686A_EXTENT - 1,
-		.name	= "via686a",
+		.name	= DRIVER_NAME,
 		.flags	= IORESOURCE_IO,
 	};
 	int err;
@@ -828,7 +830,7 @@ static int via686a_device_add(unsigned short address)
 	if (err)
 		goto exit;
 
-	pdev = platform_device_alloc("via686a", address);
+	pdev = platform_device_alloc(DRIVER_NAME, address);
 	if (!pdev) {
 		err = -ENOMEM;
 		pr_err("Device allocation failed\n");
@@ -918,7 +920,7 @@ static int via686a_pci_probe(struct pci_dev *dev,
 }
 
 static struct pci_driver via686a_pci_driver = {
-	.name		= "via686a",
+	.name		= DRIVER_NAME,
 	.id_table	= via686a_pci_ids,
 	.probe		= via686a_pci_probe,
 };

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

