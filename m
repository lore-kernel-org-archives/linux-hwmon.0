Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40593B7B93
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651608; cv=none; b=MnE1FihIFaumn9D31mlNEMCsIBOUUvHEqEW+i3TB+/SYCrEp10vf7d7I8UrR/QF8RQfgy2P1fp9IlyzYx+jvQGuzzAk89o83WzF84GW5SFiWN14DIUBz8PsP5BJUJX9Quov8b8cHgR3yx710TziKGv4XRJhYKMFRgIJ0bZjV3uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651608; c=relaxed/simple;
	bh=QgobgovtvS0btM25Pvw7/GKeeZ1e20a3WySXh4XsjzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hadg0Za7ptaSlwiHncACmWqGX7lPKZTHCFP/1QXR5oOW7wNnq/iHy7C6SmdJIOrbczu6qRwAj0tAsUju0X8bPmN0RKLCfy7FG1zK9ssqDaKRIVYGg5lZQ1PMyP1YMCJ6jEvWuqx8ajl914zBK1z3VtL3tB4dLTvzdAxKwSxOFTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdFe5Z/n; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdFe5Z/n"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bc806fcf8so601494eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781651606; x=1782256406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6xT3EHFM1ovHmxtEmO9AYMulmXmmDGt2k7RTE8vBNzY=;
        b=MdFe5Z/nImJtLWX5ftPwbB365Nt2B8ic52d4AmonAFg5wNSBZ62pgTY7YjeMzZaQZo
         nSTUIFMjEc2lK+A57pmX5OOp4J0chV4PxneCFZ4fuBizV2HmsO6uPMIgjSbBRg7Y140V
         gftpkSlpyb1DJLzUBvxfmtIMxTWEywKGR6mI83eOiqwSnCUcrcwKVhRBiqFMzKMcG/JI
         VGZJnBntrd0RuBUBebv334Pi8ZIB8o6DC6abTWIFE+j7XC251ix9de+jf88QXBck5f2f
         i5jjG/338G3a2LnNQ+C8KSFe51krksGkK4u9LKJdao/qIGNa5QtWlA1sowwDScbbW31R
         Tumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651606; x=1782256406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xT3EHFM1ovHmxtEmO9AYMulmXmmDGt2k7RTE8vBNzY=;
        b=DyhjhF6vu2XaAvOW4obvkEnlIuWXkT8vb+evFzRoohoTvO6Un6bUxkF8yKXMirK8dk
         hczry7O6Oe1O4D6oknN5VT9g39yhS8y0xI9XwZ9L//1xJcs9TaOhZPtq8xeNl0S6aA42
         sVWCthGkKOUK6eFTWjMeNJRDjhPcRhirne/5vr6D9m7Jh8GYkQJjJR/uyEUGIFpJOcwC
         uu61fU+Vc/ea92OaqaUCNI091HdMxg9afa5B4mxlvZSlgRf6r+15oYhu/2CsWE0dxOSx
         iikznIF2AxBPSpBg2s0pqGeqkuPfjOwyVscIS2GBaD7CT/7k8CjNzSpfSq3Q85SOK8oI
         R5tw==
X-Gm-Message-State: AOJu0YwkfdvlyF6PBfLfoTNgh7NOgp05ZE4daGN0b6N4uxuLF6oEt9R6
	5L25IkgqI3RscoI/QQRKgYTqrlCnMYh3Fw+nFxaoVY4CQum5mTio/5iOKb5kK7ua
X-Gm-Gg: AfdE7clboM9aU/J7nqafxTobaKyM9ZCFEivJgIfIWtVliL54isey7NVtRtP4oEVUqHU
	N1Lopv54r97VvUcs2OJ2cpPVbjlo4CJEqUETDiTOeBi3zNg8tnV+RkCfDzktoyxBMLAjdjvruAe
	AKHLObBfk4N6hYm6xpzxXxzwvSWvZQxmoJRuLt80IfRMtIcq0VkVkx+zFrN5o++sym1TnaiSmiz
	5zojsTWGFKx3SZDA+hKRsHYIGEvlXlH5gdZwYflXE7FS/BiPWp0KZNx7Iuf3Bt/4odq4MTSLfpN
	5oeUs7tZtB6KYbfWj4zAi4pVyw4qj5UVSYjwfWB0WomDJgcENcDfQacqYZOA9JBCWLltOm+ULiO
	BbVhV4qUT/qcJgCDP9zTr4C+EjGu8BRHcTBDV2aYugVPRQ8YcSNRFrmquacPJlMj44ENdWC7d1t
	1weYsZQb0/a9Z9zg+GUYNu/e0R5VivNmT3t0/F
X-Received: by 2002:a05:7301:608b:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-30bca90ba21mr869520eec.3.1781651605748;
        Tue, 16 Jun 2026 16:13:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ba6b7f840sm6861754eec.19.2026.06.16.16.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:13:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5] hwmon: (ina2xx) Fix overflow issues
Date: Tue, 16 Jun 2026 16:13:23 -0700
Message-ID: <20260616231323.3971915-1-linux@roeck-us.net>
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
Let's see if Sashiko is happy with this version ...

v5: Relax clamping when writing the INA2XX_CURRENT alert limit
v4: Fix another clamping issue when reading INA2XX_CURRENT
v3: Fix additional problems in INA2XX_CURRENT handling
    (avoid possible 64-bit divide operation and overflow when using
     DIV_ROUND_CLOSEST)
v2: Fixed several additional overflow conditions reported by Sashiko
    after v1

 drivers/hwmon/ina2xx.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index a533e3053986..816a5e9fc960 100644
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
@@ -281,10 +282,11 @@ static u16 ina226_interval_to_reg(long interval)
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
@@ -298,12 +300,13 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
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
+		val = clamp_val(val64, LONG_MIN + 500, LONG_MAX - 500);
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_CALIBRATION:
@@ -393,23 +396,26 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
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
+		limit = (LONG_MAX - (data->current_lsb_uA / 2)) / 1000;
+		val = clamp_val(val, -limit, limit);
 		/* signed register, result in mA */
 		val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
 		val <<= data->config->current_shift;
@@ -552,6 +558,7 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 	u8 template[6];
 	int ret;
 	long accumulator_24, sample_count;
+	u64 val64;
 
 	/* 48-bit register read */
 	ret = i2c_smbus_read_i2c_block_data(data->client, reg, 6, template);
@@ -570,7 +577,8 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 		return 0;
 	}
 
-	*val = DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	val64 = (u64)DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	*val = clamp_val(val64, 0, LONG_MAX);
 
 	return 0;
 }
-- 
2.45.2

