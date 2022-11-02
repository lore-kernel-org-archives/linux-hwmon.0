Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9D4C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Nov 2022 23:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbiKBX7b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Nov 2022 19:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiKBX7a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 19:59:30 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7032AF5;
        Wed,  2 Nov 2022 16:59:29 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id n83so382180oif.11;
        Wed, 02 Nov 2022 16:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GntxIwudQODkFDMoc1mhBtwK5ojOy2YlQh1t1rlc95Q=;
        b=BIUgeZa+x6tCZzxwkLQJ0iQo6zbjMvaF+Bbf77uUA7CvC7I/7qAjgAnPT2S5ctULxu
         LipjG7j8Z5jMcFzwpoUM7PeKacwjPqgwBh0eZaorPnfEjh/iuBJWaZDAnx221KDT9eRx
         ZWjwXxEjowhdpGNU0g5crxqqnCVfeqMicVCkljXYFHNYhThzDINAy/llP60bjjYTkMoa
         pMiMrUCEcQj9uOzzO/OGrpAkF+a/Y+9xC0JVLcttt8+MZE483/gvgGWSRksxOX5LKZjj
         veyIoaVkSmZWWpK9k9U5Zje4EUXUYN0M05oETPxMvi/YrCIKP4Qj6RRm/VLeZqEkdasz
         eS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GntxIwudQODkFDMoc1mhBtwK5ojOy2YlQh1t1rlc95Q=;
        b=to0JoqP8KQkBP3PD6MQNzDcJyrAQGTpF/logOmtCYP4UVo1UwKCyk8byfr0zZCir2U
         ed5mRuQdCNLC2a0MPXCwZqiADy/TnvCyB5CqdhWLx/awyxfLFNqQac9Jz3YeBb+I2hq3
         zelXb4ZQe3M3VuyVn5QMpgctivwm0QyKByzVQ2RUYUJa5sMeC/IMHifGgwFOT85LYpjM
         7t9+NK0Bj27JAMH4p66bVtaokbeK815N4DieVwXv7z+4j9TncJGx2UL2QkI6DljMdRfu
         +uj2v5/NR0ZYodPDLmEQ5Me2i4mmiyGoAX/sX3EJmQclJB9VSkJRtGRtFYvqfyE/PnM9
         7uGA==
X-Gm-Message-State: ACrzQf3J+W6etaD0nqKPOmEO497FfFfWeQp92zi2f8xIMWNPQTcu1W1v
        g/vhrFC57QQuOprPCJacJAN4RQEjIzB/sg==
X-Google-Smtp-Source: AMsMyM4Ast50DN7dVF7f+uKPNO6NLUIShRAjBXC1ijpciIYUzm4bCnCfSibtkeXZzAhsdmv9YQ1RGw==
X-Received: by 2002:a05:6808:f10:b0:354:b965:73b5 with SMTP id m16-20020a0568080f1000b00354b96573b5mr23604790oiw.117.1667433568234;
        Wed, 02 Nov 2022 16:59:28 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
        by smtp.gmail.com with ESMTPSA id w18-20020a056870b39200b0013297705e5dsm6702018oap.28.2022.11.02.16.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 16:59:27 -0700 (PDT)
From:   =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
To:     pobrn@protonmail.com
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
Subject: [PATCH v5] hwmon: add OneXPlayer mini AMD sensors driver
Date:   Wed,  2 Nov 2022 20:59:21 -0300
Message-Id: <20221102235921.582686-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Sensors driver for OXP Handhelds from One-Netbook that expose fan reading
and control via hwmon sysfs.

As far as I could gather all OXP boards have the same DMI strings and
they are told appart by the boot cpu vendor (Intel/AMD).
Currently only AMD boards are supported.

Fan control is provided via pwm interface in the range [0-255]. AMD
boards have [0-100] as range in the EC, the written value is scaled to
accommodate for that.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
Improved documentation with sysfs attributes.
Fixed missing breaks.
Shortened return code in init.
Removed debug message in read/write functions.
Cleaned a read value modification on error condition.
---
 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/oxp-sensors.rst |  34 ++++
 MAINTAINERS                         |   6 +
 drivers/hwmon/Kconfig               |  11 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/oxp-sensors.c         | 255 ++++++++++++++++++++++++++++
 6 files changed, 308 insertions(+)
 create mode 100644 Documentation/hwmon/oxp-sensors.rst
 create mode 100644 drivers/hwmon/oxp-sensors.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c1d11cf13eef..098986bfbfdd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -160,6 +160,7 @@ Hardware Monitoring Kernel Drivers
    nzxt-kraken2
    nzxt-smart2
    occ
+   oxp-sensors
    pc87360
    pc87427
    pcf8591
diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
new file mode 100644
index 000000000000..f612dddc964a
--- /dev/null
+++ b/Documentation/hwmon/oxp-sensors.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver oxp-sensors
+=========================
+
+Author:
+    - Joaquín Ignacio Aramendía <samsagax@gmail.com>
+
+Description:
+------------
+
+One X Player devices from One Netbook provide fan readings and fan control
+through its Embedded Controller.
+
+Currently only supports AMD boards from the One X Player lineup. Intel boards
+could be supported if we could figure out the EC registers and values to write
+to since the EC layout and model is different.
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+fan1_input
+  Read Only. Reads current fan RMP.
+
+pwm1_enable
+  Read Write. Enable manual fan control. Write "1" to set to manual, write "0"
+  to let the EC control de fan speed. Read this attribute to see current status.
+
+pwm1
+  Read Write. Read this attribute to see current duty cycle in the range [0-255].
+  When pwm1_enable is set to "1" (manual) write any value in the range [0-255]
+  to set fan speed.
diff --git a/MAINTAINERS b/MAINTAINERS
index 2034e7d26684..c2e24a830875 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15337,6 +15337,12 @@ S:	Maintained
 F:	drivers/mtd/nand/onenand/
 F:	include/linux/mtd/onenand*.h

+ONEXPLAYER FAN DRIVER
+M:	Joaquín Ignacio Aramendía <samsagax@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/oxp-sensors.c
+
 ONION OMEGA2+ BOARD
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mips@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7ac3daaf59ce..993ffa26e44f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1607,6 +1607,17 @@ config SENSORS_NZXT_SMART2

 source "drivers/hwmon/occ/Kconfig"

+config SENSORS_OXP
+	tristate "OneXPlayer EC fan control"
+	depends on ACPI
+	depends on X86
+	help
+		If you say yes here you get support for fan readings and control over
+		OneXPlayer handheld devices. Only OneXPlayer mini AMD handheld variant
+		boards are supported.
+
+		Can also be built as a module. In that case it will be called oxp-sensors.
+
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 11d076cad8a2..35824f8be455 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NSA320)	+= nsa320-hwmon.o
 obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
 obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
 obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
+obj-$(CONFIG_SENSORS_OXP) += oxp-sensors.o
 obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
 obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
new file mode 100644
index 000000000000..d0c1ed37ef04
--- /dev/null
+++ b/drivers/hwmon/oxp-sensors.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Platform driver for OXP Handhelds that expose fan reading and control
+ * via hwmon sysfs.
+ *
+ * All boards have the same DMI strings and they are told appart by the
+ * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
+ * but the code is made to be simple to add other handheld boards in the
+ * future.
+ * Fan control is provided via pwm interface in the range [0-255]. AMD
+ * boards use [0-100] as range in the EC, the written value is scaled to
+ * accommodate for that.
+ *
+ * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dev_printk.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/processor.h>
+
+/* Handle ACPI lock mechanism */
+static u32 oxp_mutex;
+
+#define ACPI_LOCK_DELAY_MS	500
+
+static bool lock_global_acpi_lock(void)
+{
+	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS, &oxp_mutex));
+}
+
+static bool unlock_global_acpi_lock(void)
+{
+	return ACPI_SUCCESS(acpi_release_global_lock(oxp_mutex));
+}
+
+#define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
+#define OXP_SENSOR_PWM_ENABLE_REG	0x4A /* PWM enable is 1 register long */
+#define OXP_SENSOR_PWM_REG		0x4B /* PWM reading is 1 register long */
+
+static const struct dmi_system_id dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONE XPLAYER"),
+		},
+	},
+	{},
+};
+
+/* Helper functions to handle EC read/write */
+static int read_from_ec(u8 reg, int size, long *val)
+{
+	int i;
+	int ret;
+	u8 buffer;
+
+	if (!lock_global_acpi_lock())
+		return -EBUSY;
+
+	*val = 0;
+	for (i = 0; i < size; i++) {
+		ret = ec_read(reg + i, &buffer);
+		if (ret)
+			return ret;
+		*val <<= i * 8;
+		*val += buffer;
+	}
+
+	if (!unlock_global_acpi_lock())
+		return -EBUSY;
+
+	return 0;
+}
+
+static int write_to_ec(const struct device *dev, u8 reg, u8 value)
+{
+	int ret;
+
+	if (!lock_global_acpi_lock())
+		return -EBUSY;
+
+	ret = ec_write(reg, value);
+
+	if (!unlock_global_acpi_lock())
+		return -EBUSY;
+
+	return ret;
+}
+
+static int oxp_pwm_enable(const struct device *dev)
+{
+	return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x01);
+}
+
+static int oxp_pwm_disable(const struct device *dev)
+{
+	return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x00);
+}
+
+/* Callbacks for hwmon interface */
+static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
+				       enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return 0444;
+	case hwmon_pwm:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret = read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
+			if (ret)
+				return ret;
+			*val = (*val * 255) / 100;
+			return 0;
+		case hwmon_pwm_enable:
+			return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_enable:
+			if (val == 1)
+				return oxp_pwm_enable(dev);
+			else if (val == 0)
+				return oxp_pwm_disable(dev);
+			return -EINVAL;
+		case hwmon_pwm_input:
+			if (val < 0 || val > 255)
+				return -EINVAL;
+			val = (val * 100) / 255;
+			return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+/* Known sensors in the OXP EC controllers */
+static const struct hwmon_channel_info *oxp_platform_sensors[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	NULL,
+};
+
+static const struct hwmon_ops oxp_ec_hwmon_ops = {
+	.is_visible = oxp_ec_hwmon_is_visible,
+	.read = oxp_platform_read,
+	.write = oxp_platform_write,
+};
+
+static const struct hwmon_chip_info oxp_ec_chip_info = {
+	.ops = &oxp_ec_hwmon_ops,
+	.info = oxp_platform_sensors,
+};
+
+/* Initialization logic */
+static int oxp_platform_probe(struct platform_device *pdev)
+{
+	const struct dmi_system_id *dmi_entry;
+	struct device *dev = &pdev->dev;
+	struct device *hwdev;
+
+	/*
+	 * Have to check for AMD processor here because DMI strings are the
+	 * same between Intel and AMD boards, the only way to tell them appart
+	 * is the CPU.
+	 * Intel boards seem to have different EC registers and values to
+	 * read/write.
+	 */
+	dmi_entry = dmi_first_match(dmi_table);
+	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return -ENODEV;
+
+	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
+						     &oxp_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwdev);
+}
+
+static struct platform_driver oxp_platform_driver = {
+	.driver = {
+		.name = "oxp-platform",
+	},
+	.probe = oxp_platform_probe,
+};
+
+static struct platform_device *oxp_platform_device;
+
+static int __init oxp_platform_init(void)
+{
+	oxp_platform_device =
+		platform_create_bundle(&oxp_platform_driver,
+				       oxp_platform_probe, NULL, 0, NULL, 0);
+
+	return PTR_ERR_OR_ZERO(oxp_platform_device);
+}
+
+static void __exit oxp_platform_exit(void)
+{
+	platform_device_unregister(oxp_platform_device);
+	platform_driver_unregister(&oxp_platform_driver);
+}
+
+MODULE_DEVICE_TABLE(dmi, dmi_table);
+module_init(oxp_platform_init);
+module_exit(oxp_platform_exit);
+
+MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
+MODULE_DESCRIPTION("Platform driver that handles EC sensors of OneXPlayer devices");
+MODULE_LICENSE("GPL");
--
2.38.1

