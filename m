Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610683A3E9F;
	Thu, 26 Mar 2026 19:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552974; cv=pass; b=NyLbdzI1i4dsIQrcs/IW24SCS6dSVYeR3DvVcBPi4Z20Wg7I/V+NH4XuCMzU4YfgZ/y9HZAQUxof3umTBvqt0jLfEiZPaWbh1m4eAWWeTtQoqkgF2zLoECllmaeizqAf/rGIqt1vbu8wUClAxVCVmqH8hVTJBHrnM/CZ4PHU2MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552974; c=relaxed/simple;
	bh=dGXH/4FGhXaixsvF3xJIyPFZcr8nQlHD5oIhgKk/fXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ti9Q4XACnqKCH8ObECMGMVuvT1GAwy5Y6CLRfgZ27GUnGMcqqjCpBYc8oTWj5gDBbLL6X7Q1p7LnI2FmHTX5BMJJ1noGsAwvooB1ImkbjSydCcDxFO5sALJWphmHlYDXGgnTdb+9CoRiLfsSL+yQ+cx+tj3BNROltjpp7YNYw6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Vff9tpT4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Vff9tpT4"
ARC-Seal: i=1; a=rsa-sha256; t=1774552956; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fneb1ui6m0f2SLxGY24TiCwkNNyIg45pXKUMXWGaErQ1WuvMTayD27bP6vj6SD4wrGX40oDhRomxbQLFm44bpHtePGz68M6Wy3Gl4/IIwcSclPL6XUayylGiipqg0zG6+A39+B39c/xTuTJvWCjvGwjDYSX2Ps26aJwymQuqyKk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774552956; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a047eY7JtglFt604o6sBwAdZjfVRTjwQGri385hCBT0=; 
	b=ZgMSFXc2fXOmwKhZgGKznyGJXdD3I5XbulIxcKuFaTkAey7aNiBeKd/+QF3IYQCa5SMa/lo2ynKJ6sq/HWotNjXc3NMiElfPyUTGJNQGLBoqXLbiqTBmBPTG+EfR6qHo/qv0pDr8SYCnhSprRh69m0hfuX+z9mZbasBFxA1FAEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774552956;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=a047eY7JtglFt604o6sBwAdZjfVRTjwQGri385hCBT0=;
	b=Vff9tpT4R5ps/PZtqBDJOJT4j9yKo/2ynacIlypIwd+V17T+InPWylkoPbUsVKu+
	HBSo7g+IyssmHG7FY/JeWGIULuWxk/u3XUWJLe9DkmsumYRhR0TxsvlQzHNF2RcYRIe
	ZJaYyynks+W4Z5ems8lmFS0mNcMl/HFgr2DTtqf9Q78rPyEIOKf6rZeI0mk2vb6YlOq
	uyr4Oz3OtarOjlTliGiLh9y75lQVScAbUdQn+KGoqadAtqVIlFzclPOrcI9k0gPJ5vE
	VXZBwrkRw9NFi0xFk4fERoBq281x31R8GT80KLvMLBi1POCa9jB8EzIW8//DMzQ/WJb
	e+2KKQfwnw==
Received: by mx.zohomail.com with SMTPS id 177455295434189.09367790827082;
	Thu, 26 Mar 2026 12:22:34 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 27 Mar 2026 03:19:52 +0800
Subject: [PATCH 3/4] hwmon: Add barebone HID driver for WITRN
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-b4-hwmon-witrn-v1-3-8d2f1896c045@rong.moe>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
In-Reply-To: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-ad80c
X-ZohoMailClient: External

WITRN produces a series of devices to monitor power characteristics of
USB connections and display those on a on-device display. Most of them
contain an additional port which exposes the measurements via USB HID.

Add a barebone HID driver to collect these measurements. The monitoring
support can be implemented later.

Developed and tested with WITRN K2 USB-C tester.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/hwmon/index.rst |   1 +
 Documentation/hwmon/witrn.rst |  23 ++++
 MAINTAINERS                   |   7 ++
 drivers/hwmon/Kconfig         |  10 ++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/witrn.c         | 268 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 310 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513cfcd..f1f2b599c76b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -276,6 +276,7 @@ Hardware Monitoring Kernel Drivers
    w83795
    w83l785ts
    w83l786ng
+   witrn
    wm831x
    wm8350
    xgene-hwmon
diff --git a/Documentation/hwmon/witrn.rst b/Documentation/hwmon/witrn.rst
new file mode 100644
index 000000000000..e64c527928d0
--- /dev/null
+++ b/Documentation/hwmon/witrn.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Kernel driver witrn
+====================
+
+Supported chips:
+
+  * WITRN K2
+
+    Prefix: 'witrn'
+
+    Addresses scanned: -
+
+Author:
+
+  - Rong Zhang <i@rong.moe>
+
+Description
+-----------
+
+This driver implements support for the WITRN USB tester family.
+
+The device communicates with the custom protocol over USB HID.
diff --git a/MAINTAINERS b/MAINTAINERS
index 0481aca2286c..18a1077d38e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28444,6 +28444,13 @@ M:	Miloslav Trmac <mitr@volny.cz>
 S:	Maintained
 F:	drivers/input/misc/wistron_btns.c
 
+WITRN USB TESTER HARDWARE MONITOR DRIVER
+M:	Rong Zhang <i@rong.moe>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/witrn.rst
+F:	drivers/hwmon/witrn.c
+
 WMI BINARY MOF DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
 R:	Thomas Weißschuh <linux@weissschuh.net>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7ad909033e79..746184608f81 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2629,6 +2629,16 @@ config SENSORS_W83627EHF
 	  This driver can also be built as a module. If so, the module
 	  will be called w83627ehf.
 
+config SENSORS_WITRN
+	tristate "WITRN USB tester"
+	depends on USB_HID
+	help
+	  If you say yes here you get support for WITRN USB charging
+	  testers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called witrn.
+
 config SENSORS_WM831X
 	tristate "WM831x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 6dba69f712be..f87eb1710974 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -243,6 +243,7 @@ obj-$(CONFIG_SENSORS_VT8231)	+= vt8231.o
 obj-$(CONFIG_SENSORS_W83627EHF)	+= w83627ehf.o
 obj-$(CONFIG_SENSORS_W83L785TS)	+= w83l785ts.o
 obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
+obj-$(CONFIG_SENSORS_WITRN)	+= witrn.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
diff --git a/drivers/hwmon/witrn.c b/drivers/hwmon/witrn.c
new file mode 100644
index 000000000000..e8713da6de5a
--- /dev/null
+++ b/drivers/hwmon/witrn.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * witrn - Driver for WITRN USB charging testers
+ *
+ * Copyright (C) 2026 Rong Zhang <i@rong.moe>
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/jiffies.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/units.h>
+#include <linux/workqueue.h>
+
+#define DRIVER_NAME		"witrn"
+#define WITRN_EP_CMD_OUT	0x01
+#define WITRN_EP_DATA_IN	0x81
+
+#define WITRN_REPORT_SZ		64
+
+/* flags */
+#define WITRN_HID_OPENED	0
+
+/*
+ * The device sends reports every 10ms (100Hz!) once it's opened, which is
+ * really annoying and produces a lot of irq noise.
+ *
+ * Unfortunately, the device doesn't provide any command to start/stop reporting
+ * on demand -- it simply spams reports blindly. The only way to stop reporting
+ * is to close the HID device (i.e., to stop IN URB (re)submission).
+ *
+ * Let's close the HID device if the device has not been accessed for a while.
+ */
+#define PAUSE_TIMEOUT		secs_to_jiffies(8)
+#define UP_TO_DATE_TIMEOUT	msecs_to_jiffies(100)
+
+enum witrn_report_type {
+	WITRN_PD		= 0xfe,
+	WITRN_SENSOR		= 0xff,
+};
+
+struct witrn_sensor {
+	__le16	record_threshold;	/* mA */
+	__le32	record_charge;		/* Ah (float) */
+	__le32	record_energy;		/* Wh (float) */
+	__le32	record_time;		/* s */
+	__le32	uptime;			/* s */
+	__le32	vdp;			/* V (float) */
+	__le32	vdm;			/* V (float) */
+	u8	__unknown[4];
+	__le32	temp_ntc;		/* Celsius (float) */
+	__le32	vbus;			/* V (float) */
+	__le32	ibus;			/* A (float) */
+	u8	record_group;		/* 0: group 1 on device, ... */
+	u8	vcc1;			/* dV */
+	u8	vcc2;			/* dV */
+} __packed;
+
+struct witrn_report {
+	u8	report_type;
+	u8	__unknown_0[11];
+
+	struct witrn_sensor sensor;
+
+	u8	__unknown_1[7];
+} __packed;
+static_assert(sizeof(struct witrn_report) == WITRN_REPORT_SZ);
+
+struct witrn_priv {
+	struct hid_device *hdev;
+
+	struct work_struct pause_work;
+
+	unsigned long flags;
+
+	spinlock_t lock; /* Protects members below */
+
+	struct completion completion;
+	unsigned long last_update; /* jiffies */
+	unsigned long last_access; /* jiffies */
+
+	struct witrn_sensor sensor;
+};
+
+static inline bool sensor_is_outdated(struct witrn_priv *priv)
+{
+	return time_after(jiffies, priv->last_update + UP_TO_DATE_TIMEOUT);
+}
+
+static inline bool hwmon_is_inactive(struct witrn_priv *priv)
+{
+	return time_after(jiffies, priv->last_access + PAUSE_TIMEOUT);
+}
+
+/* ======== HID ======== */
+
+static int witrn_open_hid(struct witrn_priv *priv)
+{
+	int ret;
+
+	if (test_and_set_bit(WITRN_HID_OPENED, &priv->flags))
+		return 0; /* Already opened */
+
+	hid_dbg(priv->hdev, "opening hid hw\n");
+
+	ret = hid_hw_open(priv->hdev);
+	if (ret) {
+		hid_err(priv->hdev, "hid hw open failed with %d\n", ret);
+		clear_bit(WITRN_HID_OPENED, &priv->flags);
+	}
+
+	return ret;
+}
+
+static void witrn_close_hid(struct witrn_priv *priv)
+{
+	if (!test_and_clear_bit(WITRN_HID_OPENED, &priv->flags))
+		return; /* Already closed */
+
+	hid_dbg(priv->hdev, "closing hid hw\n");
+
+	hid_hw_close(priv->hdev);
+}
+
+static void witrn_pause_hid(struct work_struct *work)
+{
+	struct witrn_priv *priv = container_of(work, struct witrn_priv, pause_work);
+
+	scoped_guard(spinlock, &priv->lock) {
+		/* Double check. Condition may change after being scheduled. */
+		if (!hwmon_is_inactive(priv))
+			return;
+	}
+
+	witrn_close_hid(priv);
+}
+
+static int witrn_raw_event(struct hid_device *hdev, struct hid_report *report,
+			   u8 *data, int size)
+{
+	struct witrn_priv *priv = hid_get_drvdata(hdev);
+	const struct witrn_report *wreport;
+	bool do_pause = false;
+
+	/* HIDRAW has opened the device while we are pausing. */
+	if (!test_bit(WITRN_HID_OPENED, &priv->flags))
+		return 0;
+
+	if (size < WITRN_REPORT_SZ) {
+		hid_dbg(hdev, "report size mismatch: %d < %d\n", size, WITRN_REPORT_SZ);
+		return 0;
+	}
+
+	wreport = (const struct witrn_report *)data;
+	if (wreport->report_type != WITRN_SENSOR) {
+		hid_dbg(hdev, "report ignored with type 0x%02x", wreport->report_type);
+		return 0;
+	}
+
+	scoped_guard(spinlock, &priv->lock) {
+		priv->last_update = jiffies;
+		do_pause = hwmon_is_inactive(priv);
+
+		memcpy(&priv->sensor, &wreport->sensor, sizeof(wreport->sensor));
+		complete(&priv->completion);
+	}
+
+	if (do_pause)
+		schedule_work(&priv->pause_work);
+
+	return 0;
+}
+
+static int witrn_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct device *parent = &hdev->dev;
+	struct witrn_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(parent, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->hdev = hdev;
+	hid_set_drvdata(hdev, priv);
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "hid parse failed with %d\n", ret);
+		return ret;
+	}
+
+	/* Enable HIDRAW so existing user-space tools can continue to work. */
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "hid hw start failed with %d\n", ret);
+		return ret;
+	}
+
+	spin_lock_init(&priv->lock);
+	init_completion(&priv->completion);
+
+	INIT_WORK(&priv->pause_work, witrn_pause_hid);
+
+	priv->last_access = jiffies;
+	priv->last_update = priv->last_access - UP_TO_DATE_TIMEOUT - 1;
+	clear_bit(WITRN_HID_OPENED, &priv->flags);
+
+	ret = witrn_open_hid(priv);
+	if (ret) {
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void witrn_remove(struct hid_device *hdev)
+{
+	struct witrn_priv *priv = hid_get_drvdata(hdev);
+
+	witrn_close_hid(priv);
+
+	/* Cancel it after closing HID so that it won't be rescheduled. */
+	cancel_work_sync(&priv->pause_work);
+
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id witrn_id_table[] = {
+	{ HID_USB_DEVICE(0x0716, 0x5060) },	/* WITRN K2 USB-C tester */
+	{ }
+};
+
+MODULE_DEVICE_TABLE(hid, witrn_id_table);
+
+static struct hid_driver witrn_driver = {
+	.name = DRIVER_NAME,
+	.id_table = witrn_id_table,
+	.probe = witrn_probe,
+	.remove = witrn_remove,
+	.raw_event = witrn_raw_event,
+};
+
+static int __init witrn_init(void)
+{
+	return hid_register_driver(&witrn_driver);
+}
+
+static void __exit witrn_exit(void)
+{
+	hid_unregister_driver(&witrn_driver);
+}
+
+/* When compiled into the kernel, initialize after the HID bus */
+late_initcall(witrn_init);
+module_exit(witrn_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
+MODULE_DESCRIPTION("WITRN USB tester driver");

-- 
2.53.0

