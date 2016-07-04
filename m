Return-path: <amsfield22@gmail.com>
Date: Mon, 4 Jul 2016 12:19:28 -0700
From: Alison Schofield <amsfield22@gmail.com>
To: linux@roeck-us.net
Cc: Jean Delvare <jdelvare@suse.com>,
	"open list:JC42.4 TEMPERATURE SENSOR DRIVER" <linux-hwmon@vger.kernel.org>,
	linux-kernel@vger.kernel.org, daniel.baluta@gmail.com
Subject: [RFC PATCH] hwmon: (jc42) Add I2C_CLASS_HWMON to detection class
Message-ID: <20160704191908.GA9056@d830.WORKGROUP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

In 2011, commit 774466add7c810fd7e4c8bcf41995b6799608880 changed
the detection class of these chips to I2C_CLASS_SPD based on this
premise: "makes more sense because these chips always live on
memory modules"

Today these chips have applications beyond memory modules. 

Add I2C_CLASS_HWMON as an additional detection class to allow
detection by hwmon class i2c adapters.

Alternative is to replace the SPD w HWMON class, but that carries
risk for existing usage.

Signed-off-by: Alison Schofield <amsfield22@gmail.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>
---
 drivers/hwmon/jc42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 9887d32..1537ba0 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -538,7 +538,7 @@ static const struct i2c_device_id jc42_id[] = {
 MODULE_DEVICE_TABLE(i2c, jc42_id);
 
 static struct i2c_driver jc42_driver = {
-	.class		= I2C_CLASS_SPD,
+	.class		= I2C_CLASS_SPD | I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "jc42",
 		.pm = JC42_DEV_PM_OPS,
-- 
2.1.4
