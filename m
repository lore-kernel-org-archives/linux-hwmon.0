Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBE42E8C1
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612463; cv=none; b=f9dgFWDju9PfdV3Ob99WrSIqEvlXW4m1xXnSPt2qiy5quq2gbZNvhzlyYLT+QxYKCSNkofBjMzcRo3xDmnXkRsh2wAzcW1bLnNGNA3O3GduP7exlZIufGfDPPxns8rx4edTp91pJnjP/lq9Kxk77mr0pQL/rpyjY5hbAJMBusKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612463; c=relaxed/simple;
	bh=eTxYr7/2XsqiLDOP+IV1sr/jtIbiCrXnNgl17wlllwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyPnnXsOTbFRr/KEuhfpkAZBYMpWydQfYfEYZ5N65Ish8UecvrjMLKqn7FDXGQU7g1NtXERvdhbR20Z5nmUNRGU9T9rPQyc4eE0tRH8JaxKAiERmqUEIw8SUldoocUoa6yNFm0ZGu440SyTofNsISGXDGgSNsfoyGlhQVj3gWNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVweQqsl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVweQqsl"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b00d083818so725911e87.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786612459; x=1787217259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kibDlYaW2eoOH72N4rPk6CUa5B6hNZkx+E4GjRXceJA=;
        b=mVweQqslVaLzBZ5X8jYsU9/58k95j5O2zGOd8d4fzx99Tahwt6tnNQazupfj6woIaK
         P3ncWzavUQAXPkzUquVNGTjf/dmS/ilkq++dFvdlMgoOigKvYOPzBlAIIRCbxtxSTqM7
         b7Szd5lwRNZFPtggjG8Jw/oDsGWD0kNdQtrWLgc9CUzWNA5BTIXQvOtnG1d8jQACFCeO
         IKX84PBYjbAbtQAakXylTzSJvVcuINUC/lmxi5IymCU6i7iSJP3C+552G8QJTf0fqdLl
         bhhAGhAI3LvTl2bBEPDU3Mmk5g4xjT1AI3adxLOKs3FgkiL6zIDGrxnhc6gx4sdNTGz9
         N/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786612459; x=1787217259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kibDlYaW2eoOH72N4rPk6CUa5B6hNZkx+E4GjRXceJA=;
        b=D/09Oavjq8YbmhRzKy+JiquzIs97EqvqJh3RI1byhxGaHhpDfGy1qsA6A+mCEcstGC
         s2+asFXqo+i9yg1Vw6PKG+3VeFZAptEIwraN2aTj9emVQRfx+ArgStbjD1ZopxnvCrnl
         2D/e+EaABtjgHd/i8N5cCDZZsPoy3lyuE7XAKTEMpACfbwXM7xIJQ3ne3gv2TEm7maL6
         laSAsH9JQvSA7oRI52gRnzd/gFJ1GpU5YikPLoEWm/uzttkzuq1Y+eQy0x7Cqi9Rp51z
         QgjXalioejNTLxP/U9wWI6IxEAjLlgcjjZ0dGeD8M+EIbaFF7Mc0dlSe1QDK6DfWpBbm
         awJA==
X-Forwarded-Encrypted: i=1; AHgh+RouJTfR3VPeixMowbafD9GqJJZEbGnsRVkPJUjtcxr0qZEh6h+K7OkNp+HrdcCPeOmLu1lTXwDPxZyV0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDRMoJWdr3WeO2j0p97q+/SueT9jpM1A/YxOoHk7T0d2tanaW
	FOhxSCrmIqzVspmRSo/j0pjTrwXwGuawqrlgmpNpp+gQIS9T8IQgaAP+vVMawuNeIf4=
X-Gm-Gg: AR+sD11eADwlixIRe7jysFmza4sRFHIH3kJEPqHbg7nvnIDs8Ew3WXpVPfcSWiaAozk
	ae8qBKxam7K3Ss5Jk3y2vaytZi2Q3WuG/c6tlVrovAXasn8eEM0/X53b05hO0dzNp/ZbuOl2RkL
	m4cSoS2+gunCzAVITbz+wqnPQGgCBy7UgkQYhBeZxEebJZrS6s2rxIdYJzMygAUhT301Mkv+5kV
	2T8zpNOUYC4ntdBJBxU6QJmnxZJLrS5yA08ZvPed1f45sNN2eyi6ZJY9hfS00ixCXeePdozZhSa
	PX5Fpu/vXHHIhiF3rZkZmr2+0IG28GxdxeD4hu4cZm3W/K9tanDacpD31I4i/beXDm2xaZprah0
	txQVryMi0kHZBqWnBNj+PNEmsz68Ggh0D/obKtf+pGpf2/aaZArii1hglC0Z6wOV/ZB3rYcdDFE
	Gf3kXbtY2AbTBgcNxd1rhSXfFSkpgs0f/4cpiv0mHGjSpZajz6fAvIs1bSXytyiY9htaHRgI7mR
	8hyLiBS
X-Received: by 2002:ac2:5458:0:b0:5aa:62df:cd0f with SMTP id 2adb3069b0e04-5b453f474dfmr590881e87.2.1786612458867;
        Thu, 13 Aug 2026 02:14:18 -0700 (PDT)
Received: from jaennil-honor.localdomain ([173.233.147.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a548besm342679e87.42.2026.08.13.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:14:17 -0700 (PDT)
From: Nikita Dubrovskih <testname142@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Dubrovskih <testname142@gmail.com>
Subject: [RFC PATCH v2] hwmon: Add fan monitoring support for HONOR FMI-XX
Date: Thu, 13 Aug 2026 12:14:11 +0300
Message-ID: <20260813091411.1186193-1-testname142@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812192242.859307-1-testname142@gmail.com>
References: <20260812192242.859307-1-testname142@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
It returns a status byte and a 16-bit fan speed in RPM for either of two
firmware channels.

Add a DMI-restricted, read-only hwmon driver using that firmware
interface. The driver deliberately exposes no fan control or direct
Embedded Controller access.

The interface was validated on firmware 1.09 with fan channel 0
reporting approximately 2500-2800 RPM. Channel 1 is readable and
remained at 0 RPM during idle and a short CPU load.

Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>
---
Changes in v2:
- Drop the redundant mutex and callback argument validation.
- Remove unused platform drvdata and simplify the init error path.
- Align the macro definition and order the MAINTAINERS entry.

 Documentation/hwmon/honor-fmi.rst |  32 ++++++
 Documentation/hwmon/index.rst     |   1 +
 MAINTAINERS                       |   7 ++
 drivers/hwmon/Kconfig             |  10 ++
 drivers/hwmon/Makefile            |   1 +
 drivers/hwmon/honor-fmi.c         | 178 ++++++++++++++++++++++++++++++
 6 files changed, 229 insertions(+)
 create mode 100644 Documentation/hwmon/honor-fmi.rst
 create mode 100644 drivers/hwmon/honor-fmi.c

diff --git a/Documentation/hwmon/honor-fmi.rst b/Documentation/hwmon/honor-fmi.rst
new file mode 100644
index 0000000..a42a1dd
--- /dev/null
+++ b/Documentation/hwmon/honor-fmi.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver honor-fmi
+=======================
+
+Supported systems:
+
+  * HONOR FMI-XX
+
+Author: Nikita Dubrovskih <testname142@gmail.com>
+
+Description
+-----------
+
+The driver provides read-only monitoring of the fan speed on the HONOR FMI-XX.
+The system firmware implements a ``GFNS`` ACPI method which returns the speed
+of one of two firmware fan channels in RPM. Embedded Controller access and
+serialization are handled by the firmware method.
+
+The driver does not expose fan control or direct Embedded Controller access.
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+======================= ======= =============================================
+Name                    Perm    Description
+======================= ======= =============================================
+``fan1_input``          RO      Fan channel 0 speed in RPM
+``fan2_input``          RO      Fan channel 1 speed in RPM
+======================= ======= =============================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 29130df..91052fa 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -90,6 +90,7 @@ Hardware Monitoring Kernel Drivers
    gxp-fan-ctrl
    hac300s
    hih6130
+   honor-fmi
    hp-wmi-sensors
    hs3001
    htu31
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f..7f2e3f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11876,6 +11876,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
 F:	drivers/iio/pressure/mprls0025pa*
 
+HONOR FMI-XX HARDWARE MONITOR DRIVER
+M:	Nikita Dubrovskih <testname142@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/honor-fmi.rst
+F:	drivers/hwmon/honor-fmi.c
+
 HP BIOSCFG DRIVER
 M:	Jorge Lopez <jorge.lopez2@hp.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc0..8a11a30 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2785,6 +2785,16 @@ config SENSORS_ASUS_EC
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_ec_sensors.
 
+config SENSORS_HONOR_FMI
+	tristate "HONOR FMI-XX fan monitor"
+	depends on X86
+	help
+	  If you say yes here, you get support for fan speed monitoring on
+	  the HONOR FMI-XX laptop through its firmware ACPI method.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called honor-fmi.
+
 config SENSORS_HP_WMI
 	tristate "HP WMI Sensors"
 	depends on ACPI_WMI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63effc0..e098793 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
 obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
 obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
 obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
+obj-$(CONFIG_SENSORS_HONOR_FMI)	+= honor-fmi.o
 obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
 
 # Native drivers
diff --git a/drivers/hwmon/honor-fmi.c b/drivers/hwmon/honor-fmi.c
new file mode 100644
index 0000000..3421e40
--- /dev/null
+++ b/drivers/hwmon/honor-fmi.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Read-only fan monitoring for the HONOR FMI-XX.
+ *
+ * The firmware-provided \GFNS ACPI method accepts a three-byte buffer.
+ * Byte 2 selects fan 0 or 1. It returns a status byte followed by a
+ * little-endian 16-bit fan speed in RPM. The method owns all Embedded
+ * Controller access and serialization; this driver deliberately exposes no
+ * fan control interface.
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define HONOR_FMI_GFNS_RESULT_SIZE	3
+
+struct honor_fmi_data {
+	acpi_handle gfns;
+};
+
+static const struct dmi_system_id honor_fmi_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HONOR"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FMI-XX"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, honor_fmi_dmi_table);
+
+static int honor_fmi_read_rpm(struct honor_fmi_data *data, int channel,
+			      long *rpm)
+{
+	union acpi_object input = {
+		.buffer = {
+			.type = ACPI_TYPE_BUFFER,
+			.length = 3,
+		},
+	};
+	struct acpi_object_list arguments = {
+		.count = 1,
+		.pointer = &input,
+	};
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *result;
+	u8 input_bytes[3] = { 0, 0, channel };
+	acpi_status status;
+	int ret = 0;
+
+	input.buffer.pointer = input_bytes;
+
+	status = acpi_evaluate_object(data->gfns, NULL, &arguments, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	result = output.pointer;
+	if (!result || result->type != ACPI_TYPE_BUFFER ||
+	    result->buffer.length < HONOR_FMI_GFNS_RESULT_SIZE) {
+		ret = -EPROTO;
+		goto out_free;
+	}
+
+	if (result->buffer.pointer[0]) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	*rpm = result->buffer.pointer[1] |
+	       (result->buffer.pointer[2] << 8);
+
+out_free:
+	kfree(output.pointer);
+	return ret;
+}
+
+static umode_t honor_fmi_is_visible(const void *data,
+				    enum hwmon_sensor_types type, u32 attr,
+				    int channel)
+{
+	return 0444;
+}
+
+static int honor_fmi_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *value)
+{
+	struct honor_fmi_data *data = dev_get_drvdata(dev);
+
+	return honor_fmi_read_rpm(data, channel, value);
+}
+
+static const struct hwmon_ops honor_fmi_hwmon_ops = {
+	.is_visible = honor_fmi_is_visible,
+	.read = honor_fmi_read,
+};
+
+static const struct hwmon_channel_info * const honor_fmi_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info honor_fmi_chip_info = {
+	.ops = &honor_fmi_hwmon_ops,
+	.info = honor_fmi_hwmon_info,
+};
+
+static int honor_fmi_probe(struct platform_device *pdev)
+{
+	struct honor_fmi_data *data;
+	struct device *hwmon_dev;
+	acpi_status status;
+
+	if (!dmi_check_system(honor_fmi_dmi_table))
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	status = acpi_get_handle(NULL, "\\GFNS", &data->gfns);
+	if (ACPI_FAILURE(status))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "firmware does not provide \\GFNS\n");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "honor_fmi",
+							 data,
+							 &honor_fmi_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver honor_fmi_driver = {
+	.probe = honor_fmi_probe,
+	.driver = {
+		.name = "honor-fmi-hwmon",
+	},
+};
+
+static struct platform_device *honor_fmi_device;
+
+static int __init honor_fmi_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(honor_fmi_dmi_table))
+		return -ENODEV;
+
+	ret = platform_driver_register(&honor_fmi_driver);
+	if (ret)
+		return ret;
+
+	honor_fmi_device = platform_device_register_simple("honor-fmi-hwmon",
+							   PLATFORM_DEVID_NONE,
+							   NULL, 0);
+	if (IS_ERR(honor_fmi_device)) {
+		platform_driver_unregister(&honor_fmi_driver);
+		return PTR_ERR(honor_fmi_device);
+	}
+
+	return 0;
+}
+
+static void __exit honor_fmi_exit(void)
+{
+	platform_device_unregister(honor_fmi_device);
+	platform_driver_unregister(&honor_fmi_driver);
+}
+
+module_init(honor_fmi_init);
+module_exit(honor_fmi_exit);
+
+MODULE_AUTHOR("Nikita Dubrovskih <testname142@gmail.com>");
+MODULE_DESCRIPTION("HONOR FMI-XX fan speed monitor");
+MODULE_LICENSE("GPL");
-- 
2.55.0
