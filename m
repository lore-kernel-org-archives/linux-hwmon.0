Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73547366573
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211916; cv=none; b=iiv5XRdgl6zD+hAONtoL6oKOKucXsbiE6RfMknaFGzBdr4+KHL7NKozbjxhG2KLkCcplf2nK6EciV1/V9Bi8I3mL0QogQSj6xwFh29QfB4uuCBBlNJOrio4D5GDeJ49r8CTFIUaHXlh9TlaP00JfwHIAbDwoD8PSSBMKeHs9lpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211916; c=relaxed/simple;
	bh=4fqROgjTd+2wyKsiAJKfuI7dIdHYk+Tqzvtib0YMpm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcsirnvdxAHVOICUXYh2S4fZcUos/lJs/Ckkc8ynyAMRERoSKSKpzssAzCtz14UtFRZZkzulhcR43EirGmz4UF92hupJMff+K1dcmWiyCeuLh6e5nWAOMBhtQZiII4qc0DRZ4Ao4ab2KD/UAr3lAbODRoQikgurAP1XWvBb6LM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpbncQvt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpbncQvt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so29047375e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774211913; x=1774816713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QKe2gOkJt56Tr7vavfL/z9CTLzShX7yy5VjbhjVWc/A=;
        b=HpbncQvtkWNsd5XOl2Fato4rlxAEJzts0DU3XhS5HtOTiv6TTtW6kIIP5dZvF5a6mZ
         B3Ra8Fp3fKAIVdtvyFoSUiIdhdVuE6oiFCoD57ZQ2S3BSyxvmaKhX0utkeofspPp4deR
         I8tIz80EqOCMwU3IVJKQ3ubE7dlxlhe4TNUqWcjUAGVH+YSKsbS+hidMBApNmDtVIZ4d
         skhW5pXTk7Fitb8HhGqaCjhgdScK8HH5qAgInz8dfGVS6Vy1oqwXI/r/xx7cFDrLBBL5
         OT0ZEXb51pNrIAH9g9QjBSMKrZVMJutU/SL8L2M1mVfLLzPxbPPLArhGeRPubx2KO680
         KutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774211913; x=1774816713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKe2gOkJt56Tr7vavfL/z9CTLzShX7yy5VjbhjVWc/A=;
        b=MKkH7rCWM9+/im4Hv+apz/BKL+Jpo/RJIug9xpnr57vueYW/e0+DDJxWszNdzqDF1/
         7VAc/E7g2aQ8ebt3bnb77PwxlGplW5LDKagPUHx05wiba5hcKZHnnqYLyi6U4eoa36rq
         kX0nYDCV+dStUMB7ik4jOIEAwlb02Q7TGvi4z7gVzObLssMT7gLl7ZYr/eyk7/CfpGuj
         hjQLbEpeYys+UNyIbmRHPpC1dMZJ2+DiHKII+QtTsU4I5A4fK3CmWWFnFL3QotHVGwyl
         yrr2SXLyZhgYPfRTu1WWc8RRarJdjPDvYBIFRf/Ub3tJVYAYoASd6gPJx7WqOsEABGDa
         jexg==
X-Gm-Message-State: AOJu0YyyBqUhClCiyIe2yNqMZa5y4ZoKBd72g2Xk7qJnM3eLyBRiQ0gl
	4WGxzP5Q/CAwX+RRcFAW2ibEka3crFyxBngn7TF53gD3/wnx8RK80NSoaQ9CHSh+
X-Gm-Gg: ATEYQzx1SElHHxWDsiBdrO83DIVInhf5OTaO6cT2w1k5VmV2G2GJlEEomaxn32pibWd
	jl4RiIW94ZBJulPrbj88hVfBSBHSnSQGoy/4PXcx28xA5cB0c0hOaF8vVrE2z/8jm4TD5Q7zsYK
	uzuY+E7OHT0L/Uvvs/5tIN5h0/eS6U6zR1UI0UYjmcj+/ByvuxuaDav5SsHFx2MDHDWXnyZi9ER
	/3I9EcIpUEtcvTUQ0qvf3nW5/Iuq2QQ+sXU8hGwEh4kmdbzZRabiUKxtNFpRrmvFQNumXFyXXpe
	bQ5071L6jgtXM0G/gZu39eox29qnEPGy/2w5uj+Z/oQtO8AMpa0C3DKCU/f3FMjGVZVKNbyevvM
	ZTdmDU28iGm8/EHvmYPFVsLjxooOoIUDRz0qBAxSmOEFTitVruTdTMFW/w3VqYEsAdLM4hd6INw
	VXJtLg3RmlyB8paLMuDU8P2aDHs9w=
X-Received: by 2002:a05:600c:350b:b0:485:3f58:da2 with SMTP id 5b1f17b1804b1-486fe8fcf64mr136774295e9.16.1774211912364;
        Sun, 22 Mar 2026 13:38:32 -0700 (PDT)
Received: from sergio-82n7 ([134.255.161.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d452sm66218005e9.19.2026.03.22.13.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 13:38:31 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
Date: Sun, 22 Mar 2026 21:38:09 +0100
Message-ID: <20260322203809.44048-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
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
v4:
- Rebased on groeck/hwmon-next branch for clean application.
- Removed unnecessary blank lines and cleaned code formatting.
- Corrected alphabetical sorting in Kconfig and Makefile.
- Technical Validation & FOPTD Verification:
  - Implemented FOPTD (First Order Plus Time Delay) modeling.
  - Used 10-bit fixed-point math for alpha calculation to avoid
    floating point overhead in the kernel.
  - Added 5000ms filter reset for resume/long-polling sanitation.
- Hardware Discovery:
  - Confirmed support for paths: FANS, FA2S, FAN0.
  - Restricted to LENOVO hardware via DMI matching.
---
 MAINTAINERS             |   6 +
 drivers/hwmon/Kconfig   |  11 ++
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/yogafan.c | 247 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 drivers/hwmon/yogafan.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 830c6f076b00..9167f3d4f243 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14873,6 +14873,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/usb/dvb-usb-v2/lmedm04*
 
+LNVYOGAFAN HARDWARE MONITORING DRIVER
+M:	Sergio Melas <sergiomelas@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/yogafan.c
+
 LOADPIN SECURITY MODULE
 M:	Kees Cook <kees@kernel.org>
 S:	Supported
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fb77baeeba27..3bb91623b157 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2653,6 +2653,17 @@ config SENSORS_XGENE
 	  If you say yes here you get support for the temperature
 	  and power sensors for APM X-Gene SoC.
 
+config SENSORS_YOGAFAN
+	tristate "Lenovo Yoga/Legion Fan Hardware Monitoring"
+	depends on ACPI && HWMON
+	help
+	  If you say yes here you get support for fan speed monitoring
+	  on modern Lenovo Yoga and Legion laptops.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called yogafan.
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
index 000000000000..10c48fca8387
--- /dev/null
+++ b/drivers/hwmon/yogafan.c
@@ -0,0 +1,247 @@
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
+#define DRVNAME "yogafan"
+#define MAX_FANS 8
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
+ * Applying first order taylor approximation we get:
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
+	/* Initialize on first read to avoid starting from zero */
+	if (data->last_update[idx] == 0) {
+		data->filtered_val[idx] = raw_rpm;
+		data->last_update[idx] = now;
+		return;
+	}
+	dt_ms = ktime_to_ms(ktime_sub(now, data->last_update[idx]));
+	/* SANITATION: Reset filter if no reads occurred for MAX_SAMPLING
+	 * milliseconds. This prevents massive 'lag_steps' if userspace polling resumes
+	 * after a long pause or system suspend.
+	 */
+	if (dt_ms > MAX_SAMPLING) {
+		data->filtered_val[idx] = raw_rpm;
+		data->last_update[idx] = now;
+		return;
+	}
+	/* SANITATION: Avoid division by zero or jitter from sub-millisecond reads */
+	if (dt_ms < 1)
+		return;
+	delta = raw_rpm - data->filtered_val[idx];
+	/* Alpha = dt / (Tau + dt) using 10-bit fixed point math.
+	 * This mimics the physical inertia (FOPTD) of the fan blades.
+	 */
+	alpha = (dt_ms << 10) / (TAU_MS + dt_ms);
+	step = (delta * alpha) >> 10;
+	/* Slew Limit = (MaxSlew * dt) / 1000 - Bound the rate of change */
+	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
+	if (step > limit)
+		step = limit;
+	else if (step < -limit)
+		step = -limit;
+	data->filtered_val[idx] += step;
+
+	/* SANITATION: Floor the value to zero if RPM is negligible */
+	if (data->filtered_val[idx] < 50)
+		data->filtered_val[idx] = 0;
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
+	/* Implement better casting of status using ACPI typedef */
+	status = acpi_evaluate_integer(NULL, (acpi_string)data->active_paths[channel],
+					NULL, &raw_acpi);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* SANITATION: Lenovo EC typically reports RPM in hundreds for values <= 255.
+	 * Values > 255 are treated as raw RPM. This handles different EC firmware styles.
+	 */
+	rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
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
+	/* SANITATION: Anchoring drvdata to avoid NULL returns during unload */
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

base-commit: be8aad7a8a14151fd471aadf368e1582f91a7817
-- 
2.53.0

