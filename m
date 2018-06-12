Return-Path: <jiazhouyang09@gmail.com>
Return-path: <jiazhouyang09@gmail.com>
From: Zhouyang Jia <jiazhouyang09@gmail.com>
To: 
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>,
	Rudolf Marek <r.marek@assembler.cz>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83793) add error handling for i2c_new_dummy
Date: Tue, 12 Jun 2018 11:32:59 +0800
Message-Id: <1528774379-38587-1-git-send-email-jiazhouyang09@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

When i2c_new_dummy fails, the lack of error-handling code may
cause unexpected results.

This patch adds error-handling code after calling i2c_new_dummy.

Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
---
 drivers/hwmon/w83793.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index 0af0f62..4aa3a0e 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -1603,8 +1603,15 @@ w83793_detect_subclients(struct i2c_client *client)
 	}
 
 	tmp = w83793_read_value(client, W83793_REG_I2C_SUBADDR);
-	if (!(tmp & 0x08))
+	if (!(tmp & 0x08)) {
 		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (tmp & 0x7));
+		if (data->lm75[0] == NULL) {
+			dev_err(&client->dev,
+				"Failed to allocate I2C device\n");
+			err = -ENODEV;
+			goto ERROR_SC_1;
+		}
+	}
 	if (!(tmp & 0x80)) {
 		if ((data->lm75[0] != NULL)
 		    && ((tmp & 0x7) == ((tmp >> 4) & 0x7))) {
@@ -1616,6 +1623,12 @@ w83793_detect_subclients(struct i2c_client *client)
 		}
 		data->lm75[1] = i2c_new_dummy(adapter,
 					      0x48 + ((tmp >> 4) & 0x7));
+		if (data->lm75[1] == NULL) {
+			dev_err(&client->dev,
+				"Failed to allocate I2C device\n");
+			err = -ENODEV;
+			goto ERROR_SC_1;
+		}
 	}
 
 	return 0;
-- 
2.7.4
