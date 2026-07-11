Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF353939D3
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762418; cv=none; b=E+JA1bWMfcTqSvoWUhI/SUh7TXCmbpfpPx3NDol7G5TwwfGvUXJqUlhk7dTLiO9JKyE8ZsqCaNXPKtGTl8xZiqdX4pOnucKe/FazUspKJVEurkwAfzgcR/Y3cxPJP070FgfSMhlopaRYNYbk5u3qb//m9zwNEg90+96NxT2WaJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762418; c=relaxed/simple;
	bh=Y7OrR29A7x7yzSqnk55tCAYpetrTfeB4nNEWQxC3yK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IjhEXxsCP8Ks7TKB5xa9o682O1tInvm9XCEQtT1OBWd4IZm03I9SO5qWvyh7tn+xVaa5N/TAh+vjlGlj+UBBiH0m0mKhSQ1G5McIdI76hH3bXi/I2SYEChdV355wjlTMySNvLc70rsbBmwtYC1HrWFpECjk7JFRkkB1UIamU2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cae1a3a744so11544175ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 02:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783762416; x=1784367216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PnL+coTToV20yAYMnl5BV8JCXX5VnNWV/S0yqa6N3Y=;
        b=aJ3unLEOgawPojR2IcU8ZZNnPg5ZbI9Gk8RkfY13ypchhokGbFNKP8FY7w2jBzgzW8
         mKo6d3GgKl8nNdbIB82BBj+6YN0TRX+z6NZlrYNhuv5mdVgEt+RKFR2K7ix+2C2cNicg
         gkslLYnbWJ4B+oiEo8AomkbgEqMQd2XX/8C6E8u1PhHfTJzbkxgzna5u/mXbw+HsVx/y
         ulZbqgwXdfC/+uQT2CxKiBnYgTPGW/oJryIoclq/rwsfVSoSOpgyLPLAytEnoyHlpMOS
         qHXqiOd49AlZGLpxZ+OhRdZzIKfCJeeT8nlvYo8+L+G8zjmF/NcLY/t+wVnHRAg1vX/U
         t/pA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1wJ7A9A3iCj2I3/aIqsVKAcxLNfdzuFWDGAVY/LX9zqSLV2BxLem9Uatkql77RM17+WJ6DqUp38nobQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrcxYW8KvhPtCQiZlDSw07E20NciUW70ciYgEOBONi3FrTh49
	mw6/FtERhtvP2JhyGoHBGba2UX4Rdi9nTd7VCDDrTvJ8n7O5RPyrcr8=
X-Gm-Gg: AfdE7cm/h30rYXRR7+6WOLUwIiSSnL/4v65Vj70X5Ja/zgt+pDgxN4/OBJDQColpxFp
	H8nbFwH+GBC6RApy+TT1PsNG36lSxCK2Fl1s20Vhm6bF7+OoR2F26GABJzCC0+mJgP6kp5rkGf5
	AKu39uc6lykjGSTsfk+isunxYvf1wUoMfDLLue3TH1UFKl3BfqEXY+MGzjq3aIuuLxl+dRtuEl+
	gvq8HozWPQMdHF6YpLHfZHWSWtg/hu/6hfNVdeqtK9Y5T7ys8woKgKXTnkghd+XmJfHYtIvvzkK
	BIHbKvJf2GmxNF5i5Huh4hRA06Yezo0fE5w0KKZwoD5HQIKiS/k5OrWrv4nPlFSAHry0jag+2ST
	1v5S3xfw3dUSxnjLQCYulkYgz70oibSrUW7x+eO7zLV2cNVEuM2sp0yW0ARvmZxLHnsz/EkUFes
	L+r4hDdJmxsGXfQZti4wXOheNrTgOrWw1tH5dsqdParVfxtAOw5uQq2TxyjhhmzkHlBdnl+CZNM
	UdBtYAlu85pFsNBURUoBj0P5A==
X-Received: by 2002:a17:902:dac4:b0:2ca:5970:732d with SMTP id d9443c01a7336-2ce9f1540ecmr26261165ad.41.1783762416173;
        Sat, 11 Jul 2026 02:33:36 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm71389135ad.65.2026.07.11.02.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:33:35 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v6 3/3] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 17:33:23 +0800
Message-Id: <20260711093323.14529-4-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711093323.14529-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
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
index 317135fc4b73..ca56bd8b170e 100644
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
+			*val = (((buffer[0] << 8 | buffer[1]) >> channel) & 0x01) ? 1 : 2;
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
+			if (val != 1 && val != 2)
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
+			if (val == 1)
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

