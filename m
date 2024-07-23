Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C41311A7
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 00:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695938; cv=none; b=MyfYBpL45reCCrircSEWt/fdDOQLF6y0nXr1Y82UmFTVDF9ju0/cew9NxgMfjDTuIfW646Xkd2nypKxhuH1Ls0eADT6cYM/8zukZ0vOwabMQDBUtS7XveqQHX8R/d33Ie2j3usVkUovioEgs+K/yydIML3WnstU6WXrEJBRPIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695938; c=relaxed/simple;
	bh=sV/SoI+XPMxPxxN9lWPHM5UFQtC7cQ9qVYYNtLNooz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKuzP0YGMUFub/pvDUmdNi/89bWQh0kqQWxxQchDZlmuqBObaPstMoFQeAar8lfkh4gyGvyKWiyklPOLgc9c/KnK2ccELqk1PBzwjgU+6Ex4vrcA7iRxvUht+VfBC6nDiBrtX73K6es0iBZBAxQLZz0jozYuB7kERxb5/uNaMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiBY3zmv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiBY3zmv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d399da0b5so539829b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 17:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721695935; x=1722300735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrhvC33Nu8GyfIMBH4OXC5V6/21dHQNBbsPca9CHbIM=;
        b=QiBY3zmvDaOey/mVSQCOQMiNMacfy7EHV3NY+nDmGDys5TDLGUIOOzAUMqBAWDSs72
         ik0VjARrT61jNpliuUXk3jrfaDZd8W0K2z71Fg+WyENZN9FCa062dTk4ugQrFlB3Ue+W
         KqAzP6/xQr/Aj925dh35KiboUE/ko4/QXPm6YMJtb40Yb5Vt0gHlB/alYClxTVEaL/fe
         rZ9R9kVFZ2RvqMcM1YZOz7RQzOZVzTmr0CzGKU2mVRCfnE42Vl7wH/UuWBHXbB/++SsG
         eEr0YYWQibHxHXOeDWLXssQjV2oQbnJmARhUJ3QNG2I8RSq08X5Al3eFwqCRJI5uuHG+
         HGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695935; x=1722300735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrhvC33Nu8GyfIMBH4OXC5V6/21dHQNBbsPca9CHbIM=;
        b=iNzK7OMwy9I11tvyJslyLuy5HbUdopP6ZA+merPXshouSi+hk6m0715t3Y1124dACp
         +zR6Di76zVA6e3UXs4wi9Qn2iXqkM+cn75PAItohvHmBqt+lHmzsHulyRHVYw4q5fd7C
         SZxZJvQlBMoYz6SOVO/7Nh0Nrz+nzELfk+lU9WEVnhN9T7hw/3AVCG61GPM8WWOKXmcA
         KjshmSTi+CE64dSVzEBbINpuHqKGWUmHl9QixiwPbvJIT6X9JRmY77bELdfKg/mOc4li
         e6/ezCD2OMXX38KUQeWtv+bQ7dwH6Udt/EuLlFmt8+71mMvo143APB/C4iBne1Q89nts
         abtw==
X-Gm-Message-State: AOJu0YzG7EPncE9CwIO/bBe4GVgK57emSrBL6xNrd368a2qVFaKwhI5c
	d2f44mK2Juho4j68mH2/fcEZ1mU+5c6L40De7SbHvNEVwj2IqOA+yeACPQ==
X-Google-Smtp-Source: AGHT+IElZvUyHi6DhPI/yhe/G4de47Gck7JDdLdc/vEVVMWmrfrGzMmnUBM3f6wB+dEuyXY9+YquNQ==
X-Received: by 2002:a05:6a00:1acf:b0:70d:21d9:e2ae with SMTP id d2e1a72fcca58-70d21d9e8b2mr5688840b3a.6.1721695935321;
        Mon, 22 Jul 2024 17:52:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d14d41bc1sm3881606b3a.105.2024.07.22.17.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:52:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (max6697) Convert to use regmap
Date: Mon, 22 Jul 2024 17:52:02 -0700
Message-Id: <20240723005204.1356501-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723005204.1356501-1-linux@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 317 +++++++++++++++-------------------------
 1 file changed, 121 insertions(+), 196 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index d03881ea90b8..865ac36e3629 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -12,11 +12,11 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/i2c.h>
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
 
@@ -610,15 +527,12 @@ static int max6697_config_of(struct max6697_data *data, struct i2c_client *clien
 		if (of_property_read_bool(node, "resistance-cancellation") &&
 		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
 			confreg |= MAX6697_CONF_RESISTANCE;
-			factor = 1;
 		}
 	} else {
 		if (of_property_read_u32(node, "resistance-cancellation", &vals[0]))
 			vals[0] = 0xfe;
 
-		factor = hweight8(vals[0] & 0xfe);
-		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
-						vals[0] >> 1);
+		ret = regmap_write(regmap, MAX6581_REG_RESISTANCE, vals[0] >> 1);
 		if (ret < 0)
 			return ret;
 
@@ -627,81 +541,92 @@ static int max6697_config_of(struct max6697_data *data, struct i2c_client *clien
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

