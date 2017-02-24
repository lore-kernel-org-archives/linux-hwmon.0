Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54429
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751736AbdBXNPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:05 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/19] hwmon: (ina2xx) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:00 -0300
Message-Id: <20170224131313.953-8-javier@osg.samsung.com>
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

 drivers/hwmon/ina2xx.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index b24f1d3045f0..62e38fa8cda2 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -34,6 +34,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
+#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/delay.h>
 #include <linux/util_macros.h>
@@ -424,13 +425,19 @@ static int ina2xx_probe(struct i2c_client *client,
 	struct device *hwmon_dev;
 	u32 val;
 	int ret, group = 0;
+	enum ina2xx_ids chip;
+
+	if (client->dev.of_node)
+		chip = (enum ina2xx_ids)of_device_get_match_data(&client->dev);
+	else
+		chip = id->driver_data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	/* set the device type */
-	data->config = &ina2xx_config[id->driver_data];
+	data->config = &ina2xx_config[chip];
 
 	if (of_property_read_u32(dev->of_node, "shunt-resistor", &val) < 0) {
 		struct ina2xx_platform_data *pdata = dev_get_platdata(dev);
@@ -487,9 +494,35 @@ static const struct i2c_device_id ina2xx_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
 
+static const struct of_device_id ina2xx_of_match[] = {
+	{
+		.compatible = "ti,ina219",
+		.data = (void *)ina219
+	},
+	{
+		.compatible = "ti,ina220",
+		.data = (void *)ina219
+	},
+	{
+		.compatible = "ti,ina226",
+		.data = (void *)ina226
+	},
+	{
+		.compatible = "ti,ina230",
+		.data = (void *)ina226
+	},
+	{
+		.compatible = "ti,ina231",
+		.data = (void *)ina226
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ina2xx_of_match);
+
 static struct i2c_driver ina2xx_driver = {
 	.driver = {
 		.name	= "ina2xx",
+		.of_match_table = of_match_ptr(ina2xx_of_match),
 	},
 	.probe		= ina2xx_probe,
 	.id_table	= ina2xx_id,
-- 
2.9.3

