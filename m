Return-Path: <javierm@redhat.com>
Return-path: <javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (max31785) Add OF device ID table
Date: Thu, 30 Nov 2017 19:12:57 +0100
Message-Id: <20171130181257.3352-1-javierm@redhat.com>
List-ID: <linux-hwmon@vger.kernel.org>

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have an
OF device ID table if the devices are registered via OF.

Before this patch:

$ modinfo drivers/hwmon/pmbus/max31785.ko | grep alias
alias:          i2c:max31785a
alias:          i2c:max31785

After this patch:

$ modinfo drivers/hwmon/pmbus/max31785.ko | grep alias
alias:          i2c:max31785a
alias:          i2c:max31785
alias:          of:N*T*Cmaxim,max31785aC*
alias:          of:N*T*Cmaxim,max31785a
alias:          of:N*T*Cmaxim,max31785C*
alias:          of:N*T*Cmaxim,max31785

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/hwmon/pmbus/max31785.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 9313849d5160..4666b5e95159 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -100,9 +100,18 @@ static const struct i2c_device_id max31785_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, max31785_id);
 
+static const struct of_device_id max31785_of_match[] = {
+	{ .compatible = "maxim,max31785" },
+	{ .compatible = "maxim,max31785a" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, max31785_of_match);
+
 static struct i2c_driver max31785_driver = {
 	.driver = {
 		.name = "max31785",
+		.of_match_table = max31785_of_match,
 	},
 	.probe = max31785_probe,
 	.remove = pmbus_do_remove,
-- 
2.14.3
