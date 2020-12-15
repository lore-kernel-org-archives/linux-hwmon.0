Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B529AC4361B
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Dec 2020 20:57:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A37822CAE
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Dec 2020 20:57:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgLOU4g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Dec 2020 15:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgLOU4P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Dec 2020 15:56:15 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82833C06179C
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 12:55:34 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id a12so42971747lfl.6
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 12:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=kbzWVDXvOj5EQHxV3c7aHdHsP7lOfSnaMg01tPCkKiw=;
        b=YvYVndbO07I/jfWuqaH9Xu5khX8N9Vzhr7SaZBCZ97E83BMaOcJ7L+yipmqJe7OltC
         BhzktkbqWyh4gzABowDYgEoZ52aY9uIm2UkBD5okutNbxFHiu+Qg/a0H6EVZTsBXcU7w
         52+aD09nUBVdg1WZ377YOhcoevnyzHhkSHgtThLIEYZDIvjmrzqFPLUD2EEG1biSY88H
         R3jeFd3z99W+tLu1peuKo6HzrUTn3WcOW49uJC6PgN6zVUVponDBxVR+csD2AiB1ZEzp
         8trPvhhS9KrbRz/tHEJbX0QpewBDxhwBYX8rH+g7g8OZ5A+NbR901NANJVMjeyogz9K/
         hOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=kbzWVDXvOj5EQHxV3c7aHdHsP7lOfSnaMg01tPCkKiw=;
        b=ASe2IHgvF+OaiaW5R37ZCaCndEm95bt0tWX8RMS7wEbaHlPJbTDL9IuS/bwQM7V/vf
         RWrFI2tf9zZp2+6ppmBRqJl/J2V0YIm59sLoX0BadpPge/qthOxqHMjW3BN/pFF4+LR2
         RlvYJMjkRcxm7hMO0FXXrIcD9z3XB8qholvnPHPmQyOZg/qAjzHt6RWhNMRX5OG5IQ4H
         SsFmJCblq+n2iu//vhKhLtOPnNB5lLU2AEXnebYMqWRr18vj2PyAHCQIx6Xsw5lYrGfw
         +8GtMdY6IOE5XfpAUNNY75AymM2m2nbbWURmwUo8e6wFopnyDfpO8W9+evlh2GlXXir/
         fwmQ==
X-Gm-Message-State: AOAM530LYNebKAfL5d9zMOkaVLYc4rWoY/Bm6+ndmQjUO1r1MIA4bXLn
        JHVci7WUjO1JevvhaWq5GKhUrhGg/RM=
X-Google-Smtp-Source: ABdhPJwy0RFkrjN3Ad/AGnT2BkG+w/MgJfe+kity1At8rHy5J2O4+de8TIE2fbjmoXbjeZ05VLXzag==
X-Received: by 2002:a19:c1d7:: with SMTP id r206mr13135971lff.345.1608065732512;
        Tue, 15 Dec 2020 12:55:32 -0800 (PST)
Received: from desktop (94-255-234-122.cust.bredband2.com. [94.255.234.122])
        by smtp.gmail.com with ESMTPSA id u14sm2966732ljo.72.2020.12.15.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:55:31 -0800 (PST)
Date:   Tue, 15 Dec 2020 21:55:29 +0100
From:   "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v2] hwmon: Add AHT10 Temperature and Humidity Sensor Driver
Message-ID: <20201215205529.GA273894@desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds a hwmon driver for the AHT10 Temperature and
Humidity sensor. It has a maxiumum sample rate, as the datasheet
states that the chip may heat up if it is sampled more than once
every two seconds.

Has been tested a to work on a raspberrypi0w

Changes from the previous patch:
Removed devicetree/of references
Removed aht10_reset, aht10_remove
Add documentation
Switch to hwmon channels, attributes and info
More appropriate usage of mutex
Return standard error codes
Add checking statements for errors that are returned
Other code improvements as suggested

Signed-off-by: Johannes Cornelis Draaijer (datdenkikniet) <jcdra1@gmail.com>
---
 Documentation/hwmon/aht10.rst |  46 +++++
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/aht10.c         | 354 ++++++++++++++++++++++++++++++++++
 4 files changed, 411 insertions(+)
 create mode 100644 Documentation/hwmon/aht10.rst
 create mode 100644 drivers/hwmon/aht10.c

diff --git a/Documentation/hwmon/aht10.rst b/Documentation/hwmon/aht10.rst
new file mode 100644
index 000000000000..38737cce3bb5
--- /dev/null
+++ b/Documentation/hwmon/aht10.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver aht10
+=====================
+
+Supported chips:
+
+  * Aosong AHT10
+
+    Prefix: 'aht10'
+
+    Addresses scanned: None
+
+    Datasheet:
+
+      Chinese: http://www.aosong.com/userfiles/files/media/AHT10%E4%BA%A7%E5%93%81%E6%89%8B%E5%86%8C%20A3%2020201210.pdf
+      English: https://server4.eca.ir/eshop/AHT10/Aosong_AHT10_en_draft_0c.pdf
+
+Author: Johannes Cornelis Draaijer <jcdra1@gmail.com>
+
+
+Description
+-----------
+
+The AHT10 is a Temperature and Humidity sensor
+
+The address of this i2c device may only be 0x38
+
+Usage Notes
+-----------
+
+This driver does not probe for AHT10 devices, as there is no reliable
+way to determine if an i2c chip is or isn't an AHT10. The device has
+to be instantiated explicitly with the address 0x38. See
+Documentation/i2c/instantiating-devices.rst for details.
+
+Sysfs entries
+-------------
+
+=============== ============================================
+temp1_input     Measured temperature in millidegrees Celcius
+humidity1_input Measured humidity in %H
+update_interval The minimum interval for polling the sensor,
+                in milliseconds. Is writable, but may not be
+                lower than 2000
+=============== ============================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 288ae9f63588..96bad243d729 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -257,6 +257,16 @@ config SENSORS_ADT7475
 	  This driver can also be built as a module. If so, the module
 	  will be called adt7475.
 
+config SENSORS_AHT10
+	tristate "Aosong AHT10"
+	depends on I2C
+	help
+	  If you say yes here, you get support for the Aosong AHT10
+	  temperature and humidity sensors
+
+	  This driver can also be built as a module. If so, the module
+	  will be called aht10.
+
 config SENSORS_AS370
 	tristate "Synaptics AS370 SoC hardware monitoring driver"
 	help
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3e32c21f5efe..6cb44d54e628 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
 obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
 obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
 obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
+obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
 obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
new file mode 100644
index 000000000000..de3c08c513e8
--- /dev/null
+++ b/drivers/hwmon/aht10.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * aht10.c - Linux hwmon driver for AHT10 Temperature and Humidity sensor
+ * Copyright (C) 2020 Johannes Cornelis Draaijer
+ */
+
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+
+#define AHT10_ADDR 0x38
+#define AHT10_MEAS_SIZE 6
+#define AHT10_DEFAULT_MIN_POLL_INTERVAL 2000ll
+#define AHT10_MIN_POLL_INTERVAL 2000LL
+
+/*
+ * Delays
+ */
+#define AHT10_MEAS_USEC_DELAY 80000
+#define AHT10_CMD_USEC_DELAY 350000
+#define AHT10_USEC_DELAY_EXTRA 100000
+
+/*
+ * Command bytes
+ */
+#define AHT10_CMD_INIT 0b11100001
+#define AHT10_CMD_MEAS 0b10101100
+#define AHT10_CMD_RST  0b10111010
+
+/*
+ * Flags in the answer byte/command
+ */
+#define AHT10_CAL_ENABLED	BIT(3)
+#define AHT10_BUSY	BIT(7)
+#define AHT10_MODE_NOR	(BIT(5) | BIT(6))
+#define AHT10_MODE_CYC	BIT(5)
+#define AHT10_MODE_CMD	BIT(6)
+
+#define AHT10_MAX_POLL_INTERVAL_LEN	30
+
+/**
+ *   struct aht10_data - All the data required to operate an AHT10 chip
+ *   @client: the i2c client associated with the AHT10
+ *   @lock: a mutex that is used to prevent parallel access to the
+ *          i2c client
+ *   @min_poll_interval: the minimum poll interval
+ *                   While the poll rate limit is not 100% necessary,
+ *                   the datasheet recommends that a measurement
+ *                   is not performed too often to prevent
+ *                   the chip from warming up due to the heat it generates.
+ *                   If it's unwanted, it can be ignored setting it to
+ *                   it to 0. Default value is 2000 ms
+ *   @previous_poll_time: the previous time that the AHT10
+ *                        was polled
+ *   @temperature: the latest temperature value received from
+ *                 the AHT10
+ *   @humidity: the latest humidity value received from the
+ *              AHT10
+ */
+
+struct aht10_data {
+	struct i2c_client *client;
+	/*
+	 * Prevent simultaneous access to the i2c
+	 * client
+	 */
+	struct mutex lock;
+	ktime_t min_poll_interval;
+	ktime_t previous_poll_time;
+	int temperature;
+	int humidity;
+};
+
+/**
+ * aht10_init() - Initialize an AHT10 chip
+ * @client: the i2c client associated with the AHT10
+ * @data: the data associated with this AHT10 chip
+ * Return: 0 if succesfull, 1 if not
+ */
+static int aht10_init(struct aht10_data *data)
+{
+	const u8 cmd_init[] = {AHT10_CMD_INIT, AHT10_CAL_ENABLED | AHT10_MODE_CYC,
+			       0x00};
+	int res;
+	u8 status;
+	struct i2c_client *client = data->client;
+
+	res = i2c_master_send(client, cmd_init, 3);
+	if (res < 0)
+		return res;
+
+	usleep_range(AHT10_CMD_USEC_DELAY, AHT10_CMD_USEC_DELAY +
+		     AHT10_USEC_DELAY_EXTRA);
+
+	res = i2c_master_recv(client, &status, 1);
+	if (res != 1)
+		return -ENODATA;
+
+	if (status & AHT10_BUSY)
+		return -EBUSY;
+
+	return 0;
+}
+
+/**
+ * aht10_polltime_expired() - check if the minimum poll interval has
+ *                                  expired
+ * @data: the data containing the time to compare
+ * Return: 1 if the minimum poll interval has expired, 0 if not
+ */
+static int aht10_polltime_expired(struct aht10_data *data)
+{
+	ktime_t current_time = ktime_get_boottime();
+	ktime_t difference = ktime_sub(current_time, data->previous_poll_time);
+
+	return ktime_after(difference, data->min_poll_interval);
+}
+
+/**
+ * aht10_read_values() - read and parse the raw data from the AHT10
+ * @aht10_data: the struct aht10_data to use for the lock
+ * Return: 0 if succesfull, 1 if not
+ */
+static int aht10_read_values(struct aht10_data *data)
+{
+	const u8 cmd_meas[] = {AHT10_CMD_MEAS, 0x33, 0x00};
+	u32 temp, hum;
+	int res;
+	u8 raw_data[AHT10_MEAS_SIZE];
+	struct i2c_client *client = data->client;
+
+	mutex_lock(&data->lock);
+	if (aht10_polltime_expired(data)) {
+		res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
+		if (res < 0)
+			return res;
+
+		usleep_range(AHT10_MEAS_USEC_DELAY,
+			     AHT10_MEAS_USEC_DELAY + AHT10_USEC_DELAY_EXTRA);
+
+		res = i2c_master_recv(client, raw_data, AHT10_MEAS_SIZE);
+		if (res != 6) {
+			mutex_unlock(&data->lock);
+			if (res >= 0)
+				return -ENODATA;
+			else
+				return res;
+		}
+
+		hum =   ((u32)raw_data[1] << 12u) |
+			((u32)raw_data[2] << 4u) |
+			(raw_data[3] & 0xF0u >> 4u);
+
+		temp =  ((u32)(raw_data[3] & 0x0Fu) << 16u) |
+			((u32)raw_data[4] << 8u) |
+			raw_data[5];
+
+		temp = ((temp * 625) >> 15u) * 10;
+		hum = ((hum * 625) >> 16u) * 10;
+
+		data->temperature = (int)temp - 50000;
+		data->humidity = hum;
+		data->previous_poll_time = ktime_get_boottime();
+	}
+	mutex_unlock(&data->lock);
+	return 0;
+}
+
+/**
+ * aht10_interval_write() - store the given minimum poll interval.
+ * Return: 0 on success, -EINVAL if a value lower than the
+ *         AHT10_MIN_POLL_INTERVAL is given
+ */
+static ssize_t aht10_interval_write(struct aht10_data *data,
+				    long val)
+{
+	if (val < AHT10_MIN_POLL_INTERVAL)
+		return -EINVAL;
+
+	data->min_poll_interval = ms_to_ktime(val);
+	return 0;
+}
+
+/**
+ * aht10_interval_read() - read the minimum poll interval
+ *                            in milliseconds
+ */
+static ssize_t aht10_interval_read(struct aht10_data *data,
+				   long *val)
+{
+	*val = ktime_to_ms(data->min_poll_interval);
+	return 0;
+}
+
+/**
+ * aht10_temperature1_read() - read the temperature in millidegrees
+ */
+static int aht10_temperature1_read(struct aht10_data *data, long *val)
+{
+	int res;
+
+	res = aht10_read_values(data);
+	if (res < 0)
+		return res;
+
+	*val = data->temperature;
+	return 0;
+}
+
+/**
+ * aht10_humidity1_read() - read the relative humidity in millipercent
+ */
+static int aht10_humidity1_read(struct aht10_data *data, long *val)
+{
+	int res;
+
+	res = aht10_read_values(data);
+	if (res < 0)
+		return res;
+
+	*val = data->humidity;
+	return 0;
+}
+
+static umode_t aht10_hwmon_visible(const void *data, enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+	case hwmon_humidity:
+		return 0444;
+	case hwmon_chip:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static int aht10_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long *val)
+{
+	struct aht10_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		return aht10_temperature1_read(data, val);
+	case hwmon_humidity:
+		return aht10_humidity1_read(data, val);
+	case hwmon_chip:
+		return aht10_interval_read(data, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int aht10_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long val)
+{
+	struct aht10_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_chip:
+		return aht10_interval_write(data, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct hwmon_channel_info *aht10_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT),
+	NULL,
+};
+
+static const struct hwmon_ops aht10_hwmon_ops = {
+	.is_visible = aht10_hwmon_visible,
+	.read = aht10_hwmon_read,
+	.write = aht10_hwmon_write,
+};
+
+static const struct hwmon_chip_info aht10_chip_info = {
+	.ops = &aht10_hwmon_ops,
+	.info = aht10_info,
+};
+
+static int aht10_probe(struct i2c_client *client,
+		       const struct i2c_device_id *aht10_id)
+{
+	struct device *device = &client->dev;
+	struct device *hwmon_dev;
+	struct aht10_data *data;
+	int res;
+
+	if (client->addr != AHT10_ADDR)
+		return 0;
+
+	/*
+	 * Verify that the i2c adapter that is being used
+	 * supports actual i2c operation
+	 */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENOENT;
+
+	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->min_poll_interval = ms_to_ktime(AHT10_DEFAULT_MIN_POLL_INTERVAL);
+	data->client = client;
+
+	mutex_init(&data->lock);
+
+	res = aht10_init(data);
+	if (res < 0)
+		return res;
+
+	res = aht10_read_values(data);
+	if (res < 0)
+		return res;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(device,
+							 client->name,
+							 data,
+							 &aht10_chip_info,
+							 NULL);
+
+	dev_info(hwmon_dev, "AHT10 successfully detected and registered.\n");
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id aht10_id[] = {
+	{ "aht10", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, aht10_id);
+
+static struct i2c_driver aht10_driver = {
+	.driver = {
+		.name = "aht10",
+	},
+	.probe      = aht10_probe,
+	.id_table   = aht10_id,
+};
+
+module_i2c_driver(aht10_driver);
+
+MODULE_AUTHOR("Johannes Cornelis Draaijer <jcdra1@gmail.com>");
+MODULE_DESCRIPTION("AHT10 Temperature and Humidity sensor driver");
+MODULE_VERSION("1.0");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

