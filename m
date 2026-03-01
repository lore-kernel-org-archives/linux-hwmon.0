Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4397430B50D
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Mar 2026 02:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772332635; cv=none; b=ZDK5/s6c3AxfYlW6F6RANiPBhKjhwKZhoZep10ZPss1lhYS+JOiB0ynFZ9RPCKElR34Z6yIzRJLA+Syt6Y8bT0++0z2fqeafFVXC4Pcr3BekbWpWFrwtl2jNOARyfGxQNUToBuSNGnGMMMzde13qhY3oZdvtGvZEW+V67ftWt1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772332635; c=relaxed/simple;
	bh=IyEbJYxrsV1JBwMnMEihZVIf7mSxu6wGclfq/BJprUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8df0QkDrsYzd+iPv2G5Fjv7uted0xNr25GHl5o63X1/cQL2A9riJWL4jqH0VfSGaS9rNGL03n8ZD6jNmIm/6sBqBMpiRu4vJU+9aA1TKokWDlT3DaT9ogpZmvC5qK3WUIkPdgN7DMIXEXBkO5FwST927QgcKOikmwyP/pYpdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqrNlxQl; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqrNlxQl"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so964307241.2
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Feb 2026 18:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772332633; x=1772937433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/i9SCxmAm1rOFvHJgHTXMn0zU3SmPhUk/avAtlfnink=;
        b=NqrNlxQlXTtGgc+V8jAnQsqOadn/uqBt8teiuWEO5ZlCTnb8vR/iP/PjPj1rC4jTYD
         3iwzbyt0WogokPIX0z3gekSTHfbxvXsBmUte+6Lvm9XtdoB3bccfzmEmxnM9/SQDg3tj
         3Qi2HZFYe4hMYb+aQ0Bp7Hac9lMHJpVwfSmvRqBTNT9zG/hWST4eZeBDFyaEWCBnklLI
         GEC1iVHPklOxRqTjMEWHYqH1KaSzgGZUwA60MSB8ogKIqfm0vZBXGZ5MeFVBI8qLYigG
         +G2OqV5N5mXwQovNx0smMqlyB8x6d6ddikrJAgWtwjZTTuQtwz7Lj3SlpuJmTHjInZjq
         5S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772332633; x=1772937433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i9SCxmAm1rOFvHJgHTXMn0zU3SmPhUk/avAtlfnink=;
        b=QKx/nZeptIIKkJN4KZw3pAmyXxDfGYZFyG30Z7Ot6s02SvEgRWumBETzBneTTHj1A+
         WhzcNBTdiwdBFfYO4MYBAphVTyDqJwv6Lnm2C37tqJNQPp4GKEH9Jd6acennktaWdAJ5
         h5Jvd+Fb76qHv7Kaaq1UP7E/8tuUNyXj+EXCkVeoL8B1uY0XsKqP8JFFnyrT9xqUSeEX
         YiqqYz92XBwvZiYHJmk9BrWYOvlAkAx+FJLMeTxkvY+YtJrw5teGuTlBoRVCa6p5Ia/h
         NWNXif5v9Ow894Rq2Zhv6FB4VHcpvM4eV/9CmQPUTSuTR+7M4VQTWXuj8IQegU1uYXre
         kMcw==
X-Gm-Message-State: AOJu0Yxpdw9i075yRV137LpYGlLtMQQNnuAPhFdG9NLfRB4wPlUBTaOL
	1Upzy5WMpxm3/ONDnbMfI8bKXctFQtfG9St31tPGsvh6vfzbrPFOzL9WoDBf2w==
X-Gm-Gg: ATEYQzz9pABrHjb689RBKViNfibOyP6N+NkORikZzT8ymU6s6/9jHi2qMeWJuvfHSSe
	+VB7tUwHTbAzrNNJ712ccT57fsbACa383pzwzsL8tctoalt1ixKFqNoSQ/Mku/L/im0DJ2UE37z
	hKJLqgokRue3D8Y0SoGuEkV0lT23+ck3GRNLbT6tSFPr4O6flWnFMXfRP5WdMaejk3PKAvdaRSz
	QsocbtA/Uu8xkRu+rvnqDaZJZiVUZy03dtGtq57VM8nAujvo/A2Bmzj7ItaPtjjCR/p/Cpw0PML
	59Q3o82PYr2II20GYyGc2gq+mmrlgV0R+Tf3xuANjz7ZS3dlypu5B/zXxWM2fuA6/zcx+J+yfPw
	l0bvZO/YKx30VcJ0cMCCBVyRAFi7YZp2iN0Uf/76LAy3sa5KwIn04gU8aUpQ3G9VwwnTM4qy245
	yZrYYRyHogtTveqDpFAB83Fi/xohizA11FdSn76Afuad0+GeZZeEz09/itgK18lwuiPT0Wdes=
X-Received: by 2002:a05:6102:5090:b0:5ed:679:d9ce with SMTP id ada2fe7eead31-5ff32308df7mr3098189137.9.1772332632823;
        Sat, 28 Feb 2026 18:37:12 -0800 (PST)
Received: from localhost.localdomain ([2800:810:454:2302:21e3:1f3d:4de1:310a])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df61672ddsm8703261241.0.2026.02.28.18.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 18:37:11 -0800 (PST)
From: Mariano Abad <weimaraner@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mariano Abad <weimaraner@gmail.com>
Subject: [PATCH] hwmon: Add LattePanda Sigma EC driver
Date: Sat, 28 Feb 2026 23:37:07 -0300
Message-ID: <20260301023707.1184592-1-weimaraner@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The BIOS declares the ACPI Embedded Controller as disabled (_STA returns
0), so standard Linux hwmon interfaces do not expose the EC sensors.
This driver reads the EC directly via the ACPI EC I/O ports (0x62/0x66)
to provide:
  - CPU fan speed (RPM)
  - Board temperature
  - CPU proximity temperature

The driver uses DMI matching and only loads on verified LattePanda Sigma
hardware. Fan speed is controlled autonomously by the EC firmware and is
read-only from the host.

The EC register map was discovered through firmware reverse engineering
and confirmed by physical testing (stopping the fan, observing RPM drop
to zero).

Signed-off-by: Mariano Abad <weimaraner@gmail.com>
---
 Documentation/hwmon/lattepanda-sigma-ec.rst |  64 ++++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  17 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/lattepanda-sigma-ec.c         | 328 ++++++++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 Documentation/hwmon/lattepanda-sigma-ec.rst
 create mode 100644 drivers/hwmon/lattepanda-sigma-ec.c

diff --git a/Documentation/hwmon/lattepanda-sigma-ec.rst b/Documentation/hwmon/lattepanda-sigma-ec.rst
new file mode 100644
index 000000000..e8bc9a71e
--- /dev/null
+++ b/Documentation/hwmon/lattepanda-sigma-ec.rst
@@ -0,0 +1,64 @@
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
+    Datasheet: Not available (EC registers discovered empirically)
+
+Author: Mariano Abad <weimaraner@gmail.com>
+
+Description
+-----------
+
+This driver provides hardware monitoring for the LattePanda Sigma
+single-board computer. The board's Embedded Controller manages a CPU
+cooling fan but does not expose sensor data through standard ACPI
+interfaces.
+
+The BIOS declares the ACPI Embedded Controller (``PNP0C09``) with
+``_STA`` returning 0 (not present), preventing the kernel's ACPI EC
+subsystem from initializing. However, the EC hardware is fully
+functional on the standard ACPI EC I/O ports (``0x62`` data, ``0x66``
+command/status). This driver uses direct port I/O with EC read command
+``0x80`` to access sensor registers.
+
+The EC register map was discovered empirically by dumping all 256
+registers, identifying those that change in real-time, then validating
+by physically stopping the fan and observing the RPM drop to zero.
+
+The driver uses DMI matching and will only load on LattePanda Sigma
+hardware.
+
+Sysfs attributes
+----------------
+
+======================= ===============================================
+``fan1_input``          Fan speed in RPM (EC registers 0x2E:0x2F,
+                        16-bit big-endian)
+``fan1_label``          "CPU Fan"
+``temp1_input``         Board/ambient temperature in millidegrees
+                        Celsius (EC register 0x60)
+``temp1_label``         "Board Temp"
+``temp2_input``         CPU proximity temperature in millidegrees
+                        Celsius (EC register 0x70)
+``temp2_label``         "CPU Temp"
+======================= ===============================================
+
+Known limitations
+-----------------
+
+* The EC register map was reverse-engineered on a LattePanda Sigma with
+  BIOS version 5.27. Different BIOS versions may use different register
+  offsets.
+* Fan speed control is not supported. The fan is always under EC
+  automatic control.
+* The I/O ports ``0x62``/``0x66`` are shared with the ACPI EC subsystem
+  and are not exclusively reserved by this driver.
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
index 000000000..60558e449
--- /dev/null
+++ b/drivers/hwmon/lattepanda-sigma-ec.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for LattePanda Sigma EC.
+ *
+ * Reads fan RPM and temperatures from the Embedded Controller via
+ * ACPI EC I/O ports (0x62 data, 0x66 cmd/status). The BIOS reports
+ * the ACPI EC as disabled (_STA=0), so direct port I/O is used.
+ *
+ * Copyright (c) 2026 Mariano Abad <weimaraner@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
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
+/* EC register offsets for LattePanda Sigma */
+#define EC_REG_FAN_RPM_HI	0x2E
+#define EC_REG_FAN_RPM_LO	0x2F
+#define EC_REG_TEMP1		0x60
+#define EC_REG_TEMP2		0x70
+#define EC_REG_FAN_DUTY		0x93
+
+/* Timeout for EC operations (in microseconds) */
+#define EC_TIMEOUT_US		25000
+#define EC_POLL_INTERVAL_US	5
+
+struct lattepanda_sigma_ec_data {
+	struct mutex lock;	/* serialize EC access */
+};
+
+static struct platform_device *lps_ec_pdev;
+
+static int ec_wait_ibf_clear(void)
+{
+	int timeout = EC_TIMEOUT_US / EC_POLL_INTERVAL_US;
+
+	while (timeout--) {
+		if (!(inb(EC_CMD_PORT) & EC_STATUS_IBF))
+			return 0;
+		udelay(EC_POLL_INTERVAL_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int ec_wait_obf_set(void)
+{
+	int timeout = EC_TIMEOUT_US / EC_POLL_INTERVAL_US;
+
+	while (timeout--) {
+		if (inb(EC_CMD_PORT) & EC_STATUS_OBF)
+			return 0;
+		udelay(EC_POLL_INTERVAL_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int ec_read_reg(struct lattepanda_sigma_ec_data *data, u8 reg, u8 *val)
+{
+	int ret;
+
+	mutex_lock(&data->lock);
+
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		goto out;
+
+	outb(EC_CMD_READ, EC_CMD_PORT);
+
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		goto out;
+
+	outb(reg, EC_DATA_PORT);
+
+	ret = ec_wait_obf_set();
+	if (ret)
+		goto out;
+
+	*val = inb(EC_DATA_PORT);
+
+out:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+/*
+ * Read a 16-bit big-endian value from two consecutive EC registers.
+ * Both bytes are read within a single mutex hold to prevent tearing.
+ */
+static int ec_read_reg16(struct lattepanda_sigma_ec_data *data,
+			 u8 reg_hi, u8 reg_lo, u16 *val)
+{
+	int ret;
+	u8 hi, lo;
+
+	mutex_lock(&data->lock);
+
+	/* Read high byte */
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		goto out;
+	outb(EC_CMD_READ, EC_CMD_PORT);
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		goto out;
+	outb(reg_hi, EC_DATA_PORT);
+	ret = ec_wait_obf_set();
+	if (ret)
+		goto out;
+	hi = inb(EC_DATA_PORT);
+
+	/* Read low byte */
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		goto out;
+	outb(EC_CMD_READ, EC_CMD_PORT);
+	ret = ec_wait_ibf_clear();
+	if (ret)
+		goto out;
+	outb(reg_lo, EC_DATA_PORT);
+	ret = ec_wait_obf_set();
+	if (ret)
+		goto out;
+	lo = inb(EC_DATA_PORT);
+
+	*val = ((u16)hi << 8) | lo;
+
+out:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int
+lattepanda_sigma_ec_read_string(struct device *dev,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel,
+				const char **str)
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
+lattepanda_sigma_ec_is_visible(const void *drvdata,
+			       enum hwmon_sensor_types type,
+			       u32 attr, int channel)
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
+lattepanda_sigma_ec_read(struct device *dev,
+			 enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct lattepanda_sigma_ec_data *data = dev_get_drvdata(dev);
+	u16 rpm;
+	u8 v;
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			return -EOPNOTSUPP;
+		ret = ec_read_reg16(data, EC_REG_FAN_RPM_HI,
+				    EC_REG_FAN_RPM_LO, &rpm);
+		if (ret)
+			return ret;
+		*val = rpm;
+		return 0;
+
+	case hwmon_temp:
+		if (attr != hwmon_temp_input)
+			return -EOPNOTSUPP;
+		ret = ec_read_reg(data,
+				  channel == 0 ? EC_REG_TEMP1 : EC_REG_TEMP2,
+				  &v);
+		if (ret)
+			return ret;
+		/* hwmon temps are in millidegrees Celsius */
+		*val = (long)v * 1000;
+		return 0;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info * const lattepanda_sigma_ec_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops lattepanda_sigma_ec_ops = {
+	.is_visible = lattepanda_sigma_ec_is_visible,
+	.read = lattepanda_sigma_ec_read,
+	.read_string = lattepanda_sigma_ec_read_string,
+};
+
+static const struct hwmon_chip_info lattepanda_sigma_ec_chip_info = {
+	.ops = &lattepanda_sigma_ec_ops,
+	.info = lattepanda_sigma_ec_info,
+};
+
+static int lattepanda_sigma_ec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lattepanda_sigma_ec_data *data;
+	struct device *hwmon;
+	u8 test;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->lock);
+	platform_set_drvdata(pdev, data);
+
+	/* Sanity check: verify EC is responsive */
+	ret = ec_read_reg(data, EC_REG_FAN_DUTY, &test);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "EC not responding on ports 0x%x/0x%x\n",
+				     EC_DATA_PORT, EC_CMD_PORT);
+
+	hwmon = devm_hwmon_device_register_with_info(dev, DRIVER_NAME, data,
+						     &lattepanda_sigma_ec_chip_info,
+						     NULL);
+	if (IS_ERR(hwmon))
+		return dev_err_probe(dev, PTR_ERR(hwmon),
+				     "Failed to register hwmon device\n");
+
+	dev_dbg(dev, "EC hwmon registered (fan duty: %u%%)\n", test);
+	return 0;
+}
+
+static const struct dmi_system_id lattepanda_sigma_ec_dmi_table[] = {
+	{
+		.ident = "LattePanda Sigma",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LattePanda"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LattePanda Sigma"),
+		},
+	},
+	{ }	/* terminator */
+};
+MODULE_DEVICE_TABLE(dmi, lattepanda_sigma_ec_dmi_table);
+
+static struct platform_driver lattepanda_sigma_ec_driver = {
+	.probe	= lattepanda_sigma_ec_probe,
+	.driver	= {
+		.name = DRIVER_NAME,
+	},
+};
+
+static int __init lattepanda_sigma_ec_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(lattepanda_sigma_ec_dmi_table))
+		return -ENODEV;
+
+	lps_ec_pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	if (IS_ERR(lps_ec_pdev))
+		return PTR_ERR(lps_ec_pdev);
+
+	ret = platform_driver_register(&lattepanda_sigma_ec_driver);
+	if (ret) {
+		platform_device_unregister(lps_ec_pdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit lattepanda_sigma_ec_exit(void)
+{
+	platform_driver_unregister(&lattepanda_sigma_ec_driver);
+	platform_device_unregister(lps_ec_pdev);
+}
+
+module_init(lattepanda_sigma_ec_init);
+module_exit(lattepanda_sigma_ec_exit);
+
+MODULE_AUTHOR("Mariano Abad <weimaraner@gmail.com>");
+MODULE_DESCRIPTION("Hardware monitoring driver for LattePanda Sigma EC");
+MODULE_LICENSE("GPL");
-- 
2.43.0

