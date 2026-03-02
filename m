Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005A33555B
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476523; cv=none; b=SGwrqvDF5jesvn5NXuj8t9ybzLDpIAjaI/K/PkUQ14W1hHUdWN/x3OPYM7ZajGbU7S1HhwdqtgQYRaOGZUhdtPfzcW0Nsps+Y1rCrroTuUceToBCwZuKLMRvwRzo+vXkWIsQ1m33zvVSSSdrQ+rtrhDCJlXTRboxt6jtwgQ05y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476523; c=relaxed/simple;
	bh=ntc4jUoPSbnhAAjYPa10syDNxN/qr1m72Ne9BgZNsk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MybiYqIqGT5dKVMUJnZk8WcguSBYn52IA6RvMVrchAV89ML4nc3DHEh0SzFiWzpJhTuE//geuYcIO0iPBzv/HzKqFxOxVYa0ISREzh3SQUHZ0DY2dcyBPkndGaMLhQqGUsuX/QKyO8gSlCI8/Gy3Hq9Wqh2zm2FuPyBu9a4SREk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/7xm0le; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/7xm0le"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a8da2faf4so3915210e0c.2
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 10:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772476520; x=1773081320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RuQEAzHwFsJ+VP0BVRNztpjrDRuiF60+4cnF7Oj0qM=;
        b=D/7xm0leJB0ENpvoV+tHJf6+85hvomPVH761XTFBmfVMyrNQBO0df2EODlWxmht470
         FHkbJUi7fJuToMkoglppBpyAfYJ9YtnEbJVPiKTgcwX0xkUnNQJTMSvbFL5ZBUc2RSsO
         mnSeIHvbJlrAhBhZ8+/x2ORwIDu2V1X6Jsi7don1GrwMI0QdyliNNA6IGc4aqcH5LfE/
         mtfR7fWwjvoN40oCpJeM6hxvXC1sWLRxv49VSKNCt1F3/e/ZBqs58s0x5XUtfCOGQJMM
         7TKQQGK9+g+M9E4hbTuJY4JV8AgXQS6PdBA84vgEag9a8REzQyNAQwVAwD6VskEX4KKj
         9bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476520; x=1773081320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9RuQEAzHwFsJ+VP0BVRNztpjrDRuiF60+4cnF7Oj0qM=;
        b=Ka5sEX2goitHy5GRKIQg/ry5YZ4r41zvt9Jiy61Rlzl/q/gJgH9Qfqyk4+Lw7+/bnF
         DlzzPaQTwI2v0evl9rDNcbw2wa2p+bOp7peekTza+8Q59Drw/JiqIZ1LBiea6Btj2zFq
         uwdcM/R0YKz5CteXCD7Q+pfalzpEUzPMMCTKgIJ1fSgWQc+mJXMUnhMVJ/T0loooMPaI
         PkGu/4j17dsad0mPfsvAAWAJcGBjWUPE0lRp/HS2GIfWVDQCxCRlphnPV7RHfIaF3MyE
         hiOyeMUV8gOBogXgyjfI4ISGZx+ERDk6HO675iSur5sIGQSHC/3vS5quG8Ek/81u2CMk
         fqMg==
X-Gm-Message-State: AOJu0YwS52t9vjAeBRWvHSwQL/FiwZCecr0QafLmpAMYdfL4908f7voj
	BkfOlmlJ6utWUF2U+xckme3WxRzURd9wcAFGXOM3s16D0AkzNXJHpQUJDwJRD4Mi
X-Gm-Gg: ATEYQzxt8vcjs50ZTqC5zUI2fiCUja5W1IZulAkkUcXaG+lX3YebRfpc9CCTbwiFu7M
	DYuGxT8ButVYzy3voiraBK/vAncckjiB+KdrT5+RtB0II3qmKaOBqoNGwzGxzuY6G+fXq/zjcM+
	blkYeSRSLVCdMjE9Sy95gazrL4F1+HpDTRzls5yvuF0X5fYhUSTQCdet1sR0Kh2wxR94qqcAaIw
	toege3XLL8aL9rTwuGX2CMnw4Yh/m/1q9GXUTtJOQEdMyQG2ZOfV0ck755d2s1SxQPFw9mj7a8g
	otLkJ59SXROyJw71ZwRAVH+3uh4/aWOyxKrBifzr/b7bm1JBUP95Awe6TUXQXmsczaiGS3Gawds
	3T2M8z4Cco0IlYlGArkeTvrefA3NIw4paha57fU05HzBosYOuRHnvu0xWbzQ7G1rtAknfcg/Wly
	JGy6LaNbKspbhuMTZbZxUnDYQYZBOQbUIGG4vB2NmYXWNy22gV5qDP60wyCkYAnpCP1o75leo=
X-Received: by 2002:a05:6122:e44c:b0:568:ef38:a200 with SMTP id 71dfb90a1353d-56aa09bcbbamr6588953e0c.4.1772476520330;
        Mon, 02 Mar 2026 10:35:20 -0800 (PST)
Received: from localhost.localdomain ([2800:810:454:2302:e48b:123f:7451:a642])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c1cesm16549082e0c.1.2026.03.02.10.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:35:19 -0800 (PST)
From: Mariano Abad <weimaraner@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mariano Abad <weimaraner@gmail.com>
Subject: [PATCH v2] hwmon: Add LattePanda Sigma EC driver
Date: Mon,  2 Mar 2026 15:35:14 -0300
Message-ID: <20260302183514.3021503-1-weimaraner@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301023707.1184592-1-weimaraner@gmail.com>
References: <20260301023707.1184592-1-weimaraner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LattePanda Sigma is an x86 single-board computer made by DFRobot,
featuring an Intel Core i5-1340P and an ITE IT8613E Embedded Controller
that manages fan speed and thermal monitoring.

The BIOS declares the ACPI Embedded Controller (PNP0C09) with _STA
returning 0 and provides only stub ECRD/ECWT methods. Since the kernel's
ACPI EC subsystem never initializes, ec_read() is not available and
direct port I/O to the standard ACPI EC ports (0x62/0x66) is used. As
ACPI never accesses the EC, no ACPI Global Lock or namespace mutex is
required.

The driver exposes:
  - CPU fan speed (RPM, read-only)
  - Board temperature (unsigned 8-bit, degrees Celsius)
  - CPU proximity temperature (unsigned 8-bit, degrees Celsius)

DMI matching restricts the driver to verified LattePanda Sigma hardware
with BIOS version 5.27. A 'force' module parameter allows loading on
untested BIOS versions while still requiring vendor/product match.

The EC register map was discovered through firmware reverse engineering
and confirmed by physical testing.

Signed-off-by: Mariano Abad <weimaraner@gmail.com>
---
Changes in v2:
 - Add entry to Documentation/hwmon/index.rst
 - Move reverse engineering notes and ACPI explanation from .rst
   into driver source comments
 - Restrict DMI match to BIOS version 5.27; add 'force' module
   parameter for untested versions
 - Document why no ACPI lock is needed: DSDT analysis shows _STA
   returns 0 and ECRD/ECWT are stubs, so firmware never accesses
   the EC ports
 - Remove driver mutex: the hwmon with_info API already serializes
   all sysfs callbacks
 - Keep udelay() for EC polling: usleep_range() was tested but
   caused EC protocol failures; approach matches the kernel ACPI
   EC driver (drivers/acpi/ec.c)
 - Clarify temperature values are unsigned 8-bit
 - Register platform driver before platform device
 - Link to v1: https://lore.kernel.org/linux-hwmon/20260301023707.1184592-1-weimaraner@gmail.com/
 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/lattepanda-sigma-ec.rst |  61 ++++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  17 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/lattepanda-sigma-ec.c         | 329 ++++++++++++++++++++
 6 files changed, 416 insertions(+)
 create mode 100644 Documentation/hwmon/lattepanda-sigma-ec.rst
 create mode 100644 drivers/hwmon/lattepanda-sigma-ec.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d91dbb20c..dff283064 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -111,6 +111,7 @@ Hardware Monitoring Kernel Drivers
    kbatt
    kfan
    lan966x
+   lattepanda-sigma-ec
    lineage-pem
    lm25066
    lm63
diff --git a/Documentation/hwmon/lattepanda-sigma-ec.rst b/Documentation/hwmon/lattepanda-sigma-ec.rst
new file mode 100644
index 000000000..8a521ee1f
--- /dev/null
+++ b/Documentation/hwmon/lattepanda-sigma-ec.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver lattepanda-sigma-ec
+=================================
+
+Supported systems:
+
+  * LattePanda Sigma (Intel 13th Gen i5-1340P)
+
+    DMI vendor: LattePanda
+
+    DMI product: LattePanda Sigma
+
+    BIOS version: 5.27 (verified)
+
+    Datasheet: Not available (EC registers discovered empirically)
+
+Author: Mariano Abad <weimaraner@gmail.com>
+
+Description
+-----------
+
+This driver provides hardware monitoring for the LattePanda Sigma
+single-board computer made by DFRobot. The board uses an ITE IT8613E
+Embedded Controller to manage a CPU cooling fan and thermal sensors.
+
+The BIOS declares the ACPI Embedded Controller (``PNP0C09``) with
+``_STA`` returning 0, preventing the kernel's ACPI EC subsystem from
+initializing. This driver reads the EC directly via the standard ACPI
+EC I/O ports (``0x62`` data, ``0x66`` command/status).
+
+Sysfs attributes
+----------------
+
+======================= ===============================================
+``fan1_input``          Fan speed in RPM (EC registers 0x2E:0x2F,
+                        16-bit big-endian)
+``fan1_label``          "CPU Fan"
+``temp1_input``         Board/ambient temperature in millidegrees
+                        Celsius (EC register 0x60, unsigned)
+``temp1_label``         "Board Temp"
+``temp2_input``         CPU proximity temperature in millidegrees
+                        Celsius (EC register 0x70, unsigned)
+``temp2_label``         "CPU Temp"
+======================= ===============================================
+
+Module parameters
+-----------------
+
+``force`` (bool, default false)
+    Force loading on BIOS versions other than 5.27. The driver still
+    requires DMI vendor and product name matching.
+
+Known limitations
+-----------------
+
+* Fan speed control is not supported. The fan is always under EC
+  automatic control.
+* The EC register map was verified only on BIOS version 5.27.
+  Other versions may use different register offsets; use the ``force``
+  parameter at your own risk.
diff --git a/MAINTAINERS b/MAINTAINERS
index 96e97d25e..7b0c5bb5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14414,6 +14414,13 @@ F:	drivers/net/wan/framer/
 F:	drivers/pinctrl/pinctrl-pef2256.c
 F:	include/linux/framer/
 
+LATTEPANDA SIGMA EC HARDWARE MONITOR DRIVER
+M:	Mariano Abad <weimaraner@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/lattepanda-sigma-ec.rst
+F:	drivers/hwmon/lattepanda-sigma-ec.c
+
 LASI 53c700 driver for PARISC
 M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
 L:	linux-scsi@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764..f2e2ee96f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -990,6 +990,23 @@ config SENSORS_LAN966X
 	  This driver can also be built as a module. If so, the module
 	  will be called lan966x-hwmon.
 
+config SENSORS_LATTEPANDA_SIGMA_EC
+	tristate "LattePanda Sigma EC hardware monitoring"
+	depends on X86
+	depends on DMI
+	depends on HAS_IOPORT
+	help
+	  If you say yes here you get support for the hardware monitoring
+	  features of the Embedded Controller on LattePanda Sigma
+	  single-board computers, including CPU fan speed (RPM) and
+	  board and CPU temperatures.
+
+	  The driver reads the EC directly via ACPI EC I/O ports and
+	  uses DMI matching to ensure it only loads on supported hardware.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called lattepanda-sigma-ec.
+
 config SENSORS_LENOVO_EC
         tristate "Sensor reader for Lenovo ThinkStations"
         depends on X86
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1..0372fedbb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -114,6 +114,7 @@ obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
 obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
 obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
+obj-$(CONFIG_SENSORS_LATTEPANDA_SIGMA_EC) += lattepanda-sigma-ec.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
 obj-$(CONFIG_SENSORS_LOCHNAGAR)	+= lochnagar-hwmon.o
diff --git a/drivers/hwmon/lattepanda-sigma-ec.c b/drivers/hwmon/lattepanda-sigma-ec.c
new file mode 100644
index 000000000..2ba51a20d
--- /dev/null
+++ b/drivers/hwmon/lattepanda-sigma-ec.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for LattePanda Sigma EC.
+ *
+ * The LattePanda Sigma is an x86 SBC made by DFRobot with an ITE IT8613E
+ * Embedded Controller that manages a CPU fan and thermal sensors.
+ *
+ * The BIOS declares the ACPI Embedded Controller (PNP0C09) with _STA
+ * returning 0 and provides only stub ECRD/ECWT methods that return Zero
+ * for all registers. Since the kernel's ACPI EC subsystem never initializes,
+ * ec_read() is not available and direct port I/O to the standard ACPI EC
+ * ports (0x62/0x66) is used instead.
+ *
+ * Because ACPI never initializes the EC, there is no concurrent firmware
+ * access to these ports, and no ACPI Global Lock or namespace mutex is
+ * required. The hwmon with_info API serializes all sysfs callbacks,
+ * so no additional driver-level locking is needed.
+ *
+ * The EC register map was discovered by dumping all 256 registers,
+ * identifying those that change in real-time, and validating by physically
+ * stopping the fan and observing the RPM register drop to zero. The map
+ * has been verified on BIOS version 5.27; other versions may differ.
+ *
+ * Copyright (c) 2026 Mariano Abad <weimaraner@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME	"lattepanda_sigma_ec"
+
+/* EC I/O ports (standard ACPI EC interface) */
+#define EC_DATA_PORT	0x62
+#define EC_CMD_PORT	0x66	/* also status port */
+
+/* EC commands */
+#define EC_CMD_READ	0x80
+
+/* EC status register bits */
+#define EC_STATUS_OBF	0x01	/* Output Buffer Full */
+#define EC_STATUS_IBF	0x02	/* Input Buffer Full */
+
+/* EC register offsets for LattePanda Sigma (BIOS 5.27) */
+#define EC_REG_FAN_RPM_HI	0x2E
+#define EC_REG_FAN_RPM_LO	0x2F
+#define EC_REG_TEMP_BOARD	0x60
+#define EC_REG_TEMP_CPU		0x70
+#define EC_REG_FAN_DUTY		0x93
+
+/*
+ * EC polling uses udelay() because the EC typically responds within a
+ * few microseconds. The kernel's own ACPI EC driver (drivers/acpi/ec.c)
+ * likewise uses udelay() for busy-polling with a per-poll delay of 550us.
+ *
+ * usleep_range() was tested but caused EC protocol failures: the EC
+ * clears its status flags within microseconds, and sleeping for 50-100us
+ * between polls allowed the flags to transition past the expected state.
+ *
+ * The worst-case total busy-wait of 25ms covers EC recovery after errors.
+ * In practice the EC responds within 10us so the loop exits immediately.
+ */
+#define EC_TIMEOUT_US		25000
+#define EC_POLL_US		1
+
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force,
+		 "Force loading on untested BIOS versions (default: false)");
+
+static struct platform_device *lps_ec_pdev;
+
+static int ec_wait_ibf_clear(void)
+{
+	int i;
+
+	for (i = 0; i < EC_TIMEOUT_US; i++) {
+		if (!(inb(EC_CMD_PORT) & EC_STATUS_IBF))
+			return 0;
+		udelay(EC_POLL_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int ec_wait_obf_set(void)
+{
+	int i;
+
+	for (i = 0; i < EC_TIMEOUT_US; i++) {
+		if (inb(EC_CMD_PORT) & EC_STATUS_OBF)
+			return 0;
+		udelay(EC_POLL_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int ec_read_reg(u8 reg, u8 *val)
+{
+	int ret;
+
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		return ret;
+
+	outb(EC_CMD_READ, EC_CMD_PORT);
+
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		return ret;
+
+	outb(reg, EC_DATA_PORT);
+
+	ret = ec_wait_obf_set();
+	if (ret)
+		return ret;
+
+	*val = inb(EC_DATA_PORT);
+	return 0;
+}
+
+/* Read a 16-bit big-endian value from two consecutive EC registers. */
+static int ec_read_reg16(u8 reg_hi, u8 reg_lo, u16 *val)
+{
+	int ret;
+	u8 hi, lo;
+
+	ret = ec_read_reg(reg_hi, &hi);
+	if (ret)
+		return ret;
+
+	ret = ec_read_reg(reg_lo, &lo);
+	if (ret)
+		return ret;
+
+	*val = ((u16)hi << 8) | lo;
+	return 0;
+}
+
+static int
+lps_ec_read_string(struct device *dev,
+		   enum hwmon_sensor_types type,
+		   u32 attr, int channel,
+		   const char **str)
+{
+	switch (type) {
+	case hwmon_fan:
+		*str = "CPU Fan";
+		return 0;
+	case hwmon_temp:
+		*str = channel == 0 ? "Board Temp" : "CPU Temp";
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t
+lps_ec_is_visible(const void *drvdata,
+		  enum hwmon_sensor_types type,
+		  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		if (attr == hwmon_fan_input || attr == hwmon_fan_label)
+			return 0444;
+		break;
+	case hwmon_temp:
+		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
+			return 0444;
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int
+lps_ec_read(struct device *dev,
+	    enum hwmon_sensor_types type,
+	    u32 attr, int channel, long *val)
+{
+	u16 rpm;
+	u8 v;
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			return -EOPNOTSUPP;
+		ret = ec_read_reg16(EC_REG_FAN_RPM_HI,
+				    EC_REG_FAN_RPM_LO, &rpm);
+		if (ret)
+			return ret;
+		*val = rpm;
+		return 0;
+
+	case hwmon_temp:
+		if (attr != hwmon_temp_input)
+			return -EOPNOTSUPP;
+		ret = ec_read_reg(channel == 0 ? EC_REG_TEMP_BOARD
+					       : EC_REG_TEMP_CPU,
+				  &v);
+		if (ret)
+			return ret;
+		/* EC reports unsigned 8-bit temperature in degrees Celsius */
+		*val = (unsigned long)v * 1000;
+		return 0;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info * const lps_ec_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops lps_ec_ops = {
+	.is_visible = lps_ec_is_visible,
+	.read = lps_ec_read,
+	.read_string = lps_ec_read_string,
+};
+
+static const struct hwmon_chip_info lps_ec_chip_info = {
+	.ops = &lps_ec_ops,
+	.info = lps_ec_info,
+};
+
+static int lps_ec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *hwmon;
+	u8 test;
+	int ret;
+
+	/* Sanity check: verify EC is responsive */
+	ret = ec_read_reg(EC_REG_FAN_DUTY, &test);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "EC not responding on ports 0x%x/0x%x\n",
+				     EC_DATA_PORT, EC_CMD_PORT);
+
+	hwmon = devm_hwmon_device_register_with_info(dev, DRIVER_NAME, NULL,
+						     &lps_ec_chip_info, NULL);
+	if (IS_ERR(hwmon))
+		return dev_err_probe(dev, PTR_ERR(hwmon),
+				     "Failed to register hwmon device\n");
+
+	dev_info(dev, "EC hwmon registered (fan duty: %u%%)\n", test);
+	return 0;
+}
+
+/* DMI table with strict BIOS version match (override with force=1) */
+static const struct dmi_system_id lps_ec_dmi_table[] = {
+	{
+		.ident = "LattePanda Sigma",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LattePanda"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LattePanda Sigma"),
+			DMI_MATCH(DMI_BIOS_VERSION, "5.27"),
+		},
+	},
+	{ }	/* terminator */
+};
+MODULE_DEVICE_TABLE(dmi, lps_ec_dmi_table);
+
+/* Loose table (vendor + product only) for use with force=1 */
+static const struct dmi_system_id lps_ec_dmi_table_force[] = {
+	{
+		.ident = "LattePanda Sigma",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LattePanda"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LattePanda Sigma"),
+		},
+	},
+	{ }	/* terminator */
+};
+
+static struct platform_driver lps_ec_driver = {
+	.probe	= lps_ec_probe,
+	.driver	= {
+		.name = DRIVER_NAME,
+	},
+};
+
+static int __init lps_ec_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(lps_ec_dmi_table)) {
+		if (!force || !dmi_check_system(lps_ec_dmi_table_force))
+			return -ENODEV;
+		pr_warn("%s: BIOS version not verified, loading due to force=1\n",
+			DRIVER_NAME);
+	}
+
+	ret = platform_driver_register(&lps_ec_driver);
+	if (ret)
+		return ret;
+
+	lps_ec_pdev = platform_device_register_simple(DRIVER_NAME, -1,
+						       NULL, 0);
+	if (IS_ERR(lps_ec_pdev)) {
+		platform_driver_unregister(&lps_ec_driver);
+		return PTR_ERR(lps_ec_pdev);
+	}
+
+	return 0;
+}
+
+static void __exit lps_ec_exit(void)
+{
+	platform_device_unregister(lps_ec_pdev);
+	platform_driver_unregister(&lps_ec_driver);
+}
+
+module_init(lps_ec_init);
+module_exit(lps_ec_exit);
+
+MODULE_AUTHOR("Mariano Abad <weimaraner@gmail.com>");
+MODULE_DESCRIPTION("Hardware monitoring driver for LattePanda Sigma EC");
+MODULE_LICENSE("GPL");
-- 
2.43.0

