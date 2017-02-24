Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54431
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751714AbdBXNPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:15:05 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 18/19] hwmon: (tmp103) Add OF device ID table
Date: Fri, 24 Feb 2017 10:13:11 -0300
Message-Id: <20170224131313.953-19-javier@osg.samsung.com>
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

 drivers/hwmon/tmp103.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index ad571ec795a3..d0bb28b0d4c3 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -183,9 +183,16 @@ static const struct i2c_device_id tmp103_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp103_id);
 
+static const struct of_device_id tmp103_of_match[] = {
+	{ .compatible = "ti,tmp103" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tmp103_of_match);
+
 static struct i2c_driver tmp103_driver = {
 	.driver = {
 		.name	= "tmp103",
+		.of_match_table = of_match_ptr(tmp103_of_match),
 		.pm	= TMP103_DEV_PM_OPS,
 	},
 	.probe		= tmp103_probe,
-- 
2.9.3

