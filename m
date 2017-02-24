Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54438
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751505AbdBXNRj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:17:39 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/19] hwmon: (ucd9200) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:08 -0300
Message-Id: <20170224131313.953-16-javier@osg.samsung.com>
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

 drivers/hwmon/pmbus/ucd9200.c | 48 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 033d6aca47d3..a8712c5ded4e 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -20,6 +20,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -46,12 +47,50 @@ static const struct i2c_device_id ucd9200_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucd9200_id);
 
+static const struct of_device_id ucd9200_of_match[] = {
+	{
+		.compatible = "ti,cd9200",
+		.data = (void *)ucd9200
+	},
+	{
+		.compatible = "ti,cd9220",
+		.data = (void *)ucd9220
+	},
+	{
+		.compatible = "ti,cd9222",
+		.data = (void *)ucd9222
+	},
+	{
+		.compatible = "ti,cd9224",
+		.data = (void *)ucd9224
+	},
+	{
+		.compatible = "ti,cd9240",
+		.data = (void *)ucd9240
+	},
+	{
+		.compatible = "ti,cd9244",
+		.data = (void *)ucd9244
+	},
+	{
+		.compatible = "ti,cd9246",
+		.data = (void *)ucd9246
+	},
+	{
+		.compatible = "ti,cd9248",
+		.data = (void *)ucd9248
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ucd9200_of_match);
+
 static int ucd9200_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
 	struct pmbus_driver_info *info;
 	const struct i2c_device_id *mid;
+	enum chips chip;
 	int i, j, ret;
 
 	if (!i2c_check_functionality(client->adapter,
@@ -76,7 +115,13 @@ static int ucd9200_probe(struct i2c_client *client,
 		dev_err(&client->dev, "Unsupported device\n");
 		return -ENODEV;
 	}
-	if (id->driver_data != ucd9200 && id->driver_data != mid->driver_data)
+
+	if (client->dev.of_node)
+		chip = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		chip = id->driver_data;
+
+	if (chip != ucd9200 && chip != mid->driver_data)
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
 			   id->name, mid->name);
@@ -167,6 +212,7 @@ static int ucd9200_probe(struct i2c_client *client,
 static struct i2c_driver ucd9200_driver = {
 	.driver = {
 		.name = "ucd9200",
+		.of_match_table = of_match_ptr(ucd9200_of_match),
 	},
 	.probe = ucd9200_probe,
 	.remove = pmbus_do_remove,
-- 
2.9.3

