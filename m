Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54439
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751722AbdBXNPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:05 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/19] hwmon: (tmp102) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:10 -0300
Message-Id: <20170224131313.953-18-javier@osg.samsung.com>
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

 drivers/hwmon/tmp102.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 36bba2a816a4..5eafbaada795 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -323,8 +323,15 @@ static const struct i2c_device_id tmp102_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
 
+static const struct of_device_id tmp102_of_match[] = {
+	{ .compatible = "ti,tmp102" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tmp102_of_match);
+
 static struct i2c_driver tmp102_driver = {
 	.driver.name	= DRIVER_NAME,
+	.driver.of_match_table = of_match_ptr(tmp102_of_match),
 	.driver.pm	= &tmp102_dev_pm_ops,
 	.probe		= tmp102_probe,
 	.id_table	= tmp102_id,
-- 
2.9.3

