Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE74446BF2
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627385; cv=none; b=hxJnkDbt00icHws12oByzrco6X9qBKQNaN3HY3Lqn6R29otPP2cxvuQb+IJYoWUFBd/uDy9DEjPI8p+J/DZRDoI6rxViK0pL7zUY0xM/YZuUxkytPqef7NIedU4HDc430k045+8ARjO7W+P9Te/fqaoHPtgJ4cwZevCmV1OUo2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627385; c=relaxed/simple;
	bh=CozGFCkyI4qr8wDw5Rq2LJfB8pM8qX1wqf+57AGDziM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1DNtz9YdRk71jiMcSmSiDuEKLt5eyVsQR9rpiIwHeCm0RJJyTD4P/MlaUp6ilhMMHjZPzkWpvuPsd5OC2Tz+LYWvFF3CrN4m2YV5IrYjyIZ4r4rJ45/uVIW1p1/B6Z+0ZCDqj+Sy2vA0r7p7b3+qmMCYzNNt8k/dQwkf1m7PjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ndlHhdQ1; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ndlHhdQ1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1c2KjxanP9oPt1/Dztdjsw6kVpMrOdEQG/Hy1Iedwc=;
	b=ndlHhdQ12k1Sxl16hrcil+odnSvw0P0wkjTByEd8Dz0frF/Fh8BTgMnExDd9xxxnGdrFEv
	CUzTSUcCQ81Qe7C8D+Unk54y8CCGTT6IlGoaLv970zfNboxDJDjDxzLh1PQCtbM43DyaUF
	lOsWqH4myhaomcAR7XgSv4W6OchRZpM=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:30 -0700
Subject: [PATCH v2 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ctl2301-v2-4-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=24939;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=CozGFCkyI4qr8wDw5Rq2LJfB8pM8qX1wqf+57AGDziM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDsWZqZf6HR3rLnmo8WrriR83be76EXpMc3ey6bFMy
 d2Cuj0dpSwMYlwMsmKKLN0PeLYV+ETZFggU+sLMYWUCGcLAxSkAE5n9leF/hZc+4+97/9IPnMoL
 jHIIX2mrvz9x9by/D77aZUuXlGnvZ2T49uW78s8kp1dsk+fPusHVqBy65dSFgjLGF5HCHdd3/OX
 mBgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
the LM63-style temperature, tachometer, and PWM register layout,
while using a 12-bit local temperature register and requiring the
ALERT/TACH pin to be configured for tachometer input.

Register an optional thermal cooling device when the device tree
node provides #cooling-cells, allowing thermal zones to control
the fan through the existing PWM path without changing behavior
for existing LM63-family users.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/hwmon/lm63.rst |  22 +++
 drivers/hwmon/Kconfig        |   8 +-
 drivers/hwmon/lm63.c         | 393 +++++++++++++++++++++++++++++++++++--------
 3 files changed, 349 insertions(+), 74 deletions(-)

diff --git a/Documentation/hwmon/lm63.rst b/Documentation/hwmon/lm63.rst
index 9e27367d7405..c40bd0dfe591 100644
--- a/Documentation/hwmon/lm63.rst
+++ b/Documentation/hwmon/lm63.rst
@@ -33,6 +33,16 @@ Supported chips:
 
 	       http://www.national.com/pf/LM/LM96163.html
 
+  * Sensylink CTF2301
+
+    Prefix: 'ctf2301'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf
+
+    Register description: https://github.com/TroyMitchell911/ctf2301-datasheet
+
 
 Author: Jean Delvare <jdelvare@suse.de>
 
@@ -62,6 +72,8 @@ value have to be masked out. The value is still 16 bit in width.
 
 All temperature values are given in degrees Celsius. Resolution is 1.0
 degree for the local temperature, 0.125 degree for the remote temperature.
+The CTF2301 local temperature input and limit have a resolution of 0.0625
+degree.
 
 The fan speed is measured using a tachometer. Contrary to most chips which
 store the value in an 8-bit register and have a selectable clock divider
@@ -93,3 +105,13 @@ support these GPIO lines at present.
 The LM96163 is an enhanced version of LM63 with improved temperature accuracy
 and better PWM resolution. For LM96163, the external temperature sensor type is
 configurable as CPU embedded diode(1) or 3904 transistor(2).
+
+The CTF2301 is register-compatible with the LM63 family and provides 12 fan
+control lookup table entries. It supports 8-bit PWM resolution when configured
+for a 22.5 kHz PWM frequency.
+
+Device tree nodes may declare ``#cooling-cells`` to register the fan controller
+with the thermal framework. The cooling state is mapped to the existing
+``pwm1`` range from 0 to 255. The driver keeps the current automatic or manual
+fan control mode during probe and switches to manual control when the thermal
+framework first requests a cooling state.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc033d59..abb1af8664fb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1501,10 +1501,10 @@ config SENSORS_LM63
 	depends on I2C
 	help
 	  If you say yes here you get support for the National
-	  Semiconductor LM63, LM64, and LM96163 remote diode digital temperature
-	  sensors with integrated fan control.  Such chips are found
-	  on the Tyan S4882 (Thunder K8QS Pro) motherboard, among
-	  others.
+	  Semiconductor LM63, LM64, LM96163, and Sensylink CTF2301
+	  remote diode digital temperature sensors with integrated fan
+	  control. Such chips are found on the Tyan S4882 (Thunder K8QS
+	  Pro) motherboard, among others.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called lm63.
diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index e2a429e579ac..764a7467afa6 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -35,13 +35,14 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/sysfs.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 
 /*
  * Addresses to scan
  * Address is fully defined internally and cannot be changed except for
  * LM64 which has one pin dedicated to address selection.
- * LM63 and LM96163 have address 0x4c.
+ * LM63, LM96163, and CTF2301 have address 0x4c.
  * LM64 can have address 0x18 or 0x4e.
  */
 
@@ -70,6 +71,9 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 #define LM63_REG_LOCAL_TEMP		0x00
 #define LM63_REG_LOCAL_HIGH		0x05
 
+#define CTF2301_REG_LOCAL_TEMP_LSB	0x15
+#define CTF2301_REG_LOCAL_HIGH_LSB	0x06
+
 #define LM63_REG_REMOTE_TEMP_MSB	0x01
 #define LM63_REG_REMOTE_TEMP_LSB	0x10
 #define LM63_REG_REMOTE_OFFSET_MSB	0x11
@@ -94,6 +98,7 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 
 #define LM63_PWM_BASE_FAST_HZ		180000
 #define LM63_PWM_BASE_SLOW_HZ		700
+#define LM63_MAX_PWM			255
 
 #define LM63_MAX_CONVRATE		9
 
@@ -121,6 +126,9 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 							    127000), 1000)
 #define TEMP8U_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), 0, \
 							    255000), 1000)
+#define TEMP12_FROM_REG(reg)	DIV_ROUND_CLOSEST((s16)(reg) * 1000, 256)
+#define TEMP12_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
+							     127937) * 256, 1000)
 #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
 #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
 							     127875), 125) * 32)
@@ -132,7 +140,11 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 #define UPDATE_INTERVAL(max, rate) \
 			((1000 << (LM63_MAX_CONVRATE - (rate))) / (max))
 
-enum chips { lm63, lm64, lm96163 };
+enum chips { lm63, lm64, lm96163, ctf2301 };
+
+static const unsigned int ctf2301_update_intervals[] = {
+	20000, 10000, 4902, 2463, 1000, 615, 307, 154, 107
+};
 
 /*
  * Client data (each client gets its own)
@@ -164,6 +176,8 @@ struct lm63_data {
 			   1: local high limit
 			   2: remote critical limit
 			   3-14: lookup table */
+	s16 temp1_input; /* local input for chips with extended resolution */
+	s16 temp1_max; /* local limit for chips with extended resolution */
 	s16 temp11[4];	/* 0: remote input
 			   1: remote low limit
 			   2: remote high limit
@@ -256,8 +270,16 @@ static struct lm63_data *lm63_update_device(struct device *dev)
 
 		data->temp8[0] = i2c_smbus_read_byte_data(client,
 				 LM63_REG_LOCAL_TEMP);
+		if (data->kind == ctf2301)
+			data->temp1_input = ((u16)(u8)data->temp8[0] << 8)
+					  | i2c_smbus_read_byte_data(client,
+						CTF2301_REG_LOCAL_TEMP_LSB);
 		data->temp8[1] = i2c_smbus_read_byte_data(client,
 				 LM63_REG_LOCAL_HIGH);
+		if (data->kind == ctf2301)
+			data->temp1_max = ((u16)(u8)data->temp8[1] << 8)
+					  | i2c_smbus_read_byte_data(client,
+						CTF2301_REG_LOCAL_HIGH_LSB);
 
 		/* order matters for temp2_input */
 		data->temp11[0] = i2c_smbus_read_byte_data(client,
@@ -277,7 +299,7 @@ static struct lm63_data *lm63_update_device(struct device *dev)
 				| i2c_smbus_read_byte_data(client,
 				  LM63_REG_REMOTE_OFFSET_LSB);
 
-		if (data->kind == lm96163)
+		if (data->kind == lm96163 || data->kind == ctf2301)
 			data->temp11u = (i2c_smbus_read_byte_data(client,
 					LM96163_REG_REMOTE_TEMP_U_MSB) << 8)
 				      | i2c_smbus_read_byte_data(client,
@@ -367,6 +389,41 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *dummy,
 	return count;
 }
 
+static int lm63_pwm_from_reg(struct lm63_data *data, u8 reg)
+{
+	if (data->pwm_highres)
+		return reg;
+
+	return reg >= 2 * data->pwm1_freq ?
+	       LM63_MAX_PWM :
+	       (reg * LM63_MAX_PWM + data->pwm1_freq) / (2 * data->pwm1_freq);
+}
+
+static u8 lm63_pwm_to_reg(struct lm63_data *data, unsigned long val)
+{
+	val = clamp_val(val, 0, LM63_MAX_PWM);
+
+	if (data->pwm_highres)
+		return val;
+
+	return (val * data->pwm1_freq * 2 + LM63_MAX_PWM / 2) / LM63_MAX_PWM;
+}
+
+static int lm63_write_pwm(struct lm63_data *data, int nr, unsigned long val)
+{
+	struct i2c_client *client = data->client;
+	u8 reg = nr ? LM63_REG_LUT_PWM(nr - 1) : LM63_REG_PWM_VALUE;
+	u8 regval = lm63_pwm_to_reg(data, val);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, reg, regval);
+	if (ret)
+		return ret;
+	data->pwm1[nr] = regval;
+
+	return 0;
+}
+
 static ssize_t show_pwm1(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
@@ -376,12 +433,7 @@ static ssize_t show_pwm1(struct device *dev, struct device_attribute *devattr,
 	int pwm;
 
 	mutex_lock(&data->update_lock);
-	if (data->pwm_highres)
-		pwm = data->pwm1[nr];
-	else
-		pwm = data->pwm1[nr] >= 2 * data->pwm1_freq ?
-		       255 : (data->pwm1[nr] * 255 + data->pwm1_freq) /
-		       (2 * data->pwm1_freq);
+	pwm = lm63_pwm_from_reg(data, data->pwm1[nr]);
 	mutex_unlock(&data->update_lock);
 
 	return sprintf(buf, "%d\n", pwm);
@@ -392,11 +444,9 @@ static ssize_t set_pwm1(struct device *dev, struct device_attribute *devattr,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm63_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	int nr = attr->index;
 	unsigned long val;
 	int err;
-	u8 reg;
 
 	if (!(data->config_fan & 0x20)) /* register is read-only */
 		return -EPERM;
@@ -405,15 +455,11 @@ static ssize_t set_pwm1(struct device *dev, struct device_attribute *devattr,
 	if (err)
 		return err;
 
-	reg = nr ? LM63_REG_LUT_PWM(nr - 1) : LM63_REG_PWM_VALUE;
-	val = clamp_val(val, 0, 255);
-
 	mutex_lock(&data->update_lock);
-	data->pwm1[nr] = data->pwm_highres ? val :
-			(val * data->pwm1_freq * 2 + 127) / 255;
-	i2c_smbus_write_byte_data(client, reg, data->pwm1[nr]);
+	err = lm63_write_pwm(data, nr, val);
 	mutex_unlock(&data->update_lock);
-	return count;
+
+	return err ? err : count;
 }
 
 static ssize_t pwm1_enable_show(struct device *dev,
@@ -486,7 +532,9 @@ static ssize_t pwm1_freq_store(struct device *dev,
 	struct lm63_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	unsigned long val, pfr_fast, pfr_slow, err_fast, err_slow, pfr;
+	u8 config_fan;
 	bool slow_clock;
+	int config_enhanced = 0;
 	int ret;
 
 	ret = kstrtoul(buf, 10, &val);
@@ -512,35 +560,55 @@ static ssize_t pwm1_freq_store(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 	ret = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
-	if (ret < 0) {
-		mutex_unlock(&data->update_lock);
-		return ret;
-	}
-	data->config_fan = ret;
+	if (ret < 0)
+		goto unlock;
+	config_fan = ret;
 
-	if (!(data->config_fan & 0x20)) { /* register is read-only */
-		mutex_unlock(&data->update_lock);
-		return -EPERM;
+	if (!(config_fan & 0x20)) { /* register is read-only */
+		ret = -EPERM;
+		goto unlock;
 	}
 
-	if (data->kind == lm96163) {
-		ret = i2c_smbus_read_byte_data(client, LM96163_REG_CONFIG_ENHANCED);
-		if (ret < 0) {
-			mutex_unlock(&data->update_lock);
-			return ret;
+	if (data->kind == lm96163 || data->kind == ctf2301) {
+		ret = i2c_smbus_read_byte_data(client,
+					       LM96163_REG_CONFIG_ENHANCED);
+		if (ret < 0)
+			goto unlock;
+		config_enhanced = ret;
+
+		if (data->kind == ctf2301) {
+			if (!slow_clock && pfr == 8)
+				config_enhanced |= 0x10;
+			else
+				config_enhanced &= ~0x10;
+			ret = i2c_smbus_write_byte_data(client,
+							LM96163_REG_CONFIG_ENHANCED,
+							config_enhanced);
+			if (ret)
+				goto unlock;
 		}
-		data->pwm_highres = !slow_clock && pfr == 8 && (ret & 0x10);
 	}
 
 	if (slow_clock)
-		data->config_fan |= 0x08;
+		config_fan |= 0x08;
 	else
-		data->config_fan &= ~0x08;
-	i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, data->config_fan);
-	i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
+		config_fan &= ~0x08;
+	ret = i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
+	if (ret)
+		goto unlock;
+	ret = i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN,
+					config_fan);
+	if (ret)
+		goto unlock;
+
+	data->config_fan = config_fan;
 	data->pwm1_freq = pfr;
+	data->pwm_highres = !slow_clock && pfr == 8 &&
+				(config_enhanced & 0x10);
+unlock:
 	mutex_unlock(&data->update_lock);
-	return count;
+
+	return ret ? ret : count;
 }
 
 /*
@@ -555,6 +623,11 @@ static ssize_t show_local_temp8(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm63_data *data = lm63_update_device(dev);
+
+	if (data->kind == ctf2301)
+		return sprintf(buf, "%d\n", TEMP12_FROM_REG(attr->index ?
+				       data->temp1_max : data->temp1_input));
+
 	return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->temp8[attr->index]));
 }
 
@@ -595,6 +668,23 @@ static ssize_t set_temp8(struct device *dev, struct device_attribute *devattr,
 		return err;
 
 	mutex_lock(&data->update_lock);
+	if (data->kind == ctf2301 && nr == 1) {
+		temp = TEMP12_TO_REG(val);
+		err = i2c_smbus_write_byte_data(client, LM63_REG_LOCAL_HIGH,
+						temp >> 8);
+		if (!err)
+			err = i2c_smbus_write_byte_data(client,
+							CTF2301_REG_LOCAL_HIGH_LSB,
+							temp & 0xf0);
+		if (!err) {
+			data->temp8[nr] = temp >> 8;
+			data->temp1_max = temp;
+		}
+		mutex_unlock(&data->update_lock);
+
+		return err ? err : count;
+	}
+
 	switch (nr) {
 	case 2:
 		reg = LM63_REG_REMOTE_TCRIT;
@@ -611,10 +701,12 @@ static ssize_t set_temp8(struct device *dev, struct device_attribute *devattr,
 		reg = LM63_REG_LUT_TEMP(nr - 3);
 		temp = lut_temp_to_reg(data, val);
 	}
-	data->temp8[nr] = temp;
-	i2c_smbus_write_byte_data(client, reg, temp);
+	err = i2c_smbus_write_byte_data(client, reg, temp);
+	if (!err)
+		data->temp8[nr] = temp;
 	mutex_unlock(&data->update_lock);
-	return count;
+
+	return err ? err : count;
 }
 
 static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
@@ -788,11 +880,40 @@ static ssize_t temp2_crit_hyst_store(struct device *dev,
  * Set conversion rate.
  * client->update_lock must be held when calling this function.
  */
-static void lm63_set_convrate(struct lm63_data *data, unsigned int interval)
+static unsigned int lm63_update_interval(struct lm63_data *data, u8 rate)
+{
+	if (data->kind == ctf2301)
+		return ctf2301_update_intervals[min_t(unsigned int, rate,
+					ARRAY_SIZE(ctf2301_update_intervals) - 1)];
+
+	return UPDATE_INTERVAL(data->max_convrate_hz, rate);
+}
+
+static int lm63_set_convrate(struct lm63_data *data, unsigned int interval)
 {
 	struct i2c_client *client = data->client;
-	unsigned int update_interval;
-	int i;
+	unsigned int update_interval, error, best_error = ~0U;
+	unsigned int best = 0;
+	unsigned int i;
+	int ret;
+
+	if (data->kind == ctf2301) {
+		for (i = 0; i < ARRAY_SIZE(ctf2301_update_intervals); i++) {
+			error = abs_diff(interval, ctf2301_update_intervals[i]);
+			if (error < best_error) {
+				best_error = error;
+				best = i;
+			}
+		}
+
+		ret = i2c_smbus_write_byte_data(client, LM63_REG_CONVRATE,
+						best);
+		if (ret)
+			return ret;
+		data->update_interval = ctf2301_update_intervals[best];
+
+		return 0;
+	}
 
 	/* Shift calculations to avoid rounding errors */
 	interval <<= 6;
@@ -804,8 +925,12 @@ static void lm63_set_convrate(struct lm63_data *data, unsigned int interval)
 		if (interval >= update_interval * 3 / 4)
 			break;
 
-	i2c_smbus_write_byte_data(client, LM63_REG_CONVRATE, i);
+	ret = i2c_smbus_write_byte_data(client, LM63_REG_CONVRATE, i);
+	if (ret)
+		return ret;
 	data->update_interval = UPDATE_INTERVAL(data->max_convrate_hz, i);
+
+	return 0;
 }
 
 static ssize_t update_interval_show(struct device *dev,
@@ -829,10 +954,10 @@ static ssize_t update_interval_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	lm63_set_convrate(data, clamp_val(val, 0, 100000));
+	err = lm63_set_convrate(data, clamp_val(val, 0, 100000));
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? err : count;
 }
 
 static ssize_t temp2_type_show(struct device *dev,
@@ -997,6 +1122,75 @@ static DEVICE_ATTR_RO(alarms);
 
 static DEVICE_ATTR_RW(update_interval);
 
+static int lm63_get_max_state(struct thermal_cooling_device *cdev,
+			      unsigned long *state)
+{
+	*state = LM63_MAX_PWM;
+
+	return 0;
+}
+
+static int lm63_get_cur_state(struct thermal_cooling_device *cdev,
+			      unsigned long *state)
+{
+	struct lm63_data *data = cdev->devdata;
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = i2c_smbus_read_byte_data(data->client, LM63_REG_PWM_VALUE);
+	if (ret < 0)
+		goto unlock;
+
+	data->pwm1[0] = ret;
+	*state = lm63_pwm_from_reg(data, data->pwm1[0]);
+unlock:
+	mutex_unlock(&data->update_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int lm63_set_cur_state(struct thermal_cooling_device *cdev,
+			      unsigned long state)
+{
+	struct lm63_data *data = cdev->devdata;
+	int config_fan;
+	int ret;
+
+	if (state > LM63_MAX_PWM)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+	config_fan = i2c_smbus_read_byte_data(data->client,
+					      LM63_REG_CONFIG_FAN);
+	if (config_fan < 0) {
+		ret = config_fan;
+		goto unlock;
+	}
+	data->config_fan = config_fan;
+
+	if (!(config_fan & 0x20)) {
+		config_fan |= 0x20;
+		ret = i2c_smbus_write_byte_data(data->client,
+						LM63_REG_CONFIG_FAN,
+						config_fan);
+		if (ret)
+			goto unlock;
+		data->config_fan = config_fan;
+	}
+
+	ret = lm63_write_pwm(data, 0, state);
+unlock:
+	mutex_unlock(&data->update_lock);
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops lm63_cooling_ops = {
+	.get_max_state = lm63_get_max_state,
+	.get_cur_state = lm63_get_cur_state,
+	.set_cur_state = lm63_set_cur_state,
+};
+
 static struct attribute *lm63_attributes[] = {
 	&sensor_dev_attr_pwm1.dev_attr.attr,
 	&dev_attr_pwm1_enable.attr,
@@ -1079,8 +1273,8 @@ static const struct attribute_group lm63_group_extra_lut = {
  * On LM63, temp2_crit can be set only once, which should be job
  * of the bootloader.
  * On LM64, temp2_crit can always be set.
- * On LM96163, temp2_crit can be set if bit 1 of the configuration
- * register is true.
+ * On LM96163 and CTF2301, temp2_crit can be set if bit 1 of the
+ * configuration register is true.
  */
 static umode_t lm63_attribute_mode(struct kobject *kobj,
 				   struct attribute *attr, int index)
@@ -1090,7 +1284,8 @@ static umode_t lm63_attribute_mode(struct kobject *kobj,
 
 	if (attr == &sensor_dev_attr_temp2_crit.dev_attr.attr
 	    && (data->kind == lm64 ||
-		(data->kind == lm96163 && (data->config & 0x02))))
+		((data->kind == lm96163 || data->kind == ctf2301) &&
+		 (data->config & 0x02))))
 		return attr->mode | S_IWUSR;
 
 	return attr->mode;
@@ -1165,29 +1360,48 @@ static int lm63_detect(struct i2c_client *client,
  * Ideally we shouldn't have to initialize anything, since the BIOS
  * should have taken care of everything
  */
-static void lm63_init_client(struct lm63_data *data)
+static int lm63_init_client(struct lm63_data *data)
 {
 	struct i2c_client *client = data->client;
 	struct device *dev = &client->dev;
 	u8 convrate;
+	int ret;
 
-	data->config = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
-	data->config_fan = i2c_smbus_read_byte_data(client,
-						    LM63_REG_CONFIG_FAN);
+	ret = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
+	if (ret < 0)
+		return ret;
+	data->config = ret;
+	ret = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
+	if (ret < 0)
+		return ret;
+	data->config_fan = ret;
 
 	/* Start converting if needed */
 	if (data->config & 0x40) { /* standby */
 		dev_dbg(dev, "Switching to operational mode\n");
 		data->config &= 0xA7;
-		i2c_smbus_write_byte_data(client, LM63_REG_CONFIG1,
-					  data->config);
+		ret = i2c_smbus_write_byte_data(client, LM63_REG_CONFIG1,
+						data->config);
+		if (ret)
+			return ret;
 	}
 	/* Tachometer is always enabled on LM64 */
 	if (data->kind == lm64)
 		data->config |= 0x04;
+	if (data->kind == ctf2301 && !client->irq && !(data->config & 0x04)) {
+		dev_dbg(dev, "Configuring ALERT/TACH pin for tachometer input\n");
+		data->config |= 0x04;
+		ret = i2c_smbus_write_byte_data(client, LM63_REG_CONFIG1,
+						data->config);
+		if (ret)
+			return ret;
+	}
 
 	/* We may need pwm1_freq before ever updating the client data */
-	data->pwm1_freq = i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
+	ret = i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
+	if (ret < 0)
+		return ret;
+	data->pwm1_freq = ret;
 	if (data->pwm1_freq == 0)
 		data->pwm1_freq = 1;
 
@@ -1200,25 +1414,38 @@ static void lm63_init_client(struct lm63_data *data)
 	case lm96163:
 		data->max_convrate_hz = LM96163_MAX_CONVRATE_HZ;
 		data->lut_size = 12;
-		data->trutherm
-		  = i2c_smbus_read_byte_data(client,
-					     LM96163_REG_TRUTHERM) & 0x02;
+		ret = i2c_smbus_read_byte_data(client, LM96163_REG_TRUTHERM);
+		if (ret < 0)
+			return ret;
+		data->trutherm = ret & 0x02;
+		break;
+	case ctf2301:
+		data->lut_size = 12;
 		break;
 	}
-	convrate = i2c_smbus_read_byte_data(client, LM63_REG_CONVRATE);
-	if (unlikely(convrate > LM63_MAX_CONVRATE))
+	ret = i2c_smbus_read_byte_data(client, LM63_REG_CONVRATE);
+	if (ret < 0)
+		return ret;
+	convrate = ret;
+	if (data->kind == ctf2301 &&
+	    convrate >= ARRAY_SIZE(ctf2301_update_intervals))
+		convrate = ARRAY_SIZE(ctf2301_update_intervals) - 1;
+	else if (unlikely(convrate > LM63_MAX_CONVRATE))
 		convrate = LM63_MAX_CONVRATE;
-	data->update_interval = UPDATE_INTERVAL(data->max_convrate_hz,
-						convrate);
+	data->update_interval = lm63_update_interval(data, convrate);
 
 	/*
-	 * For LM96163, check if high resolution PWM
+	 * For LM96163 and CTF2301, check if high resolution PWM
 	 * and unsigned temperature format is enabled.
 	 */
-	if (data->kind == lm96163) {
-		u8 config_enhanced
-		  = i2c_smbus_read_byte_data(client,
-					     LM96163_REG_CONFIG_ENHANCED);
+	if (data->kind == lm96163 || data->kind == ctf2301) {
+		u8 config_enhanced;
+
+		ret = i2c_smbus_read_byte_data(client,
+					       LM96163_REG_CONFIG_ENHANCED);
+		if (ret < 0)
+			return ret;
+		config_enhanced = ret;
 		if (config_enhanced & 0x20)
 			data->lut_temp_highres = true;
 		if ((config_enhanced & 0x10)
@@ -1239,6 +1466,8 @@ static void lm63_init_client(struct lm63_data *data)
 	dev_dbg(dev, "PWM output active %s, %s mode\n",
 		(data->config_fan & 0x10) ? "low" : "high",
 		(data->config_fan & 0x20) ? "manual" : "auto");
+
+	return 0;
 }
 
 static const struct i2c_device_id lm63_id[];
@@ -1246,9 +1475,11 @@ static const struct i2c_device_id lm63_id[];
 static int lm63_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct thermal_cooling_device *cdev;
 	struct device *hwmon_dev;
 	struct lm63_data *data;
 	int groups = 0;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct lm63_data), GFP_KERNEL);
 	if (!data)
@@ -1263,7 +1494,9 @@ static int lm63_probe(struct i2c_client *client)
 		data->temp2_offset = 16000;
 
 	/* Initialize chip */
-	lm63_init_client(data);
+	ret = lm63_init_client(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize device\n");
 
 	/* Register sysfs hooks */
 	data->groups[groups++] = &lm63_group;
@@ -1273,11 +1506,26 @@ static int lm63_probe(struct i2c_client *client)
 	if (data->kind == lm96163) {
 		data->groups[groups++] = &lm63_group_temp2_type;
 		data->groups[groups++] = &lm63_group_extra_lut;
+	} else if (data->kind == ctf2301) {
+		data->groups[groups++] = &lm63_group_extra_lut;
 	}
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, data->groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL_OF) &&
+	    of_property_present(dev->of_node, "#cooling-cells")) {
+		cdev = devm_thermal_of_cooling_device_register(dev, 0,
+							       client->name,
+							       data,
+							       &lm63_cooling_ops);
+		if (IS_ERR(cdev))
+			return PTR_ERR(cdev);
+	}
+
+	return 0;
 }
 
 /*
@@ -1288,6 +1536,7 @@ static const struct i2c_device_id lm63_id[] = {
 	{ .name = "lm63", .driver_data = lm63 },
 	{ .name = "lm64", .driver_data = lm64 },
 	{ .name = "lm96163", .driver_data = lm96163 },
+	{ .name = "ctf2301", .driver_data = ctf2301 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm63_id);
@@ -1305,6 +1554,10 @@ static const struct of_device_id __maybe_unused lm63_of_match[] = {
 		.compatible = "national,lm96163",
 		.data = (void *)lm96163
 	},
+	{
+		.compatible = "sensylink,ctf2301",
+		.data = (void *)ctf2301
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, lm63_of_match);

-- 
2.55.0

