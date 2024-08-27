Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E969E54648
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772907; cv=none; b=AN4Cu4r/8JlXAnH0Vu+DVyPMcl/oxFu/n/TZm0lUaP1iEIMnPE5cCiwXKM8JRjA0N10hazZvxA0gDsvPw67okJTsl4XFczRtggdME/um2CSpveUl2CF+mF+gGBYwXGXWZDw4rYj0SsdMsLCaqPWXEpfa5S1nB8mR4CNiPO11uCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772907; c=relaxed/simple;
	bh=jMWCfvRIr+IraEHoHKhUz/NfyGk3f9cYdr7LX2toYhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLoBB3H4mAHoMb6IeyvOq4cTrhOejiX3CgokijP6hlGKnm3RMtBLZpL40UdeA88bY36qMzr5y4KvMh/glEtXbU8U5FZb1hs4nvZx/UvUG8h1kEN3M2kx6G/HIpO1pJSWI7zF3iV2YEg+zQj5xjvgJfPG9H0gzAjRzJWg9aoDtpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jox3bVbZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jox3bVbZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2020ac89cabso51252475ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772904; x=1725377704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6ScOz9Jn2r5dS7L3+066pRoXANnKdx/ds7JEWxymmg=;
        b=jox3bVbZeQvOCHMlSscxz+GGiynQ/0ri/a/5Hvvur7/xCOnz73TAjmAUDuKS370AIN
         HMZeEXeatdBtFpOTDXIpWICWkKuZimpDf0lbwjXtSR39i4q7A3g55eS7TyWZxo5yc+V3
         PDhBrgeTZek65bQHiDA9JG/MVlU5Hrnzx/1pT27zw+facz6zZSOj/HtyfyH08Chyj3lk
         mMe76SkCMr1LntsccnXPvgRjxFSHHTU5aWIrZjC2HQkmnMNfF0/tkpvC0eOMjgNnfx1m
         Fjr6uSjUGeFgJZagK7/8jpnY1T3e47cZXFpKugxijcXD9Hgrr6JubNAXBN4JE1e3qYVV
         2TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772904; x=1725377704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6ScOz9Jn2r5dS7L3+066pRoXANnKdx/ds7JEWxymmg=;
        b=Q1FPjvhOM3FhB0nKVSeGake/LCr5YXTQcYBi2Yp4inTlFlWDVmHtybMfvzPllPlGg3
         gtPzA77SDbyzho6VmkZHXFejKBKNUdflA1K6t9sRlNRyG1Tx84LdeCwmU05vPk1HpRBh
         LE6rZdNcO6uILFXQQfaeGszagEM1lqAoM7N5YFV+OCxkIgkcxwxRQw/qaZs3sWjqtMoa
         S8vfQk1eunQXhuMrwyKYc0iMIUFw4cvfN/CPkbj5fB3Nbr6rMefCQllI2GA/QKRPAZM4
         Mcw8KRKvuwLYtidZBxVcOa+10lhwfJ+QHfXK2L+eX36eHOido2GOUN/YGDhWNZZcVPIh
         HCwg==
X-Gm-Message-State: AOJu0Yw67JrhUilOX2fOFO0WrHaoSXZEEkJUpqG+EWDbD9ZVErB2LD1/
	QYK/sPfmK8KLKiu73hMKxb4vJyRsfjBYnoyG5vepIvrJwFGoyUptKc95uw==
X-Google-Smtp-Source: AGHT+IE9EyeUkmzasKkCgBozLxHC0EUsLF65XqX4Uw56ZeBRfQlEn2WhWAwc4I+EydVEjgTH0LD7Tg==
X-Received: by 2002:a17:903:41d2:b0:202:4042:8520 with SMTP id d9443c01a7336-2039e4c6652mr141832965ad.37.1724772904280;
        Tue, 27 Aug 2024 08:35:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560e53dsm84611215ad.191.2024.08.27.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/11] hwmon: (ina2xx) Use bit operations
Date: Tue, 27 Aug 2024 08:34:47 -0700
Message-ID: <20240827153455.1344529-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit operations where possible to make the code more generic and to
align it with other drivers. Also use compile time conversion from bit
to mask to reduce runtime overhead.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 84 +++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 897657f8d685..1b4170d02c94 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -22,6 +22,8 @@
  * Thanks to Jan Volkering
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
@@ -65,25 +67,23 @@
 #define INA2XX_RSHUNT_DEFAULT		10000
 
 /* bit mask for reading the averaging setting in the configuration register */
-#define INA226_AVG_RD_MASK		0x0E00
+#define INA226_AVG_RD_MASK		GENMASK(11, 9)
 
-#define INA226_READ_AVG(reg)		(((reg) & INA226_AVG_RD_MASK) >> 9)
-#define INA226_SHIFT_AVG(val)		((val) << 9)
+#define INA226_READ_AVG(reg)		FIELD_GET(INA226_AVG_RD_MASK, reg)
 
-#define INA226_ALERT_POLARITY_MASK		0x0002
-#define INA226_SHIFT_ALERT_POLARITY(val)	((val) << 1)
-#define INA226_ALERT_POL_LOW			0
-#define INA226_ALERT_POL_HIGH			1
+#define INA226_ALERT_POLARITY_MASK	BIT(1)
+#define INA226_ALERT_POL_LOW		0
+#define INA226_ALERT_POL_HIGH		1
 
 /* bit number of alert functions in Mask/Enable Register */
-#define INA226_SHUNT_OVER_VOLTAGE_BIT	15
-#define INA226_SHUNT_UNDER_VOLTAGE_BIT	14
-#define INA226_BUS_OVER_VOLTAGE_BIT	13
-#define INA226_BUS_UNDER_VOLTAGE_BIT	12
-#define INA226_POWER_OVER_LIMIT_BIT	11
+#define INA226_SHUNT_OVER_VOLTAGE_MASK	BIT(15)
+#define INA226_SHUNT_UNDER_VOLTAGE_MASK	BIT(14)
+#define INA226_BUS_OVER_VOLTAGE_MASK	BIT(13)
+#define INA226_BUS_UNDER_VOLTAGE_MASK	BIT(12)
+#define INA226_POWER_OVER_LIMIT_MASK	BIT(11)
 
 /* bit mask for alert config bits of Mask/Enable Register */
-#define INA226_ALERT_CONFIG_MASK	0xFC00
+#define INA226_ALERT_CONFIG_MASK	GENMASK(15, 10)
 #define INA226_ALERT_FUNCTION_FLAG	BIT(4)
 
 /* common attrs, ina226 attrs and NULL */
@@ -177,7 +177,7 @@ static u16 ina226_interval_to_reg(int interval)
 	avg_bits = find_closest(avg, ina226_avg_tab,
 				ARRAY_SIZE(ina226_avg_tab));
 
-	return INA226_SHIFT_AVG(avg_bits);
+	return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }
 
 static int ina2xx_set_alert_polarity(struct ina2xx_data *data,
@@ -185,7 +185,7 @@ static int ina2xx_set_alert_polarity(struct ina2xx_data *data,
 {
 	return regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
 				 INA226_ALERT_POLARITY_MASK,
-				 INA226_SHIFT_ALERT_POLARITY(val));
+				 FIELD_PREP(INA226_ALERT_POLARITY_MASK, val));
 }
 
 /*
@@ -322,20 +322,20 @@ static ssize_t ina2xx_value_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", ina2xx_get_value(data, attr->index, regval));
 }
 
-static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regval)
+static int ina226_reg_to_alert(struct ina2xx_data *data, u32 mask, u16 regval)
 {
 	int reg;
 
-	switch (bit) {
-	case INA226_SHUNT_OVER_VOLTAGE_BIT:
-	case INA226_SHUNT_UNDER_VOLTAGE_BIT:
+	switch (mask) {
+	case INA226_SHUNT_OVER_VOLTAGE_MASK:
+	case INA226_SHUNT_UNDER_VOLTAGE_MASK:
 		reg = INA2XX_SHUNT_VOLTAGE;
 		break;
-	case INA226_BUS_OVER_VOLTAGE_BIT:
-	case INA226_BUS_UNDER_VOLTAGE_BIT:
+	case INA226_BUS_OVER_VOLTAGE_MASK:
+	case INA226_BUS_UNDER_VOLTAGE_MASK:
 		reg = INA2XX_BUS_VOLTAGE;
 		break;
-	case INA226_POWER_OVER_LIMIT_BIT:
+	case INA226_POWER_OVER_LIMIT_MASK:
 		reg = INA2XX_POWER;
 		break;
 	default:
@@ -351,19 +351,19 @@ static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regval)
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static s16 ina226_alert_to_reg(struct ina2xx_data *data, u8 bit, int val)
+static s16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, int val)
 {
-	switch (bit) {
-	case INA226_SHUNT_OVER_VOLTAGE_BIT:
-	case INA226_SHUNT_UNDER_VOLTAGE_BIT:
+	switch (mask) {
+	case INA226_SHUNT_OVER_VOLTAGE_MASK:
+	case INA226_SHUNT_UNDER_VOLTAGE_MASK:
 		val *= data->config->shunt_div;
 		return clamp_val(val, SHRT_MIN, SHRT_MAX);
-	case INA226_BUS_OVER_VOLTAGE_BIT:
-	case INA226_BUS_UNDER_VOLTAGE_BIT:
+	case INA226_BUS_OVER_VOLTAGE_MASK:
+	case INA226_BUS_UNDER_VOLTAGE_MASK:
 		val = (val * 1000) << data->config->bus_voltage_shift;
 		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
 		return clamp_val(val, 0, SHRT_MAX);
-	case INA226_POWER_OVER_LIMIT_BIT:
+	case INA226_POWER_OVER_LIMIT_MASK:
 		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
 		return clamp_val(val, 0, USHRT_MAX);
 	default:
@@ -387,7 +387,7 @@ static ssize_t ina226_alert_show(struct device *dev,
 	if (ret)
 		goto abort;
 
-	if (regval & BIT(attr->index)) {
+	if (regval & attr->index) {
 		ret = regmap_read(data->regmap, INA226_ALERT_LIMIT, &regval);
 		if (ret)
 			goto abort;
@@ -432,7 +432,7 @@ static ssize_t ina226_alert_store(struct device *dev,
 	if (val != 0) {
 		ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
 					 INA226_ALERT_CONFIG_MASK,
-					 BIT(attr->index));
+					 attr->index);
 		if (ret < 0)
 			goto abort;
 	}
@@ -456,7 +456,7 @@ static ssize_t ina226_alarm_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	alarm = (regval & BIT(attr->index)) &&
+	alarm = (regval & attr->index) &&
 		(regval & INA226_ALERT_FUNCTION_FLAG);
 	return sysfs_emit(buf, "%d\n", alarm);
 }
@@ -552,25 +552,25 @@ static ssize_t ina226_interval_show(struct device *dev,
 static SENSOR_DEVICE_ATTR_RO(in0_input, ina2xx_value, INA2XX_SHUNT_VOLTAGE);
 /* shunt voltage over/under voltage alert setting and alarm */
 static SENSOR_DEVICE_ATTR_RW(in0_crit, ina226_alert,
-			     INA226_SHUNT_OVER_VOLTAGE_BIT);
+			     INA226_SHUNT_OVER_VOLTAGE_MASK);
 static SENSOR_DEVICE_ATTR_RW(in0_lcrit, ina226_alert,
-			     INA226_SHUNT_UNDER_VOLTAGE_BIT);
+			     INA226_SHUNT_UNDER_VOLTAGE_MASK);
 static SENSOR_DEVICE_ATTR_RO(in0_crit_alarm, ina226_alarm,
-			     INA226_SHUNT_OVER_VOLTAGE_BIT);
+			     INA226_SHUNT_OVER_VOLTAGE_MASK);
 static SENSOR_DEVICE_ATTR_RO(in0_lcrit_alarm, ina226_alarm,
-			     INA226_SHUNT_UNDER_VOLTAGE_BIT);
+			     INA226_SHUNT_UNDER_VOLTAGE_MASK);
 
 /* bus voltage */
 static SENSOR_DEVICE_ATTR_RO(in1_input, ina2xx_value, INA2XX_BUS_VOLTAGE);
 /* bus voltage over/under voltage alert setting and alarm */
 static SENSOR_DEVICE_ATTR_RW(in1_crit, ina226_alert,
-			     INA226_BUS_OVER_VOLTAGE_BIT);
+			     INA226_BUS_OVER_VOLTAGE_MASK);
 static SENSOR_DEVICE_ATTR_RW(in1_lcrit, ina226_alert,
-			     INA226_BUS_UNDER_VOLTAGE_BIT);
+			     INA226_BUS_UNDER_VOLTAGE_MASK);
 static SENSOR_DEVICE_ATTR_RO(in1_crit_alarm, ina226_alarm,
-			     INA226_BUS_OVER_VOLTAGE_BIT);
+			     INA226_BUS_OVER_VOLTAGE_MASK);
 static SENSOR_DEVICE_ATTR_RO(in1_lcrit_alarm, ina226_alarm,
-			     INA226_BUS_UNDER_VOLTAGE_BIT);
+			     INA226_BUS_UNDER_VOLTAGE_MASK);
 
 /* calculated current */
 static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
@@ -579,9 +579,9 @@ static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
 static SENSOR_DEVICE_ATTR_RO(power1_input, ina2xx_value, INA2XX_POWER);
 /* over-limit power alert setting and alarm */
 static SENSOR_DEVICE_ATTR_RW(power1_crit, ina226_alert,
-			     INA226_POWER_OVER_LIMIT_BIT);
+			     INA226_POWER_OVER_LIMIT_MASK);
 static SENSOR_DEVICE_ATTR_RO(power1_crit_alarm, ina226_alarm,
-			     INA226_POWER_OVER_LIMIT_BIT);
+			     INA226_POWER_OVER_LIMIT_MASK);
 
 /* shunt resistance */
 static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ina2xx_shunt, INA2XX_CALIBRATION);
-- 
2.45.2

