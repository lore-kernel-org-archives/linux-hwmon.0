Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CBCC7EE24
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 May 2023 20:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239066AbjEKU0n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 May 2023 16:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238768AbjEKU0n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 May 2023 16:26:43 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDBB49F9
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 13:26:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac82912a59so96637151fa.3
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 13:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683836798; x=1686428798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EAsxpgqP1ywvIslfL2wcYgWMux0kIWU98Z+3ySLiEs=;
        b=BbJi0tcPL3TJvkDzuEd7MoU0893UAD6vmvY/JTblrHvTa4SirJi0rlOArubm7Jiu0n
         iwdQUT1DKc5bB91XDgdSGHokOMd+AQThBRUebRJCmNXio0mtMJQEny51Irk3tNOhCLfn
         YUBo4e5eulTc8KncLBiU0p/vyl99xC+nmflazwByXXGZFLkYTnNjUCmI3hceIL5K4/1E
         yr9sUljW7pC3xaXZkUH2X1Q/yOKrq0mawF+6q5ClkLQAxmcv8YoBt2LY7ExL7zkHymzS
         xUoEGmDwYO06UzwocnciqJj24X3nsGVktLDmy4VOe9uj8CUq65hWfNVbeZ1MVdjPIuxQ
         mGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683836798; x=1686428798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EAsxpgqP1ywvIslfL2wcYgWMux0kIWU98Z+3ySLiEs=;
        b=GGyONlY9NqJh6nfxN5yH0EDMWQ9th1udMJbhCya7VngCGzB0haEBkDLNCD+zdcf3Q6
         90ZbxKEUzmEe0d2I83A3S64dyHx6PaiMu8G5y8Z1daPKXE/0biGWJRfijL3N+JsXhJWj
         S3uMxRZEUjr2otKkK0M+zvBIILvpwfhnblM7cOByAXpGXZuGfu41zp8awVFrg9PAL3Ya
         TGV05PgBE8LtCrAL8ROn5eezasd6oX4OpzggFvfeeCwdiG5ieKMN88aASVCUi54N/CvX
         UmT6GSrHEzkMDC+iSta1yBBW35un5oMvbj919ZlgroXiyuZHCRtAR9Ggdtvjwb6sKG2v
         YnaQ==
X-Gm-Message-State: AC+VfDw2EUhZxj8K/aLFGp6SszcNCZyvja4VLIOLpQTEeMt0zpLulYG1
        CeRuTIsJV0lTnnrsegwnsTqy9monbXWDF4Kr
X-Google-Smtp-Source: ACHHUZ4aD+VfcTbeJ3gBzy39UijVkRIZNc+/OJ+HbFuzb+HnL83zJt9omQl5TvN8uJsFzlbfGcr2Kw==
X-Received: by 2002:a19:a406:0:b0:4f2:5c2a:19ba with SMTP id q6-20020a19a406000000b004f25c2a19bamr2497020lfc.46.1683836798572;
        Thu, 11 May 2023 13:26:38 -0700 (PDT)
Received: from kirillyatsenko.camlin.tech ([89.151.41.1])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1235959lfm.144.2023.05.11.13.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 13:26:38 -0700 (PDT)
From:   Kirill Yatsenko <kiriyatsenko@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, delvare@suse.com, jcdra1@gmail.com
Subject: [PATCH 3/3] hwmon: (aht10) Add support for compatible aht20
Date:   Thu, 11 May 2023 22:26:33 +0200
Message-Id: <20230511202633.299174-3-kiriyatsenko@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230511202633.299174-1-kiriyatsenko@gmail.com>
References: <20230511202633.299174-1-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for compatible AHT20 temperature/humidity sensor. The only
software difference between the two is that AHT20 has additional crc8
byte.

It seems like AHT15 is also supported by the driver but it wasn't
verified and tested yet.

Tested on Beaglebone black rev C.

Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
---
 Documentation/hwmon/aht10.rst | 20 +++++++++----
 drivers/hwmon/Kconfig         | 11 +++++--
 drivers/hwmon/aht10.c         | 54 ++++++++++++++++++++++++++++-------
 3 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/Documentation/hwmon/aht10.rst b/Documentation/hwmon/aht10.rst
index 4e198c5eb683..213644b4ecba 100644
--- a/Documentation/hwmon/aht10.rst
+++ b/Documentation/hwmon/aht10.rst
@@ -5,32 +5,42 @@ Kernel driver aht10
 
 Supported chips:
 
-  * Aosong AHT10
+  * Aosong AHT10/AHT20
 
     Prefix: 'aht10'
 
     Addresses scanned: None
 
-    Datasheet:
+    Datasheet(AHT10):
 
       Chinese: http://www.aosong.com/userfiles/files/media/AHT10%E4%BA%A7%E5%93%81%E6%89%8B%E5%86%8C%20A3%2020201210.pdf
       English: https://server4.eca.ir/eshop/AHT10/Aosong_AHT10_en_draft_0c.pdf
 
+    Datasheet(AHT20):
+
+      English: http://www.aosong.com/userfiles/files/media/Data%20Sheet%20AHT20.pdf
+
 Author: Johannes Cornelis Draaijer <jcdra1@gmail.com>
 
 
 Description
 -----------
 
-The AHT10 is a Temperature and Humidity sensor
+The AHT10/AHT20 is a Temperature and Humidity sensor
 
 The address of this i2c device may only be 0x38
 
+Special Features
+----------------
+
+AHT20 has additional CRC8 support which is sent as the last byte of the sensor
+values.
+
 Usage Notes
 -----------
 
-This driver does not probe for AHT10 devices, as there is no reliable
-way to determine if an i2c chip is or isn't an AHT10. The device has
+This driver does not probe for AHT10/ATH20 devices, as there is no reliable
+way to determine if an i2c chip is or isn't an AHT10/AHT20. The device has
 to be instantiated explicitly with the address 0x38. See
 Documentation/i2c/instantiating-devices.rst for details.
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fc640201a2de..ccb295312102 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -255,15 +255,22 @@ config SENSORS_ADT7475
 	  will be called adt7475.
 
 config SENSORS_AHT10
-	tristate "Aosong AHT10"
+	tristate "Aosong AHT10, AHT20"
 	depends on I2C
 	help
-	  If you say yes here, you get support for the Aosong AHT10
+	  If you say yes here, you get support for the Aosong AHT10 and AHT20
 	  temperature and humidity sensors
 
 	  This driver can also be built as a module. If so, the module
 	  will be called aht10.
 
+config SENSORS_AHT20_CRC
+	bool "Aosong AHT20 crc8 check"
+	depends on SENSORS_AHT10
+	select CRC8
+	help
+	  If you say yes here, you get support for the Aosong AHT20 CRC8 check
+
 config SENSORS_AQUACOMPUTER_D5NEXT
 	tristate "Aquacomputer D5 Next, Octo, Quadro, Farbwerk, Farbwerk 360, High Flow Next"
 	depends on USB_HID
diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 17ceec9aab66..c854a774434e 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /*
- * aht10.c - Linux hwmon driver for AHT10 Temperature and Humidity sensor
+ * aht10.c - Linux hwmon driver for AHT10/AHT20 Temperature and Humidity sensors
  * Copyright (C) 2020 Johannes Cornelis Draaijer
  */
 
@@ -10,8 +10,14 @@
 #include <linux/i2c.h>
 #include <linux/ktime.h>
 #include <linux/module.h>
+#include <linux/crc8.h>
 
+#ifdef CONFIG_SENSORS_AHT20_CRC
+#define AHT20_CRC8_POLY		0x31
+#define AHT10_MEAS_SIZE		7
+#else
 #define AHT10_MEAS_SIZE		6
+#endif
 
 /*
  * Poll intervals (in milliseconds)
@@ -45,8 +51,8 @@
 #define AHT10_MAX_POLL_INTERVAL_LEN	30
 
 /**
- *   struct aht10_data - All the data required to operate an AHT10 chip
- *   @client: the i2c client associated with the AHT10
+ *   struct aht10_data - All the data required to operate an AHT10/AHT20 chip
+ *   @client: the i2c client associated with the AHT10/AHT20
  *   @lock: a mutex that is used to prevent parallel access to the
  *          i2c client
  *   @min_poll_interval: the minimum poll interval
@@ -56,12 +62,12 @@
  *                   the chip from warming up due to the heat it generates.
  *                   If it's unwanted, it can be ignored setting it to
  *                   it to 0. Default value is 2000 ms
- *   @previous_poll_time: the previous time that the AHT10
+ *   @previous_poll_time: the previous time that the AHT10/AHT20
  *                        was polled
  *   @temperature: the latest temperature value received from
- *                 the AHT10
+ *                 the AHT10/AHT20
  *   @humidity: the latest humidity value received from the
- *              AHT10
+ *              AHT10/AHT20
  */
 
 struct aht10_data {
@@ -78,8 +84,8 @@ struct aht10_data {
 };
 
 /**
- * aht10_init() - Initialize an AHT10 chip
- * @data: the data associated with this AHT10 chip
+ * aht10_init() - Initialize an AHT10/AHT20 chip
+ * @data: the data associated with this AHT10/AHT20 chip
  * Return: 0 if successful, 1 if not
  */
 static int aht10_init(struct aht10_data *data)
@@ -121,8 +127,25 @@ static int aht10_polltime_expired(struct aht10_data *data)
 	return ktime_after(difference, data->min_poll_interval);
 }
 
+#ifdef CONFIG_SENSORS_AHT20_CRC
+DECLARE_CRC8_TABLE(crc8_table);
+
+/**
+ * aht20_crc8_check() - check crc of the raw data from the AHT20
+ * @raw_data: data frame received from sensor(including crc as the last byte)
+ * @count: size of the data frame
+ * Return: 0 if successful, 1 if not
+ */
+static int aht20_crc8_check(u8 *raw_data, int count)
+{
+	// crc calculated on the whole frame(including crc byte) should yield
+	// zero in case of correctly received bytes
+	return crc8(crc8_table, raw_data, count, CRC8_INIT_VALUE);
+}
+#endif
+
 /**
- * aht10_read_values() - read and parse the raw data from the AHT10
+ * aht10_read_values() - read and parse the raw data from the AHT10/AHT20
  * @data: the struct aht10_data to use for the lock
  * Return: 0 if successful, 1 if not
  */
@@ -157,6 +180,13 @@ static int aht10_read_values(struct aht10_data *data)
 			return res;
 	}
 
+#ifdef CONFIG_SENSORS_AHT20_CRC
+	if (aht20_crc8_check(raw_data, AHT10_MEAS_SIZE)) {
+		mutex_unlock(&data->lock);
+		return -ENODATA;
+	}
+#endif
+
 	hum =   ((u32)raw_data[1] << 12u) |
 		((u32)raw_data[2] << 4u) |
 		((raw_data[3] & 0xF0u) >> 4u);
@@ -310,6 +340,10 @@ static int aht10_probe(struct i2c_client *client)
 
 	mutex_init(&data->lock);
 
+#ifdef CONFIG_SENSORS_AHT20_CRC
+	crc8_populate_msb(crc8_table, AHT20_CRC8_POLY);
+#endif
+
 	res = aht10_init(data);
 	if (res < 0)
 		return res;
@@ -344,6 +378,6 @@ static struct i2c_driver aht10_driver = {
 module_i2c_driver(aht10_driver);
 
 MODULE_AUTHOR("Johannes Cornelis Draaijer <jcdra1@gmail.com>");
-MODULE_DESCRIPTION("AHT10 Temperature and Humidity sensor driver");
+MODULE_DESCRIPTION("AHT10/AHT20 Temperature and Humidity sensor driver");
 MODULE_VERSION("1.0");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

