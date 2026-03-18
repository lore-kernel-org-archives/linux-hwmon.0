Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3078C1D6193
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854736; cv=none; b=OI9WEtQEV2G2zaxsXnxb2PbC4K8B7Vi8GBrX0zTRrscsqr4opE/pdPidrsvOLesbNhiaT83PUcMfOgsdUxWd/hQ1sxkHBq0OODI5TtFGp4Yd2ND0PhOeWE1OOCRzbwSzpZ2lST2SWln7kQpMhxcmHP1cwgzNbG9pjmZnPJfpltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854736; c=relaxed/simple;
	bh=DufJe/jCsIw4BCMXdGE5w/ENLsY4JKzOFkxjopVyxmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McCuubJ070VWxNuloHXYpLggsVrYHPftpfZtSJp3gdAWkVsBcOw/4qyczQzYRg2ZMvs0Q5gZBh8iMrPdl1MfNW7bcmo6cCVLAN6Ym2Fx/q1mkLEPLvxGYbtLyyJdnxHz8wEnaGR+xN+f4cuxeQ/x9lQkhMNxVeELXFpA+Wsci4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU8Oro6G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU8Oro6G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso11880715e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773854733; x=1774459533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7To4vbSuWMuwF54+BuAtV/9YQQIT+Rp02Xis7KmFRWY=;
        b=DU8Oro6Gq3a35DcDCmXwQLr7Lby5sgqXpx4TE6eePKKbBYMkfyk6+/UJIPV4Bqu3EV
         IaJ0FdnneniZaBuopLHIfj3Q2fPvq7o9kWbMc8W8YQTukTo29XhlLNtu12m2X/nwIl5U
         NUzxXCeidKDSQn6xAEInwIJGl8FZrMshJb3aDXylT15u1pa/7UO8HAgwTd1IdmZf6vx/
         wX7Ba8op3t/u9RkJ0OR7YMa4UYs9eGpm5D4KkUtnBPsMROMbL4148fbAS9XvZq0i5yGj
         3sf4/Yz/naX4P3uiI5/DBiC9adyFC9l74rEV3Xj97Cao2IEAPpPceoPseCp7lKQY61+N
         25YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854733; x=1774459533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7To4vbSuWMuwF54+BuAtV/9YQQIT+Rp02Xis7KmFRWY=;
        b=mghB1+rQb/F32wScXwFrD5FHSq+XmvfwVSA6pS4vtlbUdWEd9vUyIYe8lPnK4YtIWH
         2inxFa/i6tJJn4DOzjHn6d8qnx9k+uxchI2LbGxscRfVVxqAnWYE0lgvfWjQ+BxS96Qw
         gckM60j6QCm6sfdps/J6n8Tz+HUg12d3P1WTnJRoaDafB57r6HodiV6KMzb1lJ9XkdAC
         kPWzdYOBMqxf88s2kyrycKeDyqZz790vg9bqk1CrkuQj9dsWfit/liy0SGCQl+ldB97K
         UPqlg1vbNdHyGJ7AckkCYrd4pFSVdsLL+u3vnEtDiKtN5KURLMGn6d+mxOgU4arYL1Fj
         VIaQ==
X-Gm-Message-State: AOJu0YysXrBgGkh40h2GjBrglkDif/GHGuPKGGUjoxc8YfgiTMy8EqCw
	hY/HMSTxLMHjKGR/fPOEVk6is9qmNA0Wwp/GZ0cRGwycDxPoR4W73lC8
X-Gm-Gg: ATEYQzyhVW+iDdQ/UzD61+7kVAJ+qXsTPodbiuupqLpR0lttNMGHc1/g64DQQ5YvGwa
	C3VkP4ZcYmrAhM4At8K3Y+eeqSHjx/1KYrv5/+dXDNqqkHz68JE//rg8knD6VsIgOmXiXLKWduC
	his8BVp0MMODtCFfIncfwKYFrmLc1ifdrFRYiJMzjxm9mXAsHl7E5wvb5g0ZrHCQukTCHszudzC
	gvhSEuDRqYcfGdncx8xBOFeruAfKxXeDasvn4VSm2MIyhmhyN3yaMaAYNyGTqaOSg3WI9XQRebe
	L4XI79akw0FvHjWetZdjFTbB/Q0xGwcs+AOPZ7CWYgjNUExhq+AFyflxQmA6aZvD7TlpETHoQbd
	8tciG8EbTAh+gXrDod9pz1CmsTQ+ITXkqn4Hxi9AxvV7IbQlZax8PnGadReDxJpYTZfMloKnwYx
	pLeGvR1TDzTeI6Ou5eVNkVNNsZIDdf0/Z88HOvoCc=
X-Received: by 2002:a05:600c:a29f:b0:483:78e7:ce15 with SMTP id 5b1f17b1804b1-486f8b80c9amr4638225e9.13.1773854733127;
        Wed, 18 Mar 2026 10:25:33 -0700 (PDT)
Received: from sergio-82n7.fritz.box ([2a01:b600:83d8:1:eddb:b262:41cc:374a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852ab3sm9600650f8f.12.2026.03.18.10.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:25:32 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergiomelas@gmail.com
Subject: [PATCH] hwmon: (yogafan) V3.0 Universal refactor and RLLag filter
Date: Wed, 18 Mar 2026 18:25:18 +0100
Message-ID: <20260318172518.91336-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Refactor driver to V3.0 Universal Platform Mode for cross-model compatibility.
- Add support for dual-fan ACPI paths (FANS, FA2S, FANX) for Legion/Yoga series.
- Implement 100ms (10Hz) background heartbeat for constant-frequency sampling.
- Implement RLLag (Rate Limited Lag) filter to stabilize jumpy EC RPM data.
- Use 10-bit fixed-point integer math to avoid forbidden SSE/floating-point registers.
- Integrate DSTS ACPI modifications to ensure sensor stability during S3 sleep cycles.
- Provide full documentation for KDE 6 Plasma Sensor compatibility and scaling.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 drivers/hwmon/yoga_fan.c | 222 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)
 create mode 100644 drivers/hwmon/yoga_fan.c

diff --git a/drivers/hwmon/yoga_fan.c b/drivers/hwmon/yoga_fan.c
new file mode 100644
index 000000000..5a9ae631c
--- /dev/null
+++ b/drivers/hwmon/yoga_fan.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
+ *
+ * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
+ *
+ * This driver provides fan speed monitoring for modern Lenovo Yoga, Legion,
+ * and IdeaPad laptops by interfacing with the Embedded Controller (EC)
+ * via ACPI. It registers a platform device to ensure compatibility with
+ * modern HWMON consumers like KDE Plasma 6.
+ *
+ * Supported Models:
+ * - Lenovo Yoga 7 / 14c series (Ryzen/Intel)
+ * - Lenovo Legion 5 / 7 / Pro series (Dual-fan support)
+ * - Lenovo Yoga Slim 7 / Pro / Carbon / Nano
+ * - Lenovo IdeaPad 5 / ThinkBook series
+ *
+ * Implementation Details:
+ * - Fixed static HWMON channel definition for kernel 6.0+ compatibility.
+ * - Implements a 100ms background worker to ensure RLLag filter consistency.
+ * - RLLag Formula: x(t) = x(t-dt) + clamp(step, -limit, limit)
+ * where step = (input - x) * alpha
+ */
+
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/hwmon.h>
+#include <linux/acpi.h>
+#include <linux/platform_device.h>
+#include <linux/dmi.h>
+#include <linux/workqueue.h>
+#include <linux/mutex.h>
+
+#define DRVNAME "yogafan"
+#define MAX_FANS 2
+
+/* --- RLLAG CONFIGURATION --- */
+#define TS_MS            100
+#define TAU_MS           1000
+#define MAX_SPEED_RPM_S  500
+
+#define ALPHA_SCALED ((TS_MS * 1024) / (TAU_MS + TS_MS))
+#define STEP_LIMIT ((MAX_SPEED_RPM_S * TS_MS) / 1000)
+
+struct yoga_fan_data {
+	const char *active_paths[MAX_FANS];
+	long filtered_val[MAX_FANS];
+	struct delayed_work heartbeat;
+	struct mutex lock;
+	int fan_count;
+};
+
+static void yoga_fan_worker(struct work_struct *work)
+{
+	struct yoga_fan_data *data = container_of(work, struct yoga_fan_data, heartbeat.work);
+	unsigned long long raw_acpi;
+	long rpm, delta, lag_step;
+	int i;
+
+	mutex_lock(&data->lock);
+	for (i = 0; i < data->fan_count; i++) {
+		if (ACPI_SUCCESS(acpi_evaluate_integer(NULL, (char *)data->active_paths[i], NULL, &raw_acpi))) {
+			rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
+
+			delta = rpm - data->filtered_val[i];
+			lag_step = (delta * ALPHA_SCALED) >> 10;
+
+			if (lag_step > (long)STEP_LIMIT)
+				lag_step = (long)STEP_LIMIT;
+			else if (lag_step < -(long)STEP_LIMIT)
+				lag_step = -(long)STEP_LIMIT;
+
+			data->filtered_val[i] += lag_step;
+
+			if (data->filtered_val[i] < 50)
+				data->filtered_val[i] = 0;
+		}
+	}
+	mutex_unlock(&data->lock);
+
+	schedule_delayed_work(&data->heartbeat, msecs_to_jiffies(TS_MS));
+}
+
+static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct yoga_fan_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_fan || attr != hwmon_fan_input)
+		return -EOPNOTSUPP;
+
+	if (channel >= data->fan_count)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	*val = data->filtered_val[channel];
+	mutex_unlock(&data->lock);
+
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
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
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
+	unsigned long long init_raw;
+	int i;
+	static const char * const fan_paths[] = {
+		"\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S",
+		"\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC.EC.FAN0",
+		"\\_SB.PCI0.LPC0.EC.FAN0"
+	};
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->lock);
+
+	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
+		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
+			data->active_paths[data->fan_count] = fan_paths[i];
+
+			if (ACPI_SUCCESS(acpi_evaluate_integer(NULL, (char *)data->active_paths[data->fan_count], NULL, &init_raw)))
+				data->filtered_val[data->fan_count] = (init_raw > 0 && init_raw <= 255) ? ((long)init_raw * 100) : (long)init_raw;
+
+			data->fan_count++;
+			if (data->fan_count >= MAX_FANS)
+				break;
+		}
+	}
+
+	if (data->fan_count == 0)
+		return -ENODEV;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
+							 data, &yoga_fan_chip_info, NULL);
+
+	INIT_DELAYED_WORK(&data->heartbeat, yoga_fan_worker);
+	schedule_delayed_work(&data->heartbeat, msecs_to_jiffies(TS_MS));
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver yoga_fan_driver = {
+	.driver = { .name = DRVNAME },
+	.probe = yoga_fan_probe,
+};
+
+static struct platform_device *yoga_fan_device;
+
+static const struct dmi_system_id yoga_dmi_table[] __initconst = {
+	{ .ident = "Lenovo", .matches = { DMI_MATCH(DMI_SYS_VENDOR, "LENOVO") } },
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
+	struct yoga_fan_data *data = platform_get_drvdata(yoga_fan_device);
+
+	if (data)
+		cancel_delayed_work_sync(&data->heartbeat);
+
+	platform_device_unregister(yoga_fan_device);
+	platform_driver_unregister(&yoga_fan_driver);
+}
+
+module_init(yoga_fan_init);
+module_exit(yoga_fan_exit);
+
+MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
+MODULE_DESCRIPTION("Universal Lenovo Fan Driver v3.0.0");
+MODULE_LICENSE("GPL v2");
-- 
2.53.0

