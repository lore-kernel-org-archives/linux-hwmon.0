Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54362
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751285AbdBXNOg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:36 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dirk Eibach <eibach@gdsys.de>
Subject: [PATCH 03/19] hwmon: (ads1015) Add OF device ID table
Date: Fri, 24 Feb 2017 10:12:56 -0300
Message-Id: <20170224131313.953-4-javier@osg.samsung.com>
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

 drivers/hwmon/ads1015.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
index 2b3105c8aed3..5140c27d16dd 100644
--- a/drivers/hwmon/ads1015.c
+++ b/drivers/hwmon/ads1015.c
@@ -31,6 +31,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/of.h>
 
 #include <linux/i2c/ads1015.h>
@@ -268,7 +269,12 @@ static int ads1015_probe(struct i2c_client *client,
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-	data->id = id->driver_data;
+
+	if (client->dev.of_node)
+		data->id = (enum ads1015_chips)
+			of_device_get_match_data(&client->dev);
+	else
+		data->id = id->driver_data;
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
 
@@ -303,9 +309,23 @@ static const struct i2c_device_id ads1015_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ads1015_id);
 
+static const struct of_device_id ads1015_of_match[] = {
+	{
+		.compatible = "ti,ads1015",
+		.data = (void *)ads1015
+	},
+	{
+		.compatible = "ti,ads1115",
+		.data = (void *)ads1115
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ads1015_of_match);
+
 static struct i2c_driver ads1015_driver = {
 	.driver = {
 		.name = "ads1015",
+		.of_match_table = of_match_ptr(ads1015_of_match),
 	},
 	.probe = ads1015_probe,
 	.remove = ads1015_remove,
-- 
2.9.3

