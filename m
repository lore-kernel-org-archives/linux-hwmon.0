Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C030C1D9688;
	Thu, 23 Jan 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664193; cv=none; b=EmOsvy1QEzziVBdKAawb632oHpg/EyEvryzx7xMAHXQHAcNbKdGy+2FVB7fx6GFVLuL+LacSRfUS3w10pQE6R+MJA/L+FRo7ocvzN8Z4FyL64Uai9TpbhZmDiAR5LpS9JlJ6yXmud3IfHEyFuyNXgE+IuUpZJyyKB0hCj3LmzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664193; c=relaxed/simple;
	bh=CuGkGli1EIdfPxcUMkcT4udj7p3Yv9tkC3g7qc1xNTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/CIbwifCyjqwj/De75+2jzslaz+BFFOLDrQ4m4w83+Q8irUvxtQPeQupdEk4xFDJ0hm/zmaEIosFbj06Sns7xrqF29Y3vi4ziIck+VTiBb90XL0W7ACtE7NsyYtC2FKdzUOHszz18Je84doq5G9YGebmcjZ1VDxbEZvWn7dntM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6BW5xlA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6BW5xlA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso9722595e9.0;
        Thu, 23 Jan 2025 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664189; x=1738268989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxp8ZzuIRnLUy/JC6WvsPZvDxkdZ43ZCz/Ka99dauQQ=;
        b=K6BW5xlAFToa3JpYMxFMbRRvYd8cQveio4wdFJLIqezkidxupKTba2T1LXIdAZWI2a
         SOTUNtN82QFDJ8mIVx0D4frrpPm8R0adzxFRaYnGRuUEQ/68VBBJPxNsOGSt14MuFtka
         FC7Yncl2KnHC2dOMc+sE9JgYhMWWva4RLUfrZDuAA2jy84oKsUPKt5eVMjXD1lg+8u1m
         /p5awVv+Z45bzh75Dwc+G5OlWdC1QWxqFumaPzo0QEZ/Xln/3xtXMGqVdFPHd7zirLGg
         vP+ESsC3uuO5Rq7PjF//leTSkdhV5jXfeRoIf3TrktY5AxKAyYD7XP6WACmqZC/mkhiI
         zRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664189; x=1738268989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cxp8ZzuIRnLUy/JC6WvsPZvDxkdZ43ZCz/Ka99dauQQ=;
        b=jd+UTGNdmbPWvpM467s6Ixv8FXLqywcwDmZ9Bw0oVaAszDts5/0z+GD+vY46YVAi89
         S4SuYu43wKP7JzOQIfeELMbnIRHT9oJ8L8xmrv6a950Rrh07qkrgstht8zwB4DhpVwOA
         saXNhbMeDD5LuBfbEPOuGIGczmYY5yXWfr2BDa/l7KFArYxDxOxwaFKL7hipJb9s5bwy
         0vkgrUMh6oq4MyAFEKJH2Eudo4ZHpP4kMvdci0ZZ7NAqDGKV4PxbQJCKXdqGEdI0qQ1Q
         CRBRkHQ2cgRb2D1nXRmEeNPrLs0CIFXj5FKkCRmePKJJe+BjGOAegtwjwkfD4xIiaMPm
         vj1A==
X-Forwarded-Encrypted: i=1; AJvYcCUK0iHaKGncz4vxnfml2yeQinbDGISGxDC6ALpiZY4nMbtqyWWbyotjowD/t24sEto01gLd8QhMuaP8@vger.kernel.org, AJvYcCVU7ttH3nA/YNDavZUn+6FAm5SU2woYSYSUdTN75StmgHV1uUR09zkNV9+NYzp5abL/J95ZStc8jIn5UgDe@vger.kernel.org, AJvYcCVZ2JbqNl70jXsnYXxOJL79OKYId+7hMj6RTkGUwllTo6BMnxhZkkrRYlRVVEocNrD0Nc/G76r+n80t3b0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+NgrlyoEJSNUrvXD/jAxGvfXN1HvDF1rRmYuZHxQTK4SbVda
	Eu8Pu+QfZmJQhlnYhnFieJk0hHruoqpFCRjBIHrsElFkEkYBE3TicQ5CqY4R
X-Gm-Gg: ASbGnctCT2XjXgALs6rSafz+sKMFv6OuzB+KnW/Z4zFvmwGUwO9nfYVev1qOd8VzJyd
	lTxt4FZ75N6RJWEei5zO4HayaeiBr72I1h7vjOK8ywLdPQY2px2Q8l5WiEzGDky3m0rTSAQKKay
	wRoAeDYaT/IZXjguoY5xUJTTI6FWVhvMJyd+aTv2fzzgtEmvnOPJU2ASu8iFE5FOVh4CWUasPUb
	8f6rItprUvje80zSdm3zq1G3ugTmMCPKzWTecGZTxogpTsmYO5fXEOBgtke/eP9I8soNWecbclE
	Htgz2HaN29TkiN0lQA0SYZmj5jzgANo6YhPg2KXW5ZmjheTTuxUPxmvgz4gBekj0o21N58nvASx
	8TCGv86JHwwXauG75wWyHFWY4HmNWiqSQrw==
X-Google-Smtp-Source: AGHT+IE9K4orkovgrqDYEoZfPtq7fOQ+KfgQBUr73xkLOy0IfgZYB7gAonaWc2RCHwPYMH5YiwYxHQ==
X-Received: by 2002:a05:6000:2ac:b0:38b:dc3d:e4be with SMTP id ffacd0b85a97d-38bf59f0309mr30704153f8f.51.1737664188909;
        Thu, 23 Jan 2025 12:29:48 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176490sm628760f8f.1.2025.01.23.12.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:29:48 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: andrey.lalaev@gmail.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: add driver for HTU31
Date: Thu, 23 Jan 2025 21:25:06 +0100
Message-ID: <20250123202528.223966-2-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123202528.223966-1-andrey.lalaev@gmail.com>
References: <20250123202528.223966-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add base support for HTU31 temperature and humidity sensor.

Besides temperature and humidity values, the driver also exports a 24-bit
serial number to sysfs.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 Documentation/hwmon/htu31.rst |  38 ++++
 Documentation/hwmon/index.rst |   1 +
 drivers/hwmon/Kconfig         |  11 ++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/htu31.c         | 335 ++++++++++++++++++++++++++++++++++
 5 files changed, 386 insertions(+)
 create mode 100644 Documentation/hwmon/htu31.rst
 create mode 100644 drivers/hwmon/htu31.c

diff --git a/Documentation/hwmon/htu31.rst b/Documentation/hwmon/htu31.rst
new file mode 100644
index 000000000000..a7a960e215ec
--- /dev/null
+++ b/Documentation/hwmon/htu31.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver HTU31
+====================
+
+Supported chips:
+
+  * Measurement Specialties HTU31
+
+    Prefix: 'htu31'
+
+    Addresses scanned: -
+
+    Datasheet: Publicly available from https://www.te.com/en/product-CAT-HSC0007.html
+
+Author:
+
+  - Andrei Lalaev <andrey.lalaev@gmail.com>
+
+Description
+-----------
+
+HTU31 is a humidity and temperature sensor.
+
+Supported temperature range is from -40 to 125 degrees Celsius.
+
+Communication with the device is performed via I2C protocol. Sensor's default address
+is 0x40.
+
+sysfs-Interface
+---------------
+
+=================== =================
+temp1_input:        temperature input
+humidity1_input:    humidity input
+serial_number:      serial number
+heater_enable:      heater control
+=================== =================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 874f8fd26325..86f6f5e46b59 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -85,6 +85,7 @@ Hardware Monitoring Kernel Drivers
    hih6130
    hp-wmi-sensors
    hs3001
+   htu31
    ibmaem
    ibm-cffps
    ibmpowernv
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4cbaba15d86e..e123e06ba352 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -789,6 +789,17 @@ config SENSORS_HS3001
 	  This driver can also be built as a module. If so, the module
 	  will be called hs3001.
 
+config SENSORS_HTU31
+	tristate "Measurement Specialties HTU31 humidity and temperature sensor"
+	depends on I2C
+	select CRC8
+	help
+	  If you say yes here you get support for the HTU31 humidity
+	  and temperature sensors.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called htu31.
+
 config SENSORS_IBMAEM
 	tristate "IBM Active Energy Manager temperature/power sensors and control"
 	select IPMI_SI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b7ef0f0562d3..02465d959d14 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -199,6 +199,7 @@ obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
 obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
 obj-$(CONFIG_SENSORS_SG2042_MCU) += sg2042-mcu.o
 obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
+obj-$(CONFIG_SENSORS_HTU31)	+= htu31.o
 obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
 obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
 obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
diff --git a/drivers/hwmon/htu31.c b/drivers/hwmon/htu31.c
new file mode 100644
index 000000000000..09f979a8db92
--- /dev/null
+++ b/drivers/hwmon/htu31.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * The driver for Measurement Specialties HTU31 Temperature and Humidity sensor.
+ *
+ * Copyright (C) 2025
+ * Author: Andrei Lalaev <andrey.lalaev@gmail.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/crc8.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#define HTU31_READ_TEMP_HUM_CMD	0x00
+#define HTU31_READ_SERIAL_CMD		0x0a
+#define HTU31_CONVERSION_CMD		0x5e
+#define HTU31_HEATER_OFF_CMD		0x02
+#define HTU31_HEATER_ON_CMD		0x04
+
+#define HTU31_TEMP_HUM_LEN		6
+
+/* Conversion time for the highest resolution */
+#define HTU31_HUMIDITY_CONV_TIME	10000 /* us */
+#define HTU31_TEMPERATURE_CONV_TIME	15000 /* us */
+
+#define HTU31_SERIAL_NUMBER_LEN	3
+#define HTU31_SERIAL_NUMBER_CRC_LEN	1
+#define HTU31_SERIAL_NUMBER_CRC_OFFSET	3
+
+#define HTU31_CRC8_INIT_VAL		0
+#define HTU31_CRC8_POLYNOMIAL		0x31
+DECLARE_CRC8_TABLE(htu31_crc8_table);
+
+struct htu31_data {
+	struct i2c_client *client;
+	struct mutex i2c_lock;
+	long wait_time;
+	long temperature;
+	long humidity;
+	u8 serial_number[HTU31_SERIAL_NUMBER_LEN];
+	bool heater_enable;
+};
+
+static long htu31_temp_to_millicelsius(long val)
+{
+	return -40000 + DIV_ROUND_CLOSEST(165000 * val, 65535);
+}
+
+static long htu31_relative_humidity(long val)
+{
+	return DIV_ROUND_CLOSEST(100000 * val, 65535);
+}
+
+static int htu31_data_fetch_command(struct htu31_data *data)
+{
+	struct i2c_client *client = data->client;
+	u8 conversion_on = HTU31_CONVERSION_CMD;
+	u8 read_data_cmd = HTU31_READ_TEMP_HUM_CMD;
+	u8 t_h_buf[HTU31_TEMP_HUM_LEN] = {};
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = 1,
+			.buf = &read_data_cmd,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(t_h_buf),
+			.buf = t_h_buf,
+		},
+	};
+	int ret;
+	u8 crc;
+
+	guard(mutex)(&data->i2c_lock);
+
+	ret = i2c_master_send(client, &conversion_on, 1);
+	if (ret != 1) {
+		ret = ret < 0 ? ret : -EIO;
+		dev_err(&client->dev,
+			"Conversion command is failed. Error code: %d\n", ret);
+		return ret;
+	}
+
+	fsleep(data->wait_time);
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs)) {
+		ret = ret < 0 ? ret : -EIO;
+		dev_err(&client->dev,
+			"T&H command is failed. Error code: %d\n", ret);
+		return ret;
+	}
+
+	crc = crc8(htu31_crc8_table, &t_h_buf[0], 2, HTU31_CRC8_INIT_VAL);
+	if (crc != t_h_buf[2]) {
+		dev_err(&client->dev, "Temperature CRC mismatch\n");
+		return -EIO;
+	}
+
+	crc = crc8(htu31_crc8_table, &t_h_buf[3], 2, HTU31_CRC8_INIT_VAL);
+	if (crc != t_h_buf[5]) {
+		dev_err(&client->dev, "Humidity CRC mismatch\n");
+		return -EIO;
+	}
+
+	data->temperature = htu31_temp_to_millicelsius(be16_to_cpup((__be16 *) &t_h_buf[0]));
+	data->humidity = htu31_relative_humidity(be16_to_cpup((__be16 *) &t_h_buf[3]));
+
+	return 0;
+}
+
+static umode_t htu31_is_visible(const void *data, enum hwmon_sensor_types type,
+		u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+	case hwmon_humidity:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static int htu31_read(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long *val)
+{
+	struct htu31_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = htu31_data_fetch_command(data);
+
+	if (ret < 0)
+		return ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr != hwmon_temp_input)
+			return -EINVAL;
+
+		*val = data->temperature;
+		break;
+	case hwmon_humidity:
+		if (attr != hwmon_humidity_input)
+			return -EINVAL;
+
+		*val = data->humidity;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int serial_number_populate(struct htu31_data *data)
+{
+	struct i2c_client *client = data->client;
+	u8 read_sn_cmd = HTU31_READ_SERIAL_CMD;
+	u8 sn_buf[HTU31_SERIAL_NUMBER_LEN + HTU31_SERIAL_NUMBER_CRC_LEN];
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = 1,
+			.buf = &read_sn_cmd,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(sn_buf),
+			.buf = sn_buf,
+		},
+	};
+	int ret;
+	u8 crc;
+
+	guard(mutex)(&data->i2c_lock);
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return -EIO;
+
+	crc = crc8(htu31_crc8_table, sn_buf, HTU31_SERIAL_NUMBER_LEN, HTU31_CRC8_INIT_VAL);
+	if (crc != sn_buf[HTU31_SERIAL_NUMBER_CRC_OFFSET]) {
+		dev_err(&client->dev, "Serial number CRC mismatch\n");
+		return -EIO;
+	}
+
+	memcpy(data->serial_number, sn_buf, HTU31_SERIAL_NUMBER_LEN);
+
+	return 0;
+}
+
+static ssize_t heater_enable_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct htu31_data *data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", data->heater_enable);
+}
+
+static ssize_t heater_enable_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t count)
+{
+	struct htu31_data *data = dev_get_drvdata(dev);
+	u8 heater_cmd;
+	bool status;
+	int ret;
+
+	ret = kstrtobool(buf, &status);
+	if (ret)
+		return ret;
+
+	heater_cmd = status ? HTU31_HEATER_ON_CMD : HTU31_HEATER_OFF_CMD;
+
+	guard(mutex)(&data->i2c_lock);
+
+	ret = i2c_master_send(data->client, &heater_cmd, 1);
+	if (ret < 0)
+		return -EIO;
+
+	data->heater_enable = status;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(heater_enable);
+
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct htu31_data *data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%X%X%X\n", data->serial_number[0],
+					   data->serial_number[1],
+					   data->serial_number[2]);
+}
+
+static DEVICE_ATTR_RO(serial_number);
+
+static struct attribute *htu31_attrs[] = {
+	&dev_attr_heater_enable.attr,
+	&dev_attr_serial_number.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(htu31);
+
+static const struct hwmon_channel_info * const htu31_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT),
+	NULL,
+};
+
+static const struct hwmon_ops htu31_hwmon_ops = {
+	.is_visible = htu31_is_visible,
+	.read = htu31_read,
+};
+
+static const struct hwmon_chip_info htu31_chip_info = {
+	.info = htu31_info,
+	.ops = &htu31_hwmon_ops,
+};
+
+static int htu31_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct htu31_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	data->wait_time = HTU31_TEMPERATURE_CONV_TIME + HTU31_HUMIDITY_CONV_TIME;
+
+	mutex_init(&data->i2c_lock);
+
+	crc8_populate_msb(htu31_crc8_table, HTU31_CRC8_POLYNOMIAL);
+
+	if (serial_number_populate(data)) {
+		dev_err(dev, "Failed to read serial number\n");
+		return -EIO;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+							 client->name,
+							 data,
+							 &htu31_chip_info,
+							 htu31_groups);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id htu31_id[] = {
+	{ "htu31" },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, htu31_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id htu31_of_match[] = {
+	{ .compatible = "meas,htu31" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, htu31_of_match);
+#endif
+
+static struct i2c_driver htu31_driver = {
+	.driver = {
+		.name = "htu31",
+		.of_match_table = of_match_ptr(htu31_of_match),
+	},
+	.probe = htu31_probe,
+	.id_table = htu31_id,
+};
+module_i2c_driver(htu31_driver);
+
+MODULE_AUTHOR("Andrei Lalaev <andrey.lalaev@gmail.com>");
+MODULE_DESCRIPTION("HTU31 Temperature and Humidity sensor driver");
+MODULE_VERSION("1.0");
+MODULE_LICENSE("GPL");
-- 
2.48.1

