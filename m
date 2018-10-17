Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it1-f201.google.com ([209.85.166.201]:58309 "EHLO
        mail-it1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbeJRGYg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Oct 2018 02:24:36 -0400
Received: by mail-it1-f201.google.com with SMTP id d7-v6so3673441itf.7
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Oct 2018 15:26:50 -0700 (PDT)
Date: Wed, 17 Oct 2018 15:26:39 -0700
Message-Id: <20181017222639.254434-1-kunyi@google.com>
Mime-Version: 1.0
Subject: [PATCH v3 1/2] hwmon: (adm1275): Allow setting shunt reg value
From: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, kunyi@google.com,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To: unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The ADM series of hotswap controllers support extending
the current measurement range by using a sensing resistor
value other than the typical 1 mOhm. For example, using a 0.5 mOhm
sensing resistor doubles the maximal current can be measured.

Current driver assumes a shunt resistor value of 1 mOhm in calculation,
meaning for other resistor values, hwmon will report scaled
current/power measurements. This patch parses device tree parameter
"shunt-resistor-micro-ohms", if there is one.

Signed-off-by: Kun Yi <kunyi@google.com>
---
Changes in v3:
- splitted hwmon and device tree binding patches

 Documentation/hwmon/adm1275   |  3 +++
 drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
index 39033538eb03..5e277b0d91ce 100644
--- a/Documentation/hwmon/adm1275
+++ b/Documentation/hwmon/adm1275
@@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not support internal voltage
 or current scaling. Reported voltages, currents, and power are raw measurements,
 and will typically have to be scaled.
 
+The shunt value in micro-ohms can be set via device tree at compile-time. Please
+refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for bindings
+if the device tree is used.
 
 Platform data support
 ---------------------
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 13600fa79e7f..f569372c9204 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
 	const struct coefficients *coefficients;
 	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
 	int tindex = -1;
+	u32 shunt;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_BYTE_DATA
@@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
+	if (of_property_read_u32(client->dev.of_node,
+				 "shunt-resistor-micro-ohms", &shunt))
+		shunt = 1000; /* 1 mOhm if not set via DT */
+
+	if (shunt == 0)
+		return -EINVAL;
+
 	data->id = mid->driver_data;
 
 	info = &data->info;
@@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
 		info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
 	}
 	if (cindex >= 0) {
-		info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
+		/* Scale current with sense resistor value */
+		info->m[PSC_CURRENT_OUT] =
+			coefficients[cindex].m * shunt / 1000;
 		info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
 		info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
 	}
 	if (pindex >= 0) {
-		info->m[PSC_POWER] = coefficients[pindex].m;
+		info->m[PSC_POWER] =
+			coefficients[pindex].m * shunt / 1000;
 		info->b[PSC_POWER] = coefficients[pindex].b;
 		info->R[PSC_POWER] = coefficients[pindex].R;
 	}
-- 
2.19.1.331.ge82ca0e54c-goog
