Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633B7F8
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954624; cv=none; b=QLnk2ULXHzJMmM+zPskb8R2mkjyHQMbEC9+jeqB45K3a+h9FP6jbrwA2tG/9b+x9WBuvuGEgvFxS28+4terkiSv78xP4+2MMErw9f9QU2LbLaudIN8h3gVWYOQdZOg9IavgSWrAPPClEqfUdsdagU9KnCIe4q98qEizT6302jVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954624; c=relaxed/simple;
	bh=EH9axeCS4R70WT2AZbd0M0lVZgpU18MMjf47V1L1r7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DBQqBXcKhVAkp6TUBxYmQ0bBgSrrY5zwRe1AuDky1oq/HbsknY5UNtLmPGIMVdvCQtwWCeDmpwYOoFmqWrCZBJuoezoIxSYeMLpYAQ41YqKldqnL6nfU+RBYAUGZOweYQoN+AuPrPTCai5NbgH+J+B6OMb9WWvSOATPLFeRc3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPGphpmL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPGphpmL"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso402414b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721954621; x=1722559421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCXW6NBsWlrOtveo7YWDxfGgi0FLl2/KnvYTnndMY4I=;
        b=kPGphpmLQztBzXc6ZF2aus5PrSVMM1xPXuvcJJ2Z3Kyn9ku/5fCkZBbGRc9lyZLu3y
         7PQV6YbFhalwcz7wcekylNgX0cnr+ntLRkffBwMO0ExLzWP8xKtnDiYYUNLJ6DXpedLC
         utnUN6OUD69GgdiavuHXOTJ1NJk7PqyqLdhWqK1N2X/ZNa/nhpjd3jMcxXpSgWTP2xI/
         9UUyVgeWn824DNz9SbzM8n3xnwYzCc38PDyK3g8jKWt8EvWwNFuwBz7An+KoHdrL1VHr
         mdtz97rNVGIcwcjn5z+cHmgpa3lyICwJf3aBX6IxPd2EHDrtgoqKNhAx1Dpbl9aTZmMj
         O5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721954621; x=1722559421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCXW6NBsWlrOtveo7YWDxfGgi0FLl2/KnvYTnndMY4I=;
        b=dn+7SzIb6zBPpXbulYjJ/zXLg50+5vf/o/x4fLE2Bhc/6Fr5pTZFj6pbNhoPYFE9qR
         nwZiYhHRM7H2rTrSr9QazRjR+hx2FMUifkQGSM0EreFp3WBZ9+WwWwzqkxIAhHdsG20v
         V/iVasZMWqe/W3DaIrmq/iseif4I3iheuoLyNkeFN+S5omlwUMKO4t07K2OG9bTHm50p
         JgaWRgWfw3okSM6w2a57dk7wgPvlqjIMPA9s/iybR5WcJvYoE8kOON5cwCen7ljN7Cj6
         opkoSn9OwXMyzN/aG3otKFnO4p3gef3zvMYBi2qB7tlmI06KnWvpeFZVKvTl2210FVvy
         2gCw==
X-Gm-Message-State: AOJu0Yy8kL3MdxyunuZl9vbcCFjbGPab/6upq4J2Ia03ZMTBDcu/05it
	RIoB8HV3bS3Z6e8fAjQ5b3j2A86ZWzPztAcsS+Ikp4W0IS4JuLCDy/w32Q==
X-Google-Smtp-Source: AGHT+IGPxTffH50NP1/qnTLBvF8A3JWAvuceFSe3Ysr/NSmoayoMhfTJKPTx2Na7t10i8S6uKKxAlg==
X-Received: by 2002:a05:6a00:2388:b0:706:61d5:2792 with SMTP id d2e1a72fcca58-70eaa88be90mr5507244b3a.8.1721954621041;
        Thu, 25 Jul 2024 17:43:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead874619sm1677741b3a.164.2024.07.25.17.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:43:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/5] hwmon: (max1668) Convert to use with_info hwmon API
Date: Thu, 25 Jul 2024 17:43:29 -0700
Message-Id: <20240726004329.934763-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726004329.934763-1-linux@roeck-us.net>
References: <20240726004329.934763-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use with_info API to simplify the code and to reduce its size.

This patch reduces object file size by approximately 25%.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1668.c | 337 ++++++++++++++--------------------------
 1 file changed, 114 insertions(+), 223 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 071c17604131..86f77a3f85c0 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -10,7 +10,6 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
@@ -51,247 +50,144 @@ MODULE_PARM_DESC(read_only, "Don't set any values, read only mode");
 
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
-	return sprintf(buf, "%u\n", (alarm & BIT(12)) && temp == 127);
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
@@ -393,13 +289,8 @@ static int max1668_probe(struct i2c_client *client)
 
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

