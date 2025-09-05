Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9F02C3248;
	Fri,  5 Sep 2025 20:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104934; cv=none; b=eZRebpR3ZPC9jQXhem4PCwMdwxHTTnow5qKKhcp18a1ffiE/zcE48hNY+mhb3FN3uPz7NSu106buU6cUxoIDCCf5p1Brd54gfvO6ozULhCtLt7K5gg8lvqoZOEiE6cio4RuXGWVQ6LEEWNqFj/pfbdsygZ+BuhK+trSE3weCJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104934; c=relaxed/simple;
	bh=SqMR5kU4bEdUavD9Mf6J9LSpY7eedxAHjB/QV3rFg3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOXZu2lxBY3cdI61Wo6jrmYL3leXCXlY77RYRJa7Fi0JfgLHz1Xt4PdA4aF2Yq1X7igYHdE1ks8gBQaJozDcmUBPWkwD7Vc09rVScJBBr2uCCALxksN5XQPYxekluv2WgKMIWUdN+hLMw0RlzFa2sbixK1ro6fE9sKw2ZTgPmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkrkuhMb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkrkuhMb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32b5d3e1762so2001831a91.3;
        Fri, 05 Sep 2025 13:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104932; x=1757709732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=476Bp6Qsi26SkFYl6GsKeUkbyn9Et1KTUf2ukj/UpKI=;
        b=PkrkuhMbhAvdw+5VBrgaRq0o/tQu9+0U597MDKWxlUM2xfGBn5ACb5dW6ZMbxNwZPf
         zzseWy9PVGsqV0CgCh+IbNc9P64cZz2MP1SQejMdPqZNA5lt0yJDpzEjlPswAihnD6uP
         EdxJFt6bUpJ5HCsslxv3W0fYcLKla3Xp7cFhVGHN8NOtEE0rtpcrKkJkv4B7sHuY3oRf
         6FfzKwp6vC34O+MydeHTzWBVryLW3BwfQF/fJwQ6ngnCF9rzEog3pfGwWcu/SPXvKM6o
         lnqt8wi+1R09b4UucCtpJu0QFAKLtZjV3rgC0wJs0fEm3CiPMQ5c99Rf4H+IbD2NN/Op
         jDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104932; x=1757709732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=476Bp6Qsi26SkFYl6GsKeUkbyn9Et1KTUf2ukj/UpKI=;
        b=oHz0hMmqxjrBekoPPVGYQWYPbGknrc4xTjlyT1RIag8yshXK7rP25Yd+56BCpKpmpB
         vQ7iY5nYhSEUYYHlf4bD0qS6U3Q111jf5px+35Cg7CbE3Z0FCaP6neiHxWELOqTBEZ10
         38YRN6XAyPnEg0aIV902il4t6ECFT24xYUDyz/eF3KQa6oBP9fdlRw9dLI/Z4Kc/Zcd6
         OPqj69qwmgYMXsLtIUSfCe7fawpYO9hRbwQ+JB52l4r2XNDyhV3GPItQREHmAMm26bSw
         BmDji6YtOSt3HzENduI4jpIRbkyeFY68DvQ9EYfNt5yZ9UdIJh+5Eh9FQzB4/y5lE4eq
         7aUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIoT1T0G0U88xwiymqRGFhpOIlDWNQv3mNzGPc2psRJCpVMDeeR01SCvf7gnww6BhNMwsFAzVfFpkT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1sl/fgyCosyosBWelL4ohUpL4li5aGii4VJtFHDyalxsaUuf
	+aT0e3UsRohASHhBTfovH77AZOyYfpbbAijfa8l/7vSbYW04oReUQr68/0h6eyW3
X-Gm-Gg: ASbGncs0D0IhfgYyDEOkhB0ntYrOOrqls3oo4RUo7gmwbwZEVx7Jg8dCily06akewxN
	tyqOFv775CGGr7eqDISDvNmsdwgwHmr9qSOwdBhz13UbSxqge9TabF/+cfAz0SjzD7XaDg0Jdl3
	70eU9Ra+Hdtozs3zbvOCIvoQo7hjNEjuhDiOSg0ul59NFqWF7djOks7Y/7MpP3cOdSuIg7QJxwk
	5EOhS56gurizO4Yh1sSj3LsIx56e7NWlQLuq8zCNMHql33+QqQ2ItsPcWCQve1pZZbUcoXObBsU
	AurLU+zNewvLo1kj1ZU/eWH17qK3PVQX8iIcqovOaVLv/fhONgg1HUCos55t+dAJqMDBQWF4xzW
	dEkH/lUO1+8IASjVhdCoEANLSDgm5on/ddw0gWx/Y36kqBA==
X-Google-Smtp-Source: AGHT+IEDa6tvg1rt6KuF8z3CjhR8LE4zJ2EbWSHFBXC3UM1e+55KkCIof4asvo7T5VYqt1adsQl70A==
X-Received: by 2002:a17:90b:38c4:b0:328:192:b7a0 with SMTP id 98e67ed59e1d1-32d43f5c4c6mr263586a91.19.1757104931508;
        Fri, 05 Sep 2025 13:42:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329b3e28a10sm15122281a91.18.2025.09.05.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/17] hwmon: (ina238) Simplify voltage register accesses
Date: Fri,  5 Sep 2025 13:41:48 -0700
Message-ID: <20250905204159.2618403-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate voltage LSB values in the probe function and use throughout
the code.

Use a single function to read all voltages, independently of the register
width. Use the pre-calculated LSB values to convert register values to
voltages and do not rely on runtime chip specific code.

Use ROUND_CLOSEST functions instead of divide operations to reduce
rounding errors.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 161 ++++++++++++++---------------------------
 1 file changed, 53 insertions(+), 108 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 316a7dc720f5..ae27ae2582f2 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -101,9 +101,11 @@
 #define INA238_CALIBRATION_VALUE	16384
 #define INA238_FIXED_SHUNT		20000
 
-#define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
-#define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
+#define INA238_SHUNT_VOLTAGE_LSB	5000	/* 5 uV/lsb, in nV */
+#define INA238_BUS_VOLTAGE_LSB		3125000	/* 3.125 mV/lsb, in nV */
+#define SQ52206_BUS_VOLTAGE_LSB		3750000	/* 3.75 mV/lsb, in nV */
+
+#define NUNIT_PER_MUNIT		1000000	/* n[AV] -> m[AV] */
 
 static const struct regmap_config ina238_regmap_config = {
 	.max_register = INA238_REGISTERS,
@@ -118,9 +120,9 @@ struct ina238_config {
 	bool has_power_highest;		/* chip detection power peak */
 	bool has_energy;		/* chip detection energy */
 	u8 temp_resolution;		/* temperature register resolution in bit */
-	u32 power_calculate_factor;	/* fixed parameter for power calculation, from datasheet */
 	u16 config_default;		/* Power-on default state */
-	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
+	u32 power_calculate_factor;	/* fixed parameter for power calculation, from datasheet */
+	u32 bus_voltage_lsb;		/* bus voltage LSB, in nV */
 	int current_lsb;		/* current LSB, in uA */
 };
 
@@ -131,6 +133,7 @@ struct ina238_data {
 	struct regmap *regmap;
 	u32 rshunt;
 	int gain;
+	u32 voltage_lsb[2];		/* shunt, bus voltage LSB, in nV */
 	int current_lsb;		/* current LSB, in uA */
 	int power_lsb;			/* power LSB, in uW */
 	int energy_lsb;			/* energy LSB, in uJ */
@@ -226,45 +229,28 @@ static int ina238_read_field_s20(const struct i2c_client *client, u8 reg, s32 *v
 	return 0;
 }
 
-static int ina228_read_shunt_voltage(struct device *dev, u32 attr, int channel,
-				     long *val)
+static int ina228_read_voltage(struct ina238_data *data, int channel, long *val)
 {
-	struct ina238_data *data = dev_get_drvdata(dev);
-	int regval;
-	int err;
+	int reg = channel ? INA238_BUS_VOLTAGE : INA238_SHUNT_VOLTAGE;
+	u32 lsb = data->voltage_lsb[channel];
+	u32 factor = NUNIT_PER_MUNIT;
+	int err, regval;
 
-	err = ina238_read_field_s20(data->client, INA238_SHUNT_VOLTAGE, &regval);
-	if (err)
-		return err;
+	if (data->config->has_20bit_voltage_current) {
+		err = ina238_read_field_s20(data->client, reg, &regval);
+		if (err)
+			return err;
+		/* Adjust accuracy: LSB in units of 500 pV */
+		lsb /= 8;
+		factor *= 2;
+	} else {
+		err = regmap_read(data->regmap, reg, &regval);
+		if (err)
+			return err;
+		regval = (s16)regval;
+	}
 
-	/*
-	 * gain of 1 -> LSB / 4
-	 * This field has 16 bit on ina238. ina228 adds another 4 bits of
-	 * precision. ina238 conversion factors can still be applied when
-	 * dividing by 16.
-	 */
-	*val = (regval * INA238_SHUNT_VOLTAGE_LSB) * data->gain / (1000 * 4) / 16;
-	return 0;
-}
-
-static int ina228_read_bus_voltage(struct device *dev, u32 attr, int channel,
-				   long *val)
-{
-	struct ina238_data *data = dev_get_drvdata(dev);
-	int regval;
-	int err;
-
-	err = ina238_read_field_s20(data->client, INA238_BUS_VOLTAGE, &regval);
-	if (err)
-		return err;
-
-	/*
-	 * gain of 1 -> LSB / 4
-	 * This field has 16 bit on ina238. ina228 adds another 4 bits of
-	 * precision. ina238 conversion factors can still be applied when
-	 * dividing by 16.
-	 */
-	*val = (regval * data->config->bus_voltage_lsb) / 1000 / 16;
+	*val = DIV_S64_ROUND_CLOSEST((s64)regval * lsb, factor);
 	return 0;
 }
 
@@ -272,18 +258,16 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 			  long *val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
-	int reg, mask;
+	int reg, mask = 0;
 	int regval;
 	int err;
 
+	if (attr == hwmon_in_input)
+		return ina228_read_voltage(data, channel, val);
+
 	switch (channel) {
 	case 0:
 		switch (attr) {
-		case hwmon_in_input:
-			if (data->config->has_20bit_voltage_current)
-				return ina228_read_shunt_voltage(dev, attr, channel, val);
-			reg = INA238_SHUNT_VOLTAGE;
-			break;
 		case hwmon_in_max:
 			reg = INA238_SHUNT_OVER_VOLTAGE;
 			break;
@@ -304,11 +288,6 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		break;
 	case 1:
 		switch (attr) {
-		case hwmon_in_input:
-			if (data->config->has_20bit_voltage_current)
-				return ina228_read_bus_voltage(dev, attr, channel, val);
-			reg = INA238_BUS_VOLTAGE;
-			break;
 		case hwmon_in_max:
 			reg = INA238_BUS_OVER_VOLTAGE;
 			break;
@@ -335,72 +314,35 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 	if (err < 0)
 		return err;
 
-	switch (attr) {
-	case hwmon_in_input:
-	case hwmon_in_max:
-	case hwmon_in_min:
-		/* signed register, value in mV */
-		regval = (s16)regval;
-		if (channel == 0)
-			/* gain of 1 -> LSB / 4 */
-			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
-				data->gain / (1000 * 4);
-		else
-			*val = (regval * data->config->bus_voltage_lsb) / 1000;
-		break;
-	case hwmon_in_max_alarm:
-	case hwmon_in_min_alarm:
+	if (mask)
 		*val = !!(regval & mask);
-		break;
-	}
+	else
+		*val = DIV_S64_ROUND_CLOSEST((s64)(s16)regval * data->voltage_lsb[channel],
+					     NUNIT_PER_MUNIT);
 
 	return 0;
 }
 
-static int ina238_write_in(struct device *dev, u32 attr, int channel,
-			   long val)
+static int ina238_write_in(struct device *dev, u32 attr, int channel, long val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
+	static const int low_limits[2] = {-164, 0};
+	static const int high_limits[2] = {164, 150000};
+	static const u8 low_regs[2] = {INA238_SHUNT_UNDER_VOLTAGE, INA238_BUS_UNDER_VOLTAGE};
+	static const u8 high_regs[2] = {INA238_SHUNT_OVER_VOLTAGE, INA238_BUS_OVER_VOLTAGE};
 	int regval;
 
-	if (attr != hwmon_in_max && attr != hwmon_in_min)
-		return -EOPNOTSUPP;
+	/* Initial clamp to avoid overflows */
+	val = clamp_val(val, low_limits[channel], high_limits[channel]);
+	val = DIV_S64_ROUND_CLOSEST((s64)val * NUNIT_PER_MUNIT, data->voltage_lsb[channel]);
+	/* Final clamp to register limits */
+	regval = clamp_val(val, S16_MIN, S16_MAX) & 0xffff;
 
-	/* convert decimal to register value */
-	switch (channel) {
-	case 0:
-		/* signed value, clamp to max range +/-163 mV */
-		regval = clamp_val(val, -163, 163);
-		regval = (regval * 1000 * 4) /
-			 (INA238_SHUNT_VOLTAGE_LSB * data->gain);
-		regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xffff;
-
-		switch (attr) {
-		case hwmon_in_max:
-			return regmap_write(data->regmap,
-					    INA238_SHUNT_OVER_VOLTAGE, regval);
-		case hwmon_in_min:
-			return regmap_write(data->regmap,
-					    INA238_SHUNT_UNDER_VOLTAGE, regval);
-		default:
-			return -EOPNOTSUPP;
-		}
-	case 1:
-		/* signed value, positive values only. Clamp to max 102.396 V */
-		regval = clamp_val(val, 0, 102396);
-		regval = (regval * 1000) / data->config->bus_voltage_lsb;
-		regval = clamp_val(regval, 0, S16_MAX);
-
-		switch (attr) {
-		case hwmon_in_max:
-			return regmap_write(data->regmap,
-					    INA238_BUS_OVER_VOLTAGE, regval);
-		case hwmon_in_min:
-			return regmap_write(data->regmap,
-					    INA238_BUS_UNDER_VOLTAGE, regval);
-		default:
-			return -EOPNOTSUPP;
-		}
+	switch (attr) {
+	case hwmon_in_min:
+		return regmap_write(data->regmap, low_regs[channel], regval);
+	case hwmon_in_max:
+		return regmap_write(data->regmap, high_regs[channel], regval);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -812,6 +754,9 @@ static int ina238_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	data->voltage_lsb[0] = INA238_SHUNT_VOLTAGE_LSB * data->gain / 4;
+	data->voltage_lsb[1] = data->config->bus_voltage_lsb;
+
 	if (data->config->current_lsb)
 		data->current_lsb = data->config->current_lsb;
 	else
-- 
2.45.2

