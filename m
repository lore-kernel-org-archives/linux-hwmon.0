Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54428
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751574AbdBXNOu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:50 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/19] hwmon: (ina209) Add OF device ID table
Date: Fri, 24 Feb 2017 10:12:59 -0300
Message-Id: <20170224131313.953-7-javier@osg.samsung.com>
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

 drivers/hwmon/ina209.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index 5378fdefc1f7..c5f20f03e0be 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -608,11 +608,18 @@ static const struct i2c_device_id ina209_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ina209_id);
 
+static const struct of_device_id ina209_of_match[] = {
+	{ .compatible = "ti,ina209" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ina209_of_match);
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ina209_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "ina209",
+		.of_match_table = of_match_ptr(ina209_of_match),
 	},
 	.probe		= ina209_probe,
 	.remove		= ina209_remove,
-- 
2.9.3

