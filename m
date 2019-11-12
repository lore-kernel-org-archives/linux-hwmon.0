Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5322C17441
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 22:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92C372196E
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 22:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="g0c3RNh5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfKLWas (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 17:30:48 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:35142 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726995AbfKLWar (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 17:30:47 -0500
Received: from pps.filterd (m0118788.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xACMPS5V012122;
        Tue, 12 Nov 2019 17:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : in-reply-to : references;
 s=pps-02182019; bh=acOx4v5MhABcuZHs/7evRpKAsK5Y4sacM+deosWFgzE=;
 b=g0c3RNh5LKVl+2aLFagwocqcTIgvsTEwL+s28ExkiTPksdxgSmg2gyDXvjZLDylEVDjj
 0n+B/WK/PlaKsZOwjlXxizdNnCMviO/m+6R6QWuOuZCp8f0LitB8e/ZsTXlsE9ds8kq1
 qfb3yEoeg2WYKvFEmqVzfVtIwHax1j4c2iXQug6xnaKmNH08TRDTpqQUMBcN6litBprc
 h0GcMww3AQbCfyxEQNG9PeHQvTFGBADmkcSE442fICWvDxYxUnaBUq7lJkDJchkRPdA2
 8fTf6iy7xYBfLudvuqieuNWnzkATZMjTjCuLgQNcNdVcrgp/f45rWAnLQevMXPwZ0IOD EQ== 
Received: from pp-smtp-01.acuitylightinggroup.com ([192.234.69.190])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w6bavu313-1;
        Tue, 12 Nov 2019 17:28:57 -0500
Received: from pps.filterd (pp-smtp-01.acuitylightinggroup.com [127.0.0.1])
        by pp-smtp-01.acuitylightinggroup.com (8.16.0.27/8.16.0.27) with SMTP id xACMQm8O020048;
        Tue, 12 Nov 2019 17:28:57 -0500
Received: from inf-dsk-207.acuitylightinggroup.com (inf-dsk-207.acuitylightinggroup.com [10.59.79.18])
        by pp-smtp-01.acuitylightinggroup.com with ESMTP id 2w5uadrkkm-3;
        Tue, 12 Nov 2019 17:28:57 -0500
From:   Eric Tremblay <etremblay@distech-controls.com>
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
Subject: [PATCH v8 2/2] hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.
Date:   Tue, 12 Nov 2019 17:30:01 -0500
Message-Id: <20191112223001.20844-3-etremblay@distech-controls.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112223001.20844-1-etremblay@distech-controls.com>
References: <20191112223001.20844-1-etremblay@distech-controls.com>
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Reason: safe
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TI's TMP512/513 are I2C/SMBus system monitor chips. These chips
monitor the supply voltage, supply current, power consumption
and provide one local and up to three (TMP513) remote temperature sensors.

It has been tested using a TI TMP513 development kit (TMP513EVM)

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/tmp513.rst | 103 +++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/Kconfig          |  10 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/tmp513.c         | 772 +++++++++++++++++++++++++++++++++
 6 files changed, 894 insertions(+)
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 230ad59b462b..d708a371fce1 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -153,6 +153,7 @@ Hardware Monitoring Kernel Drivers
    tmp108
    tmp401
    tmp421
+   tmp513
    tps40422
    twl4030-madc-hwmon
    ucd9000
diff --git a/Documentation/hwmon/tmp513.rst b/Documentation/hwmon/tmp513.rst
new file mode 100644
index 000000000000..6c8fae4b1a75
--- /dev/null
+++ b/Documentation/hwmon/tmp513.rst
@@ -0,0 +1,103 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver tmp513
+====================
+
+Supported chips:
+
+  * Texas Instruments TMP512
+
+    Prefix: 'tmp512'
+
+    Datasheet: http://www.ti.com/lit/ds/symlink/tmp512.pdf
+
+  * Texas Instruments TMP513
+
+    Prefix: 'tmp513'
+
+    Datasheet: http://www.ti.com/lit/ds/symlink/tmp513.pdf
+
+Authors:
+
+	Eric Tremblay <etremblay@distech-controls.com>
+
+Description
+-----------
+
+This driver implements support for Texas Instruments TMP512, and TMP513.
+The TMP512 (dual-channel) and TMP513 (triple-channel) are system monitors
+that include remote sensors, a local temperature sensor, and a high-side current
+shunt monitor. These system monitors have the capability of measuring remote
+temperatures, on-chip temperatures, and system voltage/power/current
+consumption.
+
+The temperatures are measured in degrees Celsius with a range of
+-40 to + 125 degrees with a resolution of 0.0625 degree C.
+
+For hysteresis value, only the first channel is writable. Writing to it
+will affect all other values since each channels are sharing the same
+hysteresis value. The hysteresis is in degrees Celsius with a range of
+0 to 127.5 degrees with a resolution of 0.5 degree.
+
+The driver exports the temperature values via the following sysfs files:
+
+**temp[1-4]_input**
+
+**temp[1-4]_crit**
+
+**temp[1-4]_crit_alarm**
+
+**temp[1-4]_crit_hyst**
+
+The driver read the shunt voltage from the chip and convert it to current.
+The readable range depends on the "ti,pga-gain" property (default to 8) and the
+shunt resistor value. The value resolution will be equal to 10uV/Rshunt.
+
+The driver exports the shunt currents values via the following sysFs files:
+
+**curr1_input**
+
+**curr1_lcrit**
+
+**curr1_lcrit_alarm**
+
+**curr1_crit**
+
+**curr1_crit_alarm**
+
+The bus voltage range is read from the chip with a resolution of 4mV. The chip
+can be configurable in two different range (32V or 16V) using the
+ti,bus-range-microvolt property in the devicetree.
+
+The driver exports the bus voltage values via the following sysFs files:
+
+**in0_input**
+
+**in0_lcrit**
+
+**in0_lcrit_alarm**
+
+**in0_crit**
+
+**in0_crit_alarm**
+
+The bus power and bus currents range and resolution depends on the calibration
+register value. Those values are calculate by the hardware using those
+formulas:
+
+Current = (ShuntVoltage * CalibrationRegister) / 4096
+Power   = (Current * BusVoltage) / 5000
+
+The driver exports the bus current and bus power values via the following
+sysFs files:
+
+**curr2_input**
+
+**power1_input**
+
+**power1_crit**
+
+**power1_crit_alarm**
+
+The calibration process follow the procedure of the datasheet (without overflow)
+and depend on the shunt resistor value and the pga_gain value.
diff --git a/MAINTAINERS b/MAINTAINERS
index eb19fad370d7..75db98a0913c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16378,6 +16378,13 @@ S:	Maintained
 F:	Documentation/hwmon/tmp401.rst
 F:	drivers/hwmon/tmp401.c
 
+TMP513 HARDWARE MONITOR DRIVER
+M:	Eric Tremblay <etremblay@distech-controls.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/tmp513.rst
+F:	drivers/hwmon/tmp513.c
+
 TMPFS (SHMEM FILESYSTEM)
 M:	Hugh Dickins <hughd@google.com>
 L:	linux-mm@kvack.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 13a6b4afb4b3..926e3c98dbdf 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1709,6 +1709,16 @@ config SENSORS_TMP421
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp421.
 
+config SENSORS_TMP513
+	tristate "Texas Instruments TMP513 and compatibles"
+	depends on I2C
+	help
+	  If you say yes here you get support for Texas Instruments TMP512,
+	  and TMP513 temperature and power supply sensor chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tmp513.
+
 config SENSORS_VEXPRESS
 	tristate "Versatile Express"
 	depends on VEXPRESS_CONFIG
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 40c036ea45e6..762642291914 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -166,6 +166,7 @@ obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
 obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
 obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
+obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
 obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
new file mode 100644
index 000000000000..df66e0bc1253
--- /dev/null
+++ b/drivers/hwmon/tmp513.c
@@ -0,0 +1,772 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Texas Instruments TMP512, TMP513 power monitor chips
+ *
+ * TMP513:
+ * Thermal/Power Management with Triple Remote and
+ * Local Temperature Sensor and Current Shunt Monitor
+ * Datasheet: http://www.ti.com/lit/gpn/tmp513
+ *
+ * TMP512:
+ * Thermal/Power Management with Dual Remote
+ *	and Local Temperature Sensor and Current Shunt Monitor
+ * Datasheet: http://www.ti.com/lit/gpn/tmp512
+ *
+ * Copyright (C) 2019 Eric Tremblay <etremblay@distech-controls.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/util_macros.h>
+
+// Common register definition
+#define TMP51X_SHUNT_CONFIG		0x00
+#define TMP51X_TEMP_CONFIG		0x01
+#define TMP51X_STATUS			0x02
+#define TMP51X_SMBUS_ALERT		0x03
+#define TMP51X_SHUNT_CURRENT_RESULT	0x04
+#define TMP51X_BUS_VOLTAGE_RESULT	0x05
+#define TMP51X_POWER_RESULT		0x06
+#define TMP51X_BUS_CURRENT_RESULT	0x07
+#define TMP51X_LOCAL_TEMP_RESULT	0x08
+#define TMP51X_REMOTE_TEMP_RESULT_1	0x09
+#define TMP51X_REMOTE_TEMP_RESULT_2	0x0A
+#define TMP51X_SHUNT_CURRENT_H_LIMIT	0x0C
+#define TMP51X_SHUNT_CURRENT_L_LIMIT	0x0D
+#define TMP51X_BUS_VOLTAGE_H_LIMIT	0x0E
+#define TMP51X_BUS_VOLTAGE_L_LIMIT	0x0F
+#define TMP51X_POWER_LIMIT		0x10
+#define TMP51X_LOCAL_TEMP_LIMIT	0x11
+#define TMP51X_REMOTE_TEMP_LIMIT_1	0x12
+#define TMP51X_REMOTE_TEMP_LIMIT_2	0x13
+#define TMP51X_SHUNT_CALIBRATION	0x15
+#define TMP51X_N_FACTOR_AND_HYST_1	0x16
+#define TMP51X_N_FACTOR_2		0x17
+#define TMP51X_MAN_ID_REG		0xFE
+#define TMP51X_DEVICE_ID_REG		0xFF
+
+// TMP513 specific register definition
+#define TMP513_REMOTE_TEMP_RESULT_3	0x0B
+#define TMP513_REMOTE_TEMP_LIMIT_3	0x14
+#define TMP513_N_FACTOR_3		0x18
+
+// Common attrs, and NULL
+#define TMP51X_MANUFACTURER_ID		0x55FF
+
+#define TMP512_DEVICE_ID		0x22FF
+#define TMP513_DEVICE_ID		0x23FF
+
+// Default config
+#define TMP51X_SHUNT_CONFIG_DEFAULT	0x399F
+#define TMP51X_SHUNT_VALUE_DEFAULT	1000
+#define TMP51X_VBUS_RANGE_DEFAULT	TMP51X_VBUS_RANGE_32V
+#define TMP51X_PGA_DEFAULT		8
+#define TMP51X_MAX_REGISTER_ADDR	0xFF
+
+#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
+#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
+
+// Mask and shift
+#define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
+#define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
+#define CURRENT_SENSE_VOLTAGE_80_MASK	0x0800
+#define CURRENT_SENSE_VOLTAGE_40_MASK	0
+
+#define TMP51X_BUS_VOLTAGE_MASK		0x2000
+#define TMP51X_NFACTOR_MASK		0xFF00
+#define TMP51X_HYST_MASK		0x00FF
+
+#define TMP51X_BUS_VOLTAGE_SHIFT	3
+#define TMP51X_TEMP_SHIFT		3
+
+// Alarms
+#define TMP51X_SHUNT_CURRENT_H_LIMIT_POS	15
+#define TMP51X_SHUNT_CURRENT_L_LIMIT_POS	14
+#define TMP51X_BUS_VOLTAGE_H_LIMIT_POS		13
+#define TMP51X_BUS_VOLTAGE_L_LIMIT_POS		12
+#define TMP51X_POWER_LIMIT_POS			11
+#define TMP51X_LOCAL_TEMP_LIMIT_POS		10
+#define TMP51X_REMOTE_TEMP_LIMIT_1_POS		9
+#define TMP51X_REMOTE_TEMP_LIMIT_2_POS		8
+#define TMP513_REMOTE_TEMP_LIMIT_3_POS		7
+
+#define TMP51X_VBUS_RANGE_32V		32000000
+#define TMP51X_VBUS_RANGE_16V		16000000
+
+// Max and Min value
+#define MAX_BUS_VOLTAGE_32_LIMIT	32764
+#define MAX_BUS_VOLTAGE_16_LIMIT	16382
+
+// Max possible value is -256 to +256 but datasheet indicated -40 to 125.
+#define MAX_TEMP_LIMIT			125000
+#define MIN_TEMP_LIMIT			-40000
+
+#define MAX_TEMP_HYST			127500
+
+static const u8 TMP51X_TEMP_INPUT[4] = {
+	TMP51X_LOCAL_TEMP_RESULT,
+	TMP51X_REMOTE_TEMP_RESULT_1,
+	TMP51X_REMOTE_TEMP_RESULT_2,
+	TMP513_REMOTE_TEMP_RESULT_3
+};
+
+static const u8 TMP51X_TEMP_CRIT[4] = {
+	TMP51X_LOCAL_TEMP_LIMIT,
+	TMP51X_REMOTE_TEMP_LIMIT_1,
+	TMP51X_REMOTE_TEMP_LIMIT_2,
+	TMP513_REMOTE_TEMP_LIMIT_3
+};
+
+static const u8 TMP51X_TEMP_CRIT_ALARM[4] = {
+	TMP51X_LOCAL_TEMP_LIMIT_POS,
+	TMP51X_REMOTE_TEMP_LIMIT_1_POS,
+	TMP51X_REMOTE_TEMP_LIMIT_2_POS,
+	TMP513_REMOTE_TEMP_LIMIT_3_POS
+};
+
+static const u8 TMP51X_TEMP_CRIT_HYST[4] = {
+	TMP51X_N_FACTOR_AND_HYST_1,
+	TMP51X_N_FACTOR_AND_HYST_1,
+	TMP51X_N_FACTOR_AND_HYST_1,
+	TMP51X_N_FACTOR_AND_HYST_1
+};
+
+static const u8 TMP51X_CURR_INPUT[2] = {
+	TMP51X_SHUNT_CURRENT_RESULT,
+	TMP51X_BUS_CURRENT_RESULT
+};
+
+static struct regmap_config tmp51x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = TMP51X_MAX_REGISTER_ADDR,
+};
+
+enum tmp51x_ids {
+	tmp512, tmp513
+};
+
+struct tmp51x_data {
+	u16 shunt_config;
+	u16 pga_gain;
+	u32 vbus_range_uvolt;
+
+	u16 temp_config;
+	u32 nfactor[3];
+
+	u32 shunt_uohms;
+
+	u32 curr_lsb_ua;
+	u32 pwr_lsb_uw;
+
+	enum tmp51x_ids id;
+	struct regmap *regmap;
+};
+
+// Set the shift based on the gain 8=4, 4=3, 2=2, 1=1
+static inline u8 tmp51x_get_pga_shift(struct tmp51x_data *data)
+{
+	return 5 - ffs(data->pga_gain);
+}
+
+static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
+			    unsigned int regval, long *val)
+{
+	switch (reg) {
+	case TMP51X_STATUS:
+		*val = (regval >> pos) & 1;
+		break;
+	case TMP51X_SHUNT_CURRENT_RESULT:
+	case TMP51X_SHUNT_CURRENT_H_LIMIT:
+	case TMP51X_SHUNT_CURRENT_L_LIMIT:
+		/*
+		 * The valus is read in voltage in the chip but reported as
+		 * current to the user.
+		 * 2's compliment number shifted by one to four depending
+		 * on the pga gain setting. 1lsb = 10uV
+		 */
+		*val = sign_extend32(regval, 17 - tmp51x_get_pga_shift(data));
+		*val = DIV_ROUND_CLOSEST(*val * 10000, data->shunt_uohms);
+		break;
+	case TMP51X_BUS_VOLTAGE_RESULT:
+	case TMP51X_BUS_VOLTAGE_H_LIMIT:
+	case TMP51X_BUS_VOLTAGE_L_LIMIT:
+		// 1lsb = 4mV
+		*val = (regval >> TMP51X_BUS_VOLTAGE_SHIFT) * 4;
+		break;
+	case TMP51X_POWER_RESULT:
+	case TMP51X_POWER_LIMIT:
+		// Power = (current * BusVoltage) / 5000
+		*val = regval * data->pwr_lsb_uw;
+		break;
+	case TMP51X_BUS_CURRENT_RESULT:
+		// Current = (ShuntVoltage * CalibrationRegister) / 4096
+		*val = sign_extend32(regval, 16) * data->curr_lsb_ua;
+		*val = DIV_ROUND_CLOSEST(*val, 1000);
+		break;
+	case TMP51X_LOCAL_TEMP_RESULT:
+	case TMP51X_REMOTE_TEMP_RESULT_1:
+	case TMP51X_REMOTE_TEMP_RESULT_2:
+	case TMP513_REMOTE_TEMP_RESULT_3:
+	case TMP51X_LOCAL_TEMP_LIMIT:
+	case TMP51X_REMOTE_TEMP_LIMIT_1:
+	case TMP51X_REMOTE_TEMP_LIMIT_2:
+	case TMP513_REMOTE_TEMP_LIMIT_3:
+		// 1lsb = 0.0625 degrees centigrade
+		*val = sign_extend32(regval, 16) >> TMP51X_TEMP_SHIFT;
+		*val = DIV_ROUND_CLOSEST(*val * 625, 10);
+		break;
+	case TMP51X_N_FACTOR_AND_HYST_1:
+		// 1lsb = 0.5 degrees centigrade
+		*val = (regval & TMP51X_HYST_MASK) * 500;
+		break;
+	default:
+		// Programmer goofed
+		WARN_ON_ONCE(1);
+		*val = 0;
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int tmp51x_set_value(struct tmp51x_data *data, u8 reg, long val)
+{
+	int regval, max_val;
+	u32 mask = 0;
+
+	switch (reg) {
+	case TMP51X_SHUNT_CURRENT_H_LIMIT:
+	case TMP51X_SHUNT_CURRENT_L_LIMIT:
+		/*
+		 * The user enter current value and we convert it to
+		 * voltage. 1lsb = 10uV
+		 */
+		val = DIV_ROUND_CLOSEST(val * data->shunt_uohms, 10000);
+		max_val = U16_MAX >> tmp51x_get_pga_shift(data);
+		regval = clamp_val(val, -max_val, max_val);
+		break;
+	case TMP51X_BUS_VOLTAGE_H_LIMIT:
+	case TMP51X_BUS_VOLTAGE_L_LIMIT:
+		// 1lsb = 4mV
+		max_val = (data->vbus_range_uvolt == TMP51X_VBUS_RANGE_32V) ?
+			MAX_BUS_VOLTAGE_32_LIMIT : MAX_BUS_VOLTAGE_16_LIMIT;
+
+		val = clamp_val(DIV_ROUND_CLOSEST(val, 4), 0, max_val);
+		regval = val << TMP51X_BUS_VOLTAGE_SHIFT;
+		break;
+	case TMP51X_POWER_LIMIT:
+		regval = clamp_val(DIV_ROUND_CLOSEST(val, data->pwr_lsb_uw), 0,
+				   U16_MAX);
+		break;
+	case TMP51X_LOCAL_TEMP_LIMIT:
+	case TMP51X_REMOTE_TEMP_LIMIT_1:
+	case TMP51X_REMOTE_TEMP_LIMIT_2:
+	case TMP513_REMOTE_TEMP_LIMIT_3:
+		// 1lsb = 0.0625 degrees centigrade
+		val = clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
+		regval = DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TEMP_SHIFT;
+		break;
+	case TMP51X_N_FACTOR_AND_HYST_1:
+		// 1lsb = 0.5 degrees centigrade
+		val = clamp_val(val, 0, MAX_TEMP_HYST);
+		regval = DIV_ROUND_CLOSEST(val, 500);
+		mask = TMP51X_HYST_MASK;
+		break;
+	default:
+		// Programmer goofed
+		WARN_ON_ONCE(1);
+		return -EOPNOTSUPP;
+	}
+
+	if (mask == 0)
+		return regmap_write(data->regmap, reg, regval);
+	else
+		return regmap_update_bits(data->regmap, reg, mask, regval);
+}
+
+static u8 tmp51x_get_reg(enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return TMP51X_TEMP_INPUT[channel];
+		case hwmon_temp_crit_alarm:
+			return TMP51X_STATUS;
+		case hwmon_temp_crit:
+			return TMP51X_TEMP_CRIT[channel];
+		case hwmon_temp_crit_hyst:
+			return TMP51X_TEMP_CRIT_HYST[channel];
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return TMP51X_BUS_VOLTAGE_RESULT;
+		case hwmon_in_lcrit_alarm:
+		case hwmon_in_crit_alarm:
+			return TMP51X_STATUS;
+		case hwmon_in_lcrit:
+			return TMP51X_BUS_VOLTAGE_L_LIMIT;
+		case hwmon_in_crit:
+			return TMP51X_BUS_VOLTAGE_H_LIMIT;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			return TMP51X_CURR_INPUT[channel];
+		case hwmon_curr_lcrit_alarm:
+		case hwmon_curr_crit_alarm:
+			return TMP51X_STATUS;
+		case hwmon_curr_lcrit:
+			return TMP51X_SHUNT_CURRENT_L_LIMIT;
+		case hwmon_curr_crit:
+			return TMP51X_SHUNT_CURRENT_H_LIMIT;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			return TMP51X_POWER_RESULT;
+		case hwmon_power_crit_alarm:
+			return TMP51X_STATUS;
+		case hwmon_power_crit:
+			return TMP51X_POWER_LIMIT;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static u8 tmp51x_get_status_pos(enum hwmon_sensor_types type, u32 attr,
+				int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_crit_alarm:
+			return TMP51X_TEMP_CRIT_ALARM[channel];
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_lcrit_alarm:
+			return TMP51X_BUS_VOLTAGE_L_LIMIT_POS;
+		case hwmon_in_crit_alarm:
+			return TMP51X_BUS_VOLTAGE_H_LIMIT_POS;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_lcrit_alarm:
+			return TMP51X_SHUNT_CURRENT_L_LIMIT_POS;
+		case hwmon_curr_crit_alarm:
+			return TMP51X_SHUNT_CURRENT_H_LIMIT_POS;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_crit_alarm:
+			return TMP51X_POWER_LIMIT_POS;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int tmp51x_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct tmp51x_data *data = dev_get_drvdata(dev);
+	int ret;
+	u32 regval;
+	u8 pos = 0, reg = 0;
+
+	reg = tmp51x_get_reg(type, attr, channel);
+	if (reg == 0)
+		return -EOPNOTSUPP;
+
+	if (reg == TMP51X_STATUS)
+		pos = tmp51x_get_status_pos(type, attr, channel);
+
+	ret = regmap_read(data->regmap, reg, &regval);
+	if (ret < 0)
+		return ret;
+
+	return tmp51x_get_value(data, reg, pos, regval, val);
+}
+
+static int tmp51x_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	u8 reg = 0;
+
+	reg = tmp51x_get_reg(type, attr, channel);
+	if (reg == 0)
+		return -EOPNOTSUPP;
+
+	return tmp51x_set_value(dev_get_drvdata(dev), reg, val);
+}
+
+static umode_t tmp51x_is_visible(const void *_data,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel)
+{
+	const struct tmp51x_data *data = _data;
+
+	switch (type) {
+	case hwmon_temp:
+		if (data->id == tmp512 && channel == 4)
+			return 0;
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_crit_alarm:
+			return 0444;
+		case hwmon_temp_crit:
+			return 0644;
+		case hwmon_temp_crit_hyst:
+			if (channel == 0)
+				return 0644;
+			return 0444;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_lcrit_alarm:
+		case hwmon_in_crit_alarm:
+			return 0444;
+		case hwmon_in_lcrit:
+		case hwmon_in_crit:
+			return 0644;
+		}
+		break;
+	case hwmon_curr:
+		if (!data->shunt_uohms)
+			return 0;
+
+		switch (attr) {
+		case hwmon_curr_input:
+		case hwmon_curr_lcrit_alarm:
+		case hwmon_curr_crit_alarm:
+			return 0444;
+		case hwmon_curr_lcrit:
+		case hwmon_curr_crit:
+			return 0644;
+		}
+		break;
+	case hwmon_power:
+		if (!data->shunt_uohms)
+			return 0;
+
+		switch (attr) {
+		case hwmon_power_input:
+		case hwmon_power_crit_alarm:
+			return 0444;
+		case hwmon_power_crit:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *tmp51x_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_CRIT | HWMON_I_CRIT_ALARM),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LCRIT | HWMON_C_LCRIT_ALARM |
+			   HWMON_C_CRIT | HWMON_C_CRIT_ALARM,
+			   HWMON_C_INPUT),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
+	NULL
+};
+
+static const struct hwmon_ops tmp51x_hwmon_ops = {
+	.is_visible = tmp51x_is_visible,
+	.read = tmp51x_read,
+	.write = tmp51x_write,
+};
+
+static const struct hwmon_chip_info tmp51x_chip_info = {
+	.ops = &tmp51x_hwmon_ops,
+	.info = tmp51x_info,
+};
+
+/*
+ * Calibrate the tmp51x following the datasheet method
+ */
+static int tmp51x_calibrate(struct tmp51x_data *data)
+{
+	int vshunt_max = data->pga_gain * 40;
+	u64 max_curr_ma;
+	u32 div;
+
+	/*
+	 * If shunt_uohms is equal to 0, the calibration should be set to 0.
+	 * The consequence will be that the current and power measurement engine
+	 * of the sensor will not work. Temperature and voltage sensing will
+	 * continue to work.
+	 */
+	if (data->shunt_uohms == 0)
+		return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION, 0);
+
+	max_curr_ma = DIV_ROUND_CLOSEST_ULL(vshunt_max * 1000 * 1000,
+					    data->shunt_uohms);
+
+	/*
+	 * Calculate the minimal bit resolution for the current and the power.
+	 * Those values will be used during register interpretation.
+	 */
+	data->curr_lsb_ua = DIV_ROUND_CLOSEST_ULL(max_curr_ma * 1000, 32767);
+	data->pwr_lsb_uw = 20 * data->curr_lsb_ua;
+
+	div = DIV_ROUND_CLOSEST_ULL(data->curr_lsb_ua * data->shunt_uohms,
+				    1000 * 1000);
+
+	return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION,
+			    DIV_ROUND_CLOSEST(40960, div));
+}
+
+/*
+ * Initialize the configuration and calibration registers.
+ */
+static int tmp51x_init(struct tmp51x_data *data)
+{
+	unsigned int regval;
+	int ret = regmap_write(data->regmap, TMP51X_SHUNT_CONFIG,
+			       data->shunt_config);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, TMP51X_TEMP_CONFIG, data->temp_config);
+	if (ret < 0)
+		return ret;
+
+	// nFactor configuration
+	ret = regmap_update_bits(data->regmap, TMP51X_N_FACTOR_AND_HYST_1,
+				 TMP51X_NFACTOR_MASK, data->nfactor[0] << 8);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, TMP51X_N_FACTOR_2,
+			   data->nfactor[1] << 8);
+	if (ret < 0)
+		return ret;
+
+	if (data->id == tmp513) {
+		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
+				   data->nfactor[2] << 8);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = tmp51x_calibrate(data);
+	if (ret < 0)
+		return ret;
+
+	// Read the status register before using as the datasheet propose
+	return regmap_read(data->regmap, TMP51X_STATUS, &regval);
+}
+
+static const struct i2c_device_id tmp51x_id[] = {
+	{ "tmp512", tmp512 },
+	{ "tmp513", tmp513 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tmp51x_id);
+
+static const struct of_device_id tmp51x_of_match[] = {
+	{
+		.compatible = "ti,tmp512",
+		.data = (void *)tmp512
+	},
+	{
+		.compatible = "ti,tmp513",
+		.data = (void *)tmp513
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tmp51x_of_match);
+
+static int tmp51x_vbus_range_to_reg(struct device *dev,
+				    struct tmp51x_data *data)
+{
+	if (data->vbus_range_uvolt == TMP51X_VBUS_RANGE_32V) {
+		data->shunt_config |= TMP51X_BUS_VOLTAGE_MASK;
+	} else if (data->vbus_range_uvolt == TMP51X_VBUS_RANGE_16V) {
+		data->shunt_config &= ~TMP51X_BUS_VOLTAGE_MASK;
+	} else {
+		dev_err(dev, "ti,bus-range-microvolt is invalid: %u\n",
+			data->vbus_range_uvolt);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int tmp51x_pga_gain_to_reg(struct device *dev, struct tmp51x_data *data)
+{
+	if (data->pga_gain == 8) {
+		data->shunt_config |= CURRENT_SENSE_VOLTAGE_320_MASK;
+	} else if (data->pga_gain == 4) {
+		data->shunt_config |= CURRENT_SENSE_VOLTAGE_160_MASK;
+	} else if (data->pga_gain == 2) {
+		data->shunt_config |= CURRENT_SENSE_VOLTAGE_80_MASK;
+	} else if (data->pga_gain == 1) {
+		data->shunt_config |= CURRENT_SENSE_VOLTAGE_40_MASK;
+	} else {
+		dev_err(dev, "ti,pga-gain is invalid: %u\n", data->pga_gain);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
+{
+	int ret;
+	u32 nfactor[3];
+	u32 val;
+
+	ret = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
+	data->shunt_uohms = (ret >= 0) ? val : TMP51X_SHUNT_VALUE_DEFAULT;
+
+	ret = device_property_read_u32(dev, "ti,bus-range-microvolt", &val);
+	data->vbus_range_uvolt = (ret >= 0) ? val : TMP51X_VBUS_RANGE_DEFAULT;
+	ret = tmp51x_vbus_range_to_reg(dev, data);
+	if (ret < 0)
+		return ret;
+
+	ret = device_property_read_u32(dev, "ti,pga-gain", &val);
+	data->pga_gain = (ret >= 0) ? val : TMP51X_PGA_DEFAULT;
+	ret = tmp51x_pga_gain_to_reg(dev, data);
+	if (ret < 0)
+		return ret;
+
+	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
+					    (data->id == tmp513) ? 3 : 2);
+	if (ret >= 0)
+		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
+
+	// Check if shunt value is compatible with pga-gain
+	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
+		dev_err(dev, "shunt-resistor: %u too big for pga_gain: %u\n",
+			data->shunt_uohms, data->pga_gain);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void tmp51x_use_default(struct tmp51x_data *data)
+{
+	data->vbus_range_uvolt = TMP51X_VBUS_RANGE_DEFAULT;
+	data->pga_gain = TMP51X_PGA_DEFAULT;
+	data->shunt_uohms = TMP51X_SHUNT_VALUE_DEFAULT;
+}
+
+static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
+{
+	data->shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT;
+	data->temp_config = (data->id == tmp513) ?
+			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
+
+	if (dev->of_node)
+		return tmp51x_read_properties(dev, data);
+
+	tmp51x_use_default(data);
+
+	return 0;
+}
+
+static int tmp51x_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct tmp51x_data *data;
+	struct device *hwmon_dev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	if (client->dev.of_node)
+		data->id = (enum tmp51x_ids)device_get_match_data(&client->dev);
+	else
+		data->id = id->driver_data;
+
+	ret = tmp51x_configure(dev, data);
+	if (ret < 0) {
+		dev_err(dev, "error configuring the device: %d\n", ret);
+		return ret;
+	}
+
+	data->regmap = devm_regmap_init_i2c(client, &tmp51x_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(data->regmap);
+	}
+
+	ret = tmp51x_init(data);
+	if (ret < 0) {
+		dev_err(dev, "error configuring the device: %d\n", ret);
+		return -ENODEV;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &tmp51x_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_dbg(dev, "power monitor %s\n", id->name);
+
+	return 0;
+}
+
+static struct i2c_driver tmp51x_driver = {
+	.driver = {
+		.name	= "tmp51x",
+		.of_match_table = of_match_ptr(tmp51x_of_match),
+	},
+	.probe		= tmp51x_probe,
+	.id_table	= tmp51x_id,
+};
+
+module_i2c_driver(tmp51x_driver);
+
+MODULE_AUTHOR("Eric Tremblay <etremblay@distechcontrols.com>");
+MODULE_DESCRIPTION("tmp51x driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

