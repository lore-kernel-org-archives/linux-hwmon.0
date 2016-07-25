Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from fudo.makrotopia.org ([185.142.180.71]:53280 "EHLO
	fudo.makrotopia.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752143AbcGYRMF (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Jul 2016 13:12:05 -0400
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	 (Exim 4.87)
	(envelope-from <daniel@makrotopia.org>)
	id 1bRjQ8-0002It-MY
	for linux-hwmon@vger.kernel.org; Mon, 25 Jul 2016 19:12:01 +0200
Date: Mon, 25 Jul 2016 19:11:57 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2 v2] hwmon: (ltc4151) Make shunt-resistor configurable
Message-ID: <20160725171154.GA2263@makrotopia.org>
References: <5795A144.2020300@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5795A144.2020300@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Allow to specify the resistance of the attached shunt via DT by
adding the shunt-resistor property. Fall-back to the previous
default (1 mOhm) if unset.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: removed unneeded things and throw -EINVAL for shunt==0
(resent to linux-hwmon which by accident wasn't among the receipients)

 drivers/hwmon/ltc4151.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index c86a184..419c6f7 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -30,6 +30,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -52,6 +53,7 @@ struct ltc4151_data {
 	struct mutex update_lock;
 	bool valid;
 	unsigned long last_updated; /* in jiffies */
+	unsigned int shunt; /* in micro ohms */
 
 	/* Registers */
 	u8 regs[6];
@@ -111,9 +113,9 @@ static int ltc4151_get_value(struct ltc4151_data *data, u8 reg)
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
@@ -176,6 +178,7 @@ static int ltc4151_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ltc4151_data *data;
 	struct device *hwmon_dev;
+	u32 shunt;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -ENODEV;
@@ -184,6 +187,14 @@ static int ltc4151_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
+	if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &shunt))
+		shunt = 1000; /* 1 mOhm if not set via DT */
+
+	if (shunt == 0)
+		return -EINVAL;
+
+	data->shunt = shunt;
+
 	data->client = client;
 	mutex_init(&data->update_lock);
 
@@ -199,10 +210,16 @@ static const struct i2c_device_id ltc4151_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ltc4151_id);
 
+static const struct of_device_id ltc4151_match[] = {
+	{ .compatible = "lltc,ltc4151" },
+	{},
+};
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ltc4151_driver = {
 	.driver = {
 		.name	= "ltc4151",
+		.of_match_table = of_match_ptr(ltc4151_match),
 	},
 	.probe		= ltc4151_probe,
 	.id_table	= ltc4151_id,
-- 
2.9.0

