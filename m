Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:49915 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751323AbdJXULH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2017 16:11:07 -0400
To: linux-hwmon@vger.kernel.org,
        =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] hwmon/amc6821: Use common error handling code in
 amc6821_init_client()
Message-ID: <8cc80503-aa2b-bb5e-ab40-fa31b401b6a2@users.sourceforge.net>
Date: Tue, 24 Oct 2017 22:10:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 22:04:20 +0200

* Add two jump targets so that a bit of exception handling can be better
  reused at the end of this function.

  This issue was detected by using the Coccinelle software.

* Delete the local variable "err" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwmon/amc6821.c | 77 ++++++++++++++++++-------------------------------
 1 file changed, 28 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 46b4e35fd555..5c067de3fdcf 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -885,70 +885,42 @@ static int amc6821_detect(
 static int amc6821_init_client(struct i2c_client *client)
 {
 	int config;
-	int err = -EIO;
 
 	if (init) {
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF4);
-
-		if (config < 0) {
-				dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-				return err;
-		}
+		if (config < 0)
+			goto report_read_failure;
 
 		config |= AMC6821_CONF4_MODE;
-
 		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF4,
-				config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			return err;
-		}
+					      config))
+			goto report_write_failure;
 
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF3);
-
-		if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-			return err;
-		}
+		if (config < 0)
+			goto report_read_failure;
 
 		dev_info(&client->dev, "Revision %d\n", config & 0x0f);
 
 		config &= ~AMC6821_CONF3_THERM_FAN_EN;
-
 		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF3,
-				config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			return err;
-		}
+					      config))
+			goto report_write_failure;
 
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF2);
-
-		if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-			return err;
-		}
+		if (config < 0)
+			goto report_read_failure;
 
 		config &= ~AMC6821_CONF2_RTFIE;
 		config &= ~AMC6821_CONF2_LTOIE;
 		config &= ~AMC6821_CONF2_RTOIE;
-		if (i2c_smbus_write_byte_data(client,
-				AMC6821_REG_CONF2, config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			return err;
-		}
+		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF2,
+					      config))
+			goto report_write_failure;
 
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF1);
-
-		if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-			return err;
-		}
+		if (config < 0)
+			goto report_read_failure;
 
 		config &= ~AMC6821_CONF1_THERMOVIE;
 		config &= ~AMC6821_CONF1_FANIE;
@@ -958,14 +930,21 @@ static int amc6821_init_client(struct i2c_client *client)
 		else
 			config &= ~AMC6821_CONF1_PWMINV;
 
-		if (i2c_smbus_write_byte_data(
-				client, AMC6821_REG_CONF1, config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			return err;
-		}
+		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF1,
+					      config))
+			goto report_write_failure;
 	}
 	return 0;
+
+report_read_failure:
+	dev_err(&client->dev,
+		"Error reading configuration register, aborting.\n");
+	return -EIO;
+
+report_write_failure:
+	dev_err(&client->dev,
+		"Configuration register write error, aborting.\n");
+	return -EIO;
 }
 
 static int amc6821_probe(struct i2c_client *client,
-- 
2.14.3

