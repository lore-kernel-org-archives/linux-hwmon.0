Received: from mx25lb.world4you.com (mx25lb.world4you.com [81.19.149.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC031E25F7
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Mar 2025 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741469046; cv=none; b=MoRujTvDr8flqaZjq2rzj24lhtQJNNzHzJdYKLANDnvXjtLzwgsf6eCvH1q3J18pPctxgBXiPWnOmnmbBXcRI9yQuQZghpKGVr5UChTLBn5qOko0WzkQ8M6tuNvwv74Ihh9U0w1uUq47nkRoMigVVzfy0jMZxF4XZago2Pe2GLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741469046; c=relaxed/simple;
	bh=wRl+Ucs9ZSVWyhWAetYEkU77gA6sP6mXdjN+LDHGwo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VRALnYTJ+OPYdTDkAgS0eHwrsS/xHQsHuT5DKjLUP6jeMaAifwsAk984YpJ8EtCI+7KRGdnSKxSKjtsnpP8yATS4b+GJB1rUjFRJ0hAxu7+phtyKn7FfepcZUg0fsLdckmI0Xaczi+VKnAcan7HHejEXNCJSl0pFXI7m1s9dpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=NJL2Expx; arc=none smtp.client-ip=81.19.149.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="NJL2Expx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=34qEiQ4XXGKR50hiaVcF48zUAUrDpesaElho7a3MBRU=; b=NJL2Expxx0VHqQQEl+vqRh4egm
	Jt13eO/ll5smlI/1Ky7Qdf0gbIa8TI/OychOrkLJ3TbJ7SsQBMI/FnKbfJRqExrMRkIhaW3Bb8vz5
	i7ZlUEjW1rH+j3YPEBiMO9tubvy37tMNgCCRmr+4crhCqqiE6SYzLoC6aw9dklaisS/Q=;
Received: from [80.121.79.4] (helo=hornet.engleder.at)
	by mx25lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1tr1eF-000000003OJ-3Q99;
	Sat, 08 Mar 2025 22:23:56 +0100
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH] hwmon: Add KEBA battery monitoring controller support
Date: Sat,  8 Mar 2025 22:23:46 +0100
Message-Id: <20250308212346.51316-1-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-ACL-Warn: X-W4Y-Internal

From: Gerhard Engleder <eg@keba.com>

The KEBA battery monitoring controller is found in the system FPGA of
KEBA PLC devices. It puts a load on the coin cell battery to check the
state of the battery.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
 drivers/hwmon/Kconfig  |  12 ++++
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/kbatt.c  | 159 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/hwmon/kbatt.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4cbaba15d86e..ec396252cc18 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -335,6 +335,18 @@ config SENSORS_K10TEMP
 	  This driver can also be built as a module. If so, the module
 	  will be called k10temp.
 
+config SENSORS_KBATT
+	tristate "KEBA battery controller support"
+	depends on HAS_IOMEM
+	depends on KEBA_CP500 || COMPILE_TEST
+	select AUXILIARY_BUS
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
index b7ef0f0562d3..4671a9b77b55 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_SENSORS_IT87)	+= it87.o
 obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
 obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
+obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
new file mode 100644
index 000000000000..09a622a7d36a
--- /dev/null
+++ b/drivers/hwmon/kbatt.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) KEBA Industrial Automation Gmbh 2025
+ *
+ * Driver for KEBA battery monitoring controller FPGA IP core
+ */
+
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/misc/keba.h>
+
+#define KBATT "kbatt"
+
+#define KBATT_CONTROL_REG		0x4
+#define   KBATT_CONTROL_BAT_TEST	0x01
+
+#define KBATT_STATUS_REG		0x8
+#define   KBATT_STATUS_BAT_OK		0x01
+
+#define KBATT_MAX_UPD_INTERVAL	(5 * HZ)
+#define KBATT_SETTLE_TIME_MS	100
+
+struct kbatt {
+	struct keba_batt_auxdev *auxdev;
+	/* update lock */
+	struct mutex lock;
+	void __iomem *base;
+	struct device *hwmon_dev;
+
+	bool valid;
+	unsigned long last_updated; /* in jiffies */
+	long alarm;
+};
+
+static long kbatt_alarm(struct kbatt *kbatt)
+{
+	mutex_lock(&kbatt->lock);
+
+	if (time_after(jiffies, kbatt->last_updated + KBATT_MAX_UPD_INTERVAL) ||
+	    !kbatt->valid) {
+		/* switch load on */
+		iowrite8(KBATT_CONTROL_BAT_TEST,
+			 kbatt->base + KBATT_CONTROL_REG);
+
+		/* wait some time to let things settle */
+		msleep(KBATT_SETTLE_TIME_MS);
+
+		/* check battery state */
+		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
+		    KBATT_STATUS_BAT_OK)
+			kbatt->alarm = 0;
+		else
+			kbatt->alarm = 1;
+
+		/* switch load off */
+		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
+
+		kbatt->last_updated = jiffies;
+		kbatt->valid = true;
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
+	if ((channel != 1) || (attr != hwmon_in_alarm))
+		return -EOPNOTSUPP;
+
+	*val = kbatt_alarm(kbatt);
+
+	return 0;
+}
+
+static umode_t kbatt_is_visible(const void *data, enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	if ((channel == 1) && (attr == hwmon_in_alarm))
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *kbatt_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   /* 0: dummy, skipped in is_visible */
+			   HWMON_I_ALARM,
+			   /* 1: input alarm channel */
+			   HWMON_I_ALARM),
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
+	struct device *dev = &auxdev->dev;
+	struct kbatt *kbatt;
+
+	kbatt = devm_kzalloc(dev, sizeof(struct kbatt), GFP_KERNEL);
+	if (!kbatt)
+		return -ENOMEM;
+	kbatt->auxdev = container_of(auxdev, struct keba_batt_auxdev, auxdev);
+	mutex_init(&kbatt->lock);
+	auxiliary_set_drvdata(auxdev, kbatt);
+
+	kbatt->base = devm_ioremap_resource(dev, &kbatt->auxdev->io);
+	if (IS_ERR(kbatt->base))
+		return PTR_ERR(kbatt->base);
+
+	kbatt->hwmon_dev = devm_hwmon_device_register_with_info(dev, KBATT,
+							     kbatt,
+							     &kbatt_chip_info,
+							     NULL);
+	if (IS_ERR(kbatt->hwmon_dev))
+		return PTR_ERR(kbatt->hwmon_dev);
+
+	return 0;
+}
+
+static void kbatt_remove(struct auxiliary_device *auxdev)
+{
+	auxiliary_set_drvdata(auxdev, NULL);
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
+	.remove = kbatt_remove,
+};
+module_auxiliary_driver(kbatt_driver_aux);
+
+MODULE_AUTHOR("Petar Bojanic <boja@keba.com>");
+MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
+MODULE_DESCRIPTION("KEBA battery monitoring controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

