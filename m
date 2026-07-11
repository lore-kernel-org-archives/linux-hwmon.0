Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88F255F2C
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 03:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783741058; cv=none; b=aL5RLY0fqxd0U7CH2/73JiO1B8SqgbfSmSQhR8iiKRiV7hy7P2br1pUa4FQa24kOa1N/Vq+1I593BIOCr1jCavBVYGAV0n20ctXVsw0CQGcHXM6dxpcBfzorAzxETLij1rYfHih6EzkAMRQYeQL7uKNixVYYkkeEU3dcoHgrdyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783741058; c=relaxed/simple;
	bh=N11cBrYZNG/U+7Xm8ziD+/Pvw39f8tgHLU1INb1OyGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TTfSLnkyXfcT6ccf1p1QxkzCQJ8+E+BMI7tIwVy1bVPSaPti7ssPa0wP+09Hh/7bDVlEVWnSf/bd3Fs+8NraohMnaffOFdeVa6+fLQ8CRFEQnQdqdBuoQkp9lYBlywAQn0+fT/I9NrxwGE5pE8V2ZyVo6e6ZOeFZfcLUJK/rwG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dcbade417so92935a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 20:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783741056; x=1784345856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ZA7imThhFgjd+MLyxTnHntABua6XBiwt01rCC8GaTA=;
        b=OIpUTvbrEMBZMb0b6SIurJVjqXC2fp4Is94fL5LQwOpMGbRZoGmm1dRgSoy4HCovDE
         PT0k6LlZDnuVU7P7oeLtYWKZpv/JZlK85cVLVn23IG51pG4nMXGpFIrORT0viZMTh856
         tBFct1w3DCZa8EKyqYY7rzyeyoqQtA3GgEX9SxSp/mGkolQdTCuqyjlJiyRmPyg12D0b
         g0i0358Z0/wP9OCf2aEOKxCCeZKJL/5yNLniOm6gLpK0u2irq+Fmnx22PxYi94nPy+I+
         oCJICjoqPa4Qfuv93qJJBZVBvPnvykFJE5GjuMkzjg1Y8EaIyYRZSGH7D+C4wrdNDZEQ
         l7fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzVlUZNCeKXX4ZKAVYmDUYVYPIo9mN4FrSKyI4cdkW1z9K/4s/nFiIG3aTkQQ3fhGXKLW09Yo+ptzkOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywweay2mterItRCioYTy8rp68NPStdRQE6n6q0XtqOGqHaOc50d
	nlSCArWTsdk9MuOPef7C4WlghTlqfwoerp7xM2MrIm9ddmjA/s8U5rU=
X-Gm-Gg: AfdE7cn7GRYFklhkWqMxAqC2AkY682IMhYO0ZarTvM5WfkSm5SJwijJhDhINNgf5swF
	M97hENugfHVkE2QONYgmcL1qX8+BnUjh2DL3cHHz54JxqBwBT+9fKijC07FxdaFIEiZ6bAX5JMa
	m+czwg6pf4/X/St8eKzK/5HYOmzZ60tUcQIc09HUiOOLf3ZibjzcnZRAqgYDhFuUaOIv2hmQ0K4
	BAA1nBm5lnrUp7i8E+cN0mE08okO6zdeI4F6U9vY/zddHJ/xz7aOwD3rwj5ub59MT6vxxXSxgRQ
	6/vBo5Pl/a3tJlqB6bvK1zvmErqvfXBrperYruZ01PVP+PJP3/Ggx0Q6LLNLC9CldaTqLj3SvUP
	7Yl9trBHL2pOYa4j4l6E/evTeyjz/iTfFLo7EnkbV4IgkY1SiabEWL/dMV0dE4zzr60QleEC5t3
	QjTBPz+fJhfJkaCnov30SRWt5OHl24lzXTXIzi6W3jDDDVsYqjVmAILkpkgbKQiERah2Svt1J8V
	Ba6/pTqGQRB8sgzJg4FsX/H0A==
X-Received: by 2002:a17:90b:4c49:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-38dc7746cc8mr1368467a91.16.1783741055990;
        Fri, 10 Jul 2026 20:37:35 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38dc9fc78ffsm269900a91.9.2026.07.10.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:37:35 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v2 1/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 11:37:00 +0800
Message-Id: <20260711033700.3693-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711033700.3693-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711033700.3693-1-fourdollars@debian.org>
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
 drivers/hwmon/applesmc.c | 458 ++++++++++++++++++++++++++-------------
 1 file changed, 309 insertions(+), 149 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 90a14a7f2c4c..3470912649c4 100644
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
@@ -566,7 +567,7 @@ static int applesmc_init_smcreg_try(void)
 {
 	struct applesmc_registers *s = &smcreg;
 	bool left_light_sensor = false, right_light_sensor = false;
-	unsigned int count;
+	unsigned int count, i;
 	u8 tmp[1];
 	int ret;
 
@@ -597,6 +598,16 @@ static int applesmc_init_smcreg_try(void)
 	if (s->fan_count > 10)
 		s->fan_count = 10;
 
+	for (i = 0; i < s->fan_count; i++) {
+		char newkey[5];
+
+		scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, i);
+		ret = applesmc_read_key(newkey, s->fan_positions[i], 16);
+		s->fan_positions[i][16] = 0;
+		if (ret)
+			scnprintf(s->fan_positions[i], 17, "Fan %d", i);
+	}
+
 	ret = applesmc_get_lower_bound(&s->temp_begin, "T");
 	if (ret)
 		return ret;
@@ -808,33 +819,6 @@ static ssize_t applesmc_light_show(struct device *dev,
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
@@ -854,99 +838,6 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
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
@@ -1094,22 +985,7 @@ static struct applesmc_node_group light_sensor_group[] = {
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
 
@@ -1307,8 +1183,217 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
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
+
+			if (val != 0 && val != 1)
+				return -EINVAL;
+			mutex_lock(&smcreg.mutex);
+			ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
+			if (ret)
+				goto out_unlock;
+			manual_val = (buffer[0] << 8 | buffer[1]);
+			if (val)
+				manual_val |= (0x01 << channel);
+			else
+				manual_val &= ~(0x01 << channel);
+			buffer[0] = (manual_val >> 8) & 0xff;
+			buffer[1] = manual_val & 0xff;
+			ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
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
+	int i;
 	int ret;
 
 	if (!dmi_check_system(applesmc_whitelist)) {
@@ -1343,17 +1428,97 @@ static int __init applesmc_init(void)
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
@@ -1363,7 +1528,8 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL,
+						    chip, applesmc_extra_groups);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;
@@ -1377,10 +1543,6 @@ static int __init applesmc_init(void)
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
@@ -1402,8 +1564,6 @@ static void __exit applesmc_exit(void)
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

