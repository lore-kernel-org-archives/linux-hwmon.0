Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E61D1313
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979966; cv=none; b=GKPL85EhtxtuG2+ZqOnhV8bzfmg7c+QPDpvtajbl1U8oO9HlYclwBfran5ZHJh9K3DK3Oq2LSoQ/UW1k8YTLZw8LNY6cSn89IIK9lJEBB9D/8dOM27kD6TCB/bLTCjo3ESCFDiTSbgtngQVAPwBuzg2xHiSHgXQx7bcVf9ePuYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979966; c=relaxed/simple;
	bh=IEQBBBRng3RwrAuRtje/i8tymL9Ui/qCJBLpIAeaqhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXtrD8MI+XPP5IPNj95ZRRYCuq7o/4f5EzTmvpc3lQS2iFIXDO4CJeO2UNRVgYnZ/QExIb/+X2ewA/3HXdyNb9b0xl+gXOpQb00a83kgNFZ1MLuT5w/tBvHrFJJ9dH9vspqxJvun8lJ2SHaKzSiTxEr+6hPSZGhoWaHyrQtBri8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9A8HJSx; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9A8HJSx"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5dfabdbef52so232980eaf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979963; x=1725584763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Pf77FQ8Na3/kvLxrdMcdN10PN9Q18fKHkGYmLP7bts=;
        b=Z9A8HJSxybJaJgzO6QqO9ah1IvoH2+0wIT7zGC+M9bpO9SAWU/9OZUgOr0hRkoCFiY
         xNIMpyQFBHi0rUwrXdoWEPsDAzuiu8MC5HfSlaTgl/A55icYhgegVtROlWr9slO59xKK
         Cb7KmTLe9Z9QGEQ9wzW0dI3xya2DPx9kqVmVNJe5Q474EWS38jkoW/DgfitVsqZ30p1d
         P4VOnOdHlgAUMlfj1ialdQ8lBLpGo4J2rtpkGNODmRajwZ4CEWdd+5kTCfM4lEmo5EWh
         GZC+EavHdFkhTc/w5T8+rOEpxuNeQQVLiRQ2rp4GwOrwP4xXXXxPOmEb79OMTScATOQt
         txCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979963; x=1725584763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Pf77FQ8Na3/kvLxrdMcdN10PN9Q18fKHkGYmLP7bts=;
        b=tjsX03BJalhrqZiHkhEDbaFwA2NPCIH5S0czL3j+gpSJ1b3Ap8UupOqXfL4adsBRU1
         CdISPfvm03KAhJFtuLsUoeBrn9u4m47TJM2x4qdfktR8FNRJIBiZHcNxZjclp3CIC4hT
         IsiyyQJjJr4RVNeZA17/Cc+9h0adJ50PcUDiOAGCaO6sdCYkl4QW+2bdc8VtZ9lzgGQc
         kkO2SXYHWDRAwDRIIPNanBytNSM40+Ho6h143Vg9Vf+ygfThIibC6CkPYLezKFmyohrf
         DfGzKReKkeg6giJRcEM12pc2Oh5qo0wjsAPwJEN5wKjTfEaHP9V5gEy/i4Sxa2OFSMCp
         +Dbw==
X-Gm-Message-State: AOJu0Yy/AobfYrPQGRasll566GWSq63Fnhoagnqdt/lFiwKZDIu703Hx
	OTLEsBtt9TG9toD8yHQ3oagc5NdWK0GKyO8W2gE/NjDw0rz6KQGfD05HVw==
X-Google-Smtp-Source: AGHT+IGMeCVc3E+EVM8EBLZYwccMlRvcKkRry5KpZNp1yd3+CbOjJb/eS8WofESIpMj8C5zdP4p0RQ==
X-Received: by 2002:a05:6870:819e:b0:261:537:8d8 with SMTP id 586e51a60fabf-27790372974mr5658375fac.49.1724979963320;
        Thu, 29 Aug 2024 18:06:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56aa485sm1719323b3a.102.2024.08.29.18.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 03/14] hwmon: (ina2xx) Use bit operations
Date: Thu, 29 Aug 2024 18:05:43 -0700
Message-ID: <20240830010554.1462861-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
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

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

