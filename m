Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
Date: Tue, 29 Mar 2016 14:13:10 -0500
Message-ID: <1459278791-3646-8-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

This patch adds the hwmon functionality to the Arria10 System
Resource Chip. The hwmon encapsulates the PCIe Enable, USB Enable,
and all the Power Good signals on the System Controller.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 drivers/hwmon/Kconfig              |    9 +
 drivers/hwmon/Makefile             |    1 +
 drivers/hwmon/altera-a10sr-hwmon.c |  544 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/altera-a10sr.c         |    4 +
 include/linux/mfd/altera-a10sr.h   |  107 +++++--
 5 files changed, 645 insertions(+), 20 deletions(-)
 create mode 100644 drivers/hwmon/altera-a10sr-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d13a..edea31a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -81,6 +81,15 @@ config SENSORS_ABITUGURU3
 	  This driver can also be built as a module.  If so, the module
 	  will be called abituguru3.
 
+config SENSORS_ALTERA_A10SR
+	bool "Altera Arria10 System Status"
+	depends on MFD_ALTERA_A10SR
+	help
+	  If you say yes here you get support for the power ready status
+	  for the Arria10's external power supplies on the Arria10 DevKit.
+	  These values are read over the SPI bus from the Arria10 System
+	  Resource chip.
+
 config SENSORS_AD7314
 	tristate "Analog Devices AD7314 and compatibles"
 	depends on SPI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 58cc3ac..7a75dc8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
 obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
 obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
 obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
+obj-$(CONFIG_SENSORS_ALTERA_A10SR) += altera-a10sr-hwmon.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
diff --git a/drivers/hwmon/altera-a10sr-hwmon.c b/drivers/hwmon/altera-a10sr-hwmon.c
new file mode 100644
index 0000000..e789eed
--- /dev/null
+++ b/drivers/hwmon/altera-a10sr-hwmon.c
@@ -0,0 +1,544 @@
+/*
+ *  Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * HW Monitor driver for  Altera Arria10 MAX5 System Resource Chip
+ * Adapted from DA9052
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/altera-a10sr.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define ALTR_A10SR_1V0_BIT_POS          ALTR_A10SR_PG1_1V0_SHIFT
+#define ALTR_A10SR_0V95_BIT_POS         ALTR_A10SR_PG1_0V95_SHIFT
+#define ALTR_A10SR_0V9_BIT_POS          ALTR_A10SR_PG1_0V9_SHIFT
+#define ALTR_A10SR_10V_BIT_POS          ALTR_A10SR_PG1_10V_SHIFT
+#define ALTR_A10SR_5V0_BIT_POS          ALTR_A10SR_PG1_5V0_SHIFT
+#define ALTR_A10SR_3V3_BIT_POS          ALTR_A10SR_PG1_3V3_SHIFT
+#define ALTR_A10SR_2V5_BIT_POS          ALTR_A10SR_PG1_2V5_SHIFT
+#define ALTR_A10SR_1V8_BIT_POS          ALTR_A10SR_PG1_1V8_SHIFT
+#define ALTR_A10SR_OP_FLAG_BIT_POS      ALTR_A10SR_PG1_OP_FLAG_SHIFT
+/* 2nd register needs an offset of 8 to get to 2nd register */
+#define ALTR_A10SR_FBC2MP_BIT_POS       (8 + ALTR_A10SR_PG2_FBC2MP_SHIFT)
+#define ALTR_A10SR_FAC2MP_BIT_POS       (8 + ALTR_A10SR_PG2_FAC2MP_SHIFT)
+#define ALTR_A10SR_FMCBVADJ_BIT_POS     (8 + ALTR_A10SR_PG2_FMCBVADJ_SHIFT)
+#define ALTR_A10SR_FMCAVADJ_BIT_POS     (8 + ALTR_A10SR_PG2_FMCAVADJ_SHIFT)
+#define ALTR_A10SR_HL_VDDQ_BIT_POS      (8 + ALTR_A10SR_PG2_HL_VDDQ_SHIFT)
+#define ALTR_A10SR_HL_VDD_BIT_POS       (8 + ALTR_A10SR_PG2_HL_VDD_SHIFT)
+#define ALTR_A10SR_HL_HPS_BIT_POS       (8 + ALTR_A10SR_PG2_HL_HPS_SHIFT)
+#define ALTR_A10SR_HPS_BIT_POS          (8 + ALTR_A10SR_PG2_HPS_SHIFT)
+/* 3rd register needs an offset of 16 to get to 3rd register */
+#define ALTR_A10SR_PCIE_WAKE_BIT_POS    (16 + ALTR_A10SR_PG3_PCIE_WAKE_SHIFT)
+#define ALTR_A10SR_PCIE_PR_BIT_POS      (16 + ALTR_A10SR_PG3_PCIE_PR_SHIFT)
+#define ALTR_A10SR_FMCB_PR_BIT_POS      (16 + ALTR_A10SR_PG3_FMCB_PR_SHIFT)
+#define ALTR_A10SR_FMCA_PR_BIT_POS      (16 + ALTR_A10SR_PG3_FMCA_PR_SHIFT)
+#define ALTR_A10SR_FILE_PR_BIT_POS      (16 + ALTR_A10SR_PG3_FILE_PR_SHIFT)
+#define ALTR_A10SR_BF_PR_BIT_POS        (16 + ALTR_A10SR_PG3_BF_PR_SHIFT)
+#define ALTR_A10SR_10V_FAIL_BIT_POS     (16 + ALTR_A10SR_PG3_10V_FAIL_SHIFT)
+#define ALTR_A10SR_FAM2C_BIT_POS        (16 + ALTR_A10SR_PG3_FAM2C_SHIFT)
+/* FMCA/B & PCIE Enables need an offset of 24 */
+#define ALTR_A10SR_FMCB_AUXEN_POS       (24 + ALTR_A10SR_FMCB_AUXEN_SHIFT)
+#define ALTR_A10SR_FMCB_EN_POS          (24 + ALTR_A10SR_FMCB_EN_SHIFT)
+#define ALTR_A10SR_FMCA_AUXEN_POS       (24 + ALTR_A10SR_FMCA_AUXEN_SHIFT)
+#define ALTR_A10SR_FMCA_EN_POS          (24 + ALTR_A10SR_FMCA_EN_SHIFT)
+#define ALTR_A10SR_PCIE_AUXEN_POS       (24 + ALTR_A10SR_PCIE_AUXEN_SHIFT)
+#define ALTR_A10SR_PCIE_EN_POS          (24 + ALTR_A10SR_PCIE_EN_SHIFT)
+/* HPS Resets need an offset of 32 */
+#define ALTR_A10SR_HPS_RST_UART_POS     (32 + ALTR_A10SR_HPS_UARTA_RSTN_SHIFT)
+#define ALTR_A10SR_HPS_RST_WARM_POS     (32 + ALTR_A10SR_HPS_WARM_RSTN_SHIFT)
+#define ALTR_A10SR_HPS_RST_WARM1_POS    (32 + ALTR_A10SR_HPS_WARM_RST1N_SHIFT)
+#define ALTR_A10SR_HPS_RST_COLD_POS     (32 + ALTR_A10SR_HPS_COLD_RSTN_SHIFT)
+#define ALTR_A10SR_HPS_RST_NPOR_POS     (32 + ALTR_A10SR_HPS_NPOR_SHIFT)
+#define ALTR_A10SR_HPS_RST_NRST_POS     (32 + ALTR_A10SR_HPS_NRST_SHIFT)
+#define ALTR_A10SR_HPS_RST_ENET_POS     (32 + ALTR_A10SR_HPS_ENET_RSTN_SHIFT)
+#define ALTR_A10SR_HPS_RST_ENETINT_POS  (32 + ALTR_A10SR_HPS_ENET_INTN_SHIFT)
+/* Peripheral Resets need an offset of 40 */
+#define ALTR_A10SR_PER_RST_USB_POS      (40 + ALTR_A10SR_USB_RST_SHIFT)
+#define ALTR_A10SR_PER_RST_BQSPI_POS    (40 + ALTR_A10SR_BQSPI_RST_N_SHIFT)
+#define ALTR_A10SR_PER_RST_FILE_POS     (40 + ALTR_A10SR_FILE_RST_N_SHIFT)
+#define ALTR_A10SR_PER_RST_PCIE_POS     (40 + ALTR_A10SR_PCIE_PERST_N_SHIFT)
+/* HWMON - Read Entire Register */
+#define ALTR_A10SR_ENTIRE_REG           (88)
+#define ALTR_A10SR_ENTIRE_REG_MASK      (0xFF)
+#define ALTR_A10SR_VERSION              (0 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_LED                  (1 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PB                   (2 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PBF                  (3 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PG1                  (4 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PG2                  (5 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PG3                  (6 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_FMCAB                (7 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_HPS_RST              (8 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PER_RST              (9 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_SFPA                 (10 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_SFPB                 (11 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_I2C_MASTER           (12 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_WARM_RST             (13 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_WARM_RST_KEY         (14 + ALTR_A10SR_ENTIRE_REG)
+#define ALTR_A10SR_PMBUS                (15 + ALTR_A10SR_ENTIRE_REG)
+
+struct altr_a10sr_hwmon {
+	struct altr_a10sr	*a10sr;
+	struct device		*class_device;
+};
+
+static const char *const hwmon_names[] = {
+	[ALTR_A10SR_1V0_BIT_POS]       = "1.0V PWR Good",
+	[ALTR_A10SR_0V95_BIT_POS]      = "0.95V PWR Good",
+	[ALTR_A10SR_0V9_BIT_POS]       = "0.9V PWR Good",
+	[ALTR_A10SR_5V0_BIT_POS]       = "5.0V PWR Good",
+	[ALTR_A10SR_3V3_BIT_POS]       = "3.3V PWR Good",
+	[ALTR_A10SR_2V5_BIT_POS]       = "2.5V PWR Good",
+	[ALTR_A10SR_1V8_BIT_POS]       = "1.8V PWR Good",
+	[ALTR_A10SR_OP_FLAG_BIT_POS]   = "PWR On Complete",
+
+	[ALTR_A10SR_FBC2MP_BIT_POS]    = "FBC2MP PWR Good",
+	[ALTR_A10SR_FAC2MP_BIT_POS]    = "FAC2MP PWR Good",
+	[ALTR_A10SR_FMCBVADJ_BIT_POS]  = "FMCBVADJ PWR Good",
+	[ALTR_A10SR_FMCAVADJ_BIT_POS]  = "FMCAVADJ PWR Good",
+	[ALTR_A10SR_HL_VDDQ_BIT_POS]   = "HILO VDDQ PWR Good",
+	[ALTR_A10SR_HL_VDD_BIT_POS]    = "HILO VDD PWR Good",
+	[ALTR_A10SR_HL_HPS_BIT_POS]    = "HILO HPS PWR Good",
+	[ALTR_A10SR_HPS_BIT_POS]       = "HPS PWR Good",
+
+	[ALTR_A10SR_PCIE_WAKE_BIT_POS] = "PCIE WAKEn",
+	[ALTR_A10SR_PCIE_PR_BIT_POS]   = "PCIE PRESENTn",
+	[ALTR_A10SR_FMCB_PR_BIT_POS]   = "FMCB PRESENTn",
+	[ALTR_A10SR_FMCA_PR_BIT_POS]   = "FMCA PRESENTn",
+	[ALTR_A10SR_FILE_PR_BIT_POS]   = "FILE PRESENTn",
+	[ALTR_A10SR_BF_PR_BIT_POS]     = "BF PRESENTn",
+	[ALTR_A10SR_10V_FAIL_BIT_POS]  = "10V FAILn",
+	[ALTR_A10SR_FAM2C_BIT_POS]     = "FAM2C PWR Good",
+};
+
+static ssize_t altr_a10sr_read_status(struct device *dev,
+				      struct device_attribute *devattr,
+				      char *buf)
+{
+	struct altr_a10sr_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret, index = to_sensor_dev_attr(devattr)->index;
+	int mask = ALTR_A10SR_REG_BIT_MASK(index);
+	unsigned char reg = ALTR_A10SR_PWR_GOOD1_RD_REG +
+			    ALTR_A10SR_REG_OFFSET(index);
+
+	/* Check if this is an entire register read */
+	if (index >= ALTR_A10SR_ENTIRE_REG) {
+		reg = ((index - ALTR_A10SR_ENTIRE_REG) << 1) + 1;
+		mask = ALTR_A10SR_ENTIRE_REG_MASK;
+	}
+
+	ret = altr_a10sr_reg_read(hwmon->a10sr, reg);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "0x%X\n", (ret & mask));
+}
+
+static ssize_t altr_a10sr_hwmon_show_name(struct device *dev,
+					  struct device_attribute *devattr,
+					  char *buf)
+{
+	return sprintf(buf, "altr_a10sr\n");
+}
+
+static ssize_t show_label(struct device *dev,
+			  struct device_attribute *devattr, char *buf)
+{
+	return sprintf(buf, "%s\n",
+		       hwmon_names[to_sensor_dev_attr(devattr)->index]);
+}
+
+static ssize_t set_enable(struct device *dev,
+			  struct device_attribute *dev_attr,
+			  const char *buf, size_t count)
+{
+	unsigned long val;
+	struct altr_a10sr_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret, index = to_sensor_dev_attr(dev_attr)->index;
+	int mask = ALTR_A10SR_REG_BIT_MASK(index);
+	unsigned char reg = (ALTR_A10SR_PWR_GOOD1_RD_REG & WRITE_REG_MASK) +
+			    ALTR_A10SR_REG_OFFSET(index);
+	int res = kstrtol(buf, 10, &val);
+
+	if (res < 0)
+		return res;
+
+	/* Check if this is an entire register write */
+	if (index >= ALTR_A10SR_ENTIRE_REG) {
+		reg = ((index - ALTR_A10SR_ENTIRE_REG) << 1);
+		mask = ALTR_A10SR_ENTIRE_REG_MASK;
+	}
+
+	ret = altr_a10sr_reg_update(hwmon->a10sr, reg, mask, val);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+/* First Power Good Register Bits */
+static SENSOR_DEVICE_ATTR(1v0_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_1V0_BIT_POS);
+static SENSOR_DEVICE_ATTR(1v0_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_1V0_BIT_POS);
+static SENSOR_DEVICE_ATTR(0v95_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_0V95_BIT_POS);
+static SENSOR_DEVICE_ATTR(0v95_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_0V95_BIT_POS);
+static SENSOR_DEVICE_ATTR(0v9_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_0V9_BIT_POS);
+static SENSOR_DEVICE_ATTR(0v9_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_0V9_BIT_POS);
+static SENSOR_DEVICE_ATTR(5v0_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_5V0_BIT_POS);
+static SENSOR_DEVICE_ATTR(5v0_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_5V0_BIT_POS);
+static SENSOR_DEVICE_ATTR(3v3_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_3V3_BIT_POS);
+static SENSOR_DEVICE_ATTR(3v3_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_3V3_BIT_POS);
+static SENSOR_DEVICE_ATTR(2v5_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_2V5_BIT_POS);
+static SENSOR_DEVICE_ATTR(2v5_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_2V5_BIT_POS);
+static SENSOR_DEVICE_ATTR(1v8_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_1V8_BIT_POS);
+static SENSOR_DEVICE_ATTR(1v8_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_1V8_BIT_POS);
+static SENSOR_DEVICE_ATTR(opflag_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_OP_FLAG_BIT_POS);
+static SENSOR_DEVICE_ATTR(opflag_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_OP_FLAG_BIT_POS);
+/* Second Power Good Register Bits */
+static SENSOR_DEVICE_ATTR(fbc2mp_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FBC2MP_BIT_POS);
+static SENSOR_DEVICE_ATTR(fbc2mp_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FBC2MP_BIT_POS);
+static SENSOR_DEVICE_ATTR(fac2mp_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FAC2MP_BIT_POS);
+static SENSOR_DEVICE_ATTR(fac2mp_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FAC2MP_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmcbvadj_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FMCBVADJ_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmcbvadj_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FMCBVADJ_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmcavadj_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FMCAVADJ_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmcavadj_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FMCAVADJ_BIT_POS);
+static SENSOR_DEVICE_ATTR(hl_vddq_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_HL_VDDQ_BIT_POS);
+static SENSOR_DEVICE_ATTR(hl_vddq_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_HL_VDDQ_BIT_POS);
+static SENSOR_DEVICE_ATTR(hl_vdd_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_HL_VDD_BIT_POS);
+static SENSOR_DEVICE_ATTR(hl_vdd_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_HL_VDD_BIT_POS);
+static SENSOR_DEVICE_ATTR(hlhps_vdd_input, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_HL_HPS_BIT_POS);
+static SENSOR_DEVICE_ATTR(hlhps_vdd_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_HL_HPS_BIT_POS);
+static SENSOR_DEVICE_ATTR(hps_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_HPS_BIT_POS);
+static SENSOR_DEVICE_ATTR(hps_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_HPS_BIT_POS);
+/* Third Power Good Register Bits */
+static SENSOR_DEVICE_ATTR(pcie_wake_input, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_PCIE_WAKE_BIT_POS);
+static SENSOR_DEVICE_ATTR(pcie_wake_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_PCIE_WAKE_BIT_POS);
+static SENSOR_DEVICE_ATTR(pcie_pr_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_PCIE_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(pcie_pr_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_PCIE_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmcb_pr_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FMCB_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmcb_pr_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FMCB_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmca_pr_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FMCA_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(fmca_pr_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FMCA_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(file_pr_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FILE_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(file_pr_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FILE_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(bf_pr_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_BF_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(bf_pr_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_BF_PR_BIT_POS);
+static SENSOR_DEVICE_ATTR(10v_fail_input, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_10V_FAIL_BIT_POS);
+static SENSOR_DEVICE_ATTR(10v_fail_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_10V_FAIL_BIT_POS);
+static SENSOR_DEVICE_ATTR(fam2c_input, S_IRUGO, altr_a10sr_read_status, NULL,
+			  ALTR_A10SR_FAM2C_BIT_POS);
+static SENSOR_DEVICE_ATTR(fam2c_label, S_IRUGO, show_label, NULL,
+			  ALTR_A10SR_FAM2C_BIT_POS);
+/* Peripheral Enable bits */
+static SENSOR_DEVICE_ATTR(fmcb_aux_en, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_FMCB_AUXEN_POS);
+static SENSOR_DEVICE_ATTR(fmcb_en, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_FMCB_EN_POS);
+static SENSOR_DEVICE_ATTR(fmca_aux_en, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_FMCA_AUXEN_POS);
+static SENSOR_DEVICE_ATTR(fmca_en, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_FMCA_EN_POS);
+static SENSOR_DEVICE_ATTR(pcie_aux_en, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PCIE_AUXEN_POS);
+static SENSOR_DEVICE_ATTR(pcie_en, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PCIE_EN_POS);
+/* HPS Reset bits */
+static SENSOR_DEVICE_ATTR(hps_uart_rst, S_IRUGO,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_UART_POS);
+static SENSOR_DEVICE_ATTR(hps_warm_rst, S_IRUGO,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_WARM_POS);
+static SENSOR_DEVICE_ATTR(hps_warm1_rst, S_IRUGO,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_WARM1_POS);
+static SENSOR_DEVICE_ATTR(hps_cold_rst, S_IRUGO,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_COLD_POS);
+static SENSOR_DEVICE_ATTR(hps_npor, S_IRUGO,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_NPOR_POS);
+static SENSOR_DEVICE_ATTR(hps_nrst, S_IRUGO,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_NRST_POS);
+static SENSOR_DEVICE_ATTR(hps_enet_rst, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_ENET_POS);
+static SENSOR_DEVICE_ATTR(hps_enet_int, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST_ENETINT_POS);
+/* Peripheral Reset bits */
+static SENSOR_DEVICE_ATTR(usb_reset, S_IRUGO | S_IWUSR, altr_a10sr_read_status,
+			  set_enable, ALTR_A10SR_PER_RST_USB_POS);
+static SENSOR_DEVICE_ATTR(bqspi_resetn, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PER_RST_BQSPI_POS);
+static SENSOR_DEVICE_ATTR(file_resetn, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PER_RST_FILE_POS);
+static SENSOR_DEVICE_ATTR(pcie_perstn, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PER_RST_PCIE_POS);
+/* Entire Byte Read */
+static SENSOR_DEVICE_ATTR(max5_version, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_VERSION);
+static SENSOR_DEVICE_ATTR(max5_led, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_LED);
+static SENSOR_DEVICE_ATTR(max5_button, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_PB);
+static SENSOR_DEVICE_ATTR(max5_button_irq, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable, ALTR_A10SR_PBF);
+static SENSOR_DEVICE_ATTR(max5_pg1, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_PG1);
+static SENSOR_DEVICE_ATTR(max5_pg2, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_PG2);
+static SENSOR_DEVICE_ATTR(max5_pg3, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_PG3);
+static SENSOR_DEVICE_ATTR(max5_fmcab, S_IRUGO, altr_a10sr_read_status,
+			  NULL, ALTR_A10SR_FMCAB);
+static SENSOR_DEVICE_ATTR(max5_hps_resets, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_HPS_RST);
+static SENSOR_DEVICE_ATTR(max5_per_resets, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PER_RST);
+static SENSOR_DEVICE_ATTR(max5_sfpa, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable, ALTR_A10SR_SFPA);
+static SENSOR_DEVICE_ATTR(max5_sfpb, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable, ALTR_A10SR_SFPB);
+static SENSOR_DEVICE_ATTR(max5_i2c_master, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_I2C_MASTER);
+static SENSOR_DEVICE_ATTR(max5_pmbus, S_IRUGO | S_IWUSR,
+			  altr_a10sr_read_status, set_enable,
+			  ALTR_A10SR_PMBUS);
+
+static DEVICE_ATTR(name, S_IRUGO, altr_a10sr_hwmon_show_name, NULL);
+
+static struct attribute *altr_a10sr_attr[] = {
+	&dev_attr_name.attr,
+	/* First Power Good Register */
+	&sensor_dev_attr_1v0_input.dev_attr.attr,
+	&sensor_dev_attr_1v0_label.dev_attr.attr,
+	&sensor_dev_attr_0v95_input.dev_attr.attr,
+	&sensor_dev_attr_0v95_label.dev_attr.attr,
+	&sensor_dev_attr_0v9_input.dev_attr.attr,
+	&sensor_dev_attr_0v9_label.dev_attr.attr,
+	&sensor_dev_attr_5v0_input.dev_attr.attr,
+	&sensor_dev_attr_5v0_label.dev_attr.attr,
+	&sensor_dev_attr_3v3_input.dev_attr.attr,
+	&sensor_dev_attr_3v3_label.dev_attr.attr,
+	&sensor_dev_attr_2v5_input.dev_attr.attr,
+	&sensor_dev_attr_2v5_label.dev_attr.attr,
+	&sensor_dev_attr_1v8_input.dev_attr.attr,
+	&sensor_dev_attr_1v8_label.dev_attr.attr,
+	&sensor_dev_attr_opflag_input.dev_attr.attr,
+	&sensor_dev_attr_opflag_label.dev_attr.attr,
+	/* Second Power Good Register */
+	&sensor_dev_attr_fbc2mp_input.dev_attr.attr,
+	&sensor_dev_attr_fbc2mp_label.dev_attr.attr,
+	&sensor_dev_attr_fac2mp_input.dev_attr.attr,
+	&sensor_dev_attr_fac2mp_label.dev_attr.attr,
+	&sensor_dev_attr_fmcbvadj_input.dev_attr.attr,
+	&sensor_dev_attr_fmcbvadj_label.dev_attr.attr,
+	&sensor_dev_attr_fmcavadj_input.dev_attr.attr,
+	&sensor_dev_attr_fmcavadj_label.dev_attr.attr,
+	&sensor_dev_attr_hl_vddq_input.dev_attr.attr,
+	&sensor_dev_attr_hl_vddq_label.dev_attr.attr,
+	&sensor_dev_attr_hl_vdd_input.dev_attr.attr,
+	&sensor_dev_attr_hl_vdd_label.dev_attr.attr,
+	&sensor_dev_attr_hlhps_vdd_input.dev_attr.attr,
+	&sensor_dev_attr_hlhps_vdd_label.dev_attr.attr,
+	&sensor_dev_attr_hps_input.dev_attr.attr,
+	&sensor_dev_attr_hps_label.dev_attr.attr,
+	/* Third Power Good Register */
+	&sensor_dev_attr_pcie_wake_input.dev_attr.attr,
+	&sensor_dev_attr_pcie_wake_label.dev_attr.attr,
+	&sensor_dev_attr_pcie_pr_input.dev_attr.attr,
+	&sensor_dev_attr_pcie_pr_label.dev_attr.attr,
+	&sensor_dev_attr_fmcb_pr_input.dev_attr.attr,
+	&sensor_dev_attr_fmcb_pr_label.dev_attr.attr,
+	&sensor_dev_attr_fmca_pr_input.dev_attr.attr,
+	&sensor_dev_attr_fmca_pr_label.dev_attr.attr,
+	&sensor_dev_attr_file_pr_input.dev_attr.attr,
+	&sensor_dev_attr_file_pr_label.dev_attr.attr,
+	&sensor_dev_attr_bf_pr_input.dev_attr.attr,
+	&sensor_dev_attr_bf_pr_label.dev_attr.attr,
+	&sensor_dev_attr_10v_fail_input.dev_attr.attr,
+	&sensor_dev_attr_10v_fail_label.dev_attr.attr,
+	&sensor_dev_attr_fam2c_input.dev_attr.attr,
+	&sensor_dev_attr_fam2c_label.dev_attr.attr,
+	/* Peripheral Enable Register */
+	&sensor_dev_attr_fmcb_aux_en.dev_attr.attr,
+	&sensor_dev_attr_fmcb_en.dev_attr.attr,
+	&sensor_dev_attr_fmca_aux_en.dev_attr.attr,
+	&sensor_dev_attr_fmca_en.dev_attr.attr,
+	&sensor_dev_attr_pcie_aux_en.dev_attr.attr,
+	&sensor_dev_attr_pcie_en.dev_attr.attr,
+	/* HPS Reset bits */
+	&sensor_dev_attr_hps_uart_rst.dev_attr.attr,
+	&sensor_dev_attr_hps_warm_rst.dev_attr.attr,
+	&sensor_dev_attr_hps_warm1_rst.dev_attr.attr,
+	&sensor_dev_attr_hps_cold_rst.dev_attr.attr,
+	&sensor_dev_attr_hps_npor.dev_attr.attr,
+	&sensor_dev_attr_hps_nrst.dev_attr.attr,
+	&sensor_dev_attr_hps_enet_rst.dev_attr.attr,
+	&sensor_dev_attr_hps_enet_int.dev_attr.attr,
+	/* Peripheral Reset bits */
+	&sensor_dev_attr_usb_reset.dev_attr.attr,
+	&sensor_dev_attr_bqspi_resetn.dev_attr.attr,
+	&sensor_dev_attr_file_resetn.dev_attr.attr,
+	&sensor_dev_attr_pcie_perstn.dev_attr.attr,
+	/* Byte Value Register */
+	&sensor_dev_attr_max5_version.dev_attr.attr,
+	&sensor_dev_attr_max5_led.dev_attr.attr,
+	&sensor_dev_attr_max5_button.dev_attr.attr,
+	&sensor_dev_attr_max5_button_irq.dev_attr.attr,
+	&sensor_dev_attr_max5_pg1.dev_attr.attr,
+	&sensor_dev_attr_max5_pg2.dev_attr.attr,
+	&sensor_dev_attr_max5_pg3.dev_attr.attr,
+	&sensor_dev_attr_max5_fmcab.dev_attr.attr,
+	&sensor_dev_attr_max5_hps_resets.dev_attr.attr,
+	&sensor_dev_attr_max5_per_resets.dev_attr.attr,
+	&sensor_dev_attr_max5_sfpa.dev_attr.attr,
+	&sensor_dev_attr_max5_sfpb.dev_attr.attr,
+	&sensor_dev_attr_max5_i2c_master.dev_attr.attr,
+	&sensor_dev_attr_max5_pmbus.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group altr_a10sr_attr_group = {
+	.attrs = altr_a10sr_attr
+};
+
+static int altr_a10sr_hwmon_probe(struct platform_device *pdev)
+{
+	struct altr_a10sr_hwmon *hwmon;
+	int ret;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->a10sr = dev_get_drvdata(pdev->dev.parent);
+
+	platform_set_drvdata(pdev, hwmon);
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &altr_a10sr_attr_group);
+	if (ret)
+		goto err_mem;
+
+	hwmon->class_device = hwmon_device_register(&pdev->dev);
+	if (IS_ERR(hwmon->class_device)) {
+		ret = PTR_ERR(hwmon->class_device);
+		goto err_sysfs;
+	}
+
+	return 0;
+
+err_sysfs:
+	sysfs_remove_group(&pdev->dev.kobj, &altr_a10sr_attr_group);
+err_mem:
+	return ret;
+}
+
+static int altr_a10sr_hwmon_remove(struct platform_device *pdev)
+{
+	struct altr_a10sr_hwmon *hwmon = platform_get_drvdata(pdev);
+
+	hwmon_device_unregister(hwmon->class_device);
+	sysfs_remove_group(&pdev->dev.kobj, &altr_a10sr_attr_group);
+
+	return 0;
+}
+
+static const struct of_device_id altr_a10sr_hwmon_of_match[] = {
+	{ .compatible = "altr,a10sr-hwmon" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, altr_a10sr_hwmon_of_match);
+
+static struct platform_driver altr_a10sr_hwmon_driver = {
+	.probe = altr_a10sr_hwmon_probe,
+	.remove = altr_a10sr_hwmon_remove,
+	.driver = {
+		.name = "altr_a10sr_hwmon",
+		.of_match_table = altr_a10sr_hwmon_of_match,
+	},
+};
+
+module_platform_driver(altr_a10sr_hwmon_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Thor Thayer");
+MODULE_DESCRIPTION("HW Monitor driver for Altera Arria10 System Resource Chip");
diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
index 517b895..3eedad7 100644
--- a/drivers/mfd/altera-a10sr.c
+++ b/drivers/mfd/altera-a10sr.c
@@ -34,6 +34,10 @@ static const struct mfd_cell altr_a10sr_subdev_info[] = {
 		.name = "altr_a10sr_gpio",
 		.of_compatible = "altr,a10sr-gpio",
 	},
+	{
+		.name = "altr_a10sr_hwmon",
+		.of_compatible = "altr,a10sr-hwmon",
+	},
 };
 
 static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
diff --git a/include/linux/mfd/altera-a10sr.h b/include/linux/mfd/altera-a10sr.h
index 6d254a1..2bfc63e 100644
--- a/include/linux/mfd/altera-a10sr.h
+++ b/include/linux/mfd/altera-a10sr.h
@@ -75,26 +75,93 @@
 #define ALTR_A10SR_IN_VALID_RANGE_LO      8
 #define ALTR_A10SR_IN_VALID_RANGE_HI      15
 
-#define ALTR_A10SR_PWR_GOOD1_RD_REG   0x09    /* Power Good1 Read */
-#define ALTR_A10SR_PWR_GOOD2_RD_REG   0x0B    /* Power Good2 Read */
-#define ALTR_A10SR_PWR_GOOD3_RD_REG   0x0D    /* Power Good3 Read */
-#define ALTR_A10SR_FMCAB_WR_REG       0x0E    /* FMCA/B & PCIe Pwr Enable */
-#define ALTR_A10SR_FMCAB_RD_REG       0x0F    /* FMCA/B & PCIe Pwr Enable */
-#define ALTR_A10SR_HPS_RST_WR_REG     0x10    /* HPS Reset */
-#define ALTR_A10SR_HPS_RST_RD_REG     0x11    /* HPS Reset */
-#define ALTR_A10SR_USB_QSPI_WR_REG    0x12    /* USB, BQSPI, FILE Reset */
-#define ALTR_A10SR_USB_QSPI_RD_REG    0x13    /* USB, BQSPI, FILE Reset */
-#define ALTR_A10SR_SFPA_WR_REG        0x14    /* SFPA Control Reg */
-#define ALTR_A10SR_SFPA_RD_REG        0x15    /* SFPA Control Reg */
-#define ALTR_A10SR_SFPB_WR_REG        0x16    /* SFPB Control Reg */
-#define ALTR_A10SR_SFPB_RD_REG        0x17    /* SFPB Control Reg */
-#define ALTR_A10SR_I2C_M_RD_REG       0x19    /* I2C Master Select */
-#define ALTR_A10SR_WARM_RST_WR_REG    0x1A    /* HPS Warm Reset */
-#define ALTR_A10SR_WARM_RST_RD_REG    0x1B    /* HPS Warm Reset */
-#define ALTR_A10SR_WR_KEY_WR_REG      0x1C    /* HPS Warm Reset Key */
-#define ALTR_A10SR_WR_KEY_RD_REG      0x1D    /* HPS Warm Reset Key */
-#define ALTR_A10SR_PMBUS_WR_REG       0x1E    /* HPS PM Bus */
-#define ALTR_A10SR_PMBUS_RD_REG       0x1F    /* HPS PM Bus */
+#define ALTR_A10SR_PWR_GOOD1_RD_REG  0x09     /* Power Good1 Read */
+/* Power Good #1 Register Bit Definitions */
+#define ALTR_A10SR_PG1_OP_FLAG_SHIFT    7       /* Power On Complete */
+#define ALTR_A10SR_PG1_1V8_SHIFT        6       /* 1.8V Power Good */
+#define ALTR_A10SR_PG1_2V5_SHIFT        5       /* 2.5V Power Good */
+#define ALTR_A10SR_PG1_3V3_SHIFT        4       /* 3.3V Power Good */
+#define ALTR_A10SR_PG1_5V0_SHIFT        3       /* 5.0V Power Good */
+#define ALTR_A10SR_PG1_0V9_SHIFT        2       /* 0.9V Power Good */
+#define ALTR_A10SR_PG1_0V95_SHIFT       1       /* 0.95V Power Good */
+#define ALTR_A10SR_PG1_1V0_SHIFT        0       /* 1.0V Power Good */
+
+#define ALTR_A10SR_PWR_GOOD2_RD_REG  0x0B     /* Power Good2 Read */
+/* Power Good #2 Register Bit Definitions */
+#define ALTR_A10SR_PG2_HPS_SHIFT        7       /* HPS Power Good */
+#define ALTR_A10SR_PG2_HL_HPS_SHIFT     6       /* HILOHPS_VDD Power Good */
+#define ALTR_A10SR_PG2_HL_VDD_SHIFT     5       /* HILO VDD Power Good */
+#define ALTR_A10SR_PG2_HL_VDDQ_SHIFT    4       /* HILO VDDQ Power Good */
+#define ALTR_A10SR_PG2_FMCAVADJ_SHIFT   3       /* FMCA VADJ Power Good */
+#define ALTR_A10SR_PG2_FMCBVADJ_SHIFT   2       /* FMCB VADJ Power Good */
+#define ALTR_A10SR_PG2_FAC2MP_SHIFT     1       /* FAC2MP Power Good */
+#define ALTR_A10SR_PG2_FBC2MP_SHIFT     0       /* FBC2MP Power Good */
+
+#define ALTR_A10SR_PWR_GOOD3_RD_REG  0x0D   /* Power Good3 Read */
+/* Power Good #3 Register Bit Definitions */
+#define ALTR_A10SR_PG3_FAM2C_SHIFT      7       /* FAM2C Power Good */
+#define ALTR_A10SR_PG3_10V_FAIL_SHIFT   6       /* 10V Fail n */
+#define ALTR_A10SR_PG3_BF_PR_SHIFT      5       /* BF Present n */
+#define ALTR_A10SR_PG3_FILE_PR_SHIFT    4       /* File Present n */
+#define ALTR_A10SR_PG3_FMCA_PR_SHIFT    3       /* FMCA Present n */
+#define ALTR_A10SR_PG3_FMCB_PR_SHIFT    2       /* FMCB Present n */
+#define ALTR_A10SR_PG3_PCIE_PR_SHIFT    1       /* PCIE Present n */
+#define ALTR_A10SR_PG3_PCIE_WAKE_SHIFT  0       /* PCIe Wake N */
+
+#define ALTR_A10SR_FMCAB_WR_REG      0x0E    /* FMCA/B & PCIe Pwr Enable */
+#define ALTR_A10SR_FMCAB_RD_REG      0x0F    /* FMCA/B & PCIe Pwr Enable */
+/* FMCA/B & PCIe Power Bit Definitions */
+#define ALTR_A10SR_PCIE_EN_SHIFT        7       /* PCIe Pwr Enable */
+#define ALTR_A10SR_PCIE_AUXEN_SHIFT     6       /* PCIe Aux Pwr Enable */
+#define ALTR_A10SR_FMCA_EN_SHIFT        5       /* FMCA Pwr Enable */
+#define ALTR_A10SR_FMCA_AUXEN_SHIFT     4       /* FMCA Aux Pwr Enable */
+#define ALTR_A10SR_FMCB_EN_SHIFT        3       /* FMCB Pwr Enable */
+#define ALTR_A10SR_FMCB_AUXEN_SHIFT     2       /* FMCB Aux Pwr Enable */
+
+#define ALTR_A10SR_HPS_RST_WR_REG    0x10    /* HPS Reset */
+#define ALTR_A10SR_HPS_RST_RD_REG    0x11    /* HPS Reset */
+/* HPS Reset Bit Definitions */
+#define ALTR_A10SR_HPS_UARTA_RSTN_SHIFT 7       /* UARTA Reset n */
+#define ALTR_A10SR_HPS_WARM_RSTN_SHIFT  6       /* WARM Reset n */
+#define ALTR_A10SR_HPS_WARM_RST1N_SHIFT 5       /* WARM Reset1 n */
+#define ALTR_A10SR_HPS_COLD_RSTN_SHIFT  4       /* COLD Reset n */
+#define ALTR_A10SR_HPS_NPOR_SHIFT       3       /* N Power On Reset */
+#define ALTR_A10SR_HPS_NRST_SHIFT       2       /* N Reset */
+#define ALTR_A10SR_HPS_ENET_RSTN_SHIFT  1       /* Ethernet Reset n */
+#define ALTR_A10SR_HPS_ENET_INTN_SHIFT  0       /* Ethernet IRQ n */
+
+#define ALTR_A10SR_USB_QSPI_WR_REG   0x12    /* USB, BQSPI, FILE Reset */
+#define ALTR_A10SR_USB_QSPI_RD_REG   0x13    /* USB, BQSPI, FILE Reset */
+/* USB/QSPI/FILE Reset Bit Definitions */
+#define ALTR_A10SR_USB_RST_SHIFT        7       /* USB Reset */
+#define ALTR_A10SR_BQSPI_RST_N_SHIFT    6       /* BQSPI Reset n */
+#define ALTR_A10SR_FILE_RST_N_SHIFT     5       /* FILE Reset n */
+#define ALTR_A10SR_PCIE_PERST_N_SHIFT   4       /* PCIe PE Reset n */
+
+#define ALTR_A10SR_SFPA_WR_REG       0x14    /* SFPA Control Reg */
+#define ALTR_A10SR_SFPA_RD_REG       0x15    /* SFPA Control Reg */
+#define ALTR_A10SR_SFPB_WR_REG       0x16    /* SFPB Control Reg */
+#define ALTR_A10SR_SFPB_RD_REG       0x17    /* SFPB Control Reg */
+/* SFPA Bit Definitions */
+#define ALTR_A10SR_SFP_TXDIS_SHIFT      7       /* SFPA TX Disable */
+#define ALTR_A10SR_SFP_RATESEL10        0x60    /* SFPA_Rate Select [1:0] */
+#define ALTR_A10SR_SFP_LOS_SHIFT        4       /* SFPA LOS */
+#define ALTR_A10SR_SFP_FAULT_SHIFT      3       /* SFPA Fault */
+
+#define ALTR_A10SR_I2C_M_RD_REG      0x19    /* I2C Master Select */
+
+#define ALTR_A10SR_WARM_RST_WR_REG   0x1A    /* HPS Warm Reset */
+#define ALTR_A10SR_WARM_RST_RD_REG   0x1B    /* HPS Warm Reset */
+
+#define ALTR_A10SR_WR_KEY_WR_REG     0x1C    /* HPS Warm Reset Key */
+#define ALTR_A10SR_WR_KEY_RD_REG     0x1D    /* HPS Warm Reset Key */
+
+#define ALTR_A10SR_PMBUS_WR_REG      0x1E    /* HPS PM Bus */
+#define ALTR_A10SR_PMBUS_RD_REG      0x1F    /* HPS PM Bus */
+/* PM Bus Bit Definitions */
+#define ALTR_A10SR_PMBUS_EN_SHIFT       7       /* PMBus FPGA Enable */
+#define ALTR_A10SR_PMBUS_DISN_SHIFT     6       /* PMBus HPS Enable */
+#define ALTR_A10SR_PMBUS_ALERTN_SHIFT   5       /* PMBus Alert */
 
 struct altr_a10sr {
 	struct device *dev;
-- 
1.7.9.5
