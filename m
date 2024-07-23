Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047DF1534FB
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749499; cv=none; b=dJ/9AAdJubtCAXFo8u8T1VMX3ktn0cuB2QB7aCudRwQS2BtqnfRRqZOlZoF+ctQ+AyllN26zmP9kkeXbmFshzt9vnLISXgxcHbwvdBLnx+9FZyU71+9EA81377fqImXACfwkVnzhXhLoGpK4PyUrinWaKgr6vEBGYCp4DEW8iHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749499; c=relaxed/simple;
	bh=EmXklHQ9KfXEYtpi26JFqxUt9CASlxcmp9LAMxTIK6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FWYE08R+CFG1iKE0SadlZowHFkWX7kMGh0yVKjrj809FJW/11qx783B+AGOadSMPKnEYv6lZTkPORydPsT25+XFLnOauU4H1y+sT0Qwj3VZcDEDPPuqYGzTQAr/AzztnWbwHvORc2EYlNW0baVpMcXV14Ngv2wMzvZMCWDlRO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8EyVi3I; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8EyVi3I"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd6ed7688cso8208815ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749497; x=1722354297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk0fioGvNzL/dsAOXbj5hC+LKBistYdQVP/IuLjBRlg=;
        b=D8EyVi3IFiggCzVZ+0eKswJkDPRVod12PyjUEna3198WJRkWPp3vse6JwkrWbL5fJA
         MurQsb+rjbga7vfpARsLXy5P4DQE0xSyiP3+JDW/hPVDfppO9wl6P+bKJs5ezx5vHLPP
         k0NB0QOQOdZ2tJi/MMbxeTjlZBw1Gw8ru6SyIf5T2uR6kkN1FUHxfnIaLAGoQtalgFJs
         /BD3er2jAZ7LkwuzFWOCig+I0i+dSfMje1EFEfUbgtYUAmEJwXT9tiUOu4iejSKfVT0D
         3sovXB3eaCdbiKsEWjvW5IlZ0BBzvjsbyDeiAbPtSK1sIqAwhR/rFCFpfkQOmhLgvPj6
         mhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749497; x=1722354297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hk0fioGvNzL/dsAOXbj5hC+LKBistYdQVP/IuLjBRlg=;
        b=vK94iDZ3sWxzRS7tFNqVODjP602fF/3wK1ys6TBqCcpC3U3TGIQlCbjmWVnCS+rHKL
         yyM/6ii5uMEVMS/MlCfiB416G5PMyDhI7xN6FW3D4EMCV2U9h74AbOs9Ug6iKbZJV6ki
         LXBuXSLb2WzlM/KLCBq2ifC93+0ekNEOdsiA0F37q8OpUtuObpqyQguTgA3/rfI2vsMq
         XrsLLtLPUw7I489uJQr84G07UMJT6n2Y1xMpxi9iGxfTnMakripNtlKvgTdAP9bhl4og
         OyFFx0+Nl0I4+YKuQlfmLSQCqoxkkjwN+60sNryn4zrYzQKTXLD68jTKVlU0LadLiqBa
         z4Lg==
X-Gm-Message-State: AOJu0YykyyvJNh1JecUD9QMZvYRXqOXlcNZhSBrqmBZ+Y73uU41AQ5so
	Ej9zGe+wsG40nbg07pFDjEGTBgWe6mytnE/tzUYzP1vORykk9PGpTeJU7g==
X-Google-Smtp-Source: AGHT+IH9RWeZfMtP9OwtMfa97Yiv+4biI+MoAk8JTVX/zgJQQhEHIarPtsM3AhMlzTVk+9c2N6kq4Q==
X-Received: by 2002:a17:902:f9c7:b0:1fd:6529:7447 with SMTP id d9443c01a7336-1fdb5ed6572mr21814145ad.29.1721749496673;
        Tue, 23 Jul 2024 08:44:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f25710dsm76464935ad.8.2024.07.23.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:44:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 4/6] hwmon: (max6697) Convert to use regmap
Date: Tue, 23 Jul 2024 08:44:45 -0700
Message-Id: <20240723154447.2669995-5-linux@roeck-us.net>
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

Use regmap for register caching, and use regmap API for bit operations
to simplify the code.

This patch reduces object file size by approximately 10%.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max6697.c | 317 +++++++++++++++-------------------------
 1 file changed, 121 insertions(+), 196 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 1e7c549ef090..e4bec33d1d44 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -13,10 +13,10 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 enum chips { max6581, max6602, max6622, max6636, max6689, max6693, max6694,
@@ -82,20 +82,15 @@ struct max6697_chip_data {
 };
 
 struct max6697_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 
 	enum chips type;
 	const struct max6697_chip_data *chip;
 
-	int update_interval;	/* in milli-seconds */
 	int temp_offset;	/* in degrees C */
 
 	struct mutex update_lock;
-	unsigned long last_updated;	/* In jiffies */
-	bool valid;		/* true if following fields are valid */
 
-	/* 1x local and up to 7x remote */
-	u8 temp[8][4];		/* [nr][0]=temp [1]=ext [2]=max [3]=crit */
 #define MAX6697_TEMP_INPUT	0
 #define MAX6697_TEMP_EXT	1
 #define MAX6697_TEMP_MAX	2
@@ -189,88 +184,22 @@ static inline int max6581_offset_to_millic(int val)
 	return sign_extend32(val, 7) * 250;
 }
 
-static struct max6697_data *max6697_update_device(struct device *dev)
-{
-	struct max6697_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	struct max6697_data *ret = data;
-	int val;
-	int i;
-	u32 alarms;
-
-	mutex_lock(&data->update_lock);
-
-	if (data->valid &&
-	    !time_after(jiffies, data->last_updated
-			+ msecs_to_jiffies(data->update_interval)))
-		goto abort;
-
-	for (i = 0; i < data->chip->channels; i++) {
-		if (data->chip->have_ext & BIT(i)) {
-			val = i2c_smbus_read_byte_data(client,
-						       MAX6697_REG_TEMP_EXT[i]);
-			if (unlikely(val < 0)) {
-				ret = ERR_PTR(val);
-				goto abort;
-			}
-			data->temp[i][MAX6697_TEMP_EXT] = val;
-		}
-
-		val = i2c_smbus_read_byte_data(client, MAX6697_REG_TEMP[i]);
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->temp[i][MAX6697_TEMP_INPUT] = val;
-
-		val = i2c_smbus_read_byte_data(client, MAX6697_REG_MAX[i]);
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->temp[i][MAX6697_TEMP_MAX] = val;
-
-		if (data->chip->have_crit & BIT(i)) {
-			val = i2c_smbus_read_byte_data(client,
-						       MAX6697_REG_CRIT[i]);
-			if (unlikely(val < 0)) {
-				ret = ERR_PTR(val);
-				goto abort;
-			}
-			data->temp[i][MAX6697_TEMP_CRIT] = val;
-		}
-	}
-
-	alarms = 0;
-	for (i = 0; i < 3; i++) {
-		val = i2c_smbus_read_byte_data(client, MAX6697_REG_STAT(i));
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		alarms = (alarms << 8) | val;
-	}
-	data->alarms = alarms;
-	data->last_updated = jiffies;
-	data->valid = true;
-abort:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
-}
-
 static ssize_t temp_input_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
+	struct max6697_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(devattr)->index;
-	struct max6697_data *data = max6697_update_device(dev);
-	int temp;
+	unsigned int regs[2] = { MAX6697_REG_TEMP[index],
+				 MAX6697_REG_TEMP_EXT[index] };
+	u8 regdata[2] = { };
+	int temp, ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_multi_reg_read(data->regmap, regs, regdata,
+				    data->chip->have_ext & BIT(index) ? 2 : 1);
+	if (ret)
+		return ret;
 
-	temp = (data->temp[index][MAX6697_TEMP_INPUT] - data->temp_offset) << 3;
-	temp |= data->temp[index][MAX6697_TEMP_EXT] >> 5;
+	temp = ((regdata[0] - data->temp_offset) << 3) | (regdata[1] >> 5);
 
 	return sprintf(buf, "%d\n", temp * 125);
 }
@@ -278,33 +207,41 @@ static ssize_t temp_input_show(struct device *dev,
 static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
-	int nr = to_sensor_dev_attr_2(devattr)->nr;
+	struct max6697_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr_2(devattr)->index;
-	struct max6697_data *data = max6697_update_device(dev);
-	int temp;
+	int nr = to_sensor_dev_attr_2(devattr)->nr;
+	unsigned int temp;
+	int reg, ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	if (index == MAX6697_TEMP_MAX)
+		reg = MAX6697_REG_MAX[nr];
+	else
+		reg = MAX6697_REG_CRIT[nr];
 
-	temp = data->temp[nr][index];
-	temp -= data->temp_offset;
+	ret = regmap_read(data->regmap, reg, &temp);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%d\n", temp * 1000);
+	return sprintf(buf, "%d\n", ((int)temp - data->temp_offset) * 1000);
 }
 
 static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	struct max6697_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	struct max6697_data *data = max6697_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	unsigned int alarms;
+	int reg, ret;
 
 	if (data->chip->alarm_map)
 		index = data->chip->alarm_map[index];
 
-	return sprintf(buf, "%u\n", !!(data->alarms & BIT(index)));
+	reg = MAX6697_REG_STAT(2 - (index / 8));
+	ret = regmap_read(data->regmap, reg, &alarms);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%u\n", !!(alarms & BIT(index & 7)));
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -321,82 +258,63 @@ static ssize_t temp_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	mutex_lock(&data->update_lock);
 	temp = clamp_val(temp, -1000000, 1000000);	/* prevent underflow */
 	temp = DIV_ROUND_CLOSEST(temp, 1000) + data->temp_offset;
 	temp = clamp_val(temp, 0, data->type == max6581 ? 255 : 127);
-	data->temp[nr][index] = temp;
-	ret = i2c_smbus_write_byte_data(data->client,
-					index == 2 ? MAX6697_REG_MAX[nr]
-						   : MAX6697_REG_CRIT[nr],
-					temp);
-	mutex_unlock(&data->update_lock);
+	ret = regmap_write(data->regmap,
+			   index == 2 ? MAX6697_REG_MAX[nr]
+				      : MAX6697_REG_CRIT[nr],
+			   temp);
 
-	return ret < 0 ? ret : count;
+	return ret ? : count;
 }
 
 static ssize_t offset_store(struct device *dev, struct device_attribute *devattr, const char *buf,
 			    size_t count)
 {
-	int val, ret, index, select;
-	struct max6697_data *data;
-	bool channel_enabled;
+	struct max6697_data *data = dev_get_drvdata(dev);
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct regmap *regmap = data->regmap;
 	long temp;
+	int ret;
 
-	index = to_sensor_dev_attr(devattr)->index;
-	data = dev_get_drvdata(dev);
 	ret = kstrtol(buf, 10, &temp);
 	if (ret < 0)
 		return ret;
 
 	mutex_lock(&data->update_lock);
-	select = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET_SELECT);
-	if (select < 0) {
-		ret = select;
-		goto abort;
-	}
-	channel_enabled = (select & BIT(index - 1));
 	temp = clamp_val(temp, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
-	val = DIV_ROUND_CLOSEST(temp, 250);
-	/* disable the offset for channel if the new offset is 0 */
-	if (val == 0) {
-		if (channel_enabled)
-			ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET_SELECT,
-							select & ~BIT(index - 1));
-		ret = ret < 0 ? ret : count;
-		goto abort;
+	temp = DIV_ROUND_CLOSEST(temp, 250);
+	if (!temp) {	/* disable this (and only this) channel */
+		ret = regmap_clear_bits(regmap, MAX6581_REG_OFFSET_SELECT, BIT(index - 1));
+		goto unlock;
 	}
-	if (!channel_enabled) {
-		ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET_SELECT,
-						select | BIT(index - 1));
-		if (ret < 0)
-			goto abort;
-	}
-	ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET, val);
-	ret = ret < 0 ? ret : count;
-
-abort:
+	/* enable channel, and update offset */
+	ret = regmap_set_bits(regmap, MAX6581_REG_OFFSET_SELECT, BIT(index - 1));
+	if (ret)
+		goto unlock;
+	ret = regmap_write(regmap, MAX6581_REG_OFFSET, temp);
+unlock:
 	mutex_unlock(&data->update_lock);
-	return ret;
+	return ret ? : count;
 }
 
 static ssize_t offset_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
-	struct max6697_data *data;
-	int select, ret, index;
+	unsigned int regs[2] = { MAX6581_REG_OFFSET_SELECT, MAX6581_REG_OFFSET };
+	struct max6697_data *data = dev_get_drvdata(dev);
+	int index = to_sensor_dev_attr(devattr)->index;
+	u8 regdata[2];
+	int ret;
 
-	index = to_sensor_dev_attr(devattr)->index;
-	data = dev_get_drvdata(dev);
-	mutex_lock(&data->update_lock);
-	select = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET_SELECT);
-	if (select < 0)
-		ret = select;
-	else if (select & BIT(index - 1))
-		ret = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET);
-	else
-		ret = 0;
-	mutex_unlock(&data->update_lock);
-	return ret < 0 ? ret : sprintf(buf, "%d\n", max6581_offset_to_millic(ret));
+	ret = regmap_multi_reg_read(data->regmap, regs, regdata, 2);
+	if (ret)
+		return ret;
+
+	if (!(regdata[0] & BIT(index - 1)))
+		regdata[1] = 0;
+
+	return sprintf(buf, "%d\n", max6581_offset_to_millic(regdata[1]));
 }
 
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
@@ -569,12 +487,11 @@ static const struct attribute_group max6697_group = {
 };
 __ATTRIBUTE_GROUPS(max6697);
 
-static int max6697_config_of(struct max6697_data *data, struct i2c_client *client)
+static int max6697_config_of(struct device_node *node, struct max6697_data *data)
 {
 	const struct max6697_chip_data *chip = data->chip;
-	struct device_node *node = client->dev.of_node;
+	struct regmap *regmap = data->regmap;
 	int ret, confreg;
-	int factor = 0;
 	u32 vals[2];
 
 	confreg = 0;
@@ -594,15 +511,15 @@ static int max6697_config_of(struct max6697_data *data, struct i2c_client *clien
 
 	if (of_property_read_u32(node, "alert-mask", vals))
 		vals[0] = 0;
-	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_ALERT_MASK,
-					MAX6697_ALERT_MAP_BITS(vals[0]));
+	ret = regmap_write(regmap, MAX6697_REG_ALERT_MASK,
+			   MAX6697_ALERT_MAP_BITS(vals[0]));
 	if (ret)
 		return ret;
 
 	if (of_property_read_u32(node, "over-temperature-mask", vals))
 		vals[0] = 0;
-	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_OVERT_MASK,
-					MAX6697_OVERT_MAP_BITS(vals[0]));
+	ret = regmap_write(regmap, MAX6697_REG_OVERT_MASK,
+			   MAX6697_OVERT_MAP_BITS(vals[0]));
 	if (ret)
 		return ret;
 
@@ -610,7 +527,6 @@ static int max6697_config_of(struct max6697_data *data, struct i2c_client *clien
 		if (of_property_read_bool(node, "resistance-cancellation") &&
 		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
 			confreg |= MAX6697_CONF_RESISTANCE;
-			factor = 1;
 		}
 	} else {
 		if (of_property_read_u32(node, "resistance-cancellation", &vals[0])) {
@@ -620,9 +536,7 @@ static int max6697_config_of(struct max6697_data *data, struct i2c_client *clien
 				vals[0] = 0;
 		}
 
-		factor = hweight8(vals[0] & 0xfe);
-		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
-						vals[0] >> 1);
+		ret = regmap_write(regmap, MAX6581_REG_RESISTANCE, vals[0] >> 1);
 		if (ret < 0)
 			return ret;
 
@@ -631,81 +545,92 @@ static int max6697_config_of(struct max6697_data *data, struct i2c_client *clien
 			vals[1] = 0;
 		}
 
-		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_IDEALITY,
-						vals[1]);
+		ret = regmap_write(regmap, MAX6581_REG_IDEALITY, vals[1]);
 		if (ret < 0)
 			return ret;
-		ret = i2c_smbus_write_byte_data(client,
-						MAX6581_REG_IDEALITY_SELECT,
-						vals[0] >> 1);
+		ret = regmap_write(regmap, MAX6581_REG_IDEALITY_SELECT,
+				   vals[0] >> 1);
 		if (ret < 0)
 			return ret;
 	}
-	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_CONFIG, confreg);
-	if (ret < 0)
-		return ret;
-	return factor;
+	return regmap_write(regmap, MAX6697_REG_CONFIG, confreg);
 }
 
-static int max6697_init_chip(struct max6697_data *data,
-			     struct i2c_client *client)
+static int max6697_init_chip(struct device_node *np, struct max6697_data *data)
 {
-	const struct max6697_chip_data *chip = data->chip;
-	int factor = chip->channels;
-	int ret, reg;
+	unsigned int reg;
+	int ret;
 
 	/*
 	 * Don't touch configuration if there is no devicetree configuration.
 	 * If that is the case, use the current chip configuration.
 	 */
-	if (!client->dev.of_node) {
-		reg = i2c_smbus_read_byte_data(client, MAX6697_REG_CONFIG);
-		if (reg < 0)
-			return reg;
+	if (!np) {
+		struct regmap *regmap = data->regmap;
+
+		ret = regmap_read(regmap, MAX6697_REG_CONFIG, &reg);
+		if (ret < 0)
+			return ret;
 		if (data->type == max6581) {
 			if (reg & MAX6581_CONF_EXTENDED)
 				data->temp_offset = 64;
-			reg = i2c_smbus_read_byte_data(client,
-						       MAX6581_REG_RESISTANCE);
-			if (reg < 0)
-				return reg;
-			factor += hweight8(reg);
-		} else {
-			if (reg & MAX6697_CONF_RESISTANCE)
-				factor++;
+			ret = regmap_read(regmap, MAX6581_REG_RESISTANCE, &reg);
 		}
-		data->update_interval = factor * MAX6697_CONV_TIME;
 	} else {
-		ret = max6697_config_of(data, client);
-		if (ret < 0)
-			return ret;
-		data->update_interval = (factor + ret) * MAX6697_CONV_TIME;
+		ret = max6697_config_of(np, data);
 	}
 
-	return 0;
+	return ret;
 }
 
+static bool max6697_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00 ... 0x09:	/* temperature high bytes */
+	case 0x44 ... 0x47:	/* status */
+	case 0x51 ... 0x58:	/* temperature low bytes */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max6697_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg != 0x0a && reg != 0x0f && !max6697_volatile_reg(dev, reg);
+}
+
+static const struct regmap_config max6697_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x58,
+	.writeable_reg = max6697_writeable_reg,
+	.volatile_reg = max6697_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int max6697_probe(struct i2c_client *client)
 {
-	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct max6697_data *data;
 	struct device *hwmon_dev;
+	struct regmap *regmap;
 	int err;
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
-		return -ENODEV;
+	regmap = regmap_init_i2c(client, &max6697_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	data = devm_kzalloc(dev, sizeof(struct max6697_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->regmap = regmap;
 	data->type = (uintptr_t)i2c_get_match_data(client);
 	data->chip = &max6697_chip_data[data->type];
-	data->client = client;
 	mutex_init(&data->update_lock);
 
-	err = max6697_init_chip(data, client);
+	err = max6697_init_chip(client->dev.of_node, data);
 	if (err)
 		return err;
 
-- 
2.39.2

