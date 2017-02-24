Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54428
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751419AbdBXNPJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:09 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/19] hwmon: (stts751) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:09 -0300
Message-Id: <20170224131313.953-17-javier@osg.samsung.com>
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

 drivers/hwmon/stts751.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 55450680fb58..d56251d6eec2 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -85,6 +85,12 @@ static const struct i2c_device_id stts751_id[] = {
 	{ }
 };
 
+static const struct of_device_id stts751_of_match[] = {
+	{ .compatible = "stts751" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stts751_of_match);
+
 struct stts751_priv {
 	struct device *dev;
 	struct i2c_client *client;
@@ -819,6 +825,7 @@ static struct i2c_driver stts751_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= DEVNAME,
+		.of_match_table = of_match_ptr(stts751_of_match),
 	},
 	.probe		= stts751_probe,
 	.id_table	= stts751_id,
-- 
2.9.3

