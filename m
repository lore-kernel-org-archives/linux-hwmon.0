Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E021255A
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 00:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772498816; cv=none; b=tzmDxOVFc5Ih1xqCnOynd6i25RYGAYRnRzXum8x2C2OtmP3kSPqa9XVXbnE5gTp/F/jkh4+aXCmGj9L92zSXS+MopRAE7Y9KxPpAuSzefA32BxTc/6ctkK7XsY0PJWNZYqzHPpbT1D0HoSjPclJVrGTuzdbPT7GaKFmrcFBCmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772498816; c=relaxed/simple;
	bh=GIXf6HE/q7qbbR/RBolI17WeKvwPQjv10nixy7poxVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MXCbyo2HNQPwW2oAHUgqkzRNIxDVgw2K9XYqcxsi0W1wrcTy5d4gZOEqzvvyVUgivD6D5NKpL2TmWVZ4k2oZSFGkIYbTw7A5REpoWlTBIMDJTYvZXzGkRWnsVPfDWAFVTc1DUSq+VZ1PLZyGIrufJeRTGgRNULBc4srL3wyuWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWDrJ0E3; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWDrJ0E3"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso4167997e0c.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 16:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498813; x=1773103613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnF95ePZ7l0qvGIV2lg5r1lzX6FsIaBqMbeqY7rY54k=;
        b=AWDrJ0E3XlBxksrws9+twz/a5TUeIW2ab5kFTOOZrFkNB6cdBRKNFDKdAzOzO8RU/V
         BjeyhpRHKv05NZUhyufomVG3CMMpJ6NKEc7UxNtJ8eMHhauOMHIQytzWV814JS+EGMSs
         GtjyL1nRMvYHXhaf9Wgn5DnfupzDwGHR/TKDedUFYS0WGAtzNMNUN5el1D03zbW/UD5G
         t4wolisbq9Y1Yrh0uYMnTzcmsANX+i196tmyX6SYNVbaHEfXUn9J0JT1qhXP9KXR9DFA
         8pw71bv8VHGGklKGB5D644McdFBmTwbMO8NYRZoP/3ybBZo0hMeG4+5ePZnMTC+M6cet
         s18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498813; x=1773103613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnF95ePZ7l0qvGIV2lg5r1lzX6FsIaBqMbeqY7rY54k=;
        b=Q0VVS0o/sRDzRxtnY8YkrH1cdUn21AHcdy2wLAwb/Fe7fYDzomeR1VRVTPFlkeG9aI
         oXC30LPrXE2Z29tIXuC/YRJWONRN18rOEz04oFUCj2rOeuaxa0SqcxsHKfQx2cBl8Fh+
         A4GNlulDtcW3gmxvEylSmR8difYSNnK8l6ydA1HJEnkF95vzA8o7Gva1pG8RRiypped5
         eWqNiL/WDB1XvXVV11JdfBri2rspkge/G9C5jveTY60qitEMbURnh7+V71e/FsZ8XhjD
         fPPIXubyKJMjKj1lFtXMSQxK6l0csdI8E+bPoQNVh75AKJnfWZYTfikA9LMv1w7OqwGg
         PXGA==
X-Forwarded-Encrypted: i=1; AJvYcCWddp5qXzV31aBTez/l27wb9mOBLo1+xd12yly9fLAQEoCvI7eLcKh3yc5A69mm5ZiF7BVwTBhEcnIAjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRP1u+9SfU/DMZwUYxTJp3NlhQUY0+6LRwHt5TX3zd9BoCq6vP
	YAjYZfGjJ6j0xtxqek4KSr0poDh8u2kRumizV07IZj+m3hyesWZQxkAt
X-Gm-Gg: ATEYQzzVoSJyHALuRVWNH3uKDdJZNlHWTi+RjNIM5AEmMyKMTMRJTGYHogBteOvtQUR
	Y3FihUsdVr6kMPcDGHR/1oHavkTLP3HuSncJWHqgFxUZRyoEbGSiN+eKfo/GOQFoI4OJ8U8dm5y
	iVEN73IQ6+NeOg8F7Y55yRQ5JqPpOkpvipdpES05uLSGa3b+79ZkByt+2oEeMs/69u03xc1+AGA
	NWHAnWWIxE/sZZ0hdU+iPpgYvejVEl7MhRKwNThYcO7xTt1SilNQRL1OSR2+96Q9RcR2GCXZwL0
	BfIPnKYUwcbEGR9hxLUo8r35MZ6dnj7/VZrDlE3ZMore7jZ3ydMePLnirMGflJ1hk9XLPQWime8
	SrD51M69jvvuoFx1xgbqsk4/c5upVVsKAnrcuiNxUp+d4r7PJP0kLRA864d8mVI/NPy1bIp37GW
	1zvGpeHH5vbo52n1qLXNcC3JIOiYXKRn0QIZsGDe1IW3tDCFUp0GfGJVRpvWaA/438eDeAbp0=
X-Received: by 2002:a05:6122:4585:b0:566:20e9:ff45 with SMTP id 71dfb90a1353d-56aa0a8dd67mr7203765e0c.15.1772498812985;
        Mon, 02 Mar 2026 16:46:52 -0800 (PST)
Received: from localhost.localdomain ([2800:810:454:2302:e48b:123f:7451:a642])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bbd85csm17875911e0c.7.2026.03.02.16.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:46:52 -0800 (PST)
From: Mariano Abad <weimaraner@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mariano Abad <weimaraner@gmail.com>
Subject: [PATCH v3] hwmon: Add LattePanda Sigma EC driver
Date: Mon,  2 Mar 2026 21:46:04 -0300
Message-ID: <20260303004628.3406271-1-weimaraner@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add hardware monitoring support for the LattePanda Sigma SBC
(DFRobot, ITE IT8613E EC). The driver reads fan speed and
temperatures via direct port I/O, as the BIOS disables the
ACPI EC interface.

Signed-off-by: Mariano Abad <weimaraner@gmail.com>
---
Hi Guenter,

Thank you for taking the time to review this again and for the
detailed feedback — I really appreciate your patience. The
rollover catch was a great point, I hadn't considered that
scenario.

All points addressed:

- Trimmed commit message — moved details to code comments
  and documentation
- Added devm_request_region() for both EC ports (0x62, 0x66)
  in probe — used the devm variant for consistency with the
  rest of probe which already uses devm-managed resources
- Fixed alignment on platform_device_register_simple()
- Added read-twice-verify in ec_read_reg16() to guard against
  16-bit rollover between reading high and low bytes, following
  the same approach as lm90_read16()

V2 -> V3:
- Trim commit message body (details already in code and docs)
- Reserve EC I/O ports with devm_request_region()
- Fix argument alignment in platform_device_register_simple()
- Guard ec_read_reg16() against 16-bit rollover

V1 -> V2:
- Add to Documentation/hwmon/index.rst
- Move reverse-engineering details from .rst to .c code comments
- BIOS version matching + force module parameter
- Document why no ACPI lock or driver mutex is needed
- Replace usleep_range() with udelay() (EC protocol requires it)
- Handle temperature as unsigned 8-bit
- Register platform_driver before platform_device (correct order)

v2: https://lore.kernel.org/linux-hwmon/20260302183514.3021503-1-weimaraner@gmail.com/
v1: https://lore.kernel.org/linux-hwmon/20260301023707.1184592-1-weimaraner@gmail.com/

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/lattepanda-sigma-ec.rst |  61 ++++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  17 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/lattepanda-sigma-ec.c         | 359 ++++++++++++++++++++
 6 files changed, 446 insertions(+)
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
index 000000000..f06097422
--- /dev/null
+++ b/drivers/hwmon/lattepanda-sigma-ec.c
@@ -0,0 +1,359 @@
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
+#include <linux/ioport.h>
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
+/*
+ * Read a 16-bit big-endian value from two consecutive EC registers.
+ *
+ * The EC may update the register pair between reading the high and low
+ * bytes, which could produce a corrupted value if the high byte rolls
+ * over (e.g., 0x0100 -> 0x00FF read as 0x01FF). Guard against this by
+ * re-reading the high byte after reading the low byte. If the high byte
+ * changed, re-read the low byte to get a consistent pair.
+ * See also lm90_read16() which uses the same approach.
+ */
+static int ec_read_reg16(u8 reg_hi, u8 reg_lo, u16 *val)
+{
+	int ret;
+	u8 oldh, newh, lo;
+
+	ret = ec_read_reg(reg_hi, &oldh);
+	if (ret)
+		return ret;
+
+	ret = ec_read_reg(reg_lo, &lo);
+	if (ret)
+		return ret;
+
+	ret = ec_read_reg(reg_hi, &newh);
+	if (ret)
+		return ret;
+
+	if (oldh != newh) {
+		ret = ec_read_reg(reg_lo, &lo);
+		if (ret)
+			return ret;
+	}
+
+	*val = ((u16)newh << 8) | lo;
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
+	if (!devm_request_region(dev, EC_DATA_PORT, 1, DRIVER_NAME))
+		return dev_err_probe(dev, -EBUSY,
+				     "Failed to request EC data port 0x%x\n",
+				     EC_DATA_PORT);
+
+	if (!devm_request_region(dev, EC_CMD_PORT, 1, DRIVER_NAME))
+		return dev_err_probe(dev, -EBUSY,
+				     "Failed to request EC cmd port 0x%x\n",
+				     EC_CMD_PORT);
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
+						      NULL, 0);
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

base-commit: 4d349ee5c7782f8b27f6cb550f112c5e26fff38d
-- 
2.43.0

