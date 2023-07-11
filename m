Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988E5C001DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 14:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbjGKOGr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 10:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbjGKOGp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 10:06:45 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F40710E5
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 07:06:43 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-992b2249d82so741869466b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689084402; x=1691676402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ex0nPQsRIKoiAZVGFVCk2AQK491gzlXvxSOhQSe9c=;
        b=ZaWL+d/wYHKTMmHY6NLBoiWcj/wzivN27+OoM3w0QSZx7KvycIza5B5Qc0lPrFPgKP
         vvRCpQ5v5g8uqoVBfVjrNIT8CFmkai5RI7u7LUfg7WkqqKje8KD1qrJe0gD2px+Xnm3e
         0C+5vbOszxPzZCilTyOBovlLGbBBfYe8DcjFzZrNFgIyzkYSRTkbh89s5q1JZ1tT62DR
         KOv4zEnnpqUHcYfxu2V6SFTJtGAddyBHcqZSsulNj0GuRehSou6+xorRCB1QVy0hbBVS
         tgqZoV+122xNrzu3HfRPkJl8MJvQhMEyf7akkBA6ThEPqDutFwPa7o+dmD9ujGh40oTZ
         B91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084402; x=1691676402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4ex0nPQsRIKoiAZVGFVCk2AQK491gzlXvxSOhQSe9c=;
        b=NPhqRn3MqxU9U85mNnBSMlmHxUkIHVBEacRzhOvFTcPRbhj/tmQWZhyJdE45E6lLZc
         kAhQviMYp2HxnzhaATV0Mar7lilQLcoid7s279i5GA4ri5rxXge+KbnOnRYJ0CXUMSVb
         McExFcyTc9gGPdbULqqhqLeYSIBu+NCkIhUBOl9AhBcGml7pbWQMLVxTftrRHcAuDH9q
         ed+rhji4tnjKO8kE8D7B9BmUsnY1VW5igtvwCBjgY5Vzv4YC29gljIEeBxiG6gFE5+B6
         KvPdcPc0HAYGv8G9nd3r5+L1JzAf+uLCdOQs/gF/PyJ0ObmzrUUU7aXctw7kt9q3EVx/
         1gdg==
X-Gm-Message-State: ABy/qLZh6nD0X4smbsl5jjsqlTzjYBfqqSv7dREGNEdSUp63XglWnrMM
        0jtsoUosf9AZPfAtZX6kyATFNK7x9ztbM2E9JOg=
X-Google-Smtp-Source: APBJJlEsBgNYTZpnxgVMe/q86SImbKSGTGen2juplnKkGh/1AYmsfW3OoXGrIIVRi32UiKYCr5+jFQ==
X-Received: by 2002:a17:906:454d:b0:992:ba2c:2e0d with SMTP id s13-20020a170906454d00b00992ba2c2e0dmr13281191ejq.68.1689084401567;
        Tue, 11 Jul 2023 07:06:41 -0700 (PDT)
Received: from ws-565760.systec.local ([212.185.67.148])
        by smtp.gmail.com with ESMTPSA id bi3-20020a170906a24300b0098d2f703408sm1212222ejb.118.2023.07.11.07.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:06:40 -0700 (PDT)
From:   Andre Werner <werneazc@gmail.com>
X-Google-Original-From: Andre Werner <andre.werner@systec-electronic.com>
To:     jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: [PATCH 1/2] hwmon: (hs300x) Add driver for Renesas HS300x
Date:   Tue, 11 Jul 2023 16:06:36 +0200
Message-ID: <20230711140637.4909-1-andre.werner@systec-electronic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add base support for Renesas HS300x temperature
and humidity sensors.

The sensors has a fix I2C address 0x44. The resolution
is fixed to 14bit (ref. Missing feature).

Missing feature:
- Accessing non-volatile memory: Custom board has no
  possibility to control voltage supply of sensor. Thus,
  we cannot send the necessary control commands within
  the first 10ms after power-on.

Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
---
 Documentation/hwmon/hs300x.rst |  61 +++++
 drivers/hwmon/Kconfig          |  10 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/hs300x.c         | 461 +++++++++++++++++++++++++++++++++
 4 files changed, 533 insertions(+)
 create mode 100644 Documentation/hwmon/hs300x.rst
 create mode 100644 drivers/hwmon/hs300x.c

diff --git a/Documentation/hwmon/hs300x.rst b/Documentation/hwmon/hs300x.rst
new file mode 100644
index 000000000000..2be05d0f00ab
--- /dev/null
+++ b/Documentation/hwmon/hs300x.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver HS300x
+===================
+
+Supported chips:
+
+  * Renesas HS3001, HS3002, HS3003, HS3004
+
+    Prefix: 'hs300x'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
+
+Author:
+
+  - Andre Werner <andre.werner@systec-electronic.com>
+
+Description
+-----------
+
+This driver implements support for the Renesas HS300x chips, a humidity
+and temperature family. Temperature is measured in degrees celsius, relative
+humidity is expressed as a percentage. In the sysfs interface, all values are
+scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
+
+The device communicates with the I2C protocol. Sensors can have the I2C
+address 0x44 by default.
+
+The driver does not support the sensor's configuration possibilities.
+
+The driver is able to be read out using lmsensors.
+
+sysfs-Interface
+---------------
+
+===============================================================================
+temp1_input:        temperature input
+humidity1_input:    humidity input
+temp1_max:          temperature max value
+humidity1_max:      humidity max value
+temp1_min:          temperature min value
+humidity1_min:      humidity min value
+measuretime:        Measurement delay in usec
+===============================================================================
+
+Device Tree
+-----------
+
+Required node properties:
+
+ - compatible:  must be set to "hs3001", "hs3002", "hs3003", "hs3004"
+ - reg:         I2C address of the device (0x44)
+
+Example:
+
+    humidity: hs3002@44 {
+        compatible = "hs3002";
+        reg = <0x44>;
+    };
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 307477b8a371..9ce82fe0044b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -734,6 +734,16 @@ config SENSORS_HIH6130
 	  This driver can also be built as a module. If so, the module
 	  will be called hih6130.
 
+config SENSORS_HS300x
+	tristate "Renesas HS300x humidity and temperature sensors"
+	depends on I2C
+	help
+	  If you say yes here you get support for the Renesas HS300x
+	  humidity and temperature sensors.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called hs300x.
+
 config SENSORS_IBMAEM
 	tristate "IBM Active Energy Manager temperature/power sensors and control"
 	select IPMI_SI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3f4b0fda0998..a067c0896ca1 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_SENSORS_GSC)	+= gsc-hwmon.o
 obj-$(CONFIG_SENSORS_GPIO_FAN)	+= gpio-fan.o
 obj-$(CONFIG_SENSORS_GXP_FAN_CTRL) += gxp-fan-ctrl.o
 obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
+obj-$(CONFIG_SENSORS_HS300x)	+= hs300x.o
 obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
 obj-$(CONFIG_SENSORS_I5500)	+= i5500_temp.o
 obj-$(CONFIG_SENSORS_I5K_AMB)	+= i5k_amb.o
diff --git a/drivers/hwmon/hs300x.c b/drivers/hwmon/hs300x.c
new file mode 100644
index 000000000000..a22cc55a01ce
--- /dev/null
+++ b/drivers/hwmon/hs300x.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* This is a non-complete driver implementation for the
+ * HS300x humidity and temperature sensors. It does not include
+ * the configuration possibilities, because the hardware platform the IC is
+ * used does not control the power source for the IC. Thus, it cannot being
+ * set to 'programming mode' during power-up.
+ *
+ *
+ * Copyright (C) 2022 SYS TEC electronic AG
+ * Author: Andre Werner <andre.werner@systec-electronic.com>
+ */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/of_device.h>
+
+/* Measurement times */
+#define HS300X_WAKEUP_TIME 100	/* us */
+#define HS300X_UNUSED 0		/* us */
+#define HS300X_8BIT_RESOLUTION 550	/* us */
+#define HS300X_10BIT_RESOLUTION 1310	/* us */
+#define HS300X_12BIT_RESOLUTION 4500	/* us */
+#define HS300X_14BIT_RESOLUTION 16900	/* us */
+
+#define HS300X_CMD_OK 0
+#define HS300X_RESPONSE_LENGTH 4
+
+#define HS300X_FIXPOINT_ARITH 1000
+#define HS300X_MIN_TEMPERATURE (-40 * HS300X_FIXPOINT_ARITH) /* 1000 degree */
+#define HS300X_MAX_TEMPERATURE (125 * HS300X_FIXPOINT_ARITH) /* 1000 degree */
+#define HS300X_MIN_HUMIDITY (0 * HS300X_FIXPOINT_ARITH) /* 1000 % */
+#define HS300X_MAX_HUMIDITY (100 * HS300X_FIXPOINT_ARITH) /* 1000 % */
+
+#define HS300X_MASK_HUMIDITY_0X3FFF (0x3FFF)
+#define HS300X_MASK_TEMPERATURE_0XFFFC (0xFFFC)
+#define HS300X_MASK_STATUS_0XC0 (0xC0)
+#define HS300X_STATUS_SHIFT (6)
+
+/* Definitions for Status Bits of A/D Data */
+#define HS300X_DATA_VALID (0x00)	/* Valid Data */
+#define HS300X_DATA_STALE (0x01)	/* Stale Data */
+
+#define LIMIT_MAX 0
+#define LIMIT_MIN 1
+
+enum hs300x_chips {
+	hs3001,
+	hs3002,
+	hs3003,
+	hs3004,
+};
+
+struct hs300x_accurancy {
+	u32 hum_acc;		/* accurancy of humidity in *1000 % */
+	u32 temp_acc;		/* accurancy of temperature in *1000 % */
+};
+
+const struct hs300x_accurancy hs300x_accurancys[] = {
+	{ 1500, 200 },
+	{ 1800, 200 },
+	{ 2500, 250 },
+	{ 3500, 300 },
+};
+
+struct hs300x_data {
+	struct i2c_client *client;
+	struct mutex i2c_lock;	/* lock for sending i2c commands */
+	struct mutex data_lock;	/* lock for updating driver data */
+	u32 wait_time;		/* in us */
+	int temperature;	/* in *1000 degree */
+	u32 humidity;		/* in *1000 % */
+};
+
+static int hs300x_measure_command(struct i2c_client *client,
+				  struct hs300x_data *data)
+{
+	int ret = 0;
+	unsigned char buf[1] = { 0x00 };
+
+	if (!data || !client)
+		return -EINVAL;
+
+	mutex_lock(&data->i2c_lock);
+	ret = i2c_master_send(client, (const char *)buf, 0);
+	mutex_unlock(&data->i2c_lock);
+
+	if (0 > ret)
+		dev_dbg(&client->dev,
+			"Error starting measurement. Errno: %d.\n", ret);
+	else {
+		ret = HS300X_CMD_OK;
+	}
+
+	return ret;
+}
+
+static int hs300x_extract_temperature(u16 raw)
+{
+	/* fixpoint arithmetic 1 digit */
+	int temp = ((raw & HS300X_MASK_TEMPERATURE_0XFFFC) >> 2) *
+	    HS300X_FIXPOINT_ARITH;
+
+	temp /= ((1 << 14) - 1);
+
+	return (temp * 165) - (40 * HS300X_FIXPOINT_ARITH);
+}
+
+static u32 hs300x_extract_humidity(u16 raw)
+{
+	int hum = (raw & HS300X_MASK_HUMIDITY_0X3FFF) * HS300X_FIXPOINT_ARITH;
+
+	hum /= ((1 << 14) - 1);
+
+	return hum * 100;
+}
+
+static int hs300x_data_fetch_command(struct i2c_client *client,
+				     struct hs300x_data *data)
+{
+	int ret = HS300X_CMD_OK;
+	u8 buf[HS300X_RESPONSE_LENGTH];
+	u8 hs300x_status;
+
+	if (!client || !data)
+		return -EINVAL;
+
+	mutex_lock(&data->i2c_lock);
+	ret = i2c_master_recv(client, buf, HS300X_RESPONSE_LENGTH);
+	mutex_unlock(&data->i2c_lock);
+
+	if (ret != HS300X_RESPONSE_LENGTH) {
+		ret = ret < 0 ? ret : -EIO;
+		dev_dbg(&client->dev,
+			"Error in i2c communication. Error code: %d.\n", ret);
+		goto out;
+	}
+
+	hs300x_status = (buf[0] & HS300X_MASK_STATUS_0XC0) >>
+	    HS300X_STATUS_SHIFT;
+	if (hs300x_status == HS300X_DATA_STALE) {
+		dev_dbg(&client->dev, "Sensor busy.\n");
+		ret = -EBUSY;
+		goto out;
+	} else if (hs300x_status != HS300X_DATA_VALID) {
+		dev_dbg(&client->dev, "Data invalid.\n");
+		ret = -EIO;
+		goto out;
+	}
+
+	mutex_lock(&data->data_lock);
+	data->humidity =
+	    hs300x_extract_humidity(be16_to_cpup((__be16 *) &buf[0]));
+	data->temperature =
+	    hs300x_extract_temperature(be16_to_cpup((__be16 *) &buf[2]));
+	mutex_unlock(&data->data_lock);
+
+	ret = HS300X_CMD_OK;
+
+out:
+	return ret;
+}
+
+/* sysfs attributes */
+static ssize_t measuretime_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct hs300x_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	client = data->client;
+
+	if (!client)
+		return -ENODEV;
+
+	return sprintf(buf, "%d\n", data->wait_time);
+}
+
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct hs300x_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client;
+	int ret;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	client = data->client;
+
+	if (!client) {
+		dev_dbg(dev, "No valid I2C client available.\n");
+		return -ENODEV;
+	}
+
+	ret = hs300x_measure_command(client, data);
+	if (ret != HS300X_CMD_OK)
+		return ret;
+
+	/* Sensor needs some time to process measurement depending on
+	 * resolution
+	 */
+	fsleep(data->wait_time);
+
+	ret = hs300x_data_fetch_command(client, data);
+	if (ret != HS300X_CMD_OK)
+		return ret;
+
+	return sprintf(buf, "%d\n", data->temperature);
+}
+
+static ssize_t humidity1_input_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct hs300x_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client;
+	int ret;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	client = data->client;
+
+	if (!client) {
+		dev_dbg(dev, "No valid I2C client available.\n");
+		return -ENODEV;
+	}
+
+	ret = hs300x_measure_command(client, data);
+	if (ret != HS300X_CMD_OK)
+		return ret;
+
+	/* Sensor needs some time to process measurement depending on
+	 * resolution
+	 */
+	fsleep(data->wait_time);
+
+	ret = hs300x_data_fetch_command(client, data);
+	if (ret != HS300X_CMD_OK)
+		return ret;
+
+	return sprintf(buf, "%u\n", data->humidity);
+}
+
+static ssize_t temp1_limit_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int temperature_limit;
+	u8 index;
+
+	index = to_sensor_dev_attr(attr)->index;
+	if (LIMIT_MIN == index)
+		temperature_limit = HS300X_MIN_TEMPERATURE;
+	else
+		temperature_limit = HS300X_MAX_TEMPERATURE;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", temperature_limit);
+}
+
+static ssize_t humidity1_limit_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	u32 humidity_limit;
+	u8 index;
+
+	index = to_sensor_dev_attr(attr)->index;
+	if (LIMIT_MIN == index)
+		humidity_limit = HS300X_MIN_HUMIDITY;
+	else
+		humidity_limit = HS300X_MAX_HUMIDITY;
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", humidity_limit);
+}
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp1_input, 0);
+static SENSOR_DEVICE_ATTR_RO(humidity1_input, humidity1_input, 0);
+static SENSOR_DEVICE_ATTR_RO(measuretime, measuretime, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max, temp1_limit, LIMIT_MAX);
+static SENSOR_DEVICE_ATTR_RO(humidity1_max, humidity1_limit, LIMIT_MAX);
+static SENSOR_DEVICE_ATTR_RO(temp1_min, temp1_limit, LIMIT_MIN);
+static SENSOR_DEVICE_ATTR_RO(humidity1_min, humidity1_limit, LIMIT_MIN);
+
+static struct attribute *hs3001_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_humidity1_input.dev_attr.attr,
+	&sensor_dev_attr_measuretime.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_humidity1_max.dev_attr.attr,
+	&sensor_dev_attr_temp1_min.dev_attr.attr,
+	&sensor_dev_attr_humidity1_min.dev_attr.attr,
+	NULL
+};
+
+static struct attribute *hs3002_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_humidity1_input.dev_attr.attr,
+	&sensor_dev_attr_measuretime.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_humidity1_max.dev_attr.attr,
+	&sensor_dev_attr_temp1_min.dev_attr.attr,
+	&sensor_dev_attr_humidity1_min.dev_attr.attr,
+	NULL
+};
+
+static struct attribute *hs3003_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_humidity1_input.dev_attr.attr,
+	&sensor_dev_attr_measuretime.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_humidity1_max.dev_attr.attr,
+	&sensor_dev_attr_temp1_min.dev_attr.attr,
+	&sensor_dev_attr_humidity1_min.dev_attr.attr,
+	NULL
+};
+
+static struct attribute *hs3004_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_humidity1_input.dev_attr.attr,
+	&sensor_dev_attr_measuretime.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_humidity1_max.dev_attr.attr,
+	&sensor_dev_attr_temp1_min.dev_attr.attr,
+	&sensor_dev_attr_humidity1_min.dev_attr.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(hs3001);
+ATTRIBUTE_GROUPS(hs3002);
+ATTRIBUTE_GROUPS(hs3003);
+ATTRIBUTE_GROUPS(hs3004);
+
+static const struct i2c_device_id hs300x_ids[];
+#ifdef CONFIG_OF
+static const struct of_device_id hs300x_of_ids[] = {
+	{.compatible = "hs3001" },
+	{.compatible = "hs3002" },
+	{.compatible = "hs3003" },
+	{.compatible = "hs3004" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, hs300x_of_ids);
+#endif
+
+static int hs300x_probe(struct i2c_client *client)
+{
+	struct hs300x_data *data;
+	struct device *hwmon_dev;
+	struct i2c_adapter *adap = client->adapter;
+	struct device *dev = &client->dev;
+	const struct attribute_group **attribute_groups;
+	int ret;
+#ifdef CONFIG_OF
+	const struct of_device_id *of_match;
+
+	of_match = of_match_device(hs300x_of_ids, dev);
+	if (!of_match) {
+		dev_err(dev, "No match in DT compatibles.\n");
+		return -ENODEV;
+	}
+
+#endif
+	if (!i2c_check_functionality(adap, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	/* Measurement time = wake-up time + measurement time temperature
+	 *      measurment time humidity This is currently static, because
+	 *      enabling programming mode is not supported, yet.
+	 */
+	data->wait_time = (HS300X_WAKEUP_TIME + HS300X_14BIT_RESOLUTION +
+			   HS300X_14BIT_RESOLUTION);
+	mutex_init(&data->i2c_lock);
+	mutex_init(&data->data_lock);
+
+	if (i2c_match_id(hs300x_ids, client)->driver_data == hs3001)
+		attribute_groups = hs3001_groups;
+	else if (i2c_match_id(hs300x_ids, client)->driver_data == hs3002)
+		attribute_groups = hs3002_groups;
+	else if (i2c_match_id(hs300x_ids, client)->driver_data == hs3003)
+		attribute_groups = hs3003_groups;
+	else if (i2c_match_id(hs300x_ids, client)->driver_data == hs3004)
+		attribute_groups = hs3004_groups;
+	else {
+		dev_err(dev, "Unknwon device for HS300x driver\n");
+		goto error;
+	}
+
+	/* Measure humidity and temperature to initialize values */
+	ret = hs300x_measure_command(client, data);
+	if (ret) {
+		goto error;
+	}
+
+	/* Sensor needs some time to process measurement depending on
+	 * resolution
+	 */
+	fsleep(data->wait_time);
+
+	ret = hs300x_data_fetch_command(client, data);
+	if (ret != HS300X_CMD_OK) {
+		goto error;
+	}
+
+	hwmon_dev =
+	    devm_hwmon_device_register_with_groups(dev, client->name, data,
+						   attribute_groups);
+
+	if (IS_ERR(hwmon_dev)) {
+		dev_err(dev, "Unable to register hwmon device %s\n",
+			client->name);
+		goto error;
+	}
+
+	dev_info(dev, "Successfully probe %s: sensor '%s'\n",
+		 dev_name(hwmon_dev), client->name);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+error:
+	devm_kfree(dev, data);
+	return -ENODEV;
+}
+
+/* device ID table */
+static const struct i2c_device_id hs300x_ids[] = {
+	{ "hs3001", hs3001 },
+	{ "hs3002", hs3002 },
+	{ "hs3003", hs3003 },
+	{ "hs3004", hs3004 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, hs300x_ids);
+
+static struct i2c_driver hs300x_i2c_driver = {
+	.driver = {
+		   .name = "hs300x",
+		   .of_match_table = of_match_ptr(hs300x_of_ids),
+		    },
+	.probe_new = hs300x_probe,
+	.id_table = hs300x_ids,
+};
+
+module_i2c_driver(hs300x_i2c_driver);
+
+MODULE_AUTHOR("Andre Werner <andre.werner@systec-electronic.com>");
+MODULE_DESCRIPTION("HS300x humidity and temperature sensor base  driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0

