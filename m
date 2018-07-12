Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:8773 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387724AbeGLBMj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 21:12:39 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 4/5] hwmon: adt7475: Change to use adt7475_write macro
Date: Thu, 12 Jul 2018 10:04:49 +0900
Message-Id: <20180712010450.10586-5-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

As same with adt7475_read it is better to use adt7475_write macro.
So change to use it instead of i2c_smbus_write_byte_data.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index bad250729e99..31a12ac405ef 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -133,6 +133,10 @@
 
 #define adt7475_read(reg) i2c_smbus_read_byte_data(client, (reg))
 
+/* Macro to write the registers */
+
+#define adt7475_write(reg, val) i2c_smbus_write_byte_data(client, (reg), (val))
+
 /* Macros to easily index the registers */
 
 #define TACH_REG(idx) (REG_TACH_BASE + ((idx) * 2))
@@ -322,11 +326,11 @@ static int adt7475_write_word(struct i2c_client *client, int reg, u16 val)
 {
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, reg + 1, val >> 8);
+	ret = adt7475_write(reg + 1, val >> 8);
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_byte_data(client, reg, val & 0xFF);
+	ret = adt7475_write(reg, val & 0xFF);
 	if (ret < 0)
 		return ret;
 
@@ -381,7 +385,7 @@ static ssize_t set_voltage(struct device *dev, struct device_attribute *attr,
 			reg = REG_VTT_MAX;
 	}
 
-	i2c_smbus_write_byte_data(client, reg,
+	adt7475_write(reg,
 				  data->voltage[sattr->nr][sattr->index] >> 2);
 	mutex_unlock(&data->lock);
 
@@ -534,7 +538,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 		break;
 	}
 
-	i2c_smbus_write_byte_data(client, reg, out);
+	adt7475_write(reg, out);
 
 	mutex_unlock(&data->lock);
 	return count;
@@ -615,7 +619,7 @@ static ssize_t set_temp_st(struct device *dev, struct device_attribute *attr,
 	data->enh_acoustics[idx] &= ~(0xf << shift);
 	data->enh_acoustics[idx] |= (val << shift);
 
-	i2c_smbus_write_byte_data(client, reg, data->enh_acoustics[idx]);
+	adt7475_write(reg, data->enh_acoustics[idx]);
 
 	mutex_unlock(&data->lock);
 
@@ -683,7 +687,7 @@ static ssize_t set_point2(struct device *dev, struct device_attribute *attr,
 	data->range[sattr->index] &= ~0xF0;
 	data->range[sattr->index] |= val << 4;
 
-	i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(sattr->index),
+	adt7475_write(TEMP_TRANGE_REG(sattr->index),
 				  data->range[sattr->index]);
 
 	mutex_unlock(&data->lock);
@@ -798,7 +802,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	}
 
 	data->pwm[sattr->nr][sattr->index] = clamp_val(val, 0, 0xFF);
-	i2c_smbus_write_byte_data(client, reg,
+	adt7475_write(reg,
 				  data->pwm[sattr->nr][sattr->index]);
 	mutex_unlock(&data->lock);
 
@@ -835,7 +839,7 @@ static ssize_t set_stall_disable(struct device *dev,
 	if (val)
 		data->enh_acoustics[0] |= mask;
 
-	i2c_smbus_write_byte_data(client, REG_ENHANCE_ACOUSTICS1,
+	adt7475_write(REG_ENHANCE_ACOUSTICS1,
 				  data->enh_acoustics[0]);
 
 	mutex_unlock(&data->lock);
@@ -894,7 +898,7 @@ static int hw_set_pwm(struct i2c_client *client, int index,
 	data->pwm[CONTROL][index] &= ~0xE0;
 	data->pwm[CONTROL][index] |= (val & 7) << 5;
 
-	i2c_smbus_write_byte_data(client, PWM_CONFIG_REG(index),
+	adt7475_write(PWM_CONFIG_REG(index),
 				  data->pwm[CONTROL][index]);
 
 	return 0;
@@ -983,7 +987,7 @@ static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
 	data->range[sattr->index] &= ~0xf;
 	data->range[sattr->index] |= out;
 
-	i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(sattr->index),
+	adt7475_write(TEMP_TRANGE_REG(sattr->index),
 				  data->range[sattr->index]);
 
 	mutex_unlock(&data->lock);
@@ -1017,7 +1021,7 @@ static ssize_t pwm_use_point2_pwm_at_crit_store(struct device *dev,
 		data->config4 |= CONFIG4_MAXDUTY;
 	else
 		data->config4 &= ~CONFIG4_MAXDUTY;
-	i2c_smbus_write_byte_data(client, REG_CONFIG4, data->config4);
+	adt7475_write(REG_CONFIG4, data->config4);
 	mutex_unlock(&data->lock);
 
 	return count;
@@ -1642,10 +1646,10 @@ static void adt7475_read_pwm(struct i2c_client *client, int index)
 		data->pwm[CONTROL][index] &= ~0xE0;
 		data->pwm[CONTROL][index] |= (7 << 5);
 
-		i2c_smbus_write_byte_data(client, PWM_CONFIG_REG(index),
+		adt7475_write(PWM_CONFIG_REG(index),
 					  data->pwm[INPUT][index]);
 
-		i2c_smbus_write_byte_data(client, PWM_CONFIG_REG(index),
+		adt7475_write(PWM_CONFIG_REG(index),
 					  data->pwm[CONTROL][index]);
 
 		data->pwmctl[index] = 1;
-- 
2.16.1

