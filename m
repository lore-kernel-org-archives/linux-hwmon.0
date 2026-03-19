Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301612248B3;
	Thu, 19 Mar 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900405; cv=none; b=msOVD1RtD26IMv/VH2nWPmn960q5I7RxTJW/kGBBTUmfocv1syqjpcdAFrAavLDKXgXhXf0shO0FgDRejg6AzvspllNOfcPKSUQFrB4wkjEVz75ADTqH8zxkikCA+ixquUjYymXg7gvn3KTiejlwmdJm38lWfOpabp3EapqW1/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900405; c=relaxed/simple;
	bh=qZjo5S2qvbZn2+YzLEJyG4KN2eJF3Q1MUXjqTJyCMk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7PpxMNi+blevX5IUdlZ8g7F4t/US5mhCthqeBjcXT9ey/1dBbTe0qWwVrHmSD1TisuZ224SWIYcx8VSXOV9pJWYJ2nZwWzO43oHL2r17CK/VKV5tJ/4RLDUrtzZHqnoyjer3h8J6PAiGZoHlR7N7HJHJSPw5Mzdr5t7lWl8OE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NzkEjuZt; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NzkEjuZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=LETSMKYyHs+LoySl5sV9aBtWDwN+ocqIrAW9kP/ES4s=;
	b=NzkEjuZt+uYlHQvmN6WqBoNKKDwwJfwtKRMwqRCVyUNAUTJ/B928Ta3+tlWByA
	Bl8mdtdkjOm839ZLL7dbXjUq0XqPiRz1ZxlsLZKzzzLyA9CReoxOEDajl/QU3Sbd
	Um6IgOZwbbtby/ZOp5D0bqn8izTgM06pS+r6BwZXnRKMo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgCXP9evkbtpNPn0Ag--.45701S3;
	Thu, 19 Mar 2026 14:03:32 +0800 (CST)
From: wenswang@yeah.net
To: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH v2 2/2] hwmon: add MP2985 driver
Date: Thu, 19 Mar 2026 14:03:18 +0800
Message-Id: <20260319060318.643572-2-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260319060318.643572-1-wenswang@yeah.net>
References: <20260319060118.643352-1-wenswang@yeah.net>
 <20260319060318.643572-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgCXP9evkbtpNPn0Ag--.45701S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfJF1kJr4kuF1UXFy7WF1xZrb_yoW8WrWrto
	Za9FyrZwn8Jr18ZFZ5KF4I9F97XF1q9FZ5A3W2yrs8WFy3Ar45KF9rA3yaqa4ayF4rXa18
	u3y8A3s3t3y7Z3srn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4Rpa0PUUUUU
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiORXaf2m7kbVKdAAA3B

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2985 controller. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
v1 -> v2:
    1. remove duplicate entry in mp2985.rst
    2. clamp vout value to 32767
    3. simplify the code for obtaining PMBUS_VOUT_MODE bit value
    4. add comment for explaining MP2985 supported vout mode
    5. switch back to previous page after obtaining vid scale to avoid
       confusing the PMBus core

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2985.rst | 147 +++++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2985.c   | 377 +++++++++++++++++++++++++++++++++
 6 files changed, 542 insertions(+)
 create mode 100644 Documentation/hwmon/mp2985.rst
 create mode 100644 drivers/hwmon/pmbus/mp2985.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513cfcd..1b7007f41b39 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -183,6 +183,7 @@ Hardware Monitoring Kernel Drivers
    mp2925
    mp29502
    mp2975
+   mp2985
    mp2993
    mp5023
    mp5920
diff --git a/Documentation/hwmon/mp2985.rst b/Documentation/hwmon/mp2985.rst
new file mode 100644
index 000000000000..87a39c8a300c
--- /dev/null
+++ b/Documentation/hwmon/mp2985.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2985
+====================
+
+Supported chips:
+
+  * MPS mp2985
+
+    Prefix: 'mp2985'
+
+Author:
+
+	Wensheng Wang <wenswang@yeah.net>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP2985 Dual Loop Digital Multi-phase Controller.
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
+**in1_lcrit**
+
+**in1_lcrit_alarm**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_crit**
+
+**in2_crit_alarm**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in3_input**
+
+**in3_label**
+
+**in3_crit**
+
+**in3_crit_alarm**
+
+**in3_lcrit**
+
+**in3_lcrit_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+The driver provides the following attributes for output current:
+
+**curr2_input**
+
+**curr2_label**
+
+**curr2_crit**
+
+**curr2_crit_alarm**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
+**curr3_input**
+
+**curr3_label**
+
+**curr3_crit**
+
+**curr3_crit_alarm**
+
+**curr3_max**
+
+**curr3_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for output power:
+
+**power3_input**
+
+**power3_label**
+
+**power4_input**
+
+**power4_label**
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
+
+**temp2_input**
+
+**temp2_crit**
+
+**temp2_crit_alarm**
+
+**temp2_max**
+
+**temp2_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index d7241695df96..ac62dbaef34d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17920,6 +17920,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp29502.rst
 F:	drivers/hwmon/pmbus/mp29502.c
 
+MPS MP2985 DRIVER
+M:	Wensheng Wang <wenswang@yeah.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp2985.rst
+F:	drivers/hwmon/pmbus/mp2985.c
+
 MPS MP2993 DRIVER
 M:	Noah Wang <noahwang.wang@outlook.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..83fe5866c083 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -447,6 +447,15 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP2985
+	tristate "MPS MP2985"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2985 Dual Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2985.
+
 config SENSORS_MP2993
 	tristate "MPS MP2993"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..24505bbee2b0 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
 obj-$(CONFIG_SENSORS_MP2925)	+= mp2925.o
 obj-$(CONFIG_SENSORS_MP29502)	+= mp29502.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
+obj-$(CONFIG_SENSORS_MP2985)	+= mp2985.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
diff --git a/drivers/hwmon/pmbus/mp2985.c b/drivers/hwmon/pmbus/mp2985.c
new file mode 100644
index 000000000000..df0934ebcaa0
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2985.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2985)
+ *
+ * Copyright (C) 2026 MPS
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+/*
+ * Vender specific register READ_PIN_EST(0x93), READ_IIN_EST(0x8E),
+ * MFR_VR_MULTI_CONFIG_R1(0x0D) and MFR_VR_MULTI_CONFIG_R2(0x1D).
+ * The READ_PIN_EST is used to read pin telemetry, the READ_IIN_EST
+ * is used to read iin telemetry and the MFR_VR_MULTI_CONFIG_R1,
+ * MFR_VR_MULTI_CONFIG_R2 are used to obtain vid scale.
+ */
+#define READ_PIN_EST	0x93
+#define READ_IIN_EST	0x8E
+#define MFR_VR_MULTI_CONFIG_R1	0x0D
+#define MFR_VR_MULTI_CONFIG_R2	0x1D
+
+#define MP2985_VOUT_DIV	512
+#define MP2985_VOUT_OVUV_UINT	195
+#define MP2985_VOUT_OVUV_DIV	100
+
+#define MP2985_PAGE_NUM	2
+
+#define MP2985_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_PIN | \
+							 PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
+							 PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP | \
+							 PMBUS_HAVE_STATUS_VOUT | \
+							 PMBUS_HAVE_STATUS_IOUT | \
+							 PMBUS_HAVE_STATUS_TEMP | \
+							 PMBUS_HAVE_STATUS_INPUT)
+
+#define MP2985_RAIL2_FUNC	(PMBUS_HAVE_PIN | PMBUS_HAVE_VOUT | \
+							 PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
+							 PMBUS_HAVE_TEMP | PMBUS_HAVE_IIN | \
+							 PMBUS_HAVE_STATUS_VOUT | \
+							 PMBUS_HAVE_STATUS_IOUT | \
+							 PMBUS_HAVE_STATUS_TEMP | \
+							 PMBUS_HAVE_STATUS_INPUT)
+
+struct mp2985_data {
+	struct pmbus_driver_info info;
+	int vout_scale[MP2985_PAGE_NUM];
+	int vid_offset[MP2985_PAGE_NUM];
+};
+
+#define to_mp2985_data(x) container_of(x, struct mp2985_data, info)
+
+static u16 mp2985_linear_exp_transfer(u16 word, u16 expect_exponent)
+{
+	s16 exponent, mantissa, target_exponent;
+
+	exponent = ((s16)word) >> 11;
+	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
+	target_exponent = (s16)((expect_exponent & 0x1f) << 11) >> 11;
+
+	if (exponent > target_exponent)
+		mantissa = mantissa << (exponent - target_exponent);
+	else
+		mantissa = mantissa >> (target_exponent - exponent);
+
+	return (mantissa & 0x7ff) | ((expect_exponent << 11) & 0xf800);
+}
+
+static int mp2985_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * The MP2985 does not follow standard PMBus protocol completely,
+		 * and the calculation of vout in this driver is based on direct
+		 * format. As a result, the format of vout is enforced to direct.
+		 */
+		ret = PB_VOUT_MODE_DIRECT;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2985_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2985_data *data = to_mp2985_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * The MP2985 supports three vout mode, direct, linear11 and vid mode.
+		 * In vid mode, the MP2985 vout telemetry has 49 vid step offset, but
+		 * PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT do not take
+		 * this into consideration, its resolution is 1.95mV/LSB, as a result,
+		 * format[PSC_VOLTAGE_OUT] can not be set to vid directly. Adding extra
+		 * vid_offset variable for vout telemetry.
+		 */
+		ret = clamp_val(DIV_ROUND_CLOSEST(((ret & GENMASK(11, 0)) +
+									data->vid_offset[page]) *
+							data->vout_scale[page], MP2985_VOUT_DIV),
+							0, 0x7FFF);
+		break;
+	case PMBUS_READ_IIN:
+		/*
+		 * The MP2985 has standard PMBUS_READ_IIN register(0x89), but this is
+		 * not used to read the input current of per rail. The input current
+		 * is read through the vender redefined register READ_IIN_EST(0x8E).
+		 */
+		ret = pmbus_read_word_data(client, page, phase, READ_IIN_EST);
+		break;
+	case PMBUS_READ_PIN:
+		/*
+		 * The MP2985 has standard PMBUS_READ_PIN register(0x97), but this
+		 * is not used to read the input power of per rail. The input power
+		 * of per rail is read through the vender redefined register
+		 * READ_PIN_EST(0x93).
+		 */
+		ret = pmbus_read_word_data(client, page, phase, READ_PIN_EST);
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * MP2985_VOUT_OVUV_UINT,
+					MP2985_VOUT_OVUV_DIV);
+		break;
+	case PMBUS_STATUS_WORD:
+	case PMBUS_READ_VIN:
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		ret = -ENODATA;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2985_write_word_data(struct i2c_client *client, int page, int reg,
+				  u16 word)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_OV_WARN_LIMIT,
+		 * PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
+		 * of MP2985 is linear11 format, and the exponent is a
+		 * constant value(5'b11101)， so the exponent of word
+		 * parameter should be converted to 5'b11101(0x1D).
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2985_linear_exp_transfer(word, 0x1D));
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		/*
+		 * The bit0-bit11 is the limit value, and bit12-bit15
+		 * should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(11, 0)) |
+				FIELD_PREP(GENMASK(11, 0),
+					   DIV_ROUND_CLOSEST(word * MP2985_VOUT_OVUV_DIV,
+							     MP2985_VOUT_OVUV_UINT)));
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT of
+		 * MP2985 is linear11 format, and the exponent is a
+		 * constant value(5'b00000), so the exponent of word
+		 * parameter should be converted to 5'b00000.
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2985_linear_exp_transfer(word, 0x00));
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		/*
+		 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
+		 * of MP2985 is linear11 format, and the exponent can not be
+		 * changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2985_linear_exp_transfer(word,
+								       FIELD_GET(GENMASK(15, 11),
+										 ret)));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int
+mp2985_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			   int page)
+{
+	struct mp2985_data *data = to_mp2985_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The MP2985 supports three vout mode. If PMBUS_VOUT_MODE
+	 * bit5 is 1, it is vid mode. If PMBUS PMBUS_VOUT_MODE bit4
+	 * is 1, it is linear11 mode. If PMBUS PMBUS_VOUT_MODE bit6
+	 * is 1, it is direct mode. In vid mode, the MP2985 vout
+	 * telemetry has 49 vid step offset.
+	 */
+	if (FIELD_GET(BIT(5), ret)) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_word_data(client, page == 0 ?
+									MFR_VR_MULTI_CONFIG_R1 :
+									MFR_VR_MULTI_CONFIG_R2);
+		if (ret < 0)
+			return ret;
+
+		if (page == 0) {
+			if (FIELD_GET(BIT(4), ret))
+				data->vout_scale[page] = 2560;
+			else
+				data->vout_scale[page] = 5120;
+		} else {
+			if (FIELD_GET(BIT(3), ret))
+				data->vout_scale[page] = 2560;
+			else
+				data->vout_scale[page] = 5120;
+		}
+
+		data->vid_offset[page] = 49;
+
+		/*
+		 * For vid mode, the MP2985 should be changed to page 2
+		 * to obtain vout scale value, this may confuse the PMBus
+		 * core. To avoid this, switch back to the previous page
+		 * again.
+		 */
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		if (ret < 0)
+			return ret;
+	} else if (FIELD_GET(BIT(4), ret)) {
+		data->vout_scale[page] = 1;
+		data->vid_offset[page] = 0;
+	} else {
+		data->vout_scale[page] = 512;
+		data->vid_offset[page] = 0;
+	}
+
+	return 0;
+}
+
+static int mp2985_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	ret = mp2985_identify_vout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	return mp2985_identify_vout_scale(client, info, 1);
+}
+
+static struct pmbus_driver_info mp2985_info = {
+	.pages = MP2985_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.func[0] = MP2985_RAIL1_FUNC,
+	.func[1] = MP2985_RAIL2_FUNC,
+	.read_word_data = mp2985_read_word_data,
+	.read_byte_data = mp2985_read_byte_data,
+	.write_word_data = mp2985_write_word_data,
+	.identify = mp2985_identify,
+};
+
+static int mp2985_probe(struct i2c_client *client)
+{
+	struct mp2985_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2985_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp2985_info, sizeof(mp2985_info));
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id mp2985_id[] = {
+	{"mp2985", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp2985_id);
+
+static const struct of_device_id __maybe_unused mp2985_of_match[] = {
+	{.compatible = "mps,mp2985"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2985_of_match);
+
+static struct i2c_driver mp2985_driver = {
+	.driver = {
+		.name = "mp2985",
+		.of_match_table = mp2985_of_match,
+	},
+	.probe = mp2985_probe,
+	.id_table = mp2985_id,
+};
+
+module_i2c_driver(mp2985_driver);
+
+MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2985 device");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.25.1

