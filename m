Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888ABCCA489
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jul 2022 12:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiGZM3l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 08:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbiGZM3k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 08:29:40 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273582AE0A
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 05:29:39 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q9GFWK013518;
        Tue, 26 Jul 2022 08:29:23 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hgdw63ejn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jul 2022 08:29:23 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26QCTMXA037211
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 Jul 2022 08:29:22 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 26 Jul 2022 08:29:21 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 26 Jul 2022 08:29:21 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 26 Jul 2022 08:29:21 -0400
Received: from euswvd-wpr-708.reddog.microsoft.com ([10.140.226.204])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26QCTBdb026912;
        Tue, 26 Jul 2022 08:29:16 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-hwmon@vger.kernel.org>,
        Nurettin Bolucu <Nurettin.Bolucu@analog.com>
Subject: [PATCH v2 1/2] drivers: hwmon: Add max31760 fan speed controller driver
Date:   Tue, 26 Jul 2022 12:28:56 +0000
Message-ID: <20220726122857.116-2-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726122857.116-1-Ibrahim.Tilki@analog.com>
References: <20220726122857.116-1-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: h5UWWRKAXcpEOsQnF4nJ5N4VvSqF_lOn
X-Proofpoint-ORIG-GUID: h5UWWRKAXcpEOsQnF4nJ5N4VvSqF_lOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260047
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

MAX31760 is a presicion fan speed controller with nonvolatile lookup table.
Device has one internal and one external temperature sensor support.
Controls two fans and measures their speeds.
Generates hardware alerts when programmable max and critical temperatures are exceeded.

Driver creates following sysfs attributes for configuring lookup table:
pwm1_auto_point[1-48]_{pwm,temp,temp_hyst}

Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Reviewed-by: Nurettin Bolucu <Nurettin.Bolucu@analog.com>
---
 drivers/hwmon/Kconfig    |  10 +
 drivers/hwmon/Makefile   |   1 +
 drivers/hwmon/max31760.c | 608 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 619 insertions(+)
 create mode 100644 drivers/hwmon/max31760.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 590d3d550..59cc44a5c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1065,6 +1065,16 @@ config SENSORS_MAX31730
 	  This driver can also be built as a module. If so, the module
 	  will be called max31730.
 
+config SENSORS_MAX31760
+	tristate "MAX31760 fan speed controller"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Support for the Analog Devices MAX31760 Fan Speed Controller.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called max31760.
+
 config SENSORS_MAX6620
 	tristate "Maxim MAX6620 fan controller"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 007e829d1..1c0fa4dd8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -140,6 +140,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
 obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
 obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
 obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
+obj-$(CONFIG_SENSORS_MAX31760)  += max31760.o
 obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
 obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
 obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
new file mode 100644
index 000000000..191cdd076
--- /dev/null
+++ b/drivers/hwmon/max31760.c
@@ -0,0 +1,608 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/util_macros.h>
+
+#define REG_CR1		0x00
+#define CR1_HYST	BIT(5)
+#define CR1_DRV		GENMASK(4, 3)
+#define CR1_TEMP_SRC	GENMASK(1, 0)
+#define REG_CR2		0x01
+#define CR2_STBY	BIT(7)
+#define CR2_ALERTS	BIT(6)
+#define CR2_DFC		BIT(0)
+#define REG_CR3		0x02
+#define REG_PWMR	0x50
+#define REG_PWMV	0x51
+#define REG_STATUS	0x5A
+#define STATUS_ALARM_CRIT(ch)	BIT(2 + 2 * (ch))
+#define STATUS_ALARM_MAX(ch)	BIT(3 + 2 * (ch))
+#define STATUS_RDFA		BIT(6)
+
+#define REG_TACH(ch)		(0x52 + (ch) * 2)
+#define REG_TEMP_INPUT(ch)	(0x56 + (ch) * 2)
+#define REG_TEMP_MAX(ch)	(0x06 + (ch) * 2)
+#define REG_TEMP_CRIT(ch)	(0x0A + (ch) * 2)
+
+#define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
+#define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
+							     127875), 125) * 32)
+
+#define LUT_SIZE	48
+#define LUT_PWM		0
+#define LUT_TEMP	1
+#define LUT_HYST	2
+
+#define REG_LUT(index)		(0x20 + (index))
+
+struct max31760_state {
+	struct regmap *regmap;
+
+	struct lut_attribute {
+		char name[32];
+		struct sensor_device_attribute_2 sda;
+	} lut[LUT_SIZE][3];
+
+	struct attribute *attrs[LUT_SIZE * 3 + 1];
+	struct attribute_group group;
+	const struct attribute_group *groups[2];
+};
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x5B
+};
+
+static const int max31760_pwm_freq[] = {33, 150, 1500, 25000};
+
+static int tach_to_rpm(int tach)
+{
+	return 60 * 100000 / tach / 2;
+}
+
+static int max31760_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct max31760_state *state = dev_get_drvdata(dev);
+	unsigned int regval;
+	unsigned int reg_temp;
+	s16 temp;
+	u8 reg[2];
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_fault:
+			ret = regmap_read(state->regmap, REG_STATUS, &regval);
+			if (ret)
+				return ret;
+
+			*val = FIELD_GET(STATUS_RDFA, regval);
+
+			return 0;
+		case hwmon_temp_max_alarm:
+			ret = regmap_read(state->regmap, REG_STATUS, &regval);
+			if (ret)
+				return ret;
+
+			if (channel)
+				*val = FIELD_GET(STATUS_ALARM_MAX(1), regval);
+			else
+				*val = FIELD_GET(STATUS_ALARM_MAX(0), regval);
+
+			return 0;
+		case hwmon_temp_crit_alarm:
+			ret = regmap_read(state->regmap, REG_STATUS, &regval);
+			if (ret)
+				return ret;
+
+			if (channel)
+				*val = FIELD_GET(STATUS_ALARM_CRIT(1), regval);
+			else
+				*val = FIELD_GET(STATUS_ALARM_CRIT(0), regval);
+
+			return 0;
+		case hwmon_temp_input:
+			reg_temp = REG_TEMP_INPUT(channel);
+			break;
+		case hwmon_temp_max:
+			reg_temp = REG_TEMP_MAX(channel);
+			break;
+		case hwmon_temp_crit:
+			reg_temp = REG_TEMP_CRIT(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		ret = regmap_bulk_read(state->regmap, reg_temp, reg, 2);
+		if (ret)
+			return ret;
+
+		temp = (reg[0] << 8) | reg[1];
+
+		*val = TEMP11_FROM_REG(temp);
+
+		return 0;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret = regmap_bulk_read(state->regmap, REG_TACH(channel), reg, 2);
+			if (ret)
+				return ret;
+
+			*val = tach_to_rpm(reg[0] * 256 + reg[1]);
+
+			return 0;
+		case hwmon_fan_fault:
+			ret = regmap_read(state->regmap, REG_STATUS, &regval);
+			if (ret)
+				return ret;
+
+			if (channel)
+				*val = FIELD_GET(BIT(1), regval);
+			else
+				*val = FIELD_GET(BIT(0), regval);
+
+			return 0;
+		case hwmon_fan_enable:
+			ret = regmap_read(state->regmap, REG_CR3, &regval);
+			if (ret)
+				return ret;
+
+			if (channel)
+				*val = FIELD_GET(BIT(1), regval);
+			else
+				*val = FIELD_GET(BIT(0), regval);
+
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret = regmap_read(state->regmap, REG_PWMV, &regval);
+			if (ret)
+				return ret;
+
+			*val = regval;
+
+			return 0;
+		case hwmon_pwm_freq:
+			ret = regmap_read(state->regmap, REG_CR1, &regval);
+			if (ret)
+				return ret;
+
+			regval = FIELD_GET(CR1_DRV, regval);
+			if (regval >= ARRAY_SIZE(max31760_pwm_freq))
+				return -EINVAL;
+
+			*val = max31760_pwm_freq[regval];
+
+			return 0;
+		case hwmon_pwm_enable:
+			ret = regmap_read(state->regmap, REG_CR2, &regval);
+			if (ret)
+				return ret;
+
+			*val = 2 - FIELD_GET(CR2_DFC, regval);
+
+			return 0;
+		case hwmon_pwm_auto_channels_temp:
+			ret = regmap_read(state->regmap, REG_CR1, &regval);
+			if (ret)
+				return ret;
+
+			switch (FIELD_GET(CR1_TEMP_SRC, regval)) {
+			case 0:
+				*val = 2;
+				break;
+			case 1:
+				*val = 1;
+				break;
+			case 2:
+			case 3:
+				*val = 3;
+				break;
+			default:
+				return -EINVAL;
+			}
+
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int max31760_write(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long val)
+{
+	struct max31760_state *state = dev_get_drvdata(dev);
+	int ret;
+	unsigned int pwm_index;
+	unsigned int reg_temp;
+	int temp;
+	u8 reg_val[2];
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max:
+			reg_temp = REG_TEMP_MAX(channel);
+			break;
+		case hwmon_temp_crit:
+			reg_temp = REG_TEMP_CRIT(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		temp = TEMP11_TO_REG(val);
+		reg_val[0] = temp >> 8;
+		reg_val[1] = temp & 0xFF;
+
+		/* Ensure alert output is in comparator mode */
+		ret = regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
+		if (ret)
+			return ret;
+
+		return regmap_bulk_write(state->regmap, reg_temp, reg_val, 2);
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_enable:
+			if (val == 0)
+				return regmap_clear_bits(state->regmap, REG_CR3, BIT(channel));
+
+			if (val == 1)
+				return regmap_set_bits(state->regmap, REG_CR3, BIT(channel));
+
+			return -EOPNOTSUPP;
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			if (val < 0 || val > 255)
+				return -EINVAL;
+
+			return regmap_write(state->regmap, REG_PWMR, val);
+		case hwmon_pwm_enable:
+			if (val == 1)
+				return regmap_set_bits(state->regmap, REG_CR2, CR2_DFC);
+
+			if (val == 2)
+				return regmap_clear_bits(state->regmap, REG_CR2, CR2_DFC);
+
+			return -EOPNOTSUPP;
+		case hwmon_pwm_freq:
+			pwm_index = find_closest(val, max31760_pwm_freq,
+						 ARRAY_SIZE(max31760_pwm_freq));
+
+			return regmap_update_bits(state->regmap,
+						  REG_CR1, CR1_DRV,
+						  FIELD_PREP(CR1_DRV, pwm_index));
+		case hwmon_pwm_auto_channels_temp:
+			switch (val) {
+			case 1:
+				break;
+			case 2:
+				val = 0;
+				break;
+			case 3:
+				val = 2;
+				break;
+			default:
+				return -EINVAL;
+			}
+
+			return regmap_update_bits(state->regmap, REG_CR1, CR1_TEMP_SRC, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info *max31760_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_ENABLE | HWMON_PWM_FREQ | HWMON_PWM_INPUT |
+			   HWMON_PWM_AUTO_CHANNELS_TEMP),
+	NULL
+};
+
+static umode_t max31760_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_crit_alarm:
+		case hwmon_temp_fault:
+		case hwmon_temp_label:
+			return 0444;
+		case hwmon_temp_max:
+		case hwmon_temp_crit:
+			return 0644;
+		default:
+			return 0;
+		}
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_fault:
+			return 0444;
+		case hwmon_fan_enable:
+			return 0644;
+		default:
+			return 0;
+		}
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_enable:
+		case hwmon_pwm_input:
+		case hwmon_pwm_freq:
+		case hwmon_pwm_auto_channels_temp:
+			return 0644;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
+
+int max31760_read_string(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr != hwmon_temp_label)
+			return -EOPNOTSUPP;
+
+		*str = channel ? "local" : "remote";
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops max31760_hwmon_ops = {
+	.is_visible = max31760_is_visible,
+	.read = max31760_read,
+	.write = max31760_write,
+	.read_string = max31760_read_string
+};
+
+static const struct hwmon_chip_info max31760_chip_info = {
+	.ops = &max31760_hwmon_ops,
+	.info = max31760_info,
+};
+
+static ssize_t lut_show(struct device *dev,
+			struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute_2 *sda = to_sensor_dev_attr_2(devattr);
+	struct max31760_state *state = dev_get_drvdata(dev);
+	int ret;
+	int temp;
+	unsigned int regval;
+
+	switch (sda->nr) {
+	case LUT_PWM:
+		ret = regmap_read(state->regmap, REG_LUT(sda->index), &regval);
+		if (ret)
+			return ret;
+
+		return sprintf(buf, "%d\n", regval);
+	case LUT_TEMP:
+		temp = 18;
+		break;
+	case LUT_HYST:
+		ret = regmap_read(state->regmap, REG_CR1, &regval);
+		if (ret)
+			return ret;
+
+		temp = 16 - 2 * FIELD_GET(CR1_HYST, regval);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return sprintf(buf, "%d\n", (temp + 2 * sda->index) * 1000);
+}
+
+static ssize_t lut_store(struct device *dev,
+			 struct device_attribute *devattr,
+			 const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sda = to_sensor_dev_attr_2(devattr);
+	struct max31760_state *state = dev_get_drvdata(dev);
+	unsigned int pwm, hyst, temp;
+	int ret;
+
+	switch (sda->nr) {
+	case LUT_PWM:
+		ret = kstrtou32(buf, 10, &pwm);
+		if (ret)
+			return ret;
+
+		if (pwm > 255)
+			return -EINVAL;
+
+		ret = regmap_write(state->regmap, REG_LUT(sda->index), pwm);
+		if (ret)
+			return ret;
+
+		break;
+	case LUT_HYST:
+		ret = kstrtou32(buf, 10, &hyst);
+		if (ret)
+			return ret;
+
+		temp = (18 + 2 * sda->index) * 1000;
+		/* LUT Hysteresis is either 2 or 4 degrees */
+		if (temp > hyst + 3000)
+			ret = regmap_set_bits(state->regmap, REG_CR1, CR1_HYST);
+		else
+			ret = regmap_clear_bits(state->regmap, REG_CR1, CR1_HYST);
+
+		if (ret)
+			return ret;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static void max31760_create_lut_nodes(struct max31760_state *state)
+{
+	int i, nr;
+	struct sensor_device_attribute_2 *sda;
+	struct lut_attribute *lut;
+
+	for (i = 0; i < LUT_SIZE; ++i) {
+		for (nr = 0; nr < 3; ++nr) {
+			lut = &state->lut[i][nr];
+			sda = &lut->sda;
+
+			switch (nr) {
+			case LUT_PWM:
+				snprintf(lut->name, sizeof(lut->name),
+					 "pwm1_auto_point%d_pwm", i + 1);
+				sda->dev_attr.attr.mode = 0644;
+				break;
+			case LUT_TEMP:
+				snprintf(lut->name, sizeof(lut->name),
+					 "pwm1_auto_point%d_temp", i + 1);
+				sda->dev_attr.attr.mode = 0444;
+				break;
+			case LUT_HYST:
+				snprintf(lut->name, sizeof(lut->name),
+					 "pwm1_auto_point%d_temp_hyst", i + 1);
+				sda->dev_attr.attr.mode = 0644;
+				break;
+			}
+
+			sda->index = i;
+			sda->nr = nr;
+			sda->dev_attr.show = lut_show;
+			sda->dev_attr.store = lut_store;
+			sda->dev_attr.attr.name = lut->name;
+
+			sysfs_attr_init(&sda->dev_attr.attr);
+
+			state->attrs[i * 3 + nr] = &sda->dev_attr.attr;
+		}
+	}
+
+	state->group.attrs = state->attrs;
+	state->groups[0] = &state->group;
+}
+
+static int max31760_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max31760_state *state;
+	struct device *hwmon_dev;
+
+	state = devm_kzalloc(dev, sizeof(struct max31760_state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(state->regmap))
+		return dev_err_probe(dev,
+				     PTR_ERR(state->regmap),
+				     "regmap initialization failed\n");
+
+	dev_set_drvdata(dev, state);
+
+	/* Set alert output to comparator mode */
+	regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
+
+	max31760_create_lut_nodes(state);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 state,
+							 &max31760_chip_info,
+							 state->groups);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id max31760_of_match[] = {
+	{.compatible = "adi,max31760"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max31760_of_match);
+
+static const struct i2c_device_id max31760_id[] = {
+	{"max31760"},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max31760_id);
+
+static int __maybe_unused max31760_suspend(struct device *dev)
+{
+	struct max31760_state *state = dev_get_drvdata(dev);
+
+	return regmap_set_bits(state->regmap, REG_CR2, CR2_STBY);
+}
+
+static int __maybe_unused max31760_resume(struct device *dev)
+{
+	struct max31760_state *state = dev_get_drvdata(dev);
+
+	return regmap_clear_bits(state->regmap, REG_CR2, CR2_STBY);
+}
+
+static SIMPLE_DEV_PM_OPS(max31760_pm_ops, max31760_suspend, max31760_resume);
+
+static struct i2c_driver max31760_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "max31760",
+		.of_match_table = of_match_ptr(max31760_of_match),
+		.pm = pm_ptr(&max31760_pm_ops)
+	},
+	.probe_new	= max31760_probe,
+	.id_table	= max31760_id
+};
+module_i2c_driver(max31760_driver);
+
+MODULE_AUTHOR("Ibrahim Tilki <Ibrahim.Tilki@analog.com>");
+MODULE_DESCRIPTION("Analog Devices MAX31760 Fan Speed Controller");
+MODULE_SOFTDEP("pre: regmap_i2c");
+MODULE_VERSION("1.0");
+MODULE_LICENSE("GPL");
-- 
2.36.1

