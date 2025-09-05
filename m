Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F62D47E6;
	Fri,  5 Sep 2025 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104931; cv=none; b=IxyoDnO/5PuxhkhjVSNkZs9Wh0PIgrRyBs6TWTYm0fyEyggxsP3WvvdOUcHp1u8sBdUdKxqieTl3vzcl6T0wqmA6mufEULmmB25pg6DNbVJjwxDxyEzeJ0LrBQQCN8/167Sj01CFJVTABXI5MoZRG+2X+Tpg0Muwa2nO8Tmo84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104931; c=relaxed/simple;
	bh=exm9ayemrddL2Wb38ENB5zIsASLh0gSzOE6hO3dysqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyShGiswQfcamIxMblaIkW6hmkpl6slL71V/ykvDI7Bm8F48WjE3Vx5T+Tf0BdVVuX6pHF0RU/XzO2x28deL4saYHDos7Hi1hmP0IT1a3e4d+JrRAdhRfHlvUlJZzMB19iYlefJLWQcd4LgmSfl382eVbLulSnlaD+Sextf2QqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRFV/u0k; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRFV/u0k"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32326793a85so1886404a91.1;
        Fri, 05 Sep 2025 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104929; x=1757709729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qorskmo5XpOs4/4KT0m02w1ESA/5zUfGHp4YZm5aqSU=;
        b=HRFV/u0kSG//eADDL6UXu7WPwxlIP5pk9KjiuikxYrIUUttKh4S1X+gQXadiLddWVn
         3nLmJ+CeJvbRzgjHFFRUUMNMM8LfC89zfvvkdYsh95gKBnQ7VEYnLXm3ZO665DWLZYnS
         6QXEgu0ekeueXmot0pVuEKWz9uOyEcUleNSHGfce4eR9BHytC2vVB0Wbs0g3YF5va+2W
         CRhiQe3eqSLOvJuPuWSRBg9ovNGe7h7P29AcsLdi/dSWpshlQrTDO3AdcaUOIKNMy9GJ
         ksSdCMkHNObunm+1f9FHXXyvDmB5V7O7JBSH0Ccalzd+ITVopjWkLsKvC/qCQcsQQIrP
         74uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104929; x=1757709729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qorskmo5XpOs4/4KT0m02w1ESA/5zUfGHp4YZm5aqSU=;
        b=Dm+UxSAKPTuDS6sC78g8U4WIW1dXXtCOxToR7DTokw5214Pfg0WzB2tD0nNILMkDtQ
         uu4RjKku1ykH1zYVuLvXrAz+SuZYQE+ImNvPpMNbM0jC9W7e6f8LZpPctJ1ksZ5yr+fq
         nvsjuQGAKlMJPbt+Fv8oSLy83w6RTf5xhzUPhalBKCfHu/+x7icVYjj0D/y72cwU2X02
         ySxNXBHPAGN6rw2nYbpzCzJ1pI6kwwajQo0Eh8ugkeUVmFmTJMkT/LArNd6gooqYxL9D
         8Ztnnzw4NUScqCglB1JyVWY6ALdxHE76hShdeYEeI536FWDjE5wHSaICU2JPIb5x3Q+A
         T3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXM6+h5yAkAogNMyQGwTjZvQbEW295fxXzv5k9KpOn31Orra7hGYUrVQ/1Hmp5HYFgGJLSICbJPMIU3@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEKgJ8HVzp1duTNZh3Mrxh+TRlcoaH6ruNn0OUmxPe/kAcbKP
	AU+kEWwGL8M+hGYzHGosryTLEwCvfDEQICMxo+e5kGMzh7i14s83TWUOM/Ktwatd
X-Gm-Gg: ASbGncsSQBnUbOTif2fq8EJfZfcgt6X9uaWwYKoFtxjhcKYnEdPxYyaQJ+N1dvrjXlf
	xLZhHGXTd9GbaA35ar6ZGVHo3HN68URQr1PmBbsWbrnP1jwWngw2NjWGTOBB/kSeF2KrQ6II00y
	/dHcjPzK/P6Rt6dgeFV3YAm0R3iL6Q+HhDo0+IjynlkZneKPkEuAzY8RcuiRCAGHuyiJfjH1GfM
	rD0rTuW+jSzfl7kcvCQl6CvoCf4y1AaRbQNb2hLdaulARfkHk2A/zHwD/qadkITWItOsTanmpYP
	Gcwwlhl535BLUyKDCeZfa2o7l70xYL/VsptG+3ikBEal3/jikDpiJ+7x/3I2jhuDnTxXStgl7Ch
	VJ9zvfhEwuLg4HIOAjHKHqTpiu9uP0yFQ2Q0F5opzwj/+YK968L9YAeGp
X-Google-Smtp-Source: AGHT+IH6eVKH6ft5lYyNDEUUcAaq8uFZ0jSZ2MFhW2i7wMRgL85SZ4GkU5c95/gzAA90Jcjikx8p3w==
X-Received: by 2002:a17:90b:1d4c:b0:32c:c40e:db12 with SMTP id 98e67ed59e1d1-32d43f973e6mr284788a91.17.1757104928858;
        Fri, 05 Sep 2025 13:42:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b9120cef8sm2576889a91.0.2025.09.05.13.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/17] hwmon: (ina238) Rework and simplify temperature calculations
Date: Fri,  5 Sep 2025 13:41:46 -0700
Message-ID: <20250905204159.2618403-5-linux@roeck-us.net>
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

The temperature register is 16 bit wide for all chips. The decimal point
is at the same location (bit 7 = 1 degree C). That means we can use the
resolution to calculate temperatures. Do that to simplify the code.

There is only a single writeable temperature attribute, and it is very
unlikely that the chips supported by this driver will ever require another
one. That means checking for that attribute in the write function is
unnecessary.  Drop the check. Rename the write function from
ina238_write_temp() to ina238_write_temp_max() to reflect that a single
attribute is written.

Also extend the accepted temperature value range to the range supported by
the chip registers. Limiting the accepted value range to the temperature
range supported by the chip would make it impossible to read an
out-of-range limit from the chip and to write the same value back into it.
This is undesirable, especially since the maximum temperature register does
contain the maximum register value after a chip reset, not the temperature
limit supported by the chip.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 52 +++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 23195dead74f..e386a0f83fbb 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -103,10 +103,7 @@
 
 #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
 #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define INA238_DIE_TEMP_LSB		1250000 /* 125.0000 mC/lsb */
 #define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
-#define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
-#define INA228_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
 static const struct regmap_config ina238_regmap_config = {
 	.max_register = INA238_REGISTERS,
@@ -120,11 +117,10 @@ struct ina238_config {
 	bool has_20bit_voltage_current; /* vshunt, vbus and current are 20-bit fields */
 	bool has_power_highest;		/* chip detection power peak */
 	bool has_energy;		/* chip detection energy */
-	u8 temp_shift;			/* fixed parameters for temp calculate */
+	u8 temp_resolution;		/* temperature register resolution in bit */
 	u32 power_calculate_factor;	/* fixed parameters for power calculate */
 	u16 config_default;		/* Power-on default state */
 	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
-	int temp_lsb;			/* use for temperature calculate */
 };
 
 struct ina238_data {
@@ -141,41 +137,37 @@ static const struct ina238_config ina238_config[] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = false,
 		.has_power_highest = false,
-		.temp_shift = 4,
 		.power_calculate_factor = 20,
 		.config_default = INA238_CONFIG_DEFAULT,
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
-		.temp_lsb = INA238_DIE_TEMP_LSB,
+		.temp_resolution = 12,
 	},
 	[ina237] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = false,
 		.has_power_highest = false,
-		.temp_shift = 4,
 		.power_calculate_factor = 20,
 		.config_default = INA238_CONFIG_DEFAULT,
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
-		.temp_lsb = INA238_DIE_TEMP_LSB,
+		.temp_resolution = 12,
 	},
 	[sq52206] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = true,
 		.has_power_highest = true,
-		.temp_shift = 0,
 		.power_calculate_factor = 24,
 		.config_default = SQ52206_CONFIG_DEFAULT,
 		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
-		.temp_lsb = SQ52206_DIE_TEMP_LSB,
+		.temp_resolution = 16,
 	},
 	[ina228] = {
 		.has_20bit_voltage_current = true,
 		.has_energy = true,
 		.has_power_highest = false,
-		.temp_shift = 0,
 		.power_calculate_factor = 20,
 		.config_default = INA238_CONFIG_DEFAULT,
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
-		.temp_lsb = INA228_DIE_TEMP_LSB,
+		.temp_resolution = 16,
 	},
 };
 
@@ -522,6 +514,11 @@ static int ina238_write_power_max(struct device *dev, long val)
 	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
 }
 
+static int ina238_temp_from_reg(s16 regval, u8 resolution)
+{
+	return ((regval >> (16 - resolution)) * 1000) >> (resolution - 9);
+}
+
 static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
@@ -533,17 +530,14 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
 		if (err)
 			return err;
-		/* Signed, result in mC */
-		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
-			       (s64)data->config->temp_lsb, 10000);
+		*val = ina238_temp_from_reg(regval, data->config->temp_resolution);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
 		if (err)
 			return err;
 		/* Signed, result in mC */
-		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
-			       (s64)data->config->temp_lsb, 10000);
+		*val = ina238_temp_from_reg(regval, data->config->temp_resolution);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -559,19 +553,21 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 	return 0;
 }
 
-static int ina238_write_temp(struct device *dev, u32 attr, long val)
+static u16 ina238_temp_to_reg(long val, u8 resolution)
+{
+	int fraction = 1000 - DIV_ROUND_CLOSEST(1000, BIT(resolution - 9));
+
+	val = clamp_val(val, -255000 - fraction, 255000 + fraction);
+
+	return (DIV_ROUND_CLOSEST(val << (resolution - 9), 1000) << (16 - resolution)) & 0xffff;
+}
+
+static int ina238_write_temp_max(struct device *dev, long val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
 	int regval;
 
-	if (attr != hwmon_temp_max)
-		return -EOPNOTSUPP;
-
-	/* Signed */
-	val = clamp_val(val, -40000, 125000);
-	regval = div_s64(val * 10000, data->config->temp_lsb) << data->config->temp_shift;
-	regval = clamp_val(regval, S16_MIN, S16_MAX) & (0xffff << data->config->temp_shift);
-
+	regval = ina238_temp_to_reg(val, data->config->temp_resolution);
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
 
@@ -628,7 +624,7 @@ static int ina238_write(struct device *dev, enum hwmon_sensor_types type,
 		err = ina238_write_power_max(dev, val);
 		break;
 	case hwmon_temp:
-		err = ina238_write_temp(dev, attr, val);
+		err = ina238_write_temp_max(dev, val);
 		break;
 	default:
 		err = -EOPNOTSUPP;
-- 
2.45.2

