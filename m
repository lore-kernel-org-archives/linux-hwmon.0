Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD3234973
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Oct 2026 04:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791605648; cv=none; b=NIkFIJBr2zCWosWnofK769Yj/nM1fvaxp6dVa8zL3cF4yzUvBJNcbEbLTJMxHDwBe8SEZ0wbARdr/7sFMb4MZ5CCi1u/JdpFz0ze+kGAiol1TK2R42bH1SB7ux6ECaho79M9jLsmwEb/hTIEHxb3h/sOdai0BlHmZGjAzAYqIHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791605648; c=relaxed/simple;
	bh=JnVvdMfpBPPUr5tVd75daKFqhtnA/9EVpACfnPpUU7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLXohYbh3XpJutkIO/QSjpQNvV0VXw579GcQbLjwWm2w+/2wQ9lsHYyjizlIewlHtPeBhVONP2KW3dzf1LBKegJtkbkseB9np4sZoalnZSYNDPbzTjSXFrsn7lb9yXj4ZlBiwgpJIV9CNSSqrpPdZZX4wZn0+bcB9tP0aSIpUao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAzdrHiX; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAzdrHiX"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so697469eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Oct 2026 21:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791605646; x=1792210446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U29RvRLHyGcXDwNGcPQ+8ouOOS53sOjL9OYSY+u0Obk=;
        b=LAzdrHiXIyOAkrKrSCY1lQ3GkcPXGkKBeDLEqv44q49fZ3Xxz1RjdmCcPFbMK6DEzY
         WkQ1+s5/kk9Wd544wp/VX6MxLOOmDX4qeVsJam5P1EHTR/0clX5HjEFeuLueaDRwGGZF
         DqdyK9aQPrjZZ2u0+4wLxWB2o4RsUbN1sgWAfJOtNYkQJqac1tKTM0n8TM54htFswTJ6
         +Dkwm1GpMAtOVDAXrSX9qQ3/Lc3PtS0FJrQvF2C7VNHAyKqghQsm5QGnrNC0mT8Y/OCJ
         W5DgBOwpX8cxW2i4rP2VXNrOMWbJOZ/Rk1MQm8xt2PQY1JRC4Pjp0kXavHY2FuL7fSYE
         B4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791605646; x=1792210446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U29RvRLHyGcXDwNGcPQ+8ouOOS53sOjL9OYSY+u0Obk=;
        b=sSmBIfevoOqspfZdAkvPO5JN2k/xYk+87vnplZU5wL8lv1UBvfr2kbeQ/cv6smKaum
         pglBTBR1q7xwT/fs8xchTGLJ7NhLL5lTkiExnksyQkAFzsMFV8GuEx0jb97CjkODovOx
         gSVpzFsg46Omn1RN//iWWFMxeJIMGWKp6KMlAssdGXegPuvRUkphCpc4hPNdOvWPSr1j
         6ocPST7VjFc/QBYBKTVWiLCAxWSc3Rp515Qtk8stZwsY+EJTyK3Cr2IR9mzYSnV9kNrK
         WjiilovjpJyiNegucL2RY9OBc1vJFbMPyxzJt4zM51abVariWqQ+lBoSGcQin4+lsIpP
         zLtA==
X-Forwarded-Encrypted: i=1; AKwUvBzcjNsdyff5FX/7cIyAZj7u/aA2KamvjFzfdoXfkCyaAKgKbf2vNu1E9PTr6TVuBWi9Dv9BAbyItVCHlw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/F5xsw89FjgGjQYd8zkpxj2KD1WcZ1Epl01rKsAoZQFWwxnEW
	UQkgaVTAksOjcLalOAyjPA/H1TQYTIUStYAj2IDBtB28glFf9g3pI3Xw
X-Gm-Gg: AYBFou1U8v2qnp4UrU+09a0/6XluV4o57rUhYWsU8ttpv8B0OB+uvTKophDVqh8JchS
	WfPepco+ZTtxuYHEvGhbJ59WmsnFJJX6r1ELmtZR+YOG+VtzBFAZLzqiQSBZZucXzmiLySW6Epi
	lsg2wGbGhp8D1UZEr2RgsTsef8fla6z19mjIKlcIG1Jc/kVrh1MMLko6UuVAwf7zEy2dSBfFNlL
	WLVT/m6nPsPCt5QDICZpzKoeI/Y/c/Xl+xDbrS57kMiydMdb+9vrGkUOCe60ONCMZSCA8WtTmbm
	XWjFceBgGN2MkUaOOe157sKKFXivMNWIjn121XTdZZ6SEMyjwtC2PsGVwvuu94/teTACDjwg8Vu
	3y4QaEtYco6LPr7rxkic9F+bUqa05Qn8aZ6ofZlzt2nEwHC0lgWMXw9TBa5eSv8YYBVItDzao6m
	qxjVY3QNuarPoqbz/tdvypU20yjJw7etVOJ8Z3V9kOXtTAqIuFnmAwvM+yP41of01wFU/mpZBiL
	bU1WeNJpKnZ8uI8ENBoiaWZ8/YVGybxC9iCDy38RkkRYMYmIxMEVPvT0Mbz8UmS
X-Received: by 2002:a05:7300:828a:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3537dedaa87mr5045346eec.4.1791605645612;
        Fri, 09 Oct 2026 21:14:05 -0700 (PDT)
Received: from seppy ([2600:8800:206:8e00::5a4f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm10649471eec.11.2026.10.09.21.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:14:05 -0700 (PDT)
From: Ethan Jimmy <duhxu0@gmail.com>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ethan Jimmy <duhxu0@gmail.com>
Subject: [PATCH] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire 14 52MT and 52M fan
Date: Fri,  9 Oct 2026 21:13:13 -0700
Message-ID: <20261010041313.34153-1-duhxu0@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Aspire A14-52M and A14-52MT expose fan speed through an I2C HID
embedded controller that also serves the keyboard. The same product id
is used by other Acer keyboards, so the driver binds only when DMI
matches these two models.

Signed-off-by: Ethan Jimmy <duhxu0@gmail.com>
---
 Documentation/hwmon/acer-aspire14-ec.rst |  38 ++++
 Documentation/hwmon/index.rst            |   1 +
 MAINTAINERS                              |   8 +
 drivers/hwmon/Kconfig                    |  20 ++
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/acer-aspire14-ec.c         | 270 +++++++++++++++++++++++
 6 files changed, 338 insertions(+)
 create mode 100644 Documentation/hwmon/acer-aspire14-ec.rst
 create mode 100644 drivers/hwmon/acer-aspire14-ec.c

diff --git a/Documentation/hwmon/acer-aspire14-ec.rst b/Documentation/hwmon/acer-aspire14-ec.rst
new file mode 100644
index 000000000000..73acfb181c39
--- /dev/null
+++ b/Documentation/hwmon/acer-aspire14-ec.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver acer-aspire14-ec
+==============================
+
+Supported chips:
+
+  * Acer Aspire 14 AI 52MT/52M embedded controller
+
+    Prefix: 'aspire14_ec'
+
+    Addresses scanned: none
+
+    Datasheet: unavailable
+
+Author: Ethan Jimmy <duhxu0@gmail.com>
+
+Description
+-----------
+
+This driver monitors the fan on the Acer Aspire 14 AI (Aspire A14-52M
+and A14-52MT). The embedded controller is an I2C HID device (vendor
+0x1025, product 0x174b) that also provides the keyboard.
+
+The device is autodetected on those models. The same product id is used
+by other Acer keyboards; those machines stay with hid-generic. On the
+Aspire A14-52M and A14-52MT this driver provides both the keyboard and
+the fan sensor.
+
+Fan speed is reported in RPM through the standard hwmon attribute
+``fan1_input``. The driver does not change fan speed.
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+fan1_input		Fan speed in RPM
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..9dd16e6ddabd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -22,6 +22,7 @@ Hardware Monitoring Kernel Drivers
    abituguru
    abituguru3
    acbel-fsg032
+   acer-aspire14-ec
    acpi_power_meter
    ad7314
    adc128d818
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ad12c57ca5f..b944f77c7a71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,6 +262,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-pcie-idio-24.c
 
+ACER ASPIRE 14 AI (A14-52M, A14-52MT) EC FAN DRIVER
+M:	Ethan Jimmy <duhxu0@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/acer-aspire14-ec.rst
+F:	drivers/hwmon/acer-aspire14-ec.c
+
 ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
 M:	Peter Kaestle <peter@piie.net>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..84e9e9c115a1 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -67,6 +67,26 @@ config SENSORS_ABITUGURU3
 	  This driver can also be built as a module. If so, the module
 	  will be called abituguru3.
 
+config SENSORS_ACER_ASPIRE14_EC
+	tristate "Acer Aspire 14 AI EC fan sensor"
+	depends on HID
+	depends on X86 || COMPILE_TEST
+	depends on DMI || COMPILE_TEST
+	depends on I2C_HID_ACPI || I2C_HID_OF || COMPILE_TEST
+	help
+	  If you say yes here you get support for reading the fan
+	  speed from the embedded controller on the Acer Aspire 14 AI
+	  (Aspire A14-52M and A14-52MT). The controller is an I2C HID
+	  device (vendor 0x1025, product 0x174b) that also provides the
+	  keyboard. Fan speed is read-only.
+
+	  The same product id is used by other Acer keyboards. This driver
+	  registers only on the Aspire A14-52M and A14-52MT, where it also
+	  provides the keyboard. Other machines stay with hid-generic.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called acer-aspire14-ec.
+
 config SENSORS_SMPRO
 	tristate "Ampere's Altra SMpro hardware monitoring driver"
 	depends on MFD_SMPRO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..ac5cec462c81 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
 
 obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
 obj-$(CONFIG_SENSORS_ABITUGURU3)+= abituguru3.o
+obj-$(CONFIG_SENSORS_ACER_ASPIRE14_EC) += acer-aspire14-ec.o
 obj-$(CONFIG_SENSORS_AD7314)	+= ad7314.o
 obj-$(CONFIG_SENSORS_AD7414)	+= ad7414.o
 obj-$(CONFIG_SENSORS_AD7418)	+= ad7418.o
diff --git a/drivers/hwmon/acer-aspire14-ec.c b/drivers/hwmon/acer-aspire14-ec.c
new file mode 100644
index 000000000000..9d100f2a0b80
--- /dev/null
+++ b/drivers/hwmon/acer-aspire14-ec.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hwmon driver for the Acer Aspire 14 AI embedded controller.
+ *
+ * Author: Ethan Jimmy <duhxu0@gmail.com>
+ *
+ * On the Aspire A14-52M and A14-52MT the EC is an I2C HID device
+ * (vendor 0x1025, product 0x174b) that also serves the keyboard. The same
+ * product id is used by other Acer keyboards. The HID driver is registered
+ * only when DMI matches these models, so those machines stay with hid-generic.
+ * 
+ * Fan speed is read with one feature report: A0 00 A0 08 00 02 02. The
+ * reply carries a little-endian status word, command id, and RPM.
+ */
+
+#include <linux/dmi.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#define ACER_ASPIRE14_VID		0x1025
+#define ACER_ASPIRE14_PID		0x174b
+#define ACER_ASPIRE14_REPORT_ID		0xa0
+#define ACER_ASPIRE14_PREFIX		0xa0
+#define ACER_ASPIRE14_CMD_MARK		0x02
+#define ACER_ASPIRE14_RPM_OFFSET	8
+#define ACER_ASPIRE14_MIN_REPLY		(ACER_ASPIRE14_RPM_OFFSET + sizeof(u16))
+#define ACER_ASPIRE14_STATUS_OK		0xe000
+#define ACER_ASPIRE14_CMD_FAN_RPM	0x0008
+
+struct acer_aspire14_data {
+	struct hid_device *hdev;
+	struct device *hwmon_dev;
+	struct mutex lock; /* protects buf across feature report I/O */
+	u8 *buf;
+	u32 report_len;
+};
+
+static int acer_aspire14_fan_rpm(struct acer_aspire14_data *data, long *val)
+{
+	u16 status, command_id;
+	int ret;
+
+	mutex_lock(&data->lock);
+
+	memset(data->buf, 0, data->report_len);
+	data->buf[0] = ACER_ASPIRE14_REPORT_ID;
+	data->buf[2] = ACER_ASPIRE14_PREFIX;
+	put_unaligned_le16(ACER_ASPIRE14_CMD_FAN_RPM, &data->buf[3]);
+	data->buf[5] = ACER_ASPIRE14_CMD_MARK;
+	data->buf[6] = ACER_ASPIRE14_CMD_MARK;
+
+	ret = hid_hw_raw_request(data->hdev, ACER_ASPIRE14_REPORT_ID,
+				 data->buf, data->report_len,
+				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret < 0)
+		goto unlock;
+	if (!ret) {
+		ret = -EIO;
+		goto unlock;
+	}
+
+	memset(data->buf, 0, data->report_len);
+	data->buf[0] = ACER_ASPIRE14_REPORT_ID;
+	ret = hid_hw_raw_request(data->hdev, ACER_ASPIRE14_REPORT_ID,
+				 data->buf, data->report_len,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret < 0)
+		goto unlock;
+	if (ret < ACER_ASPIRE14_MIN_REPLY) {
+		ret = -EIO;
+		goto unlock;
+	}
+
+	status = get_unaligned_le16(&data->buf[1]);
+	command_id = get_unaligned_le16(&data->buf[3]);
+	if (status != ACER_ASPIRE14_STATUS_OK ||
+	    command_id != ACER_ASPIRE14_CMD_FAN_RPM) {
+		ret = -EIO;
+		goto unlock;
+	}
+
+	*val = get_unaligned_le16(&data->buf[ACER_ASPIRE14_RPM_OFFSET]);
+	ret = 0;
+
+unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int acer_aspire14_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct acer_aspire14_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_fan || attr != hwmon_fan_input || channel != 0)
+		return -EOPNOTSUPP;
+
+	return acer_aspire14_fan_rpm(data, val);
+}
+
+static umode_t acer_aspire14_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	if (type == hwmon_fan && attr == hwmon_fan_input && channel == 0)
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *const acer_aspire14_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops acer_aspire14_ops = {
+	.is_visible = acer_aspire14_is_visible,
+	.read = acer_aspire14_read,
+};
+
+static const struct hwmon_chip_info acer_aspire14_chip_info = {
+	.ops = &acer_aspire14_ops,
+	.info = acer_aspire14_info,
+};
+
+static const struct dmi_system_id acer_aspire14_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire A14-52M"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire A14-52MT"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, acer_aspire14_dmi_table);
+
+static u32 acer_aspire14_fan_report_len(struct hid_device *hdev)
+{
+	struct hid_report *report;
+	u32 len;
+
+	report = hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[ACER_ASPIRE14_REPORT_ID];
+	if (!report)
+		return 0;
+
+	len = hid_report_len(report);
+	if (len < ACER_ASPIRE14_MIN_REPLY || len > HID_MAX_BUFFER_SIZE)
+		return 0;
+
+	return len;
+}
+
+static int acer_aspire14_probe(struct hid_device *hdev,
+			       const struct hid_device_id *id)
+{
+	struct acer_aspire14_data *data;
+	struct device *hwmon_dev;
+	long rpm;
+	u32 report_len;
+	int ret;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | HID_CONNECT_DRIVER);
+	if (ret)
+		return ret;
+
+	report_len = acer_aspire14_fan_report_len(hdev);
+	if (!report_len)
+		return 0;
+
+	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return 0;
+
+	data->buf = devm_kzalloc(&hdev->dev, report_len, GFP_KERNEL);
+	if (!data->buf)
+		return 0;
+	data->report_len = report_len;
+
+	ret = devm_mutex_init(&hdev->dev, &data->lock);
+	if (ret) {
+		hid_warn(hdev, "failed to init mutex: %d\n", ret);
+		return 0;
+	}
+
+	data->hdev = hdev;
+	hid_set_drvdata(hdev, data);
+
+	ret = acer_aspire14_fan_rpm(data, &rpm);
+	if (ret)
+		hid_dbg(hdev, "fan report failed: %d\n", ret);
+	else
+		hid_dbg(hdev, "initial fan speed %ld RPM\n", rpm);
+
+	hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "aspire14_ec",
+						    data, &acer_aspire14_chip_info,
+						    NULL);
+	if (IS_ERR(hwmon_dev)) {
+		hid_warn(hdev, "failed to register hwmon: %pe\n", hwmon_dev);
+		return 0;
+	}
+	data->hwmon_dev = hwmon_dev;
+
+	return 0;
+}
+
+static void acer_aspire14_remove(struct hid_device *hdev)
+{
+	struct acer_aspire14_data *data = hid_get_drvdata(hdev);
+
+	if (data && data->hwmon_dev)
+		hwmon_device_unregister(data->hwmon_dev);
+	hid_hw_stop(hdev);
+}
+
+static int acer_aspire14_reset_resume(struct hid_device *hdev)
+{
+	if (hdev->claimed & HID_CLAIMED_INPUT)
+		hidinput_reset_resume(hdev);
+
+	return 0;
+}
+
+static const struct hid_device_id acer_aspire14_id_table[] = {
+	{ HID_I2C_DEVICE(ACER_ASPIRE14_VID, ACER_ASPIRE14_PID) },
+	{ }
+};
+
+static struct hid_driver acer_aspire14_driver = {
+	.name = "acer-aspire14-ec",
+	.id_table = acer_aspire14_id_table,
+	.probe = acer_aspire14_probe,
+	.remove = acer_aspire14_remove,
+	.reset_resume = acer_aspire14_reset_resume,
+};
+
+static int __init acer_aspire14_init(void)
+{
+	if (!dmi_check_system(acer_aspire14_dmi_table))
+		return -ENODEV;
+
+	return hid_register_driver(&acer_aspire14_driver);
+}
+
+static void __exit acer_aspire14_exit(void)
+{
+	hid_unregister_driver(&acer_aspire14_driver);
+}
+
+module_init(acer_aspire14_init);
+module_exit(acer_aspire14_exit);
+
+MODULE_AUTHOR("Ethan Jimmy <duhxu0@gmail.com>");
+MODULE_DESCRIPTION("Acer Aspire 14 AI EC fan driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0

