Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7335838E
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774421068; cv=none; b=MgW4DZBH4fzXxTivnyuu5oLPci49hMnHxY5av6cg2t2Vq9Keq88I9jns+hJ4yojo1bCEDKcMi9nzUmfZbtZDiMKrCkRCAhWnFsxyO0+verenYdfwCuaATOiXsS8JSDvFRXb+n+krRZOEWaUpakD6UJJWWD+79qAEMFytZHAUi+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774421068; c=relaxed/simple;
	bh=BEZYjR9zT4jQzV55zXzLnKS0jj6HZ8Rp+DbRiXqi0BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuKK2Acd2BuhvxXvt5ieJlJDFuThlc0H3fCXDhur0/4+0VBSImEbtAMNEbloNG0qo68fmgz1SsdRbva9CoycGdhzWBCpyqRHsIKWT4TlsuqszxAvUvDGKYp0p6nQdEtGwMUIc/tTXRwi1x5LdaA0Dy+pSttoye72CShWeVUqjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHQ013nw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHQ013nw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe655187so58814325e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774421065; x=1775025865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZM9ndPoZESBJiVVr65V9S6Shs7oR3OUMUIvrGDEIVY=;
        b=UHQ013nwRAYKxMJREFMHOo/8i6wFl/jhlJ6VxHpI8I7YK7oE9/zIV0xybX3rt37Koq
         Nmf8vdGvkV6Gt5RomER4LJxWyWxSD29cIuia66Ix3EiUXVorJhZYMBHsI1N2Px0AlLM4
         VKCA+DECNEXyRkJ9KC+dXjyBPhFdN99Gs3nXXDIftggYoTH32/1ZF2YW2x0W2ePXcISm
         kcQbTgbM7VXwYW8cwqIYJHYqY+Dur8lBOBVmDSH4btA3LrhkTBW/Pr5fGw4qxHZeI+pi
         rbUSC7ebMMEN/3gzvZ6LHy5LVpPugtnFuzd6MTk6E3sKV9Ia7AdwNGxBq+bMHO6DCHZJ
         u3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774421065; x=1775025865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZM9ndPoZESBJiVVr65V9S6Shs7oR3OUMUIvrGDEIVY=;
        b=NCwHegg7QrIGBQUoAWIEIg+FDoXL3MFnBbe65Mg4Pl6QcY7PhayeI+xuDCyH+0pNec
         ddwsLb8GCa7ZDs8kS8/7B6Lp6kT934JwJFEoAeJwWPAC23cUFUxLD98fwUDwzU2UAmty
         QTeZ0dcB2SM21SeOKoAnioNgvZSQMtutpQAObMcLjbO1UEp/sBIbB7M0LtGvTZt1os8u
         BMQenaD4PWlKNq32HMffmPK8UKM1JQIqgo4LLeUkM4TSTyRuNEyGBIicVJKXJMWOiitr
         0WkR33tJyWYsaMWmtylVJZJKgITp2ykZCLmapHV9rciB9a7PkF9oFdq65HAdnHi6EhFJ
         UY3A==
X-Forwarded-Encrypted: i=1; AJvYcCWsbLp4Mj+R3yJCn8VknphKBgGRTVnHdOy/2jzHXoVI0Kdo5LOZVOdu9hVHDiSnRMN7Qypn78pPDgptVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkvRt82FWQJ+upsGUTEUEZ/UiunPnKZ2j7GLlfg5S4mJ26kUs
	WwkNGQyQ6OorHZdetYZEXQMX6REcDUbPH8Mb+tdhATDPPe3CfOeQ11+S
X-Gm-Gg: ATEYQzwsNb8G96wY+C3FiNsz7RRcrRNYuAj2ONDkXDxLesdR2p82yR7AObSd3FuQ0tS
	p+ZoOduFkJzxe1/tbpVB8LK1evZihOBxkNGO5j3ftLMVsBS6Ka/W3+2chX6B9OOpbTrLH9pdkKP
	ucwH7xeHDmV+uIvOORRlKuETHvODjTdz91T0A/KAChoj1wwrUb/OQHpIM8nfXIpYmXZo+kpQYFB
	kon789ij0a1Cv6i4EABz20XoWuNBZ4gXPDFgc/MlwJkPKqsukHpvo3Th+UGyuNCPYxCaSsyk1CU
	7p20+xbEK7cxksq7LrFoBSApPvB8rx5hPjhbmRw+eBcMqPdtmf7Ki107ZR44OIS5hsbFPzAEURr
	CsWkPckI7USoV7vx1iYzNlD9kS2BzcgVVHm2BBrwhGAPaxFdrmQl/gAWpm49PQOi4+WLS5bdOkB
	irI2GYxRv0mKLsWdOrwYeow7jmzU0=
X-Received: by 2002:a05:600c:a12:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-4871605a984mr33321955e9.21.1774421064604;
        Tue, 24 Mar 2026 23:44:24 -0700 (PDT)
Received: from sergio-82n7 ([134.255.161.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113d73c0sm121792015e9.0.2026.03.24.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 23:44:24 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v7] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
Date: Wed, 25 Mar 2026 07:43:58 +0100
Message-ID: <20260325064358.533849-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7ac0d696-327d-4dfe-8ee3-73242255ad32@roeck-us.net>
References: <7ac0d696-327d-4dfe-8ee3-73242255ad32@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver provides fan speed monitoring for modern Lenovo Yoga,
Legion, and IdeaPad laptops. It interfaces with the Embedded
Controller (EC) via ACPI to retrieve tachometer data.

To address low-resolution sampling in the Lenovo EC firmware, the
driver implements a Rate-Limited Lag (RLLag) filter using a passive
discrete-time first-order model. This ensures physical consistency
of the RPM signal regardless of userspace polling rates.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

---
v7:
  - Fixed Kconfig: Removed non-existent 'select MATH64'.
  - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an 
    immediate 0-RPM bypass in the filter.
  - Clarification: Previous "unified structure" comment meant that all 
    6 files (driver, docs, metadata) are now in this single atomic patch.
v6:
  - Unified patch structure (6 files changed).
  - Verified FOPTD (First-Order Plus Time Delay) model against hardware 
     traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
  - Fixed a rounding stall: added a +/- 1 RPM floor to the step calculation 
    to ensure convergence even at high polling frequencies.
  - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
  - Documentation: Updated to clarify 100-RPM hardware step resolution.
  - 32-bit safety: Implemented div64_s64 for coefficient precision.
v5:
  - Fixed 32-bit build failures by using div64_s64 for 64-bit division.
  - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.).
  - Fixed filter stall by ensuring a minimum slew limit (limit = 1).
  - Refined RPM floor logic to trigger only when hardware reports 0 RPM.
  - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
v4:
  - Rebased on groeck/hwmon-next branch for clean application.
  - Corrected alphabetical sorting in Kconfig and Makefile.
  - Technical Validation & FOPTD Verification:
    - Implemented RLLag (Rate-Limited Lag) first-order modeling.
    - Used 10-bit fixed-point math for alpha calculation to avoid
      floating point overhead in the kernel.
    - Added 5000ms filter reset for resume/long-polling sanitation.
v3:
  - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
  - Fixed integer overflow in filter math.
  - Added support for secondary fan paths (FA2S) for Legion laptops.
v2:
  - Migrated from background worker to passive multirate filtering.
  - Implemented dt-based scaling to maximize CPU sleep states.
  - Restricted driver to Lenovo hardware via DMI matching.
v1:
  - Initial submission with basic ACPI fan path support.
---
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/yogafan.rst |  48 +++++++
 MAINTAINERS                     |   8 ++
 drivers/hwmon/Kconfig           |   8 ++
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/yogafan.c         | 230 ++++++++++++++++++++++++++++++++
 6 files changed, 296 insertions(+)
 create mode 100644 Documentation/hwmon/yogafan.rst
 create mode 100644 drivers/hwmon/yogafan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 559c32344cd3..199f35a75282 100644
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
index 000000000000..e0f2b060aabc
--- /dev/null
+++ b/Documentation/hwmon/yogafan.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver yogafan
+=====================
+
+Supported chips:
+
+  * Lenovo Yoga, Legion, and IdeaPad Embedded Controllers
+    Prefix: 'yogafan'
+    Addresses: ACPI handle (see probe list in driver)
+
+Author: Sergio Melas <sergiomelas@gmail.com>
+
+Description
+-----------
+
+This driver provides fan speed monitoring for modern Lenovo laptops.
+Most Lenovo laptops do not provide fan tachometer data through standard
+ISA/LPC hardware monitoring chips. Instead, the data is stored in the
+Embedded Controller (EC) and exposed via ACPI.
+
+The driver implements a **Rate-Limited Lag (RLLag)** filter to handle
+the low-resolution and jittery sampling found in Lenovo EC firmware.
+
+Filter Details:
+---------------
+
+The RLLag filter is a discrete-time first-order lag model that ensures:
+  - **Smoothing:** Jittery 1000-RPM step increments are smoothed into 1-RPM increments.
+  - **Slew-Rate Limiting:** Prevents "teleporting" readings by capping the change
+    to 1500 RPM/s, matching physical fan inertia.
+  - **Polling Independence:** The filter math scales based on the time delta
+    between userspace reads, ensuring the same physical curve regardless
+    of whether you poll at 1Hz or 1000Hz.
+
+Usage
+-----
+
+The driver exposes standard hwmon sysfs attributes:
+
+================  =============================================================
+Attribute         Description
+================  =============================================================
+fanX_input        Filtered fan speed in RPM.
+================  =============================================================
+
+Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is reported
+immediately to ensure the user knows the fan has stopped.
diff --git a/MAINTAINERS b/MAINTAINERS
index 830c6f076b00..94416af57b28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14873,6 +14873,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/usb/dvb-usb-v2/lmedm04*
 
+LENOVO YOGA FAN DRIVER
+M:	Sergio Melas <sergiomelas@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+W:	https://github.com/sergiomelas
+S:	Maintained
+F:	Documentation/hwmon/yogafan.rst
+F:	drivers/hwmon/yogafan.c
+
 LOADPIN SECURITY MODULE
 M:	Kees Cook <kees@kernel.org>
 S:	Supported
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7dd8381ba0d0..644b52c6ba66 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2653,6 +2653,14 @@ config SENSORS_XGENE
 	  If you say yes here you get support for the temperature
 	  and power sensors for APM X-Gene SoC.
 
+config SENSORS_YOGAFAN
+	tristate "Lenovo Yoga Fan Hardware Monitoring"
+	depends on ACPI && HWMON
+	help
+	  Say Y here if you want to monitor fan speeds on Lenovo Yoga
+	  and Legion laptops.
+
+
 config SENSORS_INTEL_M10_BMC_HWMON
 	tristate "Intel MAX10 BMC Hardware Monitoring"
 	depends on MFD_INTEL_M10_BMC_CORE
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 556e86d277b1..0fce31b43eb1 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -245,6 +245,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
+obj-$(CONFIG_SENSORS_YOGAFAN)	+= yogafan.o
 
 obj-$(CONFIG_SENSORS_OCC)	+= occ/
 obj-$(CONFIG_SENSORS_PECI)	+= peci/
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
new file mode 100644
index 000000000000..4c27f6884b4a
--- /dev/null
+++ b/drivers/hwmon/yogafan.c
@@ -0,0 +1,230 @@
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
+ * The filter implements multirate filtering with autoreset in case
+ * of large sampling time.
+ *
+ * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
+ */
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/math64.h>
+/* Driver Configuration Constants */
+#define DRVNAME "yogafan"
+#define MAX_FANS 8
+/* Filter Configuration Constants */
+#define TAU_MS          1000    /* Time constant for the first-order lag (ms) */
+#define MAX_SLEW_RPM_S  1500     /* Maximum allowed change in RPM per second */
+#define MAX_SAMPLING    5000    /* Maximum allowed Ts for reset (ms) */
+/* RPM Heuristic and Sanitation Constants */
+#define RPM_UNIT_THRESHOLD 500  /* Values below this treated as units of 100 */
+#define RPM_UNIT_MULT      100  /* Multiplier for low-res EC readings */
+#define RPM_FLOOR_LIMIT    50   /* Snap filtered value to 0 if raw is 0 */
+
+struct yoga_fan_data {
+	const char *active_paths[MAX_FANS];
+	long filtered_val[MAX_FANS];
+	ktime_t last_sample[MAX_FANS]; /* Renamed from last_update for consistency */
+	int fan_count;
+};
+/**
+ * apply_rllag_filter - Discrete-time filter update (Passive Multirate)
+ * @data: pointer to driver data
+ * @idx: fan index
+ * @raw_rpm: new raw value from ACPI
+ */
+static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
+{
+	ktime_t now = ktime_get();
+	s64 dt_ms = ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
+	long delta, step, limit, alpha;
+	s64 temp_num;
+
+	if (raw_rpm < RPM_FLOOR_LIMIT) {
+		data->filtered_val[idx] = 0;
+		data->last_sample[idx] = now;
+		return;
+	}
+	/* Initialize on first run or after long sleep/stall */
+	if (data->last_sample[idx] == 0 || dt_ms > MAX_SAMPLING) {
+		data->filtered_val[idx] = raw_rpm;
+		data->last_sample[idx] = now;
+		return;
+	}
+	if (dt_ms <= 0) return;
+
+	delta = raw_rpm - data->filtered_val[idx];
+	if (delta == 0) {
+		data->last_sample[idx] = now;
+		return;
+	}
+	/* Alpha with 12-bit precision to prevent alpha=0 on fast polls */
+	temp_num = dt_ms << 12;
+	alpha = (long)div64_s64(temp_num, (s64)(TAU_MS + dt_ms));
+	step = (delta * alpha) >> 12;
+	/* FIX THE STALL: Force a move of 1 RPM if alpha*delta rounds to zero */
+	if (step == 0 && delta != 0)
+		step = (delta > 0) ? 1 : -1;
+	/* SLEW RATE LIMITING: Scaled by time delta */
+	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
+	if (limit < 1) limit = 1;
+	/* Clamp step to physical slew rate */
+	if (step > limit)
+		step = limit;
+	else if (step < -limit)
+		step = -limit;
+	data->filtered_val[idx] += step;
+	data->last_sample[idx] = now;
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
+	status = acpi_evaluate_integer(NULL, (acpi_string)data->active_paths[channel],
+					NULL, &raw_acpi);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	/* * Heuristic: Convert units-of-100 to raw RPM.
+	 * Most Yoga/Legion ECs return a single byte (0-255).
+	 * We use 500 as a safety threshold to distinguish from raw 16-bit RPM.
+	 */
+	rpm = (long)raw_acpi;
+	if (rpm > 0 && rpm < RPM_UNIT_THRESHOLD)
+		rpm *= RPM_UNIT_MULT;
+	apply_rllag_filter(data, channel, rpm);
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
+	static const char * const fan_paths[] = {
+		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga 14c) */
+		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion) */
+		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim */
+		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy */
+		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate */
+	};
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->fan_count = 0;
+	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
+		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
+			data->active_paths[data->fan_count] = fan_paths[i];
+			data->fan_count++;
+			if (data->fan_count >= MAX_FANS)
+				break;
+		}
+	}
+
+	if (data->fan_count == 0)
+		return -ENODEV;
+	platform_set_drvdata(pdev, data);
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
+							 data, &yoga_fan_chip_info, NULL);
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
+	ret = platform_driver_register(&yoga_fan_driver);
+	if (ret)
+		return ret;
+	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
+	if (IS_ERR(yoga_fan_device)) {
+		platform_driver_unregister(&yoga_fan_driver);
+		return PTR_ERR(yoga_fan_device);
+	}
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
+MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

