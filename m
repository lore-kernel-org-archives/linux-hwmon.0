Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:38044
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755129AbdDMAP0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2017 20:15:26 -0400
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (lm85) Remove unused I2C devices driver_data
Date: Wed, 12 Apr 2017 21:14:56 -0300
Message-Id: <20170413001457.3918-1-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The I2C device ID entries set a .driver_data but this data is never
looked up by the driver. So don't set it and also remove the enum.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/hwmon/lm87.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 04a7a1ddb030..c0766e7392d3 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -75,8 +75,6 @@
 
 static const unsigned short normal_i2c[] = { 0x2c, 0x2d, 0x2e, I2C_CLIENT_END };
 
-enum chips { lm87, adm1024 };
-
 /*
  * The LM87 registers
  */
@@ -981,8 +979,8 @@ static int lm87_probe(struct i2c_client *client, const struct i2c_device_id *id)
  */
 
 static const struct i2c_device_id lm87_id[] = {
-	{ "lm87", lm87 },
-	{ "adm1024", adm1024 },
+	{ "lm87", 0 },
+	{ "adm1024", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm87_id);
-- 
2.9.3

