Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54432
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751718AbdBXNPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:05 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/19] hwmon: (tmp421) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:12 -0300
Message-Id: <20170224131313.953-20-javier@osg.samsung.com>
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

 drivers/hwmon/tmp421.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index bfb98b96c781..e36399213324 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -29,6 +29,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/sysfs.h>
 
 /* Addresses to scan */
@@ -69,6 +70,31 @@ static const struct i2c_device_id tmp421_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp421_id);
 
+static const struct of_device_id tmp421_of_match[] = {
+	{
+		.compatible = "ti,tmp421",
+		.data = (void *)2
+	},
+	{
+		.compatible = "ti,tmp422",
+		.data = (void *)3
+	},
+	{
+		.compatible = "ti,tmp423",
+		.data = (void *)4
+	},
+	{
+		.compatible = "ti,tmp441",
+		.data = (void *)2
+	},
+	{
+		.compatible = "ti,tmp422",
+		.data = (void *)3
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tmp421_of_match);
+
 struct tmp421_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
@@ -78,7 +104,7 @@ struct tmp421_data {
 	struct hwmon_chip_info chip;
 	char valid;
 	unsigned long last_updated;
-	int channels;
+	unsigned long channels;
 	u8 config;
 	s16 temp[4];
 };
@@ -272,7 +298,11 @@ static int tmp421_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	mutex_init(&data->update_lock);
-	data->channels = id->driver_data;
+	if (client->dev.of_node)
+		data->channels = (unsigned long)
+			of_device_get_match_data(&client->dev);
+	else
+		data->channels = id->driver_data;
 	data->client = client;
 
 	err = tmp421_init_client(client);
@@ -301,6 +331,7 @@ static struct i2c_driver tmp421_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "tmp421",
+		.of_match_table = of_match_ptr(tmp421_of_match),
 	},
 	.probe = tmp421_probe,
 	.id_table = tmp421_id,
-- 
2.9.3

