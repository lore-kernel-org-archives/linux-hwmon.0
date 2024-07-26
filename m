Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29F143C6A
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032178; cv=none; b=WYHevEXK3UDSkJPDGngvFt3sPeD1ObEeMd4k+h2oJCYyF8+Z98w3EdkiclY7FMpO0zWWSeJI28TAbvVwZXv5Xip7CkJMju01DKKe6nSah21wiTlbL2GzAZV9ouzh37yJhMBucnJu11CU3ZDsylY7kRR3xjckTPul/CEYKADid7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032178; c=relaxed/simple;
	bh=hdOqATi7V7ons+f6SmCPsNjpiudcNOZjO+9v2n145Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n+YrThRl4fy8WxkTR4xG8S0fmylLQYlCDwlQaHztoewt0HME4FCcn4pPKrl5TRxX3XHT98zQUmw2NaQJMArMM6K95rA7PppiPazPdcuKQqTZIHXlvM8o++wl65SAmCSbTurpzGmLuGV9SAHwLZb1KUSUBYWRrojNtIU5JLaAVTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GByLepEM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GByLepEM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb6662ba3aso964345a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032176; x=1722636976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20n1mgY9VWNYW8kklXMJzqW7jBitYbssfc+A5oatdLc=;
        b=GByLepEMG3vkp/apDdarTg4NGG1nlnQbyDaVdIXnm7YU3Dj3n1WcxDBE0MQ9GL+WAu
         Bd1I+zFpHiw7+nubP1o5cXuayEp+pqM/CaZdDvDEZ6eZKARPwul9Rpa66pA6+aeLbNDQ
         DCFU32vhY/RfnkKUFLayXGuB9N3QrxtnbSV+ZtzH9QQRhMetjUwzuZSCoX5KPod8o8zu
         HBhupcp2lQhqVh/GOI7jPoby/38IfddQm4W50Y4V6UmCLCR5M7eGNrvfZ/VoL3pRKsU2
         XwjMSzs/nEF1BijEXB23YJuYnE9eYccWHzzP0A/iUPebZsA+iIdZk/etWHaGDCkGT6S4
         K9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032176; x=1722636976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20n1mgY9VWNYW8kklXMJzqW7jBitYbssfc+A5oatdLc=;
        b=GOVrBF+mU7hxFWfPcWXHxwtBJCA3kDkhugZJb0di7tEPyVrgeleON9UiBldglmfZaq
         GHWkpQoJW9NGucj9qXsG9TJ8Y6loJWNME12sl4llINNcrHPpqDMwxHSgHyumKAUJ9TWd
         G/2Ufa6rJtmvXFmrGFk3wLD4FnDpbqIkt35HSm+rY2Vh+Gf9tnjur2uQE/Mn+uNSb56+
         IYiaQwZYA7QWdFIIlYqROnFsjzW3nN6rjjXfAPIewQDTqVrN7pvj7SewvQ5mTUb6ba1P
         q2Ziz0yHGmIUVrD5a2wpZIxgzVyDf0M3anwtHQHwBsUtzyHHbMMbdI4kKGF5WzZOVVpw
         wjZg==
X-Gm-Message-State: AOJu0YykqmW54NPOzcrns5LnqDzvJ8Lj1fBC+2JtkSYVbdHBPMApLlpZ
	LhQUHalN/0h8jwuleVNnmG73yN5HSuL7ow6thZwCZImWl3QYTwkW+7OhgQ==
X-Google-Smtp-Source: AGHT+IFeQFdvM85GLG3FOOIdZF1CXE7ZKUp8LO2jCIYqLeY2DRrMGoD3rI7ioe4cTpBqVTcoTRXgEw==
X-Received: by 2002:a17:90b:1211:b0:2cb:56bd:5d7 with SMTP id 98e67ed59e1d1-2cf7ce8abc6mr1498849a91.5.1722032175732;
        Fri, 26 Jul 2024 15:16:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e1a40sm3186110b3a.37.2024.07.26.15.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:16:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 5/5] hwmon: (max1668) Convert to use with_info hwmon API
Date: Fri, 26 Jul 2024 15:16:03 -0700
Message-Id: <20240726221603.1190437-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726221603.1190437-1-linux@roeck-us.net>
References: <20240726221603.1190437-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use with_info API to simplify the code and to reduce its size.

This patch reduces object file size by approximately 25%.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1668.c | 337 ++++++++++++++--------------------------
 1 file changed, 114 insertions(+), 223 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index f8180a8597c0..a8197a86f559 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -10,7 +10,6 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -49,247 +48,144 @@ MODULE_PARM_DESC(read_only, "Don't set any values, read only mode");
 
 struct max1668_data {
 	struct regmap *regmap;
-	const struct attribute_group *groups[3];
 	int channels;
 };
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static int max1668_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = dev_get_drvdata(dev);
-	u32 temp;
-	int ret;
-
-	ret = regmap_read(data->regmap, MAX1668_REG_TEMP(index), &temp);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
-}
-
-static ssize_t show_temp_max(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = dev_get_drvdata(dev);
-	u32 temp;
-	int ret;
-
-	ret = regmap_read(data->regmap, MAX1668_REG_LIMH(index), &temp);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
-}
-
-static ssize_t show_temp_min(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = dev_get_drvdata(dev);
-	u32 temp;
-	int ret;
-
-	ret = regmap_read(data->regmap, MAX1668_REG_LIML(index), &temp);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
-}
-
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	int index = to_sensor_dev_attr(attr)->index;
-	struct max1668_data *data = dev_get_drvdata(dev);
-	u32 alarm;
-	int ret;
-
-	ret = regmap_read(data->regmap,
-			  index >= 8 ? MAX1668_REG_STAT1 : MAX1668_REG_STAT2,
-			  &alarm);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%u\n", !!(alarm & BIT(index & 7)));
-}
-
-static ssize_t show_fault(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct max1668_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
-	u32 alarm, temp;
+	u32 regs[2] = { MAX1668_REG_STAT1, MAX1668_REG_TEMP(channel) };
+	u8 regvals[2];
+	u32 regval;
 	int ret;
 
-	ret = regmap_read(regmap, MAX1668_REG_STAT1, &alarm);
-	if (ret)
-		return ret;
-
-	ret = regmap_read(regmap, MAX1668_REG_TEMP(index), &temp);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%u\n", (alarm & BIT(4)) && temp == 127);
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = regmap_read(regmap, MAX1668_REG_TEMP(channel), &regval);
+		if (ret)
+			return ret;
+		*val = sign_extend32(regval, 7) * 1000;
+		break;
+	case hwmon_temp_min:
+		ret = regmap_read(regmap, MAX1668_REG_LIML(channel), &regval);
+		if (ret)
+			return ret;
+		*val = sign_extend32(regval, 7) * 1000;
+		break;
+	case hwmon_temp_max:
+		ret = regmap_read(regmap, MAX1668_REG_LIMH(channel), &regval);
+		if (ret)
+			return ret;
+		*val = sign_extend32(regval, 7) * 1000;
+		break;
+	case hwmon_temp_min_alarm:
+		ret = regmap_read(regmap,
+				  channel ? MAX1668_REG_STAT2 : MAX1668_REG_STAT1,
+				  &regval);
+		if (ret)
+			return ret;
+		if (channel)
+			*val = !!(regval & BIT(9 - channel * 2));
+		else
+			*val = !!(regval & BIT(5));
+		break;
+	case hwmon_temp_max_alarm:
+		ret = regmap_read(regmap,
+				  channel ? MAX1668_REG_STAT2 : MAX1668_REG_STAT1,
+				  &regval);
+		if (ret)
+			return ret;
+		if (channel)
+			*val = !!(regval & BIT(8 - channel * 2));
+		else
+			*val = !!(regval & BIT(6));
+		break;
+	case hwmon_temp_fault:
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
+		if (ret)
+			return ret;
+		*val = !!((regvals[0] & BIT(4)) && regvals[1] == 127);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-static ssize_t set_temp_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static int max1668_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct max1668_data *data = dev_get_drvdata(dev);
-	long temp;
-	int ret;
+	struct regmap *regmap = data->regmap;
 
-	ret = kstrtol(buf, 10, &temp);
-	if (ret < 0)
-		return ret;
+	val = clamp_val(val / 1000, -128, 127);
 
-	temp = clamp_val(temp / 1000, -128, 127);
-	ret = regmap_write(data->regmap, MAX1668_REG_LIMH(index), temp);
-	if (ret < 0)
-		count = ret;
-
-	return count;
+	switch (attr) {
+	case hwmon_temp_min:
+		return regmap_write(regmap, MAX1668_REG_LIML(channel), val);
+	case hwmon_temp_max:
+		return regmap_write(regmap, MAX1668_REG_LIMH(channel), val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_temp_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static umode_t max1668_is_visible(const void *_data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = dev_get_drvdata(dev);
-	long temp;
-	int ret;
+	const struct max1668_data *data = _data;
 
-	ret = kstrtol(buf, 10, &temp);
-	if (ret < 0)
-		return ret;
+	if (channel >= data->channels)
+		return 0;
 
-	temp = clamp_val(temp / 1000, -128, 127);
-	ret = regmap_write(data->regmap, MAX1668_REG_LIML(index), temp);
-	if (ret < 0)
-		count = ret;
-
-	return count;
+	switch (attr) {
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+		return read_only ? 0444 : 0644;
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+		return 0444;
+	case hwmon_temp_fault:
+		if (channel)
+			return 0444;
+		break;
+	default:
+		break;
+	}
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, show_temp_max,
-				set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO, show_temp_min,
-				set_temp_min, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO, show_temp_max,
-				set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IRUGO, show_temp_min,
-				set_temp_min, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IRUGO, show_temp_max,
-				set_temp_max, 2);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IRUGO, show_temp_min,
-				set_temp_min, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IRUGO, show_temp_max,
-				set_temp_max, 3);
-static SENSOR_DEVICE_ATTR(temp4_min, S_IRUGO, show_temp_min,
-				set_temp_min, 3);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp5_max, S_IRUGO, show_temp_max,
-				set_temp_max, 4);
-static SENSOR_DEVICE_ATTR(temp5_min, S_IRUGO, show_temp_min,
-				set_temp_min, 4);
-
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 14);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 13);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp4_min_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_max_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp5_min_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp5_max_alarm, S_IRUGO, show_alarm, NULL, 0);
-
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_fault, S_IRUGO, show_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_fault, S_IRUGO, show_fault, NULL, 4);
-
-/* Attributes common to MAX1668, MAX1989 and MAX1805 */
-static struct attribute *max1668_attribute_common[] = {
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_min.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_min_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
+static const struct hwmon_channel_info * const max1668_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			   HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			   HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			   HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			   HWMON_T_FAULT),
 	NULL
 };
 
-/* Attributes not present on MAX1805 */
-static struct attribute *max1668_attribute_unique[] = {
-	&sensor_dev_attr_temp4_max.dev_attr.attr,
-	&sensor_dev_attr_temp4_min.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp5_max.dev_attr.attr,
-	&sensor_dev_attr_temp5_min.dev_attr.attr,
-	&sensor_dev_attr_temp5_input.dev_attr.attr,
-
-	&sensor_dev_attr_temp4_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp5_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp5_min_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp4_fault.dev_attr.attr,
-	&sensor_dev_attr_temp5_fault.dev_attr.attr,
-	NULL
+static const struct hwmon_ops max1668_hwmon_ops = {
+	.is_visible = max1668_is_visible,
+	.read = max1668_read,
+	.write = max1668_write,
 };
 
-static umode_t max1668_attribute_mode(struct kobject *kobj,
-				     struct attribute *attr, int index)
-{
-	umode_t ret = S_IRUGO;
-	if (read_only)
-		return ret;
-	if (attr == &sensor_dev_attr_temp1_max.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp2_max.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp3_max.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp4_max.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp5_max.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp1_min.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp2_min.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp3_min.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp4_min.dev_attr.attr ||
-	    attr == &sensor_dev_attr_temp5_min.dev_attr.attr)
-		ret |= S_IWUSR;
-	return ret;
-}
-
-static const struct attribute_group max1668_group_common = {
-	.attrs = max1668_attribute_common,
-	.is_visible = max1668_attribute_mode
-};
-
-static const struct attribute_group max1668_group_unique = {
-	.attrs = max1668_attribute_unique,
-	.is_visible = max1668_attribute_mode
+static const struct hwmon_chip_info max1668_chip_info = {
+	.ops = &max1668_hwmon_ops,
+	.info = max1668_info,
 };
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
@@ -391,13 +287,8 @@ static int max1668_probe(struct i2c_client *client)
 
 	data->channels = (uintptr_t)i2c_get_match_data(client);
 
-	/* sysfs hooks */
-	data->groups[0] = &max1668_group_common;
-	if (data->channels == 5)
-		data->groups[1] = &max1668_group_unique;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &max1668_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.39.2

