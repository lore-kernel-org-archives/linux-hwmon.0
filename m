Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C52C21CB;
	Fri,  5 Sep 2025 20:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104932; cv=none; b=S5IWEEyUs2uoMdgGHmAH89pAIyj75EmzGIRQqyiGIgCZEyxmEuxXb6aJeK7IGTP4jdab3YrCNXhf51+3kjzErwRm2/kCZQKSQai82cZdPBuV5PaQQUwkok7TMm9FWe+Ne+AvxCNBYWfS79tlvMvggJ3XHxuSKQ7Oz3UyCMNR2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104932; c=relaxed/simple;
	bh=vNMAVBcOQEkLY7FHQtBaOO45nrS0Dp9HdXdB4gRw/Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uji7cpKpzlqhuDKTrdxJiBbgBcOgasiCiHtvI44HfFl5ropZYn2TyMSjHxhM2pnhvIEOAdntoOnDLa/UV3zJZk25mGGO0LlyRT4ZeDlv5CGHbZ+OoSAOm4Ly7l/G5ig5KrHjuL+rnhX3tgz4Wu6W+wLgooSwI1OU1Wk+6lOrv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnUqgvkR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnUqgvkR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24cdd95c422so12797625ad.0;
        Fri, 05 Sep 2025 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104930; x=1757709730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUVx3Z9Dat9ipVoA2NYXPpF/py7T4wRVdUeiFbHJ+Xw=;
        b=TnUqgvkRDVRk3pSCpRGuYUiRar9BWXGoCQTTQpjzZTIZATMAmXepObn4e7yRi+j+yw
         65kWW+WhfRWor7XbMY5O767p/mLxYHfzw3f96NYzW5c/CoqiI439cDKhOdrqE1ZwjUsi
         bOazxnM4NV8OrgzyuOGjCv4qSpw9Yb1PgpTvIuOya5RyAAvRJVkNwZT92abC7J++lzkX
         p8PmjxkW7WL2SOnEPfK8ZLChL4Px42yUiPoRKx5h9njWwhYqvB4pJTCM9Zi0KMCbbS6o
         btogaTNSLF72Q8H0M56e3rD9eUTG1msvsgKWS+mq2xdG4qjuOsGMTrIwn9/R9S7IWQzN
         Z9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104930; x=1757709730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FUVx3Z9Dat9ipVoA2NYXPpF/py7T4wRVdUeiFbHJ+Xw=;
        b=JNAl2S//9/4fyNVwIoak3YQLfOvMnIn4MyHVUD9TXvRyW72FBTqkeXEZNh7sVbgZ+3
         JXu+HzUzAHDOVEJagohNH8Xi7zPtOc2YTpOXh8GIoS3gkzcE6gSY8CKPRR+lXu7BveBT
         25NQfn1E7+A1YoyJmKgVF7XH+owZjWJtBQCRQpicIqlSr1m3vCXTHz9YtQNtJkPzIJNe
         6tzgk9rwieNcmg3Hfi0JAAp1Ye6qRorI9Rr100rLiQ70vgpmWm/buwQo1AA1np51bGRO
         RJNXQ/6ia50rtXJlMQPOVqcgNQ/tb57blmOq1H73XcWoGQWlH9+POJi59PGR2OM7cu7h
         U89A==
X-Forwarded-Encrypted: i=1; AJvYcCUoGdDWThRgPV+pqcdwK44SFNktzWQsClJDHmz8jt4isd/Y4xOTQOVFVEECi3xBAM5w3qk6PWJ+uRLi@vger.kernel.org
X-Gm-Message-State: AOJu0YxC8rO9CUWXSTGmIH0xijQfr4fazXXK/MjUZaWSPAwzRLKLYdjX
	0Op+xPzsi2PZvOh2NtmEtXz3tCqzJcbnX0q1PaVKi6rep2iireOlFl0pTDEq20dK
X-Gm-Gg: ASbGncvl067+BEo+Pg1jyCOlO9wREOnMEuXml+dCkw3S2tujB75OSeBuTy7z6TjgAI+
	f+zIVz+SaHPQZd77Wc2nMcpwZXnFOD+MmF1hjbJfuVQTBqKlsM0iT8ZtCWAT2SWi/pPzX3prE6Z
	gBB+OnfWjJovrRSsK1JlNrsrAq1taHbRqzQZWnLLdNTdx/LhwUYWHVx+pDTbIC/4YFgrflgozVG
	L9Q8ogahA+mT56CkEglckHNcx5DhqGgEqWW7Ojs9upjj3iCSUIkPCEnbXY1gyuf0kfrvazoWHq4
	IvOvkDDdxe62EUJ3KNPgmpqrs3yQp4TfISd52XHueviUKK/a5OqbEUxvAvSNe+1bzHT6G0eLFkh
	xBhIRmGwu6Hq2EOGuU+dB5H2QcYuovntQy6A=
X-Google-Smtp-Source: AGHT+IHVVkDRfoYr8oPZ0TSeWO875eWQSnKA9pF4riEPL76mbImrouJQjuNhLEaiIZAfh4IsdN9exA==
X-Received: by 2002:a17:902:d4cc:b0:24e:af92:70c2 with SMTP id d9443c01a7336-2516f240f23mr433875ad.24.1757104930169;
        Fri, 05 Sep 2025 13:42:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e5ad5sm23934551a91.18.2025.09.05.13.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/17] hwmon: (ina238) Pre-calculate current, power, and energy LSB
Date: Fri,  5 Sep 2025 13:41:47 -0700
Message-ID: <20250905204159.2618403-6-linux@roeck-us.net>
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

Current, power, and energy LSB do not change during runtime, so we can
pre-calculate the respective values. The power LSB can be derived from
the current LSB using the equation in the datasheets. Similar, the
energy LSB can be derived from the power LSB.

Also add support for chips with built-in shunt resistor by providing
a chip specific configuration parameter for the current LSB. The
relationship of current -> power -> energy LSB values in those chips
is the same as in chips with external shunt resistor, so configuration
parameters for power and energy LSB are not needed.

Use ROUND_CLOSEST functions instead of divide operations to reduce
rounding errors.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 47 ++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index e386a0f83fbb..316a7dc720f5 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -118,9 +118,10 @@ struct ina238_config {
 	bool has_power_highest;		/* chip detection power peak */
 	bool has_energy;		/* chip detection energy */
 	u8 temp_resolution;		/* temperature register resolution in bit */
-	u32 power_calculate_factor;	/* fixed parameters for power calculate */
+	u32 power_calculate_factor;	/* fixed parameter for power calculation, from datasheet */
 	u16 config_default;		/* Power-on default state */
 	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
+	int current_lsb;		/* current LSB, in uA */
 };
 
 struct ina238_data {
@@ -130,6 +131,9 @@ struct ina238_data {
 	struct regmap *regmap;
 	u32 rshunt;
 	int gain;
+	int current_lsb;		/* current LSB, in uA */
+	int power_lsb;			/* power LSB, in uW */
+	int energy_lsb;			/* energy LSB, in uJ */
 };
 
 static const struct ina238_config ina238_config[] = {
@@ -422,9 +426,8 @@ static int ina238_read_current(struct device *dev, u32 attr, long *val)
 			regval = (s16)regval;
 		}
 
-		/* Signed register, fixed 1mA current lsb. result in mA */
-		*val = div_s64((s64)regval * INA238_FIXED_SHUNT * data->gain,
-			       data->rshunt * 4);
+		/* Signed register. Result in mA */
+		*val = DIV_S64_ROUND_CLOSEST((s64)regval * data->current_lsb, 1000);
 
 		/* Account for 4 bit offset */
 		if (data->config->has_20bit_voltage_current)
@@ -450,9 +453,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		if (err)
 			return err;
 
-		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
-				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
+		power = (long long)regval * data->power_lsb;
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -461,9 +462,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		if (err)
 			return err;
 
-		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
-				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
+		power = (long long)regval * data->power_lsb;
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -476,8 +475,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT * data->gain *
-				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
+		power = ((long long)regval << 8) * data->power_lsb;
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -498,7 +496,6 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 static int ina238_write_power_max(struct device *dev, long val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
-	long regval;
 
 	/*
 	 * Unsigned postive values. Compared against the 24-bit power register,
@@ -506,12 +503,11 @@ static int ina238_write_power_max(struct device *dev, long val)
 	 * register.
 	 * The first clamp_val() is to establish a baseline to avoid overflows.
 	 */
-	regval = clamp_val(val, 0, LONG_MAX / 2);
-	regval = div_u64(regval * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
-			1000ULL * INA238_FIXED_SHUNT * data->gain);
-	regval = clamp_val(regval >> 8, 0, U16_MAX);
+	val = clamp_val(val, 0, LONG_MAX / 2);
+	val = DIV_ROUND_CLOSEST(val, data->power_lsb);
+	val = clamp_val(val >> 8, 0, U16_MAX);
 
-	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
+	return regmap_write(data->regmap, INA238_POWER_LIMIT, val);
 }
 
 static int ina238_temp_from_reg(s16 regval, u8 resolution)
@@ -584,8 +580,7 @@ static ssize_t energy1_input_show(struct device *dev,
 		return ret;
 
 	/* result in uJ */
-	energy = div_u64(regval * INA238_FIXED_SHUNT * data->gain * 16 * 10 *
-			 data->config->power_calculate_factor, 4 * data->rshunt);
+	energy = regval * data->energy_lsb;
 
 	return sysfs_emit(buf, "%llu\n", energy);
 }
@@ -817,6 +812,18 @@ static int ina238_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	if (data->config->current_lsb)
+		data->current_lsb = data->config->current_lsb;
+	else
+		data->current_lsb = DIV_U64_ROUND_CLOSEST(250ULL * INA238_FIXED_SHUNT * data->gain,
+							  data->rshunt);
+
+	data->power_lsb = DIV_ROUND_CLOSEST(data->current_lsb *
+					    data->config->power_calculate_factor,
+					    100);
+
+	data->energy_lsb = data->power_lsb * 16;
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &ina238_chip_info,
 							 data->config->has_energy ?
-- 
2.45.2

