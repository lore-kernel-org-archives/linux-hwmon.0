Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CB2ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Sep 2022 13:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiITN46 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Sep 2022 09:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiITN4m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 09:56:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062E111837
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 06:56:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oadjr-0005fE-BN; Tue, 20 Sep 2022 15:56:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oadjr-001s8Q-DQ; Tue, 20 Sep 2022 15:56:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oadjp-002Erc-7t; Tue, 20 Sep 2022 15:56:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Roger Lucas <vt8231@hiddenengine.co.uk>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] hwmon: vt8231: Introduce a #define for the driver name and use it
Date:   Tue, 20 Sep 2022 15:56:16 +0200
Message-Id: <20220920135617.1046361-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nQnD4Las/F9mR8Cg2M08bWu4ZEFbecClGiYRP082BWs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKcZ22SKQ2JjQv+yBqHh2E/7ipnOOS2tuwxUf+0bP xc6S1aGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYynGdgAKCRDB/BR4rcrsCXSqCA CSriOke5aFvkY9EQ4g1sVLfKnp2kk4+8o7yAvXYC7sH6eyAOdoIpEMlAoSp1HmHYgX9YcLqy1eRKuj BZ38nIRDfIl1LrKwzKkCNtSwFmhvn1UL9U0s18vT2NStfz1IzeoVwcF9e+u/ShEl3UzI05OBoUwOnL 27GPZcABj37eZlTuXhA/KyN4H9ckJVV6NVp/Z8pLZ0jY9hKd//ACFS/LVxTrnsizlfbABEI426T/je 1c6I+LqUqmlOxJnqezrAqgasGHfEqFO4EbkWKLYDBFNQgp48X4hktExsJRV+75kU4lR3vFB8UN0V5w qIlbP2tG1Z+SAcnYMckSAc3HY7GVqh
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
it instead of vt8231_driver.driver.name which breaks a cyclic dependency
between vt8231_probe() and vt8231_driver that in the next commit allows
to drop some forward declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/vt8231.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 03275ac8ba72..d84f7db74889 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -38,6 +38,8 @@ static struct platform_device *pdev;
 #define VT8231_BASE_REG 0x70
 #define VT8231_ENABLE_REG 0x74
 
+#define DRIVER_NAME "vt8231"
+
 /*
  * The VT8231 registers
  *
@@ -753,7 +755,7 @@ static const struct attribute_group vt8231_group = {
 
 static struct platform_driver vt8231_driver = {
 	.driver = {
-		.name	= "vt8231",
+		.name	= DRIVER_NAME,
 	},
 	.probe	= vt8231_probe,
 	.remove	= vt8231_remove,
@@ -770,7 +772,7 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 				      const struct pci_device_id *id);
 
 static struct pci_driver vt8231_pci_driver = {
-	.name		= "vt8231",
+	.name		= DRIVER_NAME,
 	.id_table	= vt8231_pci_ids,
 	.probe		= vt8231_pci_probe,
 };
@@ -784,7 +786,7 @@ static int vt8231_probe(struct platform_device *pdev)
 	/* Reserve the ISA region */
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!devm_request_region(&pdev->dev, res->start, VT8231_EXTENT,
-				 vt8231_driver.driver.name)) {
+				 DRIVER_NAME)) {
 		dev_err(&pdev->dev, "Region 0x%lx-0x%lx already in use!\n",
 			(unsigned long)res->start, (unsigned long)res->end);
 		return -ENODEV;
@@ -796,7 +798,7 @@ static int vt8231_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 	data->addr = res->start;
-	data->name = "vt8231";
+	data->name = DRIVER_NAME;
 
 	mutex_init(&data->update_lock);
 	vt8231_init_device(data);
@@ -942,7 +944,7 @@ static int vt8231_device_add(unsigned short address)
 	struct resource res = {
 		.start	= address,
 		.end	= address + VT8231_EXTENT - 1,
-		.name	= "vt8231",
+		.name	= DRIVER_NAME,
 		.flags	= IORESOURCE_IO,
 	};
 	int err;
@@ -951,7 +953,7 @@ static int vt8231_device_add(unsigned short address)
 	if (err)
 		goto exit;
 
-	pdev = platform_device_alloc("vt8231", address);
+	pdev = platform_device_alloc(DRIVER_NAME, address);
 	if (!pdev) {
 		err = -ENOMEM;
 		pr_err("Device allocation failed\n");

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

