Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54371
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751294AbdBXNOg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:36 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/19] hwmon: (ads7828) Add OF device ID table
Date: Fri, 24 Feb 2017 10:12:57 -0300
Message-Id: <20170224131313.953-5-javier@osg.samsung.com>
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

 drivers/hwmon/ads7828.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index ee396ff167d9..b0ef66687816 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -31,6 +31,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_data/ads7828.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -121,6 +122,7 @@ static int ads7828_probe(struct i2c_client *client,
 	bool diff_input = false;
 	bool ext_vref = false;
 	unsigned int regval;
+	enum ads7828_chips chip;
 
 	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
 	if (!data)
@@ -133,12 +135,18 @@ static int ads7828_probe(struct i2c_client *client,
 			vref_mv = pdata->vref_mv;
 	}
 
+	if (client->dev.of_node)
+		chip = (enum ads7828_chips)
+			of_device_get_match_data(&client->dev);
+	else
+		chip = id->driver_data;
+
 	/* Bound Vref with min/max values */
 	vref_mv = clamp_val(vref_mv, ADS7828_EXT_VREF_MV_MIN,
 			    ADS7828_EXT_VREF_MV_MAX);
 
 	/* ADS7828 uses 12-bit samples, while ADS7830 is 8-bit */
-	if (id->driver_data == ads7828) {
+	if (chip == ads7828) {
 		data->lsb_resol = DIV_ROUND_CLOSEST(vref_mv * 1000, 4096);
 		data->regmap = devm_regmap_init_i2c(client,
 						    &ads2828_regmap_config);
@@ -177,9 +185,23 @@ static const struct i2c_device_id ads7828_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ads7828_device_ids);
 
+static const struct of_device_id ads7828_of_match[] = {
+	{
+		.compatible = "ti,ads7828",
+		.data = (void *)ads7828
+	},
+	{
+		.compatible = "ti,ads7830",
+		.data = (void *)ads7830
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ads7828_of_match);
+
 static struct i2c_driver ads7828_driver = {
 	.driver = {
 		.name = "ads7828",
+		.of_match_table = of_match_ptr(ads7828_of_match),
 	},
 
 	.id_table = ads7828_device_ids,
-- 
2.9.3

