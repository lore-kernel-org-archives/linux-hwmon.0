Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332C7F8
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 00:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954620; cv=none; b=GNMoQOwCrG/QBIZoJs0ay14lp88J8Zz4TUMe1tVA9m0bCFFpejiDvBrCPtapomU60P/IMsLfLSkxASYvvxWlFguIR6PZd/YTvxePWxRan+rngNpMPdi6ot0g4na2DCfLl3QhLt60YCePo6cLCGlJUFZPcLIM2PjrksMbKou3PSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954620; c=relaxed/simple;
	bh=sJ4ec0VsW/lYIvBjkzqWcIFosfOl1DXQL8c80Kvjib0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZPwYjt8T6b5GCAy5JXNSdyZhqOWpmLx4JtW1p7l6Yva1eXcLbRTH6m2LHrl44hLYkQiGkmNV/ZI5x7tFGsvrZmeIBrdI/OmVI8BxOFZlQiQjmFwAPyrfQeuwU+hSQxdxMoieHgvsT3Q0mi4+Ys4VwuBRsV6PMfHLCOFFbjF/EOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iI2GZHAX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI2GZHAX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70eb0ae23e4so367001b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721954618; x=1722559418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fB4rWSA75m+3bDIKlV6IH6eF8vMXOGsxT0cmgrUQois=;
        b=iI2GZHAXJzW207H03XnW5tuZbRTwSv2gEUnTEsUXF3vZ97STmTdqvHAYw/GH4Q3U+s
         mV8oUD7xNtHKhj2+qLlAo4vwrO0fBHg5Fl+Yx6FHEu2F0SXRIgOUdh21WIDripdJOEJ8
         rkqxjrc19mDJHqzJSqsL++mq9Qc6cgjBLHLbdGaG/CCerS6ElBtuw2WKT2+fyKURX06e
         5StlgVmiyfBtg0Vq6tYMfy6fgs8hn1DoskN1uD6/RStWGJwMQpTCr4wpjwcD7eixs3TB
         Yjhh2ImVbRSIBC8iF2Rkz/kZrMcWkhHMy0dSnn8vZ9RNlUs+VD/fQgydg+En6xaiT5vD
         ldOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721954618; x=1722559418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fB4rWSA75m+3bDIKlV6IH6eF8vMXOGsxT0cmgrUQois=;
        b=aMAHBVFfoiiIpvyZo4AwglGR4ATE121pcfydowWMjR46n0QY4d96iqHE/yvvnPTq3U
         UAIXScOvbt3xbmveOrFQSwsnzCmNDuv4BFUR3MTCqUyzzcd4vI7CnVZKOqNBkEGIXQYE
         5lzbMkSfyjAmwYADxsnEl+safE/Q+M4mrGz9Rp0eotlj+L1li+MfGleT4GutNCJHSpQK
         XQqFbg8UZy2iyax+xGRXXrusCS9AJcb5DF8yhd+/s4aUCb4WvZvAIWdrkvOa2TLToCKe
         rNX7ZU5enTJOqcanZ/KkcsfdbfmeBzmWxbu9RBke62YWhj0/X5YTwfiniKGNt3jGYmey
         A2YA==
X-Gm-Message-State: AOJu0YyzJaSip6ib3JqRNqLXELQ02jlxqSSqQ0nIFT7e30QWzVUHU+q4
	PBBtSJho1eV6jpOZQfoVupjr4sPptTVTdUrhI4oYqR6r1QmYuW41lot0QA==
X-Google-Smtp-Source: AGHT+IHSNE3nZX0qyF6PM/wBPmAbeVZ818rHBtU6mp5TcHag1dLfvuJ2EqXN8V+4gRmiX2vH+PDxxQ==
X-Received: by 2002:a05:6a21:78a5:b0:1c2:8d2f:65f4 with SMTP id adf61e73a8af0-1c47b4f0ca2mr4438877637.44.1721954617439;
        Thu, 25 Jul 2024 17:43:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74e894csm4198685a91.41.2024.07.25.17.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:43:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] hwmon: (max1668) Convert to use regmap
Date: Thu, 25 Jul 2024 17:43:27 -0700
Message-Id: <20240726004329.934763-4-linux@roeck-us.net>
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

Use regmap for caching to simplify the code and to hide read/write
register address differences.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1668.c | 213 +++++++++++++++++++---------------------
 1 file changed, 99 insertions(+), 114 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 83085ed0ae7e..48f247ca5d85 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -6,6 +6,7 @@
  * some credit to Christoph Scheurer, but largely a rewrite
  */
 
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
@@ -15,6 +16,7 @@
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 /* Addresses to scan */
@@ -31,14 +33,10 @@ static const unsigned short max1668_addr_list[] = {
 
 /* limits */
 
-/* write high limits */
-#define MAX1668_REG_LIMH_WR(nr)	(0x13 + 2 * (nr))
-/* write low limits */
-#define MAX1668_REG_LIML_WR(nr)	(0x14 + 2 * (nr))
-/* read high limits */
-#define MAX1668_REG_LIMH_RD(nr)	(0x08 + 2 * (nr))
+/* high limits */
+#define MAX1668_REG_LIMH(nr)	(0x08 + 2 * (nr))
 /* read low limits */
-#define MAX1668_REG_LIML_RD(nr)	(0x09 + 2 * (nr))
+#define MAX1668_REG_LIML(nr)	(0x09 + 2 * (nr))
 
 /* manufacturer and device ID Constants */
 #define MAN_ID_MAXIM		0x4d
@@ -54,139 +52,91 @@ MODULE_PARM_DESC(read_only, "Don't set any values, read only mode");
 enum chips { max1668, max1805, max1989 };
 
 struct max1668_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	const struct attribute_group *groups[3];
 	enum chips type;
-
-	struct mutex update_lock;
-	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
-
-	/* 1x local and 4x remote */
-	s8 temp_max[5];
-	s8 temp_min[5];
-	s8 temp[5];
-	u16 alarms;
 };
 
-static struct max1668_data *max1668_update_device(struct device *dev)
-{
-	struct max1668_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	struct max1668_data *ret = data;
-	s32 val;
-	int i;
-
-	mutex_lock(&data->update_lock);
-
-	if (data->valid && !time_after(jiffies,
-			data->last_updated + HZ + HZ / 2))
-		goto abort;
-
-	for (i = 0; i < 5; i++) {
-		val = i2c_smbus_read_byte_data(client, MAX1668_REG_TEMP(i));
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->temp[i] = (s8) val;
-
-		val = i2c_smbus_read_byte_data(client, MAX1668_REG_LIMH_RD(i));
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->temp_max[i] = (s8) val;
-
-		val = i2c_smbus_read_byte_data(client, MAX1668_REG_LIML_RD(i));
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->temp_min[i] = (s8) val;
-	}
-
-	val = i2c_smbus_read_byte_data(client, MAX1668_REG_STAT1);
-	if (unlikely(val < 0)) {
-		ret = ERR_PTR(val);
-		goto abort;
-	}
-	data->alarms = val << 8;
-
-	val = i2c_smbus_read_byte_data(client, MAX1668_REG_STAT2);
-	if (unlikely(val < 0)) {
-		ret = ERR_PTR(val);
-		goto abort;
-	}
-	data->alarms |= val;
-
-	data->last_updated = jiffies;
-	data->valid = true;
-abort:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
-}
-
 static ssize_t show_temp(struct device *dev,
 			 struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = max1668_update_device(dev);
+	struct max1668_data *data = dev_get_drvdata(dev);
+	u32 temp;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, MAX1668_REG_TEMP(index), &temp);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%d\n", data->temp[index] * 1000);
+	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
 }
 
 static ssize_t show_temp_max(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = max1668_update_device(dev);
+	struct max1668_data *data = dev_get_drvdata(dev);
+	u32 temp;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, MAX1668_REG_LIMH(index), &temp);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%d\n", data->temp_max[index] * 1000);
+	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
 }
 
 static ssize_t show_temp_min(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = max1668_update_device(dev);
+	struct max1668_data *data = dev_get_drvdata(dev);
+	u32 temp;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, MAX1668_REG_LIML(index), &temp);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%d\n", data->temp_min[index] * 1000);
+	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
 }
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
-	struct max1668_data *data = max1668_update_device(dev);
+	struct max1668_data *data = dev_get_drvdata(dev);
+	u32 alarm;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap,
+			  index >= 8 ? MAX1668_REG_STAT1 : MAX1668_REG_STAT2,
+			  &alarm);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%u\n", !!(data->alarms & BIT(index)));
+	return sprintf(buf, "%u\n", !!(alarm & BIT(index & 7)));
 }
 
 static ssize_t show_fault(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
-	struct max1668_data *data = max1668_update_device(dev);
+	struct max1668_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 alarm, temp;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(regmap, MAX1668_REG_STAT1, &alarm);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%u\n",
-		       (data->alarms & BIT(12)) && data->temp[index] == 127);
+	ret = regmap_read(regmap, MAX1668_REG_TEMP(index), &temp);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%u\n", (alarm & BIT(12)) && temp == 127);
 }
 
 static ssize_t set_temp_max(struct device *dev,
@@ -195,7 +145,6 @@ static ssize_t set_temp_max(struct device *dev,
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct max1668_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	long temp;
 	int ret;
 
@@ -203,14 +152,10 @@ static ssize_t set_temp_max(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	mutex_lock(&data->update_lock);
-	data->temp_max[index] = clamp_val(temp/1000, -128, 127);
-	ret = i2c_smbus_write_byte_data(client,
-					MAX1668_REG_LIMH_WR(index),
-					data->temp_max[index]);
+	temp = clamp_val(temp / 1000, -128, 127);
+	ret = regmap_write(data->regmap, MAX1668_REG_LIMH(index), temp);
 	if (ret < 0)
 		count = ret;
-	mutex_unlock(&data->update_lock);
 
 	return count;
 }
@@ -221,7 +166,6 @@ static ssize_t set_temp_min(struct device *dev,
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct max1668_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	long temp;
 	int ret;
 
@@ -229,14 +173,10 @@ static ssize_t set_temp_min(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	mutex_lock(&data->update_lock);
-	data->temp_min[index] = clamp_val(temp/1000, -128, 127);
-	ret = i2c_smbus_write_byte_data(client,
-					MAX1668_REG_LIML_WR(index),
-					data->temp_min[index]);
+	temp = clamp_val(temp / 1000, -128, 127);
+	ret = regmap_write(data->regmap, MAX1668_REG_LIML(index), temp);
 	if (ret < 0)
 		count = ret;
-	mutex_unlock(&data->update_lock);
 
 	return count;
 }
@@ -392,6 +332,48 @@ static int max1668_detect(struct i2c_client *client,
 	return 0;
 }
 
+/* regmap */
+
+static int max1668_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(context, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+	return 0;
+}
+
+static int max1668_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	return i2c_smbus_write_byte_data(context, reg + 11, val);
+}
+
+static bool max1668_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	return reg <= MAX1668_REG_STAT2;
+}
+
+static bool max1668_regmap_is_writeable(struct device *dev, unsigned int reg)
+{
+	return reg > MAX1668_REG_STAT2 && reg <= MAX1668_REG_LIML(4);
+}
+
+static const struct regmap_config max1668_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = max1668_regmap_is_volatile,
+	.writeable_reg = max1668_regmap_is_writeable,
+};
+
+static const struct regmap_bus max1668_regmap_bus = {
+	.reg_write = max1668_reg_write,
+	.reg_read = max1668_reg_read,
+};
+
 static int max1668_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
@@ -406,9 +388,12 @@ static int max1668_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
+	data->regmap = devm_regmap_init(dev, &max1668_regmap_bus, client,
+					&max1668_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
 	data->type = (uintptr_t)i2c_get_match_data(client);
-	mutex_init(&data->update_lock);
 
 	/* sysfs hooks */
 	data->groups[0] = &max1668_group_common;
-- 
2.39.2

