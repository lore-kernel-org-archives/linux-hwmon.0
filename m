Return-Path: <SRS0=9YG5=RX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78621C4360F
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 14:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 484CC2184E
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 14:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfCTO7T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Mar 2019 10:59:19 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:51060 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728304AbfCTO7T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Mar 2019 10:59:19 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2KEcwmf010506;
        Wed, 20 Mar 2019 09:58:22 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2ratwujc4y-1;
        Wed, 20 Mar 2019 09:58:21 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 139D5611C8B5;
        Wed, 20 Mar 2019 09:58:21 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Mar 2019
 14:58:20 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x2KEwIMQ023819; Wed,
 20 Mar 2019 14:58:20 GMT
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 3/3] hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver
Date:   Wed, 20 Mar 2019 14:58:18 +0000
Message-ID: <20190320145818.30644-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903200113
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform.

This driver adds support for the hardware monitoring features of
the Lochnagar 2 to the hwmon API. Monitoring is provided for
the board voltages, currents and temperature supported by the
board controller chip.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/hwmon/lochnagar   |  56 ++++++++
 MAINTAINERS                     |   3 +
 drivers/hwmon/Kconfig           |  10 ++
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/lochnagar-hwmon.c | 293 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 Documentation/hwmon/lochnagar
 create mode 100644 drivers/hwmon/lochnagar-hwmon.c

diff --git a/Documentation/hwmon/lochnagar b/Documentation/hwmon/lochnagar
new file mode 100644
index 0000000000000..60e869a8c564e
--- /dev/null
+++ b/Documentation/hwmon/lochnagar
@@ -0,0 +1,56 @@
+Kernel Driver Lochnagar
+========================
+
+Supported systems:
+  * Cirrus Logic : Lochnagar 2
+
+Author: Lucas A. Tanure Alves
+
+Description
+-----------
+
+Lochnagar 2 features built-in Current Monitor circuitry that allows for the
+measurement of both voltage and current on up to eight of the supply voltage
+rails provided to the minicards. The Current Monitor does not require any
+hardware modifications or external circuitry to operate.
+
+The current and voltage measurements are obtained through the standard register
+map interface to the Lochnagar board controller, and can therefore be monitored
+by software.
+
+Sysfs attributes
+----------------
+
+temp1_input   The Lochnagar board temperature.
+in0_input     Measured voltage for DBVDD1 (nanoVolts)
+in0_label     "DBVDD1"
+curr1_input   Measured current for DBVDD1 (nanoAmps)
+curr1_label   "DBVDD1"
+in1_input     Measured voltage for 1V8 DSP (nanoVolts)
+in1_label     "1V8 DSP"
+curr2_input   Measured current for 1V8 DSP (nanoAmps)
+curr2_label   "1V8 DSP"
+in2_input     Measured voltage for 1V8 CDC (nanoVolts)
+in2_label     "1V8 CDC"
+curr3_input   Measured current for 1V8 CDC (nanoAmps)
+curr3_label   "1V8 CDC"
+in3_input     Measured voltage for VDDCORE DSP (nanoVolts)
+in3_label     "VDDCORE DSP"
+curr4_input   Measured current for VDDCORE DSP (nanoAmps)
+curr4_label   "VDDCORE DSP"
+in4_input     Measured voltage for AVDD 1V8 (nanoVolts)
+in4_label     "AVDD 1V8"
+curr5_input   Measured current for AVDD 1V8 (nanoAmps)
+curr5_label   "AVDD 1V8"
+curr6_input   Measured current for SYSVDD (nanoAmps)
+curr6_label   "SYSVDD"
+in6_input     Measured voltage for VDDCORE CDC (nanoVolts)
+in6_label     "VDDCORE CDC"
+curr7_input   Measured current for VDDCORE CDC (nanoAmps)
+curr7_label   "VDDCORE CDC"
+in7_input     Measured voltage for MICVDD (nanoVolts)
+in7_label     "MICVDD"
+curr8_input   Measured current for MICVDD (nanoAmps)
+curr8_label   "MICVDD"
+
+Note: It is not possible to measure voltage on the SYSVDD rail.
diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b5480..4cd3c281d8b56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3796,6 +3796,7 @@ M:	Richard Fitzgerald <rf@opensource.cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
 F:	drivers/clk/clk-lochnagar.c
+F:	drivers/hwmon/lochnagar-hwmon.c
 F:	drivers/mfd/lochnagar-i2c.c
 F:	drivers/pinctrl/cirrus/pinctrl-lochnagar.c
 F:	drivers/regulator/lochnagar-regulator.c
@@ -3804,8 +3805,10 @@ F:	include/dt-bindings/pinctrl/lochnagar.h
 F:	include/linux/mfd/lochnagar*
 F:	Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
 F:	Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
+F:	Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
 F:	Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
 F:	Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
+F:	Documentation/hwmon/lochnagar
 
 CISCO FCOE HBA DRIVER
 M:	Satish Kharat <satishkh@cisco.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d0f1dfe2bcbbd..dedd5febd3aa6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -705,6 +705,16 @@ config SENSORS_LINEAGE
 	  This driver can also be built as a module. If so, the module
 	  will be called lineage-pem.
 
+config SENSORS_LOCHNAGAR
+	tristate "Lochnagar Hardware Monitor"
+	depends on MFD_LOCHNAGAR
+	help
+	  If you say yes here you get support for Lochnagar 2 temperature,
+	  voltage and current sensors abilities.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called lochnagar-hwmon.
+
 config SENSORS_LTC2945
 	tristate "Linear Technology LTC2945"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index f5c7b442e69e5..8db472ea04f00 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_SENSORS_JZ4740)	+= jz4740-hwmon.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
 obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
+obj-$(CONFIG_SENSORS_LOCHNAGAR)	+= lochnagar-hwmon.o
 obj-$(CONFIG_SENSORS_LM63)	+= lm63.o
 obj-$(CONFIG_SENSORS_LM70)	+= lm70.o
 obj-$(CONFIG_SENSORS_LM73)	+= lm73.o
diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
new file mode 100644
index 0000000000000..1f6b82bb9205d
--- /dev/null
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Lochnagar hardware monitoring features
+ *
+ * Copyright (c) 2016-2019 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ *
+ * Author: Lucas Tanure <tanureal@opensource.cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+#include <linux/mfd/lochnagar.h>
+#include <linux/mfd/lochnagar2_regs.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/i2c.h>
+#include <asm/div64.h>
+
+struct lochnagar_hwmon {
+	struct lochnagar *lochnagar;
+
+	/* Lock to ensure only a single sensor is read at a time */
+	struct mutex sensor_lock;
+	struct device *hwmon_dev;
+};
+
+enum lochnagar_measure_mode {
+	LN2_CURRENT = 0,
+	LN2_VOLTAGE,
+	LN2_TEMPERATURE,
+};
+
+static const char * const lochnagar_chan_names[] = {
+	"DBVDD1",
+	"1V8 DSP",
+	"1V8 CDC",
+	"VDDCORE DSP",
+	"AVDD 1V8",
+	"SYSVDD",
+	"VDDCORE CDC",
+	"MICVDD",
+};
+
+static u64 float_to_int(u32 data, u32 precision)
+{
+	s64 man = data & 0x007FFFFF;
+	s32 exp = ((data & 0x7F800000) >> 23) - 127 - 23;
+	bool negative = data & 0x80000000;
+
+	man = (man + (1 << 23)) * precision;
+
+	if (exp > 0)
+		man <<= exp;
+	else if (exp < 0)
+		man >>= -exp;
+
+	return negative ? -man : man;
+}
+
+static int do_measurement(struct regmap *regmap, int chan,
+			  enum lochnagar_measure_mode mode, int nsamples)
+{
+	unsigned int val;
+	int ret;
+
+	chan = 1 << (chan + LOCHNAGAR2_IMON_MEASURED_CHANNELS_SHIFT);
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL1,
+			   LOCHNAGAR2_IMON_ENA_MASK | chan | mode);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL2, nsamples);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3,
+			   LOCHNAGAR2_IMON_CONFIGURE_MASK);
+	if (ret < 0)
+		return ret;
+
+	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
+					val & LOCHNAGAR2_IMON_DONE_MASK,
+					1000, 10000);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3,
+			   LOCHNAGAR2_IMON_MEASURE_MASK);
+	if (ret < 0)
+		return ret;
+
+	msleep(nsamples);
+
+	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
+					val & LOCHNAGAR2_IMON_DONE_MASK,
+					5000, 2000000);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int request_data(struct regmap *regmap, int chan, u32 *data)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL4,
+			   LOCHNAGAR2_IMON_DATA_REQ_MASK |
+			   chan << LOCHNAGAR2_IMON_CH_SEL_SHIFT);
+	if (ret < 0)
+		return ret;
+
+	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL4, val,
+					val & LOCHNAGAR2_IMON_DATA_RDY_MASK,
+					1000, 10000);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(regmap, LOCHNAGAR2_IMON_DATA1, &val);
+	if (ret < 0)
+		return ret;
+
+	*data = val << 16;
+
+	ret = regmap_read(regmap, LOCHNAGAR2_IMON_DATA2, &val);
+	if (ret < 0)
+		return ret;
+
+	*data |= val;
+
+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL4, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int read_sensor(struct device *dev, int chan,
+		       enum lochnagar_measure_mode mode, int nsamples,
+		       unsigned int precision, long *val)
+{
+	struct lochnagar_hwmon *priv = dev_get_drvdata(dev);
+	struct regmap *regmap = priv->lochnagar->regmap;
+	u32 data;
+	int ret;
+
+	mutex_lock(&priv->sensor_lock);
+
+	ret = do_measurement(regmap, chan, mode, nsamples);
+	if (ret < 0) {
+		dev_err(dev, "Failed to perform measurement: %d\n", ret);
+		goto error;
+	}
+
+	ret = request_data(regmap, chan, &data);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read measurement: %d\n", ret);
+		goto error;
+	}
+
+	*val = float_to_int(data, precision);
+
+error:
+	mutex_unlock(&priv->sensor_lock);
+
+	return ret;
+}
+
+static umode_t lochnagar_is_visible(const void *drvdata,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int chan)
+{
+	if (type == hwmon_in && !strcmp("SYSVDD", lochnagar_chan_names[chan]))
+		return 0;
+
+	return 0444;
+}
+
+static int lochnagar_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int chan, long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		return read_sensor(dev, chan, LN2_VOLTAGE, 1, 1000000000, val);
+	case hwmon_curr:
+		return read_sensor(dev, chan, LN2_CURRENT, 96, 1000000000, val);
+	case hwmon_temp:
+		return read_sensor(dev, chan, LN2_TEMPERATURE, 1023, 1000, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int lochnagar_read_string(struct device *dev,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int chan, const char **str)
+{
+	switch (type) {
+	case hwmon_in:
+	case hwmon_curr:
+		*str = lochnagar_chan_names[chan];
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops lochnagar_ops = {
+	.is_visible = lochnagar_is_visible,
+	.read = lochnagar_read,
+	.read_string = lochnagar_read_string,
+};
+
+static const struct hwmon_channel_info *lochnagar_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(in,   HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL,
+				 HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL,
+				 HWMON_C_INPUT | HWMON_C_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info lochnagar_chip_info = {
+	.ops = &lochnagar_ops,
+	.info = lochnagar_info,
+};
+
+static const struct of_device_id lochnagar_of_match[] = {
+	{ .compatible = "cirrus,lochnagar2-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lochnagar_of_match);
+
+static int lochnagar_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lochnagar *lochnagar = dev_get_drvdata(dev->parent);
+	struct lochnagar_hwmon *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->sensor_lock);
+	priv->lochnagar = lochnagar;
+
+	priv->hwmon_dev =
+		devm_hwmon_device_register_with_info(dev, "Lochnagar", priv,
+						     &lochnagar_chip_info,
+						     NULL);
+
+	return PTR_ERR_OR_ZERO(priv->hwmon_dev);
+}
+
+static struct platform_driver lochnagar_hwmon_driver = {
+	.driver = {
+		.name = "lochnagar-hwmon",
+		.of_match_table = lochnagar_of_match,
+	},
+	.probe = lochnagar_hwmon_probe,
+};
+module_platform_driver(lochnagar_hwmon_driver);
+
+MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
+MODULE_DESCRIPTION("Lochnagar hardware monitoring features");
+MODULE_LICENSE("GPL");
-- 
2.11.0

