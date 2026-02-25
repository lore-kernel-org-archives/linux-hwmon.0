Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA4A2D29C8;
	Wed, 25 Feb 2026 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009988; cv=none; b=ZJ/cqTPmK/tGHv/axzI+5aLpMwPoF+q8LIjMnwrcW49cv2sWPyVyWyhPmQllfQzYNlHBaZkH9ICK8T62TrfHxxyzWBNDCe7GkIqdn0u5WYEG+MCpnfp/ZLaxbU3791j5kjo9kFlgrc9HdpMGoAZMyp3GMTcmkoo5Pw5rAoOGs9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009988; c=relaxed/simple;
	bh=QONqX4L4KkNkMRxbADoBbm44ZgP/93v+P0X7inohcso=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IbEurKQ/gyBx47wAGARwDVTam0QrfVCmG35t2fGoTRAk1vYlIYC0Fx5PZWSopLzZC8qYj1rLCiEJp+GV9RQ95Yb1cQ0G0UbaqTbb6nl/I6vCTJxDduQjI2h6KUz2fbK3FIWp2+kk25XdgKxvaEKsa6ZHY/yck7c6U01qNks2OHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iuxXfl/M; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iuxXfl/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=29
	caBgwvLdp01T9ylIV0Y3ctirsurnxcwSNjNWjKepo=; b=iuxXfl/MFnvTry85CN
	lN6538N4vIbq2rGAL+SjIfxuCubd+2zHoH47Cb/htXFqirVVU75yWKxxp2AJ1KeC
	qEgXOSC89nkcwpMg0xz80l+JsnTnRNl3IvQsekQXKqsFMSwz+n4RN0jAN7PIV75x
	IGqEN66oOeS7gNvdXlAguTwyw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgDnv49DuZ5p3qKHAQ--.38590S3;
	Wed, 25 Feb 2026 16:56:41 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 2/2] hwmon: add MP2845 driver
Date: Wed, 25 Feb 2026 16:56:31 +0800
Message-Id: <20260225085631.165106-2-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225085631.165106-1-wenswang@yeah.net>
References: <20260225085501.164819-1-wenswang@yeah.net>
 <20260225085631.165106-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDnv49DuZ5p3qKHAQ--.38590S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3tr18Wry5tFWfGw17ur1kGrg_yoW8Ary3Ko
	WfGF4Sv3WrAr1UZrWI9r47tFW7Xw4UCrZ5tw13Za1DWryakr1Yga93uws8uay2qw1rGw10
	9F4kG343tr4avrnrn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RG6wCDUUUU
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIgmCJ2meuUldngAA3K

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS VR controller mp2845. This driver exposes
telemetry and limit value readings.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2845.rst | 143 ++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/Kconfig          |  10 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/mp2845.c         | 493 +++++++++++++++++++++++++++++++++
 6 files changed, 655 insertions(+)
 create mode 100644 Documentation/hwmon/mp2845.rst
 create mode 100644 drivers/hwmon/mp2845.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d91dbb20c7dc..0a2176e5b694 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -176,6 +176,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    menf21bmc
    mlxreg-fan
+   mp2845
    mp2856
    mp2869
    mp2888
diff --git a/Documentation/hwmon/mp2845.rst b/Documentation/hwmon/mp2845.rst
new file mode 100644
index 000000000000..dc6328855e27
--- /dev/null
+++ b/Documentation/hwmon/mp2845.rst
@@ -0,0 +1,143 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2845
+====================
+
+Supported chips:
+
+  * MPS mp2845
+
+    Prefix: 'mp2845'
+
+  * MPS mp2845
+
+    Prefix: 'mp2845'
+
+Author:
+
+	Wensheng Wang <wenswang@yeah.net>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP2845 Dual Loop Digital Multi-phase Controller.
+
+Device compliant with:
+
+- Smbus interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in0_input**
+
+**in0_label**
+
+**in0_crit**
+
+**in0_crit_alarm**
+
+**in0_lcrit_alarm**
+
+**in0_min**
+
+The driver provides the following attributes for output voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_crit_alarm**
+
+**in1_lcrit_alarm**
+
+**in2_input**
+
+**in2_label**
+
+**in2_crit_alarm**
+
+**in2_lcrit_alarm**
+
+**in3_input**
+
+**in3_label**
+
+**in3_crit_alarm**
+
+**in3_lcrit_alarm**
+
+**in4_input**
+
+**in4_label**
+
+**in4_crit_alarm**
+
+**in4_lcrit_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_crit**
+
+**curr1_crit_alarm**
+
+**curr1_max**
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
+**curr4_input**
+
+**curr4_label**
+
+**curr4_crit**
+
+**curr4_crit_alarm**
+
+**curr4_max**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit_alarm**
+
+**temp2_input**
+
+**temp2_crit_alarm**
+
+**temp3_input**
+
+**temp3_crit_alarm**
+
+**temp4_input**
+
+**temp4_crit_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..f1539307de5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17905,6 +17905,13 @@ F:	drivers/resctrl/mpam_*
 F:	drivers/resctrl/test_mpam_*
 F:	include/linux/arm_mpam.h
 
+MPS MP2845 DRIVER
+M:	Wensheng Wang <wenswang@yeah.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp2845.rst
+F:	drivers/hwmon/mp2845.c
+
 MPS MP2869 DRIVER
 M:	Wensheng Wang <wenswang@yeah.net>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..3f77982e50ea 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1432,6 +1432,16 @@ config SENSORS_MENF21BMC_HWMON
 	  This driver can also be built as a module. If so the module
 	  will be called menf21bmc_hwmon.
 
+config SENSORS_MP2845
+	tristate "MPS MP2845"
+	depends on I2C
+	help
+	  If you say yes here you get hardware monitoring support for
+	  MPS MP2845 Dual Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called mp2845.
+
 config SENSORS_MR75203
 	tristate "Moortec Semiconductor MR75203 PVT Controller"
 	select REGMAP_MMIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..4372759f2e60 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -174,6 +174,7 @@ obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
 obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
 obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
+obj-$(CONFIG_SENSORS_MP2845)	+= mp2845.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
diff --git a/drivers/hwmon/mp2845.c b/drivers/hwmon/mp2845.c
new file mode 100644
index 000000000000..adecde7c9b71
--- /dev/null
+++ b/drivers/hwmon/mp2845.c
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Digital Controller(MP2845)
+ */
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#define MP2845_IOUT_SCALE_MASK1	GENMASK(5, 3)
+#define MP2845_IOUT_SCALE_MASK2	GENMASK(13, 11)
+
+#define MFR_VIN_OV_UV_SET	0x71
+#define MFR_OVUV_OCWARN_THRES	0x75
+#define MFR_TOTAL_OCP_SET	0x76
+#define MFR_PROTECT_STATUS1	0x80
+#define MFR_PROTECT_STATUS2 0x81
+
+#define MP2845_VIN_LIMIT_UINT	125
+#define MP2845_READ_VIN_UINT	3125
+#define MP2845_READ_VIN_DIV	100
+#define MP2845_READ_IOUT_UINT	3125
+#define MP2845_READ_IOUT_DIV	100
+#define MP2845_READ_VOUT_UINT	5
+#define MP2845_TEMP_UINT	1000
+
+#define MFR_READ_VIN	0xA6
+#define MFR_READ_VOUT	0xA7
+#define MFR_READ_IOUT	0xA8
+#define MFR_READ_TEMP	0xA9
+#define MFR_MFG_ID_SCALE_VI1	0x77
+#define MFR_MFG_ID_SCALE_VI2	0x78
+
+struct mp2845_data {
+	struct i2c_client *client;
+	int iout_gain[4];
+	/* lock for preventing concurrency issue */
+	struct mutex lock;
+};
+
+static umode_t mp2845_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+	case hwmon_in:
+	case hwmon_curr:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mp2845_read_string(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, const char **str)
+{
+	struct mp2845_data *data;
+	int ret = 0;
+
+	data = dev_get_drvdata(dev);
+
+	mutex_lock(&data->lock);
+
+	switch (type) {
+	case hwmon_in:
+		if (channel == 0)
+			*str = "vin";
+		else if (channel == 1)
+			*str = "vout1";
+		else if (channel == 2)
+			*str = "vout2";
+		else if (channel == 3)
+			*str = "vout3";
+		else
+			*str = "vout4";
+		break;
+	case hwmon_curr:
+		if (channel == 0)
+			*str = "iout1";
+		else if (channel == 1)
+			*str = "iout2";
+		else if (channel == 2)
+			*str = "iout3";
+		else
+			*str = "iout4";
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
+static int mp2845_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	int ret;
+	struct mp2845_data *data;
+
+	data = dev_get_drvdata(dev);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_lock(&data->lock);
+
+	switch (type) {
+	case hwmon_in:
+		if (channel == 0) {
+			if (attr == hwmon_in_input) {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_READ_VIN);
+				if (ret < 0)
+					break;
+
+				*val = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) *
+							 MP2845_READ_VIN_UINT,
+							 MP2845_READ_VIN_DIV);
+			} else if (attr == hwmon_in_crit) {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_VIN_OV_UV_SET);
+				if (ret < 0)
+					break;
+
+				*val = FIELD_GET(GENMASK(15, 8), ret) * MP2845_VIN_LIMIT_UINT;
+			} else if (attr == hwmon_in_min) {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_VIN_OV_UV_SET);
+				if (ret < 0)
+					break;
+
+				*val = FIELD_GET(GENMASK(7, 0), ret) * MP2845_VIN_LIMIT_UINT;
+			} else if (attr == hwmon_in_crit_alarm) {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
+				if (ret < 0)
+					break;
+
+				*val = FIELD_GET(GENMASK(5, 5), ret);
+			} else {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
+				if (ret < 0)
+					break;
+
+				*val = FIELD_GET(GENMASK(4, 4), ret);
+			}
+		} else {
+			if (attr == hwmon_in_input) {
+				ret = i2c_smbus_write_byte_data(data->client, 0, channel - 1);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_READ_VOUT);
+				if (ret < 0)
+					break;
+
+				*val = (ret & GENMASK(9, 0)) * MP2845_READ_VOUT_UINT;
+			} else if (attr == hwmon_in_crit_alarm) {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
+				if (ret < 0)
+					break;
+
+				if (channel == 1)
+					*val = FIELD_GET(GENMASK(10, 10), ret);
+				else if (channel == 2)
+					*val = FIELD_GET(GENMASK(7, 7), ret);
+				else if (channel == 3)
+					*val = FIELD_GET(GENMASK(4, 4), ret);
+				else
+					*val = FIELD_GET(GENMASK(1, 1), ret);
+			} else {
+				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+				if (ret < 0)
+					break;
+
+				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
+				if (ret < 0)
+					break;
+
+				if (channel == 1)
+					*val = FIELD_GET(GENMASK(11, 11), ret);
+				else if (channel == 2)
+					*val = FIELD_GET(GENMASK(8, 8), ret);
+				else if (channel == 3)
+					*val = FIELD_GET(GENMASK(5, 5), ret);
+				else
+					*val = FIELD_GET(GENMASK(2, 2), ret);
+			}
+		}
+		break;
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
+			if (ret < 0)
+				break;
+
+			ret = i2c_smbus_read_word_data(data->client, MFR_READ_TEMP);
+			if (ret < 0)
+				break;
+
+			*val = ((ret & GENMASK(7, 0)) - 40) * MP2845_TEMP_UINT;
+		} else {
+			ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+			if (ret < 0)
+				break;
+
+			ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
+				if (ret < 0)
+					break;
+
+			if (channel == 0) {
+				*val = FIELD_GET(GENMASK(12, 12), ret);
+			} else if (channel == 1) {
+				*val = FIELD_GET(GENMASK(14, 14), ret);
+			} else if (channel == 2) {
+				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
+				if (ret < 0)
+					break;
+
+				*val = FIELD_GET(GENMASK(0, 0), ret);
+			} else {
+				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
+				if (ret < 0)
+					break;
+
+				*val = FIELD_GET(GENMASK(2, 2), ret);
+			}
+		}
+		break;
+	case hwmon_curr:
+		if (attr == hwmon_curr_input) {
+			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
+			if (ret < 0)
+				break;
+
+			ret = i2c_smbus_read_word_data(data->client, MFR_READ_IOUT);
+			if (ret < 0)
+				break;
+
+			*val = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) * data->iout_gain[channel] *
+						 MP2845_READ_IOUT_UINT, MP2845_READ_IOUT_DIV);
+		} else if (attr == hwmon_curr_max) {
+			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
+			if (ret < 0)
+				break;
+
+			ret = i2c_smbus_read_word_data(data->client, MFR_OVUV_OCWARN_THRES);
+			if (ret < 0)
+				break;
+
+			*val = DIV_ROUND_CLOSEST(FIELD_GET(GENMASK(15, 8), ret) *
+						 data->iout_gain[channel] * MP2845_READ_IOUT_UINT *
+						 4 * 2, MP2845_READ_IOUT_DIV);
+		} else if (attr == hwmon_curr_crit) {
+			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
+			if (ret < 0)
+				break;
+
+			ret = i2c_smbus_read_word_data(data->client, MFR_TOTAL_OCP_SET);
+			if (ret < 0)
+				break;
+
+			*val = DIV_ROUND_CLOSEST(FIELD_GET(GENMASK(15, 8), ret) *
+						 data->iout_gain[channel] * MP2845_READ_IOUT_UINT *
+						 4 * 2, MP2845_READ_IOUT_DIV);
+		} else {
+			ret = i2c_smbus_write_byte_data(data->client, 0, 0);
+			if (ret < 0)
+				break;
+
+			ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
+			if (ret < 0)
+				break;
+
+			if (channel == 0)
+				*val = FIELD_GET(GENMASK(9, 9), ret);
+			else if (channel == 2)
+				*val = FIELD_GET(GENMASK(6, 6), ret);
+			else if (channel == 3)
+				*val = FIELD_GET(GENMASK(3, 3), ret);
+			else
+				*val = FIELD_GET(GENMASK(0, 0), ret);
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
+static int
+mp2845_identify_iout_scale(struct mp2845_data *data, int page)
+{
+	int gain;
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(data->client, 0x00, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(data->client, page == 0 ? MFR_MFG_ID_SCALE_VI2 :
+				       MFR_MFG_ID_SCALE_VI1);
+	if (ret < 0)
+		return ret;
+
+	gain = page == 0 ? FIELD_GET(MP2845_IOUT_SCALE_MASK1, ret) :
+	       FIELD_GET(MP2845_IOUT_SCALE_MASK2, ret);
+	switch (gain) {
+	case 1:
+		data->iout_gain[page] = 1;
+		break;
+	case 2:
+		data->iout_gain[page] = 2;
+		break;
+	case 3:
+		data->iout_gain[page] = 4;
+		break;
+	case 4:
+		data->iout_gain[page] = 8;
+		break;
+	case 5:
+		data->iout_gain[page] = 16;
+		break;
+	case 6:
+		data->iout_gain[page] = 32;
+		break;
+	case 7:
+		data->iout_gain[page] = 64;
+		break;
+	default:
+		data->iout_gain[page] = 1;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *mp2845_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_CRIT | HWMON_I_CRIT_ALARM |
+			   HWMON_I_LCRIT_ALARM | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM,
+			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM,
+			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM,
+			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
+			   HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
+			   HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
+			   HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
+			   HWMON_C_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops mp2845_hwmon_ops = {
+	.is_visible = mp2845_is_visible,
+	.read = mp2845_read,
+	.read_string = mp2845_read_string,
+};
+
+static const struct hwmon_chip_info mp2845_chip_info = {
+	.ops = &mp2845_hwmon_ops,
+	.info = mp2845_info,
+};
+
+static int mp2845_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct mp2845_data *data;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA)) {
+		dev_err(dev, "check failed, smbus byte and/or word data not supported!\n");
+		return -ENODEV;
+	}
+
+	data = devm_kzalloc(dev, sizeof(struct mp2845_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->lock);
+	data->client = client;
+
+	ret = mp2845_identify_iout_scale(data, 0);
+	if (ret < 0) {
+		dev_err(dev, "unable to identify rail1 iout scale, errno = %d\n", ret);
+		return ret;
+	}
+
+	ret = mp2845_identify_iout_scale(data, 1);
+	if (ret < 0) {
+		dev_err(dev, "unable to identify rail2 iout scale, errno = %d\n", ret);
+		return ret;
+	}
+
+	ret = mp2845_identify_iout_scale(data, 2);
+	if (ret < 0) {
+		dev_err(dev, "unable to identify rail3 iout scale, errno = %d\n", ret);
+		return ret;
+	}
+
+	ret = mp2845_identify_iout_scale(data, 3);
+	if (ret < 0) {
+		dev_err(dev, "unable to identify rail4 iout scale, errno = %d\n", ret);
+		return ret;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &mp2845_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		dev_err(dev, "unable to register mp2845 hwmon device\n");
+		return PTR_ERR(hwmon_dev);
+	}
+
+	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
+
+	return 0;
+}
+
+static const struct i2c_device_id mp2845_ids[] = {
+	{"mp2845", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp2845_ids);
+
+static const struct of_device_id __maybe_unused mp2845_of_match[] = {
+	{.compatible = "mps,mp2845"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2845_of_match);
+
+static struct i2c_driver mp2845_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "mp2845",
+		.of_match_table = mp2845_of_match,
+	},
+	.probe		= mp2845_probe,
+	.id_table	= mp2845_ids,
+};
+module_i2c_driver(mp2845_driver);
+
+MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net>");
+MODULE_DESCRIPTION("MP2845 driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

