Return-Path: <SRS0=GWx2=ZQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3117C432C0
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Nov 2019 20:39:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B7702068F
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Nov 2019 20:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="WrKg8akE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfKXUjY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Nov 2019 15:39:24 -0500
Received: from mx.treblig.org ([46.43.15.161]:40784 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbfKXUjX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Nov 2019 15:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KLAPDEBqWzE+pPnuvUd7X9IvRbTgGZY/919t3HP5IiE=; b=WrKg8akE1hLTr9vprGQoz0W21n
        dVtwtsvP8ELKQSpC8ajLY6j23mWR0+EnPeW2ZlznlHcxn5sGQ54CmxnsazNtQH5HAyzvnxdtr+gvp
        Jthz5YVxJ9HMDzIzdvWL7rsnNEqPfIBLKC2UH+RhIX4Y1TdwwN9UWiid061fI5+X+hBx2kwhfAKPP
        pEUH3f2xNxcaAXP266KkuejD0+a9aKxasL/NYDWsUAoBxZ5FMc2bR8ZkWNblOVO4y0jTLAH3qk13t
        Tx3NRMz4jAOb1KAJDD+2t+Zdvkf7YBbaNgeUf6ed+cgDaJIKgANQgKzOcwlZ9gfdtaopufCf57ATO
        2BBD7pKw==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1iYyND-0000js-9C; Sun, 24 Nov 2019 20:20:47 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/2] hwmon: (w83627ehf) convert to with_info interface
Date:   Sun, 24 Nov 2019 20:20:30 +0000
Message-Id: <20191124202030.45360-3-linux@treblig.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191124202030.45360-1-linux@treblig.org>
References: <20191124202030.45360-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert the old hwmon_device_register code to
devm_hwmon_device_register_with_info.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hwmon/w83627ehf.c | 1429 ++++++++++++++++---------------------
 1 file changed, 630 insertions(+), 799 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index eb171d15ac48..207cc74fbffe 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -417,8 +417,8 @@ static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
 struct w83627ehf_data {
 	int addr;	/* IO base of hw monitor block */
 	const char *name;
+	enum kinds kind; /* Convenience copy of sio_data->kind */
 
-	struct device *hwmon_dev;
 	struct mutex lock;
 
 	u16 reg_temp[NUM_REG_TEMP];
@@ -494,6 +494,7 @@ struct w83627ehf_data {
 	u16 have_temp_offset;
 	u8 in6_skip:1;
 	u8 temp3_val_only:1;
+	u8 have_vid:1;
 
 #ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
@@ -666,11 +667,9 @@ static void w83627ehf_write_fan_div(struct w83627ehf_data *data, int nr)
 static void w83627ehf_write_fan_div_common(struct device *dev,
 					   struct w83627ehf_data *data, int nr)
 {
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
-
-	if (sio_data->kind == nct6776)
+	if (data->kind == nct6776)
 		; /* no dividers, do nothing */
-	else if (sio_data->kind == nct6775)
+	else if (data->kind == nct6775)
 		nct6775_write_fan_div(data, nr);
 	else
 		w83627ehf_write_fan_div(data, nr);
@@ -717,11 +716,9 @@ static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
 static void w83627ehf_update_fan_div_common(struct device *dev,
 					    struct w83627ehf_data *data)
 {
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
-
-	if (sio_data->kind == nct6776)
+	if (data->kind == nct6776)
 		; /* no dividers, do nothing */
-	else if (sio_data->kind == nct6775)
+	else if (data->kind == nct6775)
 		nct6775_update_fan_div(data);
 	else
 		w83627ehf_update_fan_div(data);
@@ -786,7 +783,6 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
-
 	int i;
 
 	mutex_lock(&data->update_lock);
@@ -923,156 +919,33 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 	return data;
 }
 
-/*
- * Sysfs callback functions
- */
-#define show_in_reg(reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%ld\n", in_from_reg(data->reg[nr], nr, \
-		       data->scale_in)); \
-}
-show_in_reg(in)
-show_in_reg(in_min)
-show_in_reg(in_max)
-
 #define store_in_reg(REG, reg) \
-static ssize_t \
-store_in_##reg(struct device *dev, struct device_attribute *attr, \
-	       const char *buf, size_t count) \
+static int \
+store_in_##reg(struct device *dev, struct w83627ehf_data *data, int channel, \
+	       long val) \
 { \
-	struct w83627ehf_data *data = dev_get_drvdata(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	unsigned long val; \
-	int err; \
-	err = kstrtoul(buf, 10, &val); \
-	if (err < 0) \
-		return err; \
+	if (val < 0) \
+		return -EINVAL; \
 	mutex_lock(&data->update_lock); \
-	data->in_##reg[nr] = in_to_reg(val, nr, data->scale_in); \
-	w83627ehf_write_value(data, W83627EHF_REG_IN_##REG(nr), \
-			      data->in_##reg[nr]); \
+	data->in_##reg[channel] = in_to_reg(val, channel, data->scale_in); \
+	w83627ehf_write_value(data, W83627EHF_REG_IN_##REG(channel), \
+			      data->in_##reg[channel]); \
 	mutex_unlock(&data->update_lock); \
-	return count; \
+	return 0; \
 }
 
 store_in_reg(MIN, min)
 store_in_reg(MAX, max)
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	return sprintf(buf, "%u\n", (data->alarms >> nr) & 0x01);
-}
-
-static struct sensor_device_attribute sda_in_input[] = {
-	SENSOR_ATTR(in0_input, S_IRUGO, show_in, NULL, 0),
-	SENSOR_ATTR(in1_input, S_IRUGO, show_in, NULL, 1),
-	SENSOR_ATTR(in2_input, S_IRUGO, show_in, NULL, 2),
-	SENSOR_ATTR(in3_input, S_IRUGO, show_in, NULL, 3),
-	SENSOR_ATTR(in4_input, S_IRUGO, show_in, NULL, 4),
-	SENSOR_ATTR(in5_input, S_IRUGO, show_in, NULL, 5),
-	SENSOR_ATTR(in6_input, S_IRUGO, show_in, NULL, 6),
-	SENSOR_ATTR(in7_input, S_IRUGO, show_in, NULL, 7),
-	SENSOR_ATTR(in8_input, S_IRUGO, show_in, NULL, 8),
-	SENSOR_ATTR(in9_input, S_IRUGO, show_in, NULL, 9),
-};
-
-static struct sensor_device_attribute sda_in_alarm[] = {
-	SENSOR_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0),
-	SENSOR_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1),
-	SENSOR_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2),
-	SENSOR_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3),
-	SENSOR_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8),
-	SENSOR_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 21),
-	SENSOR_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 20),
-	SENSOR_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 16),
-	SENSOR_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL, 17),
-	SENSOR_ATTR(in9_alarm, S_IRUGO, show_alarm, NULL, 19),
-};
-
-static struct sensor_device_attribute sda_in_min[] = {
-	SENSOR_ATTR(in0_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 0),
-	SENSOR_ATTR(in1_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 1),
-	SENSOR_ATTR(in2_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 2),
-	SENSOR_ATTR(in3_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 3),
-	SENSOR_ATTR(in4_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 4),
-	SENSOR_ATTR(in5_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 5),
-	SENSOR_ATTR(in6_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 6),
-	SENSOR_ATTR(in7_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 7),
-	SENSOR_ATTR(in8_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 8),
-	SENSOR_ATTR(in9_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 9),
-};
-
-static struct sensor_device_attribute sda_in_max[] = {
-	SENSOR_ATTR(in0_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 0),
-	SENSOR_ATTR(in1_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 1),
-	SENSOR_ATTR(in2_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 2),
-	SENSOR_ATTR(in3_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 3),
-	SENSOR_ATTR(in4_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 4),
-	SENSOR_ATTR(in5_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 5),
-	SENSOR_ATTR(in6_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 6),
-	SENSOR_ATTR(in7_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 7),
-	SENSOR_ATTR(in8_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 8),
-	SENSOR_ATTR(in9_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 9),
-};
-
-static ssize_t
-show_fan(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	return sprintf(buf, "%d\n", data->rpm[nr]);
-}
-
-static ssize_t
-show_fan_min(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	return sprintf(buf, "%d\n",
-		       data->fan_from_reg_min(data->fan_min[nr],
-					      data->fan_div[nr]));
-}
-
-static ssize_t
-show_fan_div(struct device *dev, struct device_attribute *attr,
-	     char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
-}
-
-static ssize_t
-store_fan_min(struct device *dev, struct device_attribute *attr,
-	      const char *buf, size_t count)
+static int
+store_fan_min(struct device *dev, struct w83627ehf_data *data, int channel,
+	      long val)
 {
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	unsigned long val;
-	int err;
 	unsigned int reg;
 	u8 new_div;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
+	if (val < 0)
+		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
 	if (!data->has_fan_div) {
@@ -1088,34 +961,35 @@ store_fan_min(struct device *dev, struct device_attribute *attr,
 			val = 1350000U / val;
 			val = (val & 0x1f) | ((val << 3) & 0xff00);
 		}
-		data->fan_min[nr] = val;
+		data->fan_min[channel] = val;
 		goto done;	/* Leave fan divider alone */
 	}
 	if (!val) {
 		/* No min limit, alarm disabled */
-		data->fan_min[nr] = 255;
-		new_div = data->fan_div[nr]; /* No change */
-		dev_info(dev, "fan%u low limit and alarm disabled\n", nr + 1);
+		data->fan_min[channel] = 255;
+		new_div = data->fan_div[channel]; /* No change */
+		dev_info(dev, "fan%u low limit and alarm disabled\n",
+			 channel + 1);
 	} else if ((reg = 1350000U / val) >= 128 * 255) {
 		/*
 		 * Speed below this value cannot possibly be represented,
 		 * even with the highest divider (128)
 		 */
-		data->fan_min[nr] = 254;
+		data->fan_min[channel] = 254;
 		new_div = 7; /* 128 == (1 << 7) */
 		dev_warn(dev,
 			 "fan%u low limit %lu below minimum %u, set to minimum\n",
-			 nr + 1, val, data->fan_from_reg_min(254, 7));
+			 channel + 1, val, data->fan_from_reg_min(254, 7));
 	} else if (!reg) {
 		/*
 		 * Speed above this value cannot possibly be represented,
 		 * even with the lowest divider (1)
 		 */
-		data->fan_min[nr] = 1;
+		data->fan_min[channel] = 1;
 		new_div = 0; /* 1 == (1 << 0) */
 		dev_warn(dev,
 			 "fan%u low limit %lu above maximum %u, set to maximum\n",
-			 nr + 1, val, data->fan_from_reg_min(1, 0));
+			 channel + 1, val, data->fan_from_reg_min(1, 0));
 	} else {
 		/*
 		 * Automatically pick the best divider, i.e. the one such
@@ -1127,362 +1001,133 @@ store_fan_min(struct device *dev, struct device_attribute *attr,
 			reg >>= 1;
 			new_div++;
 		}
-		data->fan_min[nr] = reg;
+		data->fan_min[channel] = reg;
 	}
 
 	/*
 	 * Write both the fan clock divider (if it changed) and the new
 	 * fan min (unconditionally)
 	 */
-	if (new_div != data->fan_div[nr]) {
+	if (new_div != data->fan_div[channel]) {
 		dev_dbg(dev, "fan%u clock divider changed from %u to %u\n",
-			nr + 1, div_from_reg(data->fan_div[nr]),
+			channel + 1, div_from_reg(data->fan_div[channel]),
 			div_from_reg(new_div));
-		data->fan_div[nr] = new_div;
-		w83627ehf_write_fan_div_common(dev, data, nr);
+		data->fan_div[channel] = new_div;
+		w83627ehf_write_fan_div_common(dev, data, channel);
 		/* Give the chip time to sample a new speed value */
 		data->last_updated = jiffies;
 	}
 done:
-	w83627ehf_write_value(data, data->REG_FAN_MIN[nr],
-			      data->fan_min[nr]);
+	w83627ehf_write_value(data, data->REG_FAN_MIN[channel],
+			      data->fan_min[channel]);
 	mutex_unlock(&data->update_lock);
 
-	return count;
-}
-
-static struct sensor_device_attribute sda_fan_input[] = {
-	SENSOR_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0),
-	SENSOR_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1),
-	SENSOR_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2),
-	SENSOR_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3),
-	SENSOR_ATTR(fan5_input, S_IRUGO, show_fan, NULL, 4),
-};
-
-static struct sensor_device_attribute sda_fan_alarm[] = {
-	SENSOR_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6),
-	SENSOR_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7),
-	SENSOR_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 11),
-	SENSOR_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL, 10),
-	SENSOR_ATTR(fan5_alarm, S_IRUGO, show_alarm, NULL, 23),
-};
-
-static struct sensor_device_attribute sda_fan_min[] = {
-	SENSOR_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 0),
-	SENSOR_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 1),
-	SENSOR_ATTR(fan3_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 2),
-	SENSOR_ATTR(fan4_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 3),
-	SENSOR_ATTR(fan5_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 4),
-};
-
-static struct sensor_device_attribute sda_fan_div[] = {
-	SENSOR_ATTR(fan1_div, S_IRUGO, show_fan_div, NULL, 0),
-	SENSOR_ATTR(fan2_div, S_IRUGO, show_fan_div, NULL, 1),
-	SENSOR_ATTR(fan3_div, S_IRUGO, show_fan_div, NULL, 2),
-	SENSOR_ATTR(fan4_div, S_IRUGO, show_fan_div, NULL, 3),
-	SENSOR_ATTR(fan5_div, S_IRUGO, show_fan_div, NULL, 4),
-};
-
-static ssize_t
-show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
-}
-
-#define show_temp_reg(addr, reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->reg[nr])); \
+	return 0;
 }
-show_temp_reg(reg_temp, temp);
-show_temp_reg(reg_temp_over, temp_max);
-show_temp_reg(reg_temp_hyst, temp_max_hyst);
 
 #define store_temp_reg(addr, reg) \
-static ssize_t \
-store_##reg(struct device *dev, struct device_attribute *attr, \
-	    const char *buf, size_t count) \
+static int \
+store_##reg(struct device *dev, struct w83627ehf_data *data, int channel, \
+	    long val) \
 { \
-	struct w83627ehf_data *data = dev_get_drvdata(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	int err; \
-	long val; \
-	err = kstrtol(buf, 10, &val); \
-	if (err < 0) \
-		return err; \
 	mutex_lock(&data->update_lock); \
-	data->reg[nr] = LM75_TEMP_TO_REG(val); \
-	w83627ehf_write_temp(data, data->addr[nr], data->reg[nr]); \
+	data->reg[channel] = LM75_TEMP_TO_REG(val); \
+	w83627ehf_write_temp(data, data->addr[channel], data->reg[channel]); \
 	mutex_unlock(&data->update_lock); \
-	return count; \
+	return 0; \
 }
 store_temp_reg(reg_temp_over, temp_max);
 store_temp_reg(reg_temp_hyst, temp_max_hyst);
 
-static ssize_t
-show_temp_offset(struct device *dev, struct device_attribute *attr, char *buf)
+static int
+store_temp_offset(struct device *dev, struct w83627ehf_data *data, int channel,
+		  long val)
 {
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-
-	return sprintf(buf, "%d\n",
-		       data->temp_offset[sensor_attr->index] * 1000);
-}
-
-static ssize_t
-store_temp_offset(struct device *dev, struct device_attribute *attr,
-		  const char *buf, size_t count)
-{
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	long val;
-	int err;
-
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
 	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
 
 	mutex_lock(&data->update_lock);
-	data->temp_offset[nr] = val;
-	w83627ehf_write_value(data, W83627EHF_REG_TEMP_OFFSET[nr], val);
+	data->temp_offset[channel] = val;
+	w83627ehf_write_value(data, W83627EHF_REG_TEMP_OFFSET[channel], val);
 	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static ssize_t
-show_temp_type(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
-}
-
-static struct sensor_device_attribute sda_temp_input[] = {
-	SENSOR_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0),
-	SENSOR_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1),
-	SENSOR_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2),
-	SENSOR_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3),
-	SENSOR_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4),
-	SENSOR_ATTR(temp6_input, S_IRUGO, show_temp, NULL, 5),
-	SENSOR_ATTR(temp7_input, S_IRUGO, show_temp, NULL, 6),
-	SENSOR_ATTR(temp8_input, S_IRUGO, show_temp, NULL, 7),
-	SENSOR_ATTR(temp9_input, S_IRUGO, show_temp, NULL, 8),
-};
-
-static struct sensor_device_attribute sda_temp_label[] = {
-	SENSOR_ATTR(temp1_label, S_IRUGO, show_temp_label, NULL, 0),
-	SENSOR_ATTR(temp2_label, S_IRUGO, show_temp_label, NULL, 1),
-	SENSOR_ATTR(temp3_label, S_IRUGO, show_temp_label, NULL, 2),
-	SENSOR_ATTR(temp4_label, S_IRUGO, show_temp_label, NULL, 3),
-	SENSOR_ATTR(temp5_label, S_IRUGO, show_temp_label, NULL, 4),
-	SENSOR_ATTR(temp6_label, S_IRUGO, show_temp_label, NULL, 5),
-	SENSOR_ATTR(temp7_label, S_IRUGO, show_temp_label, NULL, 6),
-	SENSOR_ATTR(temp8_label, S_IRUGO, show_temp_label, NULL, 7),
-	SENSOR_ATTR(temp9_label, S_IRUGO, show_temp_label, NULL, 8),
-};
-
-static struct sensor_device_attribute sda_temp_max[] = {
-	SENSOR_ATTR(temp1_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 0),
-	SENSOR_ATTR(temp2_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 1),
-	SENSOR_ATTR(temp3_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 2),
-	SENSOR_ATTR(temp4_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 3),
-	SENSOR_ATTR(temp5_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 4),
-	SENSOR_ATTR(temp6_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 5),
-	SENSOR_ATTR(temp7_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 6),
-	SENSOR_ATTR(temp8_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 7),
-	SENSOR_ATTR(temp9_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 8),
-};
-
-static struct sensor_device_attribute sda_temp_max_hyst[] = {
-	SENSOR_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 0),
-	SENSOR_ATTR(temp2_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 1),
-	SENSOR_ATTR(temp3_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 2),
-	SENSOR_ATTR(temp4_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 3),
-	SENSOR_ATTR(temp5_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 4),
-	SENSOR_ATTR(temp6_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 5),
-	SENSOR_ATTR(temp7_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 6),
-	SENSOR_ATTR(temp8_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 7),
-	SENSOR_ATTR(temp9_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 8),
-};
-
-static struct sensor_device_attribute sda_temp_alarm[] = {
-	SENSOR_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4),
-	SENSOR_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5),
-	SENSOR_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 13),
-};
-
-static struct sensor_device_attribute sda_temp_type[] = {
-	SENSOR_ATTR(temp1_type, S_IRUGO, show_temp_type, NULL, 0),
-	SENSOR_ATTR(temp2_type, S_IRUGO, show_temp_type, NULL, 1),
-	SENSOR_ATTR(temp3_type, S_IRUGO, show_temp_type, NULL, 2),
-};
-
-static struct sensor_device_attribute sda_temp_offset[] = {
-	SENSOR_ATTR(temp1_offset, S_IRUGO | S_IWUSR, show_temp_offset,
-		    store_temp_offset, 0),
-	SENSOR_ATTR(temp2_offset, S_IRUGO | S_IWUSR, show_temp_offset,
-		    store_temp_offset, 1),
-	SENSOR_ATTR(temp3_offset, S_IRUGO | S_IWUSR, show_temp_offset,
-		    store_temp_offset, 2),
-};
-
-#define show_pwm_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-			  char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", data->reg[nr]); \
+	return 0;
 }
 
-show_pwm_reg(pwm_mode)
-show_pwm_reg(pwm_enable)
-show_pwm_reg(pwm)
-
-static ssize_t
-store_pwm_mode(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static int
+store_pwm_mode(struct device *dev, struct w83627ehf_data *data, int channel,
+	       long val)
 {
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
-	int nr = sensor_attr->index;
-	unsigned long val;
-	int err;
 	u16 reg;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	if (val > 1)
+	if (val < 0 || val > 1)
 		return -EINVAL;
 
 	/* On NCT67766F, DC mode is only supported for pwm1 */
-	if (sio_data->kind == nct6776 && nr && val != 1)
+	if (data->kind == nct6776 && channel && val != 1)
 		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-	reg = w83627ehf_read_value(data, W83627EHF_REG_PWM_ENABLE[nr]);
-	data->pwm_mode[nr] = val;
-	reg &= ~(1 << W83627EHF_PWM_MODE_SHIFT[nr]);
+	reg = w83627ehf_read_value(data, W83627EHF_REG_PWM_ENABLE[channel]);
+	data->pwm_mode[channel] = val;
+	reg &= ~(1 << W83627EHF_PWM_MODE_SHIFT[channel]);
 	if (!val)
-		reg |= 1 << W83627EHF_PWM_MODE_SHIFT[nr];
-	w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[nr], reg);
+		reg |= 1 << W83627EHF_PWM_MODE_SHIFT[channel];
+	w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[channel], reg);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return 0;
 }
 
-static ssize_t
-store_pwm(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static int
+store_pwm(struct device *dev, struct w83627ehf_data *data, int channel,
+	  long val)
 {
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
 	val = clamp_val(val, 0, 255);
 
 	mutex_lock(&data->update_lock);
-	data->pwm[nr] = val;
-	w83627ehf_write_value(data, data->REG_PWM[nr], val);
+	data->pwm[channel] = val;
+	w83627ehf_write_value(data, data->REG_PWM[channel], val);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return 0;
 }
 
-static ssize_t
-store_pwm_enable(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static int
+store_pwm_enable(struct device *dev, struct w83627ehf_data *data, int channel,
+		 long val)
 {
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
-	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
-	unsigned long val;
-	int err;
 	u16 reg;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	if (!val || (val > 4 && val != data->pwm_enable_orig[nr]))
+	if (!val || val < 0 ||
+	    (val > 4 && val != data->pwm_enable_orig[channel]))
 		return -EINVAL;
 	/* SmartFan III mode is not supported on NCT6776F */
-	if (sio_data->kind == nct6776 && val == 4)
+	if (data->kind == nct6776 && val == 4)
 		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-	data->pwm_enable[nr] = val;
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
+	data->pwm_enable[channel] = val;
+	if (data->kind == nct6775 || data->kind == nct6776) {
 		reg = w83627ehf_read_value(data,
-					   NCT6775_REG_FAN_MODE[nr]);
+					   NCT6775_REG_FAN_MODE[channel]);
 		reg &= 0x0f;
 		reg |= (val - 1) << 4;
 		w83627ehf_write_value(data,
-				      NCT6775_REG_FAN_MODE[nr], reg);
+				      NCT6775_REG_FAN_MODE[channel], reg);
 	} else {
-		reg = w83627ehf_read_value(data, W83627EHF_REG_PWM_ENABLE[nr]);
-		reg &= ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[nr]);
-		reg |= (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[nr];
-		w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[nr], reg);
+		reg = w83627ehf_read_value(data,
+					   W83627EHF_REG_PWM_ENABLE[channel]);
+		reg &= ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[channel]);
+		reg |= (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
+		w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[channel],
+				      reg);
 	}
 	mutex_unlock(&data->update_lock);
-	return count;
+	return 0;
 }
 
-
 #define show_tol_temp(reg) \
 static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
 				char *buf) \
 { \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
+	struct w83627ehf_data *data = w83627ehf_update_device(dev->parent); \
 	struct sensor_device_attribute *sensor_attr = \
 		to_sensor_dev_attr(attr); \
 	int nr = sensor_attr->index; \
@@ -1520,7 +1165,6 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 			const char *buf, size_t count)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	u16 reg;
@@ -1535,9 +1179,9 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 15);
 
 	mutex_lock(&data->update_lock);
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
+	if (data->kind == nct6775 || data->kind == nct6776) {
 		/* Limit tolerance further for NCT6776F */
-		if (sio_data->kind == nct6776 && val > 7)
+		if (data->kind == nct6776 && val > 7)
 			val = 7;
 		reg = w83627ehf_read_value(data, NCT6775_REG_FAN_MODE[nr]);
 		reg = (reg & 0xf0) | val;
@@ -1555,56 +1199,23 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static struct sensor_device_attribute sda_pwm[] = {
-	SENSOR_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0),
-	SENSOR_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 1),
-	SENSOR_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 2),
-	SENSOR_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 3),
-};
-
-static struct sensor_device_attribute sda_pwm_mode[] = {
-	SENSOR_ATTR(pwm1_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 0),
-	SENSOR_ATTR(pwm2_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 1),
-	SENSOR_ATTR(pwm3_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 2),
-	SENSOR_ATTR(pwm4_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 3),
-};
-
-static struct sensor_device_attribute sda_pwm_enable[] = {
-	SENSOR_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 0),
-	SENSOR_ATTR(pwm2_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 1),
-	SENSOR_ATTR(pwm3_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 2),
-	SENSOR_ATTR(pwm4_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 3),
-};
-
-static struct sensor_device_attribute sda_target_temp[] = {
-	SENSOR_ATTR(pwm1_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 0),
-	SENSOR_ATTR(pwm2_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 1),
-	SENSOR_ATTR(pwm3_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 2),
-	SENSOR_ATTR(pwm4_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 3),
-};
-
-static struct sensor_device_attribute sda_tolerance[] = {
-	SENSOR_ATTR(pwm1_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 0),
-	SENSOR_ATTR(pwm2_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 1),
-	SENSOR_ATTR(pwm3_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 2),
-	SENSOR_ATTR(pwm4_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 3),
-};
+SENSOR_DEVICE_ATTR(pwm1_target, 0644, show_target_temp,
+	    store_target_temp, 0);
+SENSOR_DEVICE_ATTR(pwm2_target, 0644, show_target_temp,
+	    store_target_temp, 1);
+SENSOR_DEVICE_ATTR(pwm3_target, 0644, show_target_temp,
+	    store_target_temp, 2);
+SENSOR_DEVICE_ATTR(pwm4_target, 0644, show_target_temp,
+	    store_target_temp, 3);
+
+SENSOR_DEVICE_ATTR(pwm1_tolerance, 0644, show_tolerance,
+	    store_tolerance, 0);
+SENSOR_DEVICE_ATTR(pwm2_tolerance, 0644, show_tolerance,
+	    store_tolerance, 1);
+SENSOR_DEVICE_ATTR(pwm3_tolerance, 0644, show_tolerance,
+	    store_tolerance, 2);
+SENSOR_DEVICE_ATTR(pwm4_tolerance, 0644, show_tolerance,
+	    store_tolerance, 3);
 
 /* Smart Fan registers */
 
@@ -1612,7 +1223,7 @@ static struct sensor_device_attribute sda_tolerance[] = {
 static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
 		       char *buf) \
 { \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
+	struct w83627ehf_data *data = w83627ehf_update_device(dev->parent); \
 	struct sensor_device_attribute *sensor_attr = \
 		to_sensor_dev_attr(attr); \
 	int nr = sensor_attr->index; \
@@ -1648,7 +1259,7 @@ fan_functions(fan_step_output, FAN_STEP_OUTPUT)
 static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
 				char *buf) \
 { \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
+	struct w83627ehf_data *data = w83627ehf_update_device(dev->parent); \
 	struct sensor_device_attribute *sensor_attr = \
 		to_sensor_dev_attr(attr); \
 	int nr = sensor_attr->index; \
@@ -1680,71 +1291,54 @@ store_##reg(struct device *dev, struct device_attribute *attr, \
 
 fan_time_functions(fan_stop_time, FAN_STOP_TIME)
 
-static ssize_t name_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%s\n", data->name);
-}
-static DEVICE_ATTR_RO(name);
-
-static struct sensor_device_attribute sda_sf3_arrays_fan4[] = {
-	SENSOR_ATTR(pwm4_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
-		    store_fan_stop_time, 3),
-	SENSOR_ATTR(pwm4_start_output, S_IWUSR | S_IRUGO, show_fan_start_output,
-		    store_fan_start_output, 3),
-	SENSOR_ATTR(pwm4_stop_output, S_IWUSR | S_IRUGO, show_fan_stop_output,
-		    store_fan_stop_output, 3),
-	SENSOR_ATTR(pwm4_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
-		    store_fan_max_output, 3),
-	SENSOR_ATTR(pwm4_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
-		    store_fan_step_output, 3),
-};
-
-static struct sensor_device_attribute sda_sf3_arrays_fan3[] = {
-	SENSOR_ATTR(pwm3_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
-		    store_fan_stop_time, 2),
-	SENSOR_ATTR(pwm3_start_output, S_IWUSR | S_IRUGO, show_fan_start_output,
-		    store_fan_start_output, 2),
-	SENSOR_ATTR(pwm3_stop_output, S_IWUSR | S_IRUGO, show_fan_stop_output,
-		    store_fan_stop_output, 2),
-};
-
-static struct sensor_device_attribute sda_sf3_arrays[] = {
-	SENSOR_ATTR(pwm1_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
-		    store_fan_stop_time, 0),
-	SENSOR_ATTR(pwm2_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
-		    store_fan_stop_time, 1),
-	SENSOR_ATTR(pwm1_start_output, S_IWUSR | S_IRUGO, show_fan_start_output,
-		    store_fan_start_output, 0),
-	SENSOR_ATTR(pwm2_start_output, S_IWUSR | S_IRUGO, show_fan_start_output,
-		    store_fan_start_output, 1),
-	SENSOR_ATTR(pwm1_stop_output, S_IWUSR | S_IRUGO, show_fan_stop_output,
-		    store_fan_stop_output, 0),
-	SENSOR_ATTR(pwm2_stop_output, S_IWUSR | S_IRUGO, show_fan_stop_output,
-		    store_fan_stop_output, 1),
-};
+SENSOR_DEVICE_ATTR(pwm4_stop_time, 0644, show_fan_stop_time,
+	    store_fan_stop_time, 3);
+SENSOR_DEVICE_ATTR(pwm4_start_output, 0644, show_fan_start_output,
+	    store_fan_start_output, 3);
+SENSOR_DEVICE_ATTR(pwm4_stop_output, 0644, show_fan_stop_output,
+	    store_fan_stop_output, 3);
+SENSOR_DEVICE_ATTR(pwm4_max_output, 0644, show_fan_max_output,
+	    store_fan_max_output, 3);
+SENSOR_DEVICE_ATTR(pwm4_step_output, 0644, show_fan_step_output,
+	    store_fan_step_output, 3);
+
+SENSOR_DEVICE_ATTR(pwm3_stop_time, 0644, show_fan_stop_time,
+	    store_fan_stop_time, 2);
+SENSOR_DEVICE_ATTR(pwm3_start_output, 0644, show_fan_start_output,
+	    store_fan_start_output, 2);
+SENSOR_DEVICE_ATTR(pwm3_stop_output, 0644, show_fan_stop_output,
+		    store_fan_stop_output, 2);
+
+SENSOR_DEVICE_ATTR(pwm1_stop_time, 0644, show_fan_stop_time,
+	    store_fan_stop_time, 0);
+SENSOR_DEVICE_ATTR(pwm2_stop_time, 0644, show_fan_stop_time,
+	    store_fan_stop_time, 1);
+SENSOR_DEVICE_ATTR(pwm1_start_output, 0644, show_fan_start_output,
+	    store_fan_start_output, 0);
+SENSOR_DEVICE_ATTR(pwm2_start_output, 0644, show_fan_start_output,
+	    store_fan_start_output, 1);
+SENSOR_DEVICE_ATTR(pwm1_stop_output, 0644, show_fan_stop_output,
+	    store_fan_stop_output, 0);
+SENSOR_DEVICE_ATTR(pwm2_stop_output, 0644, show_fan_stop_output,
+	    store_fan_stop_output, 1);
 
 
 /*
  * pwm1 and pwm3 don't support max and step settings on all chips.
  * Need to check support while generating/removing attribute files.
  */
-static struct sensor_device_attribute sda_sf3_max_step_arrays[] = {
-	SENSOR_ATTR(pwm1_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
-		    store_fan_max_output, 0),
-	SENSOR_ATTR(pwm1_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
-		    store_fan_step_output, 0),
-	SENSOR_ATTR(pwm2_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
-		    store_fan_max_output, 1),
-	SENSOR_ATTR(pwm2_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
-		    store_fan_step_output, 1),
-	SENSOR_ATTR(pwm3_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
-		    store_fan_max_output, 2),
-	SENSOR_ATTR(pwm3_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
-		    store_fan_step_output, 2),
-};
+SENSOR_DEVICE_ATTR(pwm1_max_output, 0644, show_fan_max_output,
+	    store_fan_max_output, 0);
+SENSOR_DEVICE_ATTR(pwm1_step_output, 0644, show_fan_step_output,
+	    store_fan_step_output, 0);
+SENSOR_DEVICE_ATTR(pwm2_max_output, 0644, show_fan_max_output,
+	    store_fan_max_output, 1);
+SENSOR_DEVICE_ATTR(pwm2_step_output, 0644, show_fan_step_output,
+	    store_fan_step_output, 1);
+SENSOR_DEVICE_ATTR(pwm3_max_output, 0644, show_fan_max_output,
+	    store_fan_max_output, 2);
+SENSOR_DEVICE_ATTR(pwm3_step_output, 0644, show_fan_step_output,
+	    store_fan_step_output, 2);
 
 static ssize_t
 cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -1752,32 +1346,21 @@ cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR_RO(cpu0_vid);
+DEVICE_ATTR_RO(cpu0_vid);
 
 
 /* Case open detection */
-
-static ssize_t
-show_caseopen(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-
-	return sprintf(buf, "%d\n",
-		!!(data->caseopen & to_sensor_dev_attr_2(attr)->index));
-}
-
-static ssize_t
-clear_caseopen(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static int
+clear_caseopen(struct device *dev, struct w83627ehf_data *data, int channel,
+	       long val)
 {
-	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	unsigned long val;
+	u16 masks[] = { 0x80, 0x40 };
 	u16 reg, mask;
 
-	if (kstrtoul(buf, 10, &val) || val != 0)
+	if (val != 0 || channel > 1)
 		return -EINVAL;
 
-	mask = to_sensor_dev_attr_2(attr)->nr;
+	mask = masks[channel];
 
 	mutex_lock(&data->update_lock);
 	reg = w83627ehf_read_value(data, W83627EHF_REG_CASEOPEN_CLR);
@@ -1786,85 +1369,116 @@ clear_caseopen(struct device *dev, struct device_attribute *attr,
 	data->valid = 0;	/* Force cache refresh */
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return 0;
 }
 
-static struct sensor_device_attribute_2 sda_caseopen[] = {
-	SENSOR_ATTR_2(intrusion0_alarm, S_IWUSR | S_IRUGO, show_caseopen,
-			clear_caseopen, 0x80, 0x10),
-	SENSOR_ATTR_2(intrusion1_alarm, S_IWUSR | S_IRUGO, show_caseopen,
-			clear_caseopen, 0x40, 0x40),
-};
-
-/*
- * Driver and device management
- */
-
-static void w83627ehf_device_remove_files(struct device *dev)
+static umode_t w83627ehf_attrs_visible(struct kobject *kobj,
+				       struct attribute *a, int n)
 {
-	/*
-	 * some entries in the following arrays may not have been used in
-	 * device_create_file(), but device_remove_file() will ignore them
-	 */
-	int i;
+	struct device *dev = container_of(kobj, struct device, kobj);
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct device_attribute *devattr;
+	struct sensor_device_attribute *sda;
+
+	devattr = container_of(a, struct device_attribute, attr);
+
+	/* Not sensor */
+	if (devattr->show == cpu0_vid_show && data->have_vid)
+		return a->mode;
+
+	sda = (struct sensor_device_attribute *)devattr;
+
+	if (sda->index < 2 &&
+		(devattr->show == show_fan_stop_time ||
+		 devattr->show == show_fan_start_output ||
+		 devattr->show == show_fan_stop_output))
+		return a->mode;
+
+	if (sda->index < 3 &&
+		(devattr->show == show_fan_max_output ||
+		 devattr->show == show_fan_step_output) &&
+		data->REG_FAN_STEP_OUTPUT &&
+		data->REG_FAN_STEP_OUTPUT[sda->index] != 0xff)
+		return a->mode;
+
+	/* if fan3 and fan4 are enabled create the files for them */
+	if (sda->index == 2 &&
+		(data->has_fan & (1 << 2)) && data->pwm_num >= 3 &&
+		(devattr->show == show_fan_stop_time ||
+		 devattr->show == show_fan_start_output ||
+		 devattr->show == show_fan_stop_output))
+		return a->mode;
+
+	if (sda->index == 3 &&
+		(data->has_fan & (1 << 3)) && data->pwm_num >= 4 &&
+		(devattr->show == show_fan_stop_time ||
+		 devattr->show == show_fan_start_output ||
+		 devattr->show == show_fan_stop_output ||
+		 devattr->show == show_fan_max_output ||
+		 devattr->show == show_fan_step_output))
+		return a->mode;
+
+	if ((devattr->show == show_target_temp ||
+	    devattr->show == show_tolerance) &&
+	    (data->has_fan & (1 << sda->index)) &&
+	    sda->index < data->pwm_num)
+		return a->mode;
 
-	for (i = 0; i < ARRAY_SIZE(sda_sf3_arrays); i++)
-		device_remove_file(dev, &sda_sf3_arrays[i].dev_attr);
-	for (i = 0; i < ARRAY_SIZE(sda_sf3_max_step_arrays); i++) {
-		struct sensor_device_attribute *attr =
-		  &sda_sf3_max_step_arrays[i];
-		if (data->REG_FAN_STEP_OUTPUT &&
-		    data->REG_FAN_STEP_OUTPUT[attr->index] != 0xff)
-			device_remove_file(dev, &attr->dev_attr);
-	}
-	for (i = 0; i < ARRAY_SIZE(sda_sf3_arrays_fan3); i++)
-		device_remove_file(dev, &sda_sf3_arrays_fan3[i].dev_attr);
-	for (i = 0; i < ARRAY_SIZE(sda_sf3_arrays_fan4); i++)
-		device_remove_file(dev, &sda_sf3_arrays_fan4[i].dev_attr);
-	for (i = 0; i < data->in_num; i++) {
-		if ((i == 6) && data->in6_skip)
-			continue;
-		device_remove_file(dev, &sda_in_input[i].dev_attr);
-		device_remove_file(dev, &sda_in_alarm[i].dev_attr);
-		device_remove_file(dev, &sda_in_min[i].dev_attr);
-		device_remove_file(dev, &sda_in_max[i].dev_attr);
-	}
-	for (i = 0; i < 5; i++) {
-		device_remove_file(dev, &sda_fan_input[i].dev_attr);
-		device_remove_file(dev, &sda_fan_alarm[i].dev_attr);
-		device_remove_file(dev, &sda_fan_div[i].dev_attr);
-		device_remove_file(dev, &sda_fan_min[i].dev_attr);
-	}
-	for (i = 0; i < data->pwm_num; i++) {
-		device_remove_file(dev, &sda_pwm[i].dev_attr);
-		device_remove_file(dev, &sda_pwm_mode[i].dev_attr);
-		device_remove_file(dev, &sda_pwm_enable[i].dev_attr);
-		device_remove_file(dev, &sda_target_temp[i].dev_attr);
-		device_remove_file(dev, &sda_tolerance[i].dev_attr);
-	}
-	for (i = 0; i < NUM_REG_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
-			continue;
-		device_remove_file(dev, &sda_temp_input[i].dev_attr);
-		device_remove_file(dev, &sda_temp_label[i].dev_attr);
-		if (i == 2 && data->temp3_val_only)
-			continue;
-		device_remove_file(dev, &sda_temp_max[i].dev_attr);
-		device_remove_file(dev, &sda_temp_max_hyst[i].dev_attr);
-		if (i > 2)
-			continue;
-		device_remove_file(dev, &sda_temp_alarm[i].dev_attr);
-		device_remove_file(dev, &sda_temp_type[i].dev_attr);
-		device_remove_file(dev, &sda_temp_offset[i].dev_attr);
-	}
+	return 0;
+}
 
-	device_remove_file(dev, &sda_caseopen[0].dev_attr);
-	device_remove_file(dev, &sda_caseopen[1].dev_attr);
+/* These groups handle non-standard attributes used in this device */
+static struct attribute *w83627ehf_attrs[] = {
+
+	&sensor_dev_attr_pwm1_stop_time.dev_attr.attr,
+	&sensor_dev_attr_pwm1_start_output.dev_attr.attr,
+	&sensor_dev_attr_pwm1_stop_output.dev_attr.attr,
+	&sensor_dev_attr_pwm1_max_output.dev_attr.attr,
+	&sensor_dev_attr_pwm1_step_output.dev_attr.attr,
+	&sensor_dev_attr_pwm1_target.dev_attr.attr,
+	&sensor_dev_attr_pwm1_tolerance.dev_attr.attr,
+
+	&sensor_dev_attr_pwm2_stop_time.dev_attr.attr,
+	&sensor_dev_attr_pwm2_start_output.dev_attr.attr,
+	&sensor_dev_attr_pwm2_stop_output.dev_attr.attr,
+	&sensor_dev_attr_pwm2_max_output.dev_attr.attr,
+	&sensor_dev_attr_pwm2_step_output.dev_attr.attr,
+	&sensor_dev_attr_pwm2_target.dev_attr.attr,
+	&sensor_dev_attr_pwm2_tolerance.dev_attr.attr,
+
+	&sensor_dev_attr_pwm3_stop_time.dev_attr.attr,
+	&sensor_dev_attr_pwm3_start_output.dev_attr.attr,
+	&sensor_dev_attr_pwm3_stop_output.dev_attr.attr,
+	&sensor_dev_attr_pwm3_max_output.dev_attr.attr,
+	&sensor_dev_attr_pwm3_step_output.dev_attr.attr,
+	&sensor_dev_attr_pwm3_target.dev_attr.attr,
+	&sensor_dev_attr_pwm3_tolerance.dev_attr.attr,
+
+	&sensor_dev_attr_pwm4_stop_time.dev_attr.attr,
+	&sensor_dev_attr_pwm4_start_output.dev_attr.attr,
+	&sensor_dev_attr_pwm4_stop_output.dev_attr.attr,
+	&sensor_dev_attr_pwm4_max_output.dev_attr.attr,
+	&sensor_dev_attr_pwm4_step_output.dev_attr.attr,
+	&sensor_dev_attr_pwm4_target.dev_attr.attr,
+	&sensor_dev_attr_pwm4_tolerance.dev_attr.attr,
+
+	&dev_attr_cpu0_vid.attr,
+	NULL
+};
 
-	device_remove_file(dev, &dev_attr_name);
-	device_remove_file(dev, &dev_attr_cpu0_vid);
-}
+static const struct attribute_group w83627ehf_group = {
+	.attrs = w83627ehf_attrs,
+	.is_visible = w83627ehf_attrs_visible,
+};
+
+static const struct attribute_group *w83627ehf_groups[] = {
+	&w83627ehf_group,
+	NULL
+};
+
+/*
+ * Driver and device management
+ */
 
 /* Get the monitoring functions started */
 static inline void w83627ehf_init_device(struct w83627ehf_data *data,
@@ -2035,6 +1649,369 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 	}
 }
 
+static umode_t
+w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		     u32 attr, int channel)
+{
+	const struct w83627ehf_data *data = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		/* channel 0.., name 1.. */
+		if (!(data->have_temp & (1 << channel)))
+			return 0;
+		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
+			return 0444;
+		if (channel == 2 && data->temp3_val_only)
+			return 0;
+		if (attr == hwmon_temp_max) {
+			if (data->reg_temp_over[channel])
+				return 0644;
+			else
+				return 0;
+		}
+		if (attr == hwmon_temp_max_hyst) {
+			if (data->reg_temp_hyst[channel])
+				return 0644;
+			else
+				return 0;
+		}
+		if (channel > 2)
+			return 0;
+		if (attr == hwmon_temp_alarm || attr == hwmon_temp_type)
+			return 0444;
+		if (attr == hwmon_temp_offset) {
+			if (data->have_temp_offset & (1 << channel))
+				return 0644;
+			else
+				return 0;
+		}
+		break;
+
+	case hwmon_fan:
+		/* channel 0.., name 1.. */
+		if (!(data->has_fan & (1 << channel)))
+			return 0;
+		if (attr == hwmon_fan_input || attr == hwmon_fan_alarm)
+			return 0444;
+		if (attr == hwmon_fan_div) {
+			if (data->kind != nct6776)
+				return 0444;
+			else
+				return 0;
+		}
+		if (attr == hwmon_fan_min) {
+			if (data->has_fan_min & (1 << channel))
+				return 0644;
+			else
+				return 0;
+		}
+		break;
+
+	case hwmon_in:
+		/* channel 0.., name 0.. */
+		if (channel >= data->in_num)
+			return 0;
+		if (channel == 6 && data->in6_skip)
+			return 0;
+		if (attr == hwmon_in_alarm || attr == hwmon_in_input)
+			return 0444;
+		if (attr == hwmon_in_min || attr == hwmon_in_max)
+			return 0644;
+		break;
+
+	case hwmon_pwm:
+		/* channel 0.., name 1.. */
+		if (!(data->has_fan & (1 << channel)) ||
+		    channel >= data->pwm_num)
+			return 0;
+		if (attr == hwmon_pwm_mode || attr == hwmon_pwm_enable ||
+		    attr == hwmon_pwm_input)
+			return 0644;
+		break;
+
+	case hwmon_intrusion:
+		if (channel == 0 ||
+		    (channel == 1 && data->kind == nct6776))
+			return 0644;
+		return 0;
+
+	default: /* Shouldn't happen */
+		return 0;
+	}
+
+	return 0; /* Shouldn't happen */
+}
+
+static int
+w83627ehf_do_read_temp(struct w83627ehf_data *data, u32 attr,
+		       int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+		*val = LM75_TEMP_FROM_REG(data->temp[channel]);
+		return 0;
+	case hwmon_temp_max:
+		*val = LM75_TEMP_FROM_REG(data->temp_max[channel]);
+		return 0;
+	case hwmon_temp_max_hyst:
+		*val = LM75_TEMP_FROM_REG(data->temp_max_hyst[channel]);
+		return 0;
+	case hwmon_temp_offset:
+		*val = data->temp_offset[channel] * 1000;
+		return 0;
+	case hwmon_temp_type:
+		*val = (int)data->temp_type[channel];
+		return 0;
+	case hwmon_temp_alarm:
+		if (channel < 3) {
+			int bit[] = { 4, 5, 13 };
+			*val = (data->alarms >> bit[channel]) & 1;
+			return 0;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_in(struct w83627ehf_data *data, u32 attr,
+		     int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		*val = in_from_reg(data->in[channel], channel, data->scale_in);
+		return 0;
+	case hwmon_in_min:
+		*val = in_from_reg(data->in_min[channel], channel,
+				   data->scale_in);
+		return 0;
+	case hwmon_in_max:
+		*val = in_from_reg(data->in_max[channel], channel,
+				   data->scale_in);
+		return 0;
+	case hwmon_in_alarm:
+		if (channel < 10) {
+			int bit[] = { 0, 1, 2, 3, 8, 21, 20, 16, 17, 19 };
+			*val = (data->alarms >> bit[channel]) & 1;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_fan(struct w83627ehf_data *data, u32 attr,
+		      int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_fan_input:
+		*val = data->rpm[channel];
+		return 0;
+	case hwmon_fan_min:
+		*val = data->fan_from_reg_min(data->fan_min[channel],
+					      data->fan_div[channel]);
+		return 0;
+	case hwmon_fan_div:
+		*val = div_from_reg(data->fan_div[channel]);
+		return 0;
+	case hwmon_fan_alarm:
+		if (channel < 5) {
+			int bit[] = { 6, 7, 11, 10, 23 };
+			*val = (data->alarms >> bit[channel]) & 1;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_pwm(struct w83627ehf_data *data, u32 attr,
+		      int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_pwm_input:
+		*val = data->pwm[channel];
+		return 0;
+	case hwmon_pwm_enable:
+		*val = data->pwm_enable[channel];
+		return 0;
+	case hwmon_pwm_mode:
+		*val = data->pwm_enable[channel];
+		return 0;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_intrusion(struct w83627ehf_data *data, u32 attr,
+			    int channel, long *val)
+{
+	unsigned int masks[] = { 0x10, 0x40 };
+
+	if (attr != hwmon_intrusion_alarm || channel > 1)
+		return -EOPNOTSUPP; /* shouldn't happen */
+
+	*val = !!(data->caseopen & masks[channel]);
+	return 0;
+}
+
+static int
+w83627ehf_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev->parent);
+
+	switch (type) {
+	case hwmon_fan:
+		return w83627ehf_do_read_fan(data, attr, channel, val);
+
+	case hwmon_in:
+		return w83627ehf_do_read_in(data, attr, channel, val);
+
+	case hwmon_pwm:
+		return w83627ehf_do_read_pwm(data, attr, channel, val);
+
+	case hwmon_temp:
+		return w83627ehf_do_read_temp(data, attr, channel, val);
+
+	case hwmon_intrusion:
+		return w83627ehf_do_read_intrusion(data, attr, channel, val);
+
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_read_string(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, const char **str)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = data->temp_label[data->temp_src[channel]];
+			return 0;
+		}
+		break;
+
+	default:
+		break;
+	}
+	/* Nothing else should be read as a string */
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_in && attr == hwmon_in_min)
+		return store_in_min(dev, data, channel, val);
+	if (type == hwmon_in && attr == hwmon_in_max)
+		return store_in_max(dev, data, channel, val);
+
+	if (type == hwmon_fan && attr == hwmon_fan_min)
+		return store_fan_min(dev, data, channel, val);
+
+	if (type == hwmon_temp && attr == hwmon_temp_max)
+		return store_temp_max(dev, data, channel, val);
+	if (type == hwmon_temp && attr == hwmon_temp_max_hyst)
+		return store_temp_max_hyst(dev, data, channel, val);
+	if (type == hwmon_temp && attr == hwmon_temp_offset)
+		return store_temp_offset(dev, data, channel, val);
+
+	if (type == hwmon_pwm && attr == hwmon_pwm_mode)
+		return store_pwm_mode(dev, data, channel, val);
+	if (type == hwmon_pwm && attr == hwmon_pwm_enable)
+		return store_pwm_enable(dev, data, channel, val);
+	if (type == hwmon_pwm && attr == hwmon_pwm_input)
+		return store_pwm(dev, data, channel, val);
+
+	if (type == hwmon_intrusion && attr == hwmon_intrusion_alarm)
+		return clear_caseopen(dev, data, channel, val);
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops w83627ehf_ops = {
+	.is_visible = w83627ehf_is_visible,
+	.read = w83627ehf_read,
+	.read_string = w83627ehf_read_string,
+	.write = w83627ehf_write,
+};
+
+static const struct hwmon_channel_info *w83627ehf_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN),
+	HWMON_CHANNEL_INFO(in,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN),
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE),
+	HWMON_CHANNEL_INFO(temp,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE),
+	HWMON_CHANNEL_INFO(intrusion,
+		HWMON_INTRUSION_ALARM,
+		HWMON_INTRUSION_ALARM),
+	NULL
+};
+
+static const struct hwmon_chip_info w83627ehf_chip_info = {
+	.ops = &w83627ehf_ops,
+	.info = w83627ehf_info,
+};
+
 static int w83627ehf_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2043,6 +2020,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	struct resource *res;
 	u8 en_vrm10;
 	int i, err = 0;
+	struct device *hwmon_dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!request_region(res->start, IOREGION_LENGTH, DRVNAME)) {
@@ -2064,6 +2042,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	mutex_init(&data->lock);
 	mutex_init(&data->update_lock);
 	data->name = w83627ehf_device_names[sio_data->kind];
+	data->kind = sio_data->kind;
 	data->bank = 0xff;		/* Force initial bank selection */
 	platform_set_drvdata(pdev, data);
 
@@ -2356,11 +2335,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		 */
 		superio_select(sio_data->sioreg, W83667HG_LD_VID);
 		data->vid = superio_inb(sio_data->sioreg, 0xe3);
-		err = device_create_file(dev, &dev_attr_cpu0_vid);
-		if (err) {
-			superio_exit(sio_data->sioreg);
-			goto exit_release;
-		}
+		data->have_vid = true;
 	} else if (sio_data->kind != w83627uhg) {
 		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
 		if (superio_inb(sio_data->sioreg, SIO_REG_VID_CTRL) & 0x80) {
@@ -2394,12 +2369,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 						SIO_REG_VID_DATA);
 			if (sio_data->kind == w83627ehf) /* 6 VID pins only */
 				data->vid &= 0x3f;
-
-			err = device_create_file(dev, &dev_attr_cpu0_vid);
-			if (err) {
-				superio_exit(sio_data->sioreg);
-				goto exit_release;
-			}
+			data->have_vid = true;
 		} else {
 			dev_info(dev,
 				 "VID pins in output mode, CPU VID not available\n");
@@ -2433,151 +2403,14 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	for (i = 0; i < data->pwm_num; i++)
 		data->pwm_enable_orig[i] = data->pwm_enable[i];
 
-	/* Register sysfs hooks */
-	for (i = 0; i < ARRAY_SIZE(sda_sf3_arrays); i++) {
-		err = device_create_file(dev, &sda_sf3_arrays[i].dev_attr);
-		if (err)
-			goto exit_remove;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(sda_sf3_max_step_arrays); i++) {
-		struct sensor_device_attribute *attr =
-		  &sda_sf3_max_step_arrays[i];
-		if (data->REG_FAN_STEP_OUTPUT &&
-		    data->REG_FAN_STEP_OUTPUT[attr->index] != 0xff) {
-			err = device_create_file(dev, &attr->dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-	}
-	/* if fan3 and fan4 are enabled create the sf3 files for them */
-	if ((data->has_fan & (1 << 2)) && data->pwm_num >= 3)
-		for (i = 0; i < ARRAY_SIZE(sda_sf3_arrays_fan3); i++) {
-			err = device_create_file(dev,
-					&sda_sf3_arrays_fan3[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-	if ((data->has_fan & (1 << 3)) && data->pwm_num >= 4)
-		for (i = 0; i < ARRAY_SIZE(sda_sf3_arrays_fan4); i++) {
-			err = device_create_file(dev,
-					&sda_sf3_arrays_fan4[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-
-	for (i = 0; i < data->in_num; i++) {
-		if ((i == 6) && data->in6_skip)
-			continue;
-		if ((err = device_create_file(dev, &sda_in_input[i].dev_attr))
-			|| (err = device_create_file(dev,
-				&sda_in_alarm[i].dev_attr))
-			|| (err = device_create_file(dev,
-				&sda_in_min[i].dev_attr))
-			|| (err = device_create_file(dev,
-				&sda_in_max[i].dev_attr)))
-			goto exit_remove;
-	}
-
-	for (i = 0; i < 5; i++) {
-		if (data->has_fan & (1 << i)) {
-			if ((err = device_create_file(dev,
-					&sda_fan_input[i].dev_attr))
-				|| (err = device_create_file(dev,
-					&sda_fan_alarm[i].dev_attr)))
-				goto exit_remove;
-			if (sio_data->kind != nct6776) {
-				err = device_create_file(dev,
-						&sda_fan_div[i].dev_attr);
-				if (err)
-					goto exit_remove;
-			}
-			if (data->has_fan_min & (1 << i)) {
-				err = device_create_file(dev,
-						&sda_fan_min[i].dev_attr);
-				if (err)
-					goto exit_remove;
-			}
-			if (i < data->pwm_num &&
-				((err = device_create_file(dev,
-					&sda_pwm[i].dev_attr))
-				|| (err = device_create_file(dev,
-					&sda_pwm_mode[i].dev_attr))
-				|| (err = device_create_file(dev,
-					&sda_pwm_enable[i].dev_attr))
-				|| (err = device_create_file(dev,
-					&sda_target_temp[i].dev_attr))
-				|| (err = device_create_file(dev,
-					&sda_tolerance[i].dev_attr))))
-				goto exit_remove;
-		}
-	}
-
-	for (i = 0; i < NUM_REG_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
-			continue;
-		err = device_create_file(dev, &sda_temp_input[i].dev_attr);
-		if (err)
-			goto exit_remove;
-		if (data->temp_label) {
-			err = device_create_file(dev,
-						 &sda_temp_label[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-		if (i == 2 && data->temp3_val_only)
-			continue;
-		if (data->reg_temp_over[i]) {
-			err = device_create_file(dev,
-				&sda_temp_max[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-		if (data->reg_temp_hyst[i]) {
-			err = device_create_file(dev,
-				&sda_temp_max_hyst[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-		if (i > 2)
-			continue;
-		if ((err = device_create_file(dev,
-				&sda_temp_alarm[i].dev_attr))
-			|| (err = device_create_file(dev,
-				&sda_temp_type[i].dev_attr)))
-			goto exit_remove;
-		if (data->have_temp_offset & (1 << i)) {
-			err = device_create_file(dev,
-						 &sda_temp_offset[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-	}
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+							 data->name,
+							 data,
+							 &w83627ehf_chip_info,
+							 w83627ehf_groups);
 
-	err = device_create_file(dev, &sda_caseopen[0].dev_attr);
-	if (err)
-		goto exit_remove;
-
-	if (sio_data->kind == nct6776) {
-		err = device_create_file(dev, &sda_caseopen[1].dev_attr);
-		if (err)
-			goto exit_remove;
-	}
-
-	err = device_create_file(dev, &dev_attr_name);
-	if (err)
-		goto exit_remove;
-
-	data->hwmon_dev = hwmon_device_register(dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		err = PTR_ERR(data->hwmon_dev);
-		goto exit_remove;
-	}
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 
-exit_remove:
-	w83627ehf_device_remove_files(dev);
 exit_release:
 	release_region(res->start, IOREGION_LENGTH);
 exit:
@@ -2588,8 +2421,6 @@ static int w83627ehf_remove(struct platform_device *pdev)
 {
 	struct w83627ehf_data *data = platform_get_drvdata(pdev);
 
-	hwmon_device_unregister(data->hwmon_dev);
-	w83627ehf_device_remove_files(&pdev->dev);
 	release_region(data->addr, IOREGION_LENGTH);
 
 	return 0;
-- 
2.23.0

