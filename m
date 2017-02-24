Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54427
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751672AbdBXNOz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:55 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/19] hwmon: (adt7475) Add OF device ID table
Date: Fri, 24 Feb 2017 10:12:58 -0300
Message-Id: <20170224131313.953-6-javier@osg.samsung.com>
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

 drivers/hwmon/adt7475.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index c646670b9ea9..fcfa48222145 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
@@ -161,6 +162,27 @@ static const struct i2c_device_id adt7475_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7475_id);
 
+static const struct of_device_id adt7475_of_match[] = {
+	{
+		.compatible = "adi,adt7473",
+		.data = (void *)adt7473
+	},
+	{
+		.compatible = "adi,adt7475",
+		.data = (void *)adt7475
+	},
+	{
+		.compatible = "adi,adt7476",
+		.data = (void *)adt7476
+	},
+	{
+		.compatible = "adi,adt7490",
+		.data = (void *)adt7490
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adt7475_of_match);
+
 struct adt7475_data {
 	struct device *hwmon_dev;
 	struct mutex lock;
@@ -1250,6 +1272,7 @@ static void adt7475_remove_files(struct i2c_client *client,
 static int adt7475_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	enum chips chip;
 	static const char * const names[] = {
 		[adt7473] = "ADT7473",
 		[adt7475] = "ADT7475",
@@ -1268,8 +1291,13 @@ static int adt7475_probe(struct i2c_client *client,
 	mutex_init(&data->lock);
 	i2c_set_clientdata(client, data);
 
+	if (client->dev.of_node)
+		chip = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		chip = id->driver_data;
+
 	/* Initialize device-specific values */
-	switch (id->driver_data) {
+	switch (chip) {
 	case adt7476:
 		data->has_voltage = 0x0e;	/* in1 to in3 */
 		revision = adt7475_read(REG_DEVID2) & 0x07;
@@ -1428,6 +1456,7 @@ static struct i2c_driver adt7475_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "adt7475",
+		.of_match_table = of_match_ptr(adt7475_of_match),
 	},
 	.probe		= adt7475_probe,
 	.remove		= adt7475_remove,
-- 
2.9.3

