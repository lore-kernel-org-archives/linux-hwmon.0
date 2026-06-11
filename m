Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9BE36CE03
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213200; cv=none; b=GgzpJ3ZCrazpew9zKQP5nG5C5UL1P2g125Y5E5VD+mfleK9X0IpRXjx7FyfDXUDWog/wQsNVf6j9FLK/tOEa+uTQNzKzoSwKny+KZZCCfBaqqLF+7u+isGS56xe/Y2kYqXCua5tHBcnAjKEofwt1uWwqaIdR3jKyAUunpn03eOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213200; c=relaxed/simple;
	bh=G2OIABeTvWXw/Bmn/6YKg+oTVd+l072kQzePBe91tyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mx9E81EBulibO9VRGTkVPEDxkMDTzSLmVLVRcfk3mj+Czlle7Zk7qsm97i430+IiP/L6l2v93eHBx0+02SvPKZxPb8qC/tvPYubHNDIBY+CCIz2fKzIrIu3l1UA0ZW5lIPhGi62T4A+NStI8q/Z2VG+9cHbWL2+Q7kvJnJhrpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnP7cTRV; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnP7cTRV"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so170208a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781213198; x=1781817998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/M3qonAYgq5C9at7seb6uw9RpiPwU0yanAscnkaK56g=;
        b=OnP7cTRVx05JHX5yUN0mZE4/vZfXd268G8J1pjTK+8IbSm1SJ592f/kjTSJn4p9vPI
         jQjAD2v0epmQYhwx5Re+y6wYlIs3rZ96I/0hV4pIaxAU92xstg/ifHGxQ5JGc2+Iegbl
         l0xbHNVeQ9ZWtd8CSPOL4nYalUYYJ8T28BGzHCV3sl7yBpUUB/P/NoCVac7BfPH+swyk
         wyHdpu60Ky5Uhv6gDuppyc1OzecWyWyVgP8Bg74T5RV3ngKgRd08/3oTwweI4NI8S5Pq
         KgzbkVB0n3WiTWQhFtWiVkp/a+4pB7uSlpjnYYxcIqUIpgAJD4o1ttWt01X0eKDnMVSW
         Q4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781213198; x=1781817998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M3qonAYgq5C9at7seb6uw9RpiPwU0yanAscnkaK56g=;
        b=UHyMnDYQwrMkTcGFmxn15fFkAWlJkqlRYdpC33kKFJWN4IWeh38FcQpsin77EU9xhk
         4KwyW3gtN0pcFKdgbKR/0T2BzF2RWAni5yYSOOtpROZ/nmbDyz7UTuIUT2i6+AxB3Q0a
         xqxlSIEUzzGJSvxfPYvOhwK4OClHnyZfgqQJEr99jTNDk8VZUHgvDSKHIQG3MTqslB/Q
         bnM3cofUwznVhuXl2RdsYJGRmbHPaCdGZeIvwGGucbMNdyDo1iaCNQrfleUDXfEoGqh1
         oQ4Fk2uf5xT4bb9J3dHCJjYGbjKhobex6IB+2WokcM7PqQ+diP/RuED2FlT8wMBf54oj
         eoqQ==
X-Gm-Message-State: AOJu0Yz5jLOkmZtbq3NrMfniyli9eTh6K0RA/SJqijXr99DWvty0m2iy
	Jvk5e8kM80rIF+fUw4GsRK83CLjP4Dm0nV36O1g+sKaFu23opbtg2Z15YrNfH/x1
X-Gm-Gg: Acq92OGB8d/7au2t55QmfUKWYF3uz19o9PXK0gLnjcmE7qmn7VcM7DNgI1bfQGsVvT1
	trcBUO/tfQXOXBUIwQH9jqYzlV2rv3ta3/1JdzaZIm16uW0eldKzlt4EgIkziWLfNcCg66bjc0v
	M54qyGQqCVaX0CGxEBY963rKVOMinAUSzUKnCXr1frQjTst50bEC4BsBIG2aWFicLo7YFcFuDuZ
	8gtiNyW0Pzi6L4hK637ToCKtYqXfjUP2yc4X7xE9oxq/qdQ+nvBkMfs1raYB1y2ynT+mzATsQLA
	0q8F6ZEiEin7tSVBk03rDgVEIJmSb0UV+7yI7h7R4ghAO7wGdwYKxDXry430vN5jon0NI0+yYyQ
	YnBzXGm0BpWK68jveIbtAAv3AgvM9lT/BI3atZ8NWwGeiIH19qKFoLAKVVP8cW6tLj2tH27cbEc
	H4Yxl+BAAWZcDAm3aYNUkMp+g1WugpVUezbxCA
X-Received: by 2002:a05:6300:2285:b0:3b3:f46:1eea with SMTP id adf61e73a8af0-3b783c755d9mr45942637.7.1781213198189;
        Thu, 11 Jun 2026 14:26:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325e477sm187280a12.10.2026.06.11.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4] hwmon: (ina2xx) Fix overflow issues
Date: Thu, 11 Jun 2026 14:26:34 -0700
Message-ID: <20260611212634.846262-1-linux@roeck-us.net>
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
v4: Fix another clamping issue when reading INA2XX_CURRENT
v3: Fix additional problems in INA2XX_CURRENT handling
    (avoid possible 64-bit divide operation and overflow when using
     DIV_ROUND_CLOSEST)
v2: Fixed several additional overflow conditions reported by Sashiko
    after v1

 drivers/hwmon/ina2xx.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999..e84e7ad26b6f 100644
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
+		val = clamp_val(val64, LONG_MIN + 500, LONG_MAX - 500);
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

