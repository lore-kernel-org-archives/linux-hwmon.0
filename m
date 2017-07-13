Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:36701 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751295AbdGMVHE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jul 2017 17:07:04 -0400
Received: by mail-pf0-f181.google.com with SMTP id q86so35047860pfl.3
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Jul 2017 14:07:04 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 3/3] drivers: w1: add hwmon temp support for w1_therm
Date: Thu, 13 Jul 2017 14:06:49 -0700
Message-Id: <20170713210649.16188-4-jaghu@google.com>
In-Reply-To: <20170713210649.16188-1-jaghu@google.com>
References: <20170713210649.16188-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This change adds hwmon temp support for w1_therm.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
---
v2
- make changes to support hwmon_device_register_with_info mentioned by Guenter.

v3
- used IS_REACHABLE()
- rearranged the code to not require forward declarations
- used family_data
- incremented the reference count with the bus mutex locked
- corrected indentation
- removed dev_warn message
- simplified returning mode
- removed write function

 drivers/w1/slaves/w1_therm.c | 91 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 64e6a8f38410..b7d13220dd8f 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -29,6 +29,7 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/hwmon.h>

 #include "../w1.h"
 #include "../w1_int.h"
@@ -118,19 +119,77 @@ static struct attribute *w1_ds28ea00_attrs[] = {
 	&dev_attr_w1_seq.attr,
 	NULL,
 };
+
 ATTRIBUTE_GROUPS(w1_therm);
 ATTRIBUTE_GROUPS(w1_ds28ea00);

+#if IS_REACHABLE(CONFIG_HWMON)
+static int w1_read_temp(struct device *dev, u32 attr, int channel,
+			long *val);
+
+static umode_t w1_is_visible(const void *_data, enum hwmon_sensor_types type,
+			     u32 attr, int channel)
+{
+	return attr == hwmon_temp_input ? 0444 : 0;
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
+};
+
+static const struct hwmon_chip_info w1_chip_info = {
+	.ops = &w1_hwmon_ops,
+	.info = w1_info,
+};
+#endif
+
 static struct w1_family_ops w1_therm_fops = {
 	.add_slave	= w1_therm_add_slave,
 	.remove_slave	= w1_therm_remove_slave,
 	.groups		= w1_therm_groups,
+#if IS_REACHABLE(CONFIG_HWMON)
+	.chip_info	= &w1_chip_info,
+#else
+	.chip_info	= NULL,
+#endif
 };

 static struct w1_family_ops w1_ds28ea00_fops = {
 	.add_slave	= w1_therm_add_slave,
 	.remove_slave	= w1_therm_remove_slave,
 	.groups		= w1_ds28ea00_groups,
+#if IS_REACHABLE(CONFIG_HWMON)
+	.chip_info	= &w1_chip_info,
+#else
+	.chip_info	= NULL,
+#endif
 };

 static struct w1_family w1_therm_family_DS18S20 = {
@@ -559,6 +618,38 @@ static ssize_t w1_slave_show(struct device *device,
 	return ret;
 }

+#if IS_REACHABLE(CONFIG_HWMON)
+static int w1_read_temp(struct device *device, u32 attr, int channel,
+			long *val)
+{
+	struct w1_slave *sl = dev_get_drvdata(device);
+	struct therm_info info;
+	u8 fid = sl->family->fid;
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = read_therm(device, sl, &info);
+		if (ret)
+			return ret;
+
+		if (!info.verdict) {
+			ret = -EIO;
+			return ret;
+		}
+
+		*val = w1_convert_temp(info.rom, fid);
+		ret = 0;
+		break;
+	default:
+			ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+#endif
+
 #define W1_42_CHAIN	0x99
 #define W1_42_CHAIN_OFF	0x3C
 #define W1_42_CHAIN_OFF_INV	0xC3
--
2.13.2.932.g7449e964c-goog

