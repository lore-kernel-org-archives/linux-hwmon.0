Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DE917591;
	Wed, 25 Dec 2024 02:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735092287; cv=none; b=qrXEUzrIxyraMmbI16Q2PfF4a3j8TeEUiV088/OZacIJs9/ZEKhyCUjOA0/JlObroy9wZRXRJMK95qFvXO71SSwgLgLpIwX6wTwkPviHzPah9Q0LIfBopgkRVy3Vii4JeMi+jImAgZpikWbg4HW+HA/3M2Lw3MHKKbiBZJHAnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735092287; c=relaxed/simple;
	bh=SQXuRWpVJ8ifcNKmZj4eDOZocOB6lprqwHwyWN5zgN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIh/66CzmEtwT3NmYeLI+gKtrD6oOEpB+bUNtKq2V8iQZl51o5wz9w6LPHiD6cNMcmSh5+NZSt7wFSeZE6KGYEav608BeaiENdVIC9U9UA9J/ikxn2Ly8TmMOoII9JstED2W1ylk2zq+Vk9tzJphVS+zVXyAi2Pz0u7FeA1OCgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RJMnEaKF; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RJMnEaKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=d4mCk
	DUf8fRY2PUMOoENaonP/z19MKIrUugV++n/oAM=; b=RJMnEaKFbQimhV1qmyZjU
	hxB96aAPUGL68zVTGkRjmP/jnmu/lad1U72mpqLYDMT9j17Y8iybKLQNUTc9zFR8
	7hFObjDz8n7RcQd4IcLRJVWcXGF/FvSUVOuIQ/VlWPDT2nGbqvjaLxDaFg+m5Vhc
	FQwM7SnPQeoLYtpwoZlTyY=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAnkVLVZ2tnHGv6BQ--.23482S4;
	Wed, 25 Dec 2024 10:03:02 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] hwmon:(ina238)Add new features for SQ52206
Date: Wed, 25 Dec 2024 10:02:56 +0800
Message-ID: <20241225020256.439990-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnkVLVZ2tnHGv6BQ--.23482S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3JryUXFy7uFW8JFWUZFyrZwb_yoWxWr4Dpa
	s3Ja4fKrWUtrZrWrsrtr47uF1rWw1xG3W5ArZ7Kw1SvF1DXr929ryUtF10va13K34UZF4U
	JF4Ut3y5Cw12yr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRAsqLUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNRvA02drYJKEVgAAsR

From: Wenliang <wenliang202407@163.com>

This patch depends on PATCH 1.
Add peak power,energy and charge detection for SQ52206.

Signed-off-by: Wenliang <wenliang202407@163.com>
---

ina238.rst:Add information of SQ52206 in ina238.rst, Add additional sysfs
entries for sq52206, include energy1_input, power1_input_highest
and charge1_input.
ina238.c: Add a 40 bit data reading function to prepare for energy and
charge reading.
Energy and charge attributes are 5bytes wide, so add call function for
charge1_input and modified the function for energy1_input to use u64.
Add HWMON_P_INPUT_HIGHEST for power.

 Documentation/hwmon/ina238.rst | 16 +++++++
 drivers/hwmon/ina238.c         | 85 +++++++++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index d9f479984420..1502b8e71c16 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -14,6 +14,12 @@ Supported chips:
     Datasheet:
 	https://www.ti.com/lit/gpn/ina238
 
+  * Silergy SQ52206
+
+    Prefix: 'SQ52206'
+
+    Addresses: I2C 0x40 - 0x4f
+
 Author: Nathan Rossi <nathan.rossi@digi.com>
 
 Description
@@ -54,3 +60,13 @@ temp1_input		Die temperature measurement (mC)
 temp1_max		Maximum die temperature threshold (mC)
 temp1_max_alarm		Maximum die temperature alarm
 ======================= =======================================================
+
+Additional sysfs entries for sq52206
+------------------------------------
+
+======================= ====================================================
+energy1_input		Energy measurement (mJ)
+
+power1_input_highest Peak Power (uW)
+
+charge1_input   Charge measurement (mC)
\ No newline at end of file
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 131f5faefdb3..e41f98656958 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -96,6 +96,8 @@
  *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
  *  (Specific for SQ52206)
  *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
+ *  Energy (mJ) = 16 * 0.24 * register value * 20000 / rshunt / 4 * gain
+ *  Charge (mC) = register value * 20000 / rshunt / 4 * gain
  */
 #define INA238_CALIBRATION_VALUE	16384
 #define INA238_FIXED_SHUNT			20000
@@ -167,7 +169,23 @@ static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 
 	return 0;
 }
+static int ina238_read_reg40(const struct i2c_client *client, u8 reg, u64 *val)
+{
+	u8 data[5];
+	u32 low;
+	int err;
 
+	/* 40-bit register read */
+	err = i2c_smbus_read_i2c_block_data(client, reg, 5, data);
+	if (err < 0)
+		return err;
+	if (err != 5)
+		return -EIO;
+	low = (data[1] << 24) | (data[2] << 16) | (data[3] << 8) | data[4];
+	*val = ((long long)data[0] << 32) | low;
+
+	return 0;
+}
 static int ina238_read_in(struct device *dev, u32 attr, int channel,
 			  long *val)
 {
@@ -348,6 +366,16 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
+	case hwmon_power_input_highest:
+		err = ina238_read_reg24(data->client, SQ52206_POWER_PEAK, &regval);
+		if (err)
+			return err;
+		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
+		power = div_u64(regval * 1200ULL * INA238_FIXED_SHUNT *
+				data->gain, 20 * data->rshunt);
+		/* Clamp value to maximum value of long */
+		*val = clamp_val(power, 0, LONG_MAX);
+		break;
 	case hwmon_power_max:
 		err = regmap_read(data->regmap, INA238_POWER_LIMIT, &regval);
 		if (err)
@@ -362,7 +390,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 					data->gain, 20 * data->rshunt);
 		else
 			power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
-					data->gain, 20 * data->rshunt);
+			       data->gain, 20 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -474,6 +502,46 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
 
+static ssize_t energy1_input_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int ret;
+	u64 val = 0;
+
+	ret = ina238_read_reg40(data->client, SQ52206_ENERGY, &val);
+	if (ret)
+		return ret;
+
+	/* result in microJoule */
+	val = div_u64(val * 96 * INA238_FIXED_SHUNT * data->gain,
+			       data->rshunt * 100);
+	/* Clamp value to maximum value of long long */
+	val = clamp_val(val, 0, LLONG_MAX);
+
+	return sprintf(buf, "%lld\n", val);
+}
+
+static ssize_t charge1_input_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int ret;
+	u64 val = 0;
+
+	ret = ina238_read_reg40(data->client, SQ52206_CHARGE, &val);
+	if (ret)
+		return ret;
+
+	/* result in microCoulombs */
+	val = div_u64(val * INA238_FIXED_SHUNT * data->gain,
+			       data->rshunt * 4);
+	/* Clamp value to maximum value of long long */
+	val = clamp_val(val, 0, LLONG_MAX);
+
+	return sprintf(buf, "%lld\n", val);
+}
+
 static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
@@ -547,6 +615,7 @@ static umode_t ina238_is_visible(const void *drvdata,
 		switch (attr) {
 		case hwmon_power_input:
 		case hwmon_power_max_alarm:
+		case hwmon_power_input_highest:
 			return 0444;
 		case hwmon_power_max:
 			return 0644;
@@ -583,7 +652,8 @@ static const struct hwmon_channel_info * const ina238_info[] = {
 			   HWMON_C_INPUT),
 	HWMON_CHANNEL_INFO(power,
 			   /* 0: power */
-			   HWMON_P_INPUT | HWMON_P_MAX | HWMON_P_MAX_ALARM),
+			   HWMON_P_INPUT | HWMON_P_MAX |
+			   HWMON_P_MAX_ALARM | HWMON_P_INPUT_HIGHEST),
 	HWMON_CHANNEL_INFO(temp,
 			   /* 0: die temperature */
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_ALARM),
@@ -601,6 +671,17 @@ static const struct hwmon_chip_info ina238_chip_info = {
 	.info = ina238_info,
 };
 
+/* energy attributes are 5bytes wide so we need u64 */
+static DEVICE_ATTR_RO(energy1_input);
+static DEVICE_ATTR_RO(charge1_input);
+
+static struct attribute *ina238_attrs[] = {
+	&dev_attr_energy1_input.attr,
+	&dev_attr_charge1_input.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ina238);
+
 /*
  * Initialize the configuration and calibration registers.
  */
-- 
2.43.0

