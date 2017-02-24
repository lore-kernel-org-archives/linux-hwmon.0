Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54430
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751678AbdBXNPA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:00 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/19] hwmon: (lm63) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:01 -0300
Message-Id: <20170224131313.953-9-javier@osg.samsung.com>
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

 drivers/hwmon/lm63.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 2e1948699114..4c1770920d29 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -46,6 +46,7 @@
 #include <linux/hwmon.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -1115,6 +1116,10 @@ static int lm63_probe(struct i2c_client *client,
 	mutex_init(&data->update_lock);
 
 	/* Set the device type */
+	if (client->dev.of_node)
+		data->kind = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		data->kind = id->driver_data;
 	data->kind = id->driver_data;
 	if (data->kind == lm64)
 		data->temp2_offset = 16000;
@@ -1149,10 +1154,28 @@ static const struct i2c_device_id lm63_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm63_id);
 
+static const struct of_device_id lm63_of_match[] = {
+	{
+		.compatible = "national,lm63",
+		.data = (void *)lm63
+	},
+	{
+		.compatible = "national,lm64",
+		.data = (void *)lm64
+	},
+	{
+		.compatible = "national,lm96163",
+		.data = (void *)lm96163
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm63_of_match);
+
 static struct i2c_driver lm63_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm63",
+		.of_match_table = of_match_ptr(lm63_of_match),
 	},
 	.probe		= lm63_probe,
 	.id_table	= lm63_id,
-- 
2.9.3

