Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AA369999;
	Thu, 11 Jun 2026 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163870; cv=none; b=NUfMisXXas7uVyLs484MMCGP7vs6jz91EF6towK3nPwCDvivc8uX5md83DvHby45HK4HugjgFRbxqyVHwnWVY/iUGctG9V9lDytFi3J3OJmm6aJxKDo+KPPKBwNblX0T4rKzTwShOywhxY4YJUTdWR2TPd2c9q02gtC8uYvM0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163870; c=relaxed/simple;
	bh=S8lsvPjSnRoTCSNqlAYzlAGlDxRt8MO2VkDdnFhLXXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F/kGqkrLieJ+OBBUh2J0DHa0HNPj+H21lrgUeTs0t9wDJHqewgWy50skXflTKsnwkOOC7+8TJBheUAPpUqDr46Xyqq2tqhXXDVKw5W8JJv/Nc9JEjkF/Y0iQFbT2SHCPn3HWiL021OcHtpjZ9yXqkNgzFC4azRqOWtJhRM20UJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ByQJDWen; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ByQJDWen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=L9
	2kno1UbZY4BUDEzTJZsDrWfGmGq28DAeG+TuZJhGs=; b=ByQJDWenb3JaZGaomW
	WCIUcz+UkLkXcgCtA/ROBkVi6bZkutY/+rUI/5ZFApakKEn9rMfcKrqyqqdBQD7U
	U7a+ocDKzxI3zYWlfA9NxQy+SeJqKXswdisqb7B2Hm/PtijasJQpd6HqOMAoKZH6
	4RiNRzmLsVZyHyvLU0G24q9Bc=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3PvcqZypqI94RCw--.19273S4;
	Thu, 11 Jun 2026 15:43:42 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH v3 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Date: Thu, 11 Jun 2026 15:43:34 +0800
Message-Id: <20260611074335.4415-3-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611074335.4415-1-zmzhu0630@163.com>
References: <20260611074335.4415-1-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PvcqZypqI94RCw--.19273S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3uF15Ar4fXr4rCF45ZFWxtFb_yoW8GFy7Wo
	ZxWFyIq3WDJr1UCrZY9r4I9FySqF4UXw1vya13tr4qgayayF1Y9Fy3Aw4Yq3W7JF4rZw4D
	Zay0yFyFy39Fvw15n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcKZXUUUUU
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbCwA4KA2oqZy5OxQAA3F

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add PMBus hwmon support for the Silergy SQ24860 eFuse.

The driver reports input voltage, output voltage, auxiliary voltage,
input current, input power, and temperature. It also exposes peak,
average, and minimum history attributes, sample count configuration,
and maps the manufacturer-specific VIREF register to the generic input
over-current fault limit attribute.

The IMON resistor value is read from the silergy,rimon-micro-ohms device
property and used to configure the input current calibration gain.

Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
---
 drivers/hwmon/pmbus/Kconfig   |  19 ++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/sq24860.c | 430 ++++++++++++++++++++++++++++++++++
 3 files changed, 450 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/sq24860.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..a905b5af137c 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -612,6 +612,25 @@ config SENSORS_STEF48H28
 	  This driver can also be built as a module. If so, the module will
 	  be called stef48h28.
 
+config SENSORS_SQ24860
+	tristate "Silergy SQ24860"
+	help
+	  If you say yes here you get hardware monitoring support for Silergy
+	  SQ24860 eFuse.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sq24860.
+
+config SENSORS_SQ24860_REGULATOR
+	bool "Regulator support for SQ24860"
+	depends on SENSORS_SQ24860 && REGULATOR
+	default SENSORS_SQ24860
+	help
+	  If you say yes here you get regulator support for Silergy SQ24860.
+	  The regulator is registered through the PMBus regulator framework and
+	  can be used to control the output exposed by the device.
+	  This option is only useful if regulator framework support is needed.
+
 config SENSORS_STPDDC60
 	tristate "ST STPDDC60"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f..86bc93c6c091 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
 obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
+obj-$(CONFIG_SENSORS_SQ24860)	+= sq24860.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
diff --git a/drivers/hwmon/pmbus/sq24860.c b/drivers/hwmon/pmbus/sq24860.c
new file mode 100644
index 000000000000..f16f650ff7ba
--- /dev/null
+++ b/drivers/hwmon/pmbus/sq24860.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Ziming Zhu <ziming.zhu@silergycorp.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/math64.h>
+
+#include "pmbus.h"
+
+#define SQ24860_IIN_CAL_GAIN		0x38
+#define SQ24860_READ_VAUX		0xd0
+#define SQ24860_READ_VIN_MIN		0xd1
+#define SQ24860_READ_VIN_PEAK		0xd2
+#define SQ24860_READ_IIN_PEAK		0xd4
+#define SQ24860_READ_PIN_PEAK		0xd5
+#define SQ24860_READ_TEMP_AVG		0xd6
+#define SQ24860_READ_TEMP_PEAK		0xd7
+#define SQ24860_READ_VOUT_MIN		0xda
+#define SQ24860_READ_VIN_AVG		0xdc
+#define SQ24860_READ_VOUT_AVG		0xdd
+#define SQ24860_READ_IIN_AVG		0xde
+#define SQ24860_READ_PIN_AVG		0xdf
+#define SQ24860_VIREF			0xe0
+#define SQ24860_PK_MIN_AVG		0xea
+#define PK_MIN_AVG_RST_PEAK		BIT(7)
+#define PK_MIN_AVG_RST_AVG		BIT(6)
+#define PK_MIN_AVG_RST_MIN		BIT(5)
+#define PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
+#define SQ24860_MFR_WRITE_PROTECT	0xf8
+#define SQ24860_UNLOCKED		BIT(7)
+
+#define SQ24860_8B_SHIFT		2
+#define SQ24860_IIN_OCF_NUM		1000000
+#define SQ24860_IIN_OCF_DIV		129278
+#define SQ24860_IIN_OCF_OFF		165
+
+#define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
+					 PK_MIN_AVG_RST_AVG  | \
+					 PK_MIN_AVG_RST_MIN)
+#define SQ24860_MAX_SAMPLES		BIT(FIELD_MAX(PK_MIN_AVG_AVG_CNT))
+/*
+ * Arbitrary default Rimon value: 1.6kOhm
+ */
+#define SQ24860_DEFAULT_RIMON		1600000000
+#define SQ24860_GIMON			18180
+
+#define SQ24860_VAUX_DIV		20
+
+static int sq24860_write_iin_cal_gain(struct i2c_client *client, u32 rimon)
+{
+	u64 temp = 6400ULL * 1000000000ULL * 1000ULL;
+	u64 denom;
+	u64 word;
+
+	if (!rimon)
+		return -EINVAL;
+
+	denom = (u64)rimon * SQ24860_GIMON;
+	word = div64_u64(temp, denom);
+	if (!word || word > U16_MAX)
+		return -EINVAL;
+
+	return i2c_smbus_write_word_data(client, SQ24860_IIN_CAL_GAIN,
+					(u16)word);
+}
+
+static int sq24860_mfr_write_protect_set(struct i2c_client *client,
+					u8 protect)
+{
+	u8 val;
+
+	switch (protect) {
+	case 0:
+		val = 0xa2;
+		break;
+	case PB_WP_ALL:
+		val = 0x0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return pmbus_write_byte_data(client, -1, SQ24860_MFR_WRITE_PROTECT,
+				     val);
+}
+
+static int sq24860_mfr_write_protect_get(struct i2c_client *client)
+{
+	int ret = pmbus_read_byte_data(client, -1, SQ24860_MFR_WRITE_PROTECT);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret & SQ24860_UNLOCKED) ? 0 : PB_WP_ALL;
+}
+
+static int sq24860_read_word_data(struct i2c_client *client,
+				   int page, int phase, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_VIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_VIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_VIN_MIN:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_VIN_MIN);
+		break;
+
+	case PMBUS_VIRT_READ_VIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_VIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_VOUT_MIN:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_VOUT_MIN);
+		break;
+
+	case PMBUS_VIRT_READ_VOUT_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_VOUT_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_IIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_IIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_IIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_IIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_TEMP_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_TEMP_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_TEMP_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_TEMP_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_PIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_PIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_PIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_PIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_VMON:
+		ret = pmbus_read_word_data(client, page, phase,
+					   SQ24860_READ_VAUX);
+		if (ret < 0)
+			break;
+		ret = DIV_ROUND_CLOSEST(ret, SQ24860_VAUX_DIV);
+		break;
+
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		/*
+		 * These registers provide an 8 bits value instead of a
+		 * 10bits one. Just shifting twice the register value is
+		 * enough to make the sensor type conversion work, even
+		 * if the datasheet provides different m, b and R for
+		 * those.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			break;
+		ret <<= SQ24860_8B_SHIFT;
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		/*
+		 * VIREF directly sets the over-current limit at which the eFuse
+		 * will turn the FET off and trigger a fault. Expose it through
+		 * this generic property instead of a manufacturer specific one.
+		 */
+		ret = pmbus_read_byte_data(client, page, SQ24860_VIREF);
+		if (ret < 0)
+			break;
+		ret = DIV_ROUND_CLOSEST(ret * SQ24860_IIN_OCF_NUM,
+					SQ24860_IIN_OCF_DIV);
+		ret += SQ24860_IIN_OCF_OFF;
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		ret = pmbus_read_byte_data(client, page, SQ24860_PK_MIN_AVG);
+		if (ret < 0)
+			break;
+		ret = BIT(FIELD_GET(PK_MIN_AVG_AVG_CNT, ret));
+		break;
+
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		ret = 0;
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int sq24860_write_word_data(struct i2c_client *client,
+				    int page, int reg, u16 value)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		value >>= SQ24860_8B_SHIFT;
+		value = clamp_val(value, 0, 0xff);
+		ret = pmbus_write_word_data(client, page, reg, value);
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		if (value < SQ24860_IIN_OCF_OFF)
+			return -EINVAL;
+		value -= SQ24860_IIN_OCF_OFF;
+		value = DIV_ROUND_CLOSEST(((unsigned int)value) * SQ24860_IIN_OCF_DIV,
+					  SQ24860_IIN_OCF_NUM);
+		value = clamp_val(value, 0, 0x3f);
+		ret = pmbus_write_byte_data(client, page, SQ24860_VIREF, value);
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		value = clamp_val(value, 1, SQ24860_MAX_SAMPLES);
+		value = ilog2(value);
+		ret = pmbus_update_byte_data(client, page, SQ24860_PK_MIN_AVG,
+					     PK_MIN_AVG_AVG_CNT,
+					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
+		break;
+
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		/*
+		 * SQ24860 has history resets based on MIN/AVG/PEAK instead of per
+		 * sensor type. Exposing this quirk in hwmon is not desirable so
+		 * reset MIN, AVG and PEAK together. Even is there effectively only
+		 * one reset, which resets everything, expose the 5 entries so
+		 * userspace is not required map a sensor type to another to trigger
+		 * a reset
+		 */
+		ret = pmbus_update_byte_data(client, 0, SQ24860_PK_MIN_AVG,
+					     PK_MIN_AVG_RST_MASK,
+					     PK_MIN_AVG_RST_MASK);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int sq24860_read_byte_data(struct i2c_client *client,
+				   int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_WRITE_PROTECT:
+		ret = sq24860_mfr_write_protect_get(client);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int sq24860_write_byte_data(struct i2c_client *client,
+				    int page, int reg, u8 byte)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_WRITE_PROTECT:
+		ret = sq24860_mfr_write_protect_set(client, byte);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_SENSORS_SQ24860_REGULATOR)
+static const struct regulator_desc sq24860_reg_desc[] = {
+	PMBUS_REGULATOR_ONE_NODE("vout"),
+};
+#endif
+
+static const struct pmbus_driver_info sq24860_base_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_VOLTAGE_IN] = 64,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.m[PSC_VOLTAGE_OUT] = 64,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+/*
+ * Current and power measurements depend on the calibration gain
+ * programmed from the board-specific IMON resistor value.
+ */
+	.format[PSC_CURRENT_IN] = direct,
+	.m[PSC_CURRENT_IN] = 16,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 2,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.func[0] = PMBUS_HAVE_VIN |
+		   PMBUS_HAVE_VOUT |
+		   PMBUS_HAVE_VMON |
+		   PMBUS_HAVE_IIN |
+		   PMBUS_HAVE_PIN |
+		   PMBUS_HAVE_TEMP |
+		   PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_SAMPLES,
+	.read_word_data = sq24860_read_word_data,
+	.write_word_data = sq24860_write_word_data,
+	.read_byte_data = sq24860_read_byte_data,
+	.write_byte_data = sq24860_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_SQ24860_REGULATOR)
+	.reg_desc = sq24860_reg_desc,
+	.num_regulators = ARRAY_SIZE(sq24860_reg_desc),
+#endif
+};
+
+static const struct i2c_device_id sq24860_i2c_id[] = {
+	{ "sq24860" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sq24860_i2c_id);
+
+static const struct of_device_id sq24860_of_match[] = {
+	{ .compatible = "silergy,sq24860" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sq24860_of_match);
+
+static int sq24860_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	u32 rimon;
+	int ret;
+
+	if (device_property_read_u32(dev, "silergy,rimon-micro-ohms", &rimon))
+		rimon = SQ24860_DEFAULT_RIMON;
+	ret = sq24860_write_iin_cal_gain(client, rimon);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+					     "Failed to set gain\n");
+	info = devm_kmemdup(dev, &sq24860_base_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, info);
+}
+
+static struct i2c_driver sq24860_driver = {
+	.driver = {
+		.name = "sq24860",
+		.of_match_table = sq24860_of_match,
+	},
+	.probe = sq24860_probe,
+	.id_table = sq24860_i2c_id,
+};
+module_i2c_driver(sq24860_driver);
+
+MODULE_AUTHOR("Ziming Zhu <ziming.zhu@silergycorp.com>");
+MODULE_DESCRIPTION("PMBUS driver for SQ24860 eFuse");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.25.1

