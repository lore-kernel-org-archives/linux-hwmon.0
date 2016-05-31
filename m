Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta5.messagelabs.com ([195.245.231.137]:56947 "EHLO
	mail1.bemta5.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755920AbcEaJF5 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 31 May 2016 05:05:57 -0400
Received: from abgdgate60u.abg.fsc.net ([172.25.138.90])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id u4V8w6Gi025904
	for <linux-hwmon@vger.kernel.org>; Tue, 31 May 2016 09:58:24 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: linux-hwmon@vger.kernel.org
Cc: Thilo Cestonaro <thilo@cestona.ro>
Subject: [PATCH] added kernel module for FTS sensor chip "Teutates"
Date: Tue, 31 May 2016 10:55:50 +0200
Message-Id: <1464684950-31113-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Thilo Cestonaro <thilo@cestona.ro>

Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
---
 drivers/hwmon/Kconfig       |  11 +
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/ftsteutates.c | 814 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 826 insertions(+)
 create mode 100644 drivers/hwmon/ftsteutates.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index ff94007..5c98e55 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -486,6 +486,17 @@ config SENSORS_FSCHMD
 	  This driver can also be built as a module.  If so, the module
 	  will be called fschmd.
 
+config SENSORS_FTSTEUTATES
+	tristate "Fujitsu Technology Solutions sensor chip Teutates"
+	depends on X86 && I2C
+	help
+	  If you say yes here you get support for the Fujitsu Technology
+      Solutions (FTS) sensor chip "Teutates" including support for
+      the integrated watchdog.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called ftsteutates.
+
 config SENSORS_GL518SM
 	tristate "Genesys Logic GL518SM"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 2ef5b7c..dcad5f7 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_SENSORS_F71882FG)	+= f71882fg.o
 obj-$(CONFIG_SENSORS_F75375S)	+= f75375s.o
 obj-$(CONFIG_SENSORS_FAM15H_POWER) += fam15h_power.o
 obj-$(CONFIG_SENSORS_FSCHMD)	+= fschmd.o
+obj-$(CONFIG_SENSORS_FTSTEUTATES) += ftsteutates.o
 obj-$(CONFIG_SENSORS_G760A)	+= g760a.o
 obj-$(CONFIG_SENSORS_G762)	+= g762.o
 obj-$(CONFIG_SENSORS_GL518SM)	+= gl518sm.o
diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
new file mode 100644
index 0000000..f5ce2dd
--- /dev/null
+++ b/drivers/hwmon/ftsteutates.c
@@ -0,0 +1,814 @@
+/*
+ * ftsteutates.c, Support for the FTS Systemmonitoring Chip "Teutates"
+ * Specification can be found here:
+ * ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Products/Mainboards/
+ *		Industrial&ExtendedLifetime/D344x-S/IndustrialTools_D344x-S/
+ *		Linux_SystemMonitoring&Watchdog&GPIO/
+ *
+ * Copyright (C) 2016 Fujitsu Technology Solutions GmbH,
+ *		  Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <linux/watchdog.h>
+
+#define FTSTEUTATES_DEVICE_ID_REG		 0x0000
+#define FTSTEUTATES_DEVICE_REVISION_REG		   0x0001
+#define FTSTEUTATES_DEVICE_STATUS_REG		 0x0004
+#define FTSTEUTATES_SATELLITE_STATUS_REG	0x0005
+#define FTSTEUTATES_EVENT_STATUS_REG		0x0006
+#define FTSTEUTATES_GLOBAL_CONTROL_REG		  0x0007
+
+#define FTSTEUTATES_SENSOR_EVENT_REG		0x0010
+
+#define FTSTEUTATES_FAN_EVENT_REG		 0x0014
+#define FTSTEUTATES_FAN_PRESENT_REG		   0x0015
+
+#define FTSTEUTATES_POWER_ON_TIME_COUNTER_A 0x007A
+#define FTSTEUTATES_POWER_ON_TIME_COUNTER_B 0x007B
+#define FTSTEUTATES_POWER_ON_TIME_COUNTER_C 0x007C
+
+#define FTSTEUTATES_PAGE_SELECT_REG		   0x007F
+
+#define FTSTEUTATES_WATCHDOG_TIME_PRESET	0x000B
+#define FTSTEUTATES_WATCHDOG_RESOLUTION		   60
+
+/* possible addresses */
+static const unsigned short normal_i2c[] = { 0x73, I2C_CLIENT_END };
+
+enum chips { teutates };
+
+static struct i2c_device_id ftsteutates_id[] = {
+	{ "ftsteutates",	teutates },
+	{ }
+};
+
+struct ftsteutates_data {
+	struct i2c_client *client;
+	struct device *hwmon_dev;
+	struct mutex update_lock;
+	struct mutex watchdog_lock;
+	enum chips kind;
+	char valid; /* zero until following fields are valid */
+	unsigned long last_updated; /* in jiffies */
+
+	/* register values */
+	u8 revision;		/* chip revision */
+	u8 cpu_throttling;	/* cpu throttling active */
+	u32 overall_uptime; /* overall power on time in minutes */
+	u8 volt[4];			/* voltage */
+	u8 temp_input[16];	/* temperature value */
+	u8 temp_alarm[16];	/* temperature alarm */
+	u8 fan_present[8];	/* fan presence */
+	u8 fan_input[8];	/* fans revolutions per second */
+	u8 fan_source[8];	/* fan sensor source */
+	u8 fan_alarm[8];	/* fan alarm */
+};
+
+static DEFINE_MUTEX(watchdog_data_mutex);
+
+static const int FTSTEUTATES_NO_FAN_SENSORS[1] = { 8 };
+/* input fan speed */
+static const u16 FTSTEUTATES_REG_FAN_input[1][8] = {
+	{ 0x0020, 0x0021, 0x0022, 0x0023,
+	  0x0024, 0x0025, 0x0026, 0x0027 }, /* teutates */
+};
+/* fan sensor source */
+static const u16 FTSTEUTATES_REG_FAN_source[1][8] = {
+	{ 0x0030, 0x0031, 0x0032, 0x0033,
+	  0x0034, 0x0035, 0x0036, 0x0037 }, /* teutates */
+};
+/* fan control */
+static const u16 FTSTEUTATES_REG_FAN_control[1][8] = {
+	{ 0x4881, 0x4981, 0x4A81, 0x4B81,
+	  0x4C81, 0x4D81, 0x4E81, 0x4F81 }, /* teutates */
+};
+
+static const int FTSTEUTATES_NO_TEMP_SENSORS[1] = { 16 };
+/* input temprature */
+static const u16 FTSTEUTATES_REG_TEMP_input[1][16] = {
+	{ 0x0040, 0x0041, 0x0042, 0x0043, 0x0044,
+	  0x0045, 0x0046, 0x0047, 0x0048, 0x0049,
+	  0x004A, 0x004B, 0x004C, 0x004D, 0x004E,
+	  0x004F }, /* teutates */
+};
+/* control temprature */
+static const u16 FTSTEUTATES_REG_TEMP_control[1][16] = {
+	{ 0x0681, 0x0781, 0x0881, 0x0981, 0x0A81,
+	  0x0B81, 0x0C81, 0x0D81, 0x0E81, 0x0F81,
+	  0x1081, 0x1181, 0x1281, 0x1381, 0x1481,
+	  0x1581 }, /* teutates */
+};
+
+static const int FTSTEUTATES_NO_VOLT_SENSORS[1] = { 4 };
+/* voltage in */
+static const u16 FTSTEUTATES_REG_VOLT[1][4] = {
+	{ 0x0018, 0x0019, 0x001A, 0x001B }, /* teutates */
+};
+
+static struct ftsteutates_data *ftsteutates_update_device(struct device *dev);
+static int ftsteutates_remove(struct i2c_client *client);
+
+/*****************************************************************************/
+/* I2C Helper functions							     */
+/*****************************************************************************/
+int ftsteutates_read_byte(struct i2c_client *client, unsigned short reg)
+{
+	int ret = -1;
+	unsigned char page = (reg & 0xFF00)>>8;
+
+	ret = i2c_smbus_write_byte_data(client, FTSTEUTATES_PAGE_SELECT_REG,
+				page);
+	if (IS_ERR_VALUE(ret))
+		dev_err(&client->dev,
+			"smbus read byte page select failed: 0x%.08x\n", ret);
+
+	ret = i2c_smbus_read_byte_data(client, (unsigned char)(reg & 0xFF));
+	dev_dbg(&client->dev, "read - reg: 0x%.02x: val: 0x%.02x\n", reg, ret);
+
+	if (IS_ERR_VALUE(ret))
+		dev_err(&client->dev,
+			"smbus read byte failed: 0x%.08x\n", ret);
+
+	return ret;
+}
+
+int ftsteutates_write_byte(struct i2c_client *client, unsigned short reg,
+		unsigned char value)
+{
+	int ret = -1;
+	unsigned char page = (reg & 0xFF00)>>8;
+
+	ret = i2c_smbus_write_byte_data(client, FTSTEUTATES_PAGE_SELECT_REG,
+				page);
+	if (IS_ERR_VALUE(ret))
+		dev_err(&client->dev,
+			"smbus write byte page select failed: 0x%.08x\n", ret);
+
+	ret = i2c_smbus_write_byte_data(client, (unsigned char)(reg & 0xFF),
+					value);
+	dev_dbg(&client->dev,
+		"wrote - reg: 0x%.02x: val: 0x%.02x ret: 0x%.02x\n",
+		reg, value, ret);
+
+	if (IS_ERR_VALUE(ret))
+		dev_dbg(&client->dev,
+			"smbus write byte failed: 0x%.08x\n", ret);
+
+	return ret;
+}
+
+/*****************************************************************************/
+/* Watchdog functions							     */
+/*****************************************************************************/
+static int ftsteutates_wdt_set_timeout(struct watchdog_device *wdd,
+					unsigned int timeout_seconds)
+{
+	int ret, resolution = FTSTEUTATES_WATCHDOG_RESOLUTION;
+	struct ftsteutates_data *data;
+
+	if (!wdd)
+	return -EINVAL;
+
+	data = watchdog_get_drvdata(wdd);
+	if (!data)
+		return -EINVAL;
+
+	if (timeout_seconds < resolution ||
+		timeout_seconds > (resolution * 255))
+		return -EINVAL;
+
+	mutex_lock(&data->watchdog_lock);
+	if (!data->client) {
+		ret = -ENODEV;
+		goto leave;
+	}
+
+	wdd->timeout = timeout_seconds;
+
+	/* Write new timeout value */
+	ftsteutates_write_byte(data->client, FTSTEUTATES_WATCHDOG_TIME_PRESET,
+	DIV_ROUND_UP(wdd->timeout, resolution));
+
+	ret = 0;
+leave:
+	mutex_unlock(&data->watchdog_lock);
+	return ret;
+}
+
+static int ftsteutates_wdt_ping(struct watchdog_device *wdd)
+{
+	int ret;
+	struct ftsteutates_data *data;
+
+	if (!wdd)
+		return -EINVAL;
+
+	data = watchdog_get_drvdata(wdd);
+	if (!data)
+		return -EINVAL;
+
+	mutex_lock(&data->watchdog_lock);
+	if (!data->client) {
+		ret = -ENODEV;
+		goto leave;
+	}
+
+	ftsteutates_write_byte(data->client, FTSTEUTATES_WATCHDOG_TIME_PRESET,
+	DIV_ROUND_UP(wdd->timeout, FTSTEUTATES_WATCHDOG_RESOLUTION));
+	ret = 0;
+leave:
+	mutex_unlock(&data->watchdog_lock);
+	return ret;
+}
+
+static int ftsteutates_wdt_start(struct watchdog_device *wdd)
+{
+	if (!wdd)
+		return -EINVAL;
+
+	if (wdd->timeout < FTSTEUTATES_WATCHDOG_RESOLUTION)
+		wdd->timeout = 8 * FTSTEUTATES_WATCHDOG_RESOLUTION;
+
+	return ftsteutates_wdt_set_timeout(wdd, wdd->timeout);
+}
+
+static int ftsteutates_wdt_stop(struct watchdog_device *wdd)
+{
+	int ret;
+	struct ftsteutates_data *data;
+
+	if (!wdd)
+		return -EINVAL;
+
+	data = watchdog_get_drvdata(wdd);
+	if (!data)
+		return -EINVAL;
+
+	mutex_lock(&data->watchdog_lock);
+	if (!data->client) {
+		ret = -ENODEV;
+		goto leave;
+	}
+
+	ftsteutates_write_byte(data->client,
+		FTSTEUTATES_WATCHDOG_TIME_PRESET, 0);
+	ret = 0;
+leave:
+	mutex_unlock(&data->watchdog_lock);
+	return ret;
+}
+
+static const struct watchdog_info ftsteutates_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.identity = "FTS Teutates Hardware Watchdog",
+};
+
+static const struct watchdog_ops ftsteutates_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = ftsteutates_wdt_start,
+	.stop = ftsteutates_wdt_stop,
+	.ping = ftsteutates_wdt_ping,
+	.set_timeout = ftsteutates_wdt_set_timeout,
+};
+
+static struct watchdog_device ftsteutates_wdt = {
+	.info = &ftsteutates_wdt_info,
+	.ops = &ftsteutates_wdt_ops,
+};
+
+/*****************************************************************************/
+/* SysFS handler functions						     */
+/*****************************************************************************/
+#define VOLT_FROM_REG(val, Vref, multi)    (((multi*val*Vref)/256)/100)
+static ssize_t show_in_value(struct device *dev,
+	struct device_attribute *devattr, char *buf)
+{
+	/* got from the systemboard specification */
+	const int multi[4] = { 39, 11, 11, 10 };
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+	unsigned int val = ((multi[index]*data->volt[index]*330)/256);
+
+	return sprintf(buf, "%u\n", val);
+}
+
+#define TEMP_FROM_REG(val)	  (((val) - 0x40) * 1000)
+static ssize_t show_temp_value(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_input[index]));
+}
+
+static ssize_t show_temp_fault(struct device *dev,
+	struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	if (data->temp_input[index] > 0)
+		return sprintf(buf, "0\n");
+	else
+		return sprintf(buf, "1\n");
+}
+
+static ssize_t show_temp_alarm(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%u\n", data->temp_alarm[index]);
+}
+
+static ssize_t
+clear_temp_alarm(struct device *dev, struct device_attribute *devattr,
+		const char *buf, size_t count)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+	unsigned long val;
+	unsigned char reg;
+
+	if (kstrtoul(buf, 10, &val) || val != 0)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+	reg = ftsteutates_read_byte(data->client,
+		FTSTEUTATES_REG_TEMP_control[data->kind][index]);
+	ftsteutates_write_byte(data->client,
+		FTSTEUTATES_REG_TEMP_control[data->kind][index], reg | 0x1);
+	data->valid = 0;
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+#define RPM_FROM_REG(val)	 ((val) * 60)
+static ssize_t show_fan_value(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%u\n", RPM_FROM_REG(data->fan_input[index]));
+}
+
+
+static ssize_t show_fan_fault(struct device *dev,
+	struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%d\n", data->fan_present[index] == 1 ? 0 : 1);
+}
+
+static ssize_t show_fan_source(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	if (data->fan_present[index]) {
+		if (data->fan_source[index] == 0xFF)
+			return sprintf(buf, "none\n");
+		else
+			return sprintf(buf, "%d\n", data->fan_source[index]);
+	} else
+		return sprintf(buf, "-\n");
+}
+
+static ssize_t show_fan_alarm(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%d\n", data->fan_alarm[index]);
+}
+
+static ssize_t
+clear_fan_alarm(struct device *dev, struct device_attribute *devattr,
+		const char *buf, size_t count)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+	unsigned long val;
+	unsigned char reg;
+
+	if (kstrtoul(buf, 10, &val) || val != 0)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+	reg = ftsteutates_read_byte(data->client,
+		FTSTEUTATES_REG_FAN_control[data->kind][index]);
+	ftsteutates_write_byte(data->client,
+		FTSTEUTATES_REG_FAN_control[data->kind][index], reg | 0x1);
+	data->valid = 0;
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+static ssize_t show_cpu_throttling(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%d\n", data->cpu_throttling);
+}
+
+static ssize_t show_overall_uptime(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	struct ftsteutates_data *data = ftsteutates_update_device(dev);
+
+	return sprintf(buf, "%d\n", data->overall_uptime);
+}
+
+/*****************************************************************************/
+/* SysFS structs							     */
+/*****************************************************************************/
+SENSOR_DEVICE_ATTR(cpu_throttling, S_IRUGO, show_cpu_throttling, NULL, 0);
+SENSOR_DEVICE_ATTR(overall_uptime, S_IRUGO, show_overall_uptime, NULL, 0);
+
+static struct sensor_device_attribute ftsteutates_vin_attr[] = {
+	SENSOR_ATTR(in0_input, S_IRUGO, show_in_value, NULL, 0),
+	SENSOR_ATTR(in1_input, S_IRUGO, show_in_value, NULL, 1),
+	SENSOR_ATTR(in2_input, S_IRUGO, show_in_value, NULL, 2),
+	SENSOR_ATTR(in3_input, S_IRUGO, show_in_value, NULL, 3),
+};
+
+static struct sensor_device_attribute ftsteutates_temp_attr[] = {
+	SENSOR_ATTR(temp1_input, S_IRUGO, show_temp_value, NULL,  0),
+	SENSOR_ATTR(temp2_input, S_IRUGO, show_temp_value, NULL,  1),
+	SENSOR_ATTR(temp3_input, S_IRUGO, show_temp_value, NULL,  2),
+	SENSOR_ATTR(temp4_input, S_IRUGO, show_temp_value, NULL,  3),
+	SENSOR_ATTR(temp5_input, S_IRUGO, show_temp_value, NULL,  4),
+	SENSOR_ATTR(temp6_input, S_IRUGO, show_temp_value, NULL,  5),
+	SENSOR_ATTR(temp7_input, S_IRUGO, show_temp_value, NULL,  6),
+	SENSOR_ATTR(temp8_input, S_IRUGO, show_temp_value, NULL,  7),
+	SENSOR_ATTR(temp9_input, S_IRUGO, show_temp_value, NULL,  8),
+	SENSOR_ATTR(temp10_input, S_IRUGO, show_temp_value, NULL,  9),
+	SENSOR_ATTR(temp11_input, S_IRUGO, show_temp_value, NULL, 10),
+	SENSOR_ATTR(temp12_input, S_IRUGO, show_temp_value, NULL, 11),
+	SENSOR_ATTR(temp13_input, S_IRUGO, show_temp_value, NULL, 12),
+	SENSOR_ATTR(temp14_input, S_IRUGO, show_temp_value, NULL, 13),
+	SENSOR_ATTR(temp15_input, S_IRUGO, show_temp_value, NULL, 14),
+	SENSOR_ATTR(temp16_input, S_IRUGO, show_temp_value, NULL, 15),
+
+	SENSOR_ATTR(temp1_fault, S_IRUGO, show_temp_fault, NULL,  0),
+	SENSOR_ATTR(temp2_fault, S_IRUGO, show_temp_fault, NULL,  1),
+	SENSOR_ATTR(temp3_fault, S_IRUGO, show_temp_fault, NULL,  2),
+	SENSOR_ATTR(temp4_fault, S_IRUGO, show_temp_fault, NULL,  3),
+	SENSOR_ATTR(temp5_fault, S_IRUGO, show_temp_fault, NULL,  4),
+	SENSOR_ATTR(temp6_fault, S_IRUGO, show_temp_fault, NULL,  5),
+	SENSOR_ATTR(temp7_fault, S_IRUGO, show_temp_fault, NULL,  6),
+	SENSOR_ATTR(temp8_fault, S_IRUGO, show_temp_fault, NULL,  7),
+	SENSOR_ATTR(temp9_fault, S_IRUGO, show_temp_fault, NULL,  8),
+	SENSOR_ATTR(temp10_fault, S_IRUGO, show_temp_fault, NULL,  9),
+	SENSOR_ATTR(temp11_fault, S_IRUGO, show_temp_fault, NULL, 10),
+	SENSOR_ATTR(temp12_fault, S_IRUGO, show_temp_fault, NULL, 11),
+	SENSOR_ATTR(temp13_fault, S_IRUGO, show_temp_fault, NULL, 12),
+	SENSOR_ATTR(temp14_fault, S_IRUGO, show_temp_fault, NULL, 13),
+	SENSOR_ATTR(temp15_fault, S_IRUGO, show_temp_fault, NULL, 14),
+	SENSOR_ATTR(temp16_fault, S_IRUGO, show_temp_fault, NULL, 15),
+
+	SENSOR_ATTR(temp1_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 0),
+	SENSOR_ATTR(temp2_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 1),
+	SENSOR_ATTR(temp3_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 2),
+	SENSOR_ATTR(temp4_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 3),
+	SENSOR_ATTR(temp5_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 4),
+	SENSOR_ATTR(temp6_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 5),
+	SENSOR_ATTR(temp7_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 6),
+	SENSOR_ATTR(temp8_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 7),
+	SENSOR_ATTR(temp9_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 8),
+	SENSOR_ATTR(temp10_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 9),
+	SENSOR_ATTR(temp11_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 10),
+	SENSOR_ATTR(temp12_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 11),
+	SENSOR_ATTR(temp13_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 12),
+	SENSOR_ATTR(temp14_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 13),
+	SENSOR_ATTR(temp15_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 14),
+	SENSOR_ATTR(temp16_alarm, S_IRUGO | S_IWUSR,
+			show_temp_alarm, clear_temp_alarm, 15),
+};
+
+static struct sensor_device_attribute ftsteutates_fan_attr[] = {
+	SENSOR_ATTR(fan1_input, S_IRUGO, show_fan_value,  NULL, 0),
+	SENSOR_ATTR(fan2_input, S_IRUGO, show_fan_value,  NULL, 1),
+	SENSOR_ATTR(fan3_input, S_IRUGO, show_fan_value,  NULL, 2),
+	SENSOR_ATTR(fan4_input, S_IRUGO, show_fan_value,  NULL, 3),
+	SENSOR_ATTR(fan5_input, S_IRUGO, show_fan_value,  NULL, 4),
+	SENSOR_ATTR(fan6_input, S_IRUGO, show_fan_value,  NULL, 5),
+	SENSOR_ATTR(fan7_input, S_IRUGO, show_fan_value,  NULL, 6),
+	SENSOR_ATTR(fan8_input, S_IRUGO, show_fan_value,  NULL, 7),
+
+	SENSOR_ATTR(fan1_fault, S_IRUGO, show_fan_fault,  NULL, 0),
+	SENSOR_ATTR(fan2_fault, S_IRUGO, show_fan_fault,  NULL, 1),
+	SENSOR_ATTR(fan3_fault, S_IRUGO, show_fan_fault,  NULL, 2),
+	SENSOR_ATTR(fan4_fault, S_IRUGO, show_fan_fault,  NULL, 3),
+	SENSOR_ATTR(fan5_fault, S_IRUGO, show_fan_fault,  NULL, 4),
+	SENSOR_ATTR(fan6_fault, S_IRUGO, show_fan_fault,  NULL, 5),
+	SENSOR_ATTR(fan7_fault, S_IRUGO, show_fan_fault,  NULL, 6),
+	SENSOR_ATTR(fan8_fault, S_IRUGO, show_fan_fault,  NULL, 7),
+
+	SENSOR_ATTR(fan1_source, S_IRUGO, show_fan_source, NULL, 0),
+	SENSOR_ATTR(fan2_source, S_IRUGO, show_fan_source, NULL, 1),
+	SENSOR_ATTR(fan3_source, S_IRUGO, show_fan_source, NULL, 2),
+	SENSOR_ATTR(fan4_source, S_IRUGO, show_fan_source, NULL, 3),
+	SENSOR_ATTR(fan5_source, S_IRUGO, show_fan_source, NULL, 4),
+	SENSOR_ATTR(fan6_source, S_IRUGO, show_fan_source, NULL, 5),
+	SENSOR_ATTR(fan7_source, S_IRUGO, show_fan_source, NULL, 6),
+	SENSOR_ATTR(fan8_source, S_IRUGO, show_fan_source, NULL, 7),
+
+	SENSOR_ATTR(fan1_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 0),
+	SENSOR_ATTR(fan2_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 1),
+	SENSOR_ATTR(fan3_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 2),
+	SENSOR_ATTR(fan4_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 3),
+	SENSOR_ATTR(fan5_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 4),
+	SENSOR_ATTR(fan6_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 5),
+	SENSOR_ATTR(fan7_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 6),
+	SENSOR_ATTR(fan8_alarm, S_IRUGO | S_IWUSR,
+			show_fan_alarm, clear_fan_alarm, 7),
+};
+
+/*****************************************************************************/
+/* Module initialization / remove functions				     */
+/*****************************************************************************/
+
+static int ftsteutates_detect(struct i2c_client *client,
+		struct i2c_board_info *info)
+{
+	int val = ftsteutates_read_byte(client, FTSTEUTATES_DEVICE_ID_REG);
+
+	/* Baseboard Management Controller */
+	if ((val & 0xF0) == 0x10) {
+		switch (val & 0x0F) {
+		case 0x01:
+			strlcpy(info->type, ftsteutates_id[teutates].name,
+			I2C_NAME_SIZE);
+			info->flags = 0;
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
+static int ftsteutates_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct ftsteutates_data *data;
+	const char * const names[1] = { "Teutates" };
+	int i = 0, err;
+
+	data = kzalloc(sizeof(struct ftsteutates_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, data);
+	mutex_init(&data->update_lock);
+	mutex_init(&data->watchdog_lock);
+	data->client = client;
+	data->kind = id->driver_data;
+	data->valid = 0;
+	data->last_updated = 0;
+
+	data->revision = ftsteutates_read_byte(client,
+		FTSTEUTATES_DEVICE_REVISION_REG);
+
+	err = device_create_file(&client->dev,
+		&sensor_dev_attr_overall_uptime.dev_attr);
+	if (err) {
+		dev_err(&client->dev,
+		"could not create device file for uptime\n");
+		goto exit_detach;
+	}
+	err = device_create_file(&client->dev,
+		&sensor_dev_attr_cpu_throttling.dev_attr);
+	if (err) {
+		dev_err(&client->dev,
+		"could not create device file for cpu throttling\n");
+		goto exit_detach;
+	}
+
+	for (i = 0; i < (FTSTEUTATES_NO_FAN_SENSORS[data->kind] * 4); i++) {
+		err = device_create_file(&client->dev,
+			&ftsteutates_fan_attr[i].dev_attr);
+		if (err) {
+			dev_err(&client->dev,
+			"could not create device file for fan %d\n", i);
+			goto exit_detach;
+		}
+	}
+	for (i = 0; i < (FTSTEUTATES_NO_TEMP_SENSORS[data->kind] * 3); i++) {
+		err = device_create_file(&client->dev,
+			&ftsteutates_temp_attr[i].dev_attr);
+		if (err) {
+			dev_err(&client->dev,
+			"could not create device file for temp %d\n", i);
+			goto exit_detach;
+		}
+	}
+	for (i = 0; i < (FTSTEUTATES_NO_VOLT_SENSORS[data->kind]); i++) {
+		err = device_create_file(&client->dev,
+			&ftsteutates_vin_attr[i].dev_attr);
+		if (err) {
+			dev_err(&client->dev,
+			"could not create device file for vin %d\n", i);
+			goto exit_detach;
+		}
+	}
+
+	data->hwmon_dev = hwmon_device_register(&client->dev);
+	if (IS_ERR(data->hwmon_dev)) {
+		err = PTR_ERR(data->hwmon_dev);
+		data->hwmon_dev = NULL;
+		dev_err(&client->dev, "could not register hwmon device\n");
+		goto exit_detach;
+	}
+
+	/* Register our watchdog part */
+	ftsteutates_wdt.parent = &client->dev;
+	ftsteutates_wdt.timeout = ftsteutates_read_byte(client,
+	FTSTEUTATES_WATCHDOG_TIME_PRESET) * FTSTEUTATES_WATCHDOG_RESOLUTION;
+	ftsteutates_wdt.min_timeout = FTSTEUTATES_WATCHDOG_RESOLUTION * 1;
+	ftsteutates_wdt.max_timeout = FTSTEUTATES_WATCHDOG_RESOLUTION * 0xFF;
+	watchdog_set_drvdata(&ftsteutates_wdt, data);
+	err = watchdog_register_device(&ftsteutates_wdt);
+	if (err) {
+		dev_err(&client->dev,
+			"Registering watchdog device failed: %d\n", err);
+		goto exit_detach;
+	}
+
+	dev_info(&client->dev, "Detected FTS %s chip, revision: %d.%d\n",
+	names[data->kind], (int)(data->revision & 0xF0)>>4,
+	(int)data->revision & 0x0F);
+	return 0;
+
+exit_detach:
+	ftsteutates_remove(client); /* will also free data for us */
+	return err;
+}
+
+static int ftsteutates_remove(struct i2c_client *client)
+{
+	struct ftsteutates_data *data = i2c_get_clientdata(client);
+	int i;
+
+	device_remove_file(&client->dev,
+			&sensor_dev_attr_cpu_throttling.dev_attr);
+	device_remove_file(&client->dev,
+			&sensor_dev_attr_overall_uptime.dev_attr);
+	for (i = 0; i < (FTSTEUTATES_NO_FAN_SENSORS[data->kind] * 4); i++)
+		device_remove_file(&client->dev,
+			&ftsteutates_fan_attr[i].dev_attr);
+	for (i = 0; i < (FTSTEUTATES_NO_TEMP_SENSORS[data->kind] * 3); i++)
+		device_remove_file(&client->dev,
+			&ftsteutates_temp_attr[i].dev_attr);
+	for (i = 0; i < (FTSTEUTATES_NO_VOLT_SENSORS[data->kind]); i++)
+		device_remove_file(&client->dev,
+			&ftsteutates_vin_attr[i].dev_attr);
+
+	watchdog_unregister_device(&ftsteutates_wdt);
+	ftsteutates_wdt_stop(&ftsteutates_wdt);
+
+	if (data->hwmon_dev)
+		hwmon_device_unregister(data->hwmon_dev);
+
+	data->client = NULL;
+	kfree(data);
+	return 0;
+}
+
+/*****************************************************************************/
+/* Data Updater Helper function						     */
+/*****************************************************************************/
+static struct ftsteutates_data *ftsteutates_update_device(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ftsteutates_data *data = i2c_get_clientdata(client);
+	int i;
+	int present, alarm, status;
+
+	mutex_lock(&data->update_lock);
+	if (!time_after(jiffies, data->last_updated + 2 * HZ) && data->valid)
+		goto exit;
+
+	status = ftsteutates_read_byte(client, FTSTEUTATES_DEVICE_STATUS_REG);
+	data->valid = (status & 0x02) != 0 ? 1 : 0;
+	if (!data->valid)
+		goto exit;
+
+	data->cpu_throttling = (ftsteutates_read_byte(client,
+		FTSTEUTATES_EVENT_STATUS_REG) & 0x8) ? 1 : 0;
+	data->overall_uptime = ((u32)ftsteutates_read_byte(client,
+		FTSTEUTATES_POWER_ON_TIME_COUNTER_C)) << 16;
+	data->overall_uptime |= ((u32)ftsteutates_read_byte(client,
+		FTSTEUTATES_POWER_ON_TIME_COUNTER_B)) << 8;
+	data->overall_uptime |= ((u32)ftsteutates_read_byte(client,
+		FTSTEUTATES_POWER_ON_TIME_COUNTER_A));
+
+	present = ftsteutates_read_byte(client, FTSTEUTATES_FAN_PRESENT_REG);
+	alarm = ftsteutates_read_byte(client, FTSTEUTATES_FAN_EVENT_REG);
+	for (i = 0; i < FTSTEUTATES_NO_FAN_SENSORS[data->kind]; i++) {
+		data->fan_present[i] = (present & (1<<i)) != 0 ? 1 : 0;
+		if (data->fan_present[i]) {
+			data->fan_alarm[i] = (alarm & (1<<i)) != 0 ? 1 : 0;
+			data->fan_input[i] = ftsteutates_read_byte(client,
+				FTSTEUTATES_REG_FAN_input[data->kind][i]);
+			data->fan_source[i] = ftsteutates_read_byte(client,
+				FTSTEUTATES_REG_FAN_source[data->kind][i]);
+		} else {
+			data->fan_alarm[i] = 0;
+			data->fan_input[i] = 0;
+			data->fan_source[i] = 0;
+		}
+	}
+
+	alarm = ftsteutates_read_byte(client, FTSTEUTATES_SENSOR_EVENT_REG);
+	for (i = 0; i < FTSTEUTATES_NO_TEMP_SENSORS[data->kind]; i++) {
+		data->temp_input[i] = ftsteutates_read_byte(client,
+			FTSTEUTATES_REG_TEMP_input[data->kind][i]);
+		data->temp_alarm[i] = (alarm & (1<<i)) != 0 ? 1 : 0;
+	}
+
+	for (i = 0; i < FTSTEUTATES_NO_VOLT_SENSORS[data->kind]; i++) {
+		data->volt[i] = ftsteutates_read_byte(client,
+			FTSTEUTATES_REG_VOLT[data->kind][i]);
+	}
+	data->last_updated = jiffies;
+
+exit:
+	mutex_unlock(&data->update_lock);
+	return data;
+}
+
+/*****************************************************************************/
+/* Module Details							     */
+/*****************************************************************************/
+static struct i2c_driver ftsteutates_driver = {
+	.class	  = I2C_CLASS_HWMON,
+	.driver = {
+		.name	 = "ftsteutates",
+	},
+	.id_table	= ftsteutates_id,
+	.probe	  = ftsteutates_probe,
+	.remove	   = ftsteutates_remove,
+	.detect	   = ftsteutates_detect,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(ftsteutates_driver);
+
+MODULE_AUTHOR("Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com");
+MODULE_DESCRIPTION("FTS Teutates driver");
+MODULE_LICENSE("GPL");
-- 
2.8.1

