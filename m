Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106FF9E4
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979980; cv=none; b=igGu2X620ngDYFpJSp2Tn4CnY/S0p1NkwAha1wqFYAI7B0G1n9W0LsXUbSjyXmrd35T5V2vVDzHrbYN3efD77+7PHLdwjcCDIPuB3WkWNZGFtP1giR1OyktFS/vmy6q1Ws/ZqyQ6F4TEj1DXKViGJZTgrPL0DZ+7eOiGPkXfBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979980; c=relaxed/simple;
	bh=4xNkL6F/d9qzAyWP7E+APPfo+9qTEppBRFV3vNqHnQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKJxE+/70ypUSP/piYC0Dh0xYBmDuRS0A0/pWfjJrEh/WxRIw6Cn6QA0eiyU52Rd5RUmhBxL+LvDqY62H6lB4ayu7npt1Z7Mrhfvy7f4sNgpIY/DELvhffuQapYSx3sazeuLE07czt8JOjQQ0V1zEWf15DGYpKdcIiokLnf6w30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyUvbOuj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyUvbOuj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-202146e9538so10657945ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979977; x=1725584777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2jAf2OJlH8yWPG1jAFnPsBF45GoslHaPMNFp1UTwuI=;
        b=RyUvbOujGUBB7j3Qqww6meQ6yDzXrIWkZoZU6oFFwifm5iomK7XKDG5wf5glzWQllp
         KU5+f6Nr+KFWB3/9x9IqjhS8jY9Kg5Z+vQij9DWfRJ3Ia4mmwGA4ynUkxwaU434j7EL/
         HsWnQRrTIys2vNQAb7ajzIhsbnG8OUnXXNar5tGSLE0M6L4SUUtD74Bw92y+811XtB5s
         uhj3FX18OZqgRkrnB/GIy85hCEy+IDm0eqJ/luq6/n6FrZtTGKgzSbZ8FLzFBL+jFukv
         eJYziwdJNPONInsVEBD4wjrC3hVxA3M8b3hGplEX+0lnutuGc1/HyagUii3UrsXIwsve
         RnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979977; x=1725584777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e2jAf2OJlH8yWPG1jAFnPsBF45GoslHaPMNFp1UTwuI=;
        b=FSToRs7gTyluuwpdlwlzPsXhbkxJ2wYTHEMWz7n9E1q+IB8I+ALLJr7wFUWapzCFXL
         K9jujjFTgI+RarA+JyZNTmcovOlRd7M5odwuUgp52Tt2e2V56FyaigL6WJkkAaCW2yEX
         EMk2MRtD/xhP9Yfkiy92cK/0YAZeZZU4cm6yPUitx4ID6GgVO4VpET27TKzTVHRr1bhj
         +kHYvonrUUsnramJBJlaqFaj8qkyjuq1CG7/IsGrGvtCWHShG1RA9MJHDGYssthq/6YU
         TpGizHLKIXBATlBQw0o/S8wVOaFOon0xpxVm6gwKDRH1cZY4GMQGVeSWI6P1GD/RxWiw
         +hzQ==
X-Gm-Message-State: AOJu0YyDIs0bVcO49aEfAVcXqKWD39gs6p8K5DaFMkT1Ha21CekTvsWM
	/jT08IJfODwF59U+b9RwCctHmKWbSN+L+75IGzYNeqmrj4ml1BCbxQjQmg==
X-Google-Smtp-Source: AGHT+IGnFJl5prlr4sPTuxwXIqnRZUfAxk989neescQwGUyaU/A/tes/IykKWrkBD6zi0ETxymp9IQ==
X-Received: by 2002:a17:902:ecc3:b0:1fc:2ee3:d460 with SMTP id d9443c01a7336-2050c3743d3mr48764025ad.35.1724979977011;
        Thu, 29 Aug 2024 18:06:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515537254sm17102765ad.142.2024.08.29.18.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 11/14] hwmon: (ina2xx) Convert to use with_info hwmon API
Date: Thu, 29 Aug 2024 18:05:51 -0700
Message-ID: <20240830010554.1462861-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert driver to use the with_info hardware monitoring API
to reduce its dependency on sysfs attribute functions.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/ina2xx.c | 495 ++++++++++++++++++++++++-----------------
 1 file changed, 293 insertions(+), 202 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index fe850ee06024..339d41dfa10e 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -25,9 +25,9 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -35,6 +35,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/util_macros.h>
 
 /* common register definitions */
@@ -81,9 +82,6 @@
 #define INA226_ALERT_CONFIG_MASK	GENMASK(15, 10)
 #define INA226_ALERT_FUNCTION_FLAG	BIT(4)
 
-/* common attrs, ina226 attrs and NULL */
-#define INA2XX_MAX_ATTRIBUTE_GROUPS	3
-
 /*
  * Both bus voltage and shunt voltage conversion times for ina226 are set
  * to 0b0100 on POR, which translates to 2200 microseconds in total.
@@ -147,8 +145,6 @@ struct ina2xx_data {
 	long power_lsb_uW;
 	struct mutex config_lock;
 	struct regmap *regmap;
-
-	const struct attribute_group *groups[INA2XX_MAX_ATTRIBUTE_GROUPS];
 };
 
 static const struct ina2xx_config ina2xx_config[] = {
@@ -193,7 +189,7 @@ static int ina226_reg_to_interval(u16 config)
  * Return the new, shifted AVG field value of CONFIG register,
  * to use with regmap_update_bits
  */
-static u16 ina226_interval_to_reg(unsigned long interval)
+static u16 ina226_interval_to_reg(long interval)
 {
 	int avg, avg_bits;
 
@@ -247,14 +243,19 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 	return val;
 }
 
-static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
+/*
+ * Read and convert register value from chip. If the register value is 0,
+ * check if the chip has been power cycled or reset. If so, re-initialize it.
+ */
+static int ina2xx_read_init(struct device *dev, int reg, long *val)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
+	unsigned int regval;
 	int ret, retry;
 
 	for (retry = 5; retry; retry--) {
-		ret = regmap_read(regmap, reg, regval);
+		ret = regmap_read(regmap, reg, &regval);
 		if (ret < 0)
 			return ret;
 
@@ -266,7 +267,7 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 		 * We do that extra read of the calibration register if there
 		 * is some hint of a chip reset.
 		 */
-		if (*regval == 0) {
+		if (regval == 0) {
 			unsigned int cal;
 
 			ret = regmap_read_bypassed(regmap, INA2XX_CALIBRATION, &cal);
@@ -288,6 +289,7 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 				continue;
 			}
 		}
+		*val = ina2xx_get_value(data, reg, regval);
 		return 0;
 	}
 
@@ -300,46 +302,6 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 	return -ENODEV;
 }
 
-static ssize_t ina2xx_value_show(struct device *dev,
-				 struct device_attribute *da, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct ina2xx_data *data = dev_get_drvdata(dev);
-	unsigned int regval;
-
-	int err = ina2xx_read_reg(dev, attr->index, &regval);
-
-	if (err < 0)
-		return err;
-
-	return sysfs_emit(buf, "%d\n", ina2xx_get_value(data, attr->index, regval));
-}
-
-static int ina226_reg_to_alert(struct ina2xx_data *data, u32 mask, u16 regval)
-{
-	int reg;
-
-	switch (mask) {
-	case INA226_SHUNT_OVER_VOLTAGE_MASK:
-	case INA226_SHUNT_UNDER_VOLTAGE_MASK:
-		reg = INA2XX_SHUNT_VOLTAGE;
-		break;
-	case INA226_BUS_OVER_VOLTAGE_MASK:
-	case INA226_BUS_UNDER_VOLTAGE_MASK:
-		reg = INA2XX_BUS_VOLTAGE;
-		break;
-	case INA226_POWER_OVER_LIMIT_MASK:
-		reg = INA2XX_POWER;
-		break;
-	default:
-		/* programmer goofed */
-		WARN_ON_ONCE(1);
-		return 0;
-	}
-
-	return ina2xx_get_value(data, reg, regval);
-}
-
 /*
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
@@ -369,14 +331,10 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, unsigned long
 	}
 }
 
-static ssize_t ina226_alert_show(struct device *dev,
-				 struct device_attribute *da, char *buf)
+static int ina226_alert_limit_read(struct ina2xx_data *data, u32 mask, int reg, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct ina2xx_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
 	int regval;
-	int val = 0;
 	int ret;
 
 	mutex_lock(&data->config_lock);
@@ -384,32 +342,26 @@ static ssize_t ina226_alert_show(struct device *dev,
 	if (ret)
 		goto abort;
 
-	if (regval & attr->index) {
+	if (regval & mask) {
 		ret = regmap_read(regmap, INA226_ALERT_LIMIT, &regval);
 		if (ret)
 			goto abort;
-		val = ina226_reg_to_alert(data, attr->index, regval);
+		*val = ina2xx_get_value(data, reg, regval);
+	} else {
+		*val = 0;
 	}
-
-	ret = sysfs_emit(buf, "%d\n", val);
 abort:
 	mutex_unlock(&data->config_lock);
 	return ret;
 }
 
-static ssize_t ina226_alert_store(struct device *dev,
-				  struct device_attribute *da,
-				  const char *buf, size_t count)
+static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct ina2xx_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
-	unsigned long val;
 	int ret;
 
-	ret = kstrtoul(buf, 10, &val);
-	if (ret < 0)
-		return ret;
+	if (val < 0)
+		return -EINVAL;
 
 	/*
 	 * Clear all alerts first to avoid accidentally triggering ALERT pin
@@ -423,43 +375,285 @@ static ssize_t ina226_alert_store(struct device *dev,
 		goto abort;
 
 	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
-			   ina226_alert_to_reg(data, attr->index, val));
+			   ina226_alert_to_reg(data, mask, val));
 	if (ret < 0)
 		goto abort;
 
-	if (val != 0) {
+	if (val)
 		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
-					 INA226_ALERT_CONFIG_MASK,
-					 attr->index);
-		if (ret < 0)
-			goto abort;
-	}
-
-	ret = count;
+					 INA226_ALERT_CONFIG_MASK, mask);
 abort:
 	mutex_unlock(&data->config_lock);
 	return ret;
 }
 
-static ssize_t ina226_alarm_show(struct device *dev,
-				 struct device_attribute *da, char *buf)
+static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina2xx_data *data = dev_get_drvdata(dev);
-	unsigned int mask;
-	int alarm = 0;
+	u32 regval;
 	int ret;
 
-	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &mask);
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		ret = regmap_read(data->regmap, INA2XX_CONFIG, &regval);
+		if (ret)
+			return ret;
+
+		*val = ina226_reg_to_interval(regval);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read_bypassed(regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
 
-	alarm = (mask & attr->index) &&
-		(mask & INA226_ALERT_FUNCTION_FLAG);
+	*val = (regval & mask) && (regval & INA226_ALERT_FUNCTION_FLAG);
 
-	return sysfs_emit(buf, "%d\n", alarm);
+	return 0;
 }
 
+static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	int voltage_reg = channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE;
+	u32 under_voltage_mask = channel ? INA226_BUS_UNDER_VOLTAGE_MASK
+					 : INA226_SHUNT_UNDER_VOLTAGE_MASK;
+	u32 over_voltage_mask = channel ? INA226_BUS_OVER_VOLTAGE_MASK
+					: INA226_SHUNT_OVER_VOLTAGE_MASK;
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	unsigned int regval;
+	int ret;
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = regmap_read(regmap, voltage_reg, &regval);
+		if (ret)
+			return ret;
+		*val = ina2xx_get_value(data, voltage_reg, regval);
+		break;
+	case hwmon_in_lcrit:
+		return ina226_alert_limit_read(data, under_voltage_mask,
+					       voltage_reg, val);
+	case hwmon_in_crit:
+		return ina226_alert_limit_read(data, over_voltage_mask,
+					       voltage_reg, val);
+	case hwmon_in_lcrit_alarm:
+		return ina226_alert_read(regmap, under_voltage_mask, val);
+	case hwmon_in_crit_alarm:
+		return ina226_alert_read(regmap, over_voltage_mask, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
+{
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_power_input:
+		return ina2xx_read_init(dev, INA2XX_POWER, val);
+	case hwmon_power_crit:
+		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
+					       INA2XX_POWER, val);
+	case hwmon_power_crit_alarm:
+		return ina226_alert_read(data->regmap, INA226_POWER_OVER_LIMIT_MASK, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_curr_input:
+		return ina2xx_read_init(dev, INA2XX_CURRENT, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ina2xx_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return ina2xx_chip_read(dev, attr, val);
+	case hwmon_in:
+		return ina2xx_in_read(dev, attr, channel, val);
+	case hwmon_power:
+		return ina2xx_power_read(dev, attr, val);
+	case hwmon_curr:
+		return ina2xx_curr_read(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ina2xx_chip_write(struct device *dev, u32 attr, long val)
+{
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		return regmap_update_bits(data->regmap, INA2XX_CONFIG,
+					  INA226_AVG_RD_MASK,
+					  ina226_interval_to_reg(val));
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ina2xx_in_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_in_lcrit:
+		return ina226_alert_limit_write(data,
+			channel ? INA226_BUS_UNDER_VOLTAGE_MASK : INA226_SHUNT_UNDER_VOLTAGE_MASK,
+			val);
+	case hwmon_in_crit:
+		return ina226_alert_limit_write(data,
+			channel ? INA226_BUS_OVER_VOLTAGE_MASK : INA226_SHUNT_OVER_VOLTAGE_MASK,
+			val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int ina2xx_power_write(struct device *dev, u32 attr, long val)
+{
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_power_crit:
+		return ina226_alert_limit_write(data, INA226_POWER_OVER_LIMIT_MASK, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int ina2xx_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return ina2xx_chip_write(dev, attr, val);
+	case hwmon_in:
+		return ina2xx_in_write(dev, attr, channel, val);
+	case hwmon_power:
+		return ina2xx_power_write(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	const struct ina2xx_data *data = _data;
+	enum ina2xx_ids chip = data->chip;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+		case hwmon_in_lcrit:
+		case hwmon_in_crit:
+			if (chip == ina226)
+				return 0644;
+			break;
+		case hwmon_in_lcrit_alarm:
+		case hwmon_in_crit_alarm:
+			if (chip == ina226)
+				return 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			return 0444;
+		case hwmon_power_crit:
+			if (chip == ina226)
+				return 0644;
+			break;
+		case hwmon_power_crit_alarm:
+			if (chip == ina226)
+				return 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			if (chip == ina226)
+				return 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info * const ina2xx_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_CRIT | HWMON_I_CRIT_ALARM |
+			   HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM,
+			   HWMON_I_INPUT | HWMON_I_CRIT | HWMON_I_CRIT_ALARM |
+			   HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM
+			   ),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
+	NULL
+};
+
+static const struct hwmon_ops ina2xx_hwmon_ops = {
+	.is_visible = ina2xx_is_visible,
+	.read = ina2xx_read,
+	.write = ina2xx_write,
+};
+
+static const struct hwmon_chip_info ina2xx_chip_info = {
+	.ops = &ina2xx_hwmon_ops,
+	.info = ina2xx_info,
+};
+
+/* shunt resistance */
+
 /*
  * In order to keep calibration register value fixed, the product
  * of current_lsb and shunt_resistor should also be fixed and equal
@@ -481,21 +675,21 @@ static int ina2xx_set_shunt(struct ina2xx_data *data, unsigned long val)
 	return 0;
 }
 
-static ssize_t ina2xx_shunt_show(struct device *dev,
-				 struct device_attribute *da, char *buf)
+static ssize_t shunt_resistor_show(struct device *dev,
+				   struct device_attribute *da, char *buf)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%li\n", data->rshunt);
 }
 
-static ssize_t ina2xx_shunt_store(struct device *dev,
-				  struct device_attribute *da,
-				  const char *buf, size_t count)
+static ssize_t shunt_resistor_store(struct device *dev,
+				    struct device_attribute *da,
+				    const char *buf, size_t count)
 {
+	struct ina2xx_data *data = dev_get_drvdata(dev);
 	unsigned long val;
 	int status;
-	struct ina2xx_data *data = dev_get_drvdata(dev);
 
 	status = kstrtoul(buf, 10, &val);
 	if (status < 0)
@@ -509,114 +703,14 @@ static ssize_t ina2xx_shunt_store(struct device *dev,
 	return count;
 }
 
-static ssize_t ina226_interval_store(struct device *dev,
-				     struct device_attribute *da,
-				     const char *buf, size_t count)
-{
-	struct ina2xx_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int status;
-
-	status = kstrtoul(buf, 10, &val);
-	if (status < 0)
-		return status;
-
-	status = regmap_update_bits(data->regmap, INA2XX_CONFIG,
-				    INA226_AVG_RD_MASK,
-				    ina226_interval_to_reg(val));
-	if (status < 0)
-		return status;
-
-	return count;
-}
-
-static ssize_t ina226_interval_show(struct device *dev,
-				    struct device_attribute *da, char *buf)
-{
-	struct ina2xx_data *data = dev_get_drvdata(dev);
-	int status;
-	unsigned int regval;
-
-	status = regmap_read(data->regmap, INA2XX_CONFIG, &regval);
-	if (status)
-		return status;
-
-	return sysfs_emit(buf, "%d\n", ina226_reg_to_interval(regval));
-}
-
-/* shunt voltage */
-static SENSOR_DEVICE_ATTR_RO(in0_input, ina2xx_value, INA2XX_SHUNT_VOLTAGE);
-/* shunt voltage over/under voltage alert setting and alarm */
-static SENSOR_DEVICE_ATTR_RW(in0_crit, ina226_alert,
-			     INA226_SHUNT_OVER_VOLTAGE_MASK);
-static SENSOR_DEVICE_ATTR_RW(in0_lcrit, ina226_alert,
-			     INA226_SHUNT_UNDER_VOLTAGE_MASK);
-static SENSOR_DEVICE_ATTR_RO(in0_crit_alarm, ina226_alarm,
-			     INA226_SHUNT_OVER_VOLTAGE_MASK);
-static SENSOR_DEVICE_ATTR_RO(in0_lcrit_alarm, ina226_alarm,
-			     INA226_SHUNT_UNDER_VOLTAGE_MASK);
-
-/* bus voltage */
-static SENSOR_DEVICE_ATTR_RO(in1_input, ina2xx_value, INA2XX_BUS_VOLTAGE);
-/* bus voltage over/under voltage alert setting and alarm */
-static SENSOR_DEVICE_ATTR_RW(in1_crit, ina226_alert,
-			     INA226_BUS_OVER_VOLTAGE_MASK);
-static SENSOR_DEVICE_ATTR_RW(in1_lcrit, ina226_alert,
-			     INA226_BUS_UNDER_VOLTAGE_MASK);
-static SENSOR_DEVICE_ATTR_RO(in1_crit_alarm, ina226_alarm,
-			     INA226_BUS_OVER_VOLTAGE_MASK);
-static SENSOR_DEVICE_ATTR_RO(in1_lcrit_alarm, ina226_alarm,
-			     INA226_BUS_UNDER_VOLTAGE_MASK);
-
-/* calculated current */
-static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
-
-/* calculated power */
-static SENSOR_DEVICE_ATTR_RO(power1_input, ina2xx_value, INA2XX_POWER);
-/* over-limit power alert setting and alarm */
-static SENSOR_DEVICE_ATTR_RW(power1_crit, ina226_alert,
-			     INA226_POWER_OVER_LIMIT_MASK);
-static SENSOR_DEVICE_ATTR_RO(power1_crit_alarm, ina226_alarm,
-			     INA226_POWER_OVER_LIMIT_MASK);
-
-/* shunt resistance */
-static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ina2xx_shunt, INA2XX_CALIBRATION);
-
-/* update interval (ina226 only) */
-static SENSOR_DEVICE_ATTR_RW(update_interval, ina226_interval, 0);
+static DEVICE_ATTR_RW(shunt_resistor);
 
 /* pointers to created device attributes */
 static struct attribute *ina2xx_attrs[] = {
-	&sensor_dev_attr_in0_input.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_curr1_input.dev_attr.attr,
-	&sensor_dev_attr_power1_input.dev_attr.attr,
-	&sensor_dev_attr_shunt_resistor.dev_attr.attr,
+	&dev_attr_shunt_resistor.attr,
 	NULL,
 };
-
-static const struct attribute_group ina2xx_group = {
-	.attrs = ina2xx_attrs,
-};
-
-static struct attribute *ina226_attrs[] = {
-	&sensor_dev_attr_in0_crit.dev_attr.attr,
-	&sensor_dev_attr_in0_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in0_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_in0_lcrit_alarm.dev_attr.attr,
-	&sensor_dev_attr_in1_crit.dev_attr.attr,
-	&sensor_dev_attr_in1_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_in1_lcrit_alarm.dev_attr.attr,
-	&sensor_dev_attr_power1_crit.dev_attr.attr,
-	&sensor_dev_attr_power1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_update_interval.dev_attr.attr,
-	NULL,
-};
-
-static const struct attribute_group ina226_group = {
-	.attrs = ina226_attrs,
-};
+ATTRIBUTE_GROUPS(ina2xx);
 
 /*
  * Initialize chip
@@ -662,8 +756,8 @@ static int ina2xx_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ina2xx_data *data;
 	struct device *hwmon_dev;
-	int ret, group = 0;
 	enum ina2xx_ids chip;
+	int ret;
 
 	chip = (uintptr_t)i2c_get_match_data(client);
 
@@ -690,12 +784,9 @@ static int ina2xx_probe(struct i2c_client *client)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to configure device\n");
 
-	data->groups[group++] = &ina2xx_group;
-	if (chip == ina226)
-		data->groups[group++] = &ina226_group;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &ina2xx_chip_info,
+							 ina2xx_groups);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-- 
2.45.2

