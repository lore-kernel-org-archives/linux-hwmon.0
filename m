Return-Path: <fe@dev.tdt.de>
Return-path: <fe@dev.tdt.de>
From: Florian Eckert <fe@dev.tdt.de>
To: robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com
Subject: [PATCH v3 1/2] hwmon: (ltq-cputemp) add cpu temp sensor driver
Date: Fri,  1 Sep 2017 08:58:17 +0200
Message-Id: <20170901065818.2037-1-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Add the lantiq cpu temperature sensor support for xrx200.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
v2:
- remove default in Makefile
- fix spelling
- removing first read delay, because temperature value is not read during boot
  anymore
- change calculation, compiler should to the optimization
- remove unnecessary initialization
- use new devm_hwmon_device_register_with_info API
- use module_platform_driver function

v3:
- sort includes in alphabetic order
- add missing linux/bitops.h include
- fix alignment
- fix switch case indentation
- use octal file permission instead of S_IRUGO
- set hwmon device name to "ltq_cputemp"
- enable temperature chip before hwmon registration
- remove release function registrate ltq_cputemp_disable()
  with devm_add_action
- remove init_ltq_cputemp and clean_ltq_cputemp not used
  overlooked it on v2

 drivers/hwmon/Kconfig       |   7 ++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/ltq-cputemp.c | 163 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 drivers/hwmon/ltq-cputemp.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5ef2814345ef..218332f0e913 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -790,6 +790,13 @@ config SENSORS_LTC4261
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc4261.
 
+config SENSORS_LTQ_CPUTEMP
+	bool "Lantiq cpu temperature sensor driver"
+	depends on LANTIQ
+	help
+	  If you say yes here you get support for the temperature
+	  sensor inside your CPU.
+
 config SENSORS_MAX1111
 	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
 	depends on SPI_MASTER
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4641a9f16c1..c84d9784be98 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_SENSORS_LTC4222)	+= ltc4222.o
 obj-$(CONFIG_SENSORS_LTC4245)	+= ltc4245.o
 obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
 obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
+obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
 obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
diff --git a/drivers/hwmon/ltq-cputemp.c b/drivers/hwmon/ltq-cputemp.c
new file mode 100644
index 000000000000..1d33f94594c1
--- /dev/null
+++ b/drivers/hwmon/ltq-cputemp.c
@@ -0,0 +1,163 @@
+/* Lantiq cpu temperature sensor driver
+ *
+ * Copyright (C) 2017 Florian Eckert <fe@dev.tdt.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version
+ *
+ * This program is distributed in the hope that it will be useful
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include <lantiq_soc.h>
+
+/* gphy1 configuration register contains cpu temperature */
+#define CGU_GPHY1_CR   0x0040
+#define CGU_TEMP_PD    BIT(19)
+
+static void ltq_cputemp_enable(void)
+{
+	ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) | CGU_TEMP_PD, CGU_GPHY1_CR);
+}
+
+static void ltq_cputemp_disable(void *data)
+{
+	ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) & ~CGU_TEMP_PD, CGU_GPHY1_CR);
+}
+
+static int ltq_read(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long *temp)
+{
+	int value;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		/* get the temperature including one decimal place */
+		value = (ltq_cgu_r32(CGU_GPHY1_CR) >> 9) & 0x01FF;
+		value = value * 5;
+		/* range -38 to +154 °C, register value zero is -38.0 °C */
+		value -= 380;
+		/* scale temp to millidegree */
+		value = value * 100;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*temp = value;
+	return 0;
+}
+
+static umode_t ltq_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static const u32 ltq_chip_config[] = {
+	HWMON_C_REGISTER_TZ,
+	0
+};
+
+static const struct hwmon_channel_info ltq_chip = {
+	.type = hwmon_chip,
+	.config = ltq_chip_config,
+};
+
+static const u32 ltq_temp_config[] = {
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info ltq_temp = {
+	.type = hwmon_temp,
+	.config = ltq_temp_config,
+};
+
+static const struct hwmon_channel_info *ltq_info[] = {
+	&ltq_chip,
+	&ltq_temp,
+	NULL
+};
+
+static const struct hwmon_ops ltq_hwmon_ops = {
+	.is_visible = ltq_is_visible,
+	.read = ltq_read,
+};
+
+static const struct hwmon_chip_info ltq_chip_info = {
+	.ops = &ltq_hwmon_ops,
+	.info = ltq_info,
+};
+
+static int ltq_cputemp_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev;
+	int err = 0;
+
+	/* available on vr9 v1.2 SoCs only */
+	if (ltq_soc_type() != SOC_TYPE_VR9_2)
+		return -ENODEV;
+
+	err = devm_add_action(&pdev->dev, ltq_cputemp_disable, NULL);
+	if (err)
+		return err;
+
+	ltq_cputemp_enable();
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+							 "ltq_cputemp",
+							 NULL,
+							 &ltq_chip_info,
+							 NULL);
+
+	if (IS_ERR(hwmon_dev)) {
+		dev_err(&pdev->dev, "Failed to register as hwmon device");
+		return PTR_ERR(hwmon_dev);
+	}
+
+	return 0;
+}
+
+const struct of_device_id ltq_cputemp_match[] = {
+	{ .compatible = "lantiq,cputemp" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ltq_cputemp_match);
+
+static struct platform_driver ltq_cputemp_driver = {
+	.probe = ltq_cputemp_probe,
+	.driver = {
+		.name = "ltq-cputemp",
+		.of_match_table = ltq_cputemp_match,
+	},
+};
+
+module_platform_driver(ltq_cputemp_driver);
+
+MODULE_AUTHOR("Florian Eckert <fe@dev.tdt.de>");
+MODULE_DESCRIPTION("Lantiq cpu temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.11.0
