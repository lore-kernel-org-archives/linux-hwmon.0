Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1406FC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Nov 2022 14:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbiKDOIW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Nov 2022 10:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbiKDOHr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Nov 2022 10:07:47 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DA22F025;
        Fri,  4 Nov 2022 07:07:38 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id x6-20020a4ac586000000b0047f8cc6dbe4so687523oop.3;
        Fri, 04 Nov 2022 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQj+CXemdtKFOzJq4mpF8Ytv6R7dbZYbjV7YrSRih0s=;
        b=Xw6P2RPUypo1f+idSTxxgVkQWFOjbfMnk4Hu4EHBoVZN9lGcRN8aujO4356RqH+8OE
         pcMjFVollDd13QdR0l2Zf9gNZLEhgiYX0c3F220uorrZhGiesm/NIYnrN3BnWhlXiMO4
         tYD1u/FoUNDxG2CQuP6ze4Gtb2iK6dQ3VXmCL8VFJ8jIDvE1heLdLv9bzjGbihcDARUu
         9BOn90QZOtELEbZyC2/EEf2fpg4nvVwyjbsumHiIJgIfAGMZLiRbXSsiMUf1GlH3h39C
         pRIukFXte5BwdxQil/7rAzhTd7sGRb1MvVArRXQbvUWxX4wAu3zKRM36x94/USXokgI/
         OzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQj+CXemdtKFOzJq4mpF8Ytv6R7dbZYbjV7YrSRih0s=;
        b=jTpyG4CjEnZOjzpgScKFpBsmsY+vH1CD5ARprbE2M5Te7nH6aflSVWnEq7wH/N2ib0
         ng7+c+YIQxpjb7Dw/qT8YXLroC1ZwRWzCaJdWPrl/7DomQDVUntEMIcU7PiSUVzIDagH
         heMZs29M8rRt6TdWqEIebSQ3E6qET9mWf6oiyLc/dXdAv/33FoASjPkY2UEgf+bkKoxo
         msenfMgtM4dvhGvGjm+XId9N2F0o+qDK5Wi2oZa8k35LoME3GlVQObGvjy/O87EDDg/M
         0LKyEP76w6cP1LlW79vgXPiiXz91ETkGrccxul/Mh9WrC7gkxLGHjnNb7J7nWX5I1XAA
         KrPw==
X-Gm-Message-State: ACrzQf1/3eVt78mGy496M5uoqQZIur6HvwEPA/ItgERtkeL7r/y4lxCg
        2k59k0/17nRr/KCzS+KD4sA=
X-Google-Smtp-Source: AMsMyM4jcLcjoJ6vC8RhJKRZlg4BQ2EPKirw2UNPFsmNIJtvSBFdLhXL+I6OpRgiw5LYYuwcRdyirQ==
X-Received: by 2002:a4a:a609:0:b0:499:74ab:f10e with SMTP id e9-20020a4aa609000000b0049974abf10emr14118871oom.13.1667570857474;
        Fri, 04 Nov 2022 07:07:37 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
        by smtp.gmail.com with ESMTPSA id n12-20020a056870240c00b00131c3d4d38fsm1759382oap.39.2022.11.04.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:07:36 -0700 (PDT)
From:   =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
To:     pobrn@protonmail.com
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
Subject: [PATCH v6] hwmon: add OneXPlayer mini AMD sensors driver
Date:   Fri,  4 Nov 2022 11:07:00 -0300
Message-Id: <20221104140659.593608-1-samsagax@gmail.com>
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
they can be told appart only by the boot cpu vendor (Intel/AMD).
Currently only AMD boards are supported since Intel have different EC
registers and values to read/write.

Fan control is provided via pwm interface in the range [0-255]. AMD
boards have [0-100] as range in the EC, the written value is scaled to
accommodate for that.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
Improved documentation.
Fixed some coding issues according to feedback.
Added comment on module_platform_driver() usage.
---
 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/oxp-sensors.rst |  34 ++++
 MAINTAINERS                         |   6 +
 drivers/hwmon/Kconfig               |  11 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/oxp-sensors.c         | 262 ++++++++++++++++++++++++++++
 6 files changed, 315 insertions(+)
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
index e1bc31a6624b..bde592896d33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15343,6 +15343,12 @@ S:	Maintained
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
index 000000000000..da54a38f4454
--- /dev/null
+++ b/drivers/hwmon/oxp-sensors.c
@@ -0,0 +1,262 @@
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
+
+/*
+ * module_platform_driver() may be used here but somehow it breaks the module
+ * either by preventing it from loading or not exposing hwmon attributes.
+ * Either way I'm not smart enough to figure it out so I'll leave init/exit
+ * macros for now.
+ */
+module_init(oxp_platform_init);
+module_exit(oxp_platform_exit);
+
+MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
+MODULE_DESCRIPTION("Platform driver that handles EC sensors of OneXPlayer devices");
+MODULE_LICENSE("GPL");
--
2.38.1

