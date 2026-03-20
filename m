Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD5361DA1
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774002296; cv=none; b=Z4k5Y9zFxoiUf6rkwc/4MnMR7ofDMRtpLbcl5+dKT2De4YutCe9c9kdeorKV9DwDcndMGIhHhQYcj5/ySg93iw9dMJiiinxDfQwRRmX4bfSO1xetNhIIySxWAOBDfFL09l6v7kCNQUis2DZVe7lX4skUnH+bgO3NZer3bTAfJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774002296; c=relaxed/simple;
	bh=R2+Nx1F7mPRrZkmLS/N85jIImrT9i+79F0emFRf69eI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZpYOx770mebB388ik8G4YfMRj5m2r/p5VmM32SUTClBvSpiEGbplfuUcSXlwy1dBTjXRYhUhZSNhgJIErcBOp3mS6c8bdERlND3hryoK94KY2dpPxHegx5G8M2q1AOH8QKiYdtlUbE5HQxQWn7FICAGTUI4ANtr07LoTK1oJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUxv9MFB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUxv9MFB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so1571530f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774002287; x=1774607087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PyFAyK4HUcK2ef7KsxiHlTu9uNHjs4HaqH/Zh8vA4Zs=;
        b=kUxv9MFBl+/fGP0PRw5XvE6ZADxSUfi2VL42CJM+jJHRpzo9ZSdpbvsNf9oGSKE2JA
         l9NgM29VjHnKGS/ESFA504JlbzyivQ6HKuzkEiMP8P7+TNnDmIKWoEOo0k1IEWRwI/ev
         kWmGpl+j1ZZD2fRnroPHTThflxxwfOLqGPfuGz+Y23WBDuz7RnSzVwGIA+ow4OVmCTX7
         IaZafArB1g62nJwr6E33kU5SU+3Urddrb2InUnT1Ef/MsgR6FQVTowWHRQhsLnwL24H4
         oLBzeLGYCS8xIkEVZ4XTUOM6RSHRpxGYu/tg9YhfbIsX7K13sVzwlo6+GV5zRr54oM8d
         2lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774002287; x=1774607087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyFAyK4HUcK2ef7KsxiHlTu9uNHjs4HaqH/Zh8vA4Zs=;
        b=NwN5fHcOeVAjZKXNpcce49vVH/sejQym5rHWklSJP9ucwo8N78GlOS5oRxAGtP5jSZ
         Q6uXlK5+ntQB1LTJtEN81bYVmTz4eyQUuL95hybYo4FsorSWnYj/ThLAMXnKzCpWyrHS
         dgU7hVp1MBrfq77e1dUEeAUbGHW19bExjr1Sbeu+SQrFs5k9s8mUaWsVls/Ye0RTMrQ5
         gYOkQXQHERu6nQGjyMK73BGZoFB/uZGAjD2JxREux60WxUZa4EHz+Qbqkl6j74ynwbkV
         3+Pf/Vl47NpIqu0yvLArcsYvlu6MbixUs0GJ930sG6zktnkWUOyhUhOCh9bvFfzVuhSH
         KsIQ==
X-Gm-Message-State: AOJu0YzUDjKzva0ZWGj9328nSLz+niiXtEzsiQnuibtynbhgxmMnq9sg
	riu5OJCRZiEgyTGTqMJ7W5T08upfpaY6idr8mZUsNY6PQBk//jSbP276
X-Gm-Gg: ATEYQzwHwFvJjwjz7k8KSVrYysPxJBZ4/mfN/YxoPcSzzSTL0S5irw/5rXcszjSfXGw
	a/0hLxdyUC/NGLay45R54bDqZA4CGe1JkELHvz1Qej/BDspAgUBotu/RcSmTZiDDft9tDnbJ4SY
	lUpXu0jLwD3Eu7efRsaE1fNL2AbxlrkOHjqL4ENxyUa+4eRYeu8ETd2hOpOYAECB6qv48LdMtlW
	4zo1oT5CFx8ZXfpLoi/yicdFor5n93emikREdU6KoVifSsL1rk0o6bWD19MLtGjc0Hv1E5xjsSG
	3ZT5YCTELbsBkftb3ult0Hr8PSGtmBgOiA6r5K8zaG1OUIHk1EViwANA7BjfoImxaSbN/80OWMR
	C3l4oY7vNo9nGLmnUmyZWnuN6qR3Dynn2K1PJQW5k+ctRpe+sz2diHe9ahf3yaedIqcyNVawtUM
	TqOYZdxAkCk9iWI7FhMh2kdPIlMfZbX9UlCd2MdfAci1iT9W018ON+JjpDF3BdYpsBa5UMbarP0
	GjewO/ojwXAYSCHrhvVhJ8=
X-Received: by 2002:adf:9d84:0:b0:439:9812:35ea with SMTP id ffacd0b85a97d-43b576e6f72mr10078488f8f.3.1774002286421;
        Fri, 20 Mar 2026 03:24:46 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm5709797f8f.29.2026.03.20.03.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:24:45 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v3] hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan driver
Date: Fri, 20 Mar 2026 11:24:42 +0100
Message-ID: <20260320102442.150416-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver provides fan speed monitoring for modern Lenovo Yoga,
Legion, and IdeaPad laptops via ACPI.

This version (v3) replaces the previous background-worker approach with
a passive RLLag (Rate Limited Lag) filter to maximize CPU sleep states
and improve power efficiency.

Technical Validation:
- Filter constants (TAU_MS = 3000) verified via physical tachometer
  and FOPTD (First Order Plus Time Delay) identification.
- Uses 10-bit fixed-point math for the Taylor-approximated
  alpha = Ts / (Tau + Ts) calculation.
- Renamed to 'yogafan' for hwmon compliance.
- Added MAINTAINERS entry and linked documentation to the build system.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/yogafan.rst |  51 ++++++
 MAINTAINERS                     |   7 +
 drivers/hwmon/Kconfig           |   7 +-
 drivers/hwmon/Makefile          |   2 +-
 drivers/hwmon/yogafan.c         | 273 ++++++++++++++++++++++++++++++++
 6 files changed, 335 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/hwmon/yogafan.rst
 create mode 100644 drivers/hwmon/yogafan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513c..ca438f294 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -282,4 +282,5 @@ Hardware Monitoring Kernel Drivers
    xdp710
    xdpe12284
    xdpe152c4
+   yogafan
    zl6100
diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
new file mode 100644
index 000000000..c1614f502
--- /dev/null
+++ b/Documentation/hwmon/yogafan.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver yogafan
+=====================
+
+Supported chips:
+  * Lenovo Yoga / Legion / IdeaPad Embedded Controllers
+    Prefix: 'yogafan'
+    Addresses: ACPI (Dynamic probing of FANS, FA2S, FANX, etc.)
+
+Description
+-----------
+
+This driver provides fan speed monitoring for modern Lenovo laptops.
+It interfaces with the Lenovo Embedded Controller (EC) via ACPI to
+retrieve fan tachometer data.
+
+Many Lenovo ECs report RPM values that oscillate rapidly due to
+low-resolution internal sampling. To provide a stable reading in
+userspace (e.g., KDE Plasma, MangoHud), this driver implements a
+"Passive RLLag" (Rate Limited Lag) filter.
+
+Filter Logic:
+he driver implements a Rate-Limited Lag (RLLag) filter using a multirate
+approach. Instead of a fixed-interval background worker, the sampling
+time (Ts) is calculated dynamically as the ktime delta between userspace
+read requests.
+
+This mimics a continuous-time First Order Plus Time Delay (FOPTD) model:
+    rpm_k+1 = rpm_k + clamp(step, -limit, limit)
+
+Where:
+    step = alpha * (raw_rpm - rpm_k)
+    alpha = Ts / (Tau + Ts)  [First-order Taylor approximation of 1-exp(-Ts/Tau)]
+    limit = MaxSlew * Ts
+
+This ensures physical consistency of the signal regardless of the
+userspace polling rate, while maximizing CPU sleep states.
+
+Probing:
+The driver dynamically searches for common Lenovo ACPI fan handles.
+It does not assume a fixed number of fans, making it compatible
+across various Yoga and Legion generations.
+
+Usage Note:
+If your device shows more fans than physically present, the EC is likely
+exposing a virtual or secondary hardware channel.
+
+
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948..dd16c882c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29070,6 +29070,13 @@ S:	Maintained
 F:	Documentation/input/devices/yealink.rst
 F:	drivers/input/misc/yealink.*
 
+YOGAFAN HARDWARE MONITORING DRIVER
+M:	Sergio Melas <sergiomelas@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/yogafan.rst
+F:	drivers/hwmon/yogafan.c
+
 Z8530 DRIVER FOR AX.25
 M:	Joerg Reuter <jreuter@yaina.de>
 L:	linux-hams@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7d938308d..d276763d6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2468,6 +2468,7 @@ config SENSORS_YOGAFAN
 	  This driver can also be built as a module. If so, the module
 	  will be called yoga_fan.
 
+
 config SENSORS_VIA_CPUTEMP
 	tristate "VIA CPU temperature sensor"
 	depends on X86
@@ -2753,8 +2754,4 @@ config SENSORS_HP_WMI
 endif # ACPI
 
 endif # HWMON
-config SENSORS_YOGA_FAN
-	tristate "Lenovo Yoga Fan Hardware Monitoring"
-	depends on ACPI && HWMON
-	help
-	  Support for fan RPM on modern Lenovo laptops.
+
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d8d4ff834..c74b71ec2 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -251,5 +251,5 @@ obj-$(CONFIG_SENSORS_PECI)	+= peci/
 obj-$(CONFIG_PMBUS)		+= pmbus/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
-obj-$(CONFIG_SENSORS_YOGA_FAN) += yoga_fan.o
+obj-$(CONFIG_SENSORS_YOGAFAN) += yogafan.o
 
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
new file mode 100644
index 000000000..a260f4cf6
--- /dev/null
+++ b/drivers/hwmon/yogafan.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
+ *
+ * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
+ * laptops by interfacing with the Embedded Controller (EC) via ACPI.
+ *
+ * The driver implements a passive discrete-time first-order lag filter
+ * with slew-rate limiting (RLLag). This addresses low-resolution
+ * tachometer sampling in the EC by smoothing RPM readings based on
+ * the time delta (dt) between userspace requests, ensuring physical
+ * consistency without background task overhead or race conditions.
+ * The filter has been removed implementing multirate filtering with autoreset in case
+ * of lage sampling time
+ *
+ * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define DRVNAME "yogafan"
+#define MAX_FANS 8
+
+/* Filter Configuration Constants */
+#define TAU_MS          3000    /* Time constant for the first-order lag (ms) */
+#define MAX_SLEW_RPM_S  100     /* Maximum allowed change in RPM per second */
+#define MAX_SAMPLING    5000    /* Maximum allowed Ts for reset */
+
+struct yoga_fan_data {
+	const char *active_paths[MAX_FANS];
+	long filtered_val[MAX_FANS];
+	ktime_t last_update[MAX_FANS];
+	int fan_count;
+};
+
+/**
+ * apply_rllag_filter - Discrete-time filter update (Passive Multirate)
+ * @data: pointer to driver data
+ * @idx: fan index
+ * @raw_rpm: new raw value from ACPI
+ *
+ * Implements a Rate-Limited Lag (RLLag) filter using a multirate approach.
+ * Instead of a fixed-interval heartbeat, the sampling time (Ts) is calculated
+ * dynamically as the ktime delta between userspace read requests.
+ *
+ * This mimics a continuous-time First Order Plus Time Delay (FOPTD) model:
+ * rpm_k+1 = rpm_k + clamp(step, -limit, limit)
+ * where:
+ * step = (alpha * (raw_rpm - rpm_k))
+ * alpha = 1-exp(-Ts/Tau)
+ * Appling first order taylor approximation we get
+ * alpha = Ts / (Tau + Ts)
+ * limit = MaxSlew * Ts
+ *
+ * This ensures physical consistency of the signal regardless of the
+ * userspace polling rate.
+ */
+
+static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
+{
+	ktime_t now = ktime_get();
+	s64 dt_ms;
+	long delta, step, limit, alpha;
+
+	/* Initialize on first read to avoid starting from zero */
+	if (data->last_update[idx] == 0) {
+		data->filtered_val[idx] = raw_rpm;
+		data->last_update[idx] = now;
+		return;
+	}
+
+	dt_ms = ktime_to_ms(ktime_sub(now, data->last_update[idx]));
+
+	/* * SANITATION: Reset filter if no reads occurred for MAX_SAMPLING
+	 * millisecond. This prevents massive 'lag_steps' if userspace polling resumes
+	 * after a long pause or system suspend.
+	 */
+	if (dt_ms > MAX_SAMPLING) {
+		data->filtered_val[idx] = raw_rpm;
+		data->last_update[idx] = now;
+		return;
+	}
+
+	/* SANITATION: Avoid division by zero or jitter from sub-millisecond reads */
+	if (dt_ms < 1)
+		return;
+
+	delta = raw_rpm - data->filtered_val[idx];
+
+	/* * Alpha = dt / (Tau + dt) using 10-bit fixed point math.
+	 * This mimics the physical inertia (FOPTD) of the fan blades.
+	 */
+	alpha = (dt_ms << 10) / (TAU_MS + dt_ms);
+	step = (delta * alpha) >> 10;
+
+	/* Slew Limit = (MaxSlew * dt) / 1000 - Bound the rate of change */
+	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
+
+	if (step > limit)
+		step = limit;
+	else if (step < -limit)
+		step = -limit;
+
+	data->filtered_val[idx] += step;
+
+	/* SANITATION: Floor the value to zero if RPM is negligible */
+	if (data->filtered_val[idx] < 50)
+		data->filtered_val[idx] = 0;
+
+	data->last_update[idx] = now;
+}
+
+static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct yoga_fan_data *data = dev_get_drvdata(dev);
+	unsigned long long raw_acpi;
+	acpi_status status;
+	long rpm;
+
+	if (type != hwmon_fan || attr != hwmon_fan_input)
+		return -EOPNOTSUPP;
+
+	/* Implemnt better casting of staus using ACPI typedef */
+	status = acpi_evaluate_integer(NULL,
+				       (acpi_string)data->active_paths[channel], NULL, &raw_acpi);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* * SANITATION: Lenovo EC typically reports RPM in hundreds for values <= 255.
+	 * Values > 255 are treated as raw RPM. This handles different EC firmware styles.
+	 */
+	rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
+
+	apply_rllag_filter(data, channel, rpm);
+
+	*val = data->filtered_val[channel];
+	return 0;
+}
+
+static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	const struct yoga_fan_data *fan_data = data;
+
+	if (type == hwmon_fan && channel < fan_data->fan_count)
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_ops yoga_fan_hwmon_ops = {
+	.is_visible = yoga_fan_is_visible,
+	.read = yoga_fan_read,
+};
+
+static const struct hwmon_channel_info *yoga_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info yoga_fan_chip_info = {
+	.ops = &yoga_fan_hwmon_ops,
+	.info = yoga_fan_info,
+};
+
+static int yoga_fan_probe(struct platform_device *pdev)
+{
+	struct yoga_fan_data *data;
+	struct device *hwmon_dev;
+	acpi_handle handle;
+	int i;
+
+	static const char * const fan_paths[] = {
+		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga 14c) */
+		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion) */
+		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim */
+		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy */
+		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate */
+	};
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->fan_count = 0;
+
+	/* SANITATION: Verify ACPI path existence before indexing */
+	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
+		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
+			data->active_paths[data->fan_count] = fan_paths[i];
+			data->fan_count++;
+
+			if (data->fan_count >= MAX_FANS)
+				break;
+		}
+	}
+
+	if (data->fan_count == 0)
+		return -ENODEV;
+
+	/* SANITATION: Anchoring drvdata to avoid NULL returns during unload */
+	platform_set_drvdata(pdev, data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
+							 data, &yoga_fan_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver yoga_fan_driver = {
+	.driver = {
+		.name = DRVNAME,
+	},
+	.probe = yoga_fan_probe,
+};
+
+static struct platform_device *yoga_fan_device;
+
+static const struct dmi_system_id yoga_dmi_table[] __initconst = {
+	{
+		.ident = "Lenovo",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, yoga_dmi_table);
+
+static int __init yoga_fan_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(yoga_dmi_table))
+		return -ENODEV;
+
+	ret = platform_driver_register(&yoga_fan_driver);
+	if (ret)
+		return ret;
+
+	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
+	if (IS_ERR(yoga_fan_device)) {
+		platform_driver_unregister(&yoga_fan_driver);
+		return PTR_ERR(yoga_fan_device);
+	}
+
+	return 0;
+}
+
+static void __exit yoga_fan_exit(void)
+{
+	platform_device_unregister(yoga_fan_device);
+	platform_driver_unregister(&yoga_fan_driver);
+}
+
+module_init(yoga_fan_init);
+module_exit(yoga_fan_exit);
+
+MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

