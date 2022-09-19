Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7422ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 10:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiISKrK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiISKqq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 06:46:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637E128710
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 03:32:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4F-0007mD-R7; Mon, 19 Sep 2022 12:31:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4G-001e1i-0i; Mon, 19 Sep 2022 12:31:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4D-001w9X-Ta; Mon, 19 Sep 2022 12:31:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jim Cromie <jim.cromie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] hwmon: pc87360: Reorder symbols to get rid of a few forward declarations
Date:   Mon, 19 Sep 2022 12:31:55 +0200
Message-Id: <20220919103155.795151-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
References: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=62156; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hTMfr1hNUUYFIohjmVnhagDVEWi3G4Ynfh7mZlsRp40=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKEUX9jFD6pHmJZWeJLj+wWw9e44Uk2y6k665Cojy ebAkQZWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyhFFwAKCRDB/BR4rcrsCa2qB/ 4pdFgkbfcq/Jg7FFOsDJB8B/N99iPFZeoqHK2lsOsHNfJmg8gnoYJHee7RvkFYuwpHqr/dDKYTFfIe kw9W5fVojxMlsAavrK7oP5JWEn50u0qaM/dTZMUMRhwK09is3lwPl432Ecj2PF85bwcII5d1DjjqKW k7DdZ4GeFm7AT4+byV+9vw7GK1mo9HklwMzQ0lTwzAnXzYjgkFsU1nysWVcarmGzb2yXpy9FEbHl1L rhvZUuXPEHXv1mt+k1mVxB5gadah/NNborZzqPnuhVmcMsJ+k9oCedsFcFNItbg7N2vS66wEBFLCR6 cYCMLO3lyEaa7UfQqFP0e1mJDeq+Bv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Declarations for static symbols are useless repetition unless there are
cyclic dependencies.

Reorder the functions and variables to get rid of 6 forward declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/pc87360.c | 1539 ++++++++++++++++++++-------------------
 1 file changed, 777 insertions(+), 762 deletions(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index b912926c8b18..a4adc8bd531f 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -37,6 +37,16 @@
 
 #define DRIVER_NAME "pc87360"
 
+/* (temp & vin) channel conversion status register flags (pdf sec.11.5.12) */
+#define CHAN_CNVRTD	0x80	/* new data ready */
+#define CHAN_ENA	0x01	/* enabled channel (temp or vin) */
+#define CHAN_ALM_ENA	0x10	/* propagate to alarms-reg ?? (chk val!) */
+#define CHAN_READY	(CHAN_ENA|CHAN_CNVRTD) /* sample ready mask */
+
+#define TEMP_OTS_OE	0x20	/* OTS Output Enable */
+#define VIN_RW1C_MASK	(CHAN_READY|CHAN_ALM_MAX|CHAN_ALM_MIN)   /* 0x87 */
+#define TEMP_RW1C_MASK	(VIN_RW1C_MASK|TEMP_ALM_CRIT|TEMP_FAULT) /* 0xCF */
+
 static u8 devid;
 static struct platform_device *pdev;
 static unsigned short extra_isa[3];
@@ -213,207 +223,205 @@ struct pc87360_data {
 };
 
 /*
- * Functions declaration
+ * ldi is the logical device index
+ * bank is for voltages and temperatures only
  */
-
-static int pc87360_probe(struct platform_device *pdev);
-static int pc87360_remove(struct platform_device *pdev);
-
 static int pc87360_read_value(struct pc87360_data *data, u8 ldi, u8 bank,
-			      u8 reg);
-static void pc87360_write_value(struct pc87360_data *data, u8 ldi, u8 bank,
-				u8 reg, u8 value);
-static void pc87360_init_device(struct platform_device *pdev,
-				int use_thermistors);
-static struct pc87360_data *pc87360_update_device(struct device *dev);
-
-/*
- * Driver data
- */
-static struct platform_driver pc87360_driver = {
-	.driver = {
-		.name	= DRIVER_NAME,
-	},
-	.probe		= pc87360_probe,
-	.remove		= pc87360_remove,
-};
+			      u8 reg)
+{
+	int res;
 
-/*
- * Sysfs stuff
- */
+	mutex_lock(&(data->lock));
+	if (bank != NO_BANK)
+		outb_p(bank, data->address[ldi] + PC87365_REG_BANK);
+	res = inb_p(data->address[ldi] + reg);
+	mutex_unlock(&(data->lock));
 
-static ssize_t fan_input_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan[attr->index],
-		       FAN_DIV_FROM_REG(data->fan_status[attr->index])));
-}
-static ssize_t fan_min_show(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan_min[attr->index],
-		       FAN_DIV_FROM_REG(data->fan_status[attr->index])));
-}
-static ssize_t fan_div_show(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n",
-		       FAN_DIV_FROM_REG(data->fan_status[attr->index]));
+	return res;
 }
-static ssize_t fan_status_show(struct device *dev,
-			       struct device_attribute *devattr, char *buf)
+
+static void pc87360_write_value(struct pc87360_data *data, u8 ldi, u8 bank,
+				u8 reg, u8 value)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n",
-		       FAN_STATUS_FROM_REG(data->fan_status[attr->index]));
+	mutex_lock(&(data->lock));
+	if (bank != NO_BANK)
+		outb_p(bank, data->address[ldi] + PC87365_REG_BANK);
+	outb_p(value, data->address[ldi] + reg);
+	mutex_unlock(&(data->lock));
 }
-static ssize_t fan_min_store(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+
+static void pc87360_autodiv(struct device *dev, int nr)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
-	long fan_min;
-	int err;
-
-	err = kstrtol(buf, 10, &fan_min);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	fan_min = FAN_TO_REG(fan_min,
-			     FAN_DIV_FROM_REG(data->fan_status[attr->index]));
+	u8 old_min = data->fan_min[nr];
 
-	/* If it wouldn't fit, change clock divisor */
-	while (fan_min > 255
-	    && (data->fan_status[attr->index] & 0x60) != 0x60) {
-		fan_min >>= 1;
-		data->fan[attr->index] >>= 1;
-		data->fan_status[attr->index] += 0x20;
+	/* Increase clock divider if needed and possible */
+	if ((data->fan_status[nr] & 0x04) /* overflow flag */
+	 || (data->fan[nr] >= 224)) { /* next to overflow */
+		if ((data->fan_status[nr] & 0x60) != 0x60) {
+			data->fan_status[nr] += 0x20;
+			data->fan_min[nr] >>= 1;
+			data->fan[nr] >>= 1;
+			dev_dbg(dev,
+				"Increasing clock divider to %d for fan %d\n",
+				FAN_DIV_FROM_REG(data->fan_status[nr]), nr + 1);
+		}
+	} else {
+		/* Decrease clock divider if possible */
+		while (!(data->fan_min[nr] & 0x80) /* min "nails" divider */
+		 && data->fan[nr] < 85 /* bad accuracy */
+		 && (data->fan_status[nr] & 0x60) != 0x00) {
+			data->fan_status[nr] -= 0x20;
+			data->fan_min[nr] <<= 1;
+			data->fan[nr] <<= 1;
+			dev_dbg(dev,
+				"Decreasing clock divider to %d for fan %d\n",
+				FAN_DIV_FROM_REG(data->fan_status[nr]),
+				nr + 1);
+		}
 	}
-	data->fan_min[attr->index] = fan_min > 255 ? 255 : fan_min;
-	pc87360_write_value(data, LD_FAN, NO_BANK,
-			    PC87360_REG_FAN_MIN(attr->index),
-			    data->fan_min[attr->index]);
-
-	/* Write new divider, preserve alarm bits */
-	pc87360_write_value(data, LD_FAN, NO_BANK,
-			    PC87360_REG_FAN_STATUS(attr->index),
-			    data->fan_status[attr->index] & 0xF9);
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-static struct sensor_device_attribute fan_input[] = {
-	SENSOR_ATTR_RO(fan1_input, fan_input, 0),
-	SENSOR_ATTR_RO(fan2_input, fan_input, 1),
-	SENSOR_ATTR_RO(fan3_input, fan_input, 2),
-};
-static struct sensor_device_attribute fan_status[] = {
-	SENSOR_ATTR_RO(fan1_status, fan_status, 0),
-	SENSOR_ATTR_RO(fan2_status, fan_status, 1),
-	SENSOR_ATTR_RO(fan3_status, fan_status, 2),
-};
-static struct sensor_device_attribute fan_div[] = {
-	SENSOR_ATTR_RO(fan1_div, fan_div, 0),
-	SENSOR_ATTR_RO(fan2_div, fan_div, 1),
-	SENSOR_ATTR_RO(fan3_div, fan_div, 2),
-};
-static struct sensor_device_attribute fan_min[] = {
-	SENSOR_ATTR_RW(fan1_min, fan_min, 0),
-	SENSOR_ATTR_RW(fan2_min, fan_min, 1),
-	SENSOR_ATTR_RW(fan3_min, fan_min, 2),
-};
 
-#define FAN_UNIT_ATTRS(X)		\
-{	&fan_input[X].dev_attr.attr,	\
-	&fan_status[X].dev_attr.attr,	\
-	&fan_div[X].dev_attr.attr,	\
-	&fan_min[X].dev_attr.attr,	\
-	NULL				\
+	/* Write new fan min if it changed */
+	if (old_min != data->fan_min[nr]) {
+		pc87360_write_value(data, LD_FAN, NO_BANK,
+				    PC87360_REG_FAN_MIN(nr),
+				    data->fan_min[nr]);
+	}
 }
 
-static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
-			char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n",
-		       PWM_FROM_REG(data->pwm[attr->index],
-				    FAN_CONFIG_INVERT(data->fan_conf,
-						      attr->index)));
-}
-static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
+static struct pc87360_data *pc87360_update_device(struct device *dev)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
-	long val;
-	int err;
-
-	err = kstrtol(buf, 10, &val);
-	if (err)
-		return err;
+	u8 i;
 
 	mutex_lock(&data->update_lock);
-	data->pwm[attr->index] = PWM_TO_REG(val,
-			      FAN_CONFIG_INVERT(data->fan_conf, attr->index));
-	pc87360_write_value(data, LD_FAN, NO_BANK, PC87360_REG_PWM(attr->index),
-			    data->pwm[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static struct sensor_device_attribute pwm[] = {
-	SENSOR_ATTR_RW(pwm1, pwm, 0),
-	SENSOR_ATTR_RW(pwm2, pwm, 1),
-	SENSOR_ATTR_RW(pwm3, pwm, 2),
-};
 
-static struct attribute *pc8736x_fan_attr[][5] = {
-	FAN_UNIT_ATTRS(0),
-	FAN_UNIT_ATTRS(1),
-	FAN_UNIT_ATTRS(2)
-};
+	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
+		dev_dbg(dev, "Data update\n");
 
-static const struct attribute_group pc8736x_fan_attr_group[] = {
-	{ .attrs = pc8736x_fan_attr[0], },
-	{ .attrs = pc8736x_fan_attr[1], },
-	{ .attrs = pc8736x_fan_attr[2], },
-};
+		/* Fans */
+		for (i = 0; i < data->fannr; i++) {
+			if (FAN_CONFIG_MONITOR(data->fan_conf, i)) {
+				data->fan_status[i] =
+					pc87360_read_value(data, LD_FAN,
+					NO_BANK, PC87360_REG_FAN_STATUS(i));
+				data->fan[i] = pc87360_read_value(data, LD_FAN,
+					       NO_BANK, PC87360_REG_FAN(i));
+				data->fan_min[i] = pc87360_read_value(data,
+						   LD_FAN, NO_BANK,
+						   PC87360_REG_FAN_MIN(i));
+				/* Change clock divider if needed */
+				pc87360_autodiv(dev, i);
+				/* Clear bits and write new divider */
+				pc87360_write_value(data, LD_FAN, NO_BANK,
+						    PC87360_REG_FAN_STATUS(i),
+						    data->fan_status[i]);
+			}
+			if (FAN_CONFIG_CONTROL(data->fan_conf, i))
+				data->pwm[i] = pc87360_read_value(data, LD_FAN,
+					       NO_BANK, PC87360_REG_PWM(i));
+		}
 
-static ssize_t in_input_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
-		       data->in_vref));
-}
-static ssize_t in_min_show(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index],
-		       data->in_vref));
-}
-static ssize_t in_max_show(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+		/* Voltages */
+		for (i = 0; i < data->innr; i++) {
+			data->in_status[i] = pc87360_read_value(data, LD_IN, i,
+					     PC87365_REG_IN_STATUS);
+			/* Clear bits */
+			pc87360_write_value(data, LD_IN, i,
+					    PC87365_REG_IN_STATUS,
+					    data->in_status[i]);
+			if ((data->in_status[i] & CHAN_READY) == CHAN_READY) {
+				data->in[i] = pc87360_read_value(data, LD_IN,
+					      i, PC87365_REG_IN);
+			}
+			if (data->in_status[i] & CHAN_ENA) {
+				data->in_min[i] = pc87360_read_value(data,
+						  LD_IN, i,
+						  PC87365_REG_IN_MIN);
+				data->in_max[i] = pc87360_read_value(data,
+						  LD_IN, i,
+						  PC87365_REG_IN_MAX);
+				if (i >= 11)
+					data->in_crit[i-11] =
+						pc87360_read_value(data, LD_IN,
+						i, PC87365_REG_TEMP_CRIT);
+			}
+		}
+		if (data->innr) {
+			data->in_alarms = pc87360_read_value(data, LD_IN,
+					  NO_BANK, PC87365_REG_IN_ALARMS1)
+					| ((pc87360_read_value(data, LD_IN,
+					    NO_BANK, PC87365_REG_IN_ALARMS2)
+					    & 0x07) << 8);
+			data->vid = (data->vid_conf & 0xE0) ?
+				    pc87360_read_value(data, LD_IN,
+				    NO_BANK, PC87365_REG_VID) : 0x1F;
+		}
+
+		/* Temperatures */
+		for (i = 0; i < data->tempnr; i++) {
+			data->temp_status[i] = pc87360_read_value(data,
+					       LD_TEMP, i,
+					       PC87365_REG_TEMP_STATUS);
+			/* Clear bits */
+			pc87360_write_value(data, LD_TEMP, i,
+					    PC87365_REG_TEMP_STATUS,
+					    data->temp_status[i]);
+			if ((data->temp_status[i] & CHAN_READY) == CHAN_READY) {
+				data->temp[i] = pc87360_read_value(data,
+						LD_TEMP, i,
+						PC87365_REG_TEMP);
+			}
+			if (data->temp_status[i] & CHAN_ENA) {
+				data->temp_min[i] = pc87360_read_value(data,
+						    LD_TEMP, i,
+						    PC87365_REG_TEMP_MIN);
+				data->temp_max[i] = pc87360_read_value(data,
+						    LD_TEMP, i,
+						    PC87365_REG_TEMP_MAX);
+				data->temp_crit[i] = pc87360_read_value(data,
+						     LD_TEMP, i,
+						     PC87365_REG_TEMP_CRIT);
+			}
+		}
+		if (data->tempnr) {
+			data->temp_alarms = pc87360_read_value(data, LD_TEMP,
+					    NO_BANK, PC87365_REG_TEMP_ALARMS)
+					    & 0x3F;
+		}
+
+		data->last_updated = jiffies;
+		data->valid = true;
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return data;
+}
+
+static ssize_t in_input_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index],
+	return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
 		       data->in_vref));
 }
+
+static struct sensor_device_attribute in_input[] = {
+	SENSOR_ATTR_RO(in0_input, in_input, 0),
+	SENSOR_ATTR_RO(in1_input, in_input, 1),
+	SENSOR_ATTR_RO(in2_input, in_input, 2),
+	SENSOR_ATTR_RO(in3_input, in_input, 3),
+	SENSOR_ATTR_RO(in4_input, in_input, 4),
+	SENSOR_ATTR_RO(in5_input, in_input, 5),
+	SENSOR_ATTR_RO(in6_input, in_input, 6),
+	SENSOR_ATTR_RO(in7_input, in_input, 7),
+	SENSOR_ATTR_RO(in8_input, in_input, 8),
+	SENSOR_ATTR_RO(in9_input, in_input, 9),
+	SENSOR_ATTR_RO(in10_input, in_input, 10),
+};
+
 static ssize_t in_status_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
@@ -421,6 +429,30 @@ static ssize_t in_status_show(struct device *dev,
 	struct pc87360_data *data = pc87360_update_device(dev);
 	return sprintf(buf, "%u\n", data->in_status[attr->index]);
 }
+
+static struct sensor_device_attribute in_status[] = {
+	SENSOR_ATTR_RO(in0_status, in_status, 0),
+	SENSOR_ATTR_RO(in1_status, in_status, 1),
+	SENSOR_ATTR_RO(in2_status, in_status, 2),
+	SENSOR_ATTR_RO(in3_status, in_status, 3),
+	SENSOR_ATTR_RO(in4_status, in_status, 4),
+	SENSOR_ATTR_RO(in5_status, in_status, 5),
+	SENSOR_ATTR_RO(in6_status, in_status, 6),
+	SENSOR_ATTR_RO(in7_status, in_status, 7),
+	SENSOR_ATTR_RO(in8_status, in_status, 8),
+	SENSOR_ATTR_RO(in9_status, in_status, 9),
+	SENSOR_ATTR_RO(in10_status, in_status, 10),
+};
+
+static ssize_t in_min_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index],
+		       data->in_vref));
+}
+
 static ssize_t in_min_store(struct device *dev,
 			    struct device_attribute *devattr, const char *buf,
 			    size_t count)
@@ -441,6 +473,30 @@ static ssize_t in_min_store(struct device *dev,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
+
+static struct sensor_device_attribute in_min[] = {
+	SENSOR_ATTR_RW(in0_min, in_min, 0),
+	SENSOR_ATTR_RW(in1_min, in_min, 1),
+	SENSOR_ATTR_RW(in2_min, in_min, 2),
+	SENSOR_ATTR_RW(in3_min, in_min, 3),
+	SENSOR_ATTR_RW(in4_min, in_min, 4),
+	SENSOR_ATTR_RW(in5_min, in_min, 5),
+	SENSOR_ATTR_RW(in6_min, in_min, 6),
+	SENSOR_ATTR_RW(in7_min, in_min, 7),
+	SENSOR_ATTR_RW(in8_min, in_min, 8),
+	SENSOR_ATTR_RW(in9_min, in_min, 9),
+	SENSOR_ATTR_RW(in10_min, in_min, 10),
+};
+
+static ssize_t in_max_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index],
+		       data->in_vref));
+}
+
 static ssize_t in_max_store(struct device *dev,
 			    struct device_attribute *devattr, const char *buf,
 			    size_t count)
@@ -463,45 +519,6 @@ static ssize_t in_max_store(struct device *dev,
 	return count;
 }
 
-static struct sensor_device_attribute in_input[] = {
-	SENSOR_ATTR_RO(in0_input, in_input, 0),
-	SENSOR_ATTR_RO(in1_input, in_input, 1),
-	SENSOR_ATTR_RO(in2_input, in_input, 2),
-	SENSOR_ATTR_RO(in3_input, in_input, 3),
-	SENSOR_ATTR_RO(in4_input, in_input, 4),
-	SENSOR_ATTR_RO(in5_input, in_input, 5),
-	SENSOR_ATTR_RO(in6_input, in_input, 6),
-	SENSOR_ATTR_RO(in7_input, in_input, 7),
-	SENSOR_ATTR_RO(in8_input, in_input, 8),
-	SENSOR_ATTR_RO(in9_input, in_input, 9),
-	SENSOR_ATTR_RO(in10_input, in_input, 10),
-};
-static struct sensor_device_attribute in_status[] = {
-	SENSOR_ATTR_RO(in0_status, in_status, 0),
-	SENSOR_ATTR_RO(in1_status, in_status, 1),
-	SENSOR_ATTR_RO(in2_status, in_status, 2),
-	SENSOR_ATTR_RO(in3_status, in_status, 3),
-	SENSOR_ATTR_RO(in4_status, in_status, 4),
-	SENSOR_ATTR_RO(in5_status, in_status, 5),
-	SENSOR_ATTR_RO(in6_status, in_status, 6),
-	SENSOR_ATTR_RO(in7_status, in_status, 7),
-	SENSOR_ATTR_RO(in8_status, in_status, 8),
-	SENSOR_ATTR_RO(in9_status, in_status, 9),
-	SENSOR_ATTR_RO(in10_status, in_status, 10),
-};
-static struct sensor_device_attribute in_min[] = {
-	SENSOR_ATTR_RW(in0_min, in_min, 0),
-	SENSOR_ATTR_RW(in1_min, in_min, 1),
-	SENSOR_ATTR_RW(in2_min, in_min, 2),
-	SENSOR_ATTR_RW(in3_min, in_min, 3),
-	SENSOR_ATTR_RW(in4_min, in_min, 4),
-	SENSOR_ATTR_RW(in5_min, in_min, 5),
-	SENSOR_ATTR_RW(in6_min, in_min, 6),
-	SENSOR_ATTR_RW(in7_min, in_min, 7),
-	SENSOR_ATTR_RW(in8_min, in_min, 8),
-	SENSOR_ATTR_RW(in9_min, in_min, 9),
-	SENSOR_ATTR_RW(in10_min, in_min, 10),
-};
 static struct sensor_device_attribute in_max[] = {
 	SENSOR_ATTR_RW(in0_max, in_max, 0),
 	SENSOR_ATTR_RW(in1_max, in_max, 1),
@@ -535,14 +552,6 @@ static ssize_t in_min_alarm_show(struct device *dev,
 
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MIN));
 }
-static ssize_t in_max_alarm_show(struct device *dev,
-				 struct device_attribute *devattr, char *buf)
-{
-	struct pc87360_data *data = pc87360_update_device(dev);
-	unsigned nr = to_sensor_dev_attr(devattr)->index;
-
-	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MAX));
-}
 
 static struct sensor_device_attribute in_min_alarm[] = {
 	SENSOR_ATTR_RO(in0_min_alarm, in_min_alarm, 0),
@@ -557,6 +566,16 @@ static struct sensor_device_attribute in_min_alarm[] = {
 	SENSOR_ATTR_RO(in9_min_alarm, in_min_alarm, 9),
 	SENSOR_ATTR_RO(in10_min_alarm, in_min_alarm, 10),
 };
+
+static ssize_t in_max_alarm_show(struct device *dev,
+				 struct device_attribute *devattr, char *buf)
+{
+	struct pc87360_data *data = pc87360_update_device(dev);
+	unsigned nr = to_sensor_dev_attr(devattr)->index;
+
+	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MAX));
+}
+
 static struct sensor_device_attribute in_max_alarm[] = {
 	SENSOR_ATTR_RO(in0_max_alarm, in_max_alarm, 0),
 	SENSOR_ATTR_RO(in1_max_alarm, in_max_alarm, 1),
@@ -593,6 +612,7 @@ static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 	struct pc87360_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%u\n", data->vrm);
 }
+
 static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
@@ -649,37 +669,39 @@ static ssize_t therm_input_show(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
 		       data->in_vref));
 }
-static ssize_t therm_min_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
+
+/*
+ * the +11 term below reflects the fact that VLM units 11,12,13 are
+ * used in the chip to measure voltage across the thermistors
+ */
+static struct sensor_device_attribute therm_input[] = {
+	SENSOR_ATTR_RO(temp4_input, therm_input, 0 + 11),
+	SENSOR_ATTR_RO(temp5_input, therm_input, 1 + 11),
+	SENSOR_ATTR_RO(temp6_input, therm_input, 2 + 11),
+};
+
+static ssize_t therm_status_show(struct device *dev,
+				 struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index],
-		       data->in_vref));
+	return sprintf(buf, "%u\n", data->in_status[attr->index]);
 }
-static ssize_t therm_max_show(struct device *dev,
+
+static struct sensor_device_attribute therm_status[] = {
+	SENSOR_ATTR_RO(temp4_status, therm_status, 0 + 11),
+	SENSOR_ATTR_RO(temp5_status, therm_status, 1 + 11),
+	SENSOR_ATTR_RO(temp6_status, therm_status, 2 + 11),
+};
+
+static ssize_t therm_min_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index],
-		       data->in_vref));
-}
-static ssize_t therm_crit_show(struct device *dev,
-			       struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_crit[attr->index-11],
+	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index],
 		       data->in_vref));
 }
-static ssize_t therm_status_show(struct device *dev,
-				 struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", data->in_status[attr->index]);
-}
 
 static ssize_t therm_min_store(struct device *dev,
 			       struct device_attribute *devattr,
@@ -702,14 +724,29 @@ static ssize_t therm_min_store(struct device *dev,
 	return count;
 }
 
-static ssize_t therm_max_store(struct device *dev,
-			       struct device_attribute *devattr,
-			       const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = dev_get_drvdata(dev);
-	long val;
-	int err;
+static struct sensor_device_attribute therm_min[] = {
+	SENSOR_ATTR_RW(temp4_min, therm_min, 0 + 11),
+	SENSOR_ATTR_RW(temp5_min, therm_min, 1 + 11),
+	SENSOR_ATTR_RW(temp6_min, therm_min, 2 + 11),
+};
+
+static ssize_t therm_max_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index],
+		       data->in_vref));
+}
+
+static ssize_t therm_max_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
 
 	err = kstrtol(buf, 10, &val);
 	if (err)
@@ -722,6 +759,22 @@ static ssize_t therm_max_store(struct device *dev,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
+
+static struct sensor_device_attribute therm_max[] = {
+	SENSOR_ATTR_RW(temp4_max, therm_max, 0 + 11),
+	SENSOR_ATTR_RW(temp5_max, therm_max, 1 + 11),
+	SENSOR_ATTR_RW(temp6_max, therm_max, 2 + 11),
+};
+
+static ssize_t therm_crit_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_crit[attr->index-11],
+		       data->in_vref));
+}
+
 static ssize_t therm_crit_store(struct device *dev,
 				struct device_attribute *devattr,
 				const char *buf, size_t count)
@@ -743,30 +796,6 @@ static ssize_t therm_crit_store(struct device *dev,
 	return count;
 }
 
-/*
- * the +11 term below reflects the fact that VLM units 11,12,13 are
- * used in the chip to measure voltage across the thermistors
- */
-static struct sensor_device_attribute therm_input[] = {
-	SENSOR_ATTR_RO(temp4_input, therm_input, 0 + 11),
-	SENSOR_ATTR_RO(temp5_input, therm_input, 1 + 11),
-	SENSOR_ATTR_RO(temp6_input, therm_input, 2 + 11),
-};
-static struct sensor_device_attribute therm_status[] = {
-	SENSOR_ATTR_RO(temp4_status, therm_status, 0 + 11),
-	SENSOR_ATTR_RO(temp5_status, therm_status, 1 + 11),
-	SENSOR_ATTR_RO(temp6_status, therm_status, 2 + 11),
-};
-static struct sensor_device_attribute therm_min[] = {
-	SENSOR_ATTR_RW(temp4_min, therm_min, 0 + 11),
-	SENSOR_ATTR_RW(temp5_min, therm_min, 1 + 11),
-	SENSOR_ATTR_RW(temp6_min, therm_min, 2 + 11),
-};
-static struct sensor_device_attribute therm_max[] = {
-	SENSOR_ATTR_RW(temp4_max, therm_max, 0 + 11),
-	SENSOR_ATTR_RW(temp5_max, therm_max, 1 + 11),
-	SENSOR_ATTR_RW(temp6_max, therm_max, 2 + 11),
-};
 static struct sensor_device_attribute therm_crit[] = {
 	SENSOR_ATTR_RW(temp4_crit, therm_crit, 0 + 11),
 	SENSOR_ATTR_RW(temp5_crit, therm_crit, 1 + 11),
@@ -777,7 +806,6 @@ static struct sensor_device_attribute therm_crit[] = {
  * show_therm_min/max_alarm() reads data from the per-channel voltage
  * status register (sec 11.5.12)
  */
-
 static ssize_t therm_min_alarm_show(struct device *dev,
 				    struct device_attribute *devattr,
 				    char *buf)
@@ -787,6 +815,13 @@ static ssize_t therm_min_alarm_show(struct device *dev,
 
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MIN));
 }
+
+static struct sensor_device_attribute therm_min_alarm[] = {
+	SENSOR_ATTR_RO(temp4_min_alarm, therm_min_alarm, 0 + 11),
+	SENSOR_ATTR_RO(temp5_min_alarm, therm_min_alarm, 1 + 11),
+	SENSOR_ATTR_RO(temp6_min_alarm, therm_min_alarm, 2 + 11),
+};
+
 static ssize_t therm_max_alarm_show(struct device *dev,
 				    struct device_attribute *devattr,
 				    char *buf)
@@ -796,6 +831,13 @@ static ssize_t therm_max_alarm_show(struct device *dev,
 
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MAX));
 }
+
+static struct sensor_device_attribute therm_max_alarm[] = {
+	SENSOR_ATTR_RO(temp4_max_alarm, therm_max_alarm, 0 + 11),
+	SENSOR_ATTR_RO(temp5_max_alarm, therm_max_alarm, 1 + 11),
+	SENSOR_ATTR_RO(temp6_max_alarm, therm_max_alarm, 2 + 11),
+};
+
 static ssize_t therm_crit_alarm_show(struct device *dev,
 				     struct device_attribute *devattr,
 				     char *buf)
@@ -806,16 +848,6 @@ static ssize_t therm_crit_alarm_show(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & TEMP_ALM_CRIT));
 }
 
-static struct sensor_device_attribute therm_min_alarm[] = {
-	SENSOR_ATTR_RO(temp4_min_alarm, therm_min_alarm, 0 + 11),
-	SENSOR_ATTR_RO(temp5_min_alarm, therm_min_alarm, 1 + 11),
-	SENSOR_ATTR_RO(temp6_min_alarm, therm_min_alarm, 2 + 11),
-};
-static struct sensor_device_attribute therm_max_alarm[] = {
-	SENSOR_ATTR_RO(temp4_max_alarm, therm_max_alarm, 0 + 11),
-	SENSOR_ATTR_RO(temp5_max_alarm, therm_max_alarm, 1 + 11),
-	SENSOR_ATTR_RO(temp6_max_alarm, therm_max_alarm, 2 + 11),
-};
 static struct sensor_device_attribute therm_crit_alarm[] = {
 	SENSOR_ATTR_RO(temp4_crit_alarm, therm_crit_alarm, 0 + 11),
 	SENSOR_ATTR_RO(temp5_crit_alarm, therm_crit_alarm, 1 + 11),
@@ -850,37 +882,32 @@ static ssize_t temp_input_show(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t temp_min_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[attr->index]));
-}
+static struct sensor_device_attribute temp_input[] = {
+	SENSOR_ATTR_RO(temp1_input, temp_input, 0),
+	SENSOR_ATTR_RO(temp2_input, temp_input, 1),
+	SENSOR_ATTR_RO(temp3_input, temp_input, 2),
+};
 
-static ssize_t temp_max_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
+static ssize_t temp_status_show(struct device *dev,
+				struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[attr->index]));
+	return sprintf(buf, "%d\n", data->temp_status[attr->index]);
 }
 
-static ssize_t temp_crit_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%d\n",
-		       TEMP_FROM_REG(data->temp_crit[attr->index]));
-}
+static struct sensor_device_attribute temp_status[] = {
+	SENSOR_ATTR_RO(temp1_status, temp_status, 0),
+	SENSOR_ATTR_RO(temp2_status, temp_status, 1),
+	SENSOR_ATTR_RO(temp3_status, temp_status, 2),
+};
 
-static ssize_t temp_status_show(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%d\n", data->temp_status[attr->index]);
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[attr->index]));
 }
 
 static ssize_t temp_min_store(struct device *dev,
@@ -904,6 +931,20 @@ static ssize_t temp_min_store(struct device *dev,
 	return count;
 }
 
+static struct sensor_device_attribute temp_min[] = {
+	SENSOR_ATTR_RW(temp1_min, temp_min, 0),
+	SENSOR_ATTR_RW(temp2_min, temp_min, 1),
+	SENSOR_ATTR_RW(temp3_min, temp_min, 2),
+};
+
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[attr->index]));
+}
+
 static ssize_t temp_max_store(struct device *dev,
 			      struct device_attribute *devattr,
 			      const char *buf, size_t count)
@@ -925,6 +966,21 @@ static ssize_t temp_max_store(struct device *dev,
 	return count;
 }
 
+static struct sensor_device_attribute temp_max[] = {
+	SENSOR_ATTR_RW(temp1_max, temp_max, 0),
+	SENSOR_ATTR_RW(temp2_max, temp_max, 1),
+	SENSOR_ATTR_RW(temp3_max, temp_max, 2),
+};
+
+static ssize_t temp_crit_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%d\n",
+		       TEMP_FROM_REG(data->temp_crit[attr->index]));
+}
+
 static ssize_t temp_crit_store(struct device *dev,
 			       struct device_attribute *devattr,
 			       const char *buf, size_t count)
@@ -946,47 +1002,17 @@ static ssize_t temp_crit_store(struct device *dev,
 	return count;
 }
 
-static struct sensor_device_attribute temp_input[] = {
-	SENSOR_ATTR_RO(temp1_input, temp_input, 0),
-	SENSOR_ATTR_RO(temp2_input, temp_input, 1),
-	SENSOR_ATTR_RO(temp3_input, temp_input, 2),
-};
-static struct sensor_device_attribute temp_status[] = {
-	SENSOR_ATTR_RO(temp1_status, temp_status, 0),
-	SENSOR_ATTR_RO(temp2_status, temp_status, 1),
-	SENSOR_ATTR_RO(temp3_status, temp_status, 2),
-};
-static struct sensor_device_attribute temp_min[] = {
-	SENSOR_ATTR_RW(temp1_min, temp_min, 0),
-	SENSOR_ATTR_RW(temp2_min, temp_min, 1),
-	SENSOR_ATTR_RW(temp3_min, temp_min, 2),
-};
-static struct sensor_device_attribute temp_max[] = {
-	SENSOR_ATTR_RW(temp1_max, temp_max, 0),
-	SENSOR_ATTR_RW(temp2_max, temp_max, 1),
-	SENSOR_ATTR_RW(temp3_max, temp_max, 2),
-};
 static struct sensor_device_attribute temp_crit[] = {
 	SENSOR_ATTR_RW(temp1_crit, temp_crit, 0),
 	SENSOR_ATTR_RW(temp2_crit, temp_crit, 1),
 	SENSOR_ATTR_RW(temp3_crit, temp_crit, 2),
 };
 
-static ssize_t alarms_temp_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct pc87360_data *data = pc87360_update_device(dev);
-	return sprintf(buf, "%u\n", data->temp_alarms);
-}
-
-static DEVICE_ATTR_RO(alarms_temp);
-
 /*
- * show_temp_min/max_alarm() reads data from the per-channel status
+ * temp_min/max_alarm_show() reads data from the per-channel status
  * register (sec 12.3.7), not the temp event status registers (sec
  * 12.3.2) that show_temp_alarm() reads (via data->temp_alarms)
  */
-
 static ssize_t temp_min_alarm_show(struct device *dev,
 				   struct device_attribute *devattr,
 				   char *buf)
@@ -997,6 +1023,12 @@ static ssize_t temp_min_alarm_show(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & CHAN_ALM_MIN));
 }
 
+static struct sensor_device_attribute temp_min_alarm[] = {
+	SENSOR_ATTR_RO(temp1_min_alarm, temp_min_alarm, 0),
+	SENSOR_ATTR_RO(temp2_min_alarm, temp_min_alarm, 1),
+	SENSOR_ATTR_RO(temp3_min_alarm, temp_min_alarm, 2),
+};
+
 static ssize_t temp_max_alarm_show(struct device *dev,
 				   struct device_attribute *devattr,
 				   char *buf)
@@ -1007,6 +1039,12 @@ static ssize_t temp_max_alarm_show(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & CHAN_ALM_MAX));
 }
 
+static struct sensor_device_attribute temp_max_alarm[] = {
+	SENSOR_ATTR_RO(temp1_max_alarm, temp_max_alarm, 0),
+	SENSOR_ATTR_RO(temp2_max_alarm, temp_max_alarm, 1),
+	SENSOR_ATTR_RO(temp3_max_alarm, temp_max_alarm, 2),
+};
+
 static ssize_t temp_crit_alarm_show(struct device *dev,
 				    struct device_attribute *devattr,
 				    char *buf)
@@ -1017,18 +1055,6 @@ static ssize_t temp_crit_alarm_show(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & TEMP_ALM_CRIT));
 }
 
-static struct sensor_device_attribute temp_min_alarm[] = {
-	SENSOR_ATTR_RO(temp1_min_alarm, temp_min_alarm, 0),
-	SENSOR_ATTR_RO(temp2_min_alarm, temp_min_alarm, 1),
-	SENSOR_ATTR_RO(temp3_min_alarm, temp_min_alarm, 2),
-};
-
-static struct sensor_device_attribute temp_max_alarm[] = {
-	SENSOR_ATTR_RO(temp1_max_alarm, temp_max_alarm, 0),
-	SENSOR_ATTR_RO(temp2_max_alarm, temp_max_alarm, 1),
-	SENSOR_ATTR_RO(temp3_max_alarm, temp_max_alarm, 2),
-};
-
 static struct sensor_device_attribute temp_crit_alarm[] = {
 	SENSOR_ATTR_RO(temp1_crit_alarm, temp_crit_alarm, 0),
 	SENSOR_ATTR_RO(temp2_crit_alarm, temp_crit_alarm, 1),
@@ -1044,6 +1070,7 @@ static ssize_t temp_fault_show(struct device *dev,
 
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & TEMP_FAULT));
 }
+
 static struct sensor_device_attribute temp_fault[] = {
 	SENSOR_ATTR_RO(temp1_fault, temp_fault, 0),
 	SENSOR_ATTR_RO(temp2_fault, temp_fault, 1),
@@ -1075,323 +1102,195 @@ static const struct attribute_group pc8736x_temp_attr_group[] = {
 	{ .attrs = pc8736x_temp_attr[2] }
 };
 
-static ssize_t name_show(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t alarms_temp_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
-	struct pc87360_data *data = dev_get_drvdata(dev);
-	return sprintf(buf, "%s\n", data->name);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", data->temp_alarms);
 }
 
-static DEVICE_ATTR_RO(name);
+static DEVICE_ATTR_RO(alarms_temp);
 
-/*
- * Device detection, registration and update
- */
+static ssize_t fan_input_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan[attr->index],
+		       FAN_DIV_FROM_REG(data->fan_status[attr->index])));
+}
 
-static int __init pc87360_find(int sioaddr, u8 *devid,
-			       unsigned short *addresses)
+static struct sensor_device_attribute fan_input[] = {
+	SENSOR_ATTR_RO(fan1_input, fan_input, 0),
+	SENSOR_ATTR_RO(fan2_input, fan_input, 1),
+	SENSOR_ATTR_RO(fan3_input, fan_input, 2),
+};
+
+static ssize_t fan_status_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
-	u16 val;
-	int i;
-	int nrdev; /* logical device count */
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n",
+		       FAN_STATUS_FROM_REG(data->fan_status[attr->index]));
+}
 
-	/* No superio_enter */
+static struct sensor_device_attribute fan_status[] = {
+	SENSOR_ATTR_RO(fan1_status, fan_status, 0),
+	SENSOR_ATTR_RO(fan2_status, fan_status, 1),
+	SENSOR_ATTR_RO(fan3_status, fan_status, 2),
+};
 
-	/* Identify device */
-	val = force_id ? force_id : superio_inb(sioaddr, DEVID);
-	switch (val) {
-	case 0xE1: /* PC87360 */
-	case 0xE8: /* PC87363 */
-	case 0xE4: /* PC87364 */
-		nrdev = 1;
-		break;
-	case 0xE5: /* PC87365 */
-	case 0xE9: /* PC87366 */
-		nrdev = 3;
-		break;
-	default:
-		superio_exit(sioaddr);
-		return -ENODEV;
-	}
-	/* Remember the device id */
-	*devid = val;
-
-	for (i = 0; i < nrdev; i++) {
-		/* select logical device */
-		superio_outb(sioaddr, DEV, logdev[i]);
-
-		val = superio_inb(sioaddr, ACT);
-		if (!(val & 0x01)) {
-			pr_info("Device 0x%02x not activated\n", logdev[i]);
-			continue;
-		}
-
-		val = (superio_inb(sioaddr, BASE) << 8)
-		    | superio_inb(sioaddr, BASE + 1);
-		if (!val) {
-			pr_info("Base address not set for device 0x%02x\n",
-				logdev[i]);
-			continue;
-		}
-
-		addresses[i] = val;
-
-		if (i == 0) { /* Fans */
-			confreg[0] = superio_inb(sioaddr, 0xF0);
-			confreg[1] = superio_inb(sioaddr, 0xF1);
-
-			pr_debug("Fan %d: mon=%d ctrl=%d inv=%d\n", 1,
-				 (confreg[0] >> 2) & 1, (confreg[0] >> 3) & 1,
-				 (confreg[0] >> 4) & 1);
-			pr_debug("Fan %d: mon=%d ctrl=%d inv=%d\n", 2,
-				 (confreg[0] >> 5) & 1, (confreg[0] >> 6) & 1,
-				 (confreg[0] >> 7) & 1);
-			pr_debug("Fan %d: mon=%d ctrl=%d inv=%d\n", 3,
-				 confreg[1] & 1, (confreg[1] >> 1) & 1,
-				 (confreg[1] >> 2) & 1);
-		} else if (i == 1) { /* Voltages */
-			/* Are we using thermistors? */
-			if (*devid == 0xE9) { /* PC87366 */
-				/*
-				 * These registers are not logical-device
-				 * specific, just that we won't need them if
-				 * we don't use the VLM device
-				 */
-				confreg[2] = superio_inb(sioaddr, 0x2B);
-				confreg[3] = superio_inb(sioaddr, 0x25);
-
-				if (confreg[2] & 0x40) {
-					pr_info("Using thermistors for temperature monitoring\n");
-				}
-				if (confreg[3] & 0xE0) {
-					pr_info("VID inputs routed (mode %u)\n",
-						confreg[3] >> 5);
-				}
-			}
-		}
-	}
-
-	superio_exit(sioaddr);
-	return 0;
+static ssize_t fan_div_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n",
+		       FAN_DIV_FROM_REG(data->fan_status[attr->index]));
 }
 
-static void pc87360_remove_files(struct device *dev)
-{
-	int i;
+static struct sensor_device_attribute fan_div[] = {
+	SENSOR_ATTR_RO(fan1_div, fan_div, 0),
+	SENSOR_ATTR_RO(fan2_div, fan_div, 1),
+	SENSOR_ATTR_RO(fan3_div, fan_div, 2),
+};
 
-	device_remove_file(dev, &dev_attr_name);
-	device_remove_file(dev, &dev_attr_alarms_temp);
-	for (i = 0; i < ARRAY_SIZE(pc8736x_temp_attr_group); i++)
-		sysfs_remove_group(&dev->kobj, &pc8736x_temp_attr_group[i]);
-	for (i = 0; i < ARRAY_SIZE(pc8736x_fan_attr_group); i++) {
-		sysfs_remove_group(&pdev->dev.kobj, &pc8736x_fan_attr_group[i]);
-		device_remove_file(dev, &pwm[i].dev_attr);
-	}
-	sysfs_remove_group(&dev->kobj, &pc8736x_therm_group);
-	sysfs_remove_group(&dev->kobj, &pc8736x_vin_group);
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan_min[attr->index],
+		       FAN_DIV_FROM_REG(data->fan_status[attr->index])));
 }
 
-static int pc87360_probe(struct platform_device *pdev)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
-	int i;
-	struct pc87360_data *data;
-	int err = 0;
-	const char *name;
-	int use_thermistors = 0;
-	struct device *dev = &pdev->dev;
-
-	data = devm_kzalloc(dev, sizeof(struct pc87360_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	switch (devid) {
-	default:
-		name = "pc87360";
-		data->fannr = 2;
-		break;
-	case 0xe8:
-		name = "pc87363";
-		data->fannr = 2;
-		break;
-	case 0xe4:
-		name = "pc87364";
-		data->fannr = 3;
-		break;
-	case 0xe5:
-		name = "pc87365";
-		data->fannr = extra_isa[0] ? 3 : 0;
-		data->innr = extra_isa[1] ? 11 : 0;
-		data->tempnr = extra_isa[2] ? 2 : 0;
-		break;
-	case 0xe9:
-		name = "pc87366";
-		data->fannr = extra_isa[0] ? 3 : 0;
-		data->innr = extra_isa[1] ? 14 : 0;
-		data->tempnr = extra_isa[2] ? 3 : 0;
-		break;
-	}
-
-	data->name = name;
-	mutex_init(&data->lock);
-	mutex_init(&data->update_lock);
-	platform_set_drvdata(pdev, data);
-
-	for (i = 0; i < LDNI_MAX; i++) {
-		data->address[i] = extra_isa[i];
-		if (data->address[i]
-		 && !devm_request_region(dev, extra_isa[i], PC87360_EXTENT,
-					 DRIVER_NAME)) {
-			dev_err(dev,
-				"Region 0x%x-0x%x already in use!\n",
-				extra_isa[i], extra_isa[i]+PC87360_EXTENT-1);
-			return -EBUSY;
-		}
-	}
-
-	/* Retrieve the fans configuration from Super-I/O space */
-	if (data->fannr)
-		data->fan_conf = confreg[0] | (confreg[1] << 8);
-
-	/*
-	 * Use the correct reference voltage
-	 * Unless both the VLM and the TMS logical devices agree to
-	 * use an external Vref, the internal one is used.
-	 */
-	if (data->innr) {
-		i = pc87360_read_value(data, LD_IN, NO_BANK,
-				       PC87365_REG_IN_CONFIG);
-		if (data->tempnr) {
-			i &= pc87360_read_value(data, LD_TEMP, NO_BANK,
-						PC87365_REG_TEMP_CONFIG);
-		}
-		data->in_vref = (i&0x02) ? 3025 : 2966;
-		dev_dbg(dev, "Using %s reference voltage\n",
-			(i&0x02) ? "external" : "internal");
-
-		data->vid_conf = confreg[3];
-		data->vrm = vid_which_vrm();
-	}
-
-	/* Fan clock dividers may be needed before any data is read */
-	for (i = 0; i < data->fannr; i++) {
-		if (FAN_CONFIG_MONITOR(data->fan_conf, i))
-			data->fan_status[i] = pc87360_read_value(data,
-					      LD_FAN, NO_BANK,
-					      PC87360_REG_FAN_STATUS(i));
-	}
-
-	if (init > 0) {
-		if (devid == 0xe9 && data->address[1]) /* PC87366 */
-			use_thermistors = confreg[2] & 0x40;
-
-		pc87360_init_device(pdev, use_thermistors);
-	}
-
-	/* Register all-or-nothing sysfs groups */
-
-	if (data->innr) {
-		err = sysfs_create_group(&dev->kobj, &pc8736x_vin_group);
-		if (err)
-			goto error;
-	}
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = dev_get_drvdata(dev);
+	long fan_min;
+	int err;
 
-	if (data->innr == 14) {
-		err = sysfs_create_group(&dev->kobj, &pc8736x_therm_group);
-		if (err)
-			goto error;
-	}
+	err = kstrtol(buf, 10, &fan_min);
+	if (err)
+		return err;
 
-	/* create device attr-files for varying sysfs groups */
+	mutex_lock(&data->update_lock);
+	fan_min = FAN_TO_REG(fan_min,
+			     FAN_DIV_FROM_REG(data->fan_status[attr->index]));
 
-	if (data->tempnr) {
-		for (i = 0; i < data->tempnr; i++) {
-			err = sysfs_create_group(&dev->kobj,
-						 &pc8736x_temp_attr_group[i]);
-			if (err)
-				goto error;
-		}
-		err = device_create_file(dev, &dev_attr_alarms_temp);
-		if (err)
-			goto error;
+	/* If it wouldn't fit, change clock divisor */
+	while (fan_min > 255
+	    && (data->fan_status[attr->index] & 0x60) != 0x60) {
+		fan_min >>= 1;
+		data->fan[attr->index] >>= 1;
+		data->fan_status[attr->index] += 0x20;
 	}
+	data->fan_min[attr->index] = fan_min > 255 ? 255 : fan_min;
+	pc87360_write_value(data, LD_FAN, NO_BANK,
+			    PC87360_REG_FAN_MIN(attr->index),
+			    data->fan_min[attr->index]);
 
-	for (i = 0; i < data->fannr; i++) {
-		if (FAN_CONFIG_MONITOR(data->fan_conf, i)) {
-			err = sysfs_create_group(&dev->kobj,
-						 &pc8736x_fan_attr_group[i]);
-			if (err)
-				goto error;
-		}
-		if (FAN_CONFIG_CONTROL(data->fan_conf, i)) {
-			err = device_create_file(dev, &pwm[i].dev_attr);
-			if (err)
-				goto error;
-		}
-	}
+	/* Write new divider, preserve alarm bits */
+	pc87360_write_value(data, LD_FAN, NO_BANK,
+			    PC87360_REG_FAN_STATUS(attr->index),
+			    data->fan_status[attr->index] & 0xF9);
+	mutex_unlock(&data->update_lock);
 
-	err = device_create_file(dev, &dev_attr_name);
-	if (err)
-		goto error;
+	return count;
+}
 
-	data->hwmon_dev = hwmon_device_register(dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		err = PTR_ERR(data->hwmon_dev);
-		goto error;
-	}
-	return 0;
+static struct sensor_device_attribute fan_min[] = {
+	SENSOR_ATTR_RW(fan1_min, fan_min, 0),
+	SENSOR_ATTR_RW(fan2_min, fan_min, 1),
+	SENSOR_ATTR_RW(fan3_min, fan_min, 2),
+};
 
-error:
-	pc87360_remove_files(dev);
-	return err;
+#define FAN_UNIT_ATTRS(X)		\
+{	&fan_input[X].dev_attr.attr,	\
+	&fan_status[X].dev_attr.attr,	\
+	&fan_div[X].dev_attr.attr,	\
+	&fan_min[X].dev_attr.attr,	\
+	NULL				\
 }
 
-static int pc87360_remove(struct platform_device *pdev)
-{
-	struct pc87360_data *data = platform_get_drvdata(pdev);
+static struct attribute *pc8736x_fan_attr[][5] = {
+	FAN_UNIT_ATTRS(0),
+	FAN_UNIT_ATTRS(1),
+	FAN_UNIT_ATTRS(2)
+};
 
-	hwmon_device_unregister(data->hwmon_dev);
-	pc87360_remove_files(&pdev->dev);
+static const struct attribute_group pc8736x_fan_attr_group[] = {
+	{ .attrs = pc8736x_fan_attr[0], },
+	{ .attrs = pc8736x_fan_attr[1], },
+	{ .attrs = pc8736x_fan_attr[2], },
+};
 
-	return 0;
+static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = pc87360_update_device(dev);
+	return sprintf(buf, "%u\n",
+		       PWM_FROM_REG(data->pwm[attr->index],
+				    FAN_CONFIG_INVERT(data->fan_conf,
+						      attr->index)));
 }
 
-/*
- * ldi is the logical device index
- * bank is for voltages and temperatures only
- */
-static int pc87360_read_value(struct pc87360_data *data, u8 ldi, u8 bank,
-			      u8 reg)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
-	int res;
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pc87360_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
 
-	mutex_lock(&(data->lock));
-	if (bank != NO_BANK)
-		outb_p(bank, data->address[ldi] + PC87365_REG_BANK);
-	res = inb_p(data->address[ldi] + reg);
-	mutex_unlock(&(data->lock));
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
 
-	return res;
+	mutex_lock(&data->update_lock);
+	data->pwm[attr->index] = PWM_TO_REG(val,
+			      FAN_CONFIG_INVERT(data->fan_conf, attr->index));
+	pc87360_write_value(data, LD_FAN, NO_BANK, PC87360_REG_PWM(attr->index),
+			    data->pwm[attr->index]);
+	mutex_unlock(&data->update_lock);
+	return count;
 }
 
-static void pc87360_write_value(struct pc87360_data *data, u8 ldi, u8 bank,
-				u8 reg, u8 value)
+static struct sensor_device_attribute pwm[] = {
+	SENSOR_ATTR_RW(pwm1, pwm, 0),
+	SENSOR_ATTR_RW(pwm2, pwm, 1),
+	SENSOR_ATTR_RW(pwm3, pwm, 2),
+};
+
+static ssize_t name_show(struct device *dev,
+			struct device_attribute *devattr, char *buf)
 {
-	mutex_lock(&(data->lock));
-	if (bank != NO_BANK)
-		outb_p(bank, data->address[ldi] + PC87365_REG_BANK);
-	outb_p(value, data->address[ldi] + reg);
-	mutex_unlock(&(data->lock));
+	struct pc87360_data *data = dev_get_drvdata(dev);
+	return sprintf(buf, "%s\n", data->name);
 }
 
-/* (temp & vin) channel conversion status register flags (pdf sec.11.5.12) */
-#define CHAN_CNVRTD	0x80	/* new data ready */
-#define CHAN_ENA	0x01	/* enabled channel (temp or vin) */
-#define CHAN_ALM_ENA	0x10	/* propagate to alarms-reg ?? (chk val!) */
-#define CHAN_READY	(CHAN_ENA|CHAN_CNVRTD) /* sample ready mask */
+static DEVICE_ATTR_RO(name);
 
-#define TEMP_OTS_OE	0x20	/* OTS Output Enable */
-#define VIN_RW1C_MASK	(CHAN_READY|CHAN_ALM_MAX|CHAN_ALM_MIN)   /* 0x87 */
-#define TEMP_RW1C_MASK	(VIN_RW1C_MASK|TEMP_ALM_CRIT|TEMP_FAULT) /* 0xCF */
+static void pc87360_remove_files(struct device *dev)
+{
+	int i;
+
+	device_remove_file(dev, &dev_attr_name);
+	device_remove_file(dev, &dev_attr_alarms_temp);
+	for (i = 0; i < ARRAY_SIZE(pc8736x_temp_attr_group); i++)
+		sysfs_remove_group(&dev->kobj, &pc8736x_temp_attr_group[i]);
+	for (i = 0; i < ARRAY_SIZE(pc8736x_fan_attr_group); i++) {
+		sysfs_remove_group(&pdev->dev.kobj, &pc8736x_fan_attr_group[i]);
+		device_remove_file(dev, &pwm[i].dev_attr);
+	}
+	sysfs_remove_group(&dev->kobj, &pc8736x_therm_group);
+	sysfs_remove_group(&dev->kobj, &pc8736x_vin_group);
+}
 
 static void pc87360_init_device(struct platform_device *pdev,
 				int use_thermistors)
@@ -1531,155 +1430,272 @@ static void pc87360_init_device(struct platform_device *pdev,
 			pc87360_write_value(data, LD_TEMP, NO_BANK, 0xE, 0x05);
 		}
 	}
-}
-
-static void pc87360_autodiv(struct device *dev, int nr)
-{
-	struct pc87360_data *data = dev_get_drvdata(dev);
-	u8 old_min = data->fan_min[nr];
+}
+
+static int pc87360_probe(struct platform_device *pdev)
+{
+	int i;
+	struct pc87360_data *data;
+	int err = 0;
+	const char *name;
+	int use_thermistors = 0;
+	struct device *dev = &pdev->dev;
+
+	data = devm_kzalloc(dev, sizeof(struct pc87360_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	switch (devid) {
+	default:
+		name = "pc87360";
+		data->fannr = 2;
+		break;
+	case 0xe8:
+		name = "pc87363";
+		data->fannr = 2;
+		break;
+	case 0xe4:
+		name = "pc87364";
+		data->fannr = 3;
+		break;
+	case 0xe5:
+		name = "pc87365";
+		data->fannr = extra_isa[0] ? 3 : 0;
+		data->innr = extra_isa[1] ? 11 : 0;
+		data->tempnr = extra_isa[2] ? 2 : 0;
+		break;
+	case 0xe9:
+		name = "pc87366";
+		data->fannr = extra_isa[0] ? 3 : 0;
+		data->innr = extra_isa[1] ? 14 : 0;
+		data->tempnr = extra_isa[2] ? 3 : 0;
+		break;
+	}
+
+	data->name = name;
+	mutex_init(&data->lock);
+	mutex_init(&data->update_lock);
+	platform_set_drvdata(pdev, data);
+
+	for (i = 0; i < LDNI_MAX; i++) {
+		data->address[i] = extra_isa[i];
+		if (data->address[i]
+		 && !devm_request_region(dev, extra_isa[i], PC87360_EXTENT,
+					 DRIVER_NAME)) {
+			dev_err(dev,
+				"Region 0x%x-0x%x already in use!\n",
+				extra_isa[i], extra_isa[i]+PC87360_EXTENT-1);
+			return -EBUSY;
+		}
+	}
+
+	/* Retrieve the fans configuration from Super-I/O space */
+	if (data->fannr)
+		data->fan_conf = confreg[0] | (confreg[1] << 8);
+
+	/*
+	 * Use the correct reference voltage
+	 * Unless both the VLM and the TMS logical devices agree to
+	 * use an external Vref, the internal one is used.
+	 */
+	if (data->innr) {
+		i = pc87360_read_value(data, LD_IN, NO_BANK,
+				       PC87365_REG_IN_CONFIG);
+		if (data->tempnr) {
+			i &= pc87360_read_value(data, LD_TEMP, NO_BANK,
+						PC87365_REG_TEMP_CONFIG);
+		}
+		data->in_vref = (i&0x02) ? 3025 : 2966;
+		dev_dbg(dev, "Using %s reference voltage\n",
+			(i&0x02) ? "external" : "internal");
+
+		data->vid_conf = confreg[3];
+		data->vrm = vid_which_vrm();
+	}
+
+	/* Fan clock dividers may be needed before any data is read */
+	for (i = 0; i < data->fannr; i++) {
+		if (FAN_CONFIG_MONITOR(data->fan_conf, i))
+			data->fan_status[i] = pc87360_read_value(data,
+					      LD_FAN, NO_BANK,
+					      PC87360_REG_FAN_STATUS(i));
+	}
+
+	if (init > 0) {
+		if (devid == 0xe9 && data->address[1]) /* PC87366 */
+			use_thermistors = confreg[2] & 0x40;
+
+		pc87360_init_device(pdev, use_thermistors);
+	}
+
+	/* Register all-or-nothing sysfs groups */
+
+	if (data->innr) {
+		err = sysfs_create_group(&dev->kobj, &pc8736x_vin_group);
+		if (err)
+			goto error;
+	}
+
+	if (data->innr == 14) {
+		err = sysfs_create_group(&dev->kobj, &pc8736x_therm_group);
+		if (err)
+			goto error;
+	}
+
+	/* create device attr-files for varying sysfs groups */
+
+	if (data->tempnr) {
+		for (i = 0; i < data->tempnr; i++) {
+			err = sysfs_create_group(&dev->kobj,
+						 &pc8736x_temp_attr_group[i]);
+			if (err)
+				goto error;
+		}
+		err = device_create_file(dev, &dev_attr_alarms_temp);
+		if (err)
+			goto error;
+	}
 
-	/* Increase clock divider if needed and possible */
-	if ((data->fan_status[nr] & 0x04) /* overflow flag */
-	 || (data->fan[nr] >= 224)) { /* next to overflow */
-		if ((data->fan_status[nr] & 0x60) != 0x60) {
-			data->fan_status[nr] += 0x20;
-			data->fan_min[nr] >>= 1;
-			data->fan[nr] >>= 1;
-			dev_dbg(dev,
-				"Increasing clock divider to %d for fan %d\n",
-				FAN_DIV_FROM_REG(data->fan_status[nr]), nr + 1);
+	for (i = 0; i < data->fannr; i++) {
+		if (FAN_CONFIG_MONITOR(data->fan_conf, i)) {
+			err = sysfs_create_group(&dev->kobj,
+						 &pc8736x_fan_attr_group[i]);
+			if (err)
+				goto error;
 		}
-	} else {
-		/* Decrease clock divider if possible */
-		while (!(data->fan_min[nr] & 0x80) /* min "nails" divider */
-		 && data->fan[nr] < 85 /* bad accuracy */
-		 && (data->fan_status[nr] & 0x60) != 0x00) {
-			data->fan_status[nr] -= 0x20;
-			data->fan_min[nr] <<= 1;
-			data->fan[nr] <<= 1;
-			dev_dbg(dev,
-				"Decreasing clock divider to %d for fan %d\n",
-				FAN_DIV_FROM_REG(data->fan_status[nr]),
-				nr + 1);
+		if (FAN_CONFIG_CONTROL(data->fan_conf, i)) {
+			err = device_create_file(dev, &pwm[i].dev_attr);
+			if (err)
+				goto error;
 		}
 	}
 
-	/* Write new fan min if it changed */
-	if (old_min != data->fan_min[nr]) {
-		pc87360_write_value(data, LD_FAN, NO_BANK,
-				    PC87360_REG_FAN_MIN(nr),
-				    data->fan_min[nr]);
+	err = device_create_file(dev, &dev_attr_name);
+	if (err)
+		goto error;
+
+	data->hwmon_dev = hwmon_device_register(dev);
+	if (IS_ERR(data->hwmon_dev)) {
+		err = PTR_ERR(data->hwmon_dev);
+		goto error;
 	}
+	return 0;
+
+error:
+	pc87360_remove_files(dev);
+	return err;
 }
 
-static struct pc87360_data *pc87360_update_device(struct device *dev)
+static int pc87360_remove(struct platform_device *pdev)
 {
-	struct pc87360_data *data = dev_get_drvdata(dev);
-	u8 i;
+	struct pc87360_data *data = platform_get_drvdata(pdev);
 
-	mutex_lock(&data->update_lock);
+	hwmon_device_unregister(data->hwmon_dev);
+	pc87360_remove_files(&pdev->dev);
 
-	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
-		dev_dbg(dev, "Data update\n");
+	return 0;
+}
 
-		/* Fans */
-		for (i = 0; i < data->fannr; i++) {
-			if (FAN_CONFIG_MONITOR(data->fan_conf, i)) {
-				data->fan_status[i] =
-					pc87360_read_value(data, LD_FAN,
-					NO_BANK, PC87360_REG_FAN_STATUS(i));
-				data->fan[i] = pc87360_read_value(data, LD_FAN,
-					       NO_BANK, PC87360_REG_FAN(i));
-				data->fan_min[i] = pc87360_read_value(data,
-						   LD_FAN, NO_BANK,
-						   PC87360_REG_FAN_MIN(i));
-				/* Change clock divider if needed */
-				pc87360_autodiv(dev, i);
-				/* Clear bits and write new divider */
-				pc87360_write_value(data, LD_FAN, NO_BANK,
-						    PC87360_REG_FAN_STATUS(i),
-						    data->fan_status[i]);
-			}
-			if (FAN_CONFIG_CONTROL(data->fan_conf, i))
-				data->pwm[i] = pc87360_read_value(data, LD_FAN,
-					       NO_BANK, PC87360_REG_PWM(i));
-		}
+/*
+ * Driver data
+ */
+static struct platform_driver pc87360_driver = {
+	.driver = {
+		.name	= DRIVER_NAME,
+	},
+	.probe		= pc87360_probe,
+	.remove		= pc87360_remove,
+};
 
-		/* Voltages */
-		for (i = 0; i < data->innr; i++) {
-			data->in_status[i] = pc87360_read_value(data, LD_IN, i,
-					     PC87365_REG_IN_STATUS);
-			/* Clear bits */
-			pc87360_write_value(data, LD_IN, i,
-					    PC87365_REG_IN_STATUS,
-					    data->in_status[i]);
-			if ((data->in_status[i] & CHAN_READY) == CHAN_READY) {
-				data->in[i] = pc87360_read_value(data, LD_IN,
-					      i, PC87365_REG_IN);
-			}
-			if (data->in_status[i] & CHAN_ENA) {
-				data->in_min[i] = pc87360_read_value(data,
-						  LD_IN, i,
-						  PC87365_REG_IN_MIN);
-				data->in_max[i] = pc87360_read_value(data,
-						  LD_IN, i,
-						  PC87365_REG_IN_MAX);
-				if (i >= 11)
-					data->in_crit[i-11] =
-						pc87360_read_value(data, LD_IN,
-						i, PC87365_REG_TEMP_CRIT);
-			}
+/*
+ * Device detection, registration and update
+ */
+
+static int __init pc87360_find(int sioaddr, u8 *devid,
+			       unsigned short *addresses)
+{
+	u16 val;
+	int i;
+	int nrdev; /* logical device count */
+
+	/* No superio_enter */
+
+	/* Identify device */
+	val = force_id ? force_id : superio_inb(sioaddr, DEVID);
+	switch (val) {
+	case 0xE1: /* PC87360 */
+	case 0xE8: /* PC87363 */
+	case 0xE4: /* PC87364 */
+		nrdev = 1;
+		break;
+	case 0xE5: /* PC87365 */
+	case 0xE9: /* PC87366 */
+		nrdev = 3;
+		break;
+	default:
+		superio_exit(sioaddr);
+		return -ENODEV;
+	}
+	/* Remember the device id */
+	*devid = val;
+
+	for (i = 0; i < nrdev; i++) {
+		/* select logical device */
+		superio_outb(sioaddr, DEV, logdev[i]);
+
+		val = superio_inb(sioaddr, ACT);
+		if (!(val & 0x01)) {
+			pr_info("Device 0x%02x not activated\n", logdev[i]);
+			continue;
 		}
-		if (data->innr) {
-			data->in_alarms = pc87360_read_value(data, LD_IN,
-					  NO_BANK, PC87365_REG_IN_ALARMS1)
-					| ((pc87360_read_value(data, LD_IN,
-					    NO_BANK, PC87365_REG_IN_ALARMS2)
-					    & 0x07) << 8);
-			data->vid = (data->vid_conf & 0xE0) ?
-				    pc87360_read_value(data, LD_IN,
-				    NO_BANK, PC87365_REG_VID) : 0x1F;
+
+		val = (superio_inb(sioaddr, BASE) << 8)
+		    | superio_inb(sioaddr, BASE + 1);
+		if (!val) {
+			pr_info("Base address not set for device 0x%02x\n",
+				logdev[i]);
+			continue;
 		}
 
-		/* Temperatures */
-		for (i = 0; i < data->tempnr; i++) {
-			data->temp_status[i] = pc87360_read_value(data,
-					       LD_TEMP, i,
-					       PC87365_REG_TEMP_STATUS);
-			/* Clear bits */
-			pc87360_write_value(data, LD_TEMP, i,
-					    PC87365_REG_TEMP_STATUS,
-					    data->temp_status[i]);
-			if ((data->temp_status[i] & CHAN_READY) == CHAN_READY) {
-				data->temp[i] = pc87360_read_value(data,
-						LD_TEMP, i,
-						PC87365_REG_TEMP);
-			}
-			if (data->temp_status[i] & CHAN_ENA) {
-				data->temp_min[i] = pc87360_read_value(data,
-						    LD_TEMP, i,
-						    PC87365_REG_TEMP_MIN);
-				data->temp_max[i] = pc87360_read_value(data,
-						    LD_TEMP, i,
-						    PC87365_REG_TEMP_MAX);
-				data->temp_crit[i] = pc87360_read_value(data,
-						     LD_TEMP, i,
-						     PC87365_REG_TEMP_CRIT);
+		addresses[i] = val;
+
+		if (i == 0) { /* Fans */
+			confreg[0] = superio_inb(sioaddr, 0xF0);
+			confreg[1] = superio_inb(sioaddr, 0xF1);
+
+			pr_debug("Fan %d: mon=%d ctrl=%d inv=%d\n", 1,
+				 (confreg[0] >> 2) & 1, (confreg[0] >> 3) & 1,
+				 (confreg[0] >> 4) & 1);
+			pr_debug("Fan %d: mon=%d ctrl=%d inv=%d\n", 2,
+				 (confreg[0] >> 5) & 1, (confreg[0] >> 6) & 1,
+				 (confreg[0] >> 7) & 1);
+			pr_debug("Fan %d: mon=%d ctrl=%d inv=%d\n", 3,
+				 confreg[1] & 1, (confreg[1] >> 1) & 1,
+				 (confreg[1] >> 2) & 1);
+		} else if (i == 1) { /* Voltages */
+			/* Are we using thermistors? */
+			if (*devid == 0xE9) { /* PC87366 */
+				/*
+				 * These registers are not logical-device
+				 * specific, just that we won't need them if
+				 * we don't use the VLM device
+				 */
+				confreg[2] = superio_inb(sioaddr, 0x2B);
+				confreg[3] = superio_inb(sioaddr, 0x25);
+
+				if (confreg[2] & 0x40) {
+					pr_info("Using thermistors for temperature monitoring\n");
+				}
+				if (confreg[3] & 0xE0) {
+					pr_info("VID inputs routed (mode %u)\n",
+						confreg[3] >> 5);
+				}
 			}
 		}
-		if (data->tempnr) {
-			data->temp_alarms = pc87360_read_value(data, LD_TEMP,
-					    NO_BANK, PC87365_REG_TEMP_ALARMS)
-					    & 0x3F;
-		}
-
-		data->last_updated = jiffies;
-		data->valid = true;
 	}
 
-	mutex_unlock(&data->update_lock);
-
-	return data;
+	superio_exit(sioaddr);
+	return 0;
 }
 
 static int __init pc87360_device_add(unsigned short address)
@@ -1778,7 +1794,6 @@ static void __exit pc87360_exit(void)
 	platform_driver_unregister(&pc87360_driver);
 }
 
-
 MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("PC8736x hardware monitor");
 MODULE_LICENSE("GPL");
-- 
2.37.2

