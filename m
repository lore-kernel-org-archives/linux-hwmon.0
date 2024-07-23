Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7615575E
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749501; cv=none; b=eMtirV7wyaLdw6HG1eIcabKEBDT7Zsh06FbByFeByRnlC6ojmX9z8DZTJgtMiwD4n40pALLlyFDtKm8n8liUBiSPjT+woU6KTo7a8WrQoSq/TmYSZh4SrdrP7MF4QrjgiclAg2b5VJamoKUrFNLAPJG8sXCGeVnhyCXXMZ1T9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749501; c=relaxed/simple;
	bh=jAigmzePCpvSoQ4gvCxxGTgs2vUXFYAZA+7wHNXT3pU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iM0ltHQO34/p/4tE8JBG0dPW38m2qGBn4t2A8cYxj9gHDVK4/0DZhXO0QEqI/ocI1y9wfy3iPWnvTXmUL/d8IyYnKoOWYVt7Gd94Nb6jFkDd8Qk0iadIWc2i4VXFewqQUUKz8D9TZDuvtvqPtb9brH57doZ/0gQdBFkNieP5sp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sxs/Edqv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxs/Edqv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so54177a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749498; x=1722354298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5JFCH74q+1/un5yI9b1CNRMLLJeaetnbpOFsHZ1IQQ=;
        b=Sxs/EdqvASlTwlob4YFglUHzk5ePQfsD5II1P/mcUN2qiSZH6CuHNY8BKds3lYjKZ1
         uO9Adm6SVId7NGWBXKBn9ROmAHLaUCkg+CLXV7FUWRW7LxXPAtb1SX+rnCpFIg0aC6pQ
         H/V0bVQilVtaiBYBy463cZE4LhBP4GhxyZp2D2qyBzEpge7n25d90aSHCj1QmI4LS/lB
         LdHGRm+OvMCsDjcLF1Mtl6VXw+r3a8WrSZzJFQV1tJjw6arj39MVWzQ6fs0Mc92a5rHd
         a3InJ4GbZyQkn8Wrc+7E+akCJ6HQ1uRRxhvMvewKxYDIvUoCk+1Hhcr81i5bXJ85RbGO
         ZYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749498; x=1722354298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5JFCH74q+1/un5yI9b1CNRMLLJeaetnbpOFsHZ1IQQ=;
        b=jgsLFR3438Z9byS+0LdKBRhcYbkeYHF2tXReRb8K9j6b2opXqeqbNC3oa0sv0WYZsA
         PjBehg3srQWxwOCpuI8iGe6kNMkmmvlLJqH8HOLYuQlTExHekR62TuK/e9vHXeI9hja0
         xen25e9sK4kvff1bHDsK5JVC4VvU0bav7ozGf6ZJkpig18uEamI5c9QfXmikzjF4wpFa
         lPm83XFm6GWwkOExlu6pl+Za0wuYrIepy/Aybf5jE4k7sN/YcmLQqMhjd7hm/1PhjqaG
         Rc64+qJfXf4SPmpGUwiUatwmyvv6MkuInaJpqOOMfDcYVfHEOi8Y65i/fvOgmDwaEZzz
         1ugA==
X-Gm-Message-State: AOJu0YwjstQGhvMtGl/8Nx3ZzJClHWFvW3zX7JOZU3aK36xi8IU0B7NK
	YlJF9mVjolP/j7pDBflF3wdUev6L8YS4dfr0OVbkcvVuC78yrhpyAbzRqw==
X-Google-Smtp-Source: AGHT+IElA63Eg4RCy6tl2oHqrYt7Df6qjGpVirg4axiII7QdYosVsO37+mma67XvpU0VNpMzyWmyvQ==
X-Received: by 2002:a17:90a:b016:b0:2c9:7ebd:b957 with SMTP id 98e67ed59e1d1-2cd2740f4c1mr8236488a91.11.1721749498335;
        Tue, 23 Jul 2024 08:44:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c7249bsm9267198a91.31.2024.07.23.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:44:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 5/6] hwmon: (max6697) Convert to with_info hwmon API
Date: Tue, 23 Jul 2024 08:44:46 -0700
Message-Id: <20240723154447.2669995-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723154447.2669995-1-linux@roeck-us.net>
References: <20240723154447.2669995-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to with_info hwmon API to simplify the code and reduce its size.

This patch reduces object file size by approximately 25%.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max6697.c | 464 +++++++++++++++-------------------------
 1 file changed, 173 insertions(+), 291 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index e4bec33d1d44..a81e60879c1a 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -10,7 +10,6 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -52,7 +51,9 @@ static const u8 MAX6697_REG_CRIT[] = {
 	(FIELD_PREP(MAX6697_EXTERNAL_MASK_CHIP, FIELD_GET(MAX6697_EXTERNAL_MASK_DT, reg)) | \
 	 FIELD_PREP(MAX6697_LOCAL_MASK_CHIP, FIELD_GET(MAX6697_LOCAL_MASK_DT, reg)))
 
-#define MAX6697_REG_STAT(n)		(0x44 + (n))
+#define MAX6697_REG_STAT_ALARM		0x44
+#define MAX6697_REG_STAT_CRIT		0x45
+#define MAX6697_REG_STAT_FAULT		0x46
 
 #define MAX6697_REG_CONFIG		0x41
 #define MAX6581_CONF_EXTENDED		BIT(1)
@@ -78,7 +79,6 @@ struct max6697_chip_data {
 	u32 have_crit;
 	u32 have_fault;
 	u8 valid_conf;
-	const u8 *alarm_map;
 };
 
 struct max6697_data {
@@ -98,11 +98,6 @@ struct max6697_data {
 	u32 alarms;
 };
 
-/* Diode fault status bits on MAX6581 are right shifted by one bit */
-static const u8 max6581_alarm_map[] = {
-	 0, 0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15,
-	 16, 17, 18, 19, 20, 21, 22, 23 };
-
 static const struct max6697_chip_data max6697_chip_data[] = {
 	[max6581] = {
 		.channels = 8,
@@ -110,7 +105,6 @@ static const struct max6697_chip_data max6697_chip_data[] = {
 		.have_ext = 0x7f,
 		.have_fault = 0xfe,
 		.valid_conf = MAX6581_CONF_EXTENDED | MAX6697_CONF_TIMEOUT,
-		.alarm_map = max6581_alarm_map,
 	},
 	[max6602] = {
 		.channels = 5,
@@ -179,313 +173,202 @@ static const struct max6697_chip_data max6697_chip_data[] = {
 	},
 };
 
-static inline int max6581_offset_to_millic(int val)
-{
-	return sign_extend32(val, 7) * 250;
-}
-
-static ssize_t temp_input_show(struct device *dev,
-			       struct device_attribute *devattr, char *buf)
+static int max6697_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
+	unsigned int offset_regs[2] = { MAX6581_REG_OFFSET_SELECT, MAX6581_REG_OFFSET };
+	unsigned int temp_regs[2] = { MAX6697_REG_TEMP[channel],
+				      MAX6697_REG_TEMP_EXT[channel] };
 	struct max6697_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(devattr)->index;
-	unsigned int regs[2] = { MAX6697_REG_TEMP[index],
-				 MAX6697_REG_TEMP_EXT[index] };
-	u8 regdata[2] = { };
-	int temp, ret;
-
-	ret = regmap_multi_reg_read(data->regmap, regs, regdata,
-				    data->chip->have_ext & BIT(index) ? 2 : 1);
-	if (ret)
-		return ret;
-
-	temp = ((regdata[0] - data->temp_offset) << 3) | (regdata[1] >> 5);
-
-	return sprintf(buf, "%d\n", temp * 125);
-}
-
-static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	struct max6697_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr_2(devattr)->index;
-	int nr = to_sensor_dev_attr_2(devattr)->nr;
-	unsigned int temp;
-	int reg, ret;
-
-	if (index == MAX6697_TEMP_MAX)
-		reg = MAX6697_REG_MAX[nr];
-	else
-		reg = MAX6697_REG_CRIT[nr];
-
-	ret = regmap_read(data->regmap, reg, &temp);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%d\n", ((int)temp - data->temp_offset) * 1000);
-}
-
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct max6697_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-	unsigned int alarms;
-	int reg, ret;
-
-	if (data->chip->alarm_map)
-		index = data->chip->alarm_map[index];
-
-	reg = MAX6697_REG_STAT(2 - (index / 8));
-	ret = regmap_read(data->regmap, reg, &alarms);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%u\n", !!(alarms & BIT(index & 7)));
-}
-
-static ssize_t temp_store(struct device *dev,
-			  struct device_attribute *devattr, const char *buf,
-			  size_t count)
-{
-	int nr = to_sensor_dev_attr_2(devattr)->nr;
-	int index = to_sensor_dev_attr_2(devattr)->index;
-	struct max6697_data *data = dev_get_drvdata(dev);
-	long temp;
-	int ret;
-
-	ret = kstrtol(buf, 10, &temp);
-	if (ret < 0)
-		return ret;
-
-	temp = clamp_val(temp, -1000000, 1000000);	/* prevent underflow */
-	temp = DIV_ROUND_CLOSEST(temp, 1000) + data->temp_offset;
-	temp = clamp_val(temp, 0, data->type == max6581 ? 255 : 127);
-	ret = regmap_write(data->regmap,
-			   index == 2 ? MAX6697_REG_MAX[nr]
-				      : MAX6697_REG_CRIT[nr],
-			   temp);
-
-	return ret ? : count;
-}
-
-static ssize_t offset_store(struct device *dev, struct device_attribute *devattr, const char *buf,
-			    size_t count)
-{
-	struct max6697_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct regmap *regmap = data->regmap;
-	long temp;
+	u8 regdata[2] = { };
+	u32 regval;
 	int ret;
 
-	ret = kstrtol(buf, 10, &temp);
-	if (ret < 0)
-		return ret;
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = regmap_multi_reg_read(regmap, temp_regs, regdata,
+					    data->chip->have_ext & BIT(channel) ? 2 : 1);
+		if (ret)
+			return ret;
+		*val = (((regdata[0] - data->temp_offset) << 3) | (regdata[1] >> 5)) * 125;
+		break;
+	case hwmon_temp_max:
+		ret = regmap_read(regmap, MAX6697_REG_MAX[channel], &regval);
+		if (ret)
+			return ret;
+		*val = ((int)regval - data->temp_offset) * 1000;
+		break;
+	case hwmon_temp_crit:
+		ret = regmap_read(regmap, MAX6697_REG_CRIT[channel], &regval);
+		if (ret)
+			return ret;
+		*val = ((int)regval - data->temp_offset) * 1000;
+		break;
+	case hwmon_temp_offset:
+		ret = regmap_multi_reg_read(regmap, offset_regs, regdata, 2);
+		if (ret)
+			return ret;
 
-	mutex_lock(&data->update_lock);
-	temp = clamp_val(temp, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
-	temp = DIV_ROUND_CLOSEST(temp, 250);
-	if (!temp) {	/* disable this (and only this) channel */
-		ret = regmap_clear_bits(regmap, MAX6581_REG_OFFSET_SELECT, BIT(index - 1));
-		goto unlock;
+		if (!(regdata[0] & BIT(channel - 1)))
+			regdata[1] = 0;
+
+		*val = sign_extend32(regdata[1], 7) * 250;
+		break;
+	case hwmon_temp_fault:
+		ret = regmap_read(regmap, MAX6697_REG_STAT_FAULT, &regval);
+		if (ret)
+			return ret;
+		if (data->type == max6581)
+			*val = !!(regval & BIT(channel - 1));
+		else
+			*val = !!(regval & BIT(channel));
+		break;
+	case hwmon_temp_crit_alarm:
+		ret = regmap_read(regmap, MAX6697_REG_STAT_CRIT, &regval);
+		if (ret)
+			return ret;
+		*val = !!(regval & BIT(channel ? channel - 1 : 7));
+		break;
+	case hwmon_temp_max_alarm:
+		ret = regmap_read(regmap, MAX6697_REG_STAT_ALARM, &regval);
+		if (ret)
+			return ret;
+		switch (channel) {
+		case 0:
+			*val = !!(regval & BIT(6));
+			break;
+		case 7:
+			*val = !!(regval & BIT(7));
+			break;
+		default:
+			*val = !!(regval & BIT(channel - 1));
+			break;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
 	}
-	/* enable channel, and update offset */
-	ret = regmap_set_bits(regmap, MAX6581_REG_OFFSET_SELECT, BIT(index - 1));
-	if (ret)
-		goto unlock;
-	ret = regmap_write(regmap, MAX6581_REG_OFFSET, temp);
-unlock:
-	mutex_unlock(&data->update_lock);
-	return ret ? : count;
+	return 0;
 }
 
-static ssize_t offset_show(struct device *dev, struct device_attribute *devattr, char *buf)
+static int max6697_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
 {
-	unsigned int regs[2] = { MAX6581_REG_OFFSET_SELECT, MAX6581_REG_OFFSET };
 	struct max6697_data *data = dev_get_drvdata(dev);
-	int index = to_sensor_dev_attr(devattr)->index;
-	u8 regdata[2];
+	struct regmap *regmap = data->regmap;
 	int ret;
 
-	ret = regmap_multi_reg_read(data->regmap, regs, regdata, 2);
-	if (ret)
+	switch (attr) {
+	case hwmon_temp_max:
+		val = clamp_val(val, -1000000, 1000000);	/* prevent underflow */
+		val = DIV_ROUND_CLOSEST(val, 1000) + data->temp_offset;
+		val = clamp_val(val, 0, data->type == max6581 ? 255 : 127);
+		return regmap_write(regmap, MAX6697_REG_MAX[channel], val);
+	case hwmon_temp_crit:
+		val = clamp_val(val, -1000000, 1000000);	/* prevent underflow */
+		val = DIV_ROUND_CLOSEST(val, 1000) + data->temp_offset;
+		val = clamp_val(val, 0, data->type == max6581 ? 255 : 127);
+		return regmap_write(regmap, MAX6697_REG_CRIT[channel], val);
+	case hwmon_temp_offset:
+		mutex_lock(&data->update_lock);
+		val = clamp_val(val, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
+		val = DIV_ROUND_CLOSEST(val, 250);
+		if (!val) {	/* disable this (and only this) channel */
+			ret = regmap_clear_bits(regmap, MAX6581_REG_OFFSET_SELECT,
+						BIT(channel - 1));
+		} else {
+			/* enable channel and update offset */
+			ret = regmap_set_bits(regmap, MAX6581_REG_OFFSET_SELECT,
+					      BIT(channel - 1));
+			if (ret)
+				goto unlock;
+			ret = regmap_write(regmap, MAX6581_REG_OFFSET, val);
+		}
+unlock:
+		mutex_unlock(&data->update_lock);
 		return ret;
-
-	if (!(regdata[0] & BIT(index - 1)))
-		regdata[1] = 0;
-
-	return sprintf(buf, "%d\n", max6581_offset_to_millic(regdata[1]));
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
-static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp, 0, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp1_crit, temp, 0, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
-static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp, 1, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp2_crit, temp, 1, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp3_input, temp_input, 2);
-static SENSOR_DEVICE_ATTR_2_RW(temp3_max, temp, 2, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp3_crit, temp, 2, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp4_input, temp_input, 3);
-static SENSOR_DEVICE_ATTR_2_RW(temp4_max, temp, 3, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp4_crit, temp, 3, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp5_input, temp_input, 4);
-static SENSOR_DEVICE_ATTR_2_RW(temp5_max, temp, 4, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp5_crit, temp, 4, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp6_input, temp_input, 5);
-static SENSOR_DEVICE_ATTR_2_RW(temp6_max, temp, 5, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp6_crit, temp, 5, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp7_input, temp_input, 6);
-static SENSOR_DEVICE_ATTR_2_RW(temp7_max, temp, 6, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp7_crit, temp, 6, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp8_input, temp_input, 7);
-static SENSOR_DEVICE_ATTR_2_RW(temp8_max, temp, 7, MAX6697_TEMP_MAX);
-static SENSOR_DEVICE_ATTR_2_RW(temp8_crit, temp, 7, MAX6697_TEMP_CRIT);
-
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 22);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 16);
-static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, alarm, 17);
-static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, alarm, 18);
-static SENSOR_DEVICE_ATTR_RO(temp5_max_alarm, alarm, 19);
-static SENSOR_DEVICE_ATTR_RO(temp6_max_alarm, alarm, 20);
-static SENSOR_DEVICE_ATTR_RO(temp7_max_alarm, alarm, 21);
-static SENSOR_DEVICE_ATTR_RO(temp8_max_alarm, alarm, 23);
-
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 15);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 8);
-static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, 9);
-static SENSOR_DEVICE_ATTR_RO(temp4_crit_alarm, alarm, 10);
-static SENSOR_DEVICE_ATTR_RO(temp5_crit_alarm, alarm, 11);
-static SENSOR_DEVICE_ATTR_RO(temp6_crit_alarm, alarm, 12);
-static SENSOR_DEVICE_ATTR_RO(temp7_crit_alarm, alarm, 13);
-static SENSOR_DEVICE_ATTR_RO(temp8_crit_alarm, alarm, 14);
-
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_fault, alarm, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_fault, alarm, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_fault, alarm, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_fault, alarm, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_fault, alarm, 7);
-
-/* There is no offset for local temperature so starting from temp2 */
-static SENSOR_DEVICE_ATTR_RW(temp2_offset, offset, 1);
-static SENSOR_DEVICE_ATTR_RW(temp3_offset, offset, 2);
-static SENSOR_DEVICE_ATTR_RW(temp4_offset, offset, 3);
-static SENSOR_DEVICE_ATTR_RW(temp5_offset, offset, 4);
-static SENSOR_DEVICE_ATTR_RW(temp6_offset, offset, 5);
-static SENSOR_DEVICE_ATTR_RW(temp7_offset, offset, 6);
-static SENSOR_DEVICE_ATTR_RW(temp8_offset, offset, 7);
-
-static DEVICE_ATTR(dummy, 0, NULL, NULL);
-
-static umode_t max6697_is_visible(struct kobject *kobj, struct attribute *attr,
-				  int index)
+static umode_t max6697_is_visible(const void *_data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct max6697_data *data = dev_get_drvdata(dev);
+	const struct max6697_data *data = _data;
 	const struct max6697_chip_data *chip = data->chip;
-	int channel = index / 7;	/* channel number */
-	int nr = index % 7;		/* attribute index within channel */
 
 	if (channel >= chip->channels)
 		return 0;
 
-	if ((nr == 3 || nr == 4) && !(chip->have_crit & BIT(channel)))
-		return 0;
-	if (nr == 5 && !(chip->have_fault & BIT(channel)))
-		return 0;
-	/* offset reg is only supported on max6581 remote channels */
-	if (nr == 6)
-		if (data->type != max6581 || channel == 0)
-			return 0;
-
-	return attr->mode;
+	switch (attr) {
+	case hwmon_temp_max:
+		return 0644;
+	case hwmon_temp_input:
+	case hwmon_temp_max_alarm:
+		return 0444;
+	case hwmon_temp_crit:
+		if (chip->have_crit & BIT(channel))
+			return 0644;
+		break;
+	case hwmon_temp_crit_alarm:
+		if (chip->have_crit & BIT(channel))
+			return 0444;
+		break;
+	case hwmon_temp_fault:
+		if (chip->have_fault & BIT(channel))
+			return 0444;
+		break;
+	case hwmon_temp_offset:
+		if (data->type == max6581 && channel)
+			return 0644;
+		break;
+	default:
+		break;
+	}
+	return 0;
 }
 
-/*
- * max6697_is_visible uses the index into the following array to determine
- * if attributes should be created or not. Any change in order or content
- * must be matched in max6697_is_visible.
- */
-static struct attribute *max6697_attributes[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&dev_attr_dummy.attr,
-	&dev_attr_dummy.attr,
-
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_offset.dev_attr.attr,
-
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_offset.dev_attr.attr,
-
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_max.dev_attr.attr,
-	&sensor_dev_attr_temp4_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_crit.dev_attr.attr,
-	&sensor_dev_attr_temp4_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_fault.dev_attr.attr,
-	&sensor_dev_attr_temp4_offset.dev_attr.attr,
-
-	&sensor_dev_attr_temp5_input.dev_attr.attr,
-	&sensor_dev_attr_temp5_max.dev_attr.attr,
-	&sensor_dev_attr_temp5_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp5_crit.dev_attr.attr,
-	&sensor_dev_attr_temp5_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp5_fault.dev_attr.attr,
-	&sensor_dev_attr_temp5_offset.dev_attr.attr,
-
-	&sensor_dev_attr_temp6_input.dev_attr.attr,
-	&sensor_dev_attr_temp6_max.dev_attr.attr,
-	&sensor_dev_attr_temp6_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp6_crit.dev_attr.attr,
-	&sensor_dev_attr_temp6_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp6_fault.dev_attr.attr,
-	&sensor_dev_attr_temp6_offset.dev_attr.attr,
-
-	&sensor_dev_attr_temp7_input.dev_attr.attr,
-	&sensor_dev_attr_temp7_max.dev_attr.attr,
-	&sensor_dev_attr_temp7_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp7_crit.dev_attr.attr,
-	&sensor_dev_attr_temp7_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp7_fault.dev_attr.attr,
-	&sensor_dev_attr_temp7_offset.dev_attr.attr,
-
-	&sensor_dev_attr_temp8_input.dev_attr.attr,
-	&sensor_dev_attr_temp8_max.dev_attr.attr,
-	&sensor_dev_attr_temp8_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp8_crit.dev_attr.attr,
-	&sensor_dev_attr_temp8_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp8_fault.dev_attr.attr,
-	&sensor_dev_attr_temp8_offset.dev_attr.attr,
+/* Return 0 if detection is successful, -ENODEV otherwise */
+static const struct hwmon_channel_info * const max6697_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_FAULT | HWMON_T_OFFSET),
 	NULL
 };
 
-static const struct attribute_group max6697_group = {
-	.attrs = max6697_attributes, .is_visible = max6697_is_visible,
+static const struct hwmon_ops max6697_hwmon_ops = {
+	.is_visible = max6697_is_visible,
+	.read = max6697_read,
+	.write = max6697_write,
+};
+
+static const struct hwmon_chip_info max6697_chip_info = {
+	.ops = &max6697_hwmon_ops,
+	.info = max6697_info,
 };
-__ATTRIBUTE_GROUPS(max6697);
 
 static int max6697_config_of(struct device_node *node, struct max6697_data *data)
 {
@@ -634,9 +517,8 @@ static int max6697_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data,
-							   max6697_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &max6697_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.39.2

