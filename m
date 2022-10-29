Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E1FC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 22:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiJ2WvE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 18:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ2WvD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 18:51:03 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DAC186DF;
        Sat, 29 Oct 2022 15:51:02 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so4933779otb.8;
        Sat, 29 Oct 2022 15:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm5ehpL9z0ZqyAzTuD0lB2sMDTxxynY9F1uqWIUffkM=;
        b=U9GkezbOefI3n6uUTMtwbNORSAJ3BEATAAGCBYewsfyOg2nalur9CRTz/5qkxAey1x
         EmNaXFJEi83cCiiOHf3yBvch+b6jPRyPrG/HIJFi0qwKUZpiWNgcj1hUL48cw4hrynsr
         q6HHW1o/vo9ZXQy/YuGNhEnmT1v/iG00NFMAw7M2EKr+WGlmp3bZDh5Q5vD8uaLABVYp
         FDBwXnJIajswPmlQFiM7i1trUek5OldnTosdoENRcST5UNfd41gU3cfYi1CX4ofljSIK
         FjHElwGAWpP8mQE4gwxVd2gVqeqhLClUb6Aeii9XIRecb0bcxk9BNPmgws6pz744QYlC
         CSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wm5ehpL9z0ZqyAzTuD0lB2sMDTxxynY9F1uqWIUffkM=;
        b=50TAYbK8bgTM/9cU7f1fALcWVhsfTNUWmrWo7DyZFZ8Hpu0LuKoLxNhsnsZ2amhGXl
         N1VgHPNUGinxcuPCsUyP5Tzw7l6SyG4/IHqOQEysUKSp1g3GTuHXYxYMC/kgdKTZ+Qyh
         /1/5vE7VxBOUPZ1JcO+lpq2trUbWnWOCBSOTxkL2LPsZOt5Ghe/j6NEYiOBZMtALup6s
         iOVpznZ/MPb4fsRmamwtgCHm5leLPWS25rB7NW8haXQo+ob3b+CMT6yYSH5Wmh7H/Gli
         P4aDxY8abo7/h6iSHerjnW/u5VJymqPngj8S35WxQoD+hppgHER/7P2Kiyr+kjPmhgh3
         57Tw==
X-Gm-Message-State: ACrzQf3157mU6gGx9e3A14QUIK2ejS9EaEwATXOJ7iVHV1HEY0vpfnCY
        mJJEXWIL4D/lC0Ijvb0aNko=
X-Google-Smtp-Source: AMsMyM4TriULgVoOqAZjLPk0gSc2rpYMvLiWq4TAcDqJEqzYYjmHZzg6RCll95R+LreDbiM2WvXXHQ==
X-Received: by 2002:a9d:f43:0:b0:638:c3c4:73ee with SMTP id 61-20020a9d0f43000000b00638c3c473eemr2874400ott.186.1667083861916;
        Sat, 29 Oct 2022 15:51:01 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
        by smtp.gmail.com with ESMTPSA id l4-20020a0568301d6400b0066c495a651dsm54742oti.38.2022.10.29.15.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 15:51:01 -0700 (PDT)
From:   =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
To:     hdegoede@redhat.com
Cc:     markgross@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
Subject: [PATCH] Add OneXPlayer mini AMD board driver
Date:   Sat, 29 Oct 2022 19:50:51 -0300
Message-Id: <20221029225051.1171795-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Platform driver for OXP Handhelds that expose fan reading and control
via hwmon sysfs.

As far as I could gather all OXP boards have the same DMI strings and
they are told appart by the boot cpu vendor (Intel/AMD).
Currently only AMD boards are supported but the code is made to be simple
to add other handheld boards in the future.

Fan control is provided via pwm interface in the range [0-255]. AMD
boards have [0-100] as range in the EC, the written value is scaled to
accomodate for that.

PWM control is disabled by default, can be enabled via module parameter
`fan_control=1`.
---
 drivers/platform/x86/Kconfig        |   8 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/oxp-platform.c | 393 ++++++++++++++++++++++++++++
 3 files changed, 404 insertions(+)
 create mode 100644 drivers/platform/x86/oxp-platform.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f5312f51de19..8fe3ca1dd808 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -738,6 +738,14 @@ config XO1_RFKILL
 	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
 	  laptop.

+config OXP_DEVICE
+	tristate "OneXPlayer EC fan control"
+	depends on ACPI
+	depends on HWMON
+	help
+		Support for OneXPlayer device board EC fan control. Only AMD boards
+		are supported.
+
 config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
 	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5a428caa654a..fa6f5c68ec45 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -80,6 +80,9 @@ obj-$(CONFIG_MSI_WMI)		+= msi-wmi.o
 obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
 obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o

+# OneXPlayer
+obj-$(CONFIG_OXP_DEVICE) += oxp-platform.o
+
 # PC Engines
 obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o

diff --git a/drivers/platform/x86/oxp-platform.c b/drivers/platform/x86/oxp-platform.c
new file mode 100644
index 000000000000..4fb13e7450ff
--- /dev/null
+++ b/drivers/platform/x86/oxp-platform.c
@@ -0,0 +1,393 @@
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
+ * accomodate for that.
+ *
+ * PWM control is disabled by default, can be enabled via module parameter.
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
+#include <asm/processor.h>
+
+static bool fan_control;
+module_param_hw(fan_control, bool, other, 0644);
+MODULE_PARM_DESC(fan_control, "Enable fan control");
+
+#define ACPI_LOCK_DELAY_MS	500
+
+/* Handle ACPI lock mechanism */
+struct lock_data {
+	u32 mutex;
+	bool (*lock)(struct lock_data *data);
+	bool (*unlock)(struct lock_data *data);
+};
+
+static bool lock_global_acpi_lock(struct lock_data *data)
+{
+	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
+								 &data->mutex));
+}
+
+static bool unlock_global_acpi_lock(struct lock_data *data)
+{
+	return ACPI_SUCCESS(acpi_release_global_lock(data->mutex));
+}
+
+#define MAX_IDENTICAL_BOARD_VARIATIONS	2
+
+enum board_family {
+	family_unknown,
+	family_mini_amd,
+};
+
+enum oxp_sensor_type {
+	oxp_sensor_fan = 0,
+	oxp_sensor_pwm,
+	oxp_sensor_number,
+};
+
+struct oxp_ec_sensor_addr {
+	enum hwmon_sensor_types type;
+	u8 reg;
+	short size;
+	union {
+		struct {
+			u8 enable;
+			u8 val_enable;
+			u8 val_disable;
+		};
+		struct {
+		  int max_speed;
+		};
+	};
+};
+
+
+/* AMD board EC addresses */
+static const struct oxp_ec_sensor_addr amd_sensors[] = {
+	[oxp_sensor_fan] = {
+		.type = hwmon_fan,
+		.reg = 0x76,
+		.size = 2,
+		.max_speed = 5000,
+	},
+	[oxp_sensor_pwm] = {
+		.type = hwmon_pwm,
+		.reg = 0x4B,
+		.size = 1,
+		.enable = 0x4A,
+		.val_enable = 0x01,
+		.val_disable = 0x00,
+	},
+	{},
+};
+
+struct ec_board_info {
+	const char *board_names[MAX_IDENTICAL_BOARD_VARIATIONS];
+	enum board_family family;
+	const struct oxp_ec_sensor_addr *sensors;
+};
+
+static const struct ec_board_info board_info[] = {
+	{
+		.board_names = {"ONE XPLAYER", "ONEXPLAYER mini A07"},
+		.family = family_mini_amd,
+		.sensors = amd_sensors,
+	},
+	{}
+};
+
+struct oxp_status {
+	struct ec_board_info board;
+	struct lock_data lock_data;
+};
+
+/* Helper functions */
+static int read_from_ec(u8 reg, int size, long *val)
+{
+	int i;
+	int ret;
+	u8 buffer;
+
+	*val = 0;
+	for (i = 0; i < size; i++) {
+		ret = ec_read(reg + i, &buffer);
+		if (ret)
+			return ret;
+		(*val) <<= i*8;
+		*val += buffer;
+	}
+	return ret;
+}
+
+static int write_to_ec(const struct device *dev, u8 reg, u8 value)
+{
+	struct oxp_status *state = dev_get_drvdata(dev);
+	int ret = -1;
+
+	if (!state->lock_data.lock(&state->lock_data)) {
+		dev_warn(dev, "Failed to acquire mutex");
+		return -EBUSY;
+	}
+
+	ret = ec_write(reg, value);
+
+	if (!state->lock_data.unlock(&state->lock_data))
+		dev_err(dev, "Failed to release mutex");
+
+	return ret;
+}
+
+/* Callbacks for hwmon interface */
+static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	switch (type) {
+		case hwmon_fan:
+			return S_IRUGO;
+		case hwmon_pwm:
+			return S_IRUGO | S_IWUSR;
+		default:
+			return 0;
+	}
+	return 0;
+}
+
+static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long *val)
+{
+	int ret = -1;
+	const struct oxp_status *state = dev_get_drvdata(dev);
+	const struct ec_board_info *board = &state->board;
+
+	switch(type) {
+		case hwmon_fan:
+			switch(attr) {
+				case hwmon_fan_input:
+					ret = read_from_ec(board->sensors[oxp_sensor_fan].reg,
+							board->sensors[oxp_sensor_fan].size, val);
+					break;
+				case hwmon_fan_max:
+					ret = 0;
+					*val = board->sensors[oxp_sensor_fan].max_speed;
+					break;
+				case hwmon_fan_min:
+					ret = 0;
+					*val = 0;
+					break;
+				default:
+					dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
+			}
+			return ret;
+		case hwmon_pwm:
+			switch(attr) {
+				case hwmon_pwm_input:
+					ret = read_from_ec(board->sensors[oxp_sensor_pwm].reg,
+							board->sensors[oxp_sensor_pwm].size, val);
+					if (board->family == family_mini_amd) {
+						*val = (*val * 255) / 100;
+					}
+					break;
+				case hwmon_pwm_enable:
+					ret = read_from_ec(board->sensors[oxp_sensor_pwm].enable, 1, val);
+					if (*val == board->sensors[oxp_sensor_pwm].val_enable) {
+						*val = 1;
+					} else {
+						*val = 0;
+					}
+					break;
+				default:
+					dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
+			}
+			return ret;
+		default:
+			dev_dbg(dev, "Unknown sensor type %d.\n", type);
+			return -1;
+	}
+}
+
+static int oxp_pwm_enable(const struct device *dev)
+{
+	int ret = -1;
+	struct oxp_status *state = dev_get_drvdata(dev);
+	const struct ec_board_info *board = &state->board;
+
+	if (!fan_control) {
+		dev_info(dev, "Can't enable pwm, fan_control=0");
+		return -EPERM;
+	}
+
+	ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
+		board->sensors[oxp_sensor_pwm].val_enable);
+
+	return ret;
+}
+
+static int oxp_pwm_disable(const struct device *dev)
+{
+	int ret = -1;
+	struct oxp_status *state = dev_get_drvdata(dev);
+	const struct ec_board_info *board = &state->board;
+
+	if (!fan_control) {
+		dev_info(dev, "Can't disable pwm, fan_control=0");
+		return -EPERM;
+	}
+
+	ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
+		board->sensors[oxp_sensor_pwm].val_disable);
+
+	return ret;
+}
+
+static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long val)
+{
+	int ret = -1;
+	struct oxp_status *state = dev_get_drvdata(dev);
+	const struct ec_board_info *board = &state->board;
+
+	switch(type) {
+		case hwmon_pwm:
+			if (!fan_control) {
+				dev_info(dev, "Can't control fans, fan_control=0");
+				return -EPERM;
+			}
+			switch(attr) {
+				case hwmon_pwm_enable:
+					if (val == 1) {
+						ret = oxp_pwm_enable(dev);
+					} else if (val == 0) {
+						ret = oxp_pwm_disable(dev);
+					} else {
+						return -EINVAL;
+					}
+					return ret;
+				case hwmon_pwm_input:
+					if (val < 0 || val > 255)
+						return -EINVAL;
+					if (board->family == family_mini_amd)
+						val = (val * 100) / 255;
+					ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].reg, val);
+					return ret;
+				default:
+					dev_dbg(dev, "Unknown attribute for type %d: %d", type, attr);
+					return ret;
+			}
+		default:
+			dev_dbg(dev, "Unknown sensor type: %d", type);
+	}
+	return ret;
+}
+
+/* Known sensors in the OXP EC controllers */
+static const struct hwmon_channel_info *oxp_platform_sensors[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_INPUT | HWMON_F_MAX | HWMON_F_MIN),
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	NULL
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
+static const struct ec_board_info * __init get_board_info(struct device *dev)
+{
+	const char *dmi_board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+	const char *dmi_board_name = dmi_get_system_info(DMI_BOARD_NAME);
+	const struct ec_board_info *board;
+
+	if (!dmi_board_vendor || !dmi_board_name ||
+	    (strcasecmp(dmi_board_vendor, "ONE-NETBOOK TECHNOLOGY CO., LTD.") &&
+	     strcasecmp(dmi_board_vendor, "ONE-NETBOOK")))
+		return NULL;
+
+	/* Match our known boards */
+	/* Need to check for AMD/Intel here */
+	for (board = board_info; board->sensors; board++) {
+		if (match_string(board->board_names,
+				 MAX_IDENTICAL_BOARD_VARIATIONS,
+				 dmi_board_name) >= 0) {
+			if (board->family == family_mini_amd &&
+					boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
+				return board;
+			}
+		}
+	}
+	return NULL;
+}
+
+static int __init oxp_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *hwdev;
+	const struct ec_board_info *pboard_info;
+	struct oxp_status *state;
+
+	pboard_info = get_board_info(dev);
+	if (!pboard_info)
+		return -ENODEV;
+
+	state = devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->board = *pboard_info;
+
+	state->lock_data.mutex = 0;
+	state->lock_data.lock = lock_global_acpi_lock;
+	state->lock_data.unlock = unlock_global_acpi_lock;
+
+	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", state,
+							&oxp_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwdev);
+}
+
+static const struct acpi_device_id acpi_ec_ids[] = {
+	/* Embedded Controller Device */
+	{ "PNP0C09", 0 },
+	{}
+};
+
+static struct platform_driver oxp_platform_driver = {
+	.driver = {
+		.name	= "oxp-platform",
+		.acpi_match_table = acpi_ec_ids,
+	},
+};
+
+MODULE_DEVICE_TABLE(acpi, acpi_ec_ids);
+module_platform_driver_probe(oxp_platform_driver, oxp_platform_probe);
+
+MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
+MODULE_DESCRIPTION(
+	"Platform driver that handles ACPI EC of OneXPlayer devices");
+MODULE_LICENSE("GPL");
--
2.38.1

