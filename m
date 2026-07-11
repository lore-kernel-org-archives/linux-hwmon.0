Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462101FD4
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 06:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750005; cv=none; b=uPL//5K5FQHEG9z4KRMuXO7n37IVpMNH8MD/Sd6QYZAQpkYNfyLd41JYZAVgFXSqmwPM+IYfbY7i44aCrlNgEM+HAHbndcOdPrGictxpR4gaVVsSJJh+j9bjvB7U3MwncgiHx/Kas7+nnsoLj+8OWtkmSCbEDGpRyjwgqiYNL9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750005; c=relaxed/simple;
	bh=dSLbRo+SKPOvwX4joJx77A6DgpX/ykoMwr0Fxn9tu8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZzN5ewfq272lOSt/JvXIciNaz2+i00kVwoLcpy76Ly6Si2TH6iVfCkiAJikzIdsGFmorvZzvVCU6ufOtDha+JfRMxj3cQ4d3l6ZaL3MgiBTGsI/gMR2mLbFFqrO3dq3/rH6zG+tJj+/Kh0PboMy9/gq5sCKcexL4tRx9hGVXa0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384c94c9414so1636188a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 23:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783750003; x=1784354803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WXYm5EC7+6fa3BP4WKNIFdzobWxP963NLh0p+g3bSoM=;
        b=Gn3Y9re0lGJCr/d+XX/33IVroPi+LwNLC+qB6YwcIZdlMv9jPKyWE/xEGQLos7Dd+a
         fNeFXNSBaMZ0jlDmiEubl+YbsOyzVyIZihr2F1+7oLcjDgfu6533RvljYrQZS0gN+EzY
         l2JHxACRRZdGVHGCyEw6cF1osctn9gD6Fdb6b8tDx6ba22RmOFW8oXQYE4SWzsrECrZz
         DH8kt5qlNm3qTK0v0k06b5U68bNdhuHQNJfHFKnY8wGBDVj5NvLtcZ7NktezuN4S97lB
         9/R75q8SYbu4GtrHgXiYxx1RqLlfXmgYhOqh+spUBCpNWkmOq9Fi30PLQyCVs6lw9MOd
         MftA==
X-Forwarded-Encrypted: i=1; AHgh+Rr80vABhk29bjxkBJ/weDhAKxRY8B4mFJuNoaelRi7ANquKYMpdNqnCWQo06pt7qAVypp34qAQjvv0vSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lqix7J3oFyNQcPpDJBrwaD5YUC+Frz4bRUcStEmrUo+w3sZc
	tTk0PWH64BFpqgsR3mv0k3Ala0HRcDvoz7GPUAViCRig1OdQkFvGU9M=
X-Gm-Gg: AfdE7cnVaat/ExqMpSYkr8NKXuX4k5mNqQHpEeuXWqkvm8YLTCgRMi1FRTcQOvb2KKy
	59uMeUaNoM5i7In7QMUpCr7s7k3zm6BvURI5rw/YucfjZ1XY2yee8iEU8kUI7JC1pL5j2sJ5tP2
	Tla+cPGEas/M7AXPeWhUl7jRsuTYF2g2uPyTEtRcQ8Z06Ttd+OaH2u75EQsJiPJfioEQbHl1wqJ
	C7WyQp9eYoOF3fbH86/WtJyVT+gA283HDQlf+gY+S1GHGioLl+G/Ix8789Etfa7i4tYi9ryhdsw
	NtQvv+M2UwBhTD8hsJChSTJ7M6/cE5S/W+Mg1487PD7lIomEPJamRh77UhyhUvwbkjTf9APKI9x
	s9Qvv7IoyZGEyPEXV+0ZFHTyfm1vKLJsuUlTuskehCUa0MxK7VmroQELj3Aur6xByCpx50VhYks
	FPOCD4FkTpFNmg7EcD7SBeL1Hp4bJIhVOkBB507MUMRG5alvO8rdDEc9R9+aG+kQHNSdv+2njJp
	C10VW63bJtjc9/kqq2oXW8rGg==
X-Received: by 2002:a17:90b:514e:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38dc77cf117mr1742119a91.40.1783750002475;
        Fri, 10 Jul 2026 23:06:42 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm1185307a91.0.2026.07.10.23.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:06:42 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v4 1/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 14:06:34 +0800
Message-Id: <20260711060634.5794-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711060634.5794-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711060634.5794-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy hwmon_device_register() function is deprecated and triggers a
warning in dmesg during driver initialization.

Convert the driver to use the modern hwmon_device_register_with_info()
API. This migration moves the registration of standard sensor attributes
to the HWMON core:

- Standard temperature attributes (temp*_input, temp*_label) are mapped
  to hwmon_temp channels.
- Standard fan attributes (fan*_input, fan*_label, fan*_min, fan*_max)
  are mapped to hwmon_fan channels.
- Non-standard fan*_output is renamed to standard fan*_target and mapped
  to HWMON_F_TARGET.
- Non-standard fan*_manual is renamed to standard pwm*_enable and mapped
  to HWMON_PWM_ENABLE.
- The remaining non-standard fan*_safe attribute is dynamically created
  and registered via extra_groups.

To support the read_string callback for fan labels, load and cache the
fan position names in smcreg.fan_positions during register initialization.

Finally, clean up the now-unused static attributes (temp_group, fan_group)
and their corresponding show/store callback functions to prevent compiler
warnings about unused static symbols.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/hwmon/applesmc.c | 467 ++++++++++++++++++++++++++-------------
 1 file changed, 316 insertions(+), 151 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 90a14a7f2c4c..a93b1f91a35d 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -133,6 +133,7 @@ static struct applesmc_registers {
 	bool init_complete;		/* true when fully initialized */
 	struct applesmc_entry *cache;	/* cached key entries */
 	const char **index;		/* temperature key index */
+	char fan_positions[10][17];	/* cached fan position labels */
 } smcreg = {
 	.mutex = __MUTEX_INITIALIZER(smcreg.mutex),
 };
@@ -143,7 +144,6 @@ static s16 rest_x;
 static s16 rest_y;
 static u8 backlight_state[2];
 
-static struct device *hwmon_dev;
 static struct input_dev *applesmc_idev;
 
 /*
@@ -566,7 +566,7 @@ static int applesmc_init_smcreg_try(void)
 {
 	struct applesmc_registers *s = &smcreg;
 	bool left_light_sensor = false, right_light_sensor = false;
-	unsigned int count;
+	unsigned int count, i;
 	u8 tmp[1];
 	int ret;
 
@@ -597,6 +597,16 @@ static int applesmc_init_smcreg_try(void)
 	if (s->fan_count > 10)
 		s->fan_count = 10;
 
+	for (i = 0; i < s->fan_count; i++) {
+		char newkey[5];
+
+		scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, i);
+		ret = applesmc_read_key(newkey, s->fan_positions[i], 16);
+		s->fan_positions[i][16] = 0;
+		if (ret)
+			scnprintf(s->fan_positions[i], 17, "    Fan %d", i);
+	}
+
 	ret = applesmc_get_lower_bound(&s->temp_begin, "T");
 	if (ret)
 		return ret;
@@ -808,33 +818,6 @@ static ssize_t applesmc_light_show(struct device *dev,
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
@@ -854,99 +837,6 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
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
@@ -1094,22 +984,7 @@ static struct applesmc_node_group light_sensor_group[] = {
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
 
@@ -1307,8 +1182,224 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, applesmc_whitelist);
 
+static struct applesmc_dev_attr *fan_safe_attrs;
+static struct attribute **fan_safe_attr_list;
+static struct attribute_group fan_safe_group;
+static const struct attribute_group *applesmc_extra_groups[2];
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
+	u32 *temp_config;
+	u32 *fan_config;
+	u32 *pwm_config;
+	struct hwmon_channel_info *info_temp;
+	struct hwmon_channel_info *info_fan;
+	struct hwmon_channel_info *info_pwm;
+	const struct hwmon_channel_info **info;
+	struct hwmon_chip_info *chip;
+	struct device *hwmon_dev;
+	int i;
 	int ret;
 
 	if (!dmi_check_system(applesmc_whitelist)) {
@@ -1343,17 +1434,97 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_smcreg;
 
-	ret = applesmc_create_nodes(fan_group, smcreg.fan_count);
-	if (ret)
+	/* allocate hwmon channel configs */
+	temp_config = devm_kcalloc(&pdev->dev, smcreg.index_count + 1,
+				   sizeof(*temp_config), GFP_KERNEL);
+	fan_config = devm_kcalloc(&pdev->dev, smcreg.fan_count + 1,
+				  sizeof(*fan_config), GFP_KERNEL);
+	pwm_config = devm_kcalloc(&pdev->dev, smcreg.fan_count + 1,
+				  sizeof(*pwm_config), GFP_KERNEL);
+	if (!temp_config || !fan_config || !pwm_config) {
+		ret = -ENOMEM;
 		goto out_info;
+	}
 
-	ret = applesmc_create_nodes(temp_group, smcreg.index_count);
-	if (ret)
-		goto out_fans;
+	for (i = 0; i < smcreg.index_count; i++)
+		temp_config[i] = HWMON_T_INPUT | HWMON_T_LABEL;
+	temp_config[smcreg.index_count] = 0;
+
+	for (i = 0; i < smcreg.fan_count; i++) {
+		fan_config[i] = HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN |
+				HWMON_F_MAX | HWMON_F_TARGET;
+		pwm_config[i] = HWMON_PWM_ENABLE;
+	}
+	fan_config[smcreg.fan_count] = 0;
+	pwm_config[smcreg.fan_count] = 0;
+
+	info_temp = devm_kzalloc(&pdev->dev, sizeof(*info_temp), GFP_KERNEL);
+	info_fan = devm_kzalloc(&pdev->dev, sizeof(*info_fan), GFP_KERNEL);
+	info_pwm = devm_kzalloc(&pdev->dev, sizeof(*info_pwm), GFP_KERNEL);
+	if (!info_temp || !info_fan || !info_pwm) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	info_temp->type = hwmon_temp;
+	info_temp->config = temp_config;
+
+	info_fan->type = hwmon_fan;
+	info_fan->config = fan_config;
+
+	info_pwm->type = hwmon_pwm;
+	info_pwm->config = pwm_config;
+
+	info = devm_kcalloc(&pdev->dev, 4, sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	info[0] = info_temp;
+	info[1] = info_fan;
+	info[2] = info_pwm;
+	info[3] = NULL;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip) {
+		ret = -ENOMEM;
+		goto out_info;
+	}
+
+	chip->ops = &applesmc_hwmon_ops;
+	chip->info = info;
+
+	/* Create non-standard fanX_safe attributes group */
+	fan_safe_attrs = devm_kcalloc(&pdev->dev, smcreg.fan_count,
+				      sizeof(*fan_safe_attrs), GFP_KERNEL);
+	fan_safe_attr_list = devm_kcalloc(&pdev->dev, smcreg.fan_count + 1,
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
@@ -1363,7 +1534,8 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL,
+							 chip, applesmc_extra_groups);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;
@@ -1377,10 +1549,6 @@ static int __init applesmc_init(void)
 	applesmc_release_light_sensor();
 out_accelerometer:
 	applesmc_release_accelerometer();
-out_temperature:
-	applesmc_destroy_nodes(temp_group);
-out_fans:
-	applesmc_destroy_nodes(fan_group);
 out_info:
 	applesmc_destroy_nodes(info_group);
 out_smcreg:
@@ -1398,12 +1566,9 @@ static int __init applesmc_init(void)
 
 static void __exit applesmc_exit(void)
 {
-	hwmon_device_unregister(hwmon_dev);
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
 	applesmc_release_accelerometer();
-	applesmc_destroy_nodes(temp_group);
-	applesmc_destroy_nodes(fan_group);
 	applesmc_destroy_nodes(info_group);
 	applesmc_destroy_smcreg();
 	platform_device_unregister(pdev);
-- 
2.39.5

