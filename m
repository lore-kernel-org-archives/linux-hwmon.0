Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24825D517
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772921; cv=none; b=ICW2FC/bCadUk+/q574iRNEQYsido8Qngj7BaW2pbiIGhUqP8BcWCNGJmDSQno4wC5UDGlpg9W8HdnotQrDwtzQ9OfOyQVgEMR7is9UWvb6TlTiaJPA2OfZlfRSKRezFo3itcBCr7NRsBxDiQRUCHtdNavicdILfJ23xVCFcc00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772921; c=relaxed/simple;
	bh=rQgWm9nBYgXwH0oZtidKEgB1Ao+4kAsKjSTVPdw1f9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAPuWFDYnM00u954gGq4mXT4bKK2TTHWeG8dAOOqZmPfz/qPtJ05WYJ5hetb8wXklxJBOZ5zzLUNx7irnTCT32z/a1XXj5Mr1HpdANRJgW+ZtTWZRdjIhXtZ00iOOXjzauSkuKIZV2+8XYDyFLWP10LfH+0smXAitIhOnG70BZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dibLC0R0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dibLC0R0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-201df0b2df4so46075625ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772918; x=1725377718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dx0Z14GfKG+JVcpyJljUwjH8cB+643AMo4RHT9MkWo=;
        b=dibLC0R04+OrGxLJU30yAfY+fJZ7b7fvBF4T6YO1vO4Qo+ybA8jo6TRaTS/XmVcNVW
         bjAiL4UGWdIXKnQs2YhkN9xUW+YDJlZwqjCgQmCbfjRiZ9FRKEimKYlJFrB0QvkrwI3C
         RAwPbGwnG75aPmc5DUyTy0+querHzYi77LalNCvmtZhiL1p+AQUpoEHfE1SOCqVpYN6Z
         MHpPcQdjxpP8oxuNQfv2aXWkv/Rc8P5eFqTjheZNMTumncuTbQ6HFuGOzohrLBU/M6Ov
         j/SyH+1Fsr1wGRPVzEQ7tPrD/zB/WYtc27rB6NWALg4YqCadE+9hNPqQvrwi18U8xj7b
         TtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772918; x=1725377718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7dx0Z14GfKG+JVcpyJljUwjH8cB+643AMo4RHT9MkWo=;
        b=UPUwzrh2641XFxOSadp/lVKIv34em93dgV4d8mKojowkd+988XVQyk7g+vsodNXRs5
         ZQxj0fwiAAemEfRqk92FjqBSm4F1wwJGLK5V0fvU0uvGeSaWfT24L7jr6qv/vCE3vtGR
         m8iSglc1/8DytNvZdf1v94VkzkA8AtsITwPz6BLBDPgl/IoLs+QgEgjQYqCCiPgoCxwj
         qFmzmBlRLXvqx1G+W5c/PyWNoCUKGH0XOPtb38fPLkMsPwpUTXSdbdUBMQHF74eRNysU
         hDdJlUxAGjSFJzo5NKU01tpiaw3C9LZ9ZCj5hApPuhqQ5a2g9PF1JdyXzA2IPU9+DUGH
         biqw==
X-Gm-Message-State: AOJu0YyLQ9GLufHhL9kKZQSTMgtz52RxdMiiNmDZ926NuYLEWVNctxER
	yC1t2XB2pwZ//xAdmu6NnBH0xwBI8AK6/SqTugdDfGwYKeHo3tETxVWRng==
X-Google-Smtp-Source: AGHT+IH1OERXu/CtcHOP/KzQ3BcW5vcEt0RzopmiokpKDCVsDch6iEvkcYKzY1nabeWMsEu+PnyVLw==
X-Received: by 2002:a17:902:d4ce:b0:202:dcd:d44 with SMTP id d9443c01a7336-2039e51b696mr160902775ad.54.1724772917621;
        Tue, 27 Aug 2024 08:35:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855665a8sm84736305ad.43.2024.08.27.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/11] hwmon: (ina2xx) Convert to use with_info hwmon API
Date: Tue, 27 Aug 2024 08:34:55 -0700
Message-ID: <20240827153455.1344529-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
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
 drivers/hwmon/ina2xx.c | 494 ++++++++++++++++++++++++-----------------
 1 file changed, 293 insertions(+), 201 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 14136c96533f..e9e8482c32bc 100644
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
@@ -145,8 +143,6 @@ struct ina2xx_data {
 	long power_lsb_uW;
 	struct mutex config_lock;
 	struct regmap *regmap;
-
-	const struct attribute_group *groups[INA2XX_MAX_ATTRIBUTE_GROUPS];
 };
 
 static const struct ina2xx_config ina2xx_config[] = {
@@ -191,7 +187,7 @@ static int ina226_reg_to_interval(u16 config)
  * Return the new, shifted AVG field value of CONFIG register,
  * to use with regmap_update_bits
  */
-static u16 ina226_interval_to_reg(unsigned long interval)
+static u16 ina226_interval_to_reg(long interval)
 {
 	int avg, avg_bits;
 
@@ -245,14 +241,19 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
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
 
@@ -264,7 +265,7 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 		 * We do that extra read of the calibration register if there
 		 * is some hint of a chip reset.
 		 */
-		if (*regval == 0) {
+		if (regval == 0) {
 			unsigned int cal;
 
 			ret = regmap_read_bypassed(regmap, INA2XX_CALIBRATION, &cal);
@@ -286,6 +287,7 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 				continue;
 			}
 		}
+		*val = ina2xx_get_value(data, reg, regval);
 		return 0;
 	}
 
@@ -298,46 +300,6 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
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
@@ -367,14 +329,10 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, unsigned long
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
@@ -382,32 +340,26 @@ static ssize_t ina226_alert_show(struct device *dev,
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
@@ -421,43 +373,286 @@ static ssize_t ina226_alert_store(struct device *dev,
 		goto abort;
 
 	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
-			   ina226_alert_to_reg(data, attr->index, val));
+			   ina226_alert_to_reg(data, mask, val));
 	if (ret < 0)
 		goto abort;
 
-	if (val != 0) {
+	if (val)
 		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
 					 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE,
-					 attr->index | INA226_ALERT_LATCH_ENABLE);
-		if (ret < 0)
-			goto abort;
-	}
-
-	ret = count;
+					 mask | INA226_ALERT_LATCH_ENABLE);
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
@@ -479,21 +674,21 @@ static int ina2xx_set_shunt(struct ina2xx_data *data, unsigned long val)
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
@@ -507,114 +702,14 @@ static ssize_t ina2xx_shunt_store(struct device *dev,
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
@@ -656,8 +751,8 @@ static int ina2xx_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ina2xx_data *data;
 	struct device *hwmon_dev;
-	int ret, group = 0;
 	enum ina2xx_ids chip;
+	int ret;
 
 	chip = (uintptr_t)i2c_get_match_data(client);
 
@@ -684,12 +779,9 @@ static int ina2xx_probe(struct i2c_client *client)
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

