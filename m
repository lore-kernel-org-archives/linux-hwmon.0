Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36918 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbeLEVOd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Dec 2018 16:14:33 -0500
Received: by mail-wm1-f67.google.com with SMTP id g67so14318150wmd.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Dec 2018 13:14:31 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amarula@amarulasolutions.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] hwmon: (lm75) Add STLM75 support
Date: Thu,  6 Dec 2018 02:44:22 +0530
Message-Id: <20181205211422.22266-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The STLM75 is a high-precision digital CMOS temperature sensor
IC with a sigma-delta temperature-to-digital converter.

The configuration register mapping is similar to existing lm75
but the sample rate is 150ms(max).

Tested on real hardware and verified temperature readings are correct.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/hwmon/lm75 |  5 +++++
 drivers/hwmon/Kconfig    |  1 +
 drivers/hwmon/lm75.c     | 10 ++++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
index 2f1120f88c16..010583608f12 100644
--- a/Documentation/hwmon/lm75
+++ b/Documentation/hwmon/lm75
@@ -42,6 +42,11 @@ Supported chips:
     Addresses scanned: none
     Datasheet: Publicly available at the ST website
                http://www.st.com/internet/analog/product/121769.jsp
+  * ST Microelectronics STLM75
+    Prefix: 'stlm75'
+    Addresses scanned: none
+    Datasheet: Publicly available at the ST website
+	       https://www.st.com/resource/en/datasheet/stlm75.pdf
   * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75C, TMP175, TMP275
     Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75', 'tmp75c', 'tmp275'
     Addresses scanned: none
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 532a0532d01b..515b2ad872c8 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1035,6 +1035,7 @@ config SENSORS_LM75
 		- National Semiconductor LM75, LM75A
 		- NXP's LM75A
 		- ST Microelectronics STDS75
+		- ST Microelectronics STLM75
 		- TelCom (now Microchip) TCN75
 		- Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75,
 		  TMP175, TMP275
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index c7f20543b2bf..62acb9f16ec5 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -50,6 +50,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max31725,
 	mcp980x,
 	stds75,
+	stlm75,
 	tcn75,
 	tmp100,
 	tmp101,
@@ -316,6 +317,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->resolution = 11;
 		data->sample_time = MSEC_PER_SEC;
 		break;
+	case stlm75:
+		data->resolution = 9;
+		data->sample_time = MSEC_PER_SEC / 5;
+		break;
 	case ds7505:
 		set_mask |= 3 << 5;		/* 12-bit mode */
 		data->resolution = 12;
@@ -424,6 +429,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "max31726", max31725, },
 	{ "mcp980x", mcp980x, },
 	{ "stds75", stds75, },
+	{ "stlm75", stlm75, },
 	{ "tcn75", tcn75, },
 	{ "tmp100", tmp100, },
 	{ "tmp101", tmp101, },
@@ -494,6 +500,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "st,stds75",
 		.data = (void *)stds75
 	},
+	{
+		.compatible = "st,stlm75",
+		.data = (void *)stlm75
+	},
 	{
 		.compatible = "microchip,tcn75",
 		.data = (void *)tcn75
-- 
2.18.0.321.gffc6fa0e3
