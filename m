Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB61A7203
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523775; cv=none; b=YJLvDonYeEDADF1SZyVKXCkHQrqTHpqFYF6++T+YWLzjaKHZ9tzNqbBax3Nl+jeYCh1vL1vf0XQfKBQVXJg7RiYyWIAghh+6ztFu4tt5AKhpGI03FFz/4GcBIXonxSCd5svMKQTyokJxlVza4ctczKd4N3SLfXIturfpH1P0RXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523775; c=relaxed/simple;
	bh=FkC0wNVPzGGr+GND3CmMRL+x9WIm1VA8XL1Osp14SYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eZqEe1AynzmoSvMsJzY8EPVhk75N11+B84cYabycHWZ5ykLbQ2Q6psV1P8n9XsGc74qcKJVZWP5otHhk1He6MQG4NERdj5RUYag7e3bqWHwlg7Nc5J2+zgHOnYrIncaxTuh8JFtUAsad8+oCh0AcCpi8ARwMgqowifuz+hx72ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWvs5r03; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWvs5r03"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ff4fa918afso5965395ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523772; x=1723128572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q44f3rAhana6df4QRKvQQHrENJNEMANcfFhXIOj5R8s=;
        b=XWvs5r03zXAEEs4tj6nZ3BzJfxmwAAE634yPxrUVOEB9M5s4TUMQyR4K5NS/XwxcZ9
         uBb6ewoGvkkqWIJugEVBuKXtf0TrjmppSmMcAe+bSPGtaLwY5bEz2+t+2/8G2NlAMTje
         lCnGgSQ4HAKbxR+zhSR492UacHwBjQQIArukPFnMIeUe2Z9/kFplhxIehw3MWCLPU0FO
         yeor7Gy/f5zKIaE7aFsa5ARQlnsnTKsESS0JAchzMI95ewJSkNTnnkI4n8boeQ+9rN4m
         d7+AYqbp2S7BkHaZlkhsx9c/gSBpSadme/X03VTc03lqM3mQO7hrasRM1Fns45HF4Rvz
         5eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523772; x=1723128572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q44f3rAhana6df4QRKvQQHrENJNEMANcfFhXIOj5R8s=;
        b=uPVdS6dj7brmuT34YweUprehBp7f4I9GKGJ3/+F/5v1QP5Jc21oggz8i9gUq+LaPx5
         LlZLQVLLBwUdCBi3ZFlyIX0mi/psfLwbJRDicvqTeRJfeTxjZQrd2P9xgglZF2Nj4jtm
         GDNLnNF+rtv3zLlm1Ltl2yiZqWvjlRfIkYFc3yPDFORcdIdC51VUGtnOH6FQNjGfwrIk
         C/dTklkZNYklBjM/baNIYetmDTyTThfgHcwRf80ekpNlX8SDJm1VkDW9c75SQ6+FI0Cl
         nOwPmVzSRbt4vacArW+dswL1WwjMcy0nTJhagboaAj/ijgueff7fGRSI5BqJ/SDcxqOP
         yCfg==
X-Gm-Message-State: AOJu0YyQV7R80S0YGuX0e6nU445/RVwfTYdteVkEpbhznd+omqDPE7RL
	a/fqa4GcVITmt26Slri/s6YsH83fJfugJ220OB4Go0Fjl/efAsq1y5aj1A==
X-Google-Smtp-Source: AGHT+IElNH2RE6oTeUIH3UxWY5KSyHWRYX5N7JRLnq3TvtcGgN32EeAyb/FffnCEVxtbvKZrbNK+Xw==
X-Received: by 2002:a17:903:24f:b0:1fa:8f64:8afd with SMTP id d9443c01a7336-1ff5722eb62mr5819695ad.11.1722523771927;
        Thu, 01 Aug 2024 07:49:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1ae9dsm139929055ad.188.2024.08.01.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (lm92) Convert to with_info hwmon API
Date: Thu,  1 Aug 2024 07:49:17 -0700
Message-Id: <20240801144918.6156-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801144918.6156-1-linux@roeck-us.net>
References: <20240801144918.6156-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert driver to with_info hwmon API to simplify the code and
to reduce its size.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm92.c | 347 +++++++++++++++++++++++--------------------
 1 file changed, 188 insertions(+), 159 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 89befc7f59a5..0be439b38ee1 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -29,7 +29,6 @@
 
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -76,21 +75,6 @@ static inline u8 ALARMS_FROM_REG(s16 reg)
 	return reg & 0x0007;
 }
 
-enum temp_index {
-	t_input,
-	t_crit,
-	t_min,
-	t_max,
-	t_num_regs
-};
-
-static const u8 lm92_regs[t_num_regs] = {
-	[t_input] = LM92_REG_TEMP,
-	[t_crit] = LM92_REG_TEMP_CRIT,
-	[t_min] = LM92_REG_TEMP_LOW,
-	[t_max] = LM92_REG_TEMP_HIGH,
-};
-
 /* Client data (each client gets its own) */
 struct lm92_data {
 	struct regmap *regmap;
@@ -98,147 +82,209 @@ struct lm92_data {
 	int resolution;
 };
 
-/*
- * Sysfs attributes and callback functions
- */
-
-static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
+static int lm92_temp_read(struct lm92_data *data, u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm92_data *data = dev_get_drvdata(dev);
-	u32 temp;
-	int err;
-
-	err = regmap_read(data->regmap, lm92_regs[attr->index], &temp);
-	if (err)
-		return err;
-
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(temp));
-}
-
-static ssize_t temp_store(struct device *dev,
-			  struct device_attribute *devattr, const char *buf,
-			  size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm92_data *data = dev_get_drvdata(dev);
-	struct regmap *regmap = data->regmap;
-	int nr = attr->index;
-	long val;
-	int err;
-
-	err = kstrtol(buf, 10, &val);
-	if (err)
-		return err;
-
-	err = regmap_write(regmap, lm92_regs[nr], TEMP_TO_REG(val, data->resolution));
-	if (err)
-		return err;
-	return count;
-}
-
-static ssize_t temp_hyst_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	u32 regs[2] = { lm92_regs[attr->index], LM92_REG_TEMP_HYST };
-	struct lm92_data *data = dev_get_drvdata(dev);
-	u16 regvals[2];
-	int err;
-
-	err = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
-	if (err)
-		return err;
-
-	return sprintf(buf, "%d\n",
-		       TEMP_FROM_REG(regvals[0]) - TEMP_FROM_REG(regvals[1]));
-}
-
-static ssize_t temp1_min_hyst_show(struct device *dev,
-				   struct device_attribute *attr, char *buf)
-{
-	static u32 regs[2] = { LM92_REG_TEMP_LOW, LM92_REG_TEMP_HYST };
-	struct lm92_data *data = dev_get_drvdata(dev);
-	u16 regvals[2];
-	int err;
-
-	err = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
-	if (err)
-		return err;
-
-	return sprintf(buf, "%d\n",
-		       TEMP_FROM_REG(regvals[0]) + TEMP_FROM_REG(regvals[1]));
-}
-
-static ssize_t temp_hyst_store(struct device *dev,
-			       struct device_attribute *devattr,
-			       const char *buf, size_t count)
-{
-	struct lm92_data *data = dev_get_drvdata(dev);
+	int reg = -1, hyst_reg = -1, alarm_bit = 0;
 	struct regmap *regmap = data->regmap;
 	u32 temp;
-	long val;
-	int err;
+	int ret;
 
-	err = kstrtol(buf, 10, &val);
-	if (err)
-		return err;
+	switch (attr) {
+	case hwmon_temp_input:
+		reg = LM92_REG_TEMP;
+		break;
+	case hwmon_temp_min:
+		reg = LM92_REG_TEMP_LOW;
+		break;
+	case hwmon_temp_max:
+		reg = LM92_REG_TEMP_HIGH;
+		break;
+	case hwmon_temp_crit:
+		reg = LM92_REG_TEMP_CRIT;
+		break;
+	case hwmon_temp_min_hyst:
+		hyst_reg = LM92_REG_TEMP_LOW;
+		break;
+	case hwmon_temp_max_hyst:
+		hyst_reg = LM92_REG_TEMP_HIGH;
+		break;
+	case hwmon_temp_crit_hyst:
+		hyst_reg = LM92_REG_TEMP_CRIT;
+		break;
+	case hwmon_temp_min_alarm:
+		alarm_bit = 0;
+		break;
+	case hwmon_temp_max_alarm:
+		alarm_bit = 1;
+		break;
+	case hwmon_temp_crit_alarm:
+		alarm_bit = 2;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	if (reg >= 0) {
+		ret = regmap_read(regmap, reg, &temp);
+		if (ret < 0)
+			return ret;
+		*val = TEMP_FROM_REG(temp);
+	} else if (hyst_reg >= 0) {
+		u32 regs[2] = { hyst_reg, LM92_REG_TEMP_HYST };
+		u16 regvals[2];
 
-	val = clamp_val(val, -120000, 220000);
-	mutex_lock(&data->update_lock);
-	err = regmap_read(regmap, LM92_REG_TEMP_CRIT, &temp);
-	if (err)
-		goto unlock;
-	val = TEMP_TO_REG(TEMP_FROM_REG(temp) - val, data->resolution);
-	err = regmap_write(regmap, LM92_REG_TEMP_HYST, val);
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
+		if (ret)
+			return ret;
+		if (attr == hwmon_temp_min_hyst)
+			*val = TEMP_FROM_REG(regvals[0]) + TEMP_FROM_REG(regvals[1]);
+		else
+			*val = TEMP_FROM_REG(regvals[0]) - TEMP_FROM_REG(regvals[1]);
+	} else {
+		ret = regmap_read(regmap, LM92_REG_TEMP, &temp);
+		if (ret)
+			return ret;
+		*val = !!(temp & BIT(alarm_bit));
+	}
+	return 0;
+}
+
+static int lm92_chip_read(struct lm92_data *data, u32 attr, long *val)
+{
+	u32 temp;
+	int ret;
+
+	switch (attr) {
+	case hwmon_chip_alarms:
+		ret = regmap_read(data->regmap, LM92_REG_TEMP, &temp);
+		if (ret)
+			return ret;
+		*val = ALARMS_FROM_REG(temp);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int lm92_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+		     int channel, long *val)
+{
+	struct lm92_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_chip:
+		return lm92_chip_read(data, attr, val);
+	case hwmon_temp:
+		return lm92_temp_read(data, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int lm92_temp_write(struct lm92_data *data, u32 attr, long val)
+{
+	struct regmap *regmap = data->regmap;
+	int reg, err;
+	u32 temp;
+
+	switch (attr) {
+	case hwmon_temp_min:
+		reg = LM92_REG_TEMP_LOW;
+		break;
+	case hwmon_temp_max:
+		reg = LM92_REG_TEMP_HIGH;
+		break;
+	case hwmon_temp_crit:
+		reg = LM92_REG_TEMP_CRIT;
+		break;
+	case hwmon_temp_crit_hyst:
+		val = clamp_val(val, -120000, 220000);
+		mutex_lock(&data->update_lock);
+		err = regmap_read(regmap, LM92_REG_TEMP_CRIT, &temp);
+		if (err)
+			goto unlock;
+		val = TEMP_TO_REG(TEMP_FROM_REG(temp) - val, data->resolution);
+		err = regmap_write(regmap, LM92_REG_TEMP_HYST, val);
 unlock:
-	mutex_unlock(&data->update_lock);
-	if (err)
+		mutex_unlock(&data->update_lock);
 		return err;
-	return count;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return regmap_write(regmap, reg, TEMP_TO_REG(val, data->resolution));
 }
 
-static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static int lm92_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
 {
 	struct lm92_data *data = dev_get_drvdata(dev);
-	u32 temp;
-	int err;
 
-	err = regmap_read(data->regmap, LM92_REG_TEMP, &temp);
-	if (err)
-		return err;
-
-	return sprintf(buf, "%d\n", ALARMS_FROM_REG(temp));
+	switch (type) {
+	case hwmon_temp:
+		return lm92_temp_write(data, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static umode_t lm92_is_visible(const void *_data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
 {
-	struct lm92_data *data = dev_get_drvdata(dev);
-	int bitnr = to_sensor_dev_attr(attr)->index;
-	u32 temp;
-	int err;
-
-	err = regmap_read(data->regmap, LM92_REG_TEMP, &temp);
-	if (err)
-		return err;
-
-	return sprintf(buf, "%d\n", (temp >> bitnr) & 1);
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_alarms:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_hyst:
+			return 0644;
+		case hwmon_temp_input:
+		case hwmon_temp_min_hyst:
+		case hwmon_temp_max_hyst:
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_crit_alarm:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input);
-static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp, t_crit);
-static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, temp_hyst, t_crit);
-static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, t_min);
-static DEVICE_ATTR_RO(temp1_min_hyst);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, t_max);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_hyst, temp_hyst, t_max);
-static DEVICE_ATTR_RO(alarms);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
+static const struct hwmon_channel_info * const lm92_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT |
+			   HWMON_T_MIN | HWMON_T_MIN_HYST |
+			   HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			   HWMON_T_CRIT_ALARM),
+	NULL
+};
+
+static const struct hwmon_ops lm92_hwmon_ops = {
+	.is_visible = lm92_is_visible,
+	.read = lm92_read,
+	.write = lm92_write,
+};
+
+static const struct hwmon_chip_info lm92_chip_info = {
+	.ops = &lm92_hwmon_ops,
+	.info = lm92_info,
+};
 
 /*
  * Detection and registration
@@ -249,22 +295,6 @@ static int lm92_init_client(struct regmap *regmap)
 	return regmap_clear_bits(regmap, LM92_REG_CONFIG, 0x01);
 }
 
-static struct attribute *lm92_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&dev_attr_temp1_min_hyst.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&dev_attr_alarms.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(lm92);
-
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int lm92_detect(struct i2c_client *new_client,
 		       struct i2c_board_info *info)
@@ -373,9 +403,8 @@ static int lm92_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-							   client->name,
-							   data, lm92_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &lm92_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.39.2

