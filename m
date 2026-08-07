Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1DB23D297
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063148; cv=none; b=M7GSMs3tCgyMMG/9InUmQu144jedXxZYMW96Hxembt1t4inTIuQnBxAlClXoV9FCJIW+3lLPBBF0qcPDoIc0Sj8duMgu78rgVSQ14l2WMdUoJfiM+as7brvQcy0RbhHfH/bcud68W2lX4beLtlB1Hdbeg8yA5NSasAem0OQy2aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063148; c=relaxed/simple;
	bh=LaYmzrc+IEkVbye5GcAMrLOdPmY8W5n8kAr0xg4r4z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W621v8dH6BolW5zngZhXmxQh3X1PuwYEVjJV9zeIJ6P6cSXYr2+l+wdQU6dnunUmfltzpHUp1T8clSx7sMBG5VpbmGIDYy4DAVuZpQwVz3x5BjZfO0vlaiSD2ooArFOq7wblx2NuHAgHTjZ6TVbFeZPhXLPqYy3Z9NQv9/JNHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmC6Nyy2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmC6Nyy2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab973140bso39037005ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 17:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063145; x=1786667945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuWnhFB3fDMNeXLElRX2eiVJVnXnbtpmzlLJYNx4Cyc=;
        b=OmC6Nyy22CsMVHkggWmxz6keTjHt5fhgM7rp01MW+iQ+II+Lr99Lq4VTzq6Y+xYgJC
         h4mduN7VSXTZljZf2TNqpuNa6FMuuy2WF01wxiZWAeNihlaKdVYUA0ATvvn0vjofn/zQ
         y2UrHOsXtTVq3d2hGpjDACvW+dAwi1JnIbTXE00O+rgX6U9acK++tSScSltgQRn6c9nP
         KCK0v+pWxF+Lqz6tlkpOLvgEux/g2wPUcT1HjdvRFL6rCyAxE9jj+XeNRnwUFyH+H8/4
         Yy/w3y53k6j0DpQX+PiCy9JoGa8Fi/E2pSe7Y+qwDzNQxHaJQep/E1BeoNlYXFAOEuwP
         dBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063145; x=1786667945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuWnhFB3fDMNeXLElRX2eiVJVnXnbtpmzlLJYNx4Cyc=;
        b=Iygt4ZQKchnD5fuaOF4GEo8dPiUXNsoiHXJgJB6hlA8FEog3bfrQg7sXEjiz/xHppj
         tkGqtq1ZcOPGj5CyqAnKXA2b60mol6+/5uySa7CmJbAwFqLCVfnyck9ZxswBSaNlPrMB
         0vJXyDKSWkcwvl9JkmEBRFrcnBwMIl0bWoQpvPJAp84BUTMU7OmHi8ZW7n4ph37Ck3Ve
         s3eQ3GwI8vNel/vLx8WtxKauQ4Z09JugH8s2Sd+JpUpORSKsJqc8cET/lwGt1tlc9xIq
         2sAqMNUXz60/Kfqk0VBPtEDlhjVg+kS5jnBSX5SV+ikMTftGrRMD6z0eQ7lQ0MgHxGAr
         Ef5g==
X-Gm-Message-State: AOJu0YxKd69sANwqjtiY+uy/JbTlSRMaDhfEVL2b56qx5Vfi9t7yUSYI
	O90Pa2jP/mpT+qWLVdXjA3kH60N8pWxvLRoQ2DUlugqcjVFo7bBnKmaUi56s/mW9VOA=
X-Gm-Gg: AR+sD11ckwsiJxZqQDYBZd6hxpWJ3ea2Btz10T+pyU6ILY/FKSGtJFcNNdBjOmVXLr5
	OYKE3LnKJa5tbCK9ZZgnjKw3lREE/mIqljYlTgBQkCOyzR+WmxfKnd7xap1u1HFdcpbrdpx5dE6
	o3taP9xMGxSnuzr0B+LiVuiwV/UW2vkvCrWXcjzI5nEPVr2vDYTqBcEb3EEzpYFrTzumDOmVoeB
	eA8oVWNtGEAw7qz53RTIdn7WJLwBwGj55fvz1cWn3aMya1PJt1JjKSm2QTJa8bBvME/ESEDv7PY
	TJkGTOdaXt1kpJ9DcfrMQwDeSbIOFQIOuXttAEy2j9SkF4qklXuogP0SYPCBuc3nTG3cdukOdo7
	9/K2rwf0pZNO+Iguooe3f7bnmAFzPfMoPDwnhk1NnuCvtfWlI3BZDiKtbwf3tlWqzrBYf42PnGR
	4uQALPrgEIZHFa1ui9uALg8xoM7m9KSP60yPBEWDB5ndarxZ5aZKdPXzEchUyu
X-Received: by 2002:a17:903:fae:b0:2cc:e620:e307 with SMTP id d9443c01a7336-2d0ca9feebdmr230232945ad.20.1786063145086;
        Thu, 06 Aug 2026 17:39:05 -0700 (PDT)
Received: from nixos-minipc ([153.67.181.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebee8d0sm526189eec.24.2026.08.06.17.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:39:04 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Thu,  6 Aug 2026 21:38:42 -0300
Message-ID: <20260807003842.249957-2-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807003842.249957-1-speyrott@gmail.com>
References: <20260807003842.249957-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DMI-gated hwmon driver for the embedded controller used by the
Minisforum UM780 XTX with board revision 1.1 and BIOS 1.06.

Expose the CPU and system fan control temperatures and tachometers. The
tachometer protocol returns one byte per OEM command, so serialize
transactions and use high-low-high sampling to reject torn values.

Allow selecting either complete OEM CPU fan profile through pwm1_enable and
changing the two validated system fan transition temperatures through
standard automatic-curve attributes. Cache coherent settings and restore
them after the firmware reloads defaults following resume.

Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
---
 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  79 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 648 ++++++++++++++++++++
 6 files changed, 752 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d979e6d6e9f2..c98cad395455 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -186,6 +186,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    mcp9982
    menf21bmc
+   minisforum-um780xtx
    mlxreg-fan
    mp2856
    mp2869
diff --git a/Documentation/hwmon/minisforum-um780xtx.rst b/Documentation/hwmon/minisforum-um780xtx.rst
new file mode 100644
index 000000000000..5ad0d3588062
--- /dev/null
+++ b/Documentation/hwmon/minisforum-um780xtx.rst
@@ -0,0 +1,79 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================================
+Kernel driver minisforum-um780xtx
+====================================
+
+Supported systems:
+
+  * Minisforum UM780 XTX
+
+    * DMI product name: ``Venus series``
+    * Mainboard: ``F7BSD``, revision ``1.1``
+    * BIOS version: ``1.06``
+
+Author: Sebastián Peyrott <speyrott@gmail.com>
+
+Description
+-----------
+
+This driver exposes hardware monitoring and fan-control data cached by the
+IT5571E embedded controller. It uses the ACPI EC transport and only binds to
+the exact system and firmware identity listed above.
+
+The two temperature channels are the values used by the EC's fan-control
+loops. Their physical sensor placement is not known. ``temp1`` is an external
+thermistor input used for the system fan, while ``temp2`` is the filtered AMD
+SB-TSI temperature used for the CPU fan.
+
+The fan tachometers are read through OEM EC commands. Since each byte is
+returned by a separate command, the driver uses a high-low-high sequence and
+retries if the high byte changes.
+
+Sysfs entries
+-------------
+
+============================  ==============================================
+``temp1_input``               System-fan control temperature
+``temp2_input``               CPU-fan control temperature
+``fan1_input``                CPU fan speed in RPM
+``fan2_input``                System fan speed in RPM
+``pwm1_enable``               CPU profile: 2 is OEM B1, 3 is OEM B2
+``pwm2_enable``               Always 2 (automatic firmware control)
+``pwm2_auto_channels_temp``   Always 1 (``temp1`` controls this output)
+``pwm2_auto_point1_temp``     Off-to-low system-fan transition temperature
+``pwm2_auto_point1_pwm``      Fixed low target, 40 on the 0--255 scale
+``pwm2_auto_point2_temp``     Low-to-high system-fan transition temperature
+``pwm2_auto_point2_pwm``      Fixed high target, 102 on the 0--255 scale
+============================  ==============================================
+
+CPU fan profiles
+----------------
+
+Values 2 and 3 of ``pwm1_enable`` select the two complete automatic profiles
+implemented by the firmware. Writing either value reloads the whole CPU fan
+curve, including firmware state which is not visible through the ACPI EC
+window. Other values are rejected.
+
+System fan thresholds
+---------------------
+
+The two writable system-fan temperatures accept whole degrees Celsius only.
+The driver requires strict ordering between both visible thresholds and the
+firmware's internal third threshold. The third threshold does not select a new
+PWM target and is therefore not exposed as another auto point.
+
+Resume state preservation
+-------------------------
+
+Fan settings are held in EC RAM. On the supported firmware, initialization
+after s2idle resume reloads the factory system-fan curve. The driver caches the
+coherent profile and thresholds present when it probes, updates the cache after
+successful hwmon writes, and performs one delayed comparison after resume. It
+restores only values which differ from that cache; it does not poll during
+normal operation.
+
+The ``resume_restore_delay_ms`` module parameter selects the delay from the
+kernel resume callback. Its default is 1000 ms. Values from 1000 through 60000
+ms are accepted, and 0 disables the post-resume check. A runtime change applies
+to the next resume, not to work which is already pending.
diff --git a/MAINTAINERS b/MAINTAINERS
index e25838cdf301..e88684a38e3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18015,6 +18015,13 @@ F:	include/linux/min_heap.h
 F:	lib/min_heap.c
 F:	lib/tests/min_heap_kunit.c
 
+MINISFORUM UM780 XTX EC HARDWARE MONITOR DRIVER
+M:	Sebastián Peyrott <speyrott@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/minisforum-um780xtx.rst
+F:	drivers/hwmon/minisforum-um780xtx.c
+
 MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e60bfc31bbad..342a67e83933 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1490,6 +1490,22 @@ config SENSORS_MENF21BMC_HWMON
 	  This driver can also be built as a module. If so the module
 	  will be called menf21bmc_hwmon.
 
+config SENSORS_MINISFORUM_UM780XTX
+	tristate "Minisforum UM780 XTX EC hardware monitoring"
+	depends on ACPI && DMI && X86
+	help
+	  If you say yes here you get support for the hardware monitoring
+	  features of the embedded controller in the Minisforum UM780 XTX.
+	  This includes CPU and system fan speeds, their control temperatures,
+	  two CPU fan profiles, system fan temperature thresholds, and
+	  preservation of the selected settings across suspend and resume.
+
+	  This driver only binds to explicitly supported board and firmware
+	  versions.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called minisforum-um780xtx.
+
 config SENSORS_MR75203
 	tristate "Moortec Semiconductor MR75203 PVT Controller"
 	select REGMAP_MMIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 0cad7e21634c..a690f5f97ffc 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
 obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
 obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
+obj-$(CONFIG_SENSORS_MINISFORUM_UM780XTX) += minisforum-um780xtx.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
new file mode 100644
index 000000000000..cafd03d755af
--- /dev/null
+++ b/drivers/hwmon/minisforum-um780xtx.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Minisforum UM780 XTX (F7BSD) embedded-controller hwmon driver.
+ *
+ * Copyright (C) 2026 Sebastián Peyrott <speyrott@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/kstrtox.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#define UM780XTX_EC_TEMP_SYS	0x05
+#define UM780XTX_EC_TEMP_CPU	0x09
+#define UM780XTX_EC_CPU_PROFILE	0x2f
+#define UM780XTX_EC_SYS_POINT1	0x31
+#define UM780XTX_EC_SYS_POINT2	0x34
+#define UM780XTX_EC_SYS_POINT3	0x37
+
+#define UM780XTX_EC_PROFILE_B1	0xb1
+#define UM780XTX_EC_PROFILE_B2	0xb2
+
+#define UM780XTX_EC_FAN1_LO	0xb6
+#define UM780XTX_EC_FAN1_HI	0xb7
+#define UM780XTX_EC_FAN2_LO	0xb9
+#define UM780XTX_EC_FAN2_HI	0xba
+
+#define UM780XTX_EC_MAX_RPM	9000
+#define UM780XTX_EC_RPM_RETRIES	3
+#define UM780XTX_PWM_SYS_LOW	40
+#define UM780XTX_PWM_SYS_HIGH	102
+#define UM780XTX_RESUME_DELAY_MIN_MS	1000
+#define UM780XTX_RESUME_DELAY_MAX_MS	60000
+
+static struct platform_device *um780xtx_pdev;
+
+struct um780xtx_data {
+	struct device *dev;
+	/* Serializes EC transactions and cached state updates. */
+	struct mutex lock;
+	struct delayed_work resume_work;
+	u8 cached_profile;
+	u8 cached_sys_point1;
+	u8 cached_sys_point2;
+	bool profile_valid;
+	bool sys_points_valid;
+};
+
+static unsigned int resume_restore_delay_ms = 1000;
+
+static int um780xtx_set_resume_delay(const char *val,
+				     const struct kernel_param *kp)
+{
+	unsigned int delay;
+	int ret;
+
+	ret = kstrtouint(val, 0, &delay);
+	if (ret)
+		return ret;
+	if (delay && (delay < UM780XTX_RESUME_DELAY_MIN_MS ||
+		      delay > UM780XTX_RESUME_DELAY_MAX_MS))
+		return -EINVAL;
+
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops um780xtx_resume_delay_ops = {
+	.set = um780xtx_set_resume_delay,
+	.get = param_get_uint,
+};
+
+module_param_cb(resume_restore_delay_ms, &um780xtx_resume_delay_ops,
+		&resume_restore_delay_ms, 0644);
+MODULE_PARM_DESC(resume_restore_delay_ms,
+		 "Delay before one post-resume state check; 0 disables (milliseconds)");
+
+static const struct dmi_system_id um780xtx_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Micro Computer (HK) Tech Limited"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Venus series"),
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
+					"Shenzhen Meigao Electronic Equipment Co.,Ltd"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "F7BSD"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, um780xtx_dmi_table);
+
+static bool um780xtx_firmware_match(void)
+{
+	const char *board_version = dmi_get_system_info(DMI_BOARD_VERSION);
+	const char *bios_version = dmi_get_system_info(DMI_BIOS_VERSION);
+
+	return board_version && bios_version &&
+		!strcmp(board_version, "1.1") && !strcmp(bios_version, "1.06");
+}
+
+static int um780xtx_oem_read(u8 command, u8 *value)
+{
+	return ec_transaction(command, NULL, 0, value, 1);
+}
+
+static int um780xtx_read_rpm(u8 command_hi, u8 command_lo, long *rpm)
+{
+	u8 hi_before;
+	u8 hi_after;
+	u8 lo;
+	unsigned int value;
+	int attempt;
+	int ret;
+
+	for (attempt = 0; attempt < UM780XTX_EC_RPM_RETRIES; attempt++) {
+		ret = um780xtx_oem_read(command_hi, &hi_before);
+		if (ret)
+			return ret;
+		ret = um780xtx_oem_read(command_lo, &lo);
+		if (ret)
+			return ret;
+		ret = um780xtx_oem_read(command_hi, &hi_after);
+		if (ret)
+			return ret;
+		if (hi_before != hi_after)
+			continue;
+
+		value = (hi_after << 8) | lo;
+		if (value > UM780XTX_EC_MAX_RPM)
+			continue;
+
+		*rpm = value;
+		return 0;
+	}
+
+	return -EAGAIN;
+}
+
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	u8 profile;
+	int ret;
+
+	mutex_lock(&data->lock);
+	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+	mutex_unlock(&data->lock);
+	if (ret)
+		return ret;
+	if (profile == UM780XTX_EC_PROFILE_B1)
+		return sysfs_emit(buf, "2\n");
+	if (profile == UM780XTX_EC_PROFILE_B2)
+		return sysfs_emit(buf, "3\n");
+
+	return -EOPNOTSUPP;
+}
+
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	unsigned long mode;
+	u8 expected;
+	u8 profile;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &mode);
+	if (ret)
+		return ret;
+	if (mode != 2 && mode != 3)
+		return -EINVAL;
+	expected = mode == 2 ? UM780XTX_EC_PROFILE_B1 : UM780XTX_EC_PROFILE_B2;
+
+	mutex_lock(&data->lock);
+	ret = ec_transaction(expected, NULL, 0, NULL, 0);
+	if (ret)
+		goto out_unlock;
+	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+	if (ret)
+		goto out_unlock;
+	if (profile != expected) {
+		ret = -EIO;
+	} else {
+		data->cached_profile = profile;
+		data->profile_valid = true;
+	}
+
+out_unlock:
+	mutex_unlock(&data->lock);
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_RW(pwm1_enable);
+
+static ssize_t pwm2_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "2\n");
+}
+static DEVICE_ATTR_RO(pwm2_enable);
+
+static ssize_t pwm2_auto_channels_temp_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	return sysfs_emit(buf, "1\n");
+}
+static DEVICE_ATTR_RO(pwm2_auto_channels_temp);
+
+static const u8 um780xtx_sys_point_offsets[] = {
+	UM780XTX_EC_SYS_POINT1,
+	UM780XTX_EC_SYS_POINT2,
+};
+
+static ssize_t um780xtx_sys_point_temp_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	u8 value;
+	int ret;
+
+	mutex_lock(&data->lock);
+	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &value);
+	mutex_unlock(&data->lock);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value * 1000);
+}
+
+static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	u8 points[3];
+	u8 readback;
+	long value;
+	int ret;
+
+	ret = kstrtol(buf, 10, &value);
+	if (ret)
+		return ret;
+	if (value < 0 || value > 255000 || value % 1000)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	ret = ec_read(UM780XTX_EC_SYS_POINT1, &points[0]);
+	if (ret)
+		goto out_unlock;
+	ret = ec_read(UM780XTX_EC_SYS_POINT2, &points[1]);
+	if (ret)
+		goto out_unlock;
+	ret = ec_read(UM780XTX_EC_SYS_POINT3, &points[2]);
+	if (ret)
+		goto out_unlock;
+
+	points[sattr->index] = value / 1000;
+	if (points[0] >= points[1] || points[1] >= points[2]) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
+		       points[sattr->index]);
+	if (ret)
+		goto out_unlock;
+	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &readback);
+	if (ret)
+		goto out_unlock;
+	if (readback != points[sattr->index]) {
+		ret = -EIO;
+	} else {
+		data->cached_sys_point1 = points[0];
+		data->cached_sys_point2 = points[1];
+		data->sys_points_valid = true;
+	}
+
+out_unlock:
+	mutex_unlock(&data->lock);
+	return ret ? ret : count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_temp,
+			     um780xtx_sys_point_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point2_temp,
+			     um780xtx_sys_point_temp, 1);
+
+static ssize_t pwm2_auto_point1_pwm_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%d\n", UM780XTX_PWM_SYS_LOW);
+}
+static DEVICE_ATTR_RO(pwm2_auto_point1_pwm);
+
+static ssize_t pwm2_auto_point2_pwm_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%d\n", UM780XTX_PWM_SYS_HIGH);
+}
+static DEVICE_ATTR_RO(pwm2_auto_point2_pwm);
+
+static struct attribute *um780xtx_extra_attrs[] = {
+	&dev_attr_pwm1_enable.attr,
+	&dev_attr_pwm2_enable.attr,
+	&dev_attr_pwm2_auto_channels_temp.attr,
+	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
+	&dev_attr_pwm2_auto_point1_pwm.attr,
+	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
+	&dev_attr_pwm2_auto_point2_pwm.attr,
+	NULL
+};
+
+static const struct attribute_group um780xtx_extra_group = {
+	.attrs = um780xtx_extra_attrs,
+};
+
+static const struct attribute_group *um780xtx_extra_groups[] = {
+	&um780xtx_extra_group,
+	NULL
+};
+
+static umode_t um780xtx_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	if (type == hwmon_temp && channel < 2 &&
+	    (attr == hwmon_temp_input || attr == hwmon_temp_label))
+		return 0444;
+	if (type == hwmon_fan && channel < 2 &&
+	    (attr == hwmon_fan_input || attr == hwmon_fan_label))
+		return 0444;
+	return 0;
+}
+
+static int um780xtx_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *value)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	u8 raw;
+	int ret;
+
+	if (type == hwmon_temp && attr == hwmon_temp_input && channel < 2) {
+		mutex_lock(&data->lock);
+		ret = ec_read(channel ? UM780XTX_EC_TEMP_CPU :
+			      UM780XTX_EC_TEMP_SYS, &raw);
+		mutex_unlock(&data->lock);
+		if (ret)
+			return ret;
+		*value = raw * 1000L;
+		return 0;
+	}
+	if (type == hwmon_fan && attr == hwmon_fan_input && channel < 2) {
+		mutex_lock(&data->lock);
+		if (!channel)
+			ret = um780xtx_read_rpm(UM780XTX_EC_FAN1_HI,
+						UM780XTX_EC_FAN1_LO, value);
+		else
+			ret = um780xtx_read_rpm(UM780XTX_EC_FAN2_HI,
+						UM780XTX_EC_FAN2_LO, value);
+		mutex_unlock(&data->lock);
+		return ret;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int um780xtx_read_string(struct device *dev,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel, const char **str)
+{
+	static const char * const temp_labels[] = {
+		"SYS fan control temperature",
+		"CPU fan control temperature",
+	};
+	static const char * const fan_labels[] = { "CPU fan", "SYS fan" };
+
+	if (channel >= 2)
+		return -EOPNOTSUPP;
+	if (type == hwmon_temp && attr == hwmon_temp_label)
+		*str = temp_labels[channel];
+	else if (type == hwmon_fan && attr == hwmon_fan_label)
+		*str = fan_labels[channel];
+	else
+		return -EOPNOTSUPP;
+	return 0;
+}
+
+static const struct hwmon_ops um780xtx_hwmon_ops = {
+	.is_visible = um780xtx_is_visible,
+	.read = um780xtx_read,
+	.read_string = um780xtx_read_string,
+};
+
+static const struct hwmon_channel_info * const um780xtx_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info um780xtx_chip_info = {
+	.ops = &um780xtx_hwmon_ops,
+	.info = um780xtx_info,
+};
+
+static int um780xtx_write_sys_point(u8 offset, u8 value)
+{
+	u8 readback;
+	int ret;
+
+	ret = ec_write(offset, value);
+	if (ret)
+		return ret;
+	ret = ec_read(offset, &readback);
+	if (ret)
+		return ret;
+
+	return readback == value ? 0 : -EIO;
+}
+
+static int um780xtx_restore_sys_points(struct um780xtx_data *data,
+				       u8 current_point1,
+				       u8 current_point2, u8 point3)
+{
+	u8 point1 = data->cached_sys_point1;
+	u8 point2 = data->cached_sys_point2;
+	int ret;
+
+	if (point1 >= point2 || point2 >= point3)
+		return -EINVAL;
+
+	/* Keep strict ordering valid after each individual EC write. */
+	if (point1 >= current_point2) {
+		ret = um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT2, point2);
+		if (ret)
+			return ret;
+		return um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT1,
+						 point1);
+	}
+
+	ret = um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT1, point1);
+	if (ret)
+		return ret;
+	return um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT2, point2);
+}
+
+static void um780xtx_cache_state(struct um780xtx_data *data)
+{
+	u8 profile;
+	u8 point1;
+	u8 point2;
+	u8 point3;
+	int profile_ret;
+	int sys_ret;
+
+	mutex_lock(&data->lock);
+	profile_ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+	if (!profile_ret &&
+	    (profile == UM780XTX_EC_PROFILE_B1 ||
+	     profile == UM780XTX_EC_PROFILE_B2)) {
+		data->cached_profile = profile;
+		data->profile_valid = true;
+	}
+
+	sys_ret = ec_read(UM780XTX_EC_SYS_POINT1, &point1);
+	if (!sys_ret)
+		sys_ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
+	if (!sys_ret)
+		sys_ret = ec_read(UM780XTX_EC_SYS_POINT3, &point3);
+	if (!sys_ret && point1 < point2 && point2 < point3) {
+		data->cached_sys_point1 = point1;
+		data->cached_sys_point2 = point2;
+		data->sys_points_valid = true;
+	}
+	mutex_unlock(&data->lock);
+
+	if (profile_ret)
+		dev_warn(data->dev, "failed to cache initial CPU profile: %d\n",
+			 profile_ret);
+	if (sys_ret)
+		dev_warn(data->dev, "failed to cache initial SYS curve: %d\n",
+			 sys_ret);
+}
+
+static void um780xtx_resume_work(struct work_struct *work)
+{
+	struct um780xtx_data *data =
+		container_of(to_delayed_work(work), struct um780xtx_data,
+			     resume_work);
+	u8 profile;
+	u8 readback;
+	u8 point1;
+	u8 point2;
+	u8 point3;
+	int profile_ret = 0;
+	int sys_ret = 0;
+
+	mutex_lock(&data->lock);
+	if (data->profile_valid) {
+		profile_ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+		if (!profile_ret && profile != data->cached_profile) {
+			profile_ret = ec_transaction(data->cached_profile, NULL, 0,
+						     NULL, 0);
+			if (!profile_ret)
+				profile_ret = ec_read(UM780XTX_EC_CPU_PROFILE,
+						      &readback);
+			if (!profile_ret && readback != data->cached_profile)
+				profile_ret = -EIO;
+		}
+	}
+
+	if (data->sys_points_valid) {
+		sys_ret = ec_read(UM780XTX_EC_SYS_POINT1, &point1);
+		if (!sys_ret)
+			sys_ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
+		if (!sys_ret)
+			sys_ret = ec_read(UM780XTX_EC_SYS_POINT3, &point3);
+		if (!sys_ret &&
+		    (point1 != data->cached_sys_point1 ||
+		     point2 != data->cached_sys_point2)) {
+			sys_ret = um780xtx_restore_sys_points(data, point1, point2, point3);
+		}
+	}
+	mutex_unlock(&data->lock);
+
+	if (profile_ret)
+		dev_warn(data->dev, "post-resume CPU profile check failed: %d\n",
+			 profile_ret);
+	if (sys_ret)
+		dev_warn(data->dev, "post-resume SYS curve check failed: %d\n",
+			 sys_ret);
+}
+
+static void um780xtx_cancel_resume_work(void *arg)
+{
+	struct um780xtx_data *data = arg;
+
+	cancel_delayed_work_sync(&data->resume_work);
+}
+
+static int um780xtx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct um780xtx_data *data;
+	struct device *hwmon;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->dev = dev;
+	mutex_init(&data->lock);
+	INIT_DELAYED_WORK(&data->resume_work, um780xtx_resume_work);
+	platform_set_drvdata(pdev, data);
+
+	um780xtx_cache_state(data);
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "um780xtx_ec", data,
+						     &um780xtx_chip_info,
+						     um780xtx_extra_groups);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	return devm_add_action_or_reset(dev, um780xtx_cancel_resume_work, data);
+}
+
+static int um780xtx_suspend(struct device *dev)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&data->resume_work);
+	return 0;
+}
+
+static int um780xtx_resume(struct device *dev)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	unsigned int delay = READ_ONCE(resume_restore_delay_ms);
+
+	if (!delay)
+		return 0;
+
+	mod_delayed_work(system_wq, &data->resume_work,
+			 msecs_to_jiffies(delay));
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(um780xtx_pm_ops, um780xtx_suspend,
+				um780xtx_resume);
+
+static struct platform_driver um780xtx_driver = {
+	.driver = {
+		.name = "um780xtx-ec-hwmon",
+		.pm = pm_sleep_ptr(&um780xtx_pm_ops),
+	},
+	.probe = um780xtx_probe,
+};
+
+static int __init um780xtx_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(um780xtx_dmi_table) ||
+	    !um780xtx_firmware_match() || !ec_get_handle())
+		return -ENODEV;
+	ret = platform_driver_register(&um780xtx_driver);
+	if (ret)
+		return ret;
+
+	um780xtx_pdev = platform_device_register_simple("um780xtx-ec-hwmon",
+							PLATFORM_DEVID_NONE,
+						       NULL, 0);
+	if (IS_ERR(um780xtx_pdev)) {
+		ret = PTR_ERR(um780xtx_pdev);
+		platform_driver_unregister(&um780xtx_driver);
+		return ret;
+	}
+	return 0;
+}
+
+static void __exit um780xtx_exit(void)
+{
+	platform_device_unregister(um780xtx_pdev);
+	platform_driver_unregister(&um780xtx_driver);
+}
+
+module_init(um780xtx_init);
+module_exit(um780xtx_exit);
+
+MODULE_AUTHOR("Sebastián Peyrott <speyrott@gmail.com>");
+MODULE_DESCRIPTION("Minisforum UM780 XTX EC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
2.54.0

