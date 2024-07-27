Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB217F36E
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091113; cv=none; b=hVRoCrVomb4cQztKnK6/VNFnKLksn1zgPGsUaBpUp3YoCIJUEKotUbqLywfYZyZQgw+kkPcahawabQTnloIgHUfnpswKYY+be+xCDXKHRlHN3xV25wl0yyQTMHSh8muCYZeC0qB8VcjLUqnLunzHakHjZ2UxKJD/JWdfcar0euw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091113; c=relaxed/simple;
	bh=O/X38hbHx6ZEK2bwgUH9Z+vJe2jG2lZDuVqAd+J07mM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bxQ14RVaCV05y+WxWCMSr0QnlcoW7k+hULxUba5jT8laIRL6bo/cN6uxloafpi4nVT1coiprjzSFPZpXvj0WGJVpfrkbCtVrVRzBqh45pGakgEhwvo4QXmAi3Yw0+IqCImJsznwyr+mq69bIrtkuDPdZUZKJF92AT57zKdMLw9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzU74Rvv; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzU74Rvv"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb56c2c30eso1236820a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722091110; x=1722695910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRhsUCWHS2j6LGPP/IvPRK3jkh5v5yvL4Ij3H2Wzhfs=;
        b=BzU74Rvv6XUnzPjTwFa4hfjG22z2zJJfTcqGQOLeXkSKWRvwhRRuiNQlpdbNJQ0oaP
         /ClhgTMmJ3+umNUzUGZjxSYxDJzUSXCEiIA0pXBUXI60RJa5bb5kJnxhdvGh9oS0CVcN
         WvqVuFnSS+hxGl6tvNIlTo4WHbBGSyeryidsdOeaCiSMLY5Y18V69VCrvKQ1RMSSOomN
         Qkea7MgwA/D2NAyTmYOCktzX246oIR5FeHDHyk1G1NDig3uPII8Xpau1eExoElh13Sfp
         y77BtULdlG2ifb4hgIn7rCt3nyUSleuGIDAC/ejkQBqxKmFw3UqUj0JJ5wICZM58lIUj
         RV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722091110; x=1722695910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iRhsUCWHS2j6LGPP/IvPRK3jkh5v5yvL4Ij3H2Wzhfs=;
        b=KnhhWshLLSLJsQ5n8EKwh8nD6OPNlklF8Tv+GsuhMxe7rA+XNwoh8E2Za5voRlKvH/
         o23dY424vuBhM0kCLMfFXJ4B7zxffm7ONL/PqYvCHHJWb6ODzrl+32CVao570OQ6pIeR
         QE11C+QGyOraFKa75ri2k0OHmeO56A/LY1mXBhTDjXaoUaqjWltfnUwCpuQa9git47CB
         1Kcw6WELGGU5MkCPIYEHyV55qd5tLte/6GU4lirbfKB95oDmXdyEw28l9bg2+KqWMg2z
         SgvOdlaTk79kLAluY/vzu9CxaF5MAWcg5pA9wS//CYTACDkyu5NeAEWWerpShWZGmcIK
         0z+Q==
X-Gm-Message-State: AOJu0YxgRgHur81f0lsHkZntrBzFGLadvbcWyWEPUWrbK3PeJl8W+DkQ
	SCpQ6JSH+Inqq9tXTfKu4F3xG9UafsiMdUHPHRuVgapUimlgfG8jAEKH9w==
X-Google-Smtp-Source: AGHT+IHYIJSqwgCKC6tsOE95NiSW9v63nQSubJcnEhynJwkz4QNX+ErQtkP5Z+MJAAug88CHvhi7ww==
X-Received: by 2002:a17:90a:8586:b0:2c7:c5f5:1c72 with SMTP id 98e67ed59e1d1-2cf7cedd529mr4386100a91.13.1722091109944;
        Sat, 27 Jul 2024 07:38:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28dfb6e4sm5289722a91.37.2024.07.27.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 07:38:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/6] hwmon: (max1619) Convert to use regmap
Date: Sat, 27 Jul 2024 07:38:17 -0700
Message-Id: <20240727143820.1358225-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240727143820.1358225-1-linux@roeck-us.net>
References: <20240727143820.1358225-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use regmap for local caching, to hide register read/write address
differences, and for multi-byte operations. With this change,
the driver specific lock is no longer necessary.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/max1619.rst |   4 -
 drivers/hwmon/max1619.c         | 245 ++++++++++++++++----------------
 2 files changed, 122 insertions(+), 127 deletions(-)

diff --git a/Documentation/hwmon/max1619.rst b/Documentation/hwmon/max1619.rst
index e25956e70f73..b5fc175ae18d 100644
--- a/Documentation/hwmon/max1619.rst
+++ b/Documentation/hwmon/max1619.rst
@@ -27,7 +27,3 @@ All temperature values are given in degrees Celsius. Resolution
 is 1.0 degree for the local temperature and for the remote temperature.
 
 Only the external sensor has high and low limits.
-
-The max1619 driver will not update its values more frequently than every
-other second; reading them more often will do no harm, but will return
-'old' values.
diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 8eb7d04bd2f5..ae0ea4156f24 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -17,10 +17,8 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/slab.h>
+#include <linux/regmap.h>
 #include <linux/sysfs.h>
 
 static const unsigned short normal_i2c[] = {
@@ -30,27 +28,17 @@ static const unsigned short normal_i2c[] = {
  * The MAX1619 registers
  */
 
-#define MAX1619_REG_R_MAN_ID		0xFE
-#define MAX1619_REG_R_CHIP_ID		0xFF
-#define MAX1619_REG_R_CONFIG		0x03
-#define MAX1619_REG_W_CONFIG		0x09
-#define MAX1619_REG_R_CONVRATE		0x04
-#define MAX1619_REG_W_CONVRATE		0x0A
-#define MAX1619_REG_R_STATUS		0x02
-#define MAX1619_REG_R_LOCAL_TEMP	0x00
-#define MAX1619_REG_R_REMOTE_TEMP	0x01
-#define MAX1619_REG_R_REMOTE_HIGH	0x07
-#define MAX1619_REG_W_REMOTE_HIGH	0x0D
-#define MAX1619_REG_R_REMOTE_LOW	0x08
-#define MAX1619_REG_W_REMOTE_LOW	0x0E
-#define MAX1619_REG_R_REMOTE_CRIT	0x10
-#define MAX1619_REG_W_REMOTE_CRIT	0x12
-#define MAX1619_REG_R_TCRIT_HYST	0x11
-#define MAX1619_REG_W_TCRIT_HYST	0x13
-
-/*
- * Conversions
- */
+#define MAX1619_REG_LOCAL_TEMP		0x00
+#define MAX1619_REG_REMOTE_TEMP		0x01
+#define MAX1619_REG_STATUS		0x02
+#define MAX1619_REG_CONFIG		0x03
+#define MAX1619_REG_CONVRATE		0x04
+#define MAX1619_REG_REMOTE_HIGH		0x07
+#define MAX1619_REG_REMOTE_LOW		0x08
+#define MAX1619_REG_REMOTE_CRIT		0x10
+#define MAX1619_REG_REMOTE_CRIT_HYST	0x11
+#define MAX1619_REG_MAN_ID		0xFE
+#define MAX1619_REG_CHIP_ID		0xFF
 
 enum temp_index {
 	t_input1 = 0,
@@ -66,62 +54,15 @@ enum temp_index {
  * Client data (each client gets its own)
  */
 
-struct max1619_data {
-	struct i2c_client *client;
-	struct mutex update_lock;
-	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
-
-	/* registers values */
-	u8 temp[t_num_regs];	/* index with enum temp_index */
-	u8 alarms;
+static const u8 regs[t_num_regs] = {
+	[t_input1] = MAX1619_REG_LOCAL_TEMP,
+	[t_input2] = MAX1619_REG_REMOTE_TEMP,
+	[t_low2] = MAX1619_REG_REMOTE_LOW,
+	[t_high2] = MAX1619_REG_REMOTE_HIGH,
+	[t_crit2] = MAX1619_REG_REMOTE_CRIT,
+	[t_hyst2] = MAX1619_REG_REMOTE_CRIT_HYST,
 };
 
-static const u8 regs_read[t_num_regs] = {
-	[t_input1] = MAX1619_REG_R_LOCAL_TEMP,
-	[t_input2] = MAX1619_REG_R_REMOTE_TEMP,
-	[t_low2] = MAX1619_REG_R_REMOTE_LOW,
-	[t_high2] = MAX1619_REG_R_REMOTE_HIGH,
-	[t_crit2] = MAX1619_REG_R_REMOTE_CRIT,
-	[t_hyst2] = MAX1619_REG_R_TCRIT_HYST,
-};
-
-static const u8 regs_write[t_num_regs] = {
-	[t_low2] = MAX1619_REG_W_REMOTE_LOW,
-	[t_high2] = MAX1619_REG_W_REMOTE_HIGH,
-	[t_crit2] = MAX1619_REG_W_REMOTE_CRIT,
-	[t_hyst2] = MAX1619_REG_W_TCRIT_HYST,
-};
-
-static struct max1619_data *max1619_update_device(struct device *dev)
-{
-	struct max1619_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int config, i;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
-		dev_dbg(&client->dev, "Updating max1619 data.\n");
-		for (i = 0; i < t_num_regs; i++)
-			data->temp[i] = i2c_smbus_read_byte_data(client,
-					regs_read[i]);
-		data->alarms = i2c_smbus_read_byte_data(client,
-					MAX1619_REG_R_STATUS);
-		/* If OVERT polarity is low, reverse alarm bit */
-		config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
-		if (!(config & 0x20))
-			data->alarms ^= 0x02;
-
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-	mutex_unlock(&data->update_lock);
-
-	return data;
-}
-
 /*
  * Sysfs stuff
  */
@@ -130,9 +71,15 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max1619_data *data = max1619_update_device(dev);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u32 temp;
+	int ret;
 
-	return sprintf(buf, "%d\n", sign_extend(data->temp[attr->index], 7) * 1000);
+	ret = regmap_read(regmap, regs[attr->index], &temp);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", sign_extend32(temp, 7) * 1000);
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -140,34 +87,61 @@ static ssize_t temp_store(struct device *dev,
 			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max1619_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
+	struct regmap *regmap = dev_get_drvdata(dev);
 	long val;
 	int err = kstrtol(buf, 10, &val);
 	if (err)
 		return err;
 
-	mutex_lock(&data->update_lock);
-	data->temp[attr->index] = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
-	i2c_smbus_write_byte_data(client, regs_write[attr->index],
-				  data->temp[attr->index]);
-	mutex_unlock(&data->update_lock);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
+	err = regmap_write(regmap, regs[attr->index], val);
+	if (err < 0)
+		return err;
 	return count;
 }
 
+static int get_alarms(struct regmap *regmap)
+{
+	static u32 regs[2] = { MAX1619_REG_STATUS, MAX1619_REG_CONFIG };
+	u8 regdata[2];
+	int ret;
+
+	ret = regmap_multi_reg_read(regmap, regs, regdata, 2);
+	if (ret)
+		return ret;
+
+	/* OVERT status bit may be reversed */
+	if (!(regdata[1] & 0x20))
+		regdata[0] ^= 0x02;
+
+	return regdata[0] & 0x1e;
+}
+
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	struct max1619_data *data = max1619_update_device(dev);
-	return sprintf(buf, "%d\n", data->alarms);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	int alarms;
+
+	alarms = get_alarms(regmap);
+	if (alarms < 0)
+		return alarms;
+
+	return sprintf(buf, "%d\n", alarms);
 }
 
 static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
-	struct max1619_data *data = max1619_update_device(dev);
-	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	int alarms;
+
+	alarms = get_alarms(regmap);
+	if (alarms < 0)
+		return alarms;
+
+	return sprintf(buf, "%d\n", (alarms >> bitnr) & 1);
 }
 
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input1);
@@ -211,9 +185,9 @@ static int max1619_detect(struct i2c_client *client,
 		return -ENODEV;
 
 	/* detection */
-	reg_config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
-	reg_convrate = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONVRATE);
-	reg_status = i2c_smbus_read_byte_data(client, MAX1619_REG_R_STATUS);
+	reg_config = i2c_smbus_read_byte_data(client, MAX1619_REG_CONFIG);
+	reg_convrate = i2c_smbus_read_byte_data(client, MAX1619_REG_CONVRATE);
+	reg_status = i2c_smbus_read_byte_data(client, MAX1619_REG_STATUS);
 	if ((reg_config & 0x03) != 0x00
 	 || reg_convrate > 0x07 || (reg_status & 0x61) != 0x00) {
 		dev_dbg(&adapter->dev, "MAX1619 detection failed at 0x%02x\n",
@@ -222,8 +196,8 @@ static int max1619_detect(struct i2c_client *client,
 	}
 
 	/* identification */
-	man_id = i2c_smbus_read_byte_data(client, MAX1619_REG_R_MAN_ID);
-	chip_id = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CHIP_ID);
+	man_id = i2c_smbus_read_byte_data(client, MAX1619_REG_MAN_ID);
+	chip_id = i2c_smbus_read_byte_data(client, MAX1619_REG_CHIP_ID);
 	if (man_id != 0x4D || chip_id != 0x04) {
 		dev_info(&adapter->dev,
 			 "Unsupported chip (man_id=0x%02X, chip_id=0x%02X).\n",
@@ -236,40 +210,65 @@ static int max1619_detect(struct i2c_client *client,
 	return 0;
 }
 
-static void max1619_init_client(struct i2c_client *client)
-{
-	u8 config;
+/* regmap */
 
-	/*
-	 * Start the conversions.
-	 */
-	i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONVRATE,
-				  5); /* 2 Hz */
-	config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
-	if (config & 0x40)
-		i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONFIG,
-					  config & 0xBF); /* run */
+static int max1619_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(context, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+	return 0;
 }
 
-static int max1619_probe(struct i2c_client *new_client)
+static int max1619_reg_write(void *context, unsigned int reg, unsigned int val)
 {
-	struct max1619_data *data;
+	int offset = reg < MAX1619_REG_REMOTE_CRIT ? 6 : 2;
+
+	return i2c_smbus_write_byte_data(context, reg + offset, val);
+}
+
+static bool max1619_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	return reg <= MAX1619_REG_STATUS;
+}
+
+static bool max1619_regmap_is_writeable(struct device *dev, unsigned int reg)
+{
+	return reg > MAX1619_REG_STATUS && reg <= MAX1619_REG_REMOTE_CRIT_HYST;
+}
+
+static const struct regmap_config max1619_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX1619_REG_REMOTE_CRIT_HYST,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = max1619_regmap_is_volatile,
+	.writeable_reg = max1619_regmap_is_writeable,
+};
+
+static const struct regmap_bus max1619_regmap_bus = {
+	.reg_write = max1619_reg_write,
+	.reg_read = max1619_reg_read,
+};
+
+static int max1619_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
+	struct regmap *regmap;
 
-	data = devm_kzalloc(&new_client->dev, sizeof(struct max1619_data),
-			    GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	regmap = devm_regmap_init(dev, &max1619_regmap_bus, client,
+				  &max1619_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	data->client = new_client;
-	mutex_init(&data->update_lock);
-
-	/* Initialize the MAX1619 chip */
-	max1619_init_client(new_client);
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(&new_client->dev,
-							   new_client->name,
-							   data,
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
+							   client->name,
+							   regmap,
 							   max1619_groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.39.2

