Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40535C54EE9
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 10:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiISKrM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiISKqq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 06:46:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734EE286F9
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 03:32:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4F-0007mB-R7; Mon, 19 Sep 2022 12:31:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4F-001e1c-QO; Mon, 19 Sep 2022 12:31:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4D-001w9U-JB; Mon, 19 Sep 2022 12:31:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jim Cromie <jim.cromie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] hwmon: pc87360: Introduce a #define for the driver name and use it
Date:   Mon, 19 Sep 2022 12:31:54 +0200
Message-Id: <20220919103155.795151-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
References: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=B2mpDX1gRteMEnYxmqgUrFwWO7msTjF1d8T/iG8oSpc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKEUTqTeqi7qLsYV5TaMFk/UEeFQ9MSPgrDf9tlZS C2+kMxqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyhFEwAKCRDB/BR4rcrsCee+CA CDu5RIIrIc07ULhb3IBT9ZOFH3PZ9joTac3JIGALPQZQKOWGA9/LvFlDx79Xkir0IxNZ/peIAhyScB /rMCZHf7/Lpb7vDSUFv//khN9nx+5c6v7K3F2YF6T0NFPmhp1JRsumOHToxBPptuxkYZB8ZMdwp9Kn zSDoO2UQQFWBybJq5lHfDyYE0gqatQ84S9g2Kx8249ULJfhfZGTcuZhfGaob4Z2Q3+c3Cc7x/tPCRh je7ngwhbZ6HltgB3OJzYqs3GiYfcbFr7uQTlSFiR7aoRPWegsp+juTaEapBBVa54BTJSmk0u008j32 /D7uJlToNjh/NAq7sPSDeRhf9yxtdF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Make use of the cpp symbol DRIVER_NAME to set the driver's name and also
as name for devm_request_region(). While at it add a module alias using
the new define.

This is a preparation for the next cleanup commit that removes a cyclic
dependency between pc87360_driver (which references pc87360_probe in
.probe) and pc87360_probe() (which used pc87360_driver.driver.name).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/pc87360.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index 0828436a1f6c..b912926c8b18 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -35,6 +35,8 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
+#define DRIVER_NAME "pc87360"
+
 static u8 devid;
 static struct platform_device *pdev;
 static unsigned short extra_isa[3];
@@ -228,10 +230,9 @@ static struct pc87360_data *pc87360_update_device(struct device *dev);
 /*
  * Driver data
  */
-
 static struct platform_driver pc87360_driver = {
 	.driver = {
-		.name	= "pc87360",
+		.name	= DRIVER_NAME,
 	},
 	.probe		= pc87360_probe,
 	.remove		= pc87360_remove,
@@ -1239,7 +1240,7 @@ static int pc87360_probe(struct platform_device *pdev)
 		data->address[i] = extra_isa[i];
 		if (data->address[i]
 		 && !devm_request_region(dev, extra_isa[i], PC87360_EXTENT,
-					 pc87360_driver.driver.name)) {
+					 DRIVER_NAME)) {
 			dev_err(dev,
 				"Region 0x%x-0x%x already in use!\n",
 				extra_isa[i], extra_isa[i]+PC87360_EXTENT-1);
@@ -1781,6 +1782,7 @@ static void __exit pc87360_exit(void)
 MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("PC8736x hardware monitor");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRIVER_NAME);
 
 module_init(pc87360_init);
 module_exit(pc87360_exit);
-- 
2.37.2

