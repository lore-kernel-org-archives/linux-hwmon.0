Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54436
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751659AbdBXNOz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:55 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/19] hwmon: (ucd9000) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:07 -0300
Message-Id: <20170224131313.953-15-javier@osg.samsung.com>
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

 drivers/hwmon/pmbus/ucd9000.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3e3aa950277f..3518f0c08934 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -21,6 +21,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -119,6 +120,35 @@ static const struct i2c_device_id ucd9000_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
+static const struct of_device_id ucd9000_of_match[] = {
+	{
+		.compatible = "ti,ucd9000",
+		.data = (void *)ucd9000
+	},
+	{
+		.compatible = "ti,ucd90120",
+		.data = (void *)ucd90120
+	},
+	{
+		.compatible = "ti,ucd90124",
+		.data = (void *)ucd90124
+	},
+	{
+		.compatible = "ti,ucd90160",
+		.data = (void *)ucd90160
+	},
+	{
+		.compatible = "ti,ucd9090",
+		.data = (void *)ucd9090
+	},
+	{
+		.compatible = "ti,ucd90910",
+		.data = (void *)ucd90910
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ucd9000_of_match);
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -126,6 +156,7 @@ static int ucd9000_probe(struct i2c_client *client,
 	struct ucd9000_data *data;
 	struct pmbus_driver_info *info;
 	const struct i2c_device_id *mid;
+	enum chips chip;
 	int i, ret;
 
 	if (!i2c_check_functionality(client->adapter,
@@ -151,7 +182,12 @@ static int ucd9000_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	if (id->driver_data != ucd9000 && id->driver_data != mid->driver_data)
+	if (client->dev.of_node)
+		chip = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		chip = id->driver_data;
+
+	if (chip != ucd9000 && chip != mid->driver_data)
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
 			   id->name, mid->name);
@@ -234,6 +270,7 @@ static int ucd9000_probe(struct i2c_client *client,
 static struct i2c_driver ucd9000_driver = {
 	.driver = {
 		.name = "ucd9000",
+		.of_match_table = of_match_ptr(ucd9000_of_match),
 	},
 	.probe = ucd9000_probe,
 	.remove = pmbus_do_remove,
-- 
2.9.3

