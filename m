Return-path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
	linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/2] hwmon: (lm87) Remove unused I2C devices driver_data
Date: Wed, 12 Apr 2017 21:21:38 -0300
Message-Id: <20170413002139.5983-1-javier@osg.samsung.com>
List-ID: <linux-hwmon@vger.kernel.org>

The I2C device ID entries set a .driver_data but this data is never
looked up by the driver. So don't set it and also remove the enum.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v2:
- Use the correct driver in subject line.

 drivers/hwmon/lm87.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 04a7a1ddb030..c0766e7392d3 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -75,8 +75,6 @@
 
 static const unsigned short normal_i2c[] = { 0x2c, 0x2d, 0x2e, I2C_CLIENT_END };
 
-enum chips { lm87, adm1024 };
-
 /*
  * The LM87 registers
  */
@@ -981,8 +979,8 @@ static int lm87_probe(struct i2c_client *client, const struct i2c_device_id *id)
  */
 
 static const struct i2c_device_id lm87_id[] = {
-	{ "lm87", lm87 },
-	{ "adm1024", adm1024 },
+	{ "lm87", 0 },
+	{ "adm1024", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm87_id);
-- 
2.9.3
