Received: from e242-10.smtp-out.us-west-1.amazonses.com (e242-10.smtp-out.us-west-1.amazonses.com [23.251.242.10])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1262366DC0;
	Wed, 18 Mar 2026 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817375; cv=none; b=jFRdmROK5Z9kU2Bw1ZkJPHn4ZIifC7Vk9zNR0ueeoJhCW2exIUM6V5Atymwo64E5itskRUjJPk5o0vh+1GAFBC7udZ2tPchQXrSmiOOgLHkm7lZR8lrlzvlPR4fxif37fPCxotwvQ+24AV20wMTUZX2vBZ9OH2KqPAzyBPslVsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817375; c=relaxed/simple;
	bh=hMXaoiJeX9xkYSQo8SHDLChuKJFLqa7mrUOytbk9xf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr2tDRxsPP3p3xfIsH+e2Xv4K49L97hWTxTsXcttGVIvHt836WXwLuLpgtxwnWeF4bg/2Ee63WMDRCQ0mMgcFMTxNR1mJpsjn/Xr84fVX8ifU9MOhMjdcTDbJ70Ez2W9QTIxORf41xwdcCP3fgr8Oa+BT5+Uva7yctp7ipKReCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=Y7HqJBO+; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=gs97/PXx; arc=none smtp.client-ip=23.251.242.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="Y7HqJBO+";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="gs97/PXx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rodjp4ft5fg4rp24cb2ntayvghblvgrq; d=monolithicpower.com;
	t=1773817373;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hMXaoiJeX9xkYSQo8SHDLChuKJFLqa7mrUOytbk9xf0=;
	b=Y7HqJBO+bGz6U2XW0Tksq1w1ttI5bB7/aFKs6nZWJSNojo1HmhItQXl8qwAsx2TA
	PPYz3l1S7zAwOLulezaR54S+j69jnYaHepcN86rnG2B119MnMO0rRy+GnG0xwamXhVW
	SN8AIMrch50P52kSHmLGPYxLzWeb2IDIx3m7fwAw3UzFQX8rdBN3vg/0u9uSJ3d8j6q
	KE5ov4R1dtxvETAGBwFGqJV9uuVpGmBCxxUaFiJopXQS0PCfrc2W4RiYnaAsUfyS9C6
	ZCs0MAEBsnJflTiD+JWxL7hOCrpv7otKzZnRqDjiT/oit01FxBu7AqdEkW3UY2aS1QV
	1x0I36Lnag==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=voqdhibj3ww47nmt5hkqcrgg7xiynmza; d=amazonses.com; t=1773817373;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=hMXaoiJeX9xkYSQo8SHDLChuKJFLqa7mrUOytbk9xf0=;
	b=gs97/PXxIPpHcCueLEVXf0qOuAa5KlvBf/wqbZzlCC/dhRlbBvr0u8dFcY6AHbrz
	CZpea4xnkCccXSUZ7qLOwBUMFR1adTG7cpQKIoMhvJJ3ItpXg2Gz0sfGJVKCsGUqTjj
	MsmheaRdlG5hhZkKTvGGDL2FPNCewrsJDoraMYLI=
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: Yuxi.Wang@monolithicpower.com, linux@roeck-us.net, corbet@lwn.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] hwmon: add mpm369x driver
Date: Wed, 18 Mar 2026 07:02:53 +0000
Message-ID: <0111019cffc12220-1800bb62-f2e0-4194-99a3-7d2ba03532c6-000000@us-west-1.amazonses.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
References: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: :1.us-west-1.CVpA5H5M7EMrIGr0u6+8nP6wkCH59pkYLxtNQh1UjuczBtN1WmV60RtUapmzBbQ7+P+SiHg5vbyEpY0uRvudPF12wRQI7xDHNKjWPMJN/yd9hVbV9UslJ09o7rVZZCRhPDXT8kPM9Nch5RQcZE90uz62B8giHS2hgInWMbQKX5A=:1.us-west-1.yP6/L6iaxFc47BvsTr22yvAX3nKjbzwVEN8jceuJEpw=:AmazonSES
X-SES-Outgoing: 2026.03.18-23.251.242.10

Add support for mps mpm369x chip family,
which includes mpm3695-20 and mpm3690S-15.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/mpm369x.rst |  75 +++++++++++++++++++++
 MAINTAINERS                     |   7 ++
 drivers/hwmon/pmbus/Kconfig     |   9 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/mpm369x.c   | 115 ++++++++++++++++++++++++++++++++
 6 files changed, 208 insertions(+)
 create mode 100644 Documentation/hwmon/mpm369x.rst
 create mode 100644 drivers/hwmon/pmbus/mpm369x.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513cfcd..340df0ccc9f1 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -190,6 +190,7 @@ Hardware Monitoring Kernel Drivers
    mp5990
    mp9941
    mp9945
+   mpm369x
    mpq8785
    nct6683
    nct6775
diff --git a/Documentation/hwmon/mpm369x.rst b/Documentation/hwmon/mpm369x.rst
new file mode 100644
index 000000000000..df15eb1f81c3
--- /dev/null
+++ b/Documentation/hwmon/mpm369x.rst
@@ -0,0 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mpm369x
+====================
+
+Supported chips:
+
+  * MPS mpm3695-20
+
+    Prefix: 'mpm3695-20'
+
+  * MPS mpm3690S-15
+
+    Prefix: 'mpm3690S-15'
+
+Author:
+
+	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MPM3695-20 and MPM3690S-15 Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in2_rated_max**
+
+**in2_rated_min**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_max**
+
+**temp1_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..26b2949b2dd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17948,6 +17948,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp9945.rst
 F:	drivers/hwmon/pmbus/mp9945.c
 
+MPS MPM369X DRIVER
+M:	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mpm369x.rst
+F:	drivers/hwmon/pmbus/mpm369x.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..4aadecd49209 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -517,6 +517,15 @@ config SENSORS_MP9945
 	  This driver can also be built as a module. If so, the module will
 	  be called mp9945.
 
+config SENSORS_MPM369X
+	tristate "MPS MPM369X"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MPM369X chip family.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mpm369x.
+
 config SENSORS_MPQ7932_REGULATOR
 	bool "Regulator support for MPQ7932"
 	depends on SENSORS_MPQ7932 && REGULATOR
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..58f38f2013b0 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
 obj-$(CONFIG_SENSORS_MP9945)	+= mp9945.o
+obj-$(CONFIG_SENSORS_MPM369X)	+= mpm369x.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
 obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
diff --git a/drivers/hwmon/pmbus/mpm369x.c b/drivers/hwmon/pmbus/mpm369x.c
new file mode 100644
index 000000000000..3f1fe9c28ca7
--- /dev/null
+++ b/drivers/hwmon/pmbus/mpm369x.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * mpm369x.c  - pmbus driver for mps mpm369x
+ *
+ * Copyright 2026 Monolithic Power Systems, Inc
+ *
+ * Author: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+#define PAGE	0x01
+#define MPM369x_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+			 PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP | \
+			 PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT | \
+			 PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP)
+
+static int mpm369x_read_byte_data(struct i2c_client *client, int page,
+				  int reg)
+{
+	return -ENODATA;
+}
+
+static int mpm369x_read_word_data(struct i2c_client *client, int page, int phase,
+				  int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_TEMPERATURE_1:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		/*
+		 * Because the Temperature format used by the chip is a 2-byte,
+		 * twos complement integer and the sign bit is bits[9].
+		 * Report that signed short integer.
+		 */
+		if (ret & 0x200)
+			ret = (ret & 0x1ff) | 0xfe00;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
+static struct pmbus_driver_info mpm369x_info = {
+	.pages = PAGE,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 40,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 800,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 3,
+
+	.read_word_data = mpm369x_read_word_data,
+	.read_byte_data = mpm369x_read_byte_data,
+	.func[0] = MPM369x_FUNC,
+};
+
+static int mpm369x_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mpm369x_info);
+}
+
+static const struct i2c_device_id mpm369x_id[] = {
+	{ "MPM3695-20", 0 },
+	{ "MPM3690S-15", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mpm369x_id);
+
+static const struct of_device_id mpm369x_of_match[] = {
+	{ .compatible = "mps,mpm3695-20" },
+	{ .compatible = "mps,mpm3690S-15" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mpm369x_of_match);
+
+static struct i2c_driver mpm369x_driver = {
+	.probe = mpm369x_probe,
+	.driver = {
+			.name = "mpm369x",
+			.of_match_table = mpm369x_of_match,
+		   },
+	.id_table = mpm369x_id,
+};
+
+module_i2c_driver(mpm369x_driver);
+MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
+MODULE_DESCRIPTION("MPS MPM369x pmbus driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.2

