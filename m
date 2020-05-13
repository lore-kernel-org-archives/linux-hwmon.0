Return-Path: <SRS0=2Ivk=63=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07185C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 May 2020 18:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1133205CB
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 May 2020 18:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wmu3cH8J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387492AbgEMSm6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 May 2020 14:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732218AbgEMSm6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 May 2020 14:42:58 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D00C061A0C
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2020 11:42:56 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d206so751923ybh.7
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2020 11:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=UB7Tbk92tLiPEtuc5m9bvV/ZR7SsTK28UnolIfrCQyU=;
        b=Wmu3cH8JUEQ4rYVS+izV5XeE49AmdBwGlv+foAMYWAFp06+5ePV3F3feJtAytdimS4
         PpUyLBjiKGx+qFCln9W2NbRc0HRsSQw5SoxxhFGjqRSrDez00gXwyeOKCY961LGXvZWR
         cK15hGiLo32WloxXlOD/hRwKc6lrK2iotETo6JH1AO11HP4VpWaPpIkhLUxDQznsRRKA
         5QO/sTPvToqw8aMmDye2Ige4pQrIHZlBDTiu1Uv443Nxa8t/1YNvbTHarg6tWw4TPje+
         ewD5cI0aemA+hEeIOpW2oCHIhZzsh/oXt5kvxN58N/aCRwHK1a6EGiZgbIqyIROn+dji
         n2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=UB7Tbk92tLiPEtuc5m9bvV/ZR7SsTK28UnolIfrCQyU=;
        b=CLXYAsvQpYosyFtFs/2nLgvgPZgOkOZfw8Mypfnkammewt6NYFkoW5FNBOA1dSrsbu
         LV5FtO90kH0FieKsThIPs9LUCPoe0grFNpL/KaC9+vMXGNOuG6jTbBo+w8o73ZhIDbpj
         fUvFagxFMqnuhNndY7XVEQYlEUvdqtrwxzq4D4JazNT0viqKBPmRzzG8kcrJ4gG1+/VK
         mv7BUb+liQfTMIwYXB2ntmjv6O1lZBXGeYqTPhINa1a6G/rayv6HkfNtKnZBXPmyfA2S
         H3T3HBbdCDSoUcjtRrtyGFNnkRt2grfufflj+MY5aLyjVqWWYdBx5C7M5XDPFzjH2A7b
         1N7w==
X-Gm-Message-State: AOAM5300odFEAtfCZ0fOpfj+lCxr/ZL3CPkTdVVisK/JdgjwBDOEZlCx
        tiCxPcYST++diPE56fFuLodXNdoRAgnfw0ioBQ130L916UQthnprt1WLZeDGPC9NfVXT7LbWZef
        vSzdi4VsL3Lw3wKTqBT6eHmEpY0H+OxseDcDFeoMIHqkGT/jon7xMNk5uHrQVL858nUw9l54=
X-Google-Smtp-Source: ABdhPJy5f+P/BoWZO3jpW3jeQ20EXL4UQc4aX6efKs5c+7M+MQbvMDUjIJSl1JFBFNwUag7i50VvbLMa71fT
X-Received: by 2002:a25:8092:: with SMTP id n18mr648973ybk.99.1589395375779;
 Wed, 13 May 2020 11:42:55 -0700 (PDT)
Date:   Wed, 13 May 2020 11:42:48 -0700
Message-Id: <20200513184248.145765-1-krellan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
Subject: [PATCH] hwmon: (lm90) Add max6654 support to lm90 driver
From:   Josh Lehan <krellan@google.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Josh Lehan <krellan@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for the Maxim MAX6654 to the lm90 driver.

The MAX6654 is a temperature sensor, similar to the others,
but with some differences regarding the configuration
register, and the sampling rate at which extended resolution
becomes possible.

Signed-off-by: Josh Lehan <krellan@google.com>
---
 Documentation/hwmon/lm90.rst | 23 ++++++++++++++++--
 drivers/hwmon/Kconfig        |  9 ++++----
 drivers/hwmon/lm90.c         | 45 ++++++++++++++++++++++++++++++++----
 3 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 953315987c06..78dfc01b47a2 100644
--- a/Documentation/hwmon/lm90.rst
+++ b/Documentation/hwmon/lm90.rst
@@ -123,6 +123,18 @@ Supported chips:
 
 	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
 
+  * Maxim MAX6654
+
+    Prefix: 'max6654'
+
+    Addresses scanned: I2C 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b,
+
+			   0x4c, 0x4d and 0x4e
+
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.maximintegrated.com/en/products/sensors/MAX6654.html
+
   * Maxim MAX6657
 
     Prefix: 'max6657'
@@ -301,6 +313,13 @@ ADT7461, ADT7461A, NCT1008:
   * Extended temperature range (breaks compatibility)
   * Lower resolution for remote temperature
 
+MAX6654:
+  * Better local resolution
+  * Selectable address
+  * Remote sensor type selection
+  * Extended temperature range
+  * Extended resolution only available when conversion rate <= 1 Hz
+
 MAX6657 and MAX6658:
   * Better local resolution
   * Remote sensor type selection
@@ -336,8 +355,8 @@ SA56004X:
 
 All temperature values are given in degrees Celsius. Resolution
 is 1.0 degree for the local temperature, 0.125 degree for the remote
-temperature, except for the MAX6657, MAX6658 and MAX6659 which have a
-resolution of 0.125 degree for both temperatures.
+temperature, except for the MAX6654, MAX6657, MAX6658 and MAX6659 which have
+a resolution of 0.125 degree for both temperatures.
 
 Each sensor has its own high and low limits, plus a critical limit.
 Additionally, there is a relative hysteresis value common to both critical
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4c62f900bf7e..e950d1f3e110 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1198,10 +1198,11 @@ config SENSORS_LM90
 	help
 	  If you say yes here you get support for National Semiconductor LM90,
 	  LM86, LM89 and LM99, Analog Devices ADM1032, ADT7461, and ADT7461A,
-	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6657, MAX6658, MAX6659,
-	  MAX6680, MAX6681, MAX6692, MAX6695, MAX6696, ON Semiconductor NCT1008,
-	  Winbond/Nuvoton W83L771W/G/AWG/ASG, Philips SA56004, GMT G781, and
-	  Texas Instruments TMP451 sensor chips.
+	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6654, MAX6657, MAX6658,
+	  MAX6659, MAX6680, MAX6681, MAX6692, MAX6695, MAX6696,
+	  ON Semiconductor NCT1008, Winbond/Nuvoton W83L771W/G/AWG/ASG,
+	  Philips SA56004, GMT G781, and Texas Instruments TMP451
+	  sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called lm90.
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 9b3c9f390ef8..7bdc664af55b 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -35,6 +35,14 @@
  * explicitly as max6659, or if its address is not 0x4c.
  * These chips lack the remote temperature offset feature.
  *
+ * This driver also supports the MAX6654 chip made by Maxim. This chip can
+ * be at 9 different addresses, similar to MAX6680/MAX6681. The MAX6654 is
+ * otherwise similar to MAX6657/MAX6658/MAX6659. Extended range is available
+ * by setting the configuration register accordingly, and is done during
+ * initialization. Extended precision is only available at conversion rates
+ * of 1 Hz and slower. Note that extended precision is not enabled by
+ * default, as this driver initializes all chips to 2 Hz by design.
+ *
  * This driver also supports the MAX6646, MAX6647, MAX6648, MAX6649 and
  * MAX6692 chips made by Maxim.  These are again similar to the LM86,
  * but they use unsigned temperature values and can report temperatures
@@ -94,8 +102,8 @@
  * have address 0x4d.
  * MAX6647 has address 0x4e.
  * MAX6659 can have address 0x4c, 0x4d or 0x4e.
- * MAX6680 and MAX6681 can have address 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b,
- * 0x4c, 0x4d or 0x4e.
+ * MAX6654, MAX6680, and MAX6681 can have address 0x18, 0x19, 0x1a, 0x29,
+ * 0x2a, 0x2b, 0x4c, 0x4d or 0x4e.
  * SA56004 can have address 0x48 through 0x4F.
  */
 
@@ -104,7 +112,7 @@ static const unsigned short normal_i2c[] = {
 	0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
 
 enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
-	max6646, w83l771, max6696, sa56004, g781, tmp451 };
+	max6646, w83l771, max6696, sa56004, g781, tmp451, max6654 };
 
 /*
  * The LM90 registers
@@ -145,7 +153,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_REG_R_TCRIT_HYST		0x21
 #define LM90_REG_W_TCRIT_HYST		0x21
 
-/* MAX6646/6647/6649/6657/6658/6659/6695/6696 registers */
+/* MAX6646/6647/6649/6654/6657/6658/6659/6695/6696 registers */
 
 #define MAX6657_REG_R_LOCAL_TEMPL	0x11
 #define MAX6696_REG_R_STATUS2		0x12
@@ -209,6 +217,7 @@ static const struct i2c_device_id lm90_id[] = {
 	{ "max6646", max6646 },
 	{ "max6647", max6646 },
 	{ "max6649", max6646 },
+	{ "max6654", max6654 },
 	{ "max6657", max6657 },
 	{ "max6658", max6657 },
 	{ "max6659", max6659 },
@@ -269,6 +278,10 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
 		.compatible = "dallas,max6649",
 		.data = (void *)max6646
 	},
+	{
+		.compatible = "dallas,max6654",
+		.data = (void *)max6654
+	},
 	{
 		.compatible = "dallas,max6657",
 		.data = (void *)max6657
@@ -367,6 +380,11 @@ static const struct lm90_params lm90_params[] = {
 		.max_convrate = 6,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
+	[max6654] = {
+		.alert_alarms = 0x7c,
+		.max_convrate = 7,
+		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
+	},
 	[max6657] = {
 		.flags = LM90_PAUSE_FOR_CONFIG,
 		.alert_alarms = 0x7c,
@@ -1557,6 +1575,16 @@ static int lm90_detect(struct i2c_client *client,
 		 && (config1 & 0x3f) == 0x00
 		 && convrate <= 0x07) {
 			name = "max6646";
+		} else
+		/*
+		 * The chip_id of the MAX6654 holds the revision of the chip.
+		 * The lowest 3 bits of the config1 register are unused and
+		 * should return zero when read.
+		 */
+		if (chip_id == 0x08
+		 && (config1 & 0x07) == 0x00
+		 && convrate <= 0x07) {
+			name = "max6654";
 		}
 	} else
 	if (address == 0x4C
@@ -1660,6 +1688,15 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	if (data->kind == max6680)
 		config |= 0x18;
 
+	/*
+	 * Put MAX6654 into extended range (0x20, extend minimum range from
+	 * 0 degrees to -64 degrees). Note that extended resolution is not
+	 * possible on the MAX6654 unless conversion rate is set to 1 Hz or
+	 * slower, which is intentionally not done by default.
+	 */
+	if (data->kind == max6654)
+		config |= 0x20;
+
 	/*
 	 * Select external channel 0 for max6695/96
 	 */
-- 
2.26.2.645.ge9eca65c58-goog

