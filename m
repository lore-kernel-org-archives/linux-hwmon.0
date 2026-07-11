Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1654357D0A
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756688; cv=none; b=Waa3h7xKe4YSv7rC8h4MfNYBZFNdjUy7crBD0PScqt3gvjsRhp372Wosj9Ys2Q/M3bAcOkXA4Ezexl5CQukZZK2IOKvoZR5kqbK4UDd82GPRrvnBTmj8TY3S0KBulQ7wrsCrLGzw8oayE6DwAdSWxFxtfJ9PxPRNhNfie3jDSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756688; c=relaxed/simple;
	bh=hNw87PqzlkJNrhIIKSmJAnF91g6aT9u65DKBlsFgaOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V05+FerZC0WEfmLeuCtTOzjwwQ/5/HdvUQUN988kn37IYnPTON/jHefozkrlXT0FPInjGs6T4oh9mUVwbGpDCqQyZZeronG75MqGdJCTGub5LovSGzrvfcmEjnZb3aXKbJEfHLH+ai12PZhIJWbD7Y1/SnN2rZE7ZU/WPzFFk3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceaf8a1265so367705ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783756686; x=1784361486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=otUYxNlQRmM0TTQbpF3S5WfU++sJBtSuggopWwJsZxU=;
        b=IbavJaExM9cZdZ+Ovz7FIH1VqbbSzrAQ5Ij6gmZ4k5LLuc/NRzfLSFiTFIuHcUnXyF
         cPDMW7l32I9tDlDIIjBB4Nzsr6WHBor+8mQ5d2CSs26uKunLoBZvatqRX1ZXLqlDzHUd
         yutXWTCp1HqGaYZsKl5TrhXwhRsuQBxgH82MBUk6OMcNGpNonUOy9gzu+FiRWBEdHFNf
         i5v7Rr0BwLOfFMrl6Ton8WQvmFg0kBWHJnL0Qln99/FlEjxjlNwYKKvJk70yh0VqSj2Q
         JQhag/0eqePw+I+JKQeJRCWejPSJF+lZ5ZSxU5D8Tu5WXoY4o7Hu4kHb4s27A8QVsCww
         T0cw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy9deKFXxpn11+GtS8SEG9Ycbo/B33vcSECsOQD6ZuIsUM7qPMcEUHkmargVFvChcSEGurVqp4aGeFUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+alTRRj1wHYlIB1cPc/o7tCJb9lVYjUPgC93n0ioaGdkPRxqq
	HdcTet/Fg/LBnxDHuudHut5xZVnM/mREKC5JliG+uJ0AF7VARmiv9Pw=
X-Gm-Gg: AfdE7cmrUy5FWPOjphEj9LGBDj0DEsBroach04FeG3Aco+oKwd6J29fLektGLWaRuRz
	ELDvlRRZTxHZDVscJ6n0G5Gpx2sxWbEggUUY8ezvUYCGCDu6T2EvkedGwdtaRZTL7oXiIQVfhuB
	9DkTGH2S49iDA/LTFU2A893m2WqiIZn/1aLJQRIR9lkt7K94SJaPrBQYjrXylwR1y0vHvKA0j4G
	CFtQ/o4B1u2VqafBJRW4UiOgtnmGY+2yGfhd9S/ojuV0ZQCdjDyHFy8aF2vc1lB0IiOCgtVPSpN
	iPdCuGvj/IdTgouU/duBjzTi5x72eD60foDG+ZblmbdQEh9szPpsE5JuaPxxcM0pMDhXSakH2oQ
	ebPk5hkBY9SzL3OEIuEC6YwHhBMAsk6AiGcSRjDcD1AI5ai1wxbmMPXSpnAVe9eZNSwNOuD6nQ9
	wO8exUy3JPWey+kJwxCnMwwa9belcZPS+RbYQQ0XU6oCK98sS1YWUUKd9nLyiW8t4cBYSWTaUQN
	+L6zx4APAfjylGdFbtFu+7oOA==
X-Received: by 2002:a17:903:458f:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2ce9e9b4534mr21244925ad.11.1783756686247;
        Sat, 11 Jul 2026 00:58:06 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm71130285ad.45.2026.07.11.00.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:58:05 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v5 3/3] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 15:57:54 +0800
Message-Id: <20260711075754.11358-4-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711075754.11358-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy hwmon_device_register() function is deprecated and triggers
warnings in dmesg. Convert the driver to the modern
hwmon_device_register_with_info() API.

This conversion does the following:
- Dynamically allocates standard HWMON temp, fan, and pwm channels.
- Configures HWMON ops callbacks (.is_visible, .read, .read_string, .write).
- Standardizes attribute naming to match the HWMON ABI:
  - fanX_output -> fanX_target (HWMON_F_TARGET)
  - fanX_manual -> pwmX_enable (HWMON_PWM_ENABLE)
- Dynamically registers non-standard fanX_safe attributes under the HWMON
  class directory via extra_groups.
- Cleans up legacy sysfs nodes, groups, and unused show/store static functions
  to avoid unused symbol compiler warnings.
- Avoids recursive mutex deadlocks when writing to pwmX_enable by locklessly
  resolving the entry and invoking the underlying raw SMC read/write calls.
- Avoids UAF race condition on module exit by using unmanaged registration and
  explicitly calling hwmon_device_unregister() as the first step of applesmc_exit(),
  guaranteeing that HWMON nodes are destroyed before static structures are freed.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/hwmon/applesmc.c | 470 ++++++++++++++++++++++++++-------------
 1 file changed, 321 insertions(+), 149 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 317135fc4b73..bec9e9e98896 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -145,8 +145,8 @@ static s16 rest_x;
 static s16 rest_y;
 static u8 backlight_state[2];
 
-static struct device *hwmon_dev;
 static struct input_dev *applesmc_idev;
+static struct device *hwmon_dev;
 
 /*
  * Last index written to key_at_index sysfs file, and value to use for all other
@@ -822,33 +822,6 @@ static ssize_t applesmc_light_show(struct device *dev,
 	return sysfs_emit(sysfsbuf, "(%d,%d)\n", left, right);
 }
 
-/* Displays sensor key as label */
-static ssize_t applesmc_show_sensor_label(struct device *dev,
-			struct device_attribute *devattr, char *sysfsbuf)
-{
-	const char *key = smcreg.index[to_index(devattr)];
-
-	return sysfs_emit(sysfsbuf, "%s\n", key);
-}
-
-/* Displays degree Celsius * 1000 */
-static ssize_t applesmc_show_temperature(struct device *dev,
-			struct device_attribute *devattr, char *sysfsbuf)
-{
-	const char *key = smcreg.index[to_index(devattr)];
-	int ret;
-	s16 value;
-	int temp;
-
-	ret = applesmc_read_s16(key, &value);
-	if (ret)
-		return ret;
-
-	temp = 250 * (value >> 6);
-
-	return sysfs_emit(sysfsbuf, "%d\n", temp);
-}
-
 static ssize_t applesmc_show_fan_speed(struct device *dev,
 				struct device_attribute *attr, char *sysfsbuf)
 {
@@ -868,99 +841,6 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 	return sysfs_emit(sysfsbuf, "%u\n", speed);
 }
 
-static ssize_t applesmc_store_fan_speed(struct device *dev,
-					struct device_attribute *attr,
-					const char *sysfsbuf, size_t count)
-{
-	int ret;
-	unsigned long speed;
-	char newkey[5];
-	u8 buffer[2];
-
-	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
-		return -EINVAL;		/* Bigger than a 14-bit value */
-
-	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
-		  to_index(attr));
-
-	buffer[0] = (speed >> 6) & 0xff;
-	buffer[1] = (speed << 2) & 0xff;
-	ret = applesmc_write_key(newkey, buffer, 2);
-
-	if (ret)
-		return ret;
-	else
-		return count;
-}
-
-static ssize_t applesmc_show_fan_manual(struct device *dev,
-			struct device_attribute *attr, char *sysfsbuf)
-{
-	int ret;
-	u16 manual = 0;
-	u8 buffer[2];
-
-	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
-	if (ret)
-		return ret;
-
-	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
-	return sysfs_emit(sysfsbuf, "%d\n", manual);
-}
-
-static ssize_t applesmc_store_fan_manual(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *sysfsbuf, size_t count)
-{
-	int ret;
-	u8 buffer[2];
-	unsigned long input;
-	u16 val;
-
-	if (kstrtoul(sysfsbuf, 10, &input) < 0)
-		return -EINVAL;
-
-	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
-	if (ret)
-		goto out;
-
-	val = (buffer[0] << 8 | buffer[1]);
-
-	if (input)
-		val = val | (0x01 << to_index(attr));
-	else
-		val = val & ~(0x01 << to_index(attr));
-
-	buffer[0] = (val >> 8) & 0xFF;
-	buffer[1] = val & 0xFF;
-
-	ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
-
-out:
-	if (ret)
-		return ret;
-	else
-		return count;
-}
-
-static ssize_t applesmc_show_fan_position(struct device *dev,
-				struct device_attribute *attr, char *sysfsbuf)
-{
-	int ret;
-	char newkey[5];
-	u8 buffer[17];
-
-	scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, to_index(attr));
-
-	ret = applesmc_read_key(newkey, buffer, 16);
-	buffer[16] = 0;
-
-	if (ret)
-		return ret;
-
-	return sysfs_emit(sysfsbuf, "%s\n", buffer + 4);
-}
-
 static ssize_t applesmc_calibrate_show(struct device *dev,
 				struct device_attribute *attr, char *sysfsbuf)
 {
@@ -1108,22 +988,7 @@ static struct applesmc_node_group light_sensor_group[] = {
 	{ }
 };
 
-static struct applesmc_node_group fan_group[] = {
-	{ "fan%d_label", applesmc_show_fan_position },
-	{ "fan%d_input", applesmc_show_fan_speed, NULL, 0 },
-	{ "fan%d_min", applesmc_show_fan_speed, applesmc_store_fan_speed, 1 },
-	{ "fan%d_max", applesmc_show_fan_speed, NULL, 2 },
-	{ "fan%d_safe", applesmc_show_fan_speed, NULL, 3 },
-	{ "fan%d_output", applesmc_show_fan_speed, applesmc_store_fan_speed, 4 },
-	{ "fan%d_manual", applesmc_show_fan_manual, applesmc_store_fan_manual },
-	{ }
-};
 
-static struct applesmc_node_group temp_group[] = {
-	{ "temp%d_label", applesmc_show_sensor_label },
-	{ "temp%d_input", applesmc_show_temperature },
-	{ }
-};
 
 /* Module stuff */
 
@@ -1321,8 +1186,238 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, applesmc_whitelist);
 
+static struct applesmc_dev_attr *fan_safe_attrs;
+static struct attribute **fan_safe_attr_list;
+static struct attribute_group fan_safe_group;
+static const struct attribute_group *applesmc_extra_groups[2];
+
+static u32 *applesmc_temp_config;
+static u32 *applesmc_fan_config;
+static u32 *applesmc_pwm_config;
+static struct hwmon_channel_info *applesmc_info_temp;
+static struct hwmon_channel_info *applesmc_info_fan;
+static struct hwmon_channel_info *applesmc_info_pwm;
+static const struct hwmon_channel_info **applesmc_info_arr;
+static struct hwmon_chip_info *applesmc_chip;
+
+static void applesmc_free_hwmon(void)
+{
+	kfree(applesmc_temp_config);
+	kfree(applesmc_fan_config);
+	kfree(applesmc_pwm_config);
+	kfree(applesmc_info_temp);
+	kfree(applesmc_info_fan);
+	kfree(applesmc_info_pwm);
+	kfree(applesmc_info_arr);
+	kfree(applesmc_chip);
+	kfree(fan_safe_attrs);
+	kfree(fan_safe_attr_list);
+}
+
+static umode_t applesmc_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					 u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
+			return 0444;
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_label:
+		case hwmon_fan_max:
+			return 0444;
+		case hwmon_fan_min:
+		case hwmon_fan_target:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable)
+			return 0644;
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int applesmc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			const char *key = smcreg.index[channel];
+			s16 value;
+
+			ret = applesmc_read_s16(key, &value);
+			if (ret)
+				return ret;
+			*val = 250 * (value >> 6);
+			return 0;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input: {
+			char key[5];
+			u8 buffer[2];
+
+			scnprintf(key, sizeof(key), "F%dAc", channel);
+			ret = applesmc_read_key(key, buffer, 2);
+			if (ret)
+				return ret;
+			*val = ((buffer[0] << 8 | buffer[1]) >> 2);
+			return 0;
+		}
+		case hwmon_fan_min: {
+			char key[5];
+			u8 buffer[2];
+
+			scnprintf(key, sizeof(key), "F%dMn", channel);
+			ret = applesmc_read_key(key, buffer, 2);
+			if (ret)
+				return ret;
+			*val = ((buffer[0] << 8 | buffer[1]) >> 2);
+			return 0;
+		}
+		case hwmon_fan_max: {
+			char key[5];
+			u8 buffer[2];
+
+			scnprintf(key, sizeof(key), "F%dMx", channel);
+			ret = applesmc_read_key(key, buffer, 2);
+			if (ret)
+				return ret;
+			*val = ((buffer[0] << 8 | buffer[1]) >> 2);
+			return 0;
+		}
+		case hwmon_fan_target: {
+			char key[5];
+			u8 buffer[2];
+
+			scnprintf(key, sizeof(key), "F%dTg", channel);
+			ret = applesmc_read_key(key, buffer, 2);
+			if (ret)
+				return ret;
+			*val = ((buffer[0] << 8 | buffer[1]) >> 2);
+			return 0;
+		}
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			u8 buffer[2];
+
+			ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
+			if (ret)
+				return ret;
+			*val = ((buffer[0] << 8 | buffer[1]) >> channel) & 0x01;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int applesmc_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+				u32 attr, int channel, long val)
+{
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr == hwmon_fan_min || attr == hwmon_fan_target) {
+			char key[5];
+			u8 buffer[2];
+			const char *fmt = (attr == hwmon_fan_min) ? "F%dMn" : "F%dTg";
+
+			if (val < 0 || val >= 0x4000)
+				return -EINVAL;
+			scnprintf(key, sizeof(key), fmt, channel);
+			buffer[0] = (val >> 6) & 0xff;
+			buffer[1] = (val << 2) & 0xff;
+			return applesmc_write_key(key, buffer, 2);
+		}
+		break;
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			u8 buffer[2];
+			u16 manual_val;
+			const struct applesmc_entry *entry;
+
+			if (val != 0 && val != 1)
+				return -EINVAL;
+
+			entry = applesmc_get_entry_by_key(FANS_MANUAL);
+			if (IS_ERR(entry))
+				return PTR_ERR(entry);
+
+			mutex_lock(&smcreg.mutex);
+			ret = read_smc(APPLESMC_READ_CMD, entry->key, buffer, 2);
+			if (ret)
+				goto out_unlock;
+			manual_val = (buffer[0] << 8 | buffer[1]);
+			if (val)
+				manual_val |= (0x01 << channel);
+			else
+				manual_val &= ~(0x01 << channel);
+			buffer[0] = (manual_val >> 8) & 0xff;
+			buffer[1] = manual_val & 0xff;
+			ret = write_smc(APPLESMC_WRITE_CMD, entry->key, buffer, 2);
+out_unlock:
+			mutex_unlock(&smcreg.mutex);
+			return ret;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int applesmc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				      u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = smcreg.index[channel];
+			return 0;
+		}
+		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_label) {
+			*str = smcreg.fan_positions[channel] + 4;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops applesmc_hwmon_ops = {
+	.is_visible = applesmc_hwmon_is_visible,
+	.read = applesmc_hwmon_read,
+	.write = applesmc_hwmon_write,
+	.read_string = applesmc_hwmon_read_string,
+};
+
 static int __init applesmc_init(void)
 {
+	int i;
 	int ret;
 
 	if (!dmi_check_system(applesmc_whitelist)) {
@@ -1357,17 +1452,97 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_smcreg;
 
-	ret = applesmc_create_nodes(fan_group, smcreg.fan_count);
-	if (ret)
+	/* allocate hwmon channel configs */
+	applesmc_temp_config = kcalloc(smcreg.index_count + 1,
+				   sizeof(*applesmc_temp_config), GFP_KERNEL);
+	applesmc_fan_config = kcalloc(smcreg.fan_count + 1,
+				  sizeof(*applesmc_fan_config), GFP_KERNEL);
+	applesmc_pwm_config = kcalloc(smcreg.fan_count + 1,
+				  sizeof(*applesmc_pwm_config), GFP_KERNEL);
+	if (!applesmc_temp_config || !applesmc_fan_config || !applesmc_pwm_config) {
+		ret = -ENOMEM;
 		goto out_info;
+	}
 
-	ret = applesmc_create_nodes(temp_group, smcreg.index_count);
-	if (ret)
-		goto out_fans;
+	for (i = 0; i < smcreg.index_count; i++)
+		applesmc_temp_config[i] = HWMON_T_INPUT | HWMON_T_LABEL;
+	applesmc_temp_config[smcreg.index_count] = 0;
+
+	for (i = 0; i < smcreg.fan_count; i++) {
+		applesmc_fan_config[i] = HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN |
+				HWMON_F_MAX | HWMON_F_TARGET;
+		applesmc_pwm_config[i] = HWMON_PWM_ENABLE;
+	}
+	applesmc_fan_config[smcreg.fan_count] = 0;
+	applesmc_pwm_config[smcreg.fan_count] = 0;
+
+	applesmc_info_temp = kzalloc_obj(*applesmc_info_temp, GFP_KERNEL);
+	applesmc_info_fan = kzalloc_obj(*applesmc_info_fan, GFP_KERNEL);
+	applesmc_info_pwm = kzalloc_obj(*applesmc_info_pwm, GFP_KERNEL);
+	if (!applesmc_info_temp || !applesmc_info_fan || !applesmc_info_pwm) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	applesmc_info_temp->type = hwmon_temp;
+	applesmc_info_temp->config = applesmc_temp_config;
+
+	applesmc_info_fan->type = hwmon_fan;
+	applesmc_info_fan->config = applesmc_fan_config;
+
+	applesmc_info_pwm->type = hwmon_pwm;
+	applesmc_info_pwm->config = applesmc_pwm_config;
+
+	applesmc_info_arr = kcalloc(4, sizeof(*applesmc_info_arr), GFP_KERNEL);
+	if (!applesmc_info_arr) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	applesmc_info_arr[0] = applesmc_info_temp;
+	applesmc_info_arr[1] = applesmc_info_fan;
+	applesmc_info_arr[2] = applesmc_info_pwm;
+	applesmc_info_arr[3] = NULL;
+
+	applesmc_chip = kzalloc_obj(*applesmc_chip, GFP_KERNEL);
+	if (!applesmc_chip) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	applesmc_chip->ops = &applesmc_hwmon_ops;
+	applesmc_chip->info = applesmc_info_arr;
+
+	/* Create non-standard fanX_safe attributes group */
+	fan_safe_attrs = kcalloc(smcreg.fan_count,
+				      sizeof(*fan_safe_attrs), GFP_KERNEL);
+	fan_safe_attr_list = kcalloc(smcreg.fan_count + 1,
+					  sizeof(*fan_safe_attr_list), GFP_KERNEL);
+	if (!fan_safe_attrs || !fan_safe_attr_list) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	for (i = 0; i < smcreg.fan_count; i++) {
+		struct applesmc_dev_attr *node = &fan_safe_attrs[i];
+
+		scnprintf(node->name, sizeof(node->name), "fan%d_safe", i + 1);
+		node->sda.index = (3 << 16) | (i & 0xffff); /* Option 3 (safe speed) */
+		node->sda.dev_attr.show = applesmc_show_fan_speed;
+		node->sda.dev_attr.store = NULL;
+		sysfs_attr_init(&node->sda.dev_attr.attr);
+		node->sda.dev_attr.attr.name = node->name;
+		node->sda.dev_attr.attr.mode = 0444;
+		fan_safe_attr_list[i] = &node->sda.dev_attr.attr;
+	}
+	fan_safe_attr_list[smcreg.fan_count] = NULL;
+	fan_safe_group.attrs = fan_safe_attr_list;
+	applesmc_extra_groups[0] = &fan_safe_group;
+	applesmc_extra_groups[1] = NULL;
 
 	ret = applesmc_create_accelerometer();
 	if (ret)
-		goto out_temperature;
+		goto out_info;
 
 	ret = applesmc_create_light_sensor();
 	if (ret)
@@ -1377,7 +1552,8 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL,
+						    applesmc_chip, applesmc_extra_groups);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;
@@ -1391,11 +1567,8 @@ static int __init applesmc_init(void)
 	applesmc_release_light_sensor();
 out_accelerometer:
 	applesmc_release_accelerometer();
-out_temperature:
-	applesmc_destroy_nodes(temp_group);
-out_fans:
-	applesmc_destroy_nodes(fan_group);
 out_info:
+	applesmc_free_hwmon();
 	applesmc_destroy_nodes(info_group);
 out_smcreg:
 	applesmc_destroy_smcreg();
@@ -1416,13 +1589,12 @@ static void __exit applesmc_exit(void)
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
 	applesmc_release_accelerometer();
-	applesmc_destroy_nodes(temp_group);
-	applesmc_destroy_nodes(fan_group);
 	applesmc_destroy_nodes(info_group);
 	applesmc_destroy_smcreg();
 	platform_device_unregister(pdev);
 	platform_driver_unregister(&applesmc_driver);
 	release_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS);
+	applesmc_free_hwmon();
 }
 
 module_init(applesmc_init);
-- 
2.39.5

