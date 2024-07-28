Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77743ABC
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177451; cv=none; b=orBMNpRKEsy1wwPiU3GZT6LrFmgiXGfmuNVe+hhZoXp71nIg8W+dn3SUg3h24YIiwz5dHP36jlsWAba4drgKKgyV3gGlXIb1h+yRQEwgmG8JVVBaJwOqcyfeTEGUE2ubggH1WMBuSmNooWXdW3ttq18RP6qald2Q9rpQfQQg/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177451; c=relaxed/simple;
	bh=3t1IN8yEcQn1mn1s+OHc0cbF2tXJC4mblCgQ5uaAmdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nWMyCAU8yYFuERbg7cxheMWruW2N72OqJBynRejvf7xBDN68JFPfPtln/SqupHDoKCE99aCgDtaUNDNzVuliWoh16OSwKJPEWERdO7HS5wMElN2/99HxvsQ0aRJiD4wW4YVM9Oz2uQpWD+lDUFF8x6KTg+mY3OebN9O7tr41DkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiXuVL8N; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiXuVL8N"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so341475a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177448; x=1722782248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBZTirNmaR0tG2wilBqgqsHWxoRSq4myU9hllNcUdlk=;
        b=UiXuVL8NsZG0rfAmqV0c4ehvinun+4swAqEcwnbFzQtf+hciU7bnRJiKVQ/I5hz6an
         hd8qehWsVO8jE3SbzL8YVHXRMajSloIL2r3ofMEjX8WpejUTHdgVmfgXogn8vAFCgfJV
         hdEa/ix5PT2gf2rq4gL6S7pFMCN/kmhaqPsamTFvUwvA6BF1q61SMaLpxloVnxYCWPGM
         Sm1nVj7NcGfLvVS9wGrAlMFdLMjaeRlXk2n/9BzuyMWbVYaU/WPanKmUmp6/d9am0DZ3
         cpbERhf2yV41mPO/W6mdU0lgyaoBb7wcYRNQxoiz1TKr9CslieTpkzp+uTC2tw9unPRA
         xfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177448; x=1722782248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBZTirNmaR0tG2wilBqgqsHWxoRSq4myU9hllNcUdlk=;
        b=ZOmqsPeDGFs20eHKIfxbHWNR17D/3ypOexB4I8xz+53Bnh/Wc9tNXElrhwV018a1RH
         ZaD55Lnp3E5fbKsjWquJuXYNp3Lw4AxZYNVkLgrFjl9w5UhoryaIu69ZAqjRN+H8tgG1
         WISpccDooNSok7ZO8F3RaF8HPF138IPPV9C/WV/3ftDO+2rUt7EYJKOhdir6GbF1/vpx
         LUV89wWR+a5DL1hdPdZLM1QjuRuKwBuy2sS0HDxi0pkb+TsqQP7/5J+ItRbgLa/ftM0W
         ITk9plGsGQKSnydU5nF5b64r/diRw4q4tA+c/dcGLDQdlBSb/Hg0MibJwFHwAIzs6X9E
         twcw==
X-Gm-Message-State: AOJu0YzF9x5rdfl1KYYithNohBIFS3+eoFz6EXogONf51f9GSkw10NnD
	c4jXMtWugJrzdpKhGU91WiSVy6107Sct+BifchCBl0oMyFfhOETmSDkY+g==
X-Google-Smtp-Source: AGHT+IFck5qgsKxATruFeqQu2pnGfCbOk+gQZ0i8rTEF+aieFLrJI3FbaiQUYN3ijZin2X2oeshbFA==
X-Received: by 2002:a05:6a21:9986:b0:1c4:244c:ebc2 with SMTP id adf61e73a8af0-1c4a1324e22mr6249561637.30.1722177447627;
        Sun, 28 Jul 2024 07:37:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead71826bsm5391740b3a.73.2024.07.28.07.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 5/7] hwmon: (max1619) Convert to with_info API
Date: Sun, 28 Jul 2024 07:37:13 -0700
Message-Id: <20240728143715.1585816-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728143715.1585816-1-linux@roeck-us.net>
References: <20240728143715.1585816-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert driver to with_info hwmon API to simplify the code and
with it its maintainability.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1619.c | 269 +++++++++++++++++++++++-----------------
 1 file changed, 157 insertions(+), 112 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 3ecad847e597..fd84bcc789fa 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -14,20 +14,14 @@
 
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/sysfs.h>
 
 static const unsigned short normal_i2c[] = {
 	0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, 0x4d, 0x4e, I2C_CLIENT_END };
 
-/*
- * The MAX1619 registers
- */
-
 #define MAX1619_REG_LOCAL_TEMP		0x00
 #define MAX1619_REG_REMOTE_TEMP		0x01
 #define MAX1619_REG_STATUS		0x02
@@ -40,66 +34,6 @@ static const unsigned short normal_i2c[] = {
 #define MAX1619_REG_MAN_ID		0xFE
 #define MAX1619_REG_CHIP_ID		0xFF
 
-enum temp_index {
-	t_input1 = 0,
-	t_input2,
-	t_low2,
-	t_high2,
-	t_crit2,
-	t_hyst2,
-	t_num_regs
-};
-
-/*
- * Client data (each client gets its own)
- */
-
-static const u8 regs[t_num_regs] = {
-	[t_input1] = MAX1619_REG_LOCAL_TEMP,
-	[t_input2] = MAX1619_REG_REMOTE_TEMP,
-	[t_low2] = MAX1619_REG_REMOTE_LOW,
-	[t_high2] = MAX1619_REG_REMOTE_HIGH,
-	[t_crit2] = MAX1619_REG_REMOTE_CRIT,
-	[t_hyst2] = MAX1619_REG_REMOTE_CRIT_HYST,
-};
-
-/*
- * Sysfs stuff
- */
-
-static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct regmap *regmap = dev_get_drvdata(dev);
-	u32 temp;
-	int ret;
-
-	ret = regmap_read(regmap, regs[attr->index], &temp);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
-}
-
-static ssize_t temp_store(struct device *dev,
-			  struct device_attribute *devattr, const char *buf,
-			  size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct regmap *regmap = dev_get_drvdata(dev);
-	long val;
-	int err = kstrtol(buf, 10, &val);
-	if (err)
-		return err;
-
-	val = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
-	err = regmap_write(regmap, regs[attr->index], val);
-	if (err < 0)
-		return err;
-	return count;
-}
-
 static int get_alarms(struct regmap *regmap)
 {
 	static u32 regs[2] = { MAX1619_REG_STATUS, MAX1619_REG_CONFIG };
@@ -117,62 +51,175 @@ static int get_alarms(struct regmap *regmap)
 	return regdata[0] & 0x1e;
 }
 
-static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static int max1619_temp_read(struct regmap *regmap, u32 attr, int channel, long *val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
-	int alarms;
+	int reg = -1, alarm_bit = 0;
+	u32 temp;
+	int ret;
 
-	alarms = get_alarms(regmap);
-	if (alarms < 0)
-		return alarms;
-
-	return sprintf(buf, "%d\n", alarms);
+	switch (attr) {
+	case hwmon_temp_input:
+		reg = channel ? MAX1619_REG_REMOTE_TEMP : MAX1619_REG_LOCAL_TEMP;
+		break;
+	case hwmon_temp_min:
+		reg = MAX1619_REG_REMOTE_LOW;
+		break;
+	case hwmon_temp_max:
+		reg = MAX1619_REG_REMOTE_HIGH;
+		break;
+	case hwmon_temp_crit:
+		reg = MAX1619_REG_REMOTE_CRIT;
+		break;
+	case hwmon_temp_crit_hyst:
+		reg = MAX1619_REG_REMOTE_CRIT_HYST;
+		break;
+	case hwmon_temp_min_alarm:
+		alarm_bit = 3;
+		break;
+	case hwmon_temp_max_alarm:
+		alarm_bit = 4;
+		break;
+	case hwmon_temp_crit_alarm:
+		alarm_bit = 1;
+		break;
+	case hwmon_temp_fault:
+		alarm_bit = 2;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	if (reg >= 0) {
+		ret = regmap_read(regmap, reg, &temp);
+		if (ret < 0)
+			return ret;
+		*val = sign_extend32(temp, 7) * 1000;
+	} else {
+		ret = get_alarms(regmap);
+		if (ret < 0)
+			return ret;
+		*val = !!(ret & BIT(alarm_bit));
+	}
+	return 0;
 }
 
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static int max1619_chip_read(struct regmap *regmap, u32 attr, long *val)
 {
-	int bitnr = to_sensor_dev_attr(attr)->index;
-	struct regmap *regmap = dev_get_drvdata(dev);
 	int alarms;
 
-	alarms = get_alarms(regmap);
-	if (alarms < 0)
-		return alarms;
-
-	return sprintf(buf, "%d\n", (alarms >> bitnr) & 1);
+	switch (attr) {
+	case hwmon_chip_alarms:
+		alarms = get_alarms(regmap);
+		if (alarms < 0)
+			return alarms;
+		*val = alarms;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input1);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, t_input2);
-static SENSOR_DEVICE_ATTR_RW(temp2_min, temp, t_low2);
-static SENSOR_DEVICE_ATTR_RW(temp2_max, temp, t_high2);
-static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp, t_crit2);
-static SENSOR_DEVICE_ATTR_RW(temp2_crit_hyst, temp, t_hyst2);
+static int max1619_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
 
-static DEVICE_ATTR_RO(alarms);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, alarm, 3);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 4);
+	switch (type) {
+	case hwmon_chip:
+		return max1619_chip_read(regmap, attr, val);
+	case hwmon_temp:
+		return max1619_temp_read(regmap, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-static struct attribute *max1619_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,
+static int max1619_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	int reg;
 
-	&dev_attr_alarms.attr,
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
+	if (type != hwmon_temp)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_temp_min:
+		reg = MAX1619_REG_REMOTE_LOW;
+		break;
+	case hwmon_temp_max:
+		reg = MAX1619_REG_REMOTE_HIGH;
+		break;
+	case hwmon_temp_crit:
+		reg = MAX1619_REG_REMOTE_CRIT;
+		break;
+	case hwmon_temp_crit_hyst:
+		reg = MAX1619_REG_REMOTE_CRIT_HYST;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
+	return regmap_write(regmap, reg, val);
+}
+
+static umode_t max1619_is_visible(const void *_data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_alarms:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_hyst:
+			return 0644;
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_crit_alarm:
+		case hwmon_temp_fault:
+			return 0444;
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
+static const struct hwmon_channel_info * const max1619_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			   HWMON_T_CRIT_ALARM | HWMON_T_FAULT),
 	NULL
 };
-ATTRIBUTE_GROUPS(max1619);
+
+static const struct hwmon_ops max1619_hwmon_ops = {
+	.is_visible = max1619_is_visible,
+	.read = max1619_read,
+	.write = max1619_write,
+};
+
+static const struct hwmon_chip_info max1619_chip_info = {
+	.ops = &max1619_hwmon_ops,
+	.info = max1619_info,
+};
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int max1619_detect(struct i2c_client *client,
@@ -283,10 +330,8 @@ static int max1619_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-							   client->name,
-							   regmap,
-							   max1619_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 regmap, &max1619_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.39.2

