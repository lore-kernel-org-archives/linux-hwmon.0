Received: from mx08lb.world4you.com (mx08lb.world4you.com [81.19.149.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF52165F1A
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Apr 2025 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226871; cv=none; b=gok2UQ43n3RzwbPXRWTrLCeMDh17s51Oo+968OMyMOJYiGVEPD4Qylo7vAPqZRCZNcEvo+FkgK1owxKnPQYj2aQp+GLggrfFXuNDQK16mTYkNhCpdjUVSI9xN8gaafySwAU1LQ+ooDk9G0j87U/m2OrSmpobbzBOa7ZQZ2FFsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226871; c=relaxed/simple;
	bh=gWCva5jGVrbtfqz74/IgpteLM2z/UoUn0ummaakIhhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tNmxuQq9DwgguBXXYWEx1vHdqkbPeCSWRLac8G7sMzJJUaaBjjDKa37TuoZA2QAq3VNWZ0IQ4n1pVPYphfyZPJqDzHLCHhmz/YLHSX9B7AaJzKuHC22VXX37uvzweybwlI+vpQgFKOoI/bKME6HmOi2ROGDK1+LYqfeqMHElD34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=iyJho0Rj; arc=none smtp.client-ip=81.19.149.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="iyJho0Rj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bJXGJqdwOmKAhoCF+YJdWnJ0iLeahCuROxRAsXjgiU4=; b=iyJho0Rjazo1so1OvbDYTrbq0J
	NN8Y4BvSUdF+86AhepGqX4SS/jstzhBGXekwFgwmQDg5fZ1pdiDvbkh0Z+KHC6CvplA20l8anKV8E
	oiAh2AjDaK8TjQNXSgHmimINNSfiLCcxDUn6KN5FZqtcoMsrtAOX4Jmrb1JmPSBDiEPU=;
Received: from [188.22.33.74] (helo=hornet.engleder.at)
	by mx08lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1u2amt-000000000gS-3NkO;
	Wed, 09 Apr 2025 21:08:40 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux@weissschuh.net,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH v2] hwmon: Add KEBA battery monitoring controller support
Date: Wed,  9 Apr 2025 21:08:30 +0200
Message-Id: <20250409190830.60489-1-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-ACL-Warn: X-W4Y-Internal
X-Spam-Bar: /

From: Gerhard Engleder <eg@keba.com>

The KEBA battery monitoring controller is found in the system FPGA of
KEBA PLC devices. It puts a load on the coin cell battery to check the
state of the battery. If the coin cell battery is nearly empty, then
the user space is signaled with a hwmon alarm.

The auxiliary device for this driver is instantiated by the cp500 misc
driver.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
v2:
- add info of relation to cp500 to commit message (Thomas Weißschuh)
- add Documentation/hwmon/kbatt.rst (Thomas Weißschuh, Guenter Roeck)
- remove COMPILE_TEST, HAS_IOMEM and AUXILIARY_BUS Kconfig dependencies
  (Thomas Weißschuh, Guenter Roeck)
- fix typo and year position in copyright line (Thomas Weißschuh)
- add missing device.h, auxiliary_bus.h and mutex.h includes (Thomas Weißschuh)
- remove auxdev from struct kbatt (Thomas Weißschuh)
- remove hwmon_dev from struct kbatt (Thomas Weißschuh)
- use bool for alarm in struct kbatt (Thomas Weißschuh, Guenter Roeck)
- eliminate valid from struct kbatt (Thomas Weißschuh)
- use flseep() instead of msleep() (Thomas Weißschuh)
- remove useless argument check in kbatt_read() (Thomas Weißschuh)
- remove channel 0 dummy (Thomas Weißschuh, Guenter Roeck)
- use sizeof(*kbatt) for devm_kzalloc() (Thomas Weißschuh)
- use devm_mutex_init() (Thomas Weißschuh)
- remove useless auxiliary_set_drvdata() calls (Thomas Weißschuh)
- use PTR_ERR_OR_ZERO() (Thomas Weißschuh)
- remove unnecessary ( ) (Guenter Roeck)
- switch to in0_min_alarm (Guenter Roeck)
- rework last_updated to next_update in struct kbatt
- increase polling to 10s
---
 Documentation/hwmon/index.rst |   1 +
 Documentation/hwmon/kbatt.rst |  60 ++++++++++++++
 drivers/hwmon/Kconfig         |  10 +++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/kbatt.c         | 147 ++++++++++++++++++++++++++++++++++
 5 files changed, 219 insertions(+)
 create mode 100644 Documentation/hwmon/kbatt.rst
 create mode 100644 drivers/hwmon/kbatt.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f0ddf6222c44..da5895115724 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -106,6 +106,7 @@ Hardware Monitoring Kernel Drivers
    jc42
    k10temp
    k8temp
+   kbatt
    lan966x
    lineage-pem
    lm25066
diff --git a/Documentation/hwmon/kbatt.rst b/Documentation/hwmon/kbatt.rst
new file mode 100644
index 000000000000..b72718c5ede3
--- /dev/null
+++ b/Documentation/hwmon/kbatt.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver kbatt
+===================
+
+Supported chips:
+
+  * KEBA battery monitoring controller (IP core in FPGA)
+
+    Prefix: 'kbatt'
+
+Authors:
+
+	Gerhard Engleder <eg@keba.com>
+	Petar Bojanic <boja@keba.com>
+
+Description
+-----------
+
+The KEBA battery monitoring controller is an IP core for FPGAs, which
+monitors the health of a coin cell battery. The coin cell battery is
+typically used to supply the RTC during power off to keep the current
+time. E.g., the CP500 FPGA includes this IP core to monitor the coin cell
+battery of PLCs and the corresponding cp500 driver creates an auxiliary
+device for the kbatt driver.
+
+This driver provides information about the coin cell battery health to
+user space. Actually the user space shall be informed that the coin cell
+battery is nearly empty and needs to be replaced.
+
+The coin cell battery must be tested actively to get to know if its nearly
+empty or not. Therefore, a load is put on the coin cell battery and the
+resulting voltage is evaluated. This evaluation is done by some hard wired
+analog logic, which compares the voltage to a defined limit. If the
+voltage is above the limit, then the coin cell battery is assumed to be
+ok. If the voltage is below the limit, then the coin cell battery is
+nearly empty (or broken, removed, ...) and shall be replaced by a new one.
+The KEBA battery monitoring controller allows to start the test of the
+coin cell battery and to get the result if the voltage is above or below
+the limit. The actual voltage is not available. Only the information if
+the voltage is below a limit is available.
+
+The test load, which is put on the coin cell battery for the health check,
+is similar to the load during power off. Therefore, the lifetime of the
+coin cell battery is reduced directly by the duration of each test. To
+limit the negative impact to the lifetime the test is limited to at most
+once every 10 seconds. The test load is put on the coin cell battery for
+100ms. Thus, in worst case the coin cell battery lifetime is reduced by
+1% of the uptime or 3.65 days per year. As the coin cell battery lasts
+multiple years, this lifetime reduction negligible.
+
+This driver only provides a single alarm attribute, which is raised when
+the coin cell battery is nearly empty.
+
+====================== ==== ===================================================
+Attribute              R/W  Contents
+====================== ==== ===================================================
+in0_min_alarm          R    voltage of coin cell battery under load is below
+                            limit
+====================== ==== ===================================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f91f713b0105..832d7e5f9f7b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -335,6 +335,16 @@ config SENSORS_K10TEMP
 	  This driver can also be built as a module. If so, the module
 	  will be called k10temp.
 
+config SENSORS_KBATT
+	tristate "KEBA battery controller support"
+	depends on KEBA_CP500
+	help
+	  This driver supports the battery monitoring controller found in
+	  KEBA system FPGA devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called kbatt.
+
 config SENSORS_FAM15H_POWER
 	tristate "AMD Family 15h processor power"
 	depends on X86 && PCI && CPU_SUP_AMD
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 766c652ef22b..af18deb0422e 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_SENSORS_IT87)	+= it87.o
 obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
 obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
+obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
new file mode 100644
index 000000000000..501b8f4ded33
--- /dev/null
+++ b/drivers/hwmon/kbatt.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 KEBA Industrial Automation GmbH
+ *
+ * Driver for KEBA battery monitoring controller FPGA IP core
+ */
+
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/misc/keba.h>
+#include <linux/mutex.h>
+
+#define KBATT "kbatt"
+
+#define KBATT_CONTROL_REG		0x4
+#define   KBATT_CONTROL_BAT_TEST	0x01
+
+#define KBATT_STATUS_REG		0x8
+#define   KBATT_STATUS_BAT_OK		0x01
+
+#define KBATT_MAX_UPD_INTERVAL	(10 * HZ)
+#define KBATT_SETTLE_TIME_US	(100 * USEC_PER_MSEC)
+
+struct kbatt {
+	/* update lock */
+	struct mutex lock;
+	void __iomem *base;
+
+	unsigned long next_update; /* in jiffies */
+	bool alarm;
+};
+
+static bool kbatt_alarm(struct kbatt *kbatt)
+{
+	mutex_lock(&kbatt->lock);
+
+	if (!kbatt->next_update || time_after(jiffies, kbatt->next_update)) {
+		/* switch load on */
+		iowrite8(KBATT_CONTROL_BAT_TEST,
+			 kbatt->base + KBATT_CONTROL_REG);
+
+		/* wait some time to let things settle */
+		fsleep(KBATT_SETTLE_TIME_US);
+
+		/* check battery state */
+		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
+		    KBATT_STATUS_BAT_OK)
+			kbatt->alarm = false;
+		else
+			kbatt->alarm = true;
+
+		/* switch load off */
+		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
+
+		kbatt->next_update = jiffies + KBATT_MAX_UPD_INTERVAL;
+	}
+
+	mutex_unlock(&kbatt->lock);
+
+	return kbatt->alarm;
+}
+
+static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct kbatt *kbatt = dev_get_drvdata(dev);
+
+	*val = kbatt_alarm(kbatt) ? 1 : 0;
+
+	return 0;
+}
+
+static umode_t kbatt_is_visible(const void *data, enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	if (channel == 0 && attr == hwmon_in_min_alarm)
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *kbatt_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   /* 0: input minimum alarm channel */
+			   HWMON_I_MIN_ALARM),
+	NULL
+};
+
+static const struct hwmon_ops kbatt_hwmon_ops = {
+	.is_visible = kbatt_is_visible,
+	.read = kbatt_read,
+};
+
+static const struct hwmon_chip_info kbatt_chip_info = {
+	.ops = &kbatt_hwmon_ops,
+	.info = kbatt_info,
+};
+
+static int kbatt_probe(struct auxiliary_device *auxdev,
+		       const struct auxiliary_device_id *id)
+{
+	struct keba_batt_auxdev *kbatt_auxdev =
+		container_of(auxdev, struct keba_batt_auxdev, auxdev);
+	struct device *dev = &auxdev->dev;
+	struct device *hwmon_dev;
+	struct kbatt *kbatt;
+	int retval;
+
+	kbatt = devm_kzalloc(dev, sizeof(*kbatt), GFP_KERNEL);
+	if (!kbatt)
+		return -ENOMEM;
+
+	retval = devm_mutex_init(dev, &kbatt->lock);
+	if (retval)
+		return retval;
+
+	kbatt->base = devm_ioremap_resource(dev, &kbatt_auxdev->io);
+	if (IS_ERR(kbatt->base))
+		return PTR_ERR(kbatt->base);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, KBATT, kbatt,
+							 &kbatt_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct auxiliary_device_id kbatt_devtype_aux[] = {
+	{ .name = "keba.batt" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, kbatt_devtype_aux);
+
+static struct auxiliary_driver kbatt_driver_aux = {
+	.name = KBATT,
+	.id_table = kbatt_devtype_aux,
+	.probe = kbatt_probe,
+};
+module_auxiliary_driver(kbatt_driver_aux);
+
+MODULE_AUTHOR("Petar Bojanic <boja@keba.com>");
+MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
+MODULE_DESCRIPTION("KEBA battery monitoring controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

