Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC393537C7
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 22:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774476532; cv=none; b=Hb5IirSWhSZKRhm8WJMMDAnny13odX8ppV/3O3XFWBha2rfSi8cFhU+d6eT55VSHCaLdgQezSHau50b7seTLMXt4xDp2Wk5HuLJztYaH1MOswAWpgLaM138uQJE3HzpmCFoiC78bOzOoC7XSQ/TNJWKbORfkRbUSdlN8qrkpsPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774476532; c=relaxed/simple;
	bh=2gOyncbdeKVzLR6Ian1L5NZJH8RBa+4E/Wbs1/Y7Flg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7rvBdWS/Ngd545h8+RS0TNMEkg+xCZahW0ySngOje8b+n56YOPlFFlXIH3i0SszCVbRl60ICIJifLNkuX5ozFQSuEaMuOICSdZXtSsJped0t/OBRmMe0haizkzxQ1dGHDaCTLnh9Bj2MG+iiOaA6mnDQzsVnYFFooa8H/6Gsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU3FxL1s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU3FxL1s"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b9b190easo189772f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774476527; x=1775081327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4Kk9guwvcCvhE4oRqiLBr3NwAHyhZOVRKo0fzxJlZY=;
        b=IU3FxL1sBUBbAQD2xOPEQFWBBGQS3oVNxXMIFxOIh/RCwvr1/rWrEVF3to+/MjFz5J
         2aysqmjsxQ0zkQOfn5ceHsisLeRegwmNb2lQhzMpEJRh+77Y7wTFVf1PUdb/ThSyQ0Bj
         jRVi197v0doWDRwcJ95vKtX85bKJ3/EYcJ8JlNMnMtunZd8qooWYqB/Dl7rAFqy+Zd7i
         inGqDRQSVsEFq0VWOEjIOOqrDBveP1SO+yLjHFDRBWkASma2S+WfWjtLRoLoXnWluou+
         80tpYwjYD1tKTvIRevUyTtcdK3TUaWH1dOH6eKvnwr0FqTnI2X9Bl0uAQAW7myNnUY8/
         ONqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774476527; x=1775081327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4Kk9guwvcCvhE4oRqiLBr3NwAHyhZOVRKo0fzxJlZY=;
        b=gFYZDU10qSONv35slvAKmkjmQGCJ9uglXAqEzYn1coTjMObMXtZBIHzleOCyYLQ3Jv
         bSEs/OT+iOmjHzILdf1B9LJWrB9jE9vezJF68xzMdXPkPj4EPTlVdPG2YWrKbuluB8aF
         4iHXsIvCEUUPKY4vdRZtGhVt6qIoZQ3hg68VDS/BZJi6Ro46Nllycf19e5RwA7pTabuB
         87jP49rYSD2cEgRG/xE4hBEnro/HPfqiOHgPKPa/3UeQugGL2eIf+pyKp2SXLY8TUxkN
         yx5HEMlvSZaQasfayBwH7HwHbj71u8anS7Bo0TXqCAeJ5vWKpiFm+JHwO1jtVdOwzGBS
         VC4g==
X-Forwarded-Encrypted: i=1; AJvYcCUtsWp7Dr8YgVtyQ8TX+jciDNAdby3Ce1wNK802MkVUEmar0eej/RbXsl/pXQXbYmZKfchXQqUw0wEpVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzskY1QcKIkJuxvNyCh7+ClLgzV7V/F1mkpZI8Bd+jmoOQ/XS
	spY/vnJjM4IR1+C4GDffy2PSfZlbZrFPtipaqLk05XCo0jmpHz5LkLkHVt4oYjHsWww=
X-Gm-Gg: ATEYQzwErQj78DgTkMP5uR18fxCs1qdtnE5TEgJkplcB1463PisePYHlZU4y3xvSixI
	i/PttsLoruuGq9/mmUK1zq4RrAwgQYPgN4FC6xUasjKL7ShiiXzG+KB2eCbjjWTAE03zEIgEj/Q
	KCYfLljd1wP68xPPxdy+rX5KD+S0XU/0dy8mfNFCwaRzhYDFcH3COQWG15NZLBv7Z5sc0iWnyxl
	yg6vkAJZQGthTNuWdFRZb76/wUzNK1Q2mbuBcIDUbwtHNgscFJ9UrJKUoqFHz8gWlZ4fut+rgcG
	/xHCDsmYhzFZWEMHoBiuUmxRKvmBO0O2a5Z6+n6or/Y9dm0fuI+SMGmq2huDMN6LVQceOTlucyF
	lQWl1u3reh2OQdyw6Ut31p7Dbob+eR/XXps/L4hBgL9uW+n727OR1uszfVBVxVQaN4I6w8YstOS
	aCrWSefDPas6ZSxsHi84iL27cjvzo=
X-Received: by 2002:a05:6000:2481:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43b88a29252mr7547982f8f.39.1774476526566;
        Wed, 25 Mar 2026 15:08:46 -0700 (PDT)
Received: from sergio-82n7 ([134.255.161.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm2770768f8f.17.2026.03.25.15.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:08:46 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v8] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
Date: Wed, 25 Mar 2026 23:06:24 +0100
Message-ID: <20260325220624.102847-1-sergiomelas@gmail.com>
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
v8:
  - Replaced heuristic multiplier with deterministic DMI Quirk Table.
  - Added 'depends on DMI' to Kconfig.
  - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardware traces.
  - Increased filter precision to 12-bit fixed-point.
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
 Documentation/hwmon/yogafan.rst |  96 +++++++++++
 MAINTAINERS                     |   8 +
 drivers/hwmon/Kconfig           |   8 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/yogafan.c         | 284 ++++++++++++++++++++++++++++++++
 6 files changed, 398 insertions(+)
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
index 000000000000..c9ca9f6a53b2
--- /dev/null
+++ b/Documentation/hwmon/yogafan.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver yogafan
+=====================
+
+Supported chips:
+
+  * Lenovo Yoga, Legion, IdeaPad, Slim, Flex, and LOQ Embedded Controllers
+    Prefix: 'yogafan'
+    Addresses: ACPI handle (see probe list in driver)
+
+Author: Sergio Melas <sergiomelas@gmail.com>
+
+Description
+-----------
+
+This driver provides fan speed monitoring for modern Lenovo consumer laptops.
+Most Lenovo laptops do not provide fan tachometer data through standard
+ISA/LPC hardware monitoring chips. Instead, the data is stored in the
+Embedded Controller (EC) and exposed via ACPI.
+
+The driver implements a **Rate-Limited Lag (RLLag)** filter to handle
+the low-resolution and jittery sampling found in Lenovo EC firmware.
+
+Hardware Identification and Multiplier Logic
+--------------------------------------------
+
+The driver supports two distinct EC architectures. Differentiation is handled
+deterministically via a DMI Product Family quirk table during the probe phase,
+eliminating the need for runtime heuristics.
+
+1. 8-bit EC Architecture (Multiplier: 100)
+   - **Families:** Yoga, IdeaPad, Slim, Flex.
+   - **Technical Detail:** These models allocate a single 8-bit register for
+     tachometer data. Since 8-bit fields are limited to a value of 255, the
+     BIOS stores fan speed in units of 100 RPM (e.g., 42 = 4200 RPM).
+
+2. 16-bit EC Architecture (Multiplier: 1)
+   - **Families:** Legion, LOQ.
+   - **Technical Detail:** High-performance gaming models require greater
+     precision for fans exceeding 6000 RPM. These use a 16-bit word (2 bytes)
+     storing the raw RPM value directly.
+
+Filter Details:
+---------------
+
+The RLLag filter is a passive discrete-time first-order lag model that ensures:
+  - **Smoothing:** Low-resolution step increments are smoothed into 1-RPM increments.
+  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping the change
+    to 1500 RPM/s, matching physical fan inertia.
+  - **Polling Independence:** The filter math scales based on the time delta
+    between userspace reads, ensuring a consistent physical curve regardless
+    of polling frequency.
+
+Suspend and Resume
+------------------
+
+The driver utilizes the boottime clock (ktime_get_boottime()) to calculate the
+sampling delta. This ensures that time spent in system suspend is accounted
+for. If the delta exceeds 5 seconds (e.g., after waking the laptop), the
+filter automatically resets to the current hardware value to prevent
+reporting "ghost" RPM data from before the sleep state.
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
+
+References
+----------
+
+1. **ACPI Specification (Field Objects):** Documentation on how 8-bit vs 16-bit
+   fields are accessed in OperationRegions.
+   https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#field-objects
+
+2. **LegionFanControl & NBFC Projects:** Community-driven reverse engineering
+   of Lenovo Legion/LOQ EC memory maps (16-bit raw registers).
+   https://www.legionfancontrol.com/
+   https://github.com/hirschmann/nbfc/tree/master/Configs
+
+3. **Linux Kernel Timekeeping API:** Documentation for ktime_get_boottime() and
+   handling deltas across suspend states.
+   https://www.kernel.org/doc/html/latest/core-api/timekeeping.html
+
+4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
+   feature gating in Lenovo laptops.
+   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/ideapad-laptop.c
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
index 7dd8381ba0d0..ca1ed3e63d4a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2653,6 +2653,14 @@ config SENSORS_XGENE
 	  If you say yes here you get support for the temperature
 	  and power sensors for APM X-Gene SoC.
 
+config SENSORS_YOGAFAN
+	tristate "Lenovo Yoga Fan Hardware Monitoring"
+	depends on ACPI && HWMON && DMI
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
index 000000000000..f5a5689ba1a0
--- /dev/null
+++ b/drivers/hwmon/yogafan.c
@@ -0,0 +1,284 @@
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
+
+/* Driver Configuration Constants */
+#define DRVNAME "yogafan"
+#define MAX_FANS 8
+
+/* Filter Configuration Constants */
+#define TAU_MS          1000    /* Time constant for the first-order lag (ms) */
+#define MAX_SLEW_RPM_S  1500     /* Maximum allowed change in RPM per second */
+#define MAX_SAMPLING    5000    /* Maximum allowed Ts for reset (ms) */
+
+/* RPM Sanitation Constants */
+#define RPM_FLOOR_LIMIT    50   /* Snap filtered value to 0 if raw is 0 */
+
+struct yogafan_config {
+	int multiplier;
+};
+
+struct yoga_fan_data {
+	const char *active_paths[MAX_FANS];
+	long filtered_val[MAX_FANS];
+	ktime_t last_sample[MAX_FANS];
+	int multiplier;
+	int fan_count;
+};
+
+/* Known hardware configurations based on EC register bit-width */
+static const struct yogafan_config yoga_8bit_cfg = { .multiplier = 100 };
+static const struct yogafan_config legion_16bit_cfg = { .multiplier = 1 };
+
+/**
+ * apply_rllag_filter - Discrete-time filter update (Passive Multirate)
+ * @data: pointer to driver data
+ * @idx: fan index
+ * @raw_rpm: new raw value from ACPI
+ */
+static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
+{
+	ktime_t now = ktime_get_boottime(); /* Fixed for Suspend/Resume safety */
+	s64 dt_ms = ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
+	long delta, step, limit, alpha;
+	s64 temp_num;
+
+	if (raw_rpm < RPM_FLOOR_LIMIT) {
+		data->filtered_val[idx] = 0;
+		data->last_sample[idx] = now;
+		return;
+	}
+
+	/* Initialize on first run or after long sleep/stall */
+	if (data->last_sample[idx] == 0 || dt_ms > MAX_SAMPLING) {
+		data->filtered_val[idx] = raw_rpm;
+		data->last_sample[idx] = now;
+		return;
+	}
+	if (dt_ms <= 0) return;
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
+	if (type != hwmon_fan || attr != hwmon_fan_input)
+		return -EOPNOTSUPP;
+	status = acpi_evaluate_integer(NULL, (acpi_string)data->active_paths[channel],
+					NULL, &raw_acpi);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	/* Deterministic calculation based on DMI-detected multiplier */
+	apply_rllag_filter(data, channel, (long)raw_acpi * data->multiplier);
+	*val = data->filtered_val[channel];
+	return 0;
+}
+
+static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	const struct yoga_fan_data *fan_data = data;
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
+/* Quirk table to map families to multipliers deterministically */
+static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo Yoga",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga"),
+		},
+		.driver_data = (void *)&yoga_8bit_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad"),
+		},
+		.driver_data = (void *)&yoga_8bit_cfg,
+	},
+	{
+		.ident = "Lenovo Slim",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Slim"),
+		},
+		.driver_data = (void *)&yoga_8bit_cfg,
+	},
+	{
+		.ident = "Lenovo Flex",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Flex"),
+		},
+		.driver_data = (void *)&yoga_8bit_cfg,
+	},
+	{
+		.ident = "Lenovo Legion",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion"),
+		},
+		.driver_data = (void *)&legion_16bit_cfg,
+	},
+	{
+		.ident = "Lenovo LOQ",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ"),
+		},
+		.driver_data = (void *)&legion_16bit_cfg,
+	},
+	{ }
+};
+
+static int yoga_fan_probe(struct platform_device *pdev)
+{
+	const struct dmi_system_id *dmi_id;
+	const struct yogafan_config *cfg;
+	struct yoga_fan_data *data;
+	struct device *hwmon_dev;
+	acpi_handle handle;
+	int i;
+	static const char * const fan_paths[] = {
+		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga) */
+		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion / LOQ) */
+		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim / Flex */
+		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy (pre-2020 models) */
+		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate (Certain Slim/Flex) */
+	};
+
+	dmi_id = dmi_first_match(yogafan_quirks);
+	if (!dmi_id)
+		return -ENODEV;
+	cfg = dmi_id->driver_data;
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->multiplier = cfg->multiplier;
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
+static int __init yoga_fan_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(yogafan_quirks))
+		return -ENODEV;
+
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
+
+MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

