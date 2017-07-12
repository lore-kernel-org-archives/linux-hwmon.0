Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f49.google.com ([74.125.83.49]:35198 "EHLO
        mail-pg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754215AbdGLVld (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2017 17:41:33 -0400
Received: by mail-pg0-f49.google.com with SMTP id j186so19061296pge.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2017 14:41:27 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 3/3] drivers: w1: add hwmon temp support for w1_therm
Date: Wed, 12 Jul 2017 14:41:18 -0700
Message-Id: <20170712214118.4306-4-jaghu@google.com>
In-Reply-To: <20170712214118.4306-1-jaghu@google.com>
References: <20170712214118.4306-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This change adds hwmon temp support for w1_therm.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
---
v2
- make changes to support hwmon_device_register_with_info mentioned by Guenter.

 drivers/w1/slaves/w1_therm.c | 117 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 88f4cc8c3908..147f9dfa13de 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -29,6 +29,7 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/hwmon.h>

 #include "../w1.h"
 #include "../w1_int.h"
@@ -118,19 +119,61 @@ static struct attribute *w1_ds28ea00_attrs[] = {
 	&dev_attr_w1_seq.attr,
 	NULL,
 };
+
 ATTRIBUTE_GROUPS(w1_therm);
 ATTRIBUTE_GROUPS(w1_ds28ea00);

+static umode_t w1_is_visible(const void *_data,
+			     enum hwmon_sensor_types type,
+			     u32 attr, int channel);
+
+static int w1_read_temp(struct device *dev, u32 attr, int channel,
+			long *val);
+
+static int w1_read(struct device *dev, enum hwmon_sensor_types type,
+		   u32 attr, int channel, long *val);
+
+static int w1_write(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long val);
+
+static const u32 w1_temp_config[] = {
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info w1_temp = {
+	.type = hwmon_temp,
+	.config = w1_temp_config,
+};
+
+static const struct hwmon_channel_info *w1_info[] = {
+	&w1_temp,
+	NULL
+};
+
+static const struct hwmon_ops w1_hwmon_ops = {
+	.is_visible = w1_is_visible,
+	.read = w1_read,
+	.write = w1_write,
+};
+
+static const struct hwmon_chip_info w1_chip_info = {
+	.ops = &w1_hwmon_ops,
+	.info = w1_info,
+};
+
 static struct w1_family_ops w1_therm_fops = {
 	.add_slave	= w1_therm_add_slave,
 	.remove_slave	= w1_therm_remove_slave,
 	.groups		= w1_therm_groups,
+	.chip_info	= &w1_chip_info,
 };

 static struct w1_family_ops w1_ds28ea00_fops = {
 	.add_slave	= w1_therm_add_slave,
 	.remove_slave	= w1_therm_remove_slave,
 	.groups		= w1_ds28ea00_groups,
+	.chip_info	= &w1_chip_info,
 };

 static struct w1_family w1_therm_family_DS18S20 = {
@@ -559,6 +602,80 @@ static ssize_t w1_slave_show(struct device *device,
 	return ret;
 }

+static int w1_read_temp(struct device *device, u32 attr, int channel,
+			long *val)
+{
+	struct w1_slave *sl = dev_get_drvdata(device);
+	u8 *family_data = sl->family_data;
+	struct therm_info info;
+	int ret;
+
+	if (!sl->family_data)
+		return -ENODEV;
+
+	/* prevent the slave from going away in sleep */
+	atomic_inc(THERM_REFCNT(family_data));
+
+	switch (attr) {
+	case hwmon_temp_input:
+	ret = read_therm(device, sl, &info);
+	if (ret)
+		goto dec_refcnt;
+
+	if (!info.verdict) {
+		dev_warn(device, "Read failed CRC check\n");
+		ret = -EIO;
+		goto dec_refcnt;
+	}
+
+	*val = w1_convert_temp(info.rom, sl->family->fid);
+	ret = 0;
+	break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+dec_refcnt:
+	atomic_dec(THERM_REFCNT(family_data));
+	return ret;
+}
+
+static umode_t w1_is_visible(const void *_data, enum hwmon_sensor_types type,
+			     u32 attr, int channel)
+{
+	umode_t mode = 0444;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		break;
+	default:
+		mode = 0;
+		break;
+	}
+	return mode;
+}
+
+static int w1_read(struct device *dev, enum hwmon_sensor_types type,
+		   u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_temp:
+		return w1_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int w1_write(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 #define W1_42_CHAIN	0x99
 #define W1_42_CHAIN_OFF	0x3C
 #define W1_42_CHAIN_OFF_INV	0xC3
--
2.13.2.932.g7449e964c-goog

