Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54434
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751125AbdBXNO4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:56 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/19] hwmon: (lm90) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:04 -0300
Message-Id: <20170224131313.953-12-javier@osg.samsung.com>
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

 drivers/hwmon/lm90.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index aff5297bc2bc..c2f411c290bf 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -92,6 +92,7 @@
 #include <linux/hwmon.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/sysfs.h>
 #include <linux/interrupt.h>
 #include <linux/regulator/consumer.h>
@@ -235,6 +236,99 @@ static const struct i2c_device_id lm90_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm90_id);
 
+static const struct of_device_id lm90_of_match[] = {
+	{
+		.compatible = "adi,adm1032",
+		.data = (void *)adm1032
+	},
+	{
+		.compatible = "adi,adt7461",
+		.data = (void *)adt7461
+	},
+	{
+		.compatible = "adi,adt7461a",
+		.data = (void *)adt7461
+	},
+	{
+		.compatible = "gmt,g781",
+		.data = (void *)g781
+	},
+	{
+		.compatible = "national,lm90",
+		.data = (void *)lm90
+	},
+	{
+		.compatible = "national,lm86",
+		.data = (void *)lm86
+	},
+	{
+		.compatible = "national,lm89",
+		.data = (void *)lm86
+	},
+	{
+		.compatible = "national,lm99",
+		.data = (void *)lm99
+	},
+	{
+		.compatible = "dallas,max6646",
+		.data = (void *)max6646
+	},
+	{
+		.compatible = "dallas,max6647",
+		.data = (void *)max6646
+	},
+	{
+		.compatible = "dallas,max6649",
+		.data = (void *)max6646
+	},
+	{
+		.compatible = "dallas,max6657",
+		.data = (void *)max6657
+	},
+	{
+		.compatible = "dallas,max6658",
+		.data = (void *)max6657
+	},
+	{
+		.compatible = "dallas,max6659",
+		.data = (void *)max6659
+	},
+	{
+		.compatible = "dallas,max6680",
+		.data = (void *)max6680
+	},
+	{
+		.compatible = "dallas,max6681",
+		.data = (void *)max6680
+	},
+	{
+		.compatible = "dallas,max6695",
+		.data = (void *)max6696
+	},
+	{
+		.compatible = "dallas,max6696",
+		.data = (void *)max6696
+	},
+	{
+		.compatible = "onnn,nct1008",
+		.data = (void *)adt7461
+	},
+	{
+		.compatible = "winbond,w83l771",
+		.data = (void *)w83l771
+	},
+	{
+		.compatible = "nxp,sa56004",
+		.data = (void *)sa56004
+	},
+	{
+		.compatible = "ti,tmp451",
+		.data = (void *)tmp451
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm90_of_match);
+
 /*
  * chip type specific parameters
  */
@@ -1677,7 +1771,10 @@ static int lm90_probe(struct i2c_client *client,
 	mutex_init(&data->update_lock);
 
 	/* Set the device type */
-	data->kind = id->driver_data;
+	if (client->dev.of_node)
+		data->kind = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		data->kind = id->driver_data;
 	if (data->kind == adm1032) {
 		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE))
 			client->flags &= ~I2C_CLIENT_PEC;
@@ -1816,6 +1913,7 @@ static struct i2c_driver lm90_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm90",
+		.of_match_table = of_match_ptr(lm90_of_match),
 	},
 	.probe		= lm90_probe,
 	.alert		= lm90_alert,
-- 
2.9.3

