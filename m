Received: from mx08lb.world4you.com (mx08lb.world4you.com [81.19.149.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F31186E20
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Apr 2025 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613215; cv=none; b=crLIAgOX0THr5EGfl/Nwq2qyWya+vjNnOePKE+3Ql+XNOh5wA9Pyr17Q670WNJjm2R/8yPzFAmx8s4H2zs7XMYUbP5NoU7TfDBeUK0TuAmhNFsAQVYAZ+hx23NnxOXeh0Zqbz04VyrgDZOMaZ/KtsEsCn9iR4x/9hd2xHXIYJsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613215; c=relaxed/simple;
	bh=rIp3+BIaCgtzU9fsanaifjcpjmA/jkrtSJbUIy0/RQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WFykLunGsqAz+abg9quYkKHgdv2bzr0uvHWczoq9mZFBh7qxsPGv4Qbd2o72u9Ofy7LPxc6j7V7GIliMEaoeyTNGG9D3K3QSU8AjTjTjoCLGfIv2VPi7omMcZfgjZh/rY6kY5v6d1nCEBq5dZnQYl+OlN9pFeNzZnN2DyuTeSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=QiXAb7Q/; arc=none smtp.client-ip=81.19.149.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="QiXAb7Q/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bj7Gy+1wol1f1ETiP/VC44jfg+MKsngoN2yVwO0cdxM=; b=QiXAb7Q/Ut3A9pzj80+RVf8Y+E
	mptZ0GMKu1dR5fkxDTWdNvRRweFgOV0FJ65n+9065uN+GUCWFHEYccRt35mlbI23nhz075C0Q3mu4
	JTczMV5kZoRBNKfi15hGXxSdoxcP6/7ZjdKG8V3iZqW95pnn2Jf6L1vF2MDHvgHz5bzY=;
Received: from [188.22.4.210] (helo=hornet.engleder.at)
	by mx08lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1u8P2D-0000000085N-2Tpm;
	Fri, 25 Apr 2025 21:48:30 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH] hwmon: Add KEBA fan controller support
Date: Fri, 25 Apr 2025 21:48:23 +0200
Message-Id: <20250425194823.54664-1-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-ACL-Warn: X-W4Y-Internal

From: Gerhard Engleder <eg@keba.com>

The KEBA fan controller is found in the system FPGA of KEBA PLC devices.
It detects if the fan is removed or blocked. For fans with tacho signal
the monitoring of the speed of the fan is supported. It also supports to
regulate the speed of fans with PWM input.

The auxiliary device for this driver is instantiated by the cp500 misc
driver.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
 Documentation/hwmon/index.rst |   1 +
 Documentation/hwmon/kfan.rst  |  39 ++++++
 drivers/hwmon/Kconfig         |  10 ++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/kfan.c          | 243 ++++++++++++++++++++++++++++++++++
 5 files changed, 294 insertions(+)
 create mode 100644 Documentation/hwmon/kfan.rst
 create mode 100644 drivers/hwmon/kfan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 946b8a266d89..983aa0233e4a 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -107,6 +107,7 @@ Hardware Monitoring Kernel Drivers
    k10temp
    k8temp
    kbatt
+   kfan
    lan966x
    lineage-pem
    lm25066
diff --git a/Documentation/hwmon/kfan.rst b/Documentation/hwmon/kfan.rst
new file mode 100644
index 000000000000..ce02dddfb4b8
--- /dev/null
+++ b/Documentation/hwmon/kfan.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver kfan
+==================
+
+Supported chips:
+
+  * KEBA fan controller (IP core in FPGA)
+
+    Prefix: 'kfan'
+
+Authors:
+
+	Gerhard Engleder <eg@keba.com>
+	Petar Bojanic <boja@keba.com>
+
+Description
+-----------
+
+The KEBA fan controller is an IP core for FPGAs, which monitors the health
+and controls the speed of a fan. The fan is typically used to cool the CPU
+and the whole device. E.g., the CP500 FPGA includes this IP core to monitor
+and control the fan of PLCs and the corresponding cp500 driver creates an
+auxiliary device for the kfan driver.
+
+This driver provides information about the fan health to user space.
+The user space shall be informed if the fan is removed or blocked.
+Additionally, the speed in RPM is reported for fans with tacho signal.
+
+For fan control PWM is supported. For PWM 255 equals 100%. None-regulable
+fans can be turned on with PWM 255 and turned off with PWM 0.
+
+====================== ==== ===================================================
+Attribute              R/W  Contents
+====================== ==== ===================================================
+fan1_fault             R    Fan fault
+fan1_input             R    Fan tachometer input (in RPM)
+pwm1                   RW   Fan target duty cycle (0..255)
+====================== ==== ===================================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 80e277448c71..01b21fe55ccd 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -345,6 +345,16 @@ config SENSORS_KBATT
 	  This driver can also be built as a module. If so, the module
 	  will be called kbatt.
 
+config SENSORS_KFAN
+	tristate "KEBA fan controller support"
+	depends on KEBA_CP500
+	help
+	  This driver supports the fan controller found in KEBA system
+	  FPGA devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called kfan.
+
 config SENSORS_FAM15H_POWER
 	tristate "AMD Family 15h processor power"
 	depends on X86 && PCI && CPU_SUP_AMD
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 50df221f67c2..c34a0ae658e0 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
 obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
 obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
+obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
diff --git a/drivers/hwmon/kfan.c b/drivers/hwmon/kfan.c
new file mode 100644
index 000000000000..c4f799b79e4d
--- /dev/null
+++ b/drivers/hwmon/kfan.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 KEBA Industrial Automation GmbH
+ *
+ * Driver for KEBA fan controller FPGA IP core
+ *
+ */
+
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/misc/keba.h>
+
+#define KFAN "kfan"
+
+#define KFAN_CONTROL_REG	0x04
+
+#define KFAN_STATUS_REG		0x08
+#define   KFAN_STATUS_PRESENT	0x01
+#define   KFAN_STATUS_REGULABLE	0x02
+#define   KFAN_STATUS_TACHO	0x04
+#define   KFAN_STATUS_BLOCKED	0x08
+
+#define KFAN_TACHO_REG		0x0c
+
+#define KFAN_DEFAULT_DIV	2
+
+struct kfan {
+	void __iomem *base;
+	bool tacho;
+	bool regulable;
+
+	/* hwmon API configuration */
+	u32 fan_channel_config[2];
+	struct hwmon_channel_info fan_info;
+	u32 pwm_channel_config[2];
+	struct hwmon_channel_info pwm_info;
+	const struct hwmon_channel_info *info[3];
+	struct hwmon_chip_info chip;
+};
+
+static bool kfan_get_fault(struct kfan *kfan)
+{
+	u8 status = ioread8(kfan->base + KFAN_STATUS_REG);
+
+	if (!(status & KFAN_STATUS_PRESENT))
+		return true;
+
+	if (!kfan->tacho && (status & KFAN_STATUS_BLOCKED))
+		return true;
+
+	return false;
+}
+
+static unsigned int kfan_count_to_rpm(u16 count)
+{
+	if (count == 0 || count == 0xffff)
+		return 0;
+
+	return 5000000UL / (KFAN_DEFAULT_DIV * count);
+}
+
+static unsigned int kfan_get_rpm(struct kfan *kfan)
+{
+	unsigned int rpm;
+	u16 count;
+
+	count = ioread16(kfan->base + KFAN_TACHO_REG);
+	rpm = kfan_count_to_rpm(count);
+
+	return rpm;
+}
+
+static unsigned int kfan_get_pwm(struct kfan *kfan)
+{
+	return ioread8(kfan->base + KFAN_CONTROL_REG);
+}
+
+static int kfan_set_pwm(struct kfan *kfan, long val)
+{
+	if (val < 0 || val > 0xff)
+		return -EINVAL;
+
+	/* if none-regulable, then only 0 or 0xff can be written */
+	if (!kfan->regulable && val > 0)
+		val = 0xff;
+
+	iowrite8(val, kfan->base + KFAN_CONTROL_REG);
+
+	return 0;
+}
+
+static int kfan_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
+{
+	struct kfan *kfan = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return kfan_set_pwm(kfan, val);
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int kfan_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
+{
+	struct kfan *kfan = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_fault:
+			*val = kfan_get_fault(kfan);
+			return 0;
+		case hwmon_fan_input:
+			*val = kfan_get_rpm(kfan);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			*val = kfan_get_pwm(kfan);
+			return 0;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t kfan_is_visible(const void *data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_fault:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops kfan_hwmon_ops = {
+	.is_visible = kfan_is_visible,
+	.read = kfan_read,
+	.write = kfan_write,
+};
+
+static int kfan_probe(struct auxiliary_device *auxdev,
+		      const struct auxiliary_device_id *id)
+{
+	struct keba_fan_auxdev *kfan_auxdev =
+		container_of(auxdev, struct keba_fan_auxdev, auxdev);
+	struct device *dev = &auxdev->dev;
+	struct device *hwmon_dev;
+	struct kfan *kfan;
+	u8 status;
+
+	kfan = devm_kzalloc(dev, sizeof(*kfan), GFP_KERNEL);
+	if (!kfan)
+		return -ENOMEM;
+
+	kfan->base = devm_ioremap_resource(dev, &kfan_auxdev->io);
+	if (IS_ERR(kfan->base))
+		return PTR_ERR(kfan->base);
+
+	status = ioread8(kfan->base + KFAN_STATUS_REG);
+	if (status & KFAN_STATUS_REGULABLE)
+		kfan->regulable = true;
+	if (status & KFAN_STATUS_TACHO)
+		kfan->tacho = true;
+
+	/* fan */
+	kfan->fan_channel_config[0] = HWMON_F_FAULT;
+	if (kfan->tacho)
+		kfan->fan_channel_config[0] |= HWMON_F_INPUT;
+	kfan->fan_info.type = hwmon_fan;
+	kfan->fan_info.config = kfan->fan_channel_config;
+	kfan->info[0] = &kfan->fan_info;
+
+	/* PWM */
+	kfan->pwm_channel_config[0] = HWMON_PWM_INPUT;
+	kfan->pwm_info.type = hwmon_pwm;
+	kfan->pwm_info.config = kfan->pwm_channel_config;
+	kfan->info[1] = &kfan->pwm_info;
+
+	kfan->chip.ops = &kfan_hwmon_ops;
+	kfan->chip.info = kfan->info;
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, KFAN, kfan,
+							 &kfan->chip, NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct auxiliary_device_id kfan_devtype_aux[] = {
+	{ .name = "keba.fan" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, kfan_devtype_aux);
+
+static struct auxiliary_driver kfan_driver_aux = {
+	.name = KFAN,
+	.id_table = kfan_devtype_aux,
+	.probe = kfan_probe,
+};
+module_auxiliary_driver(kfan_driver_aux);
+
+MODULE_AUTHOR("Petar Bojanic <boja@keba.com>");
+MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
+MODULE_DESCRIPTION("KEBA fan controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

