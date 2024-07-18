Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09341376EC
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273989; cv=none; b=YvrzaVGIx2u91sr4vc55Yg7fvAMO/JegWPsCHJRMxdUbAXqF1aqoiXAwVKuYV4e8+5q3CjTcxavjyWE/yGxfeF9fYk7UiH7eeJkXAdumwpiDIBgOfvb6kgNNZSYgmpsjvbIIuh1Fm2VK/01tNY6VHirlHQ1AaO2o498GofYI9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273989; c=relaxed/simple;
	bh=QVHdiHbitZ3+6bWTxAqLkygh0YL7aR8MV6QaSbbJb5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3GN4oi/FI4EVdzO63AgBWI2GTbW7XGMsKB52uzJR4TvboEecKeZyJJO9jPzRIj7X5GMkoalCpGoqb5kxw7REjWFD3cVXYU/HX/bDyCpecMXTLITbLvFvQn60mO21KlFFC1V+Cie8RHg7Eu6YrWaFsbDXWOx9pYT436rtl4d5eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHj/lNY7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHj/lNY7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc65329979so627925ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273986; x=1721878786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKEA7NJtk7nS+aiqxxxiD858+gRnVFS4bV5BwmnGIVQ=;
        b=FHj/lNY7if8VvCNtugVbjZ3D3kBSUgzDnE4W5ScpaayzbVT7Zll9RtDdaUs4vfiko8
         3RJIZX8JWkYFM2ztLcroJF2UgflZIOE+6n9x1InyDH/k5yIgUSXyJxhBcEUKXAXBw/3Q
         SV9OsDVA7703Wxsv3yFOfyfufoc/0KQTavWSuEEdRWvWfdivUyPXUhnL6Nt+0baiWzFj
         xwc30kd7MuO0gyi+WjK4+gHC7PlnOXPe4QerdAdVJYffKhV5f+VxTJv34HF1lImY+8sf
         fz+wSzTBesnChfC/oMfK3u3Joif9TsmJ4q/Ieyay8jS0H+qYDCW7ppDJEhpM/NiP4sv4
         2QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273986; x=1721878786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rKEA7NJtk7nS+aiqxxxiD858+gRnVFS4bV5BwmnGIVQ=;
        b=RmxOuHTA0ZHUUBUE1FIAxfXGJHB8tebX0jkffknEYm2s8R+auMbcpj3uEnyII1pJqv
         VtBjPZsWPQg+Ebg7eYilXeWNDmWd69jV8wJp/EBm6mD2eYKxcNMKc0TnyvdLWX/5OD8d
         vzrORsGzji88kMQ0gBGcEFG6z/Teu+K3W4hIMWoUuMg+5e1KGcMsDahHPeNifincYw18
         DArBOFHl1Oyg1NA0SUSMrelVLMdnmxLV3tRJ/ENDtxozKxR4ESZ7A47jWYWdnDirWzpa
         5RPwPn7EYN0pDQJVfi4X4tHow5lqXrbYoaHu3/sdSpFcG1iYqft6C79l4maSvNKq9uNi
         huvw==
X-Gm-Message-State: AOJu0YzPoSdn5XxsZ4mI5mVANzimz9fF/CX9Sn5eqx/tofIoxE211XV4
	hzP6Up/4bLQzZsRQBlIurUCOy4ZAv1CZcO8e/P5YNAaxE0kuYQVfp6dxkg==
X-Google-Smtp-Source: AGHT+IGU7kMvB/6PeVJ7u6aDGKv1zQsFYl313RMNQRWkr7WvxM8xxeTpsw/erudq88JP30IJmhc5qQ==
X-Received: by 2002:a17:902:ec85:b0:1fb:715d:df83 with SMTP id d9443c01a7336-1fc4e154b16mr35992735ad.13.1721273985550;
        Wed, 17 Jul 2024 20:39:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bbc4d7esm82004815ad.101.2024.07.17.20.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (lm95234) Convert to with_info hwmon API
Date: Wed, 17 Jul 2024 20:39:33 -0700
Message-Id: <20240718033935.205185-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718033935.205185-1-linux@roeck-us.net>
References: <20240718033935.205185-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to with_info API to simplify the code and reduce its size.

This patch reduces the object file size by about 30%.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 557 ++++++++++++++++------------------------
 1 file changed, 227 insertions(+), 330 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 7a3aff1d183a..1a164f47fb3e 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -10,14 +10,12 @@
 
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
-#include <linux/sysfs.h>
 #include <linux/util_macros.h>
 
 #define DRVNAME "lm95234"
@@ -56,11 +54,11 @@ static const unsigned short normal_i2c[] = {
 /* Client data (each client gets its own) */
 struct lm95234_data {
 	struct regmap *regmap;
-	const struct attribute_group *groups[3];
 	struct mutex update_lock;
+	enum chips type;
 };
 
-static int lm95234_read_temp(struct regmap *regmap, int index, int *t)
+static int lm95234_read_temp(struct regmap *regmap, int index, long *t)
 {
 	int temp = 0, ret;
 	u32 val;
@@ -93,110 +91,7 @@ static int lm95234_read_temp(struct regmap *regmap, int index, int *t)
 	return 0;
 }
 
-static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	int ret, temp;
-
-	ret = lm95234_read_temp(data->regmap, index, &temp);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%d\n", temp);
-}
-
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	u8 mask = to_sensor_dev_attr_2(attr)->index;
-	u8 reg = to_sensor_dev_attr_2(attr)->nr;
-	int ret;
-	u32 val;
-
-	ret = regmap_read(data->regmap, reg, &val);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", !!(val & mask));
-}
-
-static ssize_t type_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	u8 mask = to_sensor_dev_attr(attr)->index;
-	u32 val;
-	int ret;
-
-	ret = regmap_read(data->regmap, LM95234_REG_REM_MODEL, &val);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%s\n", val & mask ? "1" : "2");
-}
-
-static ssize_t type_store(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	u8 mask = to_sensor_dev_attr(attr)->index;
-	unsigned long val;
-	int ret;
-
-	ret = kstrtoul(buf, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	if (val != 1 && val != 2)
-		return -EINVAL;
-
-	ret = regmap_update_bits(data->regmap, LM95234_REG_REM_MODEL,
-				 mask, val == 1 ? mask : 0);
-	if (ret)
-		return ret;
-	return count;
-}
-
-static ssize_t tcrit2_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	int ret;
-	u32 tcrit2;
-
-	ret = regmap_read(data->regmap, LM95234_REG_TCRIT2(index), &tcrit2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", tcrit2 * 1000);
-}
-
-static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	long val;
-	int ret;
-
-	ret = kstrtol(buf, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
-				1000);
-
-	ret = regmap_write(data->regmap, LM95234_REG_TCRIT2(index), val);
-	if (ret)
-		return ret;
-	return count;
-}
-
-static ssize_t tcrit_hyst_show(struct lm95234_data *data, char *buf, int reg)
+static int lm95234_hyst_get(struct lm95234_data *data, int reg, long *val)
 {
 	u32 thyst, tcrit;
 	int ret;
@@ -212,80 +107,18 @@ static ssize_t tcrit_hyst_show(struct lm95234_data *data, char *buf, int reg)
 		return ret;
 
 	/* Result can be negative, so be careful with unsigned operands */
-	return sysfs_emit(buf, "%d\n", ((int)tcrit - (int)thyst) * 1000);
+	*val = ((int)tcrit - (int)thyst) * 1000;
+	return 0;
 }
 
-static ssize_t tcrit2_hyst_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t lm95234_hyst_set(struct lm95234_data *data, long val)
 {
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-
-	return tcrit_hyst_show(data, buf, LM95234_REG_TCRIT2(index));
-}
-
-static ssize_t tcrit1_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	int ret;
-	u32 val;
-
-	ret = regmap_read(data->regmap, LM95234_REG_TCRIT1(index), &val);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", val * 1000);
-}
-
-static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	long val;
-	int ret;
-
-	ret = kstrtol(buf, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
-
-	ret = regmap_write(data->regmap, LM95234_REG_TCRIT1(index), val);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static ssize_t tcrit1_hyst_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-
-	return tcrit_hyst_show(data, buf, LM95234_REG_TCRIT1(index));
-}
-
-static ssize_t tcrit1_hyst_store(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count)
-{
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
 	u32 tcrit;
-	long val;
 	int ret;
 
-	ret = kstrtol(buf, 10, &val);
-	if (ret < 0)
-		return ret;
-
 	mutex_lock(&data->update_lock);
 
-	ret = regmap_read(data->regmap, LM95234_REG_TCRIT1(index), &tcrit);
+	ret = regmap_read(data->regmap, LM95234_REG_TCRIT1(0), &tcrit);
 	if (ret)
 		goto unlock;
 
@@ -295,188 +128,255 @@ static ssize_t tcrit1_hyst_store(struct device *dev,
 	ret = regmap_write(data->regmap, LM95234_REG_TCRIT_HYST, val);
 unlock:
 	mutex_unlock(&data->update_lock);
-	if (ret)
-		return ret;
-
-	return count;
+	return ret;
 }
 
-static ssize_t offset_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static int lm95234_crit_reg(int channel)
 {
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	u32 offset;
-	int ret;
-
-	ret = regmap_read(data->regmap, LM95234_REG_OFFSET(index), &offset);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%d\n", sign_extend32(offset, 7) * 500);
+	if (channel == 1 || channel == 2)
+		return LM95234_REG_TCRIT2(channel - 1);
+	return LM95234_REG_TCRIT1(channel);
 }
 
-static ssize_t offset_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long val)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	long val;
+	struct regmap *regmap = data->regmap;
+
+	switch (attr) {
+	case hwmon_temp_type:
+		if (val != 1 && val != 2)
+			return -EINVAL;
+		return regmap_update_bits(regmap, LM95234_REG_REM_MODEL,
+					  BIT(channel),
+					  val == 1 ? BIT(channel) : 0);
+	case hwmon_temp_offset:
+		val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
+		return regmap_write(regmap, LM95234_REG_OFFSET(channel - 1), val);
+	case hwmon_temp_max:
+		val = clamp_val(val, 0, channel ? 255000 : 127000);
+		val = DIV_ROUND_CLOSEST(val, 1000);
+		return regmap_write(regmap, lm95234_crit_reg(channel), val);
+	case hwmon_temp_max_hyst:
+		return lm95234_hyst_set(data, val);
+	case hwmon_temp_crit:
+		val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
+		return regmap_write(regmap, LM95234_REG_TCRIT1(channel), val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int lm95234_alarm_reg(int channel)
+{
+	if (channel == 1 || channel == 2)
+		return LM95234_REG_STS_TCRIT2;
+	return LM95234_REG_STS_TCRIT1;
+}
+
+static int lm95234_temp_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct lm95234_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 regval, mask;
 	int ret;
 
-	ret = kstrtol(buf, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	/* Accuracy is 1/2 degrees C */
-	val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
-
-	ret = regmap_write(data->regmap, LM95234_REG_OFFSET(index), val);
-	if (ret < 0)
-		return ret;
-
-	return count;
+	switch (attr) {
+	case hwmon_temp_input:
+		return lm95234_read_temp(regmap, channel, val);
+	case hwmon_temp_max_alarm:
+		ret =  regmap_read(regmap, lm95234_alarm_reg(channel), &regval);
+		if (ret)
+			return ret;
+		*val = !!(regval & BIT(channel));
+		break;
+	case hwmon_temp_crit_alarm:
+		ret =  regmap_read(regmap, LM95234_REG_STS_TCRIT1, &regval);
+		if (ret)
+			return ret;
+		*val = !!(regval & BIT(channel));
+		break;
+	case hwmon_temp_crit_hyst:
+		return lm95234_hyst_get(data, LM95234_REG_TCRIT1(channel), val);
+	case hwmon_temp_type:
+		ret = regmap_read(regmap, LM95234_REG_REM_MODEL, &regval);
+		if (ret)
+			return ret;
+		*val = (regval & BIT(channel)) ? 1 : 2;
+		break;
+	case hwmon_temp_offset:
+		ret = regmap_read(regmap, LM95234_REG_OFFSET(channel - 1), &regval);
+		if (ret)
+			return ret;
+		*val = sign_extend32(regval, 7) * 500;
+		break;
+	case hwmon_temp_fault:
+		ret = regmap_read(regmap, LM95234_REG_STS_FAULT, &regval);
+		if (ret)
+			return ret;
+		mask = (BIT(0) | BIT(1)) << ((channel - 1) << 1);
+		*val = !!(regval & mask);
+		break;
+	case hwmon_temp_max:
+		ret = regmap_read(regmap, lm95234_crit_reg(channel), &regval);
+		if (ret)
+			return ret;
+		*val = regval * 1000;
+		break;
+	case hwmon_temp_max_hyst:
+		return lm95234_hyst_get(data, lm95234_crit_reg(channel), val);
+	case hwmon_temp_crit:
+		ret = regmap_read(regmap, LM95234_REG_TCRIT1(channel), &regval);
+		if (ret)
+			return ret;
+		*val = regval * 1000;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
 static u16 update_intervals[] = { 143, 364, 1000, 2500 };
 
-static ssize_t update_interval_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static int lm95234_chip_write(struct device *dev, u32 attr, long val)
+{
+	struct lm95234_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		val = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
+		return regmap_write(data->regmap, LM95234_REG_CONVRATE, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int lm95234_chip_read(struct device *dev, u32 attr, long *val)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	u32 convrate;
 	int ret;
 
-	ret = regmap_read(data->regmap, LM95234_REG_CONVRATE, &convrate);
-	if (ret)
-		return ret;
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		ret = regmap_read(data->regmap, LM95234_REG_CONVRATE, &convrate);
+		if (ret)
+			return ret;
 
-	return sysfs_emit(buf, "%u\n", update_intervals[convrate & 0x03]);
+		*val = update_intervals[convrate & 0x03];
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-static ssize_t update_interval_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
+static int lm95234_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
 {
-	struct lm95234_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int ret;
-
-	ret = kstrtoul(buf, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	val = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
-	ret = regmap_write(data->regmap, LM95234_REG_CONVRATE, val);
-	if (ret)
-		return ret;
-
-	return count;
+	switch (type) {
+	case hwmon_chip:
+		return lm95234_chip_write(dev, attr, val);
+	case hwmon_temp:
+		return lm95234_temp_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
+static int lm95234_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return lm95234_chip_read(dev, attr, val);
+	case hwmon_temp:
+		return lm95234_temp_read(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-static SENSOR_DEVICE_ATTR_2_RO(temp2_fault, alarm, LM95234_REG_STS_FAULT, BIT(0) | BIT(1));
-static SENSOR_DEVICE_ATTR_2_RO(temp3_fault, alarm, LM95234_REG_STS_FAULT, BIT(2) | BIT(3));
-static SENSOR_DEVICE_ATTR_2_RO(temp4_fault, alarm, LM95234_REG_STS_FAULT, BIT(4) | BIT(5));
-static SENSOR_DEVICE_ATTR_2_RO(temp5_fault, alarm, LM95234_REG_STS_FAULT, BIT(6) | BIT(7));
+static umode_t lm95234_is_visible(const void *_data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct lm95234_data *data = _data;
 
-static SENSOR_DEVICE_ATTR_RW(temp2_type, type, BIT(1));
-static SENSOR_DEVICE_ATTR_RW(temp3_type, type, BIT(2));
-static SENSOR_DEVICE_ATTR_RW(temp4_type, type, BIT(3));
-static SENSOR_DEVICE_ATTR_RW(temp5_type, type, BIT(4));
+	if (data->type == lm95233 && channel > 2)
+		return 0;
 
-static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0);
-static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0);
-static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1);
-static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3);
-static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4);
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_max_alarm:
+			return 0444;
+		case hwmon_temp_crit_alarm:
+		case hwmon_temp_crit_hyst:
+			return (channel && channel < 3) ? 0444 : 0;
+		case hwmon_temp_type:
+		case hwmon_temp_offset:
+			return channel ? 0644 : 0;
+		case hwmon_temp_fault:
+			return channel ? 0444 : 0;
+		case hwmon_temp_max:
+			return 0644;
+		case hwmon_temp_max_hyst:
+			return channel ? 0444 : 0644;
+		case hwmon_temp_crit:
+			return (channel && channel < 3) ? 0644 : 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
 
-static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, tcrit1_hyst, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_hyst, tcrit2_hyst, 0);
-static SENSOR_DEVICE_ATTR_RO(temp3_max_hyst, tcrit2_hyst, 1);
-static SENSOR_DEVICE_ATTR_RO(temp4_max_hyst, tcrit1_hyst, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_max_hyst, tcrit1_hyst, 4);
-
-static SENSOR_DEVICE_ATTR_2_RO(temp1_max_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(0));
-static SENSOR_DEVICE_ATTR_2_RO(temp2_max_alarm, alarm, LM95234_REG_STS_TCRIT2, BIT(1));
-static SENSOR_DEVICE_ATTR_2_RO(temp3_max_alarm, alarm, LM95234_REG_STS_TCRIT2, BIT(2));
-static SENSOR_DEVICE_ATTR_2_RO(temp4_max_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(3));
-static SENSOR_DEVICE_ATTR_2_RO(temp5_max_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(4));
-
-static SENSOR_DEVICE_ATTR_RW(temp2_crit, tcrit1, 1);
-static SENSOR_DEVICE_ATTR_RW(temp3_crit, tcrit1, 2);
-
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_hyst, tcrit1_hyst, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_crit_hyst, tcrit1_hyst, 2);
-
-static SENSOR_DEVICE_ATTR_2_RO(temp2_crit_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(1));
-static SENSOR_DEVICE_ATTR_2_RO(temp3_crit_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(2));
-
-static SENSOR_DEVICE_ATTR_RW(temp2_offset, offset, 0);
-static SENSOR_DEVICE_ATTR_RW(temp3_offset, offset, 1);
-static SENSOR_DEVICE_ATTR_RW(temp4_offset, offset, 2);
-static SENSOR_DEVICE_ATTR_RW(temp5_offset, offset, 3);
-
-static DEVICE_ATTR_RW(update_interval);
-
-static struct attribute *lm95234_common_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_type.dev_attr.attr,
-	&sensor_dev_attr_temp3_type.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_offset.dev_attr.attr,
-	&sensor_dev_attr_temp3_offset.dev_attr.attr,
-	&dev_attr_update_interval.attr,
+static const struct hwmon_channel_info * const lm95234_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_MAX_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_CRIT_ALARM | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_CRIT_ALARM | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
+			   HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
+			   HWMON_T_OFFSET),
 	NULL
 };
 
-static const struct attribute_group lm95234_common_group = {
-	.attrs = lm95234_common_attrs,
+static const struct hwmon_ops lm95234_hwmon_ops = {
+	.is_visible = lm95234_is_visible,
+	.read = lm95234_read,
+	.write = lm95234_write,
 };
 
-static struct attribute *lm95234_attrs[] = {
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp5_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_fault.dev_attr.attr,
-	&sensor_dev_attr_temp5_fault.dev_attr.attr,
-	&sensor_dev_attr_temp4_type.dev_attr.attr,
-	&sensor_dev_attr_temp5_type.dev_attr.attr,
-	&sensor_dev_attr_temp4_max.dev_attr.attr,
-	&sensor_dev_attr_temp5_max.dev_attr.attr,
-	&sensor_dev_attr_temp4_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp5_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp4_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp5_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_offset.dev_attr.attr,
-	&sensor_dev_attr_temp5_offset.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group lm95234_group = {
-	.attrs = lm95234_attrs,
+static const struct hwmon_chip_info lm95234_chip_info = {
+	.ops = &lm95234_hwmon_ops,
+	.info = lm95234_info,
 };
 
 static bool lm95234_volatile_reg(struct device *dev, unsigned int reg)
@@ -606,7 +506,6 @@ static int lm95234_init_client(struct device *dev, struct regmap *regmap)
 
 static int lm95234_probe(struct i2c_client *client)
 {
-	enum chips type = (uintptr_t)i2c_get_match_data(client);
 	struct device *dev = &client->dev;
 	struct lm95234_data *data;
 	struct device *hwmon_dev;
@@ -617,6 +516,8 @@ static int lm95234_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->type = (uintptr_t)i2c_get_match_data(client);
+
 	regmap = devm_regmap_init_i2c(client, &lm95234_regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
@@ -629,12 +530,8 @@ static int lm95234_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
-	data->groups[0] = &lm95234_common_group;
-	if (type == lm95234)
-		data->groups[1] = &lm95234_group;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &lm95234_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.39.2

