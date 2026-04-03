Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB5398919;
	Fri,  3 Apr 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223277; cv=none; b=Mb7yAXtJmDvI4joDA9H0wZiSNraujlYIWyaWn6Vyg33OqHUL8L0RQSW31euqJ3lHZGlHUmBn+tjX8SdtIX3ZdL/tbHgXwp2Vx2lA65wyT3WkaW0o3l+5pbM+5WX3zMhgBDyMJqxf4ezEV3+cMzQkzycqZ1EN4PUayDVhFKJKx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223277; c=relaxed/simple;
	bh=jG4ioA/4LzuRNEY/19pxT0WCj2pH4kHwozAtZ5lI9YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PobseTJpCoBW/WvlYRVOAtp4NIaidCtuv33FA8/ie8dLtZyFbpM0Wr1wa8D/A7aYVhis7uQ9cxSR1NTqyTB/VKYypspixeBnI1btDO8rJKexNKCDIP1dfsfbbFzlH6wF1fwoSEYRxFnW3xQKYVsGwmrCf42fafNYmaB2bdHDfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=utenRDqk; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="utenRDqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775223274; x=1806759274;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=jG4ioA/4LzuRNEY/19pxT0WCj2pH4kHwozAtZ5lI9YE=;
  b=utenRDqkIYklUGb5GHJtHD3pClrf1VvwC9GE0eNMjNBw2R1P65W4JkPS
   f2ID9iZ//oA+HsEB9jlaFvFAgoe6AlHriECcFJIa6Ky7sEkf3NJsSQjyn
   VI0Ulaq0cdfbuoeJudh3W8hkpAEag0gqRs0zLJiLjGbyl/icceLHVWVEe
   VzPjtTwemARfeU6ofzarDaPKcSPli7cv+KovKC3PjwrUqKnCltZqfEvi+
   ZYA7AAr9SkoaOCsRYbpP0KI90+wVTLTxg/t/XQHx1gvk4G3hZb5gmpqdB
   HWT7r1yqnBPonZ0c0f19kz01G4KfHSMAbS8u630DU39xdOqIRH6YSfO2c
   g==;
X-CSE-ConnectionGUID: 9tjNiJ07ToSeU2OAxgc/IA==
X-CSE-MsgGUID: 5Azq444jRg67sWnGk9PlOw==
X-IronPort-AV: E=Sophos;i="6.23,157,1770620400"; 
   d="scan'208";a="56056971"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 06:34:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 3 Apr 2026 06:34:16 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 06:34:13 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Date: Fri, 3 Apr 2026 16:32:17 +0300
Subject: [PATCH v12 2/2] hwmon: add support for MCP998X
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>
References: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
In-Reply-To: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<marius.cristea@microchip.com>, <victor.duicu@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775223246; l=38464;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=jG4ioA/4LzuRNEY/19pxT0WCj2pH4kHwozAtZ5lI9YE=;
 b=yY5mgQv+e6XdY7Hb1zUm0ubh9byLb+euBuvQSwUtQTlv9R85O3ChU5zy9rE0u6ct9dBeohzdb
 fTPVwW240COCpfMO37WmT5U+OfKG8Lwvh3i5TOqNjrmCPy7dwdLyXE3
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=

Add driver for Microchip MCP998X/33 and MCP998XD/33D
Multichannel Automotive Temperature Monitor Family.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/mcp9982.rst | 111 +++++
 MAINTAINERS                     |   2 +
 drivers/hwmon/Kconfig           |  11 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/mcp9982.c         | 997 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 1123 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..b02709fc216e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -173,6 +173,7 @@ Hardware Monitoring Kernel Drivers
    mc33xs2410_hwmon
    mc34vr500
    mcp3021
+   mcp9982
    menf21bmc
    mlxreg-fan
    mp2856
diff --git a/Documentation/hwmon/mcp9982.rst b/Documentation/hwmon/mcp9982.rst
new file mode 100644
index 000000000000..790ee1697b45
--- /dev/null
+++ b/Documentation/hwmon/mcp9982.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Kernel driver MCP998X
+=====================
+
+Supported chips:
+
+  * Microchip Technology MCP998X/MCP9933 and MCP998XD/MCP9933D
+
+    Prefix: 'mcp9982'
+
+    Datasheet:
+    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
+
+Authors:
+
+   - Victor Duicu <victor.duicu@microchip.com>
+
+Description
+-----------
+
+This driver implements support for the MCP998X family containing: MCP9982,
+MCP9982D, MCP9983, MCP9983D, MCP9984, MCP9984D, MCP9985, MCP9985D,
+MCP9933 and MCP9933D.
+
+The MCP998X Family is a high accuracy 2-wire multichannel automotive
+temperature monitor.
+
+The chips in the family have different numbers of external channels,
+ranging from 1 (MCP9982) to 4 channels (MCP9985). Reading diodes in
+anti-parallel connection is supported by MCP9984/85/33 and
+MCP9984D/85D/33D. Dedicated hardware shutdown circuitry is present
+only in MCP998XD and MCP9933D.
+
+Temperatures are read in millidegrees Celsius, ranging from -64 to
+191.875 with 0.125 precision.
+
+Each channel has a minimum, maximum, and critical limit alongside associated alarms.
+The chips also implement a hysteresis mechanism which applies only to the maximum
+and critical limits. The relative difference between a limit and its hysteresis
+is the same for both and the value is kept in a single register.
+
+The chips measure temperatures with a variable conversion rate.
+Update_interval = Conversion/Second, so the available options are:
+- 16000 (ms) = 1 conv/16 sec
+- 8000 (ms) = 1 conv/8 sec
+- 4000 (ms) = 1 conv/4 sec
+- 2000 (ms) = 1 conv/2 sec
+- 1000 (ms) = 1 conv/sec
+- 500 (ms) = 2 conv/sec
+- 250 (ms) = 4 conv/sec
+- 125 (ms) = 8 conv/sec
+- 64 (ms) = 16 conv/sec
+- 32 (ms) = 32 conv/sec
+- 16 (ms) = 64 conv/sec
+
+Usage Notes
+-----------
+
+Parameters that can be configured in devicetree:
+- anti-parallel diode mode operation
+- resistance error correction on channels 1 and 2
+- resistance error correction on channels 3 and 4
+- power state
+
+Chips 82/83 and 82D/83D do not support anti-parallel diode mode.
+For chips with "D" in the name resistance error correction must be on.
+Please see Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
+for details.
+
+There are two power states:
+- Active state: in which the chip is converting on all channels at the
+programmed rate.
+
+- Standby state: in which the host must initiate a conversion cycle.
+
+Chips with "D" in the name work in Active state only and those without
+can work in either state.
+
+Chips with "D" in the name can't set update interval slower than 1 second.
+
+Among the hysteresis attributes, only the tempX_crit_hyst ones are writeable
+while the others are read only. Setting tempX_crit_hyst writes the difference
+between tempX_crit and tempX_crit_hyst in the hysteresis register. The new value
+applies automatically  to the other limits. At power up the device starts with
+a 10 degree hysteresis.
+
+Sysfs entries
+-------------
+
+The following attributes are supported. The temperature limits and
+update_interval are read-write. The attribute tempX_crit_hyst is read-write,
+while tempX_max_hyst is read only. All other attributes are read only.
+
+======================= ==================================================
+temp[1-5]_label		User name for channel.
+temp[1-5]_input		Measured temperature for channel.
+
+temp[1-5]_crit		Critical temperature limit.
+temp[1-5]_crit_alarm	Critical temperature limit alarm.
+temp[1-5]_crit_hyst	Critical temperature limit hysteresis.
+
+temp[1-5]_max		High temperature limit.
+temp[1-5]_max_alarm	High temperature limit alarm.
+temp[1-5]_max_hyst	High temperature limit hysteresis.
+
+temp[1-5]_min		Low temperature limit.
+temp[1-5]_min_alarm	Low temperature limit alarm.
+
+update_interval		The interval at which the chip will update readings.
+======================= ==================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 026510a4129c..5c6662e10b04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17165,6 +17165,8 @@ M:	Victor Duicu <victor.duicu@microchip.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
+F:	Documentation/hwmon/mcp9982.rst
+F:	drivers/hwmon/mcp9982.c
 
 MICROCHIP MMC/SD/SDIO MCI DRIVER
 M:	Aubin Constans <aubin.constans@microchip.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 157678b821fc..c758ab2d5fdf 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1388,6 +1388,17 @@ config SENSORS_MCP3021
 	  This driver can also be built as a module. If so, the module
 	  will be called mcp3021.
 
+config SENSORS_MCP9982
+       tristate "Microchip Technology MCP9982 driver"
+       depends on I2C
+       select REGMAP_I2C
+       help
+         Say yes here to include support for Microchip Technology's MCP998X/33
+         and MCP998XD/33D Multichannel Automotive Temperature Monitor Family.
+
+         This driver can also be built as a module. If so, the module
+         will be called mcp9982.
+
 config SENSORS_MLXREG_FAN
 	tristate "Mellanox FAN driver"
 	depends on MELLANOX_PLATFORM
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..cec33da29a68 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -170,6 +170,7 @@ obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
 obj-$(CONFIG_SENSORS_MC33XS2410) += mc33xs2410_hwmon.o
 obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
 obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
+obj-$(CONFIG_SENSORS_MCP9982)	+= mcp9982.o
 obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
 obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
 obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
new file mode 100644
index 000000000000..f0b836a3f256
--- /dev/null
+++ b/drivers/hwmon/mcp9982.c
@@ -0,0 +1,997 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * HWMON driver for MCP998X/33 and MCP998XD/33D Multichannel Automotive
+ * Temperature Monitor Family
+ *
+ * Copyright (C) 2026 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Victor Duicu <victor.duicu@microchip.com>
+ *
+ * Datasheet can be found here:
+ * https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/byteorder/generic.h>
+#include <linux/delay.h>
+#include <linux/device/devres.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/time64.h>
+#include <linux/util_macros.h>
+
+/* MCP9982 Registers */
+#define MCP9982_HIGH_BYTE_ADDR(index)		(2 * (index))
+#define MCP9982_ONE_SHOT_ADDR			0x0A
+#define MCP9982_INTERNAL_HIGH_LIMIT_ADDR	0x0B
+#define MCP9982_INTERNAL_LOW_LIMIT_ADDR		0x0C
+#define MCP9982_EXT_HIGH_LIMIT_ADDR(index)	(4 * ((index) - 1) + 0x0D)
+#define MCP9982_EXT_LOW_LIMIT_ADDR(index)	(4 * ((index) - 1) + 0x0F)
+#define MCP9982_THERM_LIMIT_ADDR(index)		((index) + 0x1D)
+#define MCP9982_CFG_ADDR			0x22
+#define MCP9982_CONV_ADDR			0x24
+#define MCP9982_HYS_ADDR			0x25
+#define MCP9982_CONSEC_ALRT_ADDR		0x26
+#define MCP9982_ALRT_CFG_ADDR			0x27
+#define MCP9982_RUNNING_AVG_ADDR		0x28
+#define MCP9982_HOTTEST_CFG_ADDR		0x29
+#define MCP9982_STATUS_ADDR			0x2A
+#define MCP9982_EXT_FAULT_STATUS_ADDR		0x2B
+#define MCP9982_HIGH_LIMIT_STATUS_ADDR		0x2C
+#define MCP9982_LOW_LIMIT_STATUS_ADDR		0x2D
+#define MCP9982_THERM_LIMIT_STATUS_ADDR		0x2E
+#define MCP9982_HOTTEST_HIGH_BYTE_ADDR		0x2F
+#define MCP9982_HOTTEST_LOW_BYTE_ADDR		0x30
+#define MCP9982_HOTTEST_STATUS_ADDR		0x31
+#define MCP9982_THERM_SHTDWN_CFG_ADDR		0x32
+#define MCP9982_HRDW_THERM_SHTDWN_LIMIT_ADDR	0x33
+#define MCP9982_EXT_BETA_CFG_ADDR(index)	((index) + 0x33)
+#define MCP9982_EXT_IDEAL_ADDR(index)		((index) + 0x35)
+
+/* MCP9982 Bits */
+#define MCP9982_CFG_MSKAL			BIT(7)
+#define MCP9982_CFG_RS				BIT(6)
+#define MCP9982_CFG_ATTHM			BIT(5)
+#define MCP9982_CFG_RECD12			BIT(4)
+#define MCP9982_CFG_RECD34			BIT(3)
+#define MCP9982_CFG_RANGE			BIT(2)
+#define MCP9982_CFG_DA_ENA			BIT(1)
+#define MCP9982_CFG_APDD			BIT(0)
+
+#define MCP9982_STATUS_BUSY			BIT(5)
+
+/* Constants and default values */
+#define MCP9982_MAX_NUM_CHANNELS		5
+#define MCP9982_BETA_AUTODETECT			16
+#define MCP9982_IDEALITY_DEFAULT		18
+#define MCP9982_OFFSET				64
+#define MCP9982_DEFAULT_CONSEC_ALRT_VAL		112
+#define MCP9982_DEFAULT_HYS_VAL			10
+#define MCP9982_DEFAULT_CONV_VAL		6
+#define MCP9982_WAKE_UP_TIME_US			125000
+#define MCP9982_WAKE_UP_TIME_MAX_US		130000
+#define MCP9982_HIGH_LIMIT_DEFAULT		85000
+#define MCP9982_LOW_LIMIT_DEFAULT		0
+
+static const struct hwmon_channel_info * const mcp9985_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST),
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	NULL
+};
+
+/**
+ * struct mcp9982_features - features of a mcp9982 instance
+ * @name:			chip's name
+ * @phys_channels:		number of physical channels supported by the chip
+ * @hw_thermal_shutdown:	presence of hardware thermal shutdown circuitry
+ * @allow_apdd:			whether the chip supports enabling APDD
+ * @has_recd34:			whether the chip has the channels that are affected by recd34
+ */
+struct mcp9982_features {
+	const char	*name;
+	u8		phys_channels;
+	bool		hw_thermal_shutdown;
+	bool		allow_apdd;
+	bool		has_recd34;
+};
+
+static const struct mcp9982_features mcp9933_chip_config = {
+	.name = "mcp9933",
+	.phys_channels = 3,
+	.hw_thermal_shutdown = false,
+	.allow_apdd = true,
+	.has_recd34 = false,
+};
+
+static const struct mcp9982_features mcp9933d_chip_config = {
+	.name = "mcp9933d",
+	.phys_channels = 3,
+	.hw_thermal_shutdown = true,
+	.allow_apdd = true,
+	.has_recd34 = false,
+};
+
+static const struct mcp9982_features mcp9982_chip_config = {
+	.name = "mcp9982",
+	.phys_channels = 2,
+	.hw_thermal_shutdown = false,
+	.allow_apdd = false,
+	.has_recd34 = false,
+};
+
+static const struct mcp9982_features mcp9982d_chip_config = {
+	.name = "mcp9982d",
+	.phys_channels = 2,
+	.hw_thermal_shutdown = true,
+	.allow_apdd = false,
+	.has_recd34 = false,
+};
+
+static const struct mcp9982_features mcp9983_chip_config = {
+	.name = "mcp9983",
+	.phys_channels = 3,
+	.hw_thermal_shutdown = false,
+	.allow_apdd = false,
+	.has_recd34 = true,
+};
+
+static const struct mcp9982_features mcp9983d_chip_config = {
+	.name = "mcp9983d",
+	.phys_channels = 3,
+	.hw_thermal_shutdown = true,
+	.allow_apdd = false,
+	.has_recd34 = true,
+};
+
+static const struct mcp9982_features mcp9984_chip_config = {
+	.name = "mcp9984",
+	.phys_channels = 4,
+	.hw_thermal_shutdown = false,
+	.allow_apdd = true,
+	.has_recd34 = true,
+};
+
+static const struct mcp9982_features mcp9984d_chip_config = {
+	.name = "mcp9984d",
+	.phys_channels = 4,
+	.hw_thermal_shutdown = true,
+	.allow_apdd = true,
+	.has_recd34 = true,
+};
+
+static const struct mcp9982_features mcp9985_chip_config = {
+	.name = "mcp9985",
+	.phys_channels = 5,
+	.hw_thermal_shutdown = false,
+	.allow_apdd = true,
+	.has_recd34 = true,
+};
+
+static const struct mcp9982_features mcp9985d_chip_config = {
+	.name = "mcp9985d",
+	.phys_channels = 5,
+	.hw_thermal_shutdown = true,
+	.allow_apdd = true,
+	.has_recd34 = true,
+};
+
+static const unsigned int mcp9982_update_interval[11] = {
+	16000, 8000, 4000, 2000, 1000, 500, 250, 125, 64, 32, 16
+};
+
+/* MCP9982 regmap configuration */
+static const struct regmap_range mcp9982_regmap_wr_ranges[] = {
+	regmap_reg_range(MCP9982_ONE_SHOT_ADDR, MCP9982_CFG_ADDR),
+	regmap_reg_range(MCP9982_CONV_ADDR, MCP9982_HOTTEST_CFG_ADDR),
+	regmap_reg_range(MCP9982_THERM_SHTDWN_CFG_ADDR, MCP9982_THERM_SHTDWN_CFG_ADDR),
+	regmap_reg_range(MCP9982_EXT_BETA_CFG_ADDR(1), MCP9982_EXT_IDEAL_ADDR(4)),
+};
+
+static const struct regmap_access_table mcp9982_regmap_wr_table = {
+	.yes_ranges = mcp9982_regmap_wr_ranges,
+	.n_yes_ranges = ARRAY_SIZE(mcp9982_regmap_wr_ranges),
+};
+
+static const struct regmap_range mcp9982_regmap_rd_ranges[] = {
+	regmap_reg_range(MCP9982_HIGH_BYTE_ADDR(0), MCP9982_CFG_ADDR),
+	regmap_reg_range(MCP9982_CONV_ADDR, MCP9982_EXT_IDEAL_ADDR(4)),
+};
+
+static const struct regmap_access_table mcp9982_regmap_rd_table = {
+	.yes_ranges = mcp9982_regmap_rd_ranges,
+	.n_yes_ranges = ARRAY_SIZE(mcp9982_regmap_rd_ranges),
+};
+
+static bool mcp9982_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MCP9982_ONE_SHOT_ADDR:
+	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
+	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
+	case MCP9982_EXT_LOW_LIMIT_ADDR(1):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(1) + 1:
+	case MCP9982_EXT_LOW_LIMIT_ADDR(2):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(2) + 1:
+	case MCP9982_EXT_LOW_LIMIT_ADDR(3):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(3) + 1:
+	case MCP9982_EXT_LOW_LIMIT_ADDR(4):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(4) + 1:
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(1) + 1:
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(2) + 1:
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(3) + 1:
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(4) + 1:
+	case MCP9982_THERM_LIMIT_ADDR(0):
+	case MCP9982_THERM_LIMIT_ADDR(1):
+	case MCP9982_THERM_LIMIT_ADDR(2):
+	case MCP9982_THERM_LIMIT_ADDR(3):
+	case MCP9982_THERM_LIMIT_ADDR(4):
+	case MCP9982_CFG_ADDR:
+	case MCP9982_CONV_ADDR:
+	case MCP9982_HYS_ADDR:
+	case MCP9982_CONSEC_ALRT_ADDR:
+	case MCP9982_ALRT_CFG_ADDR:
+	case MCP9982_RUNNING_AVG_ADDR:
+	case MCP9982_HOTTEST_CFG_ADDR:
+	case MCP9982_THERM_SHTDWN_CFG_ADDR:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config mcp9982_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &mcp9982_regmap_rd_table,
+	.wr_table = &mcp9982_regmap_wr_table,
+	.volatile_reg = mcp9982_is_volatile_reg,
+	.max_register = MCP9982_EXT_IDEAL_ADDR(4),
+	.cache_type = REGCACHE_MAPLE,
+};
+
+/**
+ * struct mcp9982_priv - information about chip parameters
+ * @regmap:			device register map
+ * @chip:			pointer to structure holding chip features
+ * @labels:			labels of the channels
+ * @interval_idx:		index representing the current update interval
+ * @enabled_channel_mask:	mask containing which channels should be enabled
+ * @num_channels:		number of active physical channels
+ * @recd34_enable:		state of Resistance Error Correction(REC) on channels 3 and 4
+ * @recd12_enable:		state of Resistance Error Correction(REC) on channels 1 and 2
+ * @apdd_enable:		state of anti-parallel diode mode
+ * @run_state:			chip is in Run state, otherwise is in Standby state
+ */
+struct mcp9982_priv {
+	struct regmap *regmap;
+	const struct mcp9982_features *chip;
+	const char *labels[MCP9982_MAX_NUM_CHANNELS];
+	unsigned int interval_idx;
+	unsigned long enabled_channel_mask;
+	u8 num_channels;
+	bool recd34_enable;
+	bool recd12_enable;
+	bool apdd_enable;
+	bool run_state;
+};
+
+static int mcp9982_read_limit(struct mcp9982_priv *priv, u8 address, long *val)
+{
+	unsigned int limit, reg_high, reg_low;
+	int ret;
+
+	switch (address) {
+	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
+	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
+	case MCP9982_THERM_LIMIT_ADDR(0):
+	case MCP9982_THERM_LIMIT_ADDR(1):
+	case MCP9982_THERM_LIMIT_ADDR(2):
+	case MCP9982_THERM_LIMIT_ADDR(3):
+	case MCP9982_THERM_LIMIT_ADDR(4):
+		ret = regmap_read(priv->regmap, address, &limit);
+		if (ret)
+			return ret;
+
+		*val = ((int)limit - MCP9982_OFFSET) * 1000;
+
+		return 0;
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(1):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(2):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(3):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(4):
+		/*
+		 * In order to keep consistency with reading temperature memory region we will use
+		 * single byte I2C read.
+		 */
+		ret = regmap_read(priv->regmap, address, &reg_high);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(priv->regmap, address + 1, &reg_low);
+		if (ret)
+			return ret;
+
+		*val = ((reg_high << 8) + reg_low) >> 5;
+		*val = (*val - (MCP9982_OFFSET << 3)) * 125;
+
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
+			long *val)
+{
+	struct mcp9982_priv *priv = dev_get_drvdata(dev);
+	unsigned int reg_high, reg_low, hyst, reg_status;
+	int ret;
+	u8 addr;
+
+	/*
+	 * In Standby State the conversion cycle must be initated manually in
+	 * order to read fresh temperature values and the status of the alarms.
+	 */
+	if (!priv->run_state) {
+		switch (type) {
+		case hwmon_temp:
+			switch (attr) {
+			case hwmon_temp_input:
+			case hwmon_temp_max_alarm:
+			case hwmon_temp_min_alarm:
+			case hwmon_temp_crit_alarm:
+				ret = regmap_write(priv->regmap, MCP9982_ONE_SHOT_ADDR, 1);
+				if (ret)
+					return ret;
+				/*
+				 * When the device is in Standby mode, 125 ms need
+				 * to pass from writing in One Shot register before
+				 * the conversion cycle begins.
+				 */
+				usleep_range(MCP9982_WAKE_UP_TIME_US, MCP9982_WAKE_UP_TIME_MAX_US);
+				ret = regmap_read_poll_timeout
+					       (priv->regmap, MCP9982_STATUS_ADDR,
+					       reg_status, !(reg_status & MCP9982_STATUS_BUSY),
+					       MCP9982_WAKE_UP_TIME_US,
+					       MCP9982_WAKE_UP_TIME_US * 10);
+				break;
+			}
+		default:
+			break;
+		}
+	}
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			/*
+			 * The only areas of memory that support SMBus block read are 80h->89h
+			 * (temperature memory block) and 90h->97h(status memory block).
+			 * In this context the read operation uses SMBus protocol and the first
+			 * value returned will be the number of addresses that can be read.
+			 * Temperature memory block is 10 bytes long and status memory block is 8
+			 * bytes long.
+			 *
+			 * Depending on the read instruction used, the chip behaves differently:
+			 * - regmap_bulk_read() when applied to the temperature memory block
+			 * (80h->89h), the chip replies with SMBus block read, including count,
+			 * additionally to the high and the low bytes. This function cannot be
+			 * applied on the memory region 00h->09h(memory area which does not support
+			 * block reads, returns wrong data) unless use_single_read is set in
+			 * regmap_config.
+			 *
+			 * - regmap_multi_reg_read() when applied to the 00h->09h area uses I2C
+			 * and returns only the high and low temperature bytes. When applied to
+			 * the temperature memory block (80h->89h) returns the count till the end of
+			 * the temperature memory block(aka SMBus count).
+			 *
+			 * - i2c_smbus_read_block_data() is not supported by all drivers.
+			 *
+			 * In order to keep consistency with reading limit memory region we will
+			 * use single byte I2C read.
+			 *
+			 * Low register is latched when high temperature register is read.
+			 */
+			ret = regmap_read(priv->regmap, MCP9982_HIGH_BYTE_ADDR(channel), &reg_high);
+			if (ret)
+				return ret;
+
+			ret = regmap_read(priv->regmap, MCP9982_HIGH_BYTE_ADDR(channel) + 1,
+					  &reg_low);
+			if (ret)
+				return ret;
+
+			*val = ((reg_high << 8) + reg_low) >> 5;
+			*val = (*val - (MCP9982_OFFSET << 3)) * 125;
+
+			return 0;
+		case hwmon_temp_max:
+			if (channel)
+				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
+			else
+				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
+
+			return mcp9982_read_limit(priv, addr, val);
+		case hwmon_temp_max_alarm:
+			*val = regmap_test_bits(priv->regmap, MCP9982_HIGH_LIMIT_STATUS_ADDR,
+						BIT(channel));
+			if (*val < 0)
+				return *val;
+
+			return 0;
+		case hwmon_temp_max_hyst:
+			if (channel)
+				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
+			else
+				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
+			ret = mcp9982_read_limit(priv, addr, val);
+			if (ret)
+				return ret;
+
+			ret = regmap_read(priv->regmap, MCP9982_HYS_ADDR, &hyst);
+			if (ret)
+				return ret;
+
+			*val -= hyst * 1000;
+
+			return 0;
+		case hwmon_temp_min:
+			if (channel)
+				addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
+			else
+				addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
+
+			return mcp9982_read_limit(priv, addr, val);
+		case hwmon_temp_min_alarm:
+			*val = regmap_test_bits(priv->regmap, MCP9982_LOW_LIMIT_STATUS_ADDR,
+						BIT(channel));
+			if (*val < 0)
+				return *val;
+
+			return 0;
+		case hwmon_temp_crit:
+			return mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
+		case hwmon_temp_crit_alarm:
+			*val = regmap_test_bits(priv->regmap, MCP9982_THERM_LIMIT_STATUS_ADDR,
+						BIT(channel));
+			if (*val < 0)
+				return *val;
+
+			return 0;
+		case hwmon_temp_crit_hyst:
+			ret = mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
+			if (ret)
+				return ret;
+
+			ret = regmap_read(priv->regmap, MCP9982_HYS_ADDR, &hyst);
+			if (ret)
+				return ret;
+
+			*val -= hyst * 1000;
+
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			*val = mcp9982_update_interval[priv->interval_idx];
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcp9982_read_label(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			      int channel, const char **str)
+{
+	struct mcp9982_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str = priv->labels[channel];
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int mcp9982_write_limit(struct mcp9982_priv *priv, u8 address, long val)
+{
+	int ret;
+	unsigned int regh, regl;
+
+	switch (address) {
+	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
+	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
+	case MCP9982_THERM_LIMIT_ADDR(0):
+	case MCP9982_THERM_LIMIT_ADDR(1):
+	case MCP9982_THERM_LIMIT_ADDR(2):
+	case MCP9982_THERM_LIMIT_ADDR(3):
+	case MCP9982_THERM_LIMIT_ADDR(4):
+		regh = DIV_ROUND_CLOSEST(val, 1000);
+		regh = clamp_val(regh, 0, 255);
+
+		return regmap_write(priv->regmap, address, regh);
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
+	case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(1):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(2):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(3):
+	case MCP9982_EXT_LOW_LIMIT_ADDR(4):
+		val = DIV_ROUND_CLOSEST(val, 125);
+		regh = (val >> 3) & 0xff;
+		regl = (val & 0x07) << 5;
+		/* Block writing is not supported by the chip. */
+		ret = regmap_write(priv->regmap, address, regh);
+		if (ret)
+			return ret;
+
+		return regmap_write(priv->regmap, address + 1, regl);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcp9982_write_hyst(struct mcp9982_priv *priv, int channel, long val)
+{
+	int hyst, ret;
+	int limit;
+
+	val = DIV_ROUND_CLOSEST(val, 1000);
+	val = clamp_val(val, 0, 255);
+
+	/* Therm register is 8 bits and so it keeps only the integer part of the temperature. */
+	ret = regmap_read(priv->regmap, MCP9982_THERM_LIMIT_ADDR(channel), &limit);
+	if (ret)
+		return ret;
+
+	hyst = clamp_val(limit - val, 0, 255);
+
+	return regmap_write(priv->regmap, MCP9982_HYS_ADDR, hyst);
+}
+
+static int mcp9982_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
+			 long val)
+{
+	struct mcp9982_priv *priv = dev_get_drvdata(dev);
+	unsigned int idx;
+	u8 addr;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+
+			/*
+			 * For MCP998XD and MCP9933D update interval
+			 * can't be longer than 1 second.
+			 */
+			if (priv->chip->hw_thermal_shutdown)
+				val = clamp_val(val, 0, 1000);
+
+			idx = find_closest_descending(val, mcp9982_update_interval,
+						      ARRAY_SIZE(mcp9982_update_interval));
+			priv->interval_idx = idx;
+
+			return regmap_write(priv->regmap, MCP9982_CONV_ADDR, idx);
+		default:
+			return -EINVAL;
+		}
+	case hwmon_temp:
+		val = clamp_val(val, -64000, 191875);
+		val = val + (MCP9982_OFFSET * 1000);
+		switch (attr) {
+		case hwmon_temp_max:
+			if (channel)
+				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
+			else
+				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
+
+			return mcp9982_write_limit(priv, addr, val);
+		case hwmon_temp_min:
+			if (channel)
+				addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
+			else
+				addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
+
+			return mcp9982_write_limit(priv, addr, val);
+		case hwmon_temp_crit:
+			return mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
+		case hwmon_temp_crit_hyst:
+			return mcp9982_write_hyst(priv, channel, val);
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static umode_t mcp9982_is_visible(const void *_data, enum hwmon_sensor_types type, u32 attr,
+				  int channel)
+{
+	const struct mcp9982_priv *priv = _data;
+
+	if (!test_bit(channel, &priv->enabled_channel_mask))
+		return 0;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			if (priv->labels[channel])
+				return 0444;
+			else
+				return 0;
+		case hwmon_temp_input:
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_max_hyst:
+		case hwmon_temp_crit_alarm:
+			return 0444;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_hyst:
+			return 0644;
+		default:
+			return 0;
+		}
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_ops mcp9982_hwmon_ops = {
+	.is_visible = mcp9982_is_visible,
+	.read = mcp9982_read,
+	.read_string = mcp9982_read_label,
+	.write = mcp9982_write,
+};
+
+static int mcp9982_init(struct device *dev, struct mcp9982_priv *priv)
+{
+	long high_limit, low_limit;
+	unsigned int i;
+	int ret;
+	u8 val;
+
+	/* Chips 82/83 and 82D/83D do not support anti-parallel diode mode. */
+	if (!priv->chip->allow_apdd && priv->apdd_enable == 1)
+		return dev_err_probe(dev, -EINVAL, "Incorrect setting of APDD.\n");
+
+	/* Chips with "D" work only in Run state. */
+	if (priv->chip->hw_thermal_shutdown && !priv->run_state)
+		return dev_err_probe(dev, -EINVAL, "Incorrect setting of Power State.\n");
+
+	/* All chips with "D" in the name must have RECD12 enabled. */
+	if (priv->chip->hw_thermal_shutdown && !priv->recd12_enable)
+		return dev_err_probe(dev, -EINVAL, "Incorrect setting of RECD12.\n");
+	/* Chips 83D/84D/85D must have RECD34 enabled. */
+	if (priv->chip->hw_thermal_shutdown)
+		if ((priv->chip->has_recd34 && !priv->recd34_enable))
+			return dev_err_probe(dev, -EINVAL, "Incorrect setting of RECD34.\n");
+
+	/*
+	 * Set default values in registers.
+	 * APDD, RECD12 and RECD34 are active on 0.
+	 */
+	val = FIELD_PREP(MCP9982_CFG_MSKAL, 1) |
+	      FIELD_PREP(MCP9982_CFG_RS, !priv->run_state) |
+	      FIELD_PREP(MCP9982_CFG_ATTHM, 1) |
+	      FIELD_PREP(MCP9982_CFG_RECD12, !priv->recd12_enable) |
+	      FIELD_PREP(MCP9982_CFG_RECD34, !priv->recd34_enable) |
+	      FIELD_PREP(MCP9982_CFG_RANGE, 1) | FIELD_PREP(MCP9982_CFG_DA_ENA, 0) |
+	      FIELD_PREP(MCP9982_CFG_APDD, !priv->apdd_enable);
+
+	ret = regmap_write(priv->regmap, MCP9982_CFG_ADDR, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Read initial value from register.
+	 * The convert register utilises only 4 out of 8 bits.
+	 * Numerical values 0->10 set their respective update intervals,
+	 * while numerical values 11->15 default to 1 second.
+	 */
+	ret = regmap_read(priv->regmap, MCP9982_CONV_ADDR, &priv->interval_idx);
+	if (ret)
+		return ret;
+	if (priv->interval_idx >= 11)
+		priv->interval_idx = 4;
+
+	ret = regmap_write(priv->regmap, MCP9982_HYS_ADDR, MCP9982_DEFAULT_HYS_VAL);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MCP9982_CONSEC_ALRT_ADDR, MCP9982_DEFAULT_CONSEC_ALRT_VAL);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MCP9982_ALRT_CFG_ADDR, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MCP9982_RUNNING_AVG_ADDR, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MCP9982_HOTTEST_CFG_ADDR, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Only external channels 1 and 2 support beta compensation.
+	 * Set beta auto-detection.
+	 */
+	for (i = 1; i < 3; i++)
+		if (test_bit(i, &priv->enabled_channel_mask)) {
+			ret = regmap_write(priv->regmap, MCP9982_EXT_BETA_CFG_ADDR(i),
+					   MCP9982_BETA_AUTODETECT);
+			if (ret)
+				return ret;
+		}
+
+	high_limit = MCP9982_HIGH_LIMIT_DEFAULT + (MCP9982_OFFSET * 1000);
+	low_limit = MCP9982_LOW_LIMIT_DEFAULT + (MCP9982_OFFSET * 1000);
+
+	/* Set default values for internal channel limits. */
+	if (test_bit(0, &priv->enabled_channel_mask)) {
+		ret = mcp9982_write_limit(priv, MCP9982_INTERNAL_HIGH_LIMIT_ADDR, high_limit);
+		if (ret)
+			return ret;
+
+		ret = mcp9982_write_limit(priv, MCP9982_INTERNAL_LOW_LIMIT_ADDR, low_limit);
+		if (ret)
+			return ret;
+
+		ret = mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(0), high_limit);
+		if (ret)
+			return ret;
+	}
+
+	/* Set ideality factor and limits to default for external channels. */
+	for (i = 1; i < MCP9982_MAX_NUM_CHANNELS; i++)
+		if (test_bit(i, &priv->enabled_channel_mask)) {
+			ret = regmap_write(priv->regmap, MCP9982_EXT_IDEAL_ADDR(i),
+					   MCP9982_IDEALITY_DEFAULT);
+			if (ret)
+				return ret;
+
+			ret = mcp9982_write_limit(priv, MCP9982_EXT_HIGH_LIMIT_ADDR(i), high_limit);
+			if (ret)
+				return ret;
+
+			ret = mcp9982_write_limit(priv, MCP9982_EXT_LOW_LIMIT_ADDR(i), low_limit);
+			if (ret)
+				return ret;
+
+			ret = mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(i), high_limit);
+			if (ret)
+				return ret;
+		}
+
+	return 0;
+}
+
+static int mcp9982_parse_fw_config(struct device *dev, int device_nr_channels)
+{
+	struct mcp9982_priv *priv = dev_get_drvdata(dev);
+	unsigned int reg_nr;
+	int ret;
+
+	/* Initialise internal channel( which is always present ). */
+	priv->labels[0] = "internal diode";
+	priv->enabled_channel_mask = 1;
+
+	/* Default values to work on systems without devicetree or firmware nodes. */
+	if (!dev_fwnode(dev)) {
+		priv->num_channels = device_nr_channels;
+		priv->enabled_channel_mask = BIT(priv->num_channels) - 1;
+		priv->apdd_enable = false;
+		priv->recd12_enable = true;
+		priv->recd34_enable = true;
+		priv->run_state = true;
+		return 0;
+	}
+
+	priv->apdd_enable =
+		device_property_read_bool(dev, "microchip,enable-anti-parallel");
+
+	priv->recd12_enable =
+		device_property_read_bool(dev, "microchip,parasitic-res-on-channel1-2");
+
+	priv->recd34_enable =
+		device_property_read_bool(dev, "microchip,parasitic-res-on-channel3-4");
+
+	priv->run_state =
+		device_property_read_bool(dev, "microchip,power-state");
+
+	priv->num_channels = device_get_child_node_count(dev) + 1;
+
+	if (priv->num_channels > device_nr_channels)
+		return dev_err_probe(dev, -EINVAL,
+				     "More channels than the chip supports.\n");
+
+	/* Read information about the external channels. */
+	device_for_each_named_child_node_scoped(dev, child, "channel") {
+		reg_nr = 0;
+		ret = fwnode_property_read_u32(child, "reg", &reg_nr);
+		if (ret || !reg_nr || reg_nr >= device_nr_channels)
+			return dev_err_probe(dev, -EINVAL,
+			  "Channel reg is incorrectly set.\n");
+
+		fwnode_property_read_string(child, "label", &priv->labels[reg_nr]);
+		set_bit(reg_nr, &priv->enabled_channel_mask);
+	}
+
+	return 0;
+}
+
+static const struct hwmon_chip_info mcp998x_chip_info = {
+	.ops = &mcp9982_hwmon_ops,
+	.info = mcp9985_info,
+};
+
+static int mcp9982_probe(struct i2c_client *client)
+{
+	const struct mcp9982_features *chip;
+	struct device *dev = &client->dev;
+	struct mcp9982_priv *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(struct mcp9982_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = devm_regmap_init_i2c(client, &mcp9982_regmap_config);
+
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Cannot initialize register map.\n");
+
+	dev_set_drvdata(dev, priv);
+
+	chip = i2c_get_match_data(client);
+	if (!chip)
+		return -EINVAL;
+	priv->chip = chip;
+
+	ret = mcp9982_parse_fw_config(dev, chip->phys_channels);
+	if (ret)
+		return ret;
+
+	ret = mcp9982_init(dev, priv);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, chip->name, priv,
+							 &mcp998x_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id mcp9982_id[] = {
+	{ .name = "mcp9933", .driver_data = (kernel_ulong_t)&mcp9933_chip_config },
+	{ .name = "mcp9933d", .driver_data = (kernel_ulong_t)&mcp9933d_chip_config },
+	{ .name = "mcp9982", .driver_data = (kernel_ulong_t)&mcp9982_chip_config },
+	{ .name = "mcp9982d", .driver_data = (kernel_ulong_t)&mcp9982d_chip_config },
+	{ .name = "mcp9983", .driver_data = (kernel_ulong_t)&mcp9983_chip_config },
+	{ .name = "mcp9983d", .driver_data = (kernel_ulong_t)&mcp9983d_chip_config },
+	{ .name = "mcp9984", .driver_data = (kernel_ulong_t)&mcp9984_chip_config },
+	{ .name = "mcp9984d", .driver_data = (kernel_ulong_t)&mcp9984d_chip_config },
+	{ .name = "mcp9985", .driver_data = (kernel_ulong_t)&mcp9985_chip_config },
+	{ .name = "mcp9985d", .driver_data = (kernel_ulong_t)&mcp9985d_chip_config },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mcp9982_id);
+
+static const struct of_device_id mcp9982_of_match[] = {
+	{
+		.compatible = "microchip,mcp9933",
+		.data = &mcp9933_chip_config,
+	}, {
+		.compatible = "microchip,mcp9933d",
+		.data = &mcp9933d_chip_config,
+	}, {
+		.compatible = "microchip,mcp9982",
+		.data = &mcp9982_chip_config,
+	}, {
+		.compatible = "microchip,mcp9982d",
+		.data = &mcp9982d_chip_config,
+	}, {
+		.compatible = "microchip,mcp9983",
+		.data = &mcp9983_chip_config,
+	}, {
+		.compatible = "microchip,mcp9983d",
+		.data = &mcp9983d_chip_config,
+	}, {
+		.compatible = "microchip,mcp9984",
+		.data = &mcp9984_chip_config,
+	}, {
+		.compatible = "microchip,mcp9984d",
+		.data = &mcp9984d_chip_config,
+	}, {
+		.compatible = "microchip,mcp9985",
+		.data = &mcp9985_chip_config,
+	}, {
+		.compatible = "microchip,mcp9985d",
+		.data = &mcp9985d_chip_config,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mcp9982_of_match);
+
+static struct i2c_driver mcp9982_driver = {
+	.driver	 = {
+		.name = "mcp9982",
+		.of_match_table = mcp9982_of_match,
+	},
+	.probe = mcp9982_probe,
+	.id_table = mcp9982_id,
+};
+module_i2c_driver(mcp9982_driver);
+
+MODULE_AUTHOR("Victor Duicu <victor.duicu@microchip.com>");
+MODULE_DESCRIPTION("MCP998X/33 and MCP998XD/33D Multichannel Automotive Temperature Monitor Driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0

