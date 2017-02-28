Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:34980 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751542AbdCAA46 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Feb 2017 19:56:58 -0500
Received: by mail-pg0-f46.google.com with SMTP id b129so13103414pgc.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Feb 2017 16:55:10 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: Aspeed AST2400/AST2500 ADC
Date: Tue, 28 Feb 2017 12:14:04 -0800
Message-Id: <20170228201404.32125-2-raltherr@google.com>
In-Reply-To: <20170228201404.32125-1-raltherr@google.com>
References: <20170228201404.32125-1-raltherr@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This
driver implements reading the ADC values, enabling channels via device
tree, and optionally providing channel labels via device tree.  Low and
high threshold interrupts are supported by the hardware but not
implemented.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/aspeed_adc.c | 383 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 394 insertions(+)
 create mode 100644 drivers/hwmon/aspeed_adc.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 0649d53f3d16..c99a67b4afe4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -261,6 +261,16 @@ config SENSORS_ASC7621
 	  This driver can also be built as a module.  If so, the module
 	  will be called asc7621.
 
+config SENSORS_ASPEED_ADC
+	tristate "Aspeed AST2400/AST2500 ADC"
+	depends on ARCH_ASPEED
+	help
+	  If you say yes here you get support for the Aspeed AST2400/AST2500
+	  ADC.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called aspeed_adc.
+
 config SENSORS_K8TEMP
 	tristate "AMD Athlon64/FX or Opteron temperature sensor"
 	depends on X86 && PCI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 5509edf6186a..eede049c9d0d 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
+obj-$(CONFIG_SENSORS_ASPEED_ADC) += aspeed_adc.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
diff --git a/drivers/hwmon/aspeed_adc.c b/drivers/hwmon/aspeed_adc.c
new file mode 100644
index 000000000000..098e32315264
--- /dev/null
+++ b/drivers/hwmon/aspeed_adc.c
@@ -0,0 +1,383 @@
+/*
+ * Aspeed AST2400/2500 ADC
+ *
+ * Copyright (C) 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ */
+
+#include <asm/io.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define ASPEED_ADC_NUM_CHANNELS	16
+#define ASPEED_ADC_REF_VOLTAGE	2500 /* millivolts */
+
+#define ASPEED_ADC_REG_ADC00 0x00
+#define ASPEED_ADC_REG_ADC04 0x04
+#define ASPEED_ADC_REG_ADC08 0x08
+#define ASPEED_ADC_REG_ADC0C 0x0C
+#define ASPEED_ADC_REG_ADC10 0x10
+#define ASPEED_ADC_REG_ADC14 0x14
+#define ASPEED_ADC_REG_ADC18 0x18
+#define ASPEED_ADC_REG_ADC1C 0x1C
+#define ASPEED_ADC_REG_ADC20 0x20
+#define ASPEED_ADC_REG_ADC24 0x24
+#define ASPEED_ADC_REG_ADC28 0x28
+#define ASPEED_ADC_REG_ADC2C 0x2C
+
+#define ASPEED_ADC_OPERATION_MODE_POWER_DOWN	(0x0 << 1)
+#define ASPEED_ADC_OPERATION_MODE_STANDBY	(0x1 << 1)
+#define ASPEED_ADC_OPERATION_MODE_NORMAL	(0x7 << 1)
+
+#define ASPEED_ADC_ENGINE_ENABLE	BIT(0)
+
+struct aspeed_adc_data {
+	struct device	*dev;
+	void __iomem	*base;
+	struct clk	*pclk;
+	struct mutex	lock;
+	unsigned long	update_interval_ms;
+	u32		enabled_channel_mask;
+	const char*	channel_labels[ASPEED_ADC_NUM_CHANNELS];
+};
+
+static int aspeed_adc_set_adc_clock_frequency(
+		struct aspeed_adc_data *data,
+		unsigned long desired_update_interval_ms)
+{
+	long pclk_hz = clk_get_rate(data->pclk);
+	long adc_combined_divisor;
+	long adc_pre_divisor;
+	long adc_divisor;
+	long adc_clock_control_reg_val;
+        long num_enabled_channels = hweight32(data->enabled_channel_mask);
+
+	if (desired_update_interval_ms < 1)
+		return -EINVAL;
+
+	/* From the AST2400 datasheet:
+	 *   adc_period_s = pclk_period_s * 2 * (pre_divisor+1) * (divisor+1)
+	 *
+	 *   and
+	 *
+	 *   sample_period_s = 12 * adc_period_s
+	 *
+	 * Substitute pclk_period_s = (1 / pclk_hz)
+	 *
+	 * Solve for (pre-divisor+1) * (divisor+1) as those are settings we need
+	 * to program:
+	 *   (pre-divisor+1) * (divisor+1) = (sample_period_s * pclk_hz) / 24
+	 */
+
+	/* Assume PCLK runs at a fairly high frequency so dividing it first
+	 * loses little accuracy.  Also note that the above formulas have
+	 * sample_period in seconds while our desired_update_interval is in
+	 * milliseconds, hence the divide by 1000.
+	 */
+	adc_combined_divisor = desired_update_interval_ms *
+			(pclk_hz / 24 / 1000 / num_enabled_channels);
+
+	/* Prefer to use the ADC divisor over the ADC pre-divisor.  ADC divisor
+	 * is 10-bits wide so anything over 1024 must use the pre-divisor.
+	 */
+	adc_pre_divisor = 1;
+	while (adc_combined_divisor/adc_pre_divisor > (1<<10)) {
+		adc_pre_divisor += 1;
+	};
+	adc_divisor = adc_combined_divisor / adc_pre_divisor;
+
+	/* Since ADC divisor and pre-divisor are used in division, the register
+	 * value is implicitly incremented by one before use.  This means we
+	 * need to subtract one from our calculated values above.
+	 */
+	adc_pre_divisor -= 1;
+	adc_divisor -= 1;
+
+	adc_clock_control_reg_val = (adc_pre_divisor << 17) | adc_divisor;
+
+	mutex_lock(&data->lock);
+	data->update_interval_ms =
+			(adc_pre_divisor + 1) * (adc_divisor + 1)
+			/ (pclk_hz / 24 / 1000);
+	writel(adc_clock_control_reg_val, data->base + ASPEED_ADC_REG_ADC0C);
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static int aspeed_adc_get_channel_reading(struct aspeed_adc_data *data,
+						int channel, long *val)
+{
+	u32 data_reg;
+	u32 data_reg_val;
+	long adc_val;
+
+	/* Each 32-bit data register contains 2 10-bit ADC values. */
+	data_reg = ASPEED_ADC_REG_ADC10 + (channel / 2) * 4;
+	data_reg_val = readl(data->base + data_reg);
+	if (channel % 2 == 0) {
+		adc_val = data_reg_val & 0x3FF;
+	} else {
+		adc_val = (data_reg_val >> 16) & 0x3FF;
+	}
+
+	/* Scale 10-bit input reading to millivolts. */
+	*val = adc_val * ASPEED_ADC_REF_VOLTAGE / 1024;
+
+	return 0;
+}
+
+static umode_t aspeed_adc_hwmon_is_visible(const void *_data,
+						enum hwmon_sensor_types type,
+						u32 attr, int channel)
+{
+	const struct aspeed_adc_data* data = _data;
+
+	if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
+		return S_IRUGO | S_IWUSR;
+	} else if (type == hwmon_in) {
+		/* Only channels that are enabled should be visible. */
+		if (channel >= 0 && channel <= ASPEED_ADC_NUM_CHANNELS &&
+		    (data->enabled_channel_mask & BIT(channel))) {
+
+			/* All enabled channels have an input but labels are
+			 * optional in the device tree.
+			 */
+			if (attr == hwmon_in_input) {
+				return S_IRUGO;
+			} else if (attr == hwmon_in_label &&
+					data->channel_labels[channel] != NULL) {
+				return S_IRUGO;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int aspeed_adc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct aspeed_adc_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
+		*val = data->update_interval_ms;
+		return 0;
+	} else if (type == hwmon_in && attr == hwmon_in_input) {
+		return aspeed_adc_get_channel_reading(data, channel, val);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int aspeed_adc_hwmon_read_string(struct device *dev,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel, char **str)
+{
+	struct aspeed_adc_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_in && attr == hwmon_in_label) {
+		*str = (char*)data->channel_labels[channel];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int aspeed_adc_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long val)
+{
+	struct aspeed_adc_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
+		return aspeed_adc_set_adc_clock_frequency(data, val);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops aspeed_adc_hwmon_ops = {
+	.is_visible = aspeed_adc_hwmon_is_visible,
+	.read = aspeed_adc_hwmon_read,
+	.read_string = aspeed_adc_hwmon_read_string,
+	.write = aspeed_adc_hwmon_write,
+};
+
+static const u32 aspeed_adc_hwmon_chip_config[] = {
+	HWMON_C_UPDATE_INTERVAL,
+	0
+};
+
+static const struct hwmon_channel_info aspeed_adc_hwmon_chip_channel = {
+	.type = hwmon_chip,
+	.config = aspeed_adc_hwmon_chip_config,
+};
+
+static const u32 aspeed_adc_hwmon_in_config[] = {
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	0
+};
+
+static const struct hwmon_channel_info aspeed_adc_hwmon_in_channel = {
+	.type = hwmon_in,
+	.config = aspeed_adc_hwmon_in_config,
+};
+
+static const struct hwmon_channel_info *aspeed_adc_hwmon_channel_info[] = {
+	&aspeed_adc_hwmon_chip_channel,
+	&aspeed_adc_hwmon_in_channel,
+	NULL
+};
+
+static const struct hwmon_chip_info aspeed_adc_hwmon_chip_info = {
+	.ops = &aspeed_adc_hwmon_ops,
+	.info = aspeed_adc_hwmon_channel_info,
+};
+
+static int aspeed_adc_probe(struct platform_device *pdev)
+{
+	struct aspeed_adc_data *data;
+	struct resource *res;
+	int ret;
+	struct device *hwmon_dev;
+	u32 desired_update_interval_ms;
+	u32 adc_engine_control_reg_val;
+	struct device_node* node;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(data->pclk)) {
+		dev_err(&pdev->dev, "clk_get failed\n");
+		return PTR_ERR(data->pclk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	data->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	ret = of_property_read_u32(pdev->dev.of_node,
+			"update-interval-ms", &desired_update_interval_ms);
+	if (ret < 0 || desired_update_interval_ms == 0) {
+		dev_err(&pdev->dev,
+				"Missing or zero update-interval-ms property, "
+				"defaulting to 100ms\n");
+		desired_update_interval_ms = 100;
+	}
+
+	mutex_init(&data->lock);
+
+	ret = clk_prepare_enable(data->pclk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable clock\n");
+		mutex_destroy(&data->lock);
+                return ret;
+	}
+
+	/* Figure out which channels are marked available in the device tree. */
+	data->enabled_channel_mask = 0;
+	for_each_available_child_of_node(pdev->dev.of_node, node) {
+		u32 pval;
+		unsigned int channel;
+
+		if (of_property_read_u32(node, "reg", &pval)) {
+			dev_err(&pdev->dev, "invalid reg on %s\n",
+				node->full_name);
+			continue;
+		}
+
+		channel = pval;
+		if (channel >= ASPEED_ADC_NUM_CHANNELS) {
+			dev_err(&pdev->dev,
+				"invalid channel index %d on %s\n",
+				channel, node->full_name);
+			continue;
+		}
+
+		data->enabled_channel_mask |= BIT(channel);
+
+		/* Cache a pointer to the label if one is specified.  Ignore any
+		 * errors as the label property is optional.
+		 */
+		of_property_read_string(node, "label", &data->channel_labels[channel]);
+	}
+
+	platform_set_drvdata(pdev, data);
+	aspeed_adc_set_adc_clock_frequency(data, desired_update_interval_ms);
+
+	/* Start all the requested channels in normal mode. */
+	adc_engine_control_reg_val = (data->enabled_channel_mask << 16) |
+		ASPEED_ADC_OPERATION_MODE_NORMAL | ASPEED_ADC_ENGINE_ENABLE;
+	writel(adc_engine_control_reg_val, data->base + ASPEED_ADC_REG_ADC00);
+
+	/* Register sysfs hooks */
+	hwmon_dev = devm_hwmon_device_register_with_info(
+			&pdev->dev, "aspeed_adc", data,
+			&aspeed_adc_hwmon_chip_info, NULL);
+	if (IS_ERR(hwmon_dev)) {
+		clk_disable_unprepare(data->pclk);
+		mutex_destroy(&data->lock);
+		return PTR_ERR(hwmon_dev);
+	}
+
+	return 0;
+}
+
+static int aspeed_adc_remove(struct platform_device *pdev) {
+	struct aspeed_adc_data *data = dev_get_drvdata(&pdev->dev);
+	clk_disable_unprepare(data->pclk);
+	mutex_destroy(&data->lock);
+	return 0;
+}
+
+const struct of_device_id aspeed_adc_matches[] = {
+	{ .compatible = "aspeed,ast2400-adc" },
+	{ .compatible = "aspeed,ast2500-adc" },
+};
+MODULE_DEVICE_TABLE(of, aspeed_adc_matches);
+
+static struct platform_driver aspeed_adc_driver = {
+	.probe = aspeed_adc_probe,
+	.remove = aspeed_adc_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_adc_matches,
+	}
+};
+
+module_platform_driver(aspeed_adc_driver);
+
+MODULE_AUTHOR("Rick Altherr <raltherr@google.com>");
+MODULE_DESCRIPTION("Aspeed AST2400/2500 ADC Driver");
+MODULE_LICENSE("GPL");
-- 
2.11.0.483.g087da7b7c-goog

