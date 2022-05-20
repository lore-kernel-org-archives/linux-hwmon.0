Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F141C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347989AbiETJy5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348015AbiETJyy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:54 -0400
Received: from smtpo52.interia.pl (smtpo52.interia.pl [217.74.67.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A00B14B65B
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:52 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:47 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 4/8] hwmon: (lm90) add support for ADT7481
Date:   Fri, 20 May 2022 11:32:40 +0200
Message-Id: <20220520093243.2523749-5-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040311;
        bh=6J1bs99vTx7LHEUGI178VDCZdAtohxbVRtrKWQBZXXk=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=fmZ95VS8X9Z79BmmlRs1UnVRP0wONR9iUYDqa+B5u+ljRaasaSWF5Xfq/nVyVy4Ja
         Hvw/KKReCbcx47UTE79rX4OWbjVU/OVNXSV/o6MyrVHZ23iDrTnXEH9Y0QjiCNi0R/
         CpsFeY+9oXlp39wn5bRy328XDoMKBnPkxAuzn4VE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

The ADT7481 is a 3-channel digital thermometer and under/over
temperature alarm, intended for use in PCs and thermal management
systems.

From driver point-of-view, it is quite similar to MAX6696 so a lot of
code for MAX6696 is reused.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 Documentation/hwmon/lm90.rst |  12 +++-
 drivers/hwmon/Kconfig        |  15 +++--
 drivers/hwmon/lm90.c         | 114 ++++++++++++++++++++++++++---------
 3 files changed, 105 insertions(+), 36 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 05391fb4042d..2e67d602e275 100644
--- a/Documentation/hwmon/lm90.rst
+++ b/Documentation/hwmon/lm90.rst
@@ -73,6 +73,16 @@ Supported chips:
 
 	       https://www.onsemi.com/PowerSolutions/product.do?id=ADT7461A
 
+  * Analog Devices ADT7481
+
+    Prefix: 'adt7481'
+
+    Addresses scanned: I2C 0x4c and 0x4b
+
+    Datasheet: Publicly available at the ON Semiconductor website
+
+	       http://www.onsemi.com/PowerSolutions/product.do?id=ADT7481
+
   * ON Semiconductor NCT1008
 
     Prefix: 'nct1008'
@@ -319,7 +329,7 @@ ADM1032:
   * ALERT is triggered by open remote sensor.
   * SMBus PEC support for Write Byte and Receive Byte transactions.
 
-ADT7461, ADT7461A, NCT1008:
+ADT7461, ADT7461A, ADT7481, NCT1008:
   * Extended temperature range (breaks compatibility)
   * Lower resolution for remote temperature
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f2b038fa3b84..9586b610b5d8 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1339,13 +1339,16 @@ config SENSORS_LM90
 	tristate "National Semiconductor LM90 and compatibles"
 	depends on I2C
 	help
-	  If you say yes here you get support for National Semiconductor LM90,
-	  LM86, LM89 and LM99, Analog Devices ADM1032, ADT7461, and ADT7461A,
+	  If you say yes here you will get support for sensor chips:
+	  National Semiconductor LM90, LM86, LM89 and LM99,
+	  Analog Devices ADM1032, ADT7461, ADT7461A and ADT7481,
 	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6654, MAX6657, MAX6658,
-	  MAX6659, MAX6680, MAX6681, MAX6692, MAX6695, MAX6696,
-	  ON Semiconductor NCT1008, Winbond/Nuvoton W83L771W/G/AWG/ASG,
-	  Philips SA56004, GMT G781, Texas Instruments TMP451 and TMP461
-	  sensor chips.
+	  MAX6659, MAX6680, MAX6681, MAX6692, MAX6695 and MAX6696,
+	  ON Semiconductor NCT1008,
+	  Winbond/Nuvoton W83L771W/G/AWG/ASG,
+	  Philips SA56004,
+	  GMT G781,
+	  Texas Instruments TMP451 and TMP461.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called lm90.
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c9493c70813..00fd5734f217 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -59,10 +59,10 @@
  * chips, but support three temperature sensors instead of two. MAX6695
  * and MAX6696 only differ in the pinout so they can be treated identically.
  *
- * This driver also supports ADT7461 and ADT7461A from Analog Devices as well as
- * NCT1008 from ON Semiconductor. The chips are supported in both compatibility
- * and extended mode. They are mostly compatible with LM90 except for a data
- * format difference for the temperature value registers.
+ * This driver also supports ADT7461, ADT7461A and ADT7481 from Analog Devices
+ * as well as NCT1008 from ON Semiconductor. The chips are supported in both
+ * compatibility and extended mode. They are mostly compatible with LM90 except
+ * for a data format difference for the temperature value registers.
  *
  * This driver also supports the SA56004 from Philips. This device is
  * pin-compatible with the LM86, the ED/EDP parts are also address-compatible.
@@ -106,14 +106,16 @@
  * MAX6654, MAX6680, and MAX6681 can have address 0x18, 0x19, 0x1a, 0x29,
  * 0x2a, 0x2b, 0x4c, 0x4d or 0x4e.
  * SA56004 can have address 0x48 through 0x4F.
+ * ADT7481 can have address 0x4c or 0x4b (ADT7481-1).
  */
 
 static const unsigned short normal_i2c[] = {
 	0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 	0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
 
-enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
-	max6646, w83l771, max6696, sa56004, g781, tmp451, tmp461, max6654 };
+enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, adt7481,
+	max6680, max6646, w83l771, max6696, sa56004, g781, tmp451, tmp461,
+	max6654 };
 
 /*
  * The LM90 registers
@@ -141,6 +143,10 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_REG_W_REMOTE_OFFSH		0x11
 #define LM90_REG_R_REMOTE_OFFSL		0x12
 #define LM90_REG_W_REMOTE_OFFSL		0x12
+#define LM90_REG_R_REMOTE2_OFFSH	0x34
+#define LM90_REG_W_REMOTE2_OFFSH	0x34
+#define LM90_REG_R_REMOTE2_OFFSL	0x35
+#define LM90_REG_W_REMOTE2_OFFSL	0x35
 #define LM90_REG_R_REMOTE_HIGHH		0x07
 #define LM90_REG_W_REMOTE_HIGHH		0x0D
 #define LM90_REG_R_REMOTE_HIGHL		0x13
@@ -154,6 +160,10 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_REG_R_TCRIT_HYST		0x21
 #define LM90_REG_W_TCRIT_HYST		0x21
 
+/* ADT7481 registers */
+
+#define ADT7481_REG_R_STATUS2           0x23
+
 /* MAX6646/6647/6649/6654/6657/6658/6659/6695/6696 registers */
 
 #define MAX6657_REG_R_LOCAL_TEMPL	0x11
@@ -202,6 +212,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_STATUS_LHIGH	(1 << 6) /* local high temp limit tripped */
 #define LM90_STATUS_BUSY	(1 << 7) /* conversion is ongoing */
 
+/* Note: bits 1, 2, 3 and 4 are used by ADT7481 too */
 #define MAX6696_STATUS2_R2THRM	(1 << 1) /* remote2 THERM limit tripped */
 #define MAX6696_STATUS2_R2OPEN	(1 << 2) /* remote2 is an open circuit */
 #define MAX6696_STATUS2_R2LOW	(1 << 3) /* remote2 low temp limit tripped */
@@ -218,6 +229,7 @@ static const struct i2c_device_id lm90_id[] = {
 	{ "adm1032", adm1032 },
 	{ "adt7461", adt7461 },
 	{ "adt7461a", adt7461 },
+	{ "adt7481", adt7481 },
 	{ "g781", g781 },
 	{ "lm90", lm90 },
 	{ "lm86", lm86 },
@@ -256,6 +268,10 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
 		.compatible = "adi,adt7461a",
 		.data = (void *)adt7461
 	},
+	{
+		.compatible = "adi,adt7481",
+		.data = (void *)adt7481
+	},
 	{
 		.compatible = "gmt,g781",
 		.data = (void *)g781
@@ -353,6 +369,7 @@ struct lm90_params {
 				/* Upper 8 bits for max6695/96 */
 	u8 max_convrate;	/* Maximum conversion rate register value */
 	u8 reg_local_ext;	/* Extended local temp register (optional) */
+	u8 reg_status2;		/* Second status register (optional) */
 };
 
 static const struct lm90_params lm90_params[] = {
@@ -369,6 +386,14 @@ static const struct lm90_params lm90_params[] = {
 		.alert_alarms = 0x7c,
 		.max_convrate = 10,
 	},
+	[adt7481] = {
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP
+		  | LM90_HAVE_CRIT | LM90_HAVE_TEMP3,
+		.alert_alarms = 0x1c7c,
+		.max_convrate = 11,
+		.reg_status2 = ADT7481_REG_R_STATUS2,
+	},
 	[g781] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
 		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_CRIT,
@@ -429,6 +454,7 @@ static const struct lm90_params lm90_params[] = {
 		.alert_alarms = 0x1c7c,
 		.max_convrate = 6,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
+		.reg_status2 = MAX6696_REG_R_STATUS2,
 	},
 	[w83l771] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT | LM90_HAVE_CRIT,
@@ -480,10 +506,11 @@ enum lm90_temp11_reg_index {
 	REMOTE_LOW,
 	REMOTE_HIGH,
 	REMOTE_OFFSET,	/* except max6646, max6657/58/59, and max6695/96 */
+	REMOTE2_OFFSET, /* for dev that can set offset for the 2nd channel */
 	LOCAL_TEMP,
-	REMOTE2_TEMP,	/* max6695/96 only */
-	REMOTE2_LOW,	/* max6695/96 only */
-	REMOTE2_HIGH,	/* max6695/96 only */
+	REMOTE2_TEMP,	/* max6695/96 and adt7481 only */
+	REMOTE2_LOW,	/* max6695/96 and adt7481 only */
+	REMOTE2_HIGH,	/* max6695/96 and adt7481 only */
 	TEMP11_REG_NUM
 };
 
@@ -512,7 +539,8 @@ struct lm90_data {
 	u16 alert_alarms;	/* Which alarm bits trigger ALERT# */
 				/* Upper 8 bits for max6695/96 */
 	u8 max_convrate;	/* Maximum conversion rate */
-	u8 reg_local_ext;	/* local extension register offset */
+	u8 reg_local_ext;	/* Local extension register offset */
+	u8 reg_status2;		/* Second status register */
 
 	/* registers values */
 	s8 temp8[TEMP8_REG_NUM];
@@ -617,7 +645,7 @@ static int lm90_select_remote_channel(struct lm90_data *data, int channel)
 {
 	int err = 0;
 
-	if (data->kind == max6696) {
+	if (data->kind == max6696 || data->kind == adt7481) {
 		u8 config = data->config & ~0x08;
 
 		if (channel)
@@ -726,6 +754,14 @@ static int lm90_update_limits(struct device *dev)
 		if (val < 0)
 			return val;
 		data->temp11[REMOTE_OFFSET] = val;
+
+		if (data->flags & LM90_HAVE_TEMP3) {
+			val = lm90_read16(client, LM90_REG_R_REMOTE2_OFFSH,
+					  LM90_REG_R_REMOTE2_OFFSL);
+			if (val < 0)
+				return val;
+			data->temp11[REMOTE2_OFFSET] = val;
+		}
 	}
 
 	if (data->flags & LM90_HAVE_EMERGENCY) {
@@ -740,7 +776,7 @@ static int lm90_update_limits(struct device *dev)
 		data->temp8[REMOTE_EMERG] = val;
 	}
 
-	if (data->kind == max6696) {
+	if (data->kind == max6696 || data->kind == adt7481) {
 		val = lm90_select_remote_channel(data, 1);
 		if (val < 0)
 			return val;
@@ -750,10 +786,12 @@ static int lm90_update_limits(struct device *dev)
 			return val;
 		data->temp8[REMOTE2_CRIT] = val;
 
-		val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
-		if (val < 0)
-			return val;
-		data->temp8[REMOTE2_EMERG] = val;
+		if (data->kind == max6696) {
+			val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
+			if (val < 0)
+				return val;
+			data->temp8[REMOTE2_EMERG] = val;
+		}
 
 		val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
 		if (val < 0)
@@ -824,7 +862,7 @@ static int lm90_update_device(struct device *dev)
 			return val;
 		data->alarms = val & ~LM90_STATUS_BUSY;
 
-		if (data->kind == max6696) {
+		if (data->kind == max6696 || data->kind == adt7481) {
 			val = lm90_select_remote_channel(data, 1);
 			if (val < 0)
 				return val;
@@ -838,8 +876,10 @@ static int lm90_update_device(struct device *dev)
 			data->temp11[REMOTE2_TEMP] = val;
 
 			lm90_select_remote_channel(data, 0);
+		}
 
-			val = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
+		if (data->reg_status2) {
+			val = lm90_read_reg(client, data->reg_status2);
 			if (val < 0)
 				return val;
 			data->alarms |= val << 8;
@@ -1051,6 +1091,7 @@ static int lm90_set_temp11(struct lm90_data *data, int index, long val)
 	[REMOTE_LOW] = { LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL },
 	[REMOTE_HIGH] = { LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL },
 	[REMOTE_OFFSET] = { LM90_REG_W_REMOTE_OFFSH, LM90_REG_W_REMOTE_OFFSL },
+	[REMOTE2_OFFSET] = { LM90_REG_W_REMOTE_OFFSH, LM90_REG_W_REMOTE_OFFSL },
 	[REMOTE2_LOW] = { LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL },
 	[REMOTE2_HIGH] = { LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL }
 	};
@@ -1074,7 +1115,7 @@ static int lm90_set_temp11(struct lm90_data *data, int index, long val)
 	else
 		data->temp11[index] = temp_to_s8(val) << 8;
 
-	lm90_select_remote_channel(data, index >= 3);
+	lm90_select_remote_channel(data, index >= REMOTE2_OFFSET);
 	err = i2c_smbus_write_byte_data(client, regp->high,
 				  data->temp11[index] >> 8);
 	if (err < 0)
@@ -1271,7 +1312,10 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel]);
 		break;
 	case hwmon_temp_offset:
-		*val = lm90_get_temp11(data, REMOTE_OFFSET);
+		if (channel == 1)
+			*val = lm90_get_temp11(data, REMOTE_OFFSET);
+		else
+			*val = lm90_get_temp11(data, REMOTE2_OFFSET);
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1321,7 +1365,10 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
 		err = lm90_set_temp8(data, lm90_temp_emerg_index[channel], val);
 		break;
 	case hwmon_temp_offset:
-		err = lm90_set_temp11(data, REMOTE_OFFSET, val);
+		if (channel == 1)
+			err = lm90_set_temp11(data, REMOTE_OFFSET, val);
+		else
+			err = lm90_set_temp11(data, REMOTE2_OFFSET, val);
 		break;
 	default:
 		err = -EOPNOTSUPP;
@@ -1513,7 +1560,7 @@ static int lm90_detect(struct i2c_client *client,
 			}
 		}
 	} else
-	if ((address == 0x4C || address == 0x4D)
+	if ((address == 0x4C || address == 0x4D || address == 0x4B)
 	 && man_id == 0x41) { /* Analog Devices */
 		if ((chip_id & 0xF0) == 0x40 /* ADM1032 */
 		 && (config1 & 0x3F) == 0x00
@@ -1536,6 +1583,11 @@ static int lm90_detect(struct i2c_client *client,
 		 && (config1 & 0x1B) == 0x00
 		 && convrate <= 0x0A) {
 			name = "adt7461a";
+		} else
+		if (chip_id == 0x62 /* ADT7481 (undocumented in datasheet) */
+		 && (config1 & 0x1B) == 0x00
+		 && convrate <= 0x0B) {
+			name = "adt7481";
 		}
 	} else
 	if (man_id == 0x4D) { /* Maxim */
@@ -1749,9 +1801,9 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 		config |= 0x20;
 
 	/*
-	 * Select external channel 0 for max6695/96
+	 * Select external channel 0 for max6695/96 or adt7481
 	 */
-	if (data->kind == max6696)
+	if (data->kind == max6696 || data->kind == adt7481)
 		config &= ~0x08;
 
 	/*
@@ -1776,11 +1828,11 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
 	if (st < 0)
 		return false;
 
-	if (data->kind == max6696) {
-		st2 = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
-		if (st2 < 0)
-			return false;
-	}
+	if (data->reg_status2)
+		st2 = lm90_read_reg(client, data->reg_status2);
+
+	if (st2 < 0)
+		return false;
 
 	*status = st | (st2 << 8);
 
@@ -1951,9 +2003,13 @@ static int lm90_probe(struct i2c_client *client)
 			HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
 			HWMON_T_CRIT_ALARM | HWMON_T_EMERGENCY_ALARM |
 			HWMON_T_FAULT;
+
+		if (data->flags & LM90_HAVE_OFFSET)
+			data->channel_config[2] |= HWMON_T_OFFSET;
 	}
 
 	data->reg_local_ext = lm90_params[data->kind].reg_local_ext;
+	data->reg_status2 = lm90_params[data->kind].reg_status2;
 
 	/* Set maximum conversion rate */
 	data->max_convrate = lm90_params[data->kind].max_convrate;
-- 
2.36.1

