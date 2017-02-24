Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54431
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751596AbdBXNOw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:52 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/19] hwmon: (lm75) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:02 -0300
Message-Id: <20170224131313.953-10-javier@osg.samsung.com>
In-Reply-To: <20170224131313.953-1-javier@osg.samsung.com>
References: <20170224131313.953-1-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have an
OF device ID table if the devices are registered via OF.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/hwmon/lm75.c | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index eff3b24d8473..005ffb5ffa92 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -26,6 +26,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
+#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include "lm75.h"
@@ -273,7 +274,12 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	int status, err;
 	u8 set_mask, clr_mask;
 	int new;
-	enum lm75_type kind = id->driver_data;
+	enum lm75_type kind;
+
+	if (client->dev.of_node)
+		kind = (enum lm75_type)of_device_get_match_data(&client->dev);
+	else
+		kind = id->driver_data;
 
 	if (!i2c_check_functionality(client->adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
@@ -424,6 +430,95 @@ static const struct i2c_device_id lm75_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm75_ids);
 
+static const struct of_device_id lm75_of_match[] = {
+	{
+		.compatible = "adi,adt75",
+		.data = (void *)adt75
+	},
+	{
+		.compatible = "dallas,ds1775",
+		.data = (void *)ds1775
+	},
+	{
+		.compatible = "dallas,ds75",
+		.data = (void *)ds75
+	},
+	{
+		.compatible = "dallas,ds7505",
+		.data = (void *)ds7505
+	},
+	{
+		.compatible = "gmt,g751",
+		.data = (void *)g751
+	},
+	{
+		.compatible = "national,lm75",
+		.data = (void *)lm75
+	},
+	{
+		.compatible = "national,lm75a",
+		.data = (void *)lm75a
+	},
+	{
+		.compatible = "national,lm75b",
+		.data = (void *)lm75b
+	},
+	{
+		.compatible = "maxim,max6625",
+		.data = (void *)max6625
+	},
+	{
+		.compatible = "maxim,max6626",
+		.data = (void *)max6626
+	},
+	{
+		.compatible = "maxim,mcp980x",
+		.data = (void *)mcp980x
+	},
+	{
+		.compatible = "st,stds75",
+		.data = (void *)stds75
+	},
+	{
+		.compatible = "microchip,tcn75",
+		.data = (void *)tcn75
+	},
+	{
+		.compatible = "ti,tmp100",
+		.data = (void *)tmp100
+	},
+	{
+		.compatible = "ti,tmp101",
+		.data = (void *)tmp101
+	},
+	{
+		.compatible = "ti,tmp105",
+		.data = (void *)tmp105
+	},
+	{
+		.compatible = "ti,tmp112",
+		.data = (void *)tmp112
+	},
+	{
+		.compatible = "ti,tmp175",
+		.data = (void *)tmp175
+	},
+	{
+		.compatible = "ti,tmp275",
+		.data = (void *)tmp275
+	},
+	{
+		.compatible = "ti,tmp75",
+		.data = (void *)tmp75
+	},
+	{
+		.compatible = "ti,tmp75c",
+		.data = (void *)tmp75c
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm75_of_match);
+
 #define LM75A_ID 0xA1
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
@@ -560,6 +655,7 @@ static struct i2c_driver lm75_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm75",
+		.of_match_table = of_match_ptr(lm75_of_match),
 		.pm	= LM75_DEV_PM_OPS,
 	},
 	.probe		= lm75_probe,
-- 
2.9.3

