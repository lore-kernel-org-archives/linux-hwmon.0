Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392C9374A15
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125309; cv=none; b=m7bDDHsJ2BrDc/3yddEo9+rjLxE5L4hOQO61nEtoIXXmQgBSromw/IZpLkmefV93t+EH569JeymNGkxgZ1VCbdF8xhd8GOQcf0CA5AS3ZDN30YTcdjyRxTPPWyVJdUDds9u6scaOKH0/gPhb8dKprqL7uwwP0QUbUdwh4VBCRPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125309; c=relaxed/simple;
	bh=q4trmAQ6LLoAm43y6W9Antd2744AQAobRBGNcV28PIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xysm7DqVo3kcMj/5kKYhy0cah6LQX1TkqohA42mAXO4MR/LVzsavwxY92J5KI8TeKP8CB41x8CVOioRRyimMzCcHfP8ktLWWZJyqU1Xqe7lnDRTSsa9eXa8UWWAqSBTfci07xx9xbeilta1ZYm+e1aPgs5fhOxIR/Lq1U8cQRYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3rjaxu4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3rjaxu4"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so4318860a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781125307; x=1781730107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtzBtVxVPt1IG/GbVBEIECLPxTXtqMIn5bbzEMkUJx0=;
        b=Y3rjaxu4VZfBBpD7taybbNqk71uytmaWnCG5XrdbdCl8EKPl38IdJOhaqZ2o+dYwlc
         JIBi5ocUhAPGyuQLtNagx3ilsi3Rv/sw+541JxR5LUHzIFQwNapvq1w3nYjwv/KTRKfR
         bMWb7oCUnJRKQRFTOh16yxytiXilTzLExq6WIK4fEge7N2P938ma4KT7qgLosKWtVT/9
         MuoFOKuJNDk9pHwrEZOT65RMDnHgYfdtSQyf1vWGgf/zGAyf/tNkL5cL6yNTxlY0EeCs
         vTusHZRHdEIG8rxt6rto3bha32rZ6yBWp9fNuug1VcpbHoqHl2HHCqYHL/dE6DUhi0/8
         cncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781125307; x=1781730107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtzBtVxVPt1IG/GbVBEIECLPxTXtqMIn5bbzEMkUJx0=;
        b=q8M6u6M7uk824GUbCPETpRSJbLXVutpX5JCrGd66k6XiCk9UmttNiCuFmxnmH19NoG
         +vnCq22AIPPLrrF9zfAk1l+jjLE+ZwFJiDjC9e8eHJkEsfhwhOskMG3pU8M1j4UICMvZ
         jRwhStPjKB/ska2Qt+G92Dtm90UABVxPBGOWwektgIE7aV5ENG5cRG/A5VpumRWd8+TI
         biGgd03H4Ur5VizLf+V/nN3vTut0dI6YSUVyqT/KAbbv2cwgPSYlFYs1FpQNsnPq7q6G
         /p7i2pBUFMRHKeBCEK/+YVLbRNEpZ5BOqivSYyqt4uXw/OOGSLn3nmUjgh+DZwTzJBX9
         C8lg==
X-Gm-Message-State: AOJu0YzhT60foTcJd2shtBrUkWzkeUgAMpux4/0qybpNyMg+IXtc5nWx
	8Tm862uXmbNcSqlTbYxr0RNETQMw/hSkzcLW7m77AI6sxv/wMfaRElG/A6PXyrkV
X-Gm-Gg: Acq92OFz5StcJHDU3OYv7ULl5z9rmSN/Rsy3Nd/MREczwu4s7FJ9R1F+/4shNCptNo2
	Mella0tcyetOnkbBO42hdmhmnL3RJJPiRT/m4ezV1UZqOCZRzPaoIS0vqm8XyhNKgDGoHwL8suY
	Uer/CmjIcAxjM3jOVBNrgYv3FxHHKg95he5GlASDJv0BdSTKNPTwRBRqBZXorNdgmJJ+k5YKCmO
	6wr8RlERU9US+qZ1bJug9YhNFHumQFm040uAF3zti1N0YCUN3/D9lsSJnBMHHJnWXU+usyO6TAS
	mM51WjQ6P24RuD54yjeVQfsm0XVcs4nsfqnfsYz0e3T0mKNwH59xqaU46u/nUnVl2wbKWzAnRR9
	d05jn00svYbNQEkdzf512At8USgwuGTVUu+2/fWqfBCrgV4396Snj/DKFCkzJuaITx1c32o/u3k
	Dm9jAbLr+epLgK2vscQ3Uc+eEScy7KO2r1UQuq2chhitxCC7KmDv+UWeeoJg==
X-Received: by 2002:a05:6a21:47c1:b0:3b5:6b5a:4f29 with SMTP id adf61e73a8af0-3b56b5a88c9mr899129637.30.1781125307293;
        Wed, 10 Jun 2026 14:01:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm21615874a12.9.2026.06.10.14.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:01:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] hwmon: (ina2xx) Fix overflow issues
Date: Wed, 10 Jun 2026 14:01:40 -0700
Message-ID: <20260610210140.43657-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports the following overflow problems:

In ina2xx_get_value(), the INA2XX_POWER calculation is:
    val = regval * data->power_lsb_uW;
The result is returned as a signed 32-bit int. For the INA232 with a common
2mOhm shunt, power_lsb_uW becomes 40,000. When the 16-bit regval exceeds
53,687, the product exceeds INT_MAX. This overflows the 32-bit signed math,
wrapping to a negative integer and reporting erroneous negative power
readings to userspace.

For INA2XX_POWER, the upper bound is clamped:
    val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
clamp_val() implicitly casts the upper bound to a 32-bit signed long on
32-bit platforms. This results in a negative number, meaning any valid
power limit is clamped to a negative value and ultimately programmed as 0.
Similarly, for INA2XX_SHUNT_VOLTAGE, the initial clamp uses SHRT_MAX *
shunt_div instead of division. The subsequent multiplication:
    val *= data->config->shunt_div;
overflows LONG_MAX on 32-bit platforms for high inputs, wrapping to a
negative value and also programming the hardware limit to 0.

For INA2XX_BUS_VOLTAGE on parts with bus_voltage_shift > 0, the calculation
(val * 1000) << shift can exceed LONG_MAX for limits over ~134V, wrapping
to negative and setting the limit to 0.

For INA2XX_CURRENT:
On 32-bit systems, long is 32-bit signed. For configurations with small
shunts, current_lsb_uA can be very large (e.g., 40,000,000). When
multiplied by a large regval, the product can reach 1.3 trillion, massively
exceeding LONG_MAX (2.14 billion).
This will silently overflow the 32-bit signed math, wrapping to a negative
value.

If a large limit is provided to effectively disable the alert (e.g.,
INT_MAX / 1000), the intermediate value after DIV_ROUND_CLOSEST can be
large (e.g., 200,000,000). When left-shifted by current_shift (e.g., 4 for
INA234), it becomes 3.2 billion, exceeding LONG_MAX and wrapping to a
negative number.

In sy24655_average_power_read(), the accumulator quotient multiplied by
power_lsb_uW can overflow the 32-bit signed math before the assignment.

Have ina2xx_get_value() return a long variable to improve the supported
value range on 64-bit systems and to match the type of values returned
to the hwmon core.

Clamp the result of 'regval * data->power_lsb_uW' to LONG_MAX to fix the
INA2XX_POWER calculation overflow.

Change the initial clamp for INA2XX_SHUNT_VOLTAGE to SHRT_MAX / shunt_div
to fix the shunt limit overflow.

For INA2XX_BUS_VOLTAGE, limit the initial clamp to 130V instead of 200V
to avoid the overflow.

For INA2XX_CURRENT, improve clamping to avoid the overflow.

To address the INA2XX_CURRENT problem in ina226_alert_to_reg(), take
current_shift into acount for the initial clamp to avoid the overflow.

In sy24655_average_power_read, use a temporary 64-bit variable to store
the multiplication result and clamp the result against LONG_MAX.

Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: ab7fbee452be ("hwmon: (ina2xx) Fix various overflow issues")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fixed several additional overflow conditions reported by Sashiko
    after v1

 drivers/hwmon/ina2xx.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999..1ba46c9c3e20 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -266,10 +267,11 @@ static u16 ina226_interval_to_reg(long interval)
 	return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }
 
-static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
-			    unsigned int regval)
+static long ina2xx_get_value(struct ina2xx_data *data, u8 reg,
+			     unsigned int regval)
 {
-	int val;
+	s64 val64;
+	long val;
 
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
@@ -283,13 +285,13 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_POWER:
-		val = regval * data->power_lsb_uW;
+		val = clamp_val((u64)regval * data->power_lsb_uW, 0, LONG_MAX);
 		break;
 	case INA2XX_CURRENT:
 		/* signed register, result in mA */
-		val = ((s16)regval >> data->config->current_shift) *
+		val64 = (s64)((s16)regval >> data->config->current_shift) *
 		  data->current_lsb_uA;
-		val = DIV_ROUND_CLOSEST(val, 1000);
+		val = clamp_val(DIV_ROUND_CLOSEST(val64, 1000), LONG_MIN, LONG_MAX);
 		break;
 	case INA2XX_CALIBRATION:
 		val = regval;
@@ -378,23 +380,26 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
  */
 static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 {
+	long limit;
+
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
-		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
+		val = clamp_val(val, 0, DIV_ROUND_CLOSEST(SHRT_MAX, data->config->shunt_div));
 		val *= data->config->shunt_div;
 		val <<= data->config->shunt_voltage_shift;
 		return clamp_val(val, 0, SHRT_MAX);
 	case INA2XX_BUS_VOLTAGE:
-		val = clamp_val(val, 0, 200000);
+		val = clamp_val(val, 0, 130000);
 		val = (val * 1000) << data->config->bus_voltage_shift;
 		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
 		return clamp_val(val, 0, USHRT_MAX);
 	case INA2XX_POWER:
-		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
+		val = clamp_val(val, 0, LONG_MAX - data->power_lsb_uW);
 		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
 		return clamp_val(val, 0, USHRT_MAX);
 	case INA2XX_CURRENT:
-		val = clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
+		limit = (INT_MAX / 1000) >> data->config->current_shift;
+		val = clamp_val(val, -limit, limit);
 		/* signed register, result in mA */
 		val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
 		val <<= data->config->current_shift;
@@ -537,6 +542,7 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 	u8 template[6];
 	int ret;
 	long accumulator_24, sample_count;
+	u64 val64;
 
 	/* 48-bit register read */
 	ret = i2c_smbus_read_i2c_block_data(data->client, reg, 6, template);
@@ -555,7 +561,8 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 		return 0;
 	}
 
-	*val = DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	val64 = (u64)DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	*val = clamp_val(val64, 0, LONG_MAX);
 
 	return 0;
 }
-- 
2.45.2

