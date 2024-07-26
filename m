Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F3145B00
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032175; cv=none; b=UKcuOe3vrOX8ijZS4sPgMw3IZTESbWqPz6cd1mBDYQw3nuS7bKZrh3XRj5aaOCf0JN5al7OdjBPmCjAd+i20ZEFQEs7BVCM74f0FCPcQNT9iKtbiq0DMWks/5dKOynSDN5WJ00z1X/SSX1RTTsEIUHGmclBmPjYCnxhtNhY4O9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032175; c=relaxed/simple;
	bh=tQcttyCDpiBBKqNXI+nI/smu9SwcasY0beoVnelsTMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l0GoLf0+VkiUWZ4KIwDFSxUvK6iuMZlzA/fSLNbtLV//ygiLXyOZ6WU8LnskKnux/66YncsAfLaQUDDNFy4KWs3GxtzamaDTlj9nAwfBrcMPahI4Iq9FU8EUGHvOhu+BHNoi8qJ1sjCI5SMeFr7vNRjXgUoXwzB8NGGU/IZJ9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctNshZG/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctNshZG/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc4fccdd78so9256785ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032172; x=1722636972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujmz13mdjHhISOELB6uSnObnZ5kP0k5qMFCeC8Fo6tk=;
        b=ctNshZG/Qv0Hkd3Oc+tfqpXuzIUdMq7B0Gimw2YZ0bbN/o/txYGoUNl88vXMJR0Vze
         NYSa1V1RIifbvlQk9dbIcLCd25smEbMpSLOO8LYdarDkx0ECyf2sbooooHrK7DinAVCe
         PX5ie6GZFQnKRHk4q7NA584cbhx3vShk/yE+09wKONhVlpNwWcJ2FnkIEaqLcauR7WgH
         E3o0Vow38AOkwyf3sBKCZRzZZOfVfqvsAdIRjg8Acz0Lw6gKGLYgSPj8MeiCnFyxw88/
         54SW6bg4ZycJ2AmnYNrkfR24I9WJ3cZrUTQMqzrTKFMgIxGL2jwZhQGkB55GSHw9O7gP
         6CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032172; x=1722636972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujmz13mdjHhISOELB6uSnObnZ5kP0k5qMFCeC8Fo6tk=;
        b=gujMUEuWqI2vCWrg11auP0LdOjw9BRyW2oD9IFqpNdVUuTW8HybVBueY366enT+q1x
         oVvcivo/u4At8KLk4hJx9FQ9m1iTtV78idNq4qbncUg3fYztF+5+PJNoM2jS843ARCdK
         IQhBNnwUQE69Bt+uwJP43a8fU/PAzen3sjHYg+sZEfliay13f6x4CE5EanBaZmkQO96R
         CsoN697LBJLuB6oG7M4z733PuMcEqNkpWTVJAHucVLFSXwHHpePz0aAUw4VLJqrP6WX/
         rwAKVRTaaKTcv8FuLudnOaIbeMi9m7hqnq7y/MxR03bkz8mfCTg4YyhXVkW17I5V4ptK
         YrBA==
X-Gm-Message-State: AOJu0Ywew7cPjIj2ftAWRpoF2cFtDo/xkgC5ddRWtd6/oDKxWxo2gf1I
	AvbeZzu728ed/6geIo7qwXvNpkXAbMgS/A/oNLEV27VAENUsQ1m9vFC6Sg==
X-Google-Smtp-Source: AGHT+IEAo47pKi34ICdDZGq4PUGRrAirGzAqqJhFy0oQkB0KuoAU6BiwGjLuQutd9mFaxNQSAPVy2Q==
X-Received: by 2002:a17:902:fc46:b0:1ff:52c:34ce with SMTP id d9443c01a7336-1ff052c3e33mr10679985ad.53.1722032171905;
        Fri, 26 Jul 2024 15:16:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fbf285sm38559645ad.267.2024.07.26.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:16:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/5] hwmon: (max1668) Convert to use regmap
Date: Fri, 26 Jul 2024 15:16:01 -0700
Message-Id: <20240726221603.1190437-4-linux@roeck-us.net>
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

Use regmap for caching to simplify the code and to hide read/write
register address differences.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Dropped no longer needed jiffies.h and mutex.h includes
    Fixed wrong fault bit mask

 drivers/hwmon/max1668.c | 215 ++++++++++++++++++----------------------
 1 file changed, 99 insertions(+), 116 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 83085ed0ae7e..c7eae28c0b01 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -6,15 +6,15 @@
  * some credit to Christoph Scheurer, but largely a rewrite
  */
 
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 /* Addresses to scan */
@@ -31,14 +31,10 @@ static const unsigned short max1668_addr_list[] = {
 
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
@@ -54,139 +50,91 @@ MODULE_PARM_DESC(read_only, "Don't set any values, read only mode");
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
+	return sprintf(buf, "%u\n", (alarm & BIT(4)) && temp == 127);
 }
 
 static ssize_t set_temp_max(struct device *dev,
@@ -195,7 +143,6 @@ static ssize_t set_temp_max(struct device *dev,
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct max1668_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	long temp;
 	int ret;
 
@@ -203,14 +150,10 @@ static ssize_t set_temp_max(struct device *dev,
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
@@ -221,7 +164,6 @@ static ssize_t set_temp_min(struct device *dev,
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct max1668_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	long temp;
 	int ret;
 
@@ -229,14 +171,10 @@ static ssize_t set_temp_min(struct device *dev,
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
@@ -392,6 +330,48 @@ static int max1668_detect(struct i2c_client *client,
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
@@ -406,9 +386,12 @@ static int max1668_probe(struct i2c_client *client)
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

