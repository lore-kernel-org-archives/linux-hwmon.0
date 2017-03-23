Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:49691 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754175AbdCWAjR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2017 20:39:17 -0400
From: Peter Huewe <peterhuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH 3/4] w83627ehf: Minor readability fixes
Date: Thu, 23 Mar 2017 01:40:26 +0100
Message-Id: <20170323004027.20982-3-peterhuewe@gmx.de>
In-Reply-To: <20170323004027.20982-1-peterhuewe@gmx.de>
References: <20170323004027.20982-1-peterhuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

just some cosmetics for better readability, proposed by Lindent/checkpatch

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/hwmon/w83627ehf.c | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index b0eac8e35cc5..dbe5735963ac 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -404,6 +404,7 @@ div_from_reg(u8 reg)
 static const u16 scale_in_common[10] = {
 	800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 800
 };
+
 static const u16 scale_in_w83627uhg[9] = {
 	800, 800, 3328, 3424, 800, 800, 0, 3328, 3400
 };
@@ -426,7 +427,6 @@ struct w83627ehf_sio_data {
 	enum kinds kind;
 };
 
-
 struct w83627ehf_data {
 	int addr;	/* IO base of hw monitor block */
 	const char *name;
@@ -526,6 +526,7 @@ struct w83627ehf_data {
 static inline void w83627ehf_set_bank(struct w83627ehf_data *data, u16 reg)
 {
 	u8 bank = reg >> 8;
+
 	if (data->bank != bank) {
 		outb_p(W83627EHF_REG_BANK, data->addr + ADDR_REG_OFFSET);
 		outb_p(bank, data->addr + DATA_REG_OFFSET);
@@ -543,8 +544,7 @@ static u16 w83627ehf_read_value(struct w83627ehf_data *data, u16 reg)
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
 	res = inb_p(data->addr + DATA_REG_OFFSET);
 	if (word_sized) {
-		outb_p((reg & 0xff) + 1,
-		       data->addr + ADDR_REG_OFFSET);
+		outb_p((reg & 0xff) + 1, data->addr + ADDR_REG_OFFSET);
 		res = (res << 8) + inb_p(data->addr + DATA_REG_OFFSET);
 	}
 
@@ -563,8 +563,7 @@ static int w83627ehf_write_value(struct w83627ehf_data *data, u16 reg,
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
 	if (word_sized) {
 		outb_p(value >> 8, data->addr + DATA_REG_OFFSET);
-		outb_p((reg & 0xff) + 1,
-		       data->addr + ADDR_REG_OFFSET);
+		outb_p((reg & 0xff) + 1, data->addr + ADDR_REG_OFFSET);
 	}
 	outb_p(value & 0xff, data->addr + DATA_REG_OFFSET);
 
@@ -584,8 +583,7 @@ static u16 w83627ehf_read_temp(struct w83627ehf_data *data, u16 reg)
 	return res;
 }
 
-static int w83627ehf_write_temp(struct w83627ehf_data *data, u16 reg,
-				       u16 value)
+static int w83627ehf_write_temp(struct w83627ehf_data *data, u16 reg, u16 value)
 {
 	if (!is_word_sized(reg))
 		value >>= 8;
@@ -694,7 +692,7 @@ static void nct6775_update_fan_div(struct w83627ehf_data *data)
 	data->fan_div[1] = (i & 0x70) >> 4;
 	i = w83627ehf_read_value(data, NCT6775_REG_FANDIV2);
 	data->fan_div[2] = i & 0x7;
-	if (data->has_fan & (1<<3))
+	if (data->has_fan & (1 << 3))
 		data->fan_div[3] = (i & 0x70) >> 4;
 }
 
@@ -931,9 +929,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 	return data;
 }
 
-
-static void
-store_fan_min(struct device *dev, u32 channel, unsigned long val)
+static void store_fan_min(struct device *dev, u32 channel, unsigned long val)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	int nr = channel;
@@ -1010,10 +1006,8 @@ store_fan_min(struct device *dev, u32 channel, unsigned long val)
 		data->last_updated = jiffies;
 	}
 done:
-	w83627ehf_write_value(data, data->REG_FAN_MIN[nr],
-			      data->fan_min[nr]);
+	w83627ehf_write_value(data, data->REG_FAN_MIN[nr], data->fan_min[nr]);
 	mutex_unlock(&data->update_lock);
-
 }
 
 #define show_tol_temp(reg) \
@@ -1032,7 +1026,7 @@ show_tol_temp(target_temp)
 
 static ssize_t
 store_target_temp(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+		  const char *buf, size_t count)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
@@ -1055,7 +1049,7 @@ store_target_temp(struct device *dev, struct device_attribute *attr,
 
 static ssize_t
 store_tolerance(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+		const char *buf, size_t count)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	struct w83627ehf_sio_data *sio_data = data->sio_data;
@@ -1239,11 +1233,11 @@ static ssize_t
 cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
+
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 static DEVICE_ATTR_RO(cpu0_vid);
 
-
 /* Case open detection */
 
 static ssize_t
@@ -1320,8 +1314,7 @@ static inline void w83627ehf_init_device(struct w83627ehf_data *data,
 	/* Start monitoring is needed */
 	tmp = w83627ehf_read_value(data, W83627EHF_REG_CONFIG);
 	if (!(tmp & 0x01))
-		w83627ehf_write_value(data, W83627EHF_REG_CONFIG,
-				      tmp | 0x01);
+		w83627ehf_write_value(data, W83627EHF_REG_CONFIG, tmp | 0x01);
 
 	/* Enable temperature sensors if needed */
 	for (i = 0; i < NUM_REG_TEMP; i++) {
@@ -1329,8 +1322,7 @@ static inline void w83627ehf_init_device(struct w83627ehf_data *data,
 			continue;
 		if (!data->reg_temp_config[i])
 			continue;
-		tmp = w83627ehf_read_value(data,
-					   data->reg_temp_config[i]);
+		tmp = w83627ehf_read_value(data, data->reg_temp_config[i]);
 		if (tmp & 0x01)
 			w83627ehf_write_value(data,
 					      data->reg_temp_config[i],
@@ -1371,8 +1363,7 @@ static inline void w83627ehf_init_device(struct w83627ehf_data *data,
 	}
 }
 
-static void w82627ehf_swap_tempreg(struct w83627ehf_data *data,
-				   int r1, int r2)
+static void w82627ehf_swap_tempreg(struct w83627ehf_data *data, int r1, int r2)
 {
 	swap(data->temp_src[r1], data->temp_src[r2]);
 	swap(data->reg_temp[r1], data->reg_temp[r2]);
@@ -1381,8 +1372,7 @@ static void w82627ehf_swap_tempreg(struct w83627ehf_data *data,
 	swap(data->reg_temp_config[r1], data->reg_temp_config[r2]);
 }
 
-static void
-w83627ehf_set_temp_reg_ehf(struct w83627ehf_data *data, int n_temp)
+static void w83627ehf_set_temp_reg_ehf(struct w83627ehf_data *data, int n_temp)
 {
 	int i;
 
@@ -2455,7 +2445,6 @@ static int w83627ehf_probe(struct platform_device *pdev)
 			    &sda_sf3_arrays_fan4[i].dev_attr.attr;
 		}
 
-
 	for (i = 0; i < 5; i++) {
 		if (data->has_fan & (1 << i)) {
 			if (i < data->pwm_num) {
-- 
2.10.2

