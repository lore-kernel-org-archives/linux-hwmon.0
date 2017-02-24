Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54435
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751660AbdBXNOz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:55 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/19] hwmon: (max6697) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:06 -0300
Message-Id: <20170224131313.953-14-javier@osg.samsung.com>
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

 drivers/hwmon/max6697.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index f03a71722849..221fd1492057 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -24,6 +24,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/of.h>
 
 #include <linux/platform_data/max6697.h>
@@ -632,7 +633,10 @@ static int max6697_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
-	data->type = id->driver_data;
+	if (client->dev.of_node)
+		data->type = (enum chips)of_device_get_match_data(&client->dev);
+	else
+		data->type = id->driver_data;
 	data->chip = &max6697_chip_data[data->type];
 	data->client = client;
 	mutex_init(&data->update_lock);
@@ -662,10 +666,56 @@ static const struct i2c_device_id max6697_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max6697_id);
 
+static const struct of_device_id max6697_of_match[] = {
+	{
+		.compatible = "maxim,max6581",
+		.data = (void *)max6581
+	},
+	{
+		.compatible = "maxim,max6602",
+		.data = (void *)max6602
+	},
+	{
+		.compatible = "maxim,max6622",
+		.data = (void *)max6622
+	},
+	{
+		.compatible = "maxim,max6636",
+		.data = (void *)max6636
+	},
+	{
+		.compatible = "maxim,max6689",
+		.data = (void *)max6689
+	},
+	{
+		.compatible = "maxim,max6693",
+		.data = (void *)max6693
+	},
+	{
+		.compatible = "maxim,max6694",
+		.data = (void *)max6694
+	},
+	{
+		.compatible = "maxim,max6697",
+		.data = (void *)max6697
+	},
+	{
+		.compatible = "maxim,max6698",
+		.data = (void *)max6698
+	},
+	{
+		.compatible = "maxim,max6699",
+		.data = (void *)max6699
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, max6697_of_match);
+
 static struct i2c_driver max6697_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "max6697",
+		.of_match_table = of_match_ptr(max6697_of_match),
 	},
 	.probe = max6697_probe,
 	.id_table = max6697_id,
-- 
2.9.3

