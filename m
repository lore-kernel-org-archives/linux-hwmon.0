Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382193C5856
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772995; cv=none; b=O25ddi8EUlfxGhND1/Xb3M7yQcdkAYfKDXW7ZFJiHmPQNc7erIqCrXa/dPp+AfOT8n7JX4ZIqVIo10qeAfY+tQwHj6XPEypMW0wRpPK1R5nvb7BITCZW987ZpmryBTB+/w3dpdb2hNO9ayNVrPWsKOY8VpA/3/a/+Z9HKHwKzgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772995; c=relaxed/simple;
	bh=1dp3SmyE831xL+mns9IpXdxT6sq3b1fQUcLhPyTf0EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRn611HSB64uLJXbN1f7YIwlQQZLAEUMmdP+nDcsnyO/jepAats5yxiPIfGoh6ExFq9C5uqD+COLuONGG19F5eUC+sBbeZiJCUDil79vx3b9RsYWzkr13W6rPlemqEGu5lk6mrDreUAFh10hu9iV05zxvFbATOm5g5y8CiusZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMA1Q2n5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMA1Q2n5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso11945345e9.2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 05:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772993; x=1784377793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbVEnzjWI1ZsVis820NNcB8r8Sth23L8JVyn21VtwiA=;
        b=lMA1Q2n5SHf0sgRfiqt30Ck7NZ/zXjxszETjQ0jvdiXb1bHcJTAskjZWkCrvQIkgCk
         I4ECFV6kfvxx5hvRlvJjb/qF4GsG8zKHrYQ+fnvNFc+ZflFrqw69LflLOq+ownEnrdjB
         kJq46YeTepTQgJsJyn1w6XDSO+hdKos23jSZ1oqk9PM/+InqLR8XIUNj+Ato/7CSSQsk
         u1ULzCU7DtU2aNymoO2GPQ+nbyadsofpPA1SPE2beNPnZbHnFWemJXPQy3inWaZq2DxL
         kRUJUFQsaZDRixrilBGqI8XcP7zENaz1bx5BUom4KBz41vcbRKVof8m6H65KkvsQWAA1
         clIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772993; x=1784377793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbVEnzjWI1ZsVis820NNcB8r8Sth23L8JVyn21VtwiA=;
        b=i2zuD2VfKk/00xKk94WyMM+nhpwjRks6hWKPzCm7asuorHpLySbsKwNQrgDwXWDVI2
         GJny6jZ5Ood7eY980Bauao0KYGLgcGPck1H7cjX2m0AHkyER6OnFgtIILuC/1rqTdPV/
         VuEkSUQZ5gthj1Wben/BLhGW9c3mMlFasgkqBrm8M6SBnrYasTphmQwbUxhtSk1RKikY
         f2YcDi/5npDGsDeXCcrbPGUDtbCOjD98X4PyuiD8ewiXxWcIUBqPd1wjPNF9nQ+4HJ5I
         GIhODDsigi8/sUKY06mHRXhnsY84Xzxue6HI+HbOi1i7pvqCD6u9B5oZIm66fHtTy+Hw
         BUBw==
X-Forwarded-Encrypted: i=1; AHgh+RoMDXOvaqRpsWbGicyejXBMyhq3Wgy8aOSkyD38uk9Hqm6Z/D6gTv1OiJXl40VFXaK/w28JjV43UNEL6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFQz9FNZRZhoXndr6P5OPT/4KZyczAQOgl2wpYoLiZZo0rrgd
	k5E36ZT0jJWBWdKg90m2viNRdlGAiIPh0UVldEG8qxV+HRY5qzATNWwC
X-Gm-Gg: AfdE7cmdWTBKi4alahwAZy6VETKrIXfxaPhkQD9Zda6x0dhwLT5PjLfYVoZM+bdb7m8
	raojbQPAtNpHukOYn361h8KTEDdvXP+HRCD/HU/3w03F45fZqyezldXODZugbVOWVcmuwGXhmix
	S7Qai/L1fJcxNw1CQNbgeQsrMl9Cp5NVwGYH2ksX1Dwuyp3I988higUCYtQ9A90Xp6WMJFDUD/t
	h5Ir+C6/5GvEymwEVn+bKNtT4BXBsrBjkCppEl+OvhdmqkvRzmbgJK8GqXraH3IBW21vZ1cZF/m
	sfAzbPSjAM+WnGX4ZGZtMvVk2wVSVi+azmJzgqUssb37UcsmcgYtr9urVcG6fYvCIu/cxEbf1yo
	d1VZX00u8xENZjgAzvAgKQ8/SSI3LEhRo+WiwAwpd52SpVN3gHtGof9EScWDEmbLKoxo7TPLdOM
	lgXrxqdbzyi1kavF0RLMClKOEg6k+3WAw=
X-Received: by 2002:a05:600c:310f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-493f87d6196mr21397935e9.5.1783772992361;
        Sat, 11 Jul 2026 05:29:52 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm68964718f8f.15.2026.07.11.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:29:51 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/1] hwmon: (asus-ec-sensors) detect unconnected physical sensors
Date: Sat, 11 Jul 2026 14:26:44 +0200
Message-ID: <20260711122937.594989-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711122937.594989-1-eugene.shalygin@gmail.com>
References: <20260711122937.594989-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there is no physical sensor connected to the motherboard
socket,reading EC register returns one of the special values
(-62, -60, -40). Test for them  and return -ENODATA to hwmon.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 49 ++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..3936006adeb6 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -185,6 +185,20 @@ enum ec_sensors {
 #define SENSOR_TEMP_SENSOR_EXTRA_2 BIT(ec_sensor_temp_sensor_extra_2)
 #define SENSOR_TEMP_SENSOR_EXTRA_3 BIT(ec_sensor_temp_sensor_extra_3)
 
+/*
+ * The values for temperature sensor readings without physical sensors connected.
+ * The value varies across generations and is seemingly defined by the EC chip
+ * used in the given board.
+ */
+static const s32 temperature_blank_values[] = {-62, -60, -40};
+
+static const s32 environment_temp_sensors =
+	SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_T_SENSOR_ALT1 |
+	SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT |
+	SENSOR_TEMP_WATER_BLOCK_IN | SENSOR_TEMP_WATER_BLOCK_OUT |
+	SENSOR_TEMP_T_SENSOR_2 | SENSOR_TEMP_SENSOR_EXTRA_1 |
+	SENSOR_TEMP_SENSOR_EXTRA_2 | SENSOR_TEMP_SENSOR_EXTRA_3;
+
 enum board_family {
 	family_unknown,
 	family_amd_400_series,
@@ -955,6 +969,7 @@ static const struct dmi_system_id dmi_table[] = {
 };
 
 struct ec_sensor {
+	/* this is ec_sensors enum value */
 	unsigned int info_index;
 	s32 cached_value;
 };
@@ -1047,6 +1062,12 @@ get_sensor_info(const struct ec_sensors_data *state, int index)
 	return state->sensors_info + state->sensors[index].info_index;
 }
 
+static enum ec_sensors
+get_ec_sensor_type(const struct ec_sensors_data *state, int index)
+{
+	return state->sensors[index].info_index;
+}
+
 static int find_ec_sensor_index(const struct ec_sensors_data *ec,
 				enum hwmon_sensor_types type, int channel)
 {
@@ -1291,6 +1312,17 @@ static int get_cached_value_or_update(const struct device *dev,
 	return 0;
 }
 
+static bool is_blank_temperature_value(s32 value)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(temperature_blank_values); ++i) {
+		if (value == temperature_blank_values[i])
+			return true;
+	}
+	return false;
+}
+
 /*
  * Now follow the functions that implement the hwmon interface
  */
@@ -1298,6 +1330,8 @@ static int get_cached_value_or_update(const struct device *dev,
 static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
+	const struct ec_sensor_info *sensor_info;
+	enum ec_sensors ec_sensor;
 	int ret;
 	s32 value = 0;
 
@@ -1309,12 +1343,19 @@ static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 
 	ret = get_cached_value_or_update(dev, sidx, state, &value);
-	if (!ret) {
-		*val = scale_sensor_value(value,
-					  get_sensor_info(state, sidx)->type);
+	if (ret)
+		return ret;
+
+	sensor_info = get_sensor_info(state, sidx);
+	if (sensor_info->type == hwmon_temp) {
+		ec_sensor = get_ec_sensor_type(state, sidx);
+		if ((environment_temp_sensors & BIT(ec_sensor)) &&
+		    is_blank_temperature_value(value))
+			return -ENODATA;
 	}
+	*val = scale_sensor_value(value, sensor_info->type);
 
-	return ret;
+	return 0;
 }
 
 static int asus_ec_hwmon_read_string(struct device *dev,
-- 
2.55.0

