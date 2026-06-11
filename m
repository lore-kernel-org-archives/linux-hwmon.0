Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD93EDE61
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186240; cv=none; b=qVz9iqpmS+WOKKXk5qTlLoV5yzdZo3ALUu09JF+caae2N2EvxvHGCFigGQNSCqaBzvTJ0qz1gumDdEXF+CbQLnOWRFLtIr12EQh4t6F0iJOK97dbJHzv6R775qZ4WqoicIHaL7ZqkreIRTyfm7rtiu8i7C4+gjRSvLtFeUScKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186240; c=relaxed/simple;
	bh=o4o6biMf5m2AwdK0TUuuOOc8F/1i6grl3VdZI9mbe7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mrnuXIPDJviopKMbW7l39yKDz1FpAZb8vEWuzT+7JBJ0TvhdqMznLuFlTZNSG7a9RzyMhDE4ah2HdS/2rbnsAOXCImPCLG3qAnEwACzx+HEYRD8nO+8X/gqbdVheg4z+gPbRNBbz/6gxPWjwhetNubTIx8ZTXOyzo8hqwnLDIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAELr+Qc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAELr+Qc"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c2a68d01so53342275ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781186238; x=1781791038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=auR+9EKtdFDBYvIWxh9xvjeNt3f9dcAPs+uHrrLqk88=;
        b=LAELr+QcfRuX/CW+swdYkjtZ/F9NOYcC3I4fC1cnXbOqKWoeOGTu3Wwofj9bHfNaEN
         aSVLzigCgOotoVQHdL+718sF3610XojGxYy2y0qMWI4mU/kwNXIGNK9vZWay6AzBJboD
         G5l2mfY6bmpXIXbNax7Mnsy/bszYbja96gVWrK7mj4JoiigUJ7e9VsgVLE7o7hdOg4FM
         etd9cmlyccNz9hXgkMn1ieHMnAwEvmRymLq+6QokZpGJefRb3XatJO9kXhMmJiahB+o+
         6wXf7THd1RtfqVL1FYKz3Ve0m/+i3RLb5rXX87XemI4QSu+vdr1MeMxZqsmPKRZcIlR3
         eXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186238; x=1781791038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auR+9EKtdFDBYvIWxh9xvjeNt3f9dcAPs+uHrrLqk88=;
        b=QNlP21stDznMjrxgUag1V+PXtz8lnIzxd225FGfV0/f75WsQh6MhnnE9ehVDVIZXNP
         tDPXOfqR7o2DuJnGMOzAHHXhy2SzKrY6vrUE+SM+QHTtNmqV+yeV/7dHdIT86YwfC/8M
         hlwqDfOi+gzTmcDO+RgE3P+NTUkpPzXIJoZm05o6te2HPad4LkE4XQ3mKHggNFVY38pP
         ndzTlmrqj5lgaeCEaHsOFWielQD/yUCXZwJJET/S6Y260/73qtYV1usVkxA8Lt4sGx92
         xFgkxAGNcMrCOpfUotzfFLe+dOSYLHOA5j7qSAQRfP+pE/ll1A0+unPOvtkgMGWA4X01
         WxsQ==
X-Gm-Message-State: AOJu0YwlDoGfoHYAR8wm3D1U8JijGYzCLI9Ya/9ESkUVzdkOdi6zAYV6
	gBY66Oj5PoK3AWdxmWhXJNtSOayk5h/oB0POiMVFre1uEFGoi7ERaFsL2Yil1BDA
X-Gm-Gg: Acq92OEqvteK/u+Sy0qGU4ieqSKMX9abbT2ublKu1Op+fRDzAppS+v1Gpg1cLSng0Hu
	jHnyAikWEAPfHdnnia+aZEt4lICUNz2BuxmyzTqEW5ieiYC8zhfdaKZ1nKzyfBCZF/IX1iFgWXG
	hKGSLUj5x139v9MzacIADWGzU0G/fSYvZOE54IiidBtcQdRRmbtb30qb2jQXMXvzYEzA4M1lYbo
	Kzx6YWMbxnEo0hTW1FZOM74EYTd3xnY9zprkWmGO1Mt8EdgNUn5OlI0Id1HGpUxtMiYyDfpjpbn
	8VE/ChO3rsLwr0EvdZfNnNcOdx9mpjwcegD9PtjUrqAWifv7AWpwGfgnYH/3nM5RV8Mh5MboJtU
	GOqBSxJffk9i3aaZIc1c8SWz+MEiFqlBOVNHondOZ9A7OtFwqr82vzbZqrTq6d1aN4wKtCVOi/O
	22ugdfCUesAQYi3X88CIXjkNhtGOP8KrGnGcgMKmEoSesf6AI=
X-Received: by 2002:a17:903:22c9:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2c2f0731f7emr37534475ad.5.1781186237778;
        Thu, 11 Jun 2026 06:57:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm294247435ad.27.2026.06.11.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:57:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] hwmon: (ina2xx) Fix overflow issues
Date: Thu, 11 Jun 2026 06:57:06 -0700
Message-ID: <20260611135706.826074-1-linux@roeck-us.net>
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
v3: Fix additional problems in INA2XX_CURRENT handling
    (avoid possible 64-bit divide operation and overflow when using
     DIV_ROUND_CLOSEST)
v2: Fixed several additional overflow conditions reported by Sashiko
    after v1

 drivers/hwmon/ina2xx.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999..a6163364fcaf 100644
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
@@ -283,12 +285,13 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
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
+		val = clamp_val(val64, LONG_MIN, LONG_MAX);
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_CALIBRATION:
@@ -378,23 +381,27 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
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
+		limit = ((INT_MAX - data->current_lsb_uA) / 1000) >>
+		  data->config->current_shift;
+		val = clamp_val(val, -limit, limit);
 		/* signed register, result in mA */
 		val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
 		val <<= data->config->current_shift;
@@ -537,6 +544,7 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 	u8 template[6];
 	int ret;
 	long accumulator_24, sample_count;
+	u64 val64;
 
 	/* 48-bit register read */
 	ret = i2c_smbus_read_i2c_block_data(data->client, reg, 6, template);
@@ -555,7 +563,8 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 		return 0;
 	}
 
-	*val = DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	val64 = (u64)DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	*val = clamp_val(val64, 0, LONG_MAX);
 
 	return 0;
 }
-- 
2.45.2

