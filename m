Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A7C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Oct 2021 14:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04487610A1
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Oct 2021 14:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhJSOOz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Oct 2021 10:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhJSOOy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Oct 2021 10:14:54 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09751C06161C
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Oct 2021 07:12:42 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so1806412otk.3
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Oct 2021 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+/nOzNwetN9MJrJh1LUdncidcsgMzfJaIP689yjahY=;
        b=fuWYzHLUKHpLZCerLvSM8Q//quq6KWu1dyUtKddEiQoWTgvDzGnCcTDttlgSA5BXZ4
         511FcP8erBifpN0pAshhEhtSp4tUmNk8bKsOoA2KE4fWdus2oC61gRFcqHVmwKsTUeA1
         YlMJ4E9ihBjsK8C4GC4ltT8ijn7eJO868EuFcNFnHBvBLghT62Uif6+GqzGZYafLFkFk
         szQEmZ41DCgNQwkB1GvyX2Xxo95+Sv18JKQ3oT8kIE/o7IgiH+hM7M/1or5AyTIrzEhl
         s7vlfWSvlNxVdAfQH3vLaVj1SpGFazXdTD13LGSyxGUxDGyNZERetAxsAmE9pDz2uXRK
         +Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=a+/nOzNwetN9MJrJh1LUdncidcsgMzfJaIP689yjahY=;
        b=xCvrSU30bLtvm0d/B/DcPOJ7rMlZv6rj69TuFKQiCa+rBk1YAj4mX/XQ6vwITxIIsK
         5wEdfMjmTDQT/vXx4uuZzYdm7s/kDdvL7FHDsfN+Lt2R4leFwZk0kedDNftYcT8LB0v3
         ynF8HJnfa4rhG2/8IVxg+7P7LjRdC6dfAgo5fFBgVzkSOwZvF6KdEYzh4GSCS+kqTwub
         rC1gc6nXgI53z57FTNNmhk4kV0j+YqJNP7RAjvAQH/wHmw3sPZaVqZRn+RSBfIZzVJ0b
         djzkNdD4EpJ578HW9i/mMwvZWQtly9chx8Q7KCX9BImJcbL/BIWTqMCHl6ntBiUbG4Cu
         W3yw==
X-Gm-Message-State: AOAM532i33cW634cwhle1FL0ZIg8XGOeBNEmsYFAl+vqrDWMjj52G3kv
        +fHSoP+QPIWA7lhjrt3T9RLkEiRkbvU=
X-Google-Smtp-Source: ABdhPJz4SJBgKmCpWJM5AvoKA1TE66p40Ax1ifG76qLv/0vU1YVC01WJNuOqwudivb4SxtlLYkv93g==
X-Received: by 2002:a9d:396:: with SMTP id f22mr5473700otf.327.1634652761057;
        Tue, 19 Oct 2021 07:12:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w16sm3331647oti.3.2021.10.19.07.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:12:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "David T . Wilson" <david.wilson@nasa.gov>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH 1/2] hwmon: (lm90) Add support for TI TMP461
Date:   Tue, 19 Oct 2021 07:12:36 -0700
Message-Id: <20211019141237.1144281-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TMP461 is almost identical to TMP451 and was actually detected as TMP451
with the existing lm90 driver if its I2C address is 0x4c. Add support
for it to the lm90 driver. At the same time, improve the chip detection
function to at least try to distinguish between TMP451 and TMP461.

As a side efect, this fixes commit 24333ac26d01 ("hwmon: (tmp401) use
smb word operations instead of 2 smb byte operations"). TMP461 does not
support word operations on temperature registers, which causes bad
temperature readings with the tmp401 driver. The lm90 driver does not
perform word operations on temperature registers and thus does not have
this problem.

Fixes: 24333ac26d01 ("hwmon: (tmp401) use smb word operations instead of 2 smb byte operations")
Reported-by: David T. Wilson <david.wilson@nasa.gov>
Cc: David T. Wilson <david.wilson@nasa.gov>
Cc: Andrew F. Davis <afd@ti.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/lm90.rst | 10 +++++
 drivers/hwmon/Kconfig        |  2 +-
 drivers/hwmon/lm90.c         | 75 ++++++++++++++++++++++++------------
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 3da8c6e06a36..05391fb4042d 100644
--- a/Documentation/hwmon/lm90.rst
+++ b/Documentation/hwmon/lm90.rst
@@ -265,6 +265,16 @@ Supported chips:
 
 	       https://www.ti.com/litv/pdf/sbos686
 
+  * Texas Instruments TMP461
+
+    Prefix: 'tmp461'
+
+    Addresses scanned: I2C 0x48 through 0x4F
+
+    Datasheet: Publicly available at TI website
+
+	       https://www.ti.com/lit/gpn/tmp461
+
 Author: Jean Delvare <jdelvare@suse.de>
 
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c4578e8f34bb..ccdaeafed0bb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1317,7 +1317,7 @@ config SENSORS_LM90
 	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6654, MAX6657, MAX6658,
 	  MAX6659, MAX6680, MAX6681, MAX6692, MAX6695, MAX6696,
 	  ON Semiconductor NCT1008, Winbond/Nuvoton W83L771W/G/AWG/ASG,
-	  Philips SA56004, GMT G781, and Texas Instruments TMP451
+	  Philips SA56004, GMT G781, Texas Instruments TMP451 and TMP461
 	  sensor chips.
 
 	  This driver can also be built as a module. If so, the module
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 567b7c521f38..e5b546a14b09 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -69,10 +69,10 @@
  * This driver also supports the G781 from GMT. This device is compatible
  * with the ADM1032.
  *
- * This driver also supports TMP451 from Texas Instruments. This device is
- * supported in both compatibility and extended mode. It's mostly compatible
- * with ADT7461 except for local temperature low byte register and max
- * conversion rate.
+ * This driver also supports TMP451 and TMP461 from Texas Instruments.
+ * Those devices are supported in both compatibility and extended mode.
+ * They are mostly compatible with ADT7461 except for local temperature
+ * low byte register and max conversion rate.
  *
  * Since the LM90 was the first chipset supported by this driver, most
  * comments will refer to this chipset, but are actually general and
@@ -112,7 +112,7 @@ static const unsigned short normal_i2c[] = {
 	0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
 
 enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
-	max6646, w83l771, max6696, sa56004, g781, tmp451, max6654 };
+	max6646, w83l771, max6696, sa56004, g781, tmp451, tmp461, max6654 };
 
 /*
  * The LM90 registers
@@ -168,8 +168,12 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 
 #define LM90_MAX_CONVRATE_MS	16000	/* Maximum conversion rate in ms */
 
-/* TMP451 registers */
+/* TMP451/TMP461 registers */
 #define TMP451_REG_R_LOCAL_TEMPL	0x15
+#define TMP451_REG_CONALERT		0x22
+
+#define TMP461_REG_CHEN			0x16
+#define TMP461_REG_DFC			0x23
 
 /*
  * Device flags
@@ -182,7 +186,8 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_HAVE_EMERGENCY_ALARM (1 << 5)/* emergency alarm		*/
 #define LM90_HAVE_TEMP3		(1 << 6) /* 3rd temperature sensor	*/
 #define LM90_HAVE_BROKEN_ALERT	(1 << 7) /* Broken alert		*/
-#define LM90_PAUSE_FOR_CONFIG	(1 << 8) /* Pause conversion for config	*/
+#define LM90_HAVE_EXTENDED_TEMP	(1 << 8) /* extended temperature support*/
+#define LM90_PAUSE_FOR_CONFIG	(1 << 9) /* Pause conversion for config	*/
 
 /* LM90 status */
 #define LM90_STATUS_LTHRM	(1 << 0) /* local THERM limit tripped */
@@ -229,6 +234,7 @@ static const struct i2c_device_id lm90_id[] = {
 	{ "w83l771", w83l771 },
 	{ "sa56004", sa56004 },
 	{ "tmp451", tmp451 },
+	{ "tmp461", tmp461 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm90_id);
@@ -326,6 +332,10 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
 		.compatible = "ti,tmp451",
 		.data = (void *)tmp451
 	},
+	{
+		.compatible = "ti,tmp461",
+		.data = (void *)tmp461
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, lm90_of_match);
@@ -350,7 +360,7 @@ static const struct lm90_params lm90_params[] = {
 	},
 	[adt7461] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP,
 		.alert_alarms = 0x7c,
 		.max_convrate = 10,
 	},
@@ -422,7 +432,14 @@ static const struct lm90_params lm90_params[] = {
 	},
 	[tmp451] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP,
+		.alert_alarms = 0x7c,
+		.max_convrate = 9,
+		.reg_local_ext = TMP451_REG_R_LOCAL_TEMPL,
+	},
+	[tmp461] = {
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP,
 		.alert_alarms = 0x7c,
 		.max_convrate = 9,
 		.reg_local_ext = TMP451_REG_R_LOCAL_TEMPL,
@@ -998,7 +1015,7 @@ static int lm90_get_temp11(struct lm90_data *data, int index)
 	s16 temp11 = data->temp11[index];
 	int temp;
 
-	if (data->kind == adt7461 || data->kind == tmp451)
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP)
 		temp = temp_from_u16_adt7461(data, temp11);
 	else if (data->kind == max6646)
 		temp = temp_from_u16(temp11);
@@ -1035,7 +1052,7 @@ static int lm90_set_temp11(struct lm90_data *data, int index, long val)
 		val -= 16000;
 	}
 
-	if (data->kind == adt7461 || data->kind == tmp451)
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP)
 		data->temp11[index] = temp_to_u16_adt7461(data, val);
 	else if (data->kind == max6646)
 		data->temp11[index] = temp_to_u8(val) << 8;
@@ -1062,7 +1079,7 @@ static int lm90_get_temp8(struct lm90_data *data, int index)
 	s8 temp8 = data->temp8[index];
 	int temp;
 
-	if (data->kind == adt7461 || data->kind == tmp451)
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP)
 		temp = temp_from_u8_adt7461(data, temp8);
 	else if (data->kind == max6646)
 		temp = temp_from_u8(temp8);
@@ -1098,7 +1115,7 @@ static int lm90_set_temp8(struct lm90_data *data, int index, long val)
 		val -= 16000;
 	}
 
-	if (data->kind == adt7461 || data->kind == tmp451)
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP)
 		data->temp8[index] = temp_to_u8_adt7461(data, val);
 	else if (data->kind == max6646)
 		data->temp8[index] = temp_to_u8(val);
@@ -1116,7 +1133,7 @@ static int lm90_get_temphyst(struct lm90_data *data, int index)
 {
 	int temp;
 
-	if (data->kind == adt7461 || data->kind == tmp451)
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP)
 		temp = temp_from_u8_adt7461(data, data->temp8[index]);
 	else if (data->kind == max6646)
 		temp = temp_from_u8(data->temp8[index]);
@@ -1136,7 +1153,7 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 	int temp;
 	int err;
 
-	if (data->kind == adt7461 || data->kind == tmp451)
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP)
 		temp = temp_from_u8_adt7461(data, data->temp8[LOCAL_CRIT]);
 	else if (data->kind == max6646)
 		temp = temp_from_u8(data->temp8[LOCAL_CRIT]);
@@ -1627,18 +1644,26 @@ static int lm90_detect(struct i2c_client *client,
 		 && convrate <= 0x08)
 			name = "g781";
 	} else
-	if (address == 0x4C
-	 && man_id == 0x55) { /* Texas Instruments */
-		int local_ext;
+	if (man_id == 0x55 && chip_id == 0x00 &&
+	    (config1 & 0x1B) == 0x00 && convrate <= 0x09) {
+		int local_ext, conalert, chen, dfc;
 
 		local_ext = i2c_smbus_read_byte_data(client,
 						     TMP451_REG_R_LOCAL_TEMPL);
-
-		if (chip_id == 0x00 /* TMP451 */
-		 && (config1 & 0x1B) == 0x00
-		 && convrate <= 0x09
-		 && (local_ext & 0x0F) == 0x00)
-			name = "tmp451";
+		conalert = i2c_smbus_read_byte_data(client,
+						    TMP451_REG_CONALERT);
+		chen = i2c_smbus_read_byte_data(client, TMP461_REG_CHEN);
+		dfc = i2c_smbus_read_byte_data(client, TMP461_REG_DFC);
+
+		if ((local_ext & 0x0F) == 0x00 &&
+		    (conalert & 0xf1) == 0x01 &&
+		    (chen & 0xfc) == 0x00 &&
+		    (dfc & 0xfc) == 0x00) {
+			if (address == 0x4c && !(chen & 0x03))
+				name = "tmp451";
+			else if (address >= 0x48 && address <= 0x4f)
+				name = "tmp461";
+		}
 	}
 
 	if (!name) { /* identification failed */
@@ -1685,7 +1710,7 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
 
 	/* Check Temperature Range Select */
-	if (data->kind == adt7461 || data->kind == tmp451) {
+	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
 		if (config & 0x04)
 			data->flags |= LM90_FLAG_ADT7461_EXT;
 	}
-- 
2.33.0

