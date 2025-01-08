Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315901B0433;
	Wed,  8 Jan 2025 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324783; cv=none; b=rkYAW7wAFftMuMQTpYb/MZXAcnHqCq49TK2BuoFNjOv0E/M3SOkMAEFioklgKAZ6YGPte8bDD6K9TNnMRbrjKBw25NQlltdSbSLvdfrFythPHrMNzPPfI11yuTrq/6zAyUDW5Stwik3SPa/0+xQ9ouReU9KgtvaVo7rY5FpAXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324783; c=relaxed/simple;
	bh=ZukFbVRijDYOIz/mvmZrDFov2e1yeYsY8vXpRq3T4bQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiaUPUKKbDYtbtqbpldoFWBpCRG7f44I3InYnloQySZ7QqQfd9KJThT6XsbR46HJyEyopLhT4UvIBW9jd0W77TsyK8g+NbTX7IZXaXS1P8IC5eUEmYGzUT0stgqZEEeNO/FAa5qjnF8myp9m+bqrwuHK1wG6YBL7OZ1c+LY2Pvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fR+m10Di; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fR+m10Di"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5087u6oW006016;
	Wed, 8 Jan 2025 03:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=x7y8N
	YBwvSfAFQlXvrHh6PN2IpZtqKRGW16XGIH9k4Q=; b=fR+m10DizlRODNQPY2JO9
	jnYrUSmH6Kb851IgEiZyp8EatBl/FexPNqoniZe0hnj4MOf1KOyuNS9PrpKwfFls
	dFg+NN0NljrAwHitye3wszsiG3c683eOTWKizKtGrbaIh8jfn+Vj7qzg9hbn2eTA
	W4wPSagUbpzOorM6y1EHw0G9fLV/iMptxiIey/u7VCvQbDGIjzdLpqkuPyHAgjVh
	5C5IYbDEuYb63TnEvPM7H19t1tPsmIk7hXkdTh4oRtIaZgkhrGJvRo46mNdeJTOe
	LFeJ8RytS70uDyfCiV8S4C+Q4ukPStZr9lrYWwSdhC0uDg+RbyYordCtWAhpssLZ
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 441ndj03vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 03:26:04 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5088Q3Rq037244
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 03:26:03 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 8 Jan 2025 03:26:03 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 8 Jan 2025 03:26:03 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 8 Jan 2025 03:26:03 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.6])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5088PfdQ026945;
	Wed, 8 Jan 2025 03:25:58 -0500
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/3] hwmon: (max31827) add max31875 support
Date: Wed, 8 Jan 2025 16:25:31 +0800
Message-ID: <20250108082531.15467-4-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
References: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mC0QLgk9PRWtWPrFMsTVVXDcJBu8M_kV
X-Proofpoint-ORIG-GUID: mC0QLgk9PRWtWPrFMsTVVXDcJBu8M_kV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080067

Add support for max31875 which is similar to max31827 and other chips
of the series.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/hwmon/max31827.rst |  40 ++-
 drivers/hwmon/max31827.c         | 506 +++++++++++++++++++++++++++++--
 2 files changed, 516 insertions(+), 30 deletions(-)

diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
index 6cc5088b2..f8468cb0b 100644
--- a/Documentation/hwmon/max31827.rst
+++ b/Documentation/hwmon/max31827.rst
@@ -29,9 +29,18 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+  * Maxim MAX31875
+
+    Prefix: 'max31875'
+
+    Addresses scanned: I2C 0x48 - 0x4f
+
+    Datasheet: Publicly available at the Analog Devices website
+
 
 Authors:
 	- Daniel Matyas <daniel.matyas@analog.com>
+	- John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
 
 Description
 -----------
@@ -45,13 +54,20 @@ configured to operate in the same manner with 1 write operation to the
 configuration register. From here on, we will refer to all these chips as
 MAX31827.
 
-MAX31827 implements a temperature sensor with a 6 WLP packaging scheme. This
-sensor measures the temperature of the chip itself.
+This driver also supports the MAX31875. Its fault queue is set to 1 and it has
+no alarm polarity.
+
+MAX31827 implements a temperature sensor with a 6 WLP packaging scheme while
+MAX31875 has a 4 WLP packaging scheme. This sensor measures the temperature of
+the chip itself.
 
 MAX31827 has low and over temperature alarms with an effective value and a
 hysteresis value: -40 and -30 degrees for under temperature alarm and +100 and
 +90 degrees for over temperature alarm.
 
+MAX31875 has only an over temperature alarm with an effective value and a
+hysteresis value: +80 and +75 degrees.
+
 The alarm can be configured in comparator and interrupt mode from the
 devicetree. In Comparator mode, the OT/UT status bits have a value of 1 when the
 temperature rises above the TH value or falls below TL, which is also subject to
@@ -75,7 +91,8 @@ it is recommended to perform a read of the configuration/status register to
 clear the status bits before changing the operating mode.
 
 The conversions can be manual with the one-shot functionality and automatic with
-a set frequency. When powered on, the chip measures temperatures with 1 conv/s.
+a set frequency. When powered on, the MAX31827 measures temperatures with 1
+conv/s while the MAX31875 measures temperatures with 0.25 conv/s or 1 conv/4s.
 The conversion rate can be modified with update_interval attribute of the chip.
 Conversion/second = 1/update_interval. Thus, the available options according to
 the data sheet are:
@@ -83,11 +100,13 @@ the data sheet are:
 - 64000 (ms) = 1 conv/64 sec
 - 32000 (ms) = 1 conv/32 sec
 - 16000 (ms) = 1 conv/16 sec
-- 4000 (ms) = 1 conv/4 sec
-- 1000 (ms) = 1 conv/sec (default)
+- 4000 (ms) = 1 conv/4 sec (MAX31875 default)
+- 1000 (ms) = 1 conv/sec (MAX31827 default)
 - 250 (ms) = 4 conv/sec
 - 125 (ms) = 8 conv/sec
 
+The MAX31875 only supports the last four values above.
+
 Enabling the device when it is already enabled has the side effect of setting
 the conversion frequency to 1 conv/s. The conversion time varies depending on
 the resolution.
@@ -97,16 +116,16 @@ available resolutions are:
 
 - 8 bit -> 8.75 ms conversion time
 - 9 bit -> 17.5 ms conversion time
-- 10 bit -> 35 ms conversion time
-- 12 bit (default) -> 140 ms conversion time
+- 10 bit (MAX31875 default) -> 35 ms conversion time
+- 12 bit (MAX31827 default) -> 140 ms conversion time
 
 There is a temp1_resolution attribute which indicates the unit change in the
 input temperature in milli-degrees C.
 
 - 1000 mC -> 8 bit
 - 500 mC -> 9 bit
-- 250 mC -> 10 bit
-- 62 mC -> 12 bit (default) - actually this is 62.5, but the fil returns 62
+- 250 mC -> 10 bit (MAX31875 default)
+- 62 mC -> 12 bit (MAX31827 default) - actually this is 62.5, but the fil returns 62
 
 When chip is in shutdown mode and a read operation is requested, one-shot is
 triggered, the device waits for <conversion time> ms, and only after that is
@@ -125,7 +144,8 @@ Bus timeout resets the I2C-compatible interface when SCL is low for more than
 
 Alarm polarity determines if the active state of the alarm is low or high. The
 behavior for both settings is dependent on the Fault Queue setting. The ALARM
-pin is an open-drain output and requires a pullup resistor to operate.
+pin is an open-drain output and requires a pullup resistor to operate. The
+MAX31875 does not have this feature.
 
 The Fault Queue bits select how many consecutive temperature faults must occur
 before overtemperature or undertemperature faults are indicated in the
diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 5d319d401..0c6211e03 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -22,6 +22,10 @@
 #define MAX31827_TH_HYST_REG		0x8
 #define MAX31827_TL_HYST_REG		0xA
 
+#define MAX31875_CONFIGURATION_REG	0x1
+#define MAX31875_TH_HYST_REG		0x2
+#define MAX31875_TH_REG			0x3
+
 #define MAX31827_CONFIGURATION_1SHOT_MASK	BIT(0)
 #define MAX31827_CONFIGURATION_CNV_RATE_MASK	GENMASK(3, 1)
 #define MAX31827_CONFIGURATION_PEC_EN_MASK	BIT(4)
@@ -33,6 +37,13 @@
 #define MAX31827_CONFIGURATION_U_TEMP_STAT_MASK	BIT(14)
 #define MAX31827_CONFIGURATION_O_TEMP_STAT_MASK	BIT(15)
 
+#define MAX31875_CONFIGURATION_CNV_RATE_MASK	GENMASK(2, 1)
+#define MAX31875_CONFIGURATION_PEC_EN_MASK	BIT(3)
+#define MAX31875_CONFIGURATION_TIMEOUT_MASK	BIT(4)
+#define MAX31875_CONFIGURATION_RESOLUTION_MASK	GENMASK(6, 5)
+#define MAX31875_CONFIGURATION_SHUTDOWN_MASK	BIT(8)
+#define MAX31875_CONFIGURATION_FLT_Q_MASK	GENMASK(12, 11)
+
 #define MAX31827_ALRM_POL_LOW	0x0
 #define MAX31827_ALRM_POL_HIGH	0x1
 #define MAX31827_FLT_Q_1	0x0
@@ -47,6 +58,10 @@
 #define MAX31827_M_DGR_TO_16_BIT(x)	(((x) << 4) / 1000)
 #define MAX31827_DEVICE_ENABLE(x)	((x) ? 0xA : 0x0)
 
+#define MAX31875_16_BIT_TO_M_DGR(x)	(sign_extend32(x, 15) * 1000 / 256)
+#define MAX31875_M_DGR_TO_16_BIT(x)	(((x) << 8) / 1000)
+#define MAX31875_DEVICE_ENABLE(x) \
+	FIELD_PREP(MAX31875_CONFIGURATION_SHUTDOWN_MASK, !(x))
 
 enum max31827_cnv {
 	MAX31827_CNV_1_DIV_64_HZ = 1,
@@ -58,6 +73,13 @@ enum max31827_cnv {
 	MAX31827_CNV_8_HZ,
 };
 
+enum max31875_cnv {
+	MAX31875_CNV_1_DIV_4_HZ,
+	MAX31875_CNV_1_HZ,
+	MAX31875_CNV_4_HZ,
+	MAX31875_CNV_8_HZ,
+};
+
 static const u16 max31827_conversions[] = {
 	[MAX31827_CNV_1_DIV_64_HZ] = 64000,
 	[MAX31827_CNV_1_DIV_32_HZ] = 32000,
@@ -68,6 +90,13 @@ static const u16 max31827_conversions[] = {
 	[MAX31827_CNV_8_HZ] = 125,
 };
 
+static const u16 max31875_conversions[] = {
+	[MAX31875_CNV_1_DIV_4_HZ] = 4000,
+	[MAX31875_CNV_1_HZ] = 1000,
+	[MAX31875_CNV_4_HZ] = 250,
+	[MAX31875_CNV_8_HZ] = 125,
+};
+
 enum max31827_resolution {
 	MAX31827_RES_8_BIT = 0,
 	MAX31827_RES_9_BIT,
@@ -98,6 +127,15 @@ static const struct max31827_chip_info max31875;
 struct max31827_chip_info {
 	u8 alarm_pol_default;
 	u32 fault_q_default;
+	const struct regmap_config *regmap;
+	const struct hwmon_chip_info *hwmon_chip_info;
+	int (*init_client)(struct max31827_state *st, struct device *dev);
+	ssize_t (*show_resolution)(struct max31827_state *st,
+				   struct device_attribute *devattr,
+				   char *buf);
+	ssize_t (*store_resolution)(struct max31827_state *st,
+				    struct device_attribute *devattr,
+				    const char *buf, size_t count);
 };
 
 struct max31827_state {
@@ -118,8 +156,14 @@ static const struct regmap_config max31827_regmap = {
 	.max_register = 0xA,
 };
 
-static int shutdown_write(struct max31827_state *st, unsigned int reg,
-			  unsigned int mask, unsigned int val)
+static const struct regmap_config max31875_regmap = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = 0x3,
+};
+
+static int max31827_shutdown_write(struct max31827_state *st, unsigned int reg,
+				   unsigned int mask, unsigned int val)
 {
 	unsigned int cfg;
 	unsigned int cnv_rate;
@@ -171,12 +215,68 @@ static int shutdown_write(struct max31827_state *st, unsigned int reg,
 	return ret;
 }
 
-static int write_alarm_val(struct max31827_state *st, unsigned int reg,
-			   long val)
+static int max31875_shutdown_write(struct max31827_state *st, unsigned int reg,
+				   unsigned int mask, unsigned int val)
+{
+	int ret;
+
+	/*
+	 * Before the Temperature Threshold Alarm, Alarm Hysteresis Threshold
+	 * and Resolution bits from Configuration register are changed over I2C,
+	 * the part must be in shutdown mode.
+	 *
+	 * Mutex is used to ensure, that some other process doesn't change the
+	 * configuration register.
+	 */
+	mutex_lock(&st->lock);
+
+	if (!st->enable) {
+		if (!mask)
+			ret = regmap_write(st->regmap, reg, val);
+		else
+			ret = regmap_update_bits(st->regmap, reg, mask, val);
+		goto unlock;
+	}
+
+	ret = regmap_update_bits(st->regmap, MAX31875_CONFIGURATION_REG,
+				 MAX31875_CONFIGURATION_SHUTDOWN_MASK,
+				 FIELD_PREP(MAX31875_CONFIGURATION_SHUTDOWN_MASK,
+					    1));
+	if (ret)
+		goto unlock;
+
+	if (!mask)
+		ret = regmap_write(st->regmap, reg, val);
+	else
+		ret = regmap_update_bits(st->regmap, reg, mask, val);
+
+	if (ret)
+		goto unlock;
+
+	ret = regmap_update_bits(st->regmap, MAX31875_CONFIGURATION_REG,
+				 MAX31875_CONFIGURATION_SHUTDOWN_MASK,
+				 FIELD_PREP(MAX31875_CONFIGURATION_SHUTDOWN_MASK,
+					    0));
+
+unlock:
+	mutex_unlock(&st->lock);
+	return ret;
+}
+
+static int max31827_write_alarm_val(struct max31827_state *st, unsigned int reg,
+				    long val)
 {
 	val = MAX31827_M_DGR_TO_16_BIT(val);
 
-	return shutdown_write(st, reg, 0, val);
+	return max31827_shutdown_write(st, reg, 0, val);
+}
+
+static int max31875_write_alarm_val(struct max31827_state *st, unsigned int reg,
+				    long val)
+{
+	val = MAX31875_M_DGR_TO_16_BIT(val);
+
+	return max31875_shutdown_write(st, reg, 0, val);
 }
 
 static umode_t max31827_is_visible(const void *state,
@@ -344,6 +444,119 @@ static int max31827_read(struct device *dev, enum hwmon_sensor_types type,
 	return ret;
 }
 
+static int max31875_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct max31827_state *st = dev_get_drvdata(dev);
+	unsigned int uval;
+	int ret = 0;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_enable:
+			ret = regmap_read(st->regmap,
+					  MAX31875_CONFIGURATION_REG, &uval);
+			if (ret)
+				break;
+
+			uval = FIELD_GET(MAX31875_CONFIGURATION_SHUTDOWN_MASK,
+					 uval);
+			*val = !uval;
+
+			break;
+		case hwmon_temp_input:
+			mutex_lock(&st->lock);
+
+			if (!st->enable) {
+				/*
+				 * This operation requires mutex protection,
+				 * because the chip configuration should not
+				 * be changed during the conversion process.
+				 */
+
+				ret = regmap_update_bits(st->regmap,
+							 MAX31875_CONFIGURATION_REG,
+							 MAX31827_CONFIGURATION_1SHOT_MASK,
+							 1);
+				if (ret) {
+					mutex_unlock(&st->lock);
+					return ret;
+				}
+				msleep(max31827_conv_times[st->resolution]);
+			}
+
+			/*
+			 * For 12-bit resolution the conversion time is 140 ms,
+			 * thus an additional 15 ms is needed to complete the
+			 * conversion: 125 ms + 15 ms = 140 ms
+			 */
+			if (max31827_resolutions[st->resolution] == 12 &&
+			    st->update_interval == 125)
+				usleep_range(15000, 20000);
+
+			ret = regmap_read(st->regmap, MAX31827_T_REG, &uval);
+
+			mutex_unlock(&st->lock);
+
+			if (ret)
+				break;
+
+			*val = MAX31875_16_BIT_TO_M_DGR(uval);
+
+			break;
+		case hwmon_temp_max:
+			ret = regmap_read(st->regmap, MAX31875_TH_REG, &uval);
+			if (ret)
+				break;
+
+			*val = MAX31875_16_BIT_TO_M_DGR(uval);
+			break;
+		case hwmon_temp_max_hyst:
+			ret = regmap_read(st->regmap, MAX31875_TH_HYST_REG,
+					  &uval);
+			if (ret)
+				break;
+
+			*val = MAX31875_16_BIT_TO_M_DGR(uval);
+			break;
+		case hwmon_temp_max_alarm:
+			ret = regmap_read(st->regmap,
+					  MAX31875_CONFIGURATION_REG, &uval);
+			if (ret)
+				break;
+
+			*val = FIELD_GET(MAX31827_CONFIGURATION_O_TEMP_STAT_MASK,
+					 uval);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+
+		break;
+
+	case hwmon_chip:
+		if (attr == hwmon_chip_update_interval) {
+			ret = regmap_read(st->regmap,
+					  MAX31827_CONFIGURATION_REG, &uval);
+			if (ret)
+				break;
+
+			uval = FIELD_GET(MAX31827_CONFIGURATION_CNV_RATE_MASK,
+					 uval);
+			*val = max31827_conversions[uval];
+		}
+		break;
+
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
 static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
 			  u32 attr, int channel, long val)
 {
@@ -378,16 +591,16 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
 			return ret;
 
 		case hwmon_temp_max:
-			return write_alarm_val(st, MAX31827_TH_REG, val);
+			return max31827_write_alarm_val(st, MAX31827_TH_REG, val);
 
 		case hwmon_temp_max_hyst:
-			return write_alarm_val(st, MAX31827_TH_HYST_REG, val);
+			return max31827_write_alarm_val(st, MAX31827_TH_HYST_REG, val);
 
 		case hwmon_temp_min:
-			return write_alarm_val(st, MAX31827_TL_REG, val);
+			return max31827_write_alarm_val(st, MAX31827_TL_REG, val);
 
 		case hwmon_temp_min_hyst:
-			return write_alarm_val(st, MAX31827_TL_HYST_REG, val);
+			return max31827_write_alarm_val(st, MAX31827_TL_HYST_REG, val);
 
 		default:
 			return -EOPNOTSUPP;
@@ -437,11 +650,94 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static ssize_t temp1_resolution_show(struct device *dev,
-				     struct device_attribute *devattr,
-				     char *buf)
+static int max31875_write(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long val)
 {
 	struct max31827_state *st = dev_get_drvdata(dev);
+	int res = 0;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_enable:
+			if (val >> 1)
+				return -EOPNOTSUPP;
+
+			mutex_lock(&st->lock);
+			/**
+			 * The chip should not be enabled while a conversion is
+			 * performed. Neither should the chip be enabled when
+			 * the alarm values are changed.
+			 */
+
+			st->enable = val;
+
+			ret = regmap_update_bits(st->regmap,
+						 MAX31875_CONFIGURATION_REG,
+						 MAX31875_CONFIGURATION_SHUTDOWN_MASK,
+						 MAX31875_DEVICE_ENABLE(val));
+
+			mutex_unlock(&st->lock);
+
+			return ret;
+
+		case hwmon_temp_max:
+			return max31875_write_alarm_val(st, MAX31875_TH_REG, val);
+
+		case hwmon_temp_max_hyst:
+			return max31875_write_alarm_val(st, MAX31875_TH_HYST_REG, val);
+
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			if (!st->enable)
+				return -EOPNOTSUPP;
+
+			/*
+			 * Convert the desired conversion rate into register
+			 * bits. res is already initialized with 0.
+			 *
+			 * This was inspired by lm73 driver.
+			 */
+			while (res < ARRAY_SIZE(max31875_conversions) &&
+			       val < max31875_conversions[res])
+				res++;
+
+			if (res == ARRAY_SIZE(max31875_conversions))
+				res = ARRAY_SIZE(max31875_conversions) - 1;
+
+			res = FIELD_PREP(MAX31875_CONFIGURATION_CNV_RATE_MASK,
+					 res);
+
+			ret = regmap_update_bits(st->regmap,
+						 MAX31875_CONFIGURATION_REG,
+						 MAX31875_CONFIGURATION_CNV_RATE_MASK,
+						 res);
+			if (ret)
+				return ret;
+
+			st->update_interval = val;
+			return 0;
+		case hwmon_chip_pec:
+			return regmap_update_bits(st->regmap, MAX31875_CONFIGURATION_REG,
+						  MAX31875_CONFIGURATION_PEC_EN_MASK,
+						  val ? MAX31875_CONFIGURATION_PEC_EN_MASK : 0);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static ssize_t max31827_temp1_resolution_show(struct max31827_state *st,
+					struct device_attribute *devattr,
+					char *buf)
+{
 	unsigned int val;
 	int ret;
 
@@ -454,11 +750,26 @@ static ssize_t temp1_resolution_show(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%u\n", max31827_resolutions[val]);
 }
 
-static ssize_t temp1_resolution_store(struct device *dev,
-				      struct device_attribute *devattr,
-				      const char *buf, size_t count)
+static ssize_t max31875_temp1_resolution_show(struct max31827_state *st,
+					struct device_attribute *devattr,
+					char *buf)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, MAX31875_CONFIGURATION_REG, &val);
+	if (ret)
+		return ret;
+
+	val = FIELD_GET(MAX31875_CONFIGURATION_RESOLUTION_MASK, val);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", max31827_resolutions[val]);
+}
+
+static ssize_t max31827_temp1_resolution_store(struct max31827_state *st,
+					struct device_attribute *devattr,
+					const char *buf, size_t count)
 {
-	struct max31827_state *st = dev_get_drvdata(dev);
 	unsigned int idx = 0;
 	unsigned int val;
 	int ret;
@@ -482,7 +793,7 @@ static ssize_t temp1_resolution_store(struct device *dev,
 
 	st->resolution = idx;
 
-	ret = shutdown_write(st, MAX31827_CONFIGURATION_REG,
+	ret = max31827_shutdown_write(st, MAX31827_CONFIGURATION_REG,
 			     MAX31827_CONFIGURATION_RESOLUTION_MASK,
 			     FIELD_PREP(MAX31827_CONFIGURATION_RESOLUTION_MASK,
 					idx));
@@ -490,6 +801,59 @@ static ssize_t temp1_resolution_store(struct device *dev,
 	return ret ? ret : count;
 }
 
+static ssize_t max31875_temp1_resolution_store(struct max31827_state *st,
+					struct device_attribute *devattr,
+					const char *buf, size_t count)
+{
+	unsigned int idx = 0;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Convert the desired resolution into register
+	 * bits. idx is already initialized with 0.
+	 *
+	 * This was inspired by lm73 driver.
+	 */
+	while (idx < ARRAY_SIZE(max31827_resolutions) &&
+	       val < max31827_resolutions[idx])
+		idx++;
+
+	if (idx == ARRAY_SIZE(max31827_resolutions))
+		idx = ARRAY_SIZE(max31827_resolutions) - 1;
+
+	st->resolution = idx;
+
+	ret = max31875_shutdown_write(st, MAX31875_CONFIGURATION_REG,
+			     MAX31875_CONFIGURATION_RESOLUTION_MASK,
+			     FIELD_PREP(MAX31875_CONFIGURATION_RESOLUTION_MASK,
+					idx));
+
+	return ret ? ret : count;
+}
+
+static ssize_t temp1_resolution_show(struct device *dev,
+				     struct device_attribute *devattr,
+				     char *buf)
+{
+	struct max31827_state *st = dev_get_drvdata(dev);
+
+	return st->chip_info->show_resolution(st, devattr, buf);
+}
+
+static ssize_t temp1_resolution_store(struct device *dev,
+				      struct device_attribute *devattr,
+				      const char *buf, size_t count)
+{
+	struct max31827_state *st = dev_get_drvdata(dev);
+
+	return st->chip_info->store_resolution(st, devattr, buf, count);
+}
+
 static DEVICE_ATTR_RW(temp1_resolution);
 
 static struct attribute *max31827_attrs[] = {
@@ -502,6 +866,7 @@ static const struct i2c_device_id max31827_i2c_ids[] = {
 	{ "max31827", (kernel_ulong_t)&max31827 },
 	{ "max31828", (kernel_ulong_t)&max31828 },
 	{ "max31829", (kernel_ulong_t)&max31829 },
+	{ "max31875", (kernel_ulong_t)&max31875 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
@@ -570,6 +935,59 @@ static int max31827_init_client(struct max31827_state *st,
 	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
 }
 
+static int max31875_init_client(struct max31827_state *st,
+				struct device *dev)
+{
+	struct fwnode_handle *fwnode;
+	unsigned int res = 0;
+	u32 data;
+	bool prop;
+	int ret;
+
+	fwnode = dev_fwnode(dev);
+
+	st->enable = true;
+	res |= MAX31875_DEVICE_ENABLE(1);
+
+	res |= MAX31875_CONFIGURATION_RESOLUTION_MASK;
+
+	prop = fwnode_property_read_bool(fwnode, "adi,comp-int");
+	res |= FIELD_PREP(MAX31827_CONFIGURATION_COMP_INT_MASK, prop);
+
+	prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
+	res |= FIELD_PREP(MAX31875_CONFIGURATION_TIMEOUT_MASK, !prop);
+
+	if (fwnode_property_present(fwnode, "adi,fault-q")) {
+		ret = fwnode_property_read_u32(fwnode, "adi,fault-q", &data);
+		if (ret)
+			return ret;
+
+		/*
+		 * Convert the desired fault queue into register bits.
+		 */
+		switch (data) {
+		case 1:
+		case 2:
+		case 4:
+		case 6:
+			res |= FIELD_PREP(MAX31875_CONFIGURATION_FLT_Q_MASK,
+					  data >> 1);
+			break;
+		default:
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid data in adi,fault-q\n");
+		}
+	} else {
+		/*
+		 * Set default value.
+		 */
+		res |= FIELD_PREP(MAX31875_CONFIGURATION_FLT_Q_MASK,
+				  st->chip_info->fault_q_default);
+	}
+
+	return regmap_write(st->regmap, MAX31875_CONFIGURATION_REG, res);
+}
+
 static const struct hwmon_channel_info *max31827_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_ENABLE | HWMON_T_INPUT | HWMON_T_MIN |
 					 HWMON_T_MIN_HYST | HWMON_T_MIN_ALARM |
@@ -579,6 +997,14 @@ static const struct hwmon_channel_info *max31827_info[] = {
 	NULL,
 };
 
+static const struct hwmon_channel_info *max31875_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_ENABLE | HWMON_T_INPUT |
+					 HWMON_T_MAX | HWMON_T_MAX_HYST |
+					 HWMON_T_MAX_ALARM),
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL | HWMON_C_PEC),
+	NULL,
+};
+
 static const struct hwmon_ops max31827_hwmon_ops = {
 	.is_visible = max31827_is_visible,
 	.read = max31827_read,
@@ -590,18 +1016,54 @@ static const struct hwmon_chip_info max31827_hwmon_chip_info = {
 	.info = max31827_info,
 };
 
+static const struct hwmon_ops max31875_hwmon_ops = {
+	.is_visible = max31827_is_visible,
+	.read = max31875_read,
+	.write = max31875_write,
+};
+
+static const struct hwmon_chip_info max31875_hwmon_chip_info = {
+	.ops = &max31875_hwmon_ops,
+	.info = max31875_info,
+};
+
 static const struct max31827_chip_info max31827 = {
 	.alarm_pol_default = MAX31827_ALRM_POL_LOW,
 	.fault_q_default = MAX31827_FLT_Q_1,
+	.regmap = &max31827_regmap,
+	.hwmon_chip_info = &max31827_hwmon_chip_info,
+	.init_client = max31827_init_client,
+	.show_resolution = max31827_temp1_resolution_show,
+	.store_resolution = max31827_temp1_resolution_store,
 };
 
 static const struct max31827_chip_info max31828 = {
 	.alarm_pol_default = MAX31827_ALRM_POL_LOW,
 	.fault_q_default = MAX31827_FLT_Q_4,
+	.regmap = &max31827_regmap,
+	.hwmon_chip_info = &max31827_hwmon_chip_info,
+	.init_client = max31827_init_client,
+	.show_resolution = max31827_temp1_resolution_show,
+	.store_resolution = max31827_temp1_resolution_store,
+};
 
 static const struct max31827_chip_info max31829 = {
 	.alarm_pol_default = MAX31827_ALRM_POL_HIGH,
 	.fault_q_default = MAX31827_FLT_Q_4,
+	.regmap = &max31827_regmap,
+	.hwmon_chip_info = &max31827_hwmon_chip_info,
+	.init_client = max31827_init_client,
+	.show_resolution = max31827_temp1_resolution_show,
+	.store_resolution = max31827_temp1_resolution_store,
+};
+
+static const struct max31827_chip_info max31875 = {
+	.fault_q_default = MAX31827_FLT_Q_1,
+	.regmap = &max31875_regmap,
+	.hwmon_chip_info = &max31875_hwmon_chip_info,
+	.init_client = max31875_init_client,
+	.show_resolution = max31875_temp1_resolution_show,
+	.store_resolution = max31875_temp1_resolution_store,
 };
 
 static int max31827_probe(struct i2c_client *client)
@@ -624,7 +1086,7 @@ static int max31827_probe(struct i2c_client *client)
 
 	mutex_init(&st->lock);
 
-	st->regmap = devm_regmap_init_i2c(client, &max31827_regmap);
+	st->regmap = devm_regmap_init_i2c(client, st->chip_info->regmap);
 	if (IS_ERR(st->regmap))
 		return dev_err_probe(dev, PTR_ERR(st->regmap),
 				     "Failed to allocate regmap.\n");
@@ -633,12 +1095,12 @@ static int max31827_probe(struct i2c_client *client)
 	if (err)
 		return dev_err_probe(dev, err, "failed to enable regulator\n");
 
-	err = max31827_init_client(st, dev);
+	err = st->chip_info->init_client(st, dev);
 	if (err)
 		return err;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, st,
-							 &max31827_hwmon_chip_info,
+							 st->chip_info->hwmon_chip_info,
 							 max31827_groups);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
@@ -657,6 +1119,10 @@ static const struct of_device_id max31827_of_match[] = {
 		.compatible = "adi,max31829",
 		.data = &max31829
 	},
+	{
+		.compatible = "adi,max31875",
+		.data = &max31875
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max31827_of_match);
-- 
2.34.1

