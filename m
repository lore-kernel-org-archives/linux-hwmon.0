Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744F15530D;
	Mon, 29 Jan 2024 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706544654; cv=none; b=dMIecMz+QvpcYfvTKXw9QU0YjkYmWrbEbc8ldaTFjolMVzEFeumzzZyRa38f6gWY6kBye1bhU8GFSdO/RTa/YDWGdDTCBNAJV2XkslJd5FomxMY9B4n7/DEZBgJusmemEXRBQ1a9umUaX73BZ/a2SzWYju+1X4NdZ9Z3duAFnWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706544654; c=relaxed/simple;
	bh=20zo/YdExJVk6RjcGgE7TjgdO8aE8ZmtcjeXo2nGPIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sYZQDOQyBb6tDy2yOg6bYMugDhZzEuCClfbdIpaLLfPK1LQD5ohsSqXBdaL/n4WpvuC5YK4EuxDRauL4o+ssjXSU4B8Cgu4hT914tmvQyQcMtimtU5sgDtz2+ZdlUmZ9v/xbcWBGJ8/e33lZ1Frnv80+Yd1Lht7GV34dsEfPuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=SryhyDG6; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="SryhyDG6"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TEl4Un021517;
	Mon, 29 Jan 2024 11:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=DKIM; bh=+jKyppjRkcCWSQehvndNC5v9El3pSTnOUK5YDSDSSOE=; b=
	SryhyDG6/RbWo+7mOj30oOSBvAwKJGNI8facLZsIs6KVYBAL9q6BQp6bZaUK26WJ
	q1T7CwLE38F78t0Ol3UE9cBCMWngvGrqHSTJ862jVbyhJh4TB3B7LgcBqIhD/WX6
	BYMddcNHUdHY6+0j3ch99G0/9LmmrPyaKQPf5E/AHp32h02s/MkxcRpknSb7UmFX
	nNdWcZ6A5LBKUp34s6BWt2QR1FbUr4CFwNNe2lQwwTOWK9L5+Br8Rn6Q5Tz0tMss
	PCocnjOXKVJK45/F7m844KcWKONF++IkydofH0syUfpBIa83b4boVHoTGBXosRWi
	qxpeotxHIq6YnuDRPc9/bA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3vxe398afu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 11:10:30 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 40TGAT3m050405
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 11:10:29 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 29 Jan 2024 11:10:28 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 29 Jan 2024 11:10:26 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 29 Jan 2024 11:10:26 -0500
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 40TGA9Ci002356;
	Mon, 29 Jan 2024 11:10:21 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 29 Jan 2024 17:13:25 +0100
Subject: [PATCH RESEND v4 3/3] hwmon: ltc4282: add support for the LTC4282
 chip
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240129-b4-ltc4282-support-v4-3-fe75798164cc@analog.com>
References: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
In-Reply-To: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706544807; l=59586;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=20zo/YdExJVk6RjcGgE7TjgdO8aE8ZmtcjeXo2nGPIY=;
 b=70QJtvUpseK08mMiQ9n9SVAsU58lUAu5bKCiX8FSyaSkNXfRVvXnH0Pll1kR4OpQHkKtYytd4
 xcDy0xNVnI7Bqdj3jg7Xt1CcFY56zxS/kjk/1AZUFmTee3Ijc8p5i98
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 9oUtejJ4rmeoOGbyOp9h0fYrT-Qj6UjM
X-Proofpoint-ORIG-GUID: 9oUtejJ4rmeoOGbyOp9h0fYrT-Qj6UjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_10,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290118

The LTC4282 hot swap controller allows a board to be safely inserted and
removed from a live backplane. Using one or more external N-channel pass
transistors, board supply voltage and inrush current are ramped up at an
adjustable rate. An I2C interface and onboard ADC allows for monitoring
of board current, voltage, power, energy and fault status.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 Documentation/hwmon/index.rst   |    1 +
 Documentation/hwmon/ltc4282.rst |  133 +++
 MAINTAINERS                     |    2 +
 drivers/hwmon/Kconfig           |   11 +
 drivers/hwmon/Makefile          |    1 +
 drivers/hwmon/ltc4282.c         | 1784 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 1932 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c7ed1f73ac06..f16c6dfaec7d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -129,6 +129,7 @@ Hardware Monitoring Kernel Drivers
    ltc4245
    ltc4260
    ltc4261
+   ltc4282
    ltc4286
    max127
    max15301
diff --git a/Documentation/hwmon/ltc4282.rst b/Documentation/hwmon/ltc4282.rst
new file mode 100644
index 000000000000..a87ec3564998
--- /dev/null
+++ b/Documentation/hwmon/ltc4282.rst
@@ -0,0 +1,133 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel drivers ltc4282
+==========================================
+
+Supported chips:
+
+  * Analog Devices LTC4282
+
+    Prefix: 'ltc4282'
+
+    Addresses scanned: - I2C 0x40 - 0x5A (7-bit)
+    Addresses scanned: - I2C 0x80 - 0xB4 with a step of 2 (8-bit)
+
+    Datasheet:
+
+        https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4282.pdf
+
+Author: Nuno Sá <nuno.sa@analog.com>
+
+Description
+___________
+
+The LTC4282 hot swap controller allows a board to be safely inserted and removed
+from a live backplane. Using one or more external N-channel pass transistors,
+board supply voltage and inrush current are ramped up at an adjustable rate. An
+I2C interface and onboard ADC allows for monitoring of board current, voltage,
+power, energy and fault status. The device features analog foldback current
+limiting and supply monitoring for applications from 2.9V to 33V. Dual 12V gate
+drive allows high power applications to either share safe operating area across
+parallel MOSFETs or support a 2-stage start-up that first charges the load
+capacitance followed by enabling a low on-resistance path to the load. The
+LTC4282 is well suited to high power applications because the precise monitoring
+capability and accurate current limiting reduce the extremes in which both loads
+and power supplies must safely operate. Non-volatile configuration allows for
+flexibility in the autonomous generation of alerts and response to faults.
+
+Sysfs entries
+_____________
+
+The following attributes are supported. Limits are read-write and all the other
+attributes are read-only. Note that in0 and in1 are mutually exclusive. Enabling
+one disables the other and disabling one enables the other.
+
+======================= ==========================================
+in0_input		Output voltage (mV).
+in0_min			Undervoltage threshold
+in0_max                 Overvoltage threshold
+in0_lowest		Lowest measured voltage
+in0_highest		Highest measured voltage
+in0_reset_history	Write 1 to reset in0 history.
+			Also clears fet bad and short fault logs.
+in0_min_alarm		Undervoltage alarm
+in0_max_alarm           Overvoltage alarm
+in0_enable		Enable/Disable VSOURCE monitoring
+in0_fault		Failure in the MOSFETs. Either bad or shorted FET.
+in0_label		Channel label (VSOURCE)
+
+in1_input		Input voltage (mV).
+in1_min			Undervoltage threshold
+in1_max                 Overvoltage threshold
+in1_lowest		Lowest measured voltage
+in1_highest		Highest measured voltage
+in1_reset_history	Write 1 to reset in1 history.
+			Also clears over/undervoltage fault logs.
+in1_min_alarm		Undervoltage alarm
+in1_max_alarm           Overvoltage alarm
+in1_lcrit_alarm         Critical Undervoltage alarm
+in1_crit_alarm          Critical Overvoltage alarm
+in1_enable		Enable/Disable VDD monitoring
+in1_label		Channel label (VDD)
+
+in2_input		GPIO voltage (mV)
+in2_min			Undervoltage threshold
+in2_max			Overvoltage threshold
+in2_lowest		Lowest measured voltage
+in2_highest		Highest measured voltage
+in2_reset_history	Write 1 to reset in2 history
+in2_min_alarm		Undervoltage alarm
+in2_max_alarm		Overvoltage alarm
+in2_label		Channel label (VGPIO)
+
+curr1_input		Sense current (mA)
+curr1_min		Undercurrent threshold
+curr1_max		Overcurrent threshold
+curr1_lowest		Lowest measured current
+curr1_highest		Highest measured current
+curr1_reset_history	Write 1 to reset curr1 history.
+			Also clears overcurrent fault logs.
+curr1_min_alarm		Undercurrent alarm
+curr1_max_alarm		Overcurrent alarm
+curr1_crit_alarm        Critical Overcurrent alarm
+curr1_label		Channel label (ISENSE)
+
+power1_input		Power (in uW)
+power1_min		Low power threshold
+power1_max		High power threshold
+power1_input_lowest	Historical minimum power use
+power1_input_highest	Historical maximum power use
+power1_reset_history	Write 1 to reset power1 history.
+			Also clears power bad fault logs.
+power1_min_alarm	Low power alarm
+power1_max_alarm	High power alarm
+power1_label		Channel label (Power)
+
+energy1_input		Measured energy over time (in microJoule)
+energy1_enable		Enable/Disable Energy accumulation
+======================= ==========================================
+
+DebugFs entries
+_______________
+
+The chip also has a fault log register where failures can be logged. Hence,
+as these are logging events, we give access to them in debugfs. Note that
+even if some failure is detected in these logs, it does necessarily mean
+that the failure is still present. As mentioned in the proper Sysfs entries,
+these logs can be cleared by writing in the proper reset_history attribute.
+
+.. warning:: The debugfs interface is subject to change without notice
+             and is only available when the kernel is compiled with
+             ``CONFIG_DEBUG_FS`` defined.
+
+``/sys/kernel/debug/ltc4282-hwmon[X]/``
+contains the following attributes:
+
+=======================  ==========================================
+power1_bad_fault_log     Set to 1 by a power1 bad fault occurring.
+in0_fet_short_fault_log	 Set to 1 when the ADC detects a FET-short fault.
+in0_fet_bad_fault_log    Set to 1 when a FET-BAD fault occurs.
+in1_crit_fault_log       Set to 1 by a VDD overvoltage fault occurring.
+in1_lcrit_fault_log      Set to 1 by a VDD undervoltage fault occurring.
+curr1_crit_fault_log	 Set to 1 by an overcurrent fault occurring.
+=======================  ==========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 3c5f7ae166f0..e49eea8b1806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12764,6 +12764,8 @@ M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
+F:	Documentation/hwmon/ltc4282.rst
+F:	drivers/hwmon/ltc4282.c
 
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index a608264da87d..f6160cc70077 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1038,6 +1038,17 @@ config SENSORS_LTC4261
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc4261.
 
+config SENSORS_LTC4282
+	tristate "Analog Devices LTC4282"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for Analog Devices LTC4282
+	  High Current Hot Swap Controller I2C interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ltc4282.
+
 config SENSORS_LTQ_CPUTEMP
 	bool "Lantiq cpu temperature sensor driver"
 	depends on SOC_XWAY
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 47be39af5c03..8bfc422a29e5 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_SENSORS_LTC4222)	+= ltc4222.o
 obj-$(CONFIG_SENSORS_LTC4245)	+= ltc4245.o
 obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
 obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
+obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
 obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
new file mode 100644
index 000000000000..cf4c9cfec8b4
--- /dev/null
+++ b/drivers/hwmon/ltc4282.c
@@ -0,0 +1,1784 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C
+ *
+ * Copyright 2023 Analog Devices Inc.
+ */
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/property.h>
+#include <linux/string.h>
+#include <linux/units.h>
+#include <linux/util_macros.h>
+
+#define LTC4282_CTRL_LSB			0x00
+  #define LTC4282_CTRL_OV_RETRY_MASK		BIT(0)
+  #define LTC4282_CTRL_UV_RETRY_MASK		BIT(1)
+  #define LTC4282_CTRL_OC_RETRY_MASK		BIT(2)
+  #define LTC4282_CTRL_ON_ACTIVE_LOW_MASK	BIT(5)
+  #define LTC4282_CTRL_ON_DELAY_MASK		BIT(6)
+#define LTC4282_CTRL_MSB			0x01
+  #define LTC4282_CTRL_VIN_MODE_MASK		GENMASK(1, 0)
+  #define LTC4282_CTRL_OV_MODE_MASK		GENMASK(3, 2)
+  #define LTC4282_CTRL_UV_MODE_MASK		GENMASK(5, 4)
+#define LTC4282_FAULT_LOG			0x04
+  #define LTC4282_OV_FAULT_MASK			BIT(0)
+  #define LTC4282_UV_FAULT_MASK			BIT(1)
+  #define LTC4282_VDD_FAULT_MASK \
+		(LTC4282_OV_FAULT_MASK | LTC4282_UV_FAULT_MASK)
+  #define LTC4282_OC_FAULT_MASK			BIT(2)
+  #define LTC4282_POWER_BAD_FAULT_MASK		BIT(3)
+  #define LTC4282_FET_SHORT_FAULT_MASK		BIT(5)
+  #define LTC4282_FET_BAD_FAULT_MASK		BIT(6)
+  #define LTC4282_FET_FAILURE_FAULT_MASK \
+		(LTC4282_FET_SHORT_FAULT_MASK | LTC4282_FET_BAD_FAULT_MASK)
+#define LTC4282_ADC_ALERT_LOG			0x05
+  #define LTC4282_GPIO_ALARM_L_MASK		BIT(0)
+  #define LTC4282_GPIO_ALARM_H_MASK		BIT(1)
+  #define LTC4282_VSOURCE_ALARM_L_MASK		BIT(2)
+  #define LTC4282_VSOURCE_ALARM_H_MASK		BIT(3)
+  #define LTC4282_VSENSE_ALARM_L_MASK		BIT(4)
+  #define LTC4282_VSENSE_ALARM_H_MASK		BIT(5)
+  #define LTC4282_POWER_ALARM_L_MASK		BIT(6)
+  #define LTC4282_POWER_ALARM_H_MASK		BIT(7)
+#define LTC4282_FET_BAD_FAULT_TIMEOUT		0x06
+  #define LTC4282_FET_BAD_MAX_TIMEOUT		255
+#define LTC4282_GPIO_CONFIG			0x07
+  #define LTC4282_GPIO_2_FET_STRESS_MASK	BIT(1)
+  #define LTC4282_GPIO_1_CONFIG_MASK		GENMASK(5, 4)
+#define LTC4282_VGPIO_MIN			0x08
+#define LTC4282_VGPIO_MAX			0x09
+#define LTC4282_VSOURCE_MIN			0x0a
+#define LTC4282_VSOURCE_MAX			0x0b
+#define LTC4282_VSENSE_MIN			0x0c
+#define LTC4282_VSENSE_MAX			0x0d
+#define LTC4282_POWER_MIN			0x0e
+#define LTC4282_POWER_MAX			0x0f
+#define LTC4282_CLK_DIV				0x10
+  #define LTC4282_CLK_DIV_MASK			GENMASK(4, 0)
+  #define LTC4282_CLKOUT_MASK			GENMASK(6, 5)
+#define LTC4282_ILIM_ADJUST			0x11
+  #define LTC4282_GPIO_MODE_MASK		BIT(1)
+  #define LTC4282_VDD_MONITOR_MASK		BIT(2)
+  #define LTC4282_FOLDBACK_MODE_MASK		GENMASK(4, 3)
+  #define LTC4282_ILIM_ADJUST_MASK		GENMASK(7, 5)
+#define LTC4282_ENERGY				0x12
+#define LTC4282_TIME_COUNTER			0x18
+#define LTC4282_ALERT_CTRL			0x1c
+  #define LTC4282_ALERT_OUT_MASK		BIT(6)
+#define LTC4282_ADC_CTRL			0x1d
+  #define LTC4282_FAULT_LOG_EN_MASK		BIT(2)
+  #define LTC4282_METER_HALT_MASK		BIT(5)
+  #define LTC4282_METER_RESET_MASK		BIT(6)
+  #define LTC4282_RESET_MASK			BIT(7)
+#define LTC4282_STATUS_LSB			0x1e
+  #define LTC4282_OV_STATUS_MASK		BIT(0)
+  #define LTC4282_UV_STATUS_MASK		BIT(1)
+  #define LTC4282_VDD_STATUS_MASK \
+		(LTC4282_OV_STATUS_MASK | LTC4282_UV_STATUS_MASK)
+  #define LTC4282_OC_STATUS_MASK		BIT(2)
+  #define LTC4282_POWER_GOOD_MASK		BIT(3)
+  #define LTC4282_FET_FAILURE_MASK		GENMASK(6, 5)
+#define LTC4282_STATUS_MSB			0x1f
+#define LTC4282_RESERVED_1			0x32
+#define LTC4282_RESERVED_2			0x33
+#define LTC4282_VGPIO				0x34
+#define LTC4282_VGPIO_LOWEST			0x36
+#define LTC4282_VGPIO_HIGHEST			0x38
+#define LTC4282_VSOURCE				0x3a
+#define LTC4282_VSOURCE_LOWEST			0x3c
+#define LTC4282_VSOURCE_HIGHEST			0x3e
+#define LTC4282_VSENSE				0x40
+#define LTC4282_VSENSE_LOWEST			0x42
+#define LTC4282_VSENSE_HIGHEST			0x44
+#define LTC4282_POWER				0x46
+#define LTC4282_POWER_LOWEST			0x48
+#define LTC4282_POWER_HIGHEST			0x4a
+#define LTC4282_RESERVED_3			0x50
+
+#define LTC4282_CLKIN_MIN	(250 * KILO)
+#define LTC4282_CLKIN_MAX	(15500 * KILO)
+#define LTC4282_CLKIN_RANGE	(LTC4282_CLKIN_MAX - LTC4282_CLKIN_MIN + 1)
+#define LTC4282_CLKOUT_SYSTEM	(250 * KILO)
+#define LTC4282_CLKOUT_CNV	15
+
+enum {
+	LTC4282_CHAN_VSOURCE,
+	LTC4282_CHAN_VDD,
+	LTC4282_CHAN_VGPIO,
+};
+
+struct ltc4282_cache {
+	u32 in_max_raw;
+	u32 in_min_raw;
+	long in_highest;
+	long in_lowest;
+	bool en;
+};
+
+struct ltc4282_state {
+	struct regmap *map;
+	/* Protect against multiple accesses to the device registers */
+	struct mutex lock;
+	struct clk_hw clk_hw;
+	/*
+	 * Used to cache values for VDD/VSOURCE depending which will be used
+	 * when hwmon is not enabled for that channel. Needed because they share
+	 * the same registers.
+	 */
+	struct ltc4282_cache in0_1_cache[LTC4282_CHAN_VGPIO];
+	u32 vsense_max;
+	long power_max;
+	u32 rsense;
+	u16 vdd;
+	u16 vfs_out;
+	bool energy_en;
+};
+
+enum {
+	LTC4282_CLKOUT_NONE,
+	LTC4282_CLKOUT_INT,
+	LTC4282_CLKOUT_TICK,
+};
+
+static int ltc4282_set_rate(struct clk_hw *hw,
+			    unsigned long rate, unsigned long parent_rate)
+{
+	struct ltc4282_state *st = container_of(hw, struct ltc4282_state,
+						clk_hw);
+	u32 val = LTC4282_CLKOUT_INT;
+
+	if (rate == LTC4282_CLKOUT_CNV)
+		val = LTC4282_CLKOUT_TICK;
+
+	return regmap_update_bits(st->map, LTC4282_CLK_DIV, LTC4282_CLKOUT_MASK,
+				  FIELD_PREP(LTC4282_CLKOUT_MASK, val));
+}
+
+/*
+ * Note the 15HZ conversion rate assumes 12bit ADC which is what we are
+ * supporting for now.
+ */
+static const unsigned int ltc4282_out_rates[] = {
+	LTC4282_CLKOUT_CNV, LTC4282_CLKOUT_SYSTEM
+};
+
+static long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	int idx = find_closest(rate, ltc4282_out_rates,
+			       ARRAY_SIZE(ltc4282_out_rates));
+
+	return ltc4282_out_rates[idx];
+}
+
+static unsigned long ltc4282_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent)
+{
+	struct ltc4282_state *st = container_of(hw, struct ltc4282_state,
+						clk_hw);
+	u32 clkdiv;
+	int ret;
+
+	ret = regmap_read(st->map, LTC4282_CLK_DIV, &clkdiv);
+	if (ret)
+		return 0;
+
+	clkdiv = FIELD_GET(LTC4282_CLKOUT_MASK, clkdiv);
+	if (!clkdiv)
+		return 0;
+	if (clkdiv == LTC4282_CLKOUT_INT)
+		return LTC4282_CLKOUT_SYSTEM;
+
+	return LTC4282_CLKOUT_CNV;
+}
+
+static void ltc4282_disable(struct clk_hw *clk_hw)
+{
+	struct ltc4282_state *st = container_of(clk_hw, struct ltc4282_state,
+						clk_hw);
+
+	regmap_clear_bits(st->map, LTC4282_CLK_DIV, LTC4282_CLKOUT_MASK);
+}
+
+static int ltc4282_read_voltage_word(const struct ltc4282_state *st, u32 reg,
+				     u32 fs, long *val)
+{
+	__be16 in;
+	int ret;
+
+	ret = regmap_bulk_read(st->map, reg, &in, sizeof(in));
+	if (ret)
+		return ret;
+
+	/*
+	 * This is also used to calculate current in which case fs comes in
+	 * 10 * uV. Hence the ULL usage.
+	 */
+	*val = DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs, U16_MAX);
+	return 0;
+}
+
+static int ltc4282_read_voltage_byte_cached(const struct ltc4282_state *st,
+					    u32 reg, u32 fs, long *val,
+					    u32 *cached_raw)
+{
+	int ret;
+	u32 in;
+
+	if (cached_raw) {
+		in = *cached_raw;
+	} else {
+		ret = regmap_read(st->map, reg, &in);
+		if (ret)
+			return ret;
+	}
+
+	*val = DIV_ROUND_CLOSEST(in * fs, U8_MAX);
+	return 0;
+}
+
+static int ltc4282_read_voltage_byte(const struct ltc4282_state *st, u32 reg,
+				     u32 fs, long *val)
+{
+	return ltc4282_read_voltage_byte_cached(st, reg, fs, val, NULL);
+}
+
+static int __ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u32 mask,
+				long *val)
+{
+	u32 alarm;
+	int ret;
+
+	ret = regmap_read(st->map, reg, &alarm);
+	if (ret)
+		return ret;
+
+	*val = !!(alarm & mask);
+
+	/* if not status/fault logs, clear the alarm after reading it */
+	if (reg != LTC4282_STATUS_LSB && reg != LTC4282_FAULT_LOG)
+		return regmap_clear_bits(st->map, reg, mask);
+
+	return 0;
+}
+
+static int ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u32 mask,
+			      long *val)
+{
+	guard(mutex)(&st->lock);
+	return __ltc4282_read_alarm(st, reg, mask, val);
+}
+
+static int ltc4282_vdd_source_read_in(struct ltc4282_state *st, u32 channel,
+				      long *val)
+{
+	guard(mutex)(&st->lock);
+	if (!st->in0_1_cache[channel].en)
+		return -ENODATA;
+
+	return ltc4282_read_voltage_word(st, LTC4282_VSOURCE, st->vfs_out, val);
+}
+
+static int ltc4282_vdd_source_read_hist(struct ltc4282_state *st, u32 reg,
+					u32 channel, long *cached, long *val)
+{
+	int ret;
+
+	guard(mutex)(&st->lock);
+	if (!st->in0_1_cache[channel].en) {
+		*val = *cached;
+		return 0;
+	}
+
+	ret = ltc4282_read_voltage_word(st, reg, st->vfs_out, val);
+	if (ret)
+		return ret;
+
+	*cached = *val;
+	return 0;
+}
+
+static int ltc4282_vdd_source_read_lim(struct ltc4282_state *st, u32 reg,
+				       u32 channel, u32 *cached, long *val)
+{
+	guard(mutex)(&st->lock);
+	if (!st->in0_1_cache[channel].en)
+		return ltc4282_read_voltage_byte_cached(st, reg, st->vfs_out,
+							val, cached);
+
+	return ltc4282_read_voltage_byte(st, reg, st->vfs_out, val);
+}
+
+static int ltc4282_vdd_source_read_alm(struct ltc4282_state *st, u32 mask,
+				       u32 channel, long *val)
+{
+	guard(mutex)(&st->lock);
+	if (!st->in0_1_cache[channel].en) {
+		/*
+		 * Do this otherwise alarms can get confused because we clear
+		 * them after reading them. So, if someone mistakenly reads
+		 * VSOURCE right before VDD (or the other way around), we might
+		 * get no alarm just because it was cleared when reading VSOURCE
+		 * and had no time for a new conversion and thus having the
+		 * alarm again.
+		 */
+		*val = 0;
+		return 0;
+	}
+
+	return __ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, mask, val);
+}
+
+static int ltc4282_read_in(struct ltc4282_state *st, u32 attr, long *val,
+			   u32 channel)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_read_voltage_word(st, LTC4282_VGPIO,
+							 1280, val);
+
+		return ltc4282_vdd_source_read_in(st, channel, val);
+	case hwmon_in_highest:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_read_voltage_word(st,
+							 LTC4282_VGPIO_HIGHEST,
+							 1280, val);
+
+		return ltc4282_vdd_source_read_hist(st, LTC4282_VSOURCE_HIGHEST,
+						    channel,
+						    &st->in0_1_cache[channel].in_highest, val);
+	case hwmon_in_lowest:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_read_voltage_word(st, LTC4282_VGPIO_LOWEST,
+							 1280, val);
+
+		return ltc4282_vdd_source_read_hist(st, LTC4282_VSOURCE_LOWEST,
+						    channel,
+						    &st->in0_1_cache[channel].in_lowest, val);
+	case hwmon_in_max_alarm:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+						  LTC4282_GPIO_ALARM_H_MASK,
+						  val);
+
+		return ltc4282_vdd_source_read_alm(st,
+						   LTC4282_VSOURCE_ALARM_H_MASK,
+						   channel, val);
+	case hwmon_in_min_alarm:
+		if (channel == LTC4282_CHAN_VGPIO)
+			ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+					   LTC4282_GPIO_ALARM_L_MASK, val);
+
+		return ltc4282_vdd_source_read_alm(st,
+						   LTC4282_VSOURCE_ALARM_L_MASK,
+						   channel, val);
+	case hwmon_in_crit_alarm:
+		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
+					  LTC4282_OV_STATUS_MASK, val);
+	case hwmon_in_lcrit_alarm:
+		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
+					  LTC4282_UV_STATUS_MASK, val);
+	case hwmon_in_max:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_read_voltage_byte(st, LTC4282_VGPIO_MAX,
+							 1280, val);
+
+		return ltc4282_vdd_source_read_lim(st, LTC4282_VSOURCE_MAX,
+						   channel,
+						   &st->in0_1_cache[channel].in_max_raw, val);
+	case hwmon_in_min:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_read_voltage_byte(st, LTC4282_VGPIO_MIN,
+							 1280, val);
+
+		return ltc4282_vdd_source_read_lim(st, LTC4282_VSOURCE_MIN,
+						   channel,
+						   &st->in0_1_cache[channel].in_min_raw, val);
+	case hwmon_in_enable:
+		scoped_guard(mutex, &st->lock) {
+			*val = st->in0_1_cache[channel].en;
+		}
+		return 0;
+	case hwmon_in_fault:
+		/*
+		 * We report failure if we detect either a fer_bad or a
+		 * fet_short in the status register.
+		 */
+		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
+					  LTC4282_FET_FAILURE_MASK, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_read_current_word(const struct ltc4282_state *st, u32 reg,
+				     long *val)
+{
+	long in;
+	int ret;
+
+	/*
+	 * We pass in full scale in 10 * micro (note that 40 is already
+	 * millivolt) so we have better approximations to calculate current.
+	 */
+	ret = ltc4282_read_voltage_word(st, reg, DECA * 40 * MILLI, &in);
+	if (ret)
+		return ret;
+
+	*val = DIV_ROUND_CLOSEST(in * MILLI, st->rsense);
+
+	return 0;
+}
+
+static int ltc4282_read_current_byte(const struct ltc4282_state *st, u32 reg,
+				     long *val)
+{
+	long in;
+	int ret;
+
+	ret = ltc4282_read_voltage_byte(st, reg, DECA * 40 * MILLI, &in);
+	if (ret)
+		return ret;
+
+	*val = DIV_ROUND_CLOSEST(in * MILLI, st->rsense);
+
+	return 0;
+}
+
+static int ltc4282_read_curr(struct ltc4282_state *st, const u32 attr,
+			     long *val)
+{
+	switch (attr) {
+	case hwmon_curr_input:
+		return ltc4282_read_current_word(st, LTC4282_VSENSE, val);
+	case hwmon_curr_highest:
+		return ltc4282_read_current_word(st, LTC4282_VSENSE_HIGHEST,
+						 val);
+	case hwmon_curr_lowest:
+		return ltc4282_read_current_word(st, LTC4282_VSENSE_LOWEST,
+						 val);
+	case hwmon_curr_max:
+		return ltc4282_read_current_byte(st, LTC4282_VSENSE_MAX, val);
+	case hwmon_curr_min:
+		return ltc4282_read_current_byte(st, LTC4282_VSENSE_MIN, val);
+	case hwmon_curr_max_alarm:
+		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+					  LTC4282_VSENSE_ALARM_H_MASK, val);
+	case hwmon_curr_min_alarm:
+		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+					  LTC4282_VSENSE_ALARM_L_MASK, val);
+	case hwmon_curr_crit_alarm:
+		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
+					  LTC4282_OC_STATUS_MASK, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_read_power_word(const struct ltc4282_state *st, u32 reg,
+				   long *val)
+{
+	u64 temp =  DECA * 40ULL * st->vfs_out * BIT(16), temp_2;
+	__be16 raw;
+	u16 power;
+	int ret;
+
+	ret = regmap_bulk_read(st->map, reg, &raw, sizeof(raw));
+	if (ret)
+		return ret;
+
+	power = be16_to_cpu(raw);
+	/*
+	 * Power is given by:
+	 *     P = CODE(16b) * 0.040 * Vfs(out) * 2^16 / ((2^16 - 1)^2 * Rsense)
+	 */
+	if (check_mul_overflow(power * temp, MICRO, &temp_2)) {
+		temp = DIV_ROUND_CLOSEST_ULL(power * temp, U16_MAX);
+		*val = DIV64_U64_ROUND_CLOSEST(temp * MICRO,
+					       U16_MAX * (u64)st->rsense);
+		return 0;
+	}
+
+	*val = DIV64_U64_ROUND_CLOSEST(temp_2,
+				       st->rsense * int_pow(U16_MAX, 2));
+
+	return 0;
+}
+
+static int ltc4282_read_power_byte(const struct ltc4282_state *st, u32 reg,
+				   long *val)
+{
+	u32 power;
+	u64 temp;
+	int ret;
+
+	ret = regmap_read(st->map, reg, &power);
+	if (ret)
+		return ret;
+
+	temp = power * 40 * DECA * st->vfs_out * BIT_ULL(8);
+	*val = DIV64_U64_ROUND_CLOSEST(temp * MICRO,
+				       int_pow(U8_MAX, 2) * st->rsense);
+
+	return 0;
+}
+
+static int ltc4282_read_energy(const struct ltc4282_state *st, u64 *val)
+{
+	u64 temp, energy;
+	__be64 raw;
+	int ret;
+
+	ret = regmap_bulk_read(st->map, LTC4282_ENERGY, &raw, 6);
+	if (ret)
+		return ret;
+
+	energy =  be64_to_cpu(raw) >> 16;
+	/*
+	 * The formula for energy is given by:
+	 *	E = CODE(48b) * 0.040 * Vfs(out) * Tconv * 256 /
+	 *						((2^16 - 1)^2 * Rsense)
+	 *
+	 * Since we only support 12bit ADC, Tconv = 0.065535s. Passing Vfs(out)
+	 * and 0.040 to mV and Tconv to us, we can simplify the formula to:
+	 *	E = CODE(48b) * 40 * Vfs(out) * 256 / (U16_MAX * Rsense)
+	 *
+	 * As Rsense can have tenths of micro-ohm resolution, we need to
+	 * multiply by DECA to get microujoule.
+	 */
+	if (check_mul_overflow(DECA * st->vfs_out * 40 * BIT(8), energy, &temp)) {
+		temp = DIV_ROUND_CLOSEST(DECA * st->vfs_out * 40 * BIT(8), U16_MAX);
+		*val = DIV_ROUND_CLOSEST_ULL(temp * energy, st->rsense);
+		return 0;
+	}
+
+	*val = DIV64_U64_ROUND_CLOSEST(temp, U16_MAX * (u64)st->rsense);
+
+	return 0;
+}
+
+static int ltc4282_read_power(struct ltc4282_state *st, const u32 attr,
+			      long *val)
+{
+	switch (attr) {
+	case hwmon_power_input:
+		return ltc4282_read_power_word(st, LTC4282_POWER, val);
+	case hwmon_power_input_highest:
+		return ltc4282_read_power_word(st, LTC4282_POWER_HIGHEST, val);
+	case hwmon_power_input_lowest:
+		return ltc4282_read_power_word(st, LTC4282_POWER_LOWEST, val);
+	case hwmon_power_max_alarm:
+		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+					  LTC4282_POWER_ALARM_H_MASK, val);
+	case hwmon_power_min_alarm:
+		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+					  LTC4282_POWER_ALARM_L_MASK, val);
+	case hwmon_power_max:
+		return ltc4282_read_power_byte(st, LTC4282_POWER_MAX, val);
+	case hwmon_power_min:
+		return ltc4282_read_power_byte(st, LTC4282_POWER_MIN, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct ltc4282_state *st = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		return ltc4282_read_in(st, attr, val, channel);
+	case hwmon_curr:
+		return ltc4282_read_curr(st, attr, val);
+	case hwmon_power:
+		return ltc4282_read_power(st, attr, val);
+	case hwmon_energy:
+		scoped_guard(mutex, &st->lock) {
+			*val = st->energy_en;
+		}
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_write_power_byte(const struct ltc4282_state *st, u32 reg,
+				    long val)
+{
+	u32 power;
+	u64 temp;
+
+	if (val > st->power_max)
+		val = st->power_max;
+
+	temp = val * int_pow(U8_MAX, 2) * st->rsense;
+	power = DIV64_U64_ROUND_CLOSEST(temp,
+					MICRO * DECA * 256ULL * st->vfs_out * 40);
+
+	return regmap_write(st->map, reg, power);
+}
+
+static int ltc4282_write_power_word(const struct ltc4282_state *st, u32 reg,
+				    long val)
+{
+	u64 temp = int_pow(U16_MAX, 2) * st->rsense, temp_2;
+	__be16 __raw;
+	u16 code;
+
+	if (check_mul_overflow(temp, val, &temp_2)) {
+		temp = DIV_ROUND_CLOSEST_ULL(temp, DECA * MICRO);
+		code = DIV64_U64_ROUND_CLOSEST(temp * val,
+					       40ULL * BIT(16) * st->vfs_out);
+	} else {
+		temp =  DECA * MICRO * 40ULL * BIT(16) * st->vfs_out;
+		code = DIV64_U64_ROUND_CLOSEST(temp_2, temp);
+	}
+
+	__raw = cpu_to_be16(code);
+	return regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
+}
+
+static int __ltc4282_in_write_history(const struct ltc4282_state *st, u32 reg,
+				      long lowest, long highest, u32 fs)
+{
+	__be16 __raw;
+	u16 tmp;
+	int ret;
+
+	tmp = DIV_ROUND_CLOSEST(U16_MAX * lowest, fs);
+
+	__raw = cpu_to_be16(tmp);
+
+	ret = regmap_bulk_write(st->map, reg, &__raw, 2);
+	if (ret)
+		return ret;
+
+	tmp = DIV_ROUND_CLOSEST(U16_MAX * highest, fs);
+
+	__raw = cpu_to_be16(tmp);
+
+	return regmap_bulk_write(st->map, reg + 2, &__raw, 2);
+}
+
+static int ltc4282_in_write_history(struct ltc4282_state *st, u32 reg,
+				    long lowest, long highest, u32 fs)
+{
+	guard(mutex)(&st->lock);
+	return __ltc4282_in_write_history(st, reg, lowest, highest, fs);
+}
+
+static int ltc4282_power_reset_hist(struct ltc4282_state *st)
+{
+	int ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = ltc4282_write_power_word(st, LTC4282_POWER_LOWEST,
+				       st->power_max);
+	if (ret)
+		return ret;
+
+	ret = ltc4282_write_power_word(st, LTC4282_POWER_HIGHEST, 0);
+	if (ret)
+		return ret;
+
+	/* now, let's also clear possible power_bad fault logs */
+	return regmap_clear_bits(st->map, LTC4282_FAULT_LOG,
+				 LTC4282_POWER_BAD_FAULT_MASK);
+}
+
+static int ltc4282_write_power(struct ltc4282_state *st, u32 attr,
+			       long val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return ltc4282_write_power_byte(st, LTC4282_POWER_MAX, val);
+	case hwmon_power_min:
+		return ltc4282_write_power_byte(st, LTC4282_POWER_MIN, val);
+	case hwmon_power_reset_history:
+		return ltc4282_power_reset_hist(st);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_write_voltage_byte_cached(const struct ltc4282_state *st,
+					     u32 reg, u32 fs, long val,
+					     u32 *cache_raw)
+{
+	u32 in;
+
+	if (val >= fs)
+		in = U8_MAX;
+	else
+		in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);
+
+	if (cache_raw) {
+		*cache_raw = in;
+		return 0;
+	}
+
+	return regmap_write(st->map, reg, in);
+}
+
+static int ltc4282_write_voltage_byte(const struct ltc4282_state *st, u32 reg,
+				      u32 fs, long val)
+{
+	return ltc4282_write_voltage_byte_cached(st, reg, fs, val, NULL);
+}
+
+static int ltc4282_cache_history(struct ltc4282_state *st, u32 channel)
+{
+	long val;
+	int ret;
+
+	ret = ltc4282_read_voltage_word(st, LTC4282_VSOURCE_LOWEST, st->vfs_out,
+					&val);
+	if (ret)
+		return ret;
+
+	st->in0_1_cache[channel].in_lowest = val;
+
+	ret = ltc4282_read_voltage_word(st, LTC4282_VSOURCE_HIGHEST,
+					st->vfs_out, &val);
+	if (ret)
+		return ret;
+
+	st->in0_1_cache[channel].in_highest = val;
+
+	ret = regmap_read(st->map, LTC4282_VSOURCE_MIN,
+			  &st->in0_1_cache[channel].in_min_raw);
+	if (ret)
+		return ret;
+
+	return regmap_read(st->map, LTC4282_VSOURCE_MAX,
+			  &st->in0_1_cache[channel].in_max_raw);
+}
+
+static int ltc4282_cache_sync(struct ltc4282_state *st, u32 channel)
+{
+	int ret;
+
+	ret = __ltc4282_in_write_history(st, LTC4282_VSOURCE_LOWEST,
+					 st->in0_1_cache[channel].in_lowest,
+					 st->in0_1_cache[channel].in_highest,
+					 st->vfs_out);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(st->map, LTC4282_VSOURCE_MIN,
+			   st->in0_1_cache[channel].in_min_raw);
+	if (ret)
+		return ret;
+
+	return regmap_write(st->map, LTC4282_VSOURCE_MAX,
+			    st->in0_1_cache[channel].in_max_raw);
+}
+
+static int ltc4282_vdd_source_write_lim(struct ltc4282_state *st, u32 reg,
+					int channel, u32 *cache, long val)
+{
+	int ret;
+
+	guard(mutex)(&st->lock);
+	if (st->in0_1_cache[channel].en)
+		ret = ltc4282_write_voltage_byte(st, reg, st->vfs_out, val);
+	else
+		ret = ltc4282_write_voltage_byte_cached(st, reg, st->vfs_out,
+							val, cache);
+
+	return ret;
+}
+
+static int ltc4282_vdd_source_reset_hist(struct ltc4282_state *st, int channel)
+{
+	long lowest = st->vfs_out;
+	int ret;
+
+	if (channel == LTC4282_CHAN_VDD)
+		lowest = st->vdd;
+
+	guard(mutex)(&st->lock);
+	if (st->in0_1_cache[channel].en) {
+		ret = __ltc4282_in_write_history(st, LTC4282_VSOURCE_LOWEST,
+						 lowest, 0, st->vfs_out);
+		if (ret)
+			return ret;
+	}
+
+	st->in0_1_cache[channel].in_lowest = lowest;
+	st->in0_1_cache[channel].in_highest = 0;
+
+	/*
+	 * We are also clearing possible fault logs in reset_history. Clearing
+	 * the logs might be important when the auto retry bits are not enabled
+	 * as the chip only enables the output again after having these logs
+	 * cleared. As some of these logs are related to limits, it makes sense
+	 * to clear them in here. For VDD, we need to clear under/over voltage
+	 * events. For VSOURCE, fet_short and fet_bad...
+	 */
+	if (channel == LTC4282_CHAN_VSOURCE)
+		return regmap_clear_bits(st->map, LTC4282_FAULT_LOG,
+					 LTC4282_FET_FAILURE_FAULT_MASK);
+
+	return regmap_clear_bits(st->map, LTC4282_FAULT_LOG,
+				 LTC4282_VDD_FAULT_MASK);
+}
+
+/*
+ * We need to mux between VSOURCE and VDD which means they are mutually
+ * exclusive. Moreover, we can't really disable both VDD and VSOURCE as the ADC
+ * is continuously running (we cannot independently halt it without also
+ * stopping VGPIO). Hence, the logic is that disabling or enabling VDD will
+ * automatically have the reverse effect on VSOURCE and vice-versa.
+ */
+static int ltc4282_vdd_source_enable(struct ltc4282_state *st, int channel,
+				     long val)
+{
+	int ret, other_chan = ~channel & 0x1;
+	u8 __val = val;
+
+	guard(mutex)(&st->lock);
+	if (st->in0_1_cache[channel].en == !!val)
+		return 0;
+
+	/* clearing the bit makes the ADC to monitor VDD */
+	if (channel == LTC4282_CHAN_VDD)
+		__val = !__val;
+
+	ret = regmap_update_bits(st->map, LTC4282_ILIM_ADJUST,
+				 LTC4282_VDD_MONITOR_MASK,
+				 FIELD_PREP(LTC4282_VDD_MONITOR_MASK, !!__val));
+	if (ret)
+		return ret;
+
+	st->in0_1_cache[channel].en = !!val;
+	st->in0_1_cache[other_chan].en = !val;
+
+	if (st->in0_1_cache[channel].en) {
+		/*
+		 * Then, we are disabling @other_chan. Let's save it's current
+		 * history.
+		 */
+		ret = ltc4282_cache_history(st, other_chan);
+		if (ret)
+			return ret;
+
+		return ltc4282_cache_sync(st, channel);
+	}
+	/*
+	 * Then, we are enabling @other_chan. We need to do the opposite from
+	 * above.
+	 */
+	ret = ltc4282_cache_history(st, channel);
+	if (ret)
+		return ret;
+
+	return ltc4282_cache_sync(st, other_chan);
+}
+
+static int ltc4282_write_in(struct ltc4282_state *st, u32 attr, long val,
+			    int channel)
+{
+	switch (attr) {
+	case hwmon_in_max:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_write_voltage_byte(st, LTC4282_VGPIO_MAX,
+							  1280, val);
+
+		return ltc4282_vdd_source_write_lim(st, LTC4282_VSOURCE_MAX,
+						    channel,
+						    &st->in0_1_cache[channel].in_max_raw, val);
+	case hwmon_in_min:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_write_voltage_byte(st, LTC4282_VGPIO_MIN,
+							  1280, val);
+
+		return ltc4282_vdd_source_write_lim(st, LTC4282_VSOURCE_MIN,
+						    channel,
+						    &st->in0_1_cache[channel].in_min_raw, val);
+	case hwmon_in_reset_history:
+		if (channel == LTC4282_CHAN_VGPIO)
+			return ltc4282_in_write_history(st,
+							LTC4282_VGPIO_LOWEST,
+							1280, 0, 1280);
+
+		return ltc4282_vdd_source_reset_hist(st, channel);
+	case hwmon_in_enable:
+		return ltc4282_vdd_source_enable(st, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_curr_reset_hist(struct ltc4282_state *st)
+{
+	int ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = __ltc4282_in_write_history(st, LTC4282_VSENSE_LOWEST,
+					 st->vsense_max, 0, 40 * MILLI);
+	if (ret)
+		return ret;
+
+	/* now, let's also clear possible overcurrent fault logs */
+	return regmap_clear_bits(st->map, LTC4282_FAULT_LOG,
+				 LTC4282_OC_FAULT_MASK);
+}
+
+static int ltc4282_write_curr(struct ltc4282_state *st, u32 attr,
+			      long val)
+{
+	/* need to pass it in millivolt */
+	u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
+
+	switch (attr) {
+	case hwmon_curr_max:
+		return ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MAX, 40,
+						  in);
+	case hwmon_curr_min:
+		return ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MIN, 40,
+						  in);
+	case hwmon_curr_reset_history:
+		return ltc4282_curr_reset_hist(st);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ltc4282_energy_enable_set(struct ltc4282_state *st, long val)
+{
+	int ret;
+
+	guard(mutex)(&st->lock);
+	/* setting the bit halts the meter */
+	ret = regmap_update_bits(st->map, LTC4282_ADC_CTRL,
+				 LTC4282_METER_HALT_MASK,
+				 FIELD_PREP(LTC4282_METER_HALT_MASK, !val));
+	if (ret)
+		return ret;
+
+	st->energy_en = !!val;
+
+	return 0;
+}
+
+static int ltc4282_write(struct device *dev,
+			 enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	struct ltc4282_state *st = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_power:
+		return ltc4282_write_power(st, attr, val);
+	case hwmon_in:
+		return ltc4282_write_in(st, attr, val, channel);
+	case hwmon_curr:
+		return ltc4282_write_curr(st, attr, val);
+	case hwmon_energy:
+		return ltc4282_energy_enable_set(st, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t ltc4282_in_is_visible(const struct ltc4282_state *st, u32 attr)
+{
+	switch (attr) {
+	case hwmon_in_input:
+	case hwmon_in_highest:
+	case hwmon_in_lowest:
+	case hwmon_in_max_alarm:
+	case hwmon_in_min_alarm:
+	case hwmon_in_label:
+	case hwmon_in_lcrit_alarm:
+	case hwmon_in_crit_alarm:
+	case hwmon_in_fault:
+		return 0444;
+	case hwmon_in_max:
+	case hwmon_in_min:
+	case hwmon_in_enable:
+	case hwmon_in_reset_history:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static umode_t ltc4282_curr_is_visible(u32 attr)
+{
+	switch (attr) {
+	case hwmon_curr_input:
+	case hwmon_curr_highest:
+	case hwmon_curr_lowest:
+	case hwmon_curr_max_alarm:
+	case hwmon_curr_min_alarm:
+	case hwmon_curr_crit_alarm:
+	case hwmon_curr_label:
+		return 0444;
+	case hwmon_curr_max:
+	case hwmon_curr_min:
+	case hwmon_curr_reset_history:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static umode_t ltc4282_power_is_visible(u32 attr)
+{
+	switch (attr) {
+	case hwmon_power_input:
+	case hwmon_power_input_highest:
+	case hwmon_power_input_lowest:
+	case hwmon_power_label:
+	case hwmon_power_max_alarm:
+	case hwmon_power_min_alarm:
+		return 0444;
+	case hwmon_power_max:
+	case hwmon_power_min:
+	case hwmon_power_reset_history:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static umode_t ltc4282_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		return ltc4282_in_is_visible(data, attr);
+	case hwmon_curr:
+		return ltc4282_curr_is_visible(attr);
+	case hwmon_power:
+		return ltc4282_power_is_visible(attr);
+	case hwmon_energy:
+		/* hwmon_energy_enable */
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static const char * const ltc4282_in_strs[] = {
+	"VSOURCE", "VDD", "VGPIO"
+};
+
+static int ltc4282_read_labels(struct device *dev,
+			       enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_in:
+		*str = ltc4282_in_strs[channel];
+		return 0;
+	case hwmon_curr:
+		*str = "ISENSE";
+		return 0;
+	case hwmon_power:
+		*str = "Power";
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static ssize_t ltc4282_energy_show(struct device *dev,
+				   struct device_attribute *da, char *buf)
+{
+	struct ltc4282_state *st = dev_get_drvdata(dev);
+	u64 energy;
+	int ret;
+
+	guard(mutex)(&st->lock);
+	if (!st->energy_en)
+		return -ENODATA;
+
+	ret = ltc4282_read_energy(st, &energy);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%llu\n", energy);
+}
+
+static const struct clk_ops ltc4282_ops = {
+	.recalc_rate = ltc4282_recalc_rate,
+	.round_rate = ltc4282_round_rate,
+	.set_rate = ltc4282_set_rate,
+	.disable = ltc4282_disable,
+};
+
+static int ltc428_clk_provider_setup(struct ltc4282_state *st,
+				     struct device *dev)
+{
+	struct clk_init_data init;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_COMMON_CLK))
+		return 0;
+
+	init.name =  devm_kasprintf(dev, GFP_KERNEL, "%s-clk",
+				    fwnode_get_name(dev_fwnode(dev)));
+	if (!init.name)
+		return -ENOMEM;
+
+	init.ops = &ltc4282_ops;
+	init.flags = CLK_GET_RATE_NOCACHE;
+	st->clk_hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &st->clk_hw);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &st->clk_hw);
+}
+
+static int ltc428_clks_setup(struct ltc4282_state *st, struct device *dev)
+{
+	unsigned long rate;
+	struct clk *clkin;
+	u32 val;
+	int ret;
+
+	ret = ltc428_clk_provider_setup(st, dev);
+	if (ret)
+		return ret;
+
+	clkin = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clkin))
+		return dev_err_probe(dev, PTR_ERR(clkin),
+				     "Failed to get clkin");
+	if (!clkin)
+		return 0;
+
+	rate = clk_get_rate(clkin);
+	if (!in_range(rate, LTC4282_CLKIN_MIN, LTC4282_CLKIN_RANGE))
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid clkin range(%lu) [%lu %lu]\n",
+				     rate, LTC4282_CLKIN_MIN,
+				     LTC4282_CLKIN_MAX);
+
+	/*
+	 * Clocks faster than 250KHZ should be reduced to 250KHZ. The clock
+	 * frequency is divided by twice the value in the register.
+	 */
+	val = rate / (2 * LTC4282_CLKIN_MIN);
+
+	return regmap_update_bits(st->map, LTC4282_CLK_DIV,
+				  LTC4282_CLK_DIV_MASK,
+				  FIELD_PREP(LTC4282_CLK_DIV_MASK, val));
+}
+
+static const int ltc4282_curr_lim_uv[] = {
+	12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375
+};
+
+static int ltc4282_get_defaults(struct ltc4282_state *st, u32 *vin_mode)
+{
+	u32 reg_val, ilm_adjust;
+	int ret;
+
+	ret = regmap_read(st->map, LTC4282_ADC_CTRL, &reg_val);
+	if (ret)
+		return ret;
+
+	st->energy_en = !FIELD_GET(LTC4282_METER_HALT_MASK, reg_val);
+
+	ret = regmap_read(st->map, LTC4282_CTRL_MSB, &reg_val);
+	if (ret)
+		return ret;
+
+	*vin_mode = FIELD_GET(LTC4282_CTRL_VIN_MODE_MASK, reg_val);
+
+	ret = regmap_read(st->map, LTC4282_ILIM_ADJUST, &reg_val);
+	if (ret)
+		return ret;
+
+	ilm_adjust = FIELD_GET(LTC4282_ILIM_ADJUST_MASK, reg_val);
+	st->vsense_max = ltc4282_curr_lim_uv[ilm_adjust];
+
+	st->in0_1_cache[LTC4282_CHAN_VSOURCE].en = FIELD_GET(LTC4282_VDD_MONITOR_MASK,
+							     ilm_adjust);
+	if (!st->in0_1_cache[LTC4282_CHAN_VSOURCE].en) {
+		st->in0_1_cache[LTC4282_CHAN_VDD].en = true;
+		return regmap_read(st->map, LTC4282_VSOURCE_MAX,
+				   &st->in0_1_cache[LTC4282_CHAN_VSOURCE].in_max_raw);
+	}
+
+	return regmap_read(st->map, LTC4282_VSOURCE_MAX,
+			   &st->in0_1_cache[LTC4282_CHAN_VDD].in_max_raw);
+}
+
+/*
+ * Set max limits for ISENSE and Power as that depends on the max voltage on
+ * rsense that is defined in ILIM_ADJUST. This is specially important for power
+ * because for some rsense and vfsout values, if we allow the default raw 255
+ * value, that would overflow long in 32bit archs when reading back the max
+ * power limit.
+ *
+ * Also set meaningful historic values for VDD and VSOURCE
+ * (0 would not mean much).
+ */
+static int ltc4282_set_max_limits(struct ltc4282_state *st)
+{
+	int ret;
+
+	ret = ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MAX, 40 * MILLI,
+					 st->vsense_max);
+	if (ret)
+		return ret;
+
+	/* Power is given by ISENSE * Vout. */
+	st->power_max = DIV_ROUND_CLOSEST(st->vsense_max * DECA * MILLI, st->rsense) * st->vfs_out;
+	ret = ltc4282_write_power_byte(st, LTC4282_POWER_MAX, st->power_max);
+	if (ret)
+		return ret;
+
+	if (st->in0_1_cache[LTC4282_CHAN_VDD].en) {
+		st->in0_1_cache[LTC4282_CHAN_VSOURCE].in_lowest = st->vfs_out;
+		return __ltc4282_in_write_history(st, LTC4282_VSOURCE_LOWEST,
+						  st->vdd, 0, st->vfs_out);
+	}
+
+	st->in0_1_cache[LTC4282_CHAN_VDD].in_lowest = st->vdd;
+	return __ltc4282_in_write_history(st, LTC4282_VSOURCE_LOWEST,
+					  st->vfs_out, 0, st->vfs_out);
+}
+
+static const char * const ltc4282_gpio1_modes[] = {
+	"power_bad", "power_good"
+};
+
+static const char * const ltc4282_gpio2_modes[] = {
+	"adc_input", "stress_fet"
+};
+
+static int ltc4282_gpio_setup(struct ltc4282_state *st, struct device *dev)
+{
+	const char *func = NULL;
+	int ret;
+
+	ret = device_property_read_string(dev, "adi,gpio1-mode", &func);
+	if (!ret) {
+		ret = match_string(ltc4282_gpio1_modes,
+				   ARRAY_SIZE(ltc4282_gpio1_modes), func);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Invalid func(%s) for gpio1\n",
+					     func);
+
+		ret = regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
+					 LTC4282_GPIO_1_CONFIG_MASK,
+					 FIELD_PREP(LTC4282_GPIO_1_CONFIG_MASK, ret));
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_string(dev, "adi,gpio2-mode", &func);
+	if (!ret) {
+		ret = match_string(ltc4282_gpio2_modes,
+				   ARRAY_SIZE(ltc4282_gpio2_modes), func);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Invalid func(%s) for gpio2\n",
+					     func);
+		if (!ret) {
+			/* setting the bit to 1 so the ADC to monitors GPIO2 */
+			ret = regmap_set_bits(st->map, LTC4282_ILIM_ADJUST,
+					      LTC4282_GPIO_MODE_MASK);
+		} else {
+			ret = regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
+						 LTC4282_GPIO_2_FET_STRESS_MASK,
+						 FIELD_PREP(LTC4282_GPIO_2_FET_STRESS_MASK, 1));
+		}
+
+		if (ret)
+			return ret;
+	}
+
+	if (!device_property_read_bool(dev, "adi,gpio3-monitor-enable"))
+		return 0;
+
+	if (func && !strcmp(func, "adc_input"))
+		return dev_err_probe(dev, -EINVAL,
+				     "Cannot have both gpio2 and gpio3 muxed into the ADC");
+
+	return regmap_clear_bits(st->map, LTC4282_ILIM_ADJUST,
+				 LTC4282_GPIO_MODE_MASK);
+}
+
+static const char * const ltc4282_dividers[] = {
+	"external", "vdd_5_percent", "vdd_10_percent", "vdd_15_percent"
+};
+
+/* This maps the Vout full scale for the given Vin mode */
+static const u16 ltc4282_vfs_milli[] = { 5540, 8320, 16640, 33280 };
+
+static const u16 ltc4282_vdd_milli[] = { 3300, 5000, 12000, 24000 };
+
+enum {
+	LTC4282_VIN_3_3V,
+	LTC4282_VIN_5V,
+	LTC4282_VIN_12V,
+	LTC4282_VIN_24V,
+};
+
+static int ltc4282_setup(struct ltc4282_state *st, struct device *dev)
+{
+	const char *divider;
+	u32 val, vin_mode;
+	int ret;
+
+	/* The part has an eeprom so let's get the needed defaults from it */
+	ret = ltc4282_get_defaults(st, &vin_mode);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u32(dev, "adi,rsense-nano-ohms",
+				       &st->rsense);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to read adi,rsense-nano-ohms\n");
+	if (st->rsense < CENTI)
+		return dev_err_probe(dev, -EINVAL,
+				     "adi,rsense-nano-ohms too small (< %lu)\n",
+				     CENTI);
+
+	/*
+	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which
+	 * means we need nano in the bindings. However, to make things easier to
+	 * handle (with respect to overflows) we divide it by 100 as we don't
+	 * really need the last two digits.
+	 */
+	st->rsense /= CENTI;
+
+	val = vin_mode;
+	ret = device_property_read_u32(dev, "adi,vin-mode-microvolt", &val);
+	if (!ret) {
+		switch (val) {
+		case 3300000:
+			val = LTC4282_VIN_3_3V;
+			break;
+		case 5000000:
+			val = LTC4282_VIN_5V;
+			break;
+		case 12000000:
+			val = LTC4282_VIN_12V;
+			break;
+		case 24000000:
+			val = LTC4282_VIN_24V;
+			break;
+		default:
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid val(%u) for vin-mode-microvolt\n",
+					     val);
+		}
+
+		ret = regmap_update_bits(st->map, LTC4282_CTRL_MSB,
+					 LTC4282_CTRL_VIN_MODE_MASK,
+					 FIELD_PREP(LTC4282_CTRL_VIN_MODE_MASK, val));
+		if (ret)
+			return ret;
+
+		/* Foldback mode should also be set to the input voltage */
+		ret = regmap_update_bits(st->map, LTC4282_ILIM_ADJUST,
+					 LTC4282_FOLDBACK_MODE_MASK,
+					 FIELD_PREP(LTC4282_FOLDBACK_MODE_MASK, val));
+		if (ret)
+			return ret;
+	}
+
+	st->vfs_out = ltc4282_vfs_milli[val];
+	st->vdd = ltc4282_vdd_milli[val];
+
+	ret = device_property_read_u32(dev, "adi,current-limit-sense-microvolt",
+				       &st->vsense_max);
+	if (!ret) {
+		int reg_val;
+
+		switch (val) {
+		case 12500:
+			reg_val = 0;
+			break;
+		case 15625:
+			reg_val = 1;
+			break;
+		case 18750:
+			reg_val = 2;
+			break;
+		case 21875:
+			reg_val = 3;
+			break;
+		case 25000:
+			reg_val = 4;
+			break;
+		case 28125:
+			reg_val = 5;
+			break;
+		case 31250:
+			reg_val = 6;
+			break;
+		case 34375:
+			reg_val = 7;
+			break;
+		default:
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid val(%u) for adi,current-limit-microvolt\n",
+					     st->vsense_max);
+		}
+
+		ret = regmap_update_bits(st->map, LTC4282_ILIM_ADJUST,
+					 LTC4282_ILIM_ADJUST_MASK,
+					 FIELD_PREP(LTC4282_ILIM_ADJUST_MASK, reg_val));
+		if (ret)
+			return ret;
+	}
+
+	ret = ltc4282_set_max_limits(st);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_string(dev, "adi,overvoltage-dividers",
+					  &divider);
+	if (!ret) {
+		int div = match_string(ltc4282_dividers,
+				       ARRAY_SIZE(ltc4282_dividers), divider);
+		if (div < 0)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid val(%s) for adi,overvoltage-divider\n",
+					     divider);
+
+		ret = regmap_update_bits(st->map, LTC4282_CTRL_MSB,
+					 LTC4282_CTRL_OV_MODE_MASK,
+					 FIELD_PREP(LTC4282_CTRL_OV_MODE_MASK, div));
+	}
+
+	ret = device_property_read_string(dev, "adi,undervoltage-dividers",
+					  &divider);
+	if (!ret) {
+		int div = match_string(ltc4282_dividers,
+				       ARRAY_SIZE(ltc4282_dividers), divider);
+		if (div < 0)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid val(%s) for adi,undervoltage-divider\n",
+					     divider);
+
+		ret = regmap_update_bits(st->map, LTC4282_CTRL_MSB,
+					 LTC4282_CTRL_UV_MODE_MASK,
+					 FIELD_PREP(LTC4282_CTRL_UV_MODE_MASK, div));
+	}
+
+	if (device_property_read_bool(dev, "adi,overcurrent-retry")) {
+		ret = regmap_set_bits(st->map, LTC4282_CTRL_LSB,
+				      LTC4282_CTRL_OC_RETRY_MASK);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "adi,overvoltage-retry-disable")) {
+		ret = regmap_clear_bits(st->map, LTC4282_CTRL_LSB,
+					LTC4282_CTRL_OV_RETRY_MASK);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "adi,undervoltage-retry-disable")) {
+		ret = regmap_clear_bits(st->map, LTC4282_CTRL_LSB,
+					LTC4282_CTRL_UV_RETRY_MASK);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
+		ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL,
+				      LTC4282_FAULT_LOG_EN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
+		ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL, LTC4282_FAULT_LOG_EN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_u32(dev, "adi,fet-bad-timeout-ms", &val);
+	if (!ret) {
+		if (val > LTC4282_FET_BAD_MAX_TIMEOUT)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid value(%u) for adi,fet-bad-timeout-ms",
+					     val);
+
+		ret = regmap_write(st->map, LTC4282_FET_BAD_FAULT_TIMEOUT, val);
+		if (ret)
+			return ret;
+	}
+
+	return ltc4282_gpio_setup(st, dev);
+}
+
+static bool ltc4282_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (reg == LTC4282_RESERVED_1 || reg == LTC4282_RESERVED_2)
+		return false;
+
+	return true;
+}
+
+static bool ltc4282_writable_reg(struct device *dev, unsigned int reg)
+{
+	if (reg == LTC4282_STATUS_LSB || reg == LTC4282_STATUS_MSB)
+		return false;
+	if (reg == LTC4282_RESERVED_1 || reg == LTC4282_RESERVED_2)
+		return false;
+
+	return true;
+}
+
+static const struct regmap_config ltc4282_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC4282_RESERVED_3,
+	.readable_reg = ltc4282_readable_reg,
+	.writeable_reg = ltc4282_writable_reg,
+};
+
+static const struct hwmon_channel_info * const ltc4282_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
+			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX_ALARM | HWMON_I_ENABLE |
+			   HWMON_I_RESET_HISTORY | HWMON_I_FAULT |
+			   HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
+			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX_ALARM | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_CRIT_ALARM | HWMON_I_ENABLE |
+			   HWMON_I_RESET_HISTORY | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
+			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
+			   HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
+			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
+			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
+			   HWMON_C_RESET_HISTORY | HWMON_C_LABEL),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
+			   HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
+			   HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
+			   HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(energy,
+			   HWMON_E_ENABLE),
+	NULL
+};
+
+static const struct hwmon_ops ltc4282_hwmon_ops = {
+	.read = ltc4282_read,
+	.write = ltc4282_write,
+	.is_visible = ltc4282_is_visible,
+	.read_string = ltc4282_read_labels,
+};
+
+static const struct hwmon_chip_info ltc2947_chip_info = {
+	.ops = &ltc4282_hwmon_ops,
+	.info = ltc4282_info,
+};
+
+/* energy attributes are 6bytes wide so we need u64 */
+static SENSOR_DEVICE_ATTR_RO(energy1_input, ltc4282_energy, 0);
+
+static struct attribute *ltc4282_attrs[] = {
+	&sensor_dev_attr_energy1_input.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ltc4282);
+
+static int ltc4282_show_fault_log(void *arg, u64 *val, u32 mask)
+{
+	struct ltc4282_state *st = arg;
+	long alarm;
+	int ret;
+
+	ret = ltc4282_read_alarm(st, LTC4282_FAULT_LOG,	mask, &alarm);
+	if (ret)
+		return ret;
+
+	*val = alarm;
+
+	return 0;
+}
+
+static int ltc4282_show_curr1_crit_fault_log(void *arg, u64 *val)
+{
+	return ltc4282_show_fault_log(arg, val, LTC4282_OC_FAULT_MASK);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_curr1_crit_fault_log,
+			 ltc4282_show_curr1_crit_fault_log, NULL, "%llu\n");
+
+static int ltc4282_show_in1_lcrit_fault_log(void *arg, u64 *val)
+{
+	return ltc4282_show_fault_log(arg, val, LTC4282_UV_FAULT_MASK);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_in1_lcrit_fault_log,
+			 ltc4282_show_in1_lcrit_fault_log, NULL, "%llu\n");
+
+static int ltc4282_show_in1_crit_fault_log(void *arg, u64 *val)
+{
+	return ltc4282_show_fault_log(arg, val, LTC4282_OV_FAULT_MASK);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_in1_crit_fault_log,
+			 ltc4282_show_in1_crit_fault_log, NULL, "%llu\n");
+
+static int ltc4282_show_fet_bad_fault_log(void *arg, u64 *val)
+{
+	return ltc4282_show_fault_log(arg, val, LTC4282_FET_BAD_FAULT_MASK);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_fet_bad_fault_log,
+			 ltc4282_show_fet_bad_fault_log, NULL, "%llu\n");
+
+static int ltc4282_show_fet_short_fault_log(void *arg, u64 *val)
+{
+	return ltc4282_show_fault_log(arg, val, LTC4282_FET_SHORT_FAULT_MASK);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_fet_short_fault_log,
+			 ltc4282_show_fet_short_fault_log, NULL, "%llu\n");
+
+static int ltc4282_show_power1_bad_fault_log(void *arg, u64 *val)
+{
+	return ltc4282_show_fault_log(arg, val, LTC4282_POWER_BAD_FAULT_MASK);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ltc4282_power1_bad_fault_log,
+			 ltc4282_show_power1_bad_fault_log, NULL, "%llu\n");
+
+static void ltc4282_debugfs_remove(void *dir)
+{
+	debugfs_remove_recursive(dir);
+}
+
+static void ltc4282_debugfs_init(struct ltc4282_state *st,
+				 struct i2c_client *i2c,
+				 const struct device *hwmon)
+{
+	const char *debugfs_name;
+	struct dentry *dentry;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return;
+
+	debugfs_name = devm_kasprintf(&i2c->dev, GFP_KERNEL, "ltc4282-%s",
+				      dev_name(hwmon));
+	if (!debugfs_name)
+		return;
+
+	dentry = debugfs_create_dir(debugfs_name, NULL);
+	if (IS_ERR(dentry))
+		return;
+
+	ret = devm_add_action_or_reset(&i2c->dev, ltc4282_debugfs_remove,
+				       dentry);
+	if (ret)
+		return;
+
+	debugfs_create_file_unsafe("power1_bad_fault_log", 0400, dentry, st,
+				   &ltc4282_power1_bad_fault_log);
+	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, dentry, st,
+				   &ltc4282_fet_short_fault_log);
+	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, dentry, st,
+				   &ltc4282_fet_bad_fault_log);
+	debugfs_create_file_unsafe("in1_crit_fault_log", 0400, dentry, st,
+				   &ltc4282_in1_crit_fault_log);
+	debugfs_create_file_unsafe("in1_lcrit_fault_log", 0400, dentry, st,
+				   &ltc4282_in1_lcrit_fault_log);
+	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, dentry, st,
+				   &ltc4282_curr1_crit_fault_log);
+}
+
+static int ltc4282_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev, *hwmon;
+	struct ltc4282_state *st;
+	int ret;
+
+	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to allocate memory\n");
+
+	st->map = devm_regmap_init_i2c(i2c, &ltc4282_regmap_config);
+	if (IS_ERR(st->map))
+		return dev_err_probe(dev, PTR_ERR(st->map),
+				     "failed regmap init\n");
+
+	/* Soft reset */
+	ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL, LTC4282_RESET_MASK);
+	if (ret)
+		return ret;
+
+	/* Yes, it's big but it is as specified in the datasheet */
+	msleep(3200);
+
+	ret = ltc428_clks_setup(st, dev);
+	if (ret)
+		return ret;
+
+	ret = ltc4282_setup(st, dev);
+	if (ret)
+		return ret;
+
+	mutex_init(&st->lock);
+	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4282", st,
+						     &ltc2947_chip_info,
+						     ltc4282_groups);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	ltc4282_debugfs_init(st, i2c, hwmon);
+
+	return 0;
+}
+
+static const struct of_device_id ltc4282_of_match[] = {
+	{ .compatible = "adi,ltc4282" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ltc4282_of_match);
+
+static struct i2c_driver ltc4282_driver = {
+	.driver = {
+		.name = "ltc4282",
+		.of_match_table = ltc4282_of_match,
+	},
+	.probe = ltc4282_probe,
+};
+module_i2c_driver(ltc4282_driver);
+
+MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
+MODULE_DESCRIPTION("LTC4282 I2C High Current Hot Swap Controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0

