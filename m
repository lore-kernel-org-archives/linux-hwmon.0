Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from fudo.makrotopia.org ([185.142.180.71]:39365 "EHLO
	fudo.makrotopia.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503AbcGXUor (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 24 Jul 2016 16:44:47 -0400
Date: Sun, 24 Jul 2016 22:26:25 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org, Axel Lin <axel.lin@ingics.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Per =?iso-8859-1?Q?Dal=E9n?= <per.dalen@appeartv.com>
Subject: [PATCH] hwmon: (ltc4151) Make shunt-resistor configurable
Message-ID: <20160724202620.GA30245@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Allow to specify the resistance of the attached shunt via DT by
adding the shunt-resistor property. Fall-back to the previous
default (1 mOhm) if unset.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/hwmon/ltc4151.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index c86a184..f856e44 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -30,6 +30,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -52,6 +54,7 @@ struct ltc4151_data {
 	struct mutex update_lock;
 	bool valid;
 	unsigned long last_updated; /* in jiffies */
+	unsigned int shunt; /* in micro ohms */
 
 	/* Registers */
 	u8 regs[6];
@@ -111,9 +114,9 @@ static int ltc4151_get_value(struct ltc4151_data *data, u8 reg)
 	case LTC4151_SENSE_H:
 		/*
 		 * 20uV resolution. Convert to current as measured with
-		 * an 1 mOhm sense resistor, in mA.
+		 * a given sense resistor, in mA.
 		 */
-		val = val * 20;
+		val = val * 20 * 1000 / data->shunt;
 		break;
 	case LTC4151_VIN_H:
 		/* 25 mV per increment */
@@ -176,6 +179,7 @@ static int ltc4151_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ltc4151_data *data;
 	struct device *hwmon_dev;
+	u32 shunt;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -ENODEV;
@@ -184,6 +188,14 @@ static int ltc4151_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
+#ifdef CONFIG_OF
+	if (!of_property_read_u32(client->dev.of_node, "shunt-resistor", &shunt)
+		&& shunt > 0 )
+		data->shunt = shunt;
+	else
+#endif
+		data->shunt = 1000; /* 1 mOhm if not set */
+
 	data->client = client;
 	mutex_init(&data->update_lock);
 
@@ -199,10 +211,20 @@ static const struct i2c_device_id ltc4151_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ltc4151_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id ltc4151_match[] = {
+	{ .compatible = "lltc,ltc4151" },
+	{},
+};
+#endif
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ltc4151_driver = {
+	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "ltc4151",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_match_ptr(ltc4151_match),
 	},
 	.probe		= ltc4151_probe,
 	.id_table	= ltc4151_id,
-- 
2.9.0

