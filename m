Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54433
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751735AbdBXNPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:05 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/19] hwmon: (lm95245) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:05 -0300
Message-Id: <20170224131313.953-13-javier@osg.samsung.com>
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

 drivers/hwmon/lm95245.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index a3bfd88752ca..27cb06d65594 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -622,10 +622,18 @@ static const struct i2c_device_id lm95245_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm95245_id);
 
+static const struct of_device_id lm95245_of_match[] = {
+	{ .compatible = "national,lm95235" },
+	{ .compatible = "national,lm95245" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm95245_of_match);
+
 static struct i2c_driver lm95245_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm95245",
+		.of_match_table = of_match_ptr(lm95245_of_match),
 	},
 	.probe		= lm95245_probe,
 	.id_table	= lm95245_id,
-- 
2.9.3

