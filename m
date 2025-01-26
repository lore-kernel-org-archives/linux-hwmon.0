Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B42AF00;
	Sun, 26 Jan 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737902631; cv=none; b=E6etf23gE5OFNjc9TuceTUxar/eKDab+tx7zyEcxLro5pRFze7gIXfdbwwCH/DvMQyc1BsgNwJgDuHlXFY+IlTavqE6L9OMzhFe0fp8tjF09G3HDO7gpYPc7RoRrsXrb5oEgK2ItIqgOVYQTEqbD/oHvUOgr7Onp9TNc8N/HWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737902631; c=relaxed/simple;
	bh=SlAw8AvnR1BT0Tw7YiYZand5A6VyD+auni9R8wYokyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gt8SIcas8RaQLygITFtbgos9s2pFetAU+Iy/NpPdQQMWIBFi+6qxU9sdYiwcikWWK7wWDu4sP7yznmypX6l561/7c85C30ChuqaaAnmHi149Gug2oxxDVfi+VzAXOMpRgk7eulFV1LqUb/kdeG1q/sUMxkhc/wmnkxQYonCykZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8O3C6Hb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8O3C6Hb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so22915015e9.1;
        Sun, 26 Jan 2025 06:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737902628; x=1738507428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRCvTi8R03PPRzhOBygqxo7hIkC5n0odrIp4NOjXqTw=;
        b=W8O3C6HbnFB9aQUfTZhjCjehHY7Q3Nm2h3kCnJmNqSSxL/dgIr6OFkNfuwaqNIntUS
         +g2YvBGMLX54KUISlOSs83Y1VYdtWDvtPxxvjVKxHWXRFsL+6ovi3+5P1gHrdkoSZbHr
         Jo4JeUGITD/UxTL/3yJu6j3KpASA1vAjalsqj5nwE00nkHRPyGrVINcsDnfVZjvRc9dP
         Hy/RS2Z7P/3TOfC8YZWFfJiOSa42mIRS206HOnitMEDQCPlP8N0NXzaxT4S92ylaEnDX
         37ndfIpZmwPGb6jxUwzz5rftpX0k7u74Gxng79lpXZC9N6z3bICOjQbG5Qx8EMrHnKWz
         iarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737902628; x=1738507428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRCvTi8R03PPRzhOBygqxo7hIkC5n0odrIp4NOjXqTw=;
        b=HMBpp+gTyFDNUV7NFg1sGnqh08AQccUJodJSYp5moPls0iTVfofxg7oHsimctIJCjM
         0dLOwNNqIL4LLsSokDuWt3e9F5mo11Puk+AxtxlKL0M6oXeMaDYngqzW8mgzfE3HE3Dy
         iXmgt0S3ozPAamWRkkscYmfLOfyyDVPrERP5kcAj/uur9owZuZiv9jqmcV6eprN3fHl6
         zHeYQTBz/GEWDLsXx6xL+c5ddHFMfM1V7XWI4gtMFs+35jK61QopBJmz/B++TiEi8HEV
         i17TQKmX/ApXFr4AXhp+p2L8k8QJTyp0xaYFCx4EVlYYKu/X2i6YzDLXOON30KtR6xM+
         /MYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRcHH1XT1GWmvmiYKIDILJCCoo2IeADSPekn9zF4JEY4mpfdYdHz/sm0BTOsBkhl5TD2MwUzC3nJsE2XIk@vger.kernel.org, AJvYcCWyN+HiqMy5tCrLiUl9cOEtN2i6hhkam8xmRUigKE2XVjQxf7FlwW06pY9EEkIr0QiEuu/VDlTBjx9k@vger.kernel.org
X-Gm-Message-State: AOJu0YyiT1TjiNF2/mLbbCFaghHARkekwxYJpJhGUDjFi2RBSsKmlSBM
	t00zyEMTny+aqmrUpcpZu6/5QtHJ/5O/oW5VNFIEnLu2glWBkhEu
X-Gm-Gg: ASbGnct9uB+EwLRo4oJL7TGv2Ehb2pmFUVF0CUt6A2YrVtZ5zUuY7/tqFp6pRfRUYGv
	IHG6Z4rdlEIXEpSFCHxTeSvPym+uK//Oc/twSQWw/hyzybvd+TFpwqRcGiK3da4MbESQ7tbvxeG
	MP+b7H0SiqNqXB7oG8APp8PHjL20W8Rzq+4obUim1eXBkZhxLfyMDN5ycfp4tlYeqEW4HQo5uO7
	Vag1NehLr/iu1KCaiPEzK8CxbTGTjIO53KGDNL5Qy6FYAEV3iUIGYSqqDr0hP85IzTMfhRpp+LU
	CKKWobdB5PTD95Zt1/aL/mUALF2OO6g7GEyZEebFOBbipY9k8BpCq1G0j4MnIDQALhD63WJ/LJr
	dbpFhBDyY3tTTxLf749TRnyg6OlE41GAoXA==
X-Google-Smtp-Source: AGHT+IH2i3NJlvM4DTM8DOwSomMxO7HnvjD7AzQxrFvgMyh9u2RB9FsFRwfvAmbIqgPpIbBbTkCFwg==
X-Received: by 2002:a05:600c:34d0:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4389142e805mr315719965e9.19.1737902627281;
        Sun, 26 Jan 2025 06:43:47 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f120sm98772065e9.2.2025.01.26.06.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:43:47 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	robh@kernel.org,
	krzk@kernel.org,
	christophe.jaillet@wanadoo.fr
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrey.lalaev@gmail.com
Subject: [PATCH 1/2] hwmon: add driver for HTU31
Date: Sun, 26 Jan 2025 15:40:55 +0100
Message-ID: <20250126144155.430263-2-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250126144155.430263-1-andrey.lalaev@gmail.com>
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add base support for HTU31 temperature and humidity sensor.

Besides temperature and humidity values, the driver also exports a 24-bit
serial number and heater control to sysfs.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 Documentation/hwmon/htu31.rst |  38 ++++
 Documentation/hwmon/index.rst |   1 +
 MAINTAINERS                   |   6 +
 drivers/hwmon/Kconfig         |  11 ++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/htu31.c         | 345 ++++++++++++++++++++++++++++++++++
 6 files changed, 402 insertions(+)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e047e20fbd8..2550a41f8b50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10643,6 +10643,12 @@ W:	http://www.st.com/
 F:	Documentation/devicetree/bindings/iio/humidity/st,hts221.yaml
 F:	drivers/iio/humidity/hts221*
 
+HTU31 Hardware Temperature and Humidity Sensor
+M:	Andrei Lalaev <andrey.lalaev@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/htu31.c
+
 HUAWEI ETHERNET DRIVER
 M:	Cai Huoqing <cai.huoqing@linux.dev>
 L:	netdev@vger.kernel.org
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
index 000000000000..4036030e68a6
--- /dev/null
+++ b/drivers/hwmon/htu31.c
@@ -0,0 +1,345 @@
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
+/**
+ * struct htu31_data - all the data required to operate a HTU31 chip
+ * @client: the i2c client associated with the HTU31
+ * @lock: a mutex to prevent parallel access to the data
+ * @wait_time: the time needed by sensor to convert values
+ * @temperature: the latest temperature value in millidegrees
+ * @humidity: the latest relative humidity value in millipercent
+ * @serial_number: the serial number of the sensor
+ * @heater_enable: the internal state of the heater
+ */
+struct htu31_data {
+	struct i2c_client *client;
+	struct mutex lock; /* Used to protect against parallel data updates */
+	long wait_time;
+	long temperature;
+	long humidity;
+	u8 serial_number[HTU31_SERIAL_NUMBER_LEN];
+	bool heater_enable;
+};
+
+static long htu31_temp_to_millicelsius(u16 val)
+{
+	return -40000 + DIV_ROUND_CLOSEST_ULL(165000ULL * val, 65535);
+}
+
+static long htu31_relative_humidity(u16 val)
+{
+	return DIV_ROUND_CLOSEST_ULL(100000ULL * val, 65535);
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
+	guard(mutex)(&data->lock);
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
+	data->temperature = htu31_temp_to_millicelsius(be16_to_cpup((__be16 *)&t_h_buf[0]));
+	data->humidity = htu31_relative_humidity(be16_to_cpup((__be16 *)&t_h_buf[3]));
+
+	return 0;
+}
+
+static umode_t htu31_is_visible(const void *data, enum hwmon_sensor_types type,
+				u32 attr, int channel)
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
+		      u32 attr, int channel, long *val)
+{
+	struct htu31_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = htu31_data_fetch_command(data);
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
+static int htu31_read_serial_number(struct htu31_data *data)
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
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return ret;
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
+	guard(mutex)(&data->lock);
+
+	ret = i2c_master_send(data->client, &heater_cmd, 1);
+	if (ret < 0)
+		return ret;
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
+	NULL
+};
+
+ATTRIBUTE_GROUPS(htu31);
+
+static const struct hwmon_channel_info * const htu31_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT),
+	NULL
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
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	data->wait_time = HTU31_TEMPERATURE_CONV_TIME + HTU31_HUMIDITY_CONV_TIME;
+
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
+
+	crc8_populate_msb(htu31_crc8_table, HTU31_CRC8_POLYNOMIAL);
+
+	ret = htu31_read_serial_number(data);
+	if (ret) {
+		dev_err(dev, "Failed to read serial number\n");
+		return ret;
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
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, htu31_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id htu31_of_match[] = {
+	{ .compatible = "meas,htu31" },
+	{ }
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
+MODULE_LICENSE("GPL");
-- 
2.48.1

