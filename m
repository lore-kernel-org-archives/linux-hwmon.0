Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:44262 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932650AbeFLDfJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Jun 2018 23:35:09 -0400
From: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>,
        Marc Hulsman <m.hulsman@tudelft.nl>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83791d) add error handling for i2c_new_dummy
Date: Tue, 12 Jun 2018 11:35:03 +0800
Message-Id: <1528774504-38755-1-git-send-email-jiazhouyang09@gmail.com>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

When i2c_new_dummy fails, the lack of error-handling code may
cause unexpected results.

This patch adds error-handling code after calling i2c_new_dummy.

Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
---
 drivers/hwmon/w83791d.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 28fa3bd..a183432 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -1295,8 +1295,15 @@ static int w83791d_detect_subclients(struct i2c_client *client)
 	}
 
 	val = w83791d_read(client, W83791D_REG_I2C_SUBADDR);
-	if (!(val & 0x08))
+	if (!(val & 0x08)) {
 		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
+		if (data->lm75[0] == NULL) {
+			dev_err(&client->dev,
+				"Failed to allocate I2C device\n");
+			err = -ENODEV;
+			goto error_sc_1;
+		}
+	}
 	if (!(val & 0x80)) {
 		if ((data->lm75[0] != NULL) &&
 				((val & 0x7) == ((val >> 4) & 0x7))) {
@@ -1309,6 +1316,12 @@ static int w83791d_detect_subclients(struct i2c_client *client)
 		}
 		data->lm75[1] = i2c_new_dummy(adapter,
 					      0x48 + ((val >> 4) & 0x7));
+		if (data->lm75[1] == NULL) {
+			dev_err(&client->dev,
+				"Failed to allocate I2C device\n");
+			err = -ENODEV;
+			goto error_sc_1;
+		}
 	}
 
 	return 0;
-- 
2.7.4

