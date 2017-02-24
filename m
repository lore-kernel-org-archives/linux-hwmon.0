Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54432
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751602AbdBXNOw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:52 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/19] hwmon: (lm85) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:03 -0300
Message-Id: <20170224131313.953-11-javier@osg.samsung.com>
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

 drivers/hwmon/lm85.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 691469ffa24e..0a325878e8f5 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -25,6 +25,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
@@ -1552,7 +1553,10 @@ static int lm85_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -ENOMEM;
 
 	data->client = client;
-	data->type = id->driver_data;
+	if (client->dev.of_node)
+		data->type = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		data->type = id->driver_data;
 	mutex_init(&data->update_lock);
 
 	/* Fill in the chip specific driver values */
@@ -1623,10 +1627,60 @@ static const struct i2c_device_id lm85_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm85_id);
 
+static const struct of_device_id lm85_of_match[] = {
+	{
+		.compatible = "adi,adm1027",
+		.data = (void *)adm1027
+	},
+	{
+		.compatible = "adi,adt7463",
+		.data = (void *)adt7463
+	},
+	{
+		.compatible = "adi,adt7468",
+		.data = (void *)adt7468
+	},
+	{
+		.compatible = "national,lm85",
+		.data = (void *)lm85
+	},
+	{
+		.compatible = "national,lm85b",
+		.data = (void *)lm85
+	},
+	{
+		.compatible = "national,lm85c",
+		.data = (void *)lm85
+	},
+	{
+		.compatible = "smsc,emc6d100",
+		.data = (void *)emc6d100
+	},
+	{
+		.compatible = "smsc,emc6d101",
+		.data = (void *)emc6d100
+	},
+	{
+		.compatible = "smsc,emc6d102",
+		.data = (void *)emc6d102
+	},
+	{
+		.compatible = "smsc,emc6d103",
+		.data = (void *)emc6d103
+	},
+	{
+		.compatible = "smsc,emc6d103s",
+		.data = (void *)emc6d103s
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm85_of_match);
+
 static struct i2c_driver lm85_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name   = "lm85",
+		.of_match_table = of_match_ptr(lm85_of_match),
 	},
 	.probe		= lm85_probe,
 	.id_table	= lm85_id,
-- 
2.9.3

