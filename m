Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:42049 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932650AbeFLDbg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Jun 2018 23:31:36 -0400
From: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83792d) add error handling for i2c_new_dummy
Date: Tue, 12 Jun 2018 11:31:28 +0800
Message-Id: <1528774289-38443-1-git-send-email-jiazhouyang09@gmail.com>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

When i2c_new_dummy fails, the lack of error-handling code may
cause unexpected results.

This patch adds error-handling code after calling i2c_new_dummy.

Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
---
 drivers/hwmon/w83792d.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
index 76aa39e..2c168c5 100644
--- a/drivers/hwmon/w83792d.c
+++ b/drivers/hwmon/w83792d.c
@@ -961,8 +961,15 @@ w83792d_detect_subclients(struct i2c_client *new_client)
 	}
 
 	val = w83792d_read_value(new_client, W83792D_REG_I2C_SUBADDR);
-	if (!(val & 0x08))
+	if (!(val & 0x08)) {
 		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
+		if (data->lm75[0] == NULL) {
+			dev_err(&new_client->dev,
+				"Failed to allocate I2C device\n");
+			err = -ENODEV;
+			goto ERROR_SC_1;
+		}
+	}
 	if (!(val & 0x80)) {
 		if ((data->lm75[0] != NULL) &&
 			((val & 0x7) == ((val >> 4) & 0x7))) {
@@ -974,6 +981,12 @@ w83792d_detect_subclients(struct i2c_client *new_client)
 		}
 		data->lm75[1] = i2c_new_dummy(adapter,
 					      0x48 + ((val >> 4) & 0x7));
+		if (data->lm75[1] == NULL) {
+			dev_err(&new_client->dev,
+				"Failed to allocate I2C device\n");
+			err = -ENODEV;
+			goto ERROR_SC_1;
+		}
 	}
 
 	return 0;
-- 
2.7.4

