Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261B5C77B73
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 04:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjDPEZo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 00:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjDPEZn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 00:25:43 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61339271C
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Apr 2023 21:25:40 -0700 (PDT)
IronPort-SDR: 643b78bf_TGXoHZXixJXO1ZUxpr+aFARaGwKPQT6GJydCcocVxMfx9yo
 cUUSO+6Zc7WUNpS1jtPyRO0hdLsorOP4qDd00Dg==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C6AACkdztkjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YItgk+WAp9dDwEPAQFEBAEBhQYChTwmNwYOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQEWFaA2GBAIBAycLAQ0BATcBDxk4VwYBEoJ+gl2vB?=
 =?us-ascii?q?DOBAYIIAQEGgmKaaoFeCYFBAYt0gRaDNnpCP4FOgRWBPIIthByGappWgTR2g?=
 =?us-ascii?q?SAOSnKBBAIJAhFrgRAIaoF5QAINZAsOb4FJgyoEAhREDlQDCQMHBUlAAwsYD?=
 =?us-ascii?q?RY6Eyw1FCBcbC0SEgUDCxUqRwQIOAYbNBECCA8SDyxEDEI3MxMGXAEpCw4RA?=
 =?us-ascii?q?05CGWwEggoGASYknyABWAE0MIF5B0oskjEBB7EJhAiBWZ8UTYFGgjeTUZF0L?=
 =?us-ascii?q?pdJIIIun2Qta4QsAgoHFoF5gX9NHxmDIk8DGQ+OIAwNCYIKkVFjPQIHCwEBA?=
 =?us-ascii?q?wmIbYJYAQE?=
IronPort-PHdr: A9a23:jRBV0hPX93bZqLRrVVwl6nczWUAX0o4cdiYf64Y8zblUe7ut+I7ue
 kHa+LNsgBnAQNaT4uhP3uzRta2oQmkc+dCbvXUFbJEJVgdQh8kaxV5/CceJW0Gnc664Nn5oF
 84bDA1u9CnkWXU=
IronPort-Data: A9a23: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
 NUC4TflC3BdGH2yqTo7vZRXWdta+84=
IronPort-HdrOrdr: A9a23:kcmRMamL8Wn38dBgV4IvDpyNw3DpDfL23DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKQgdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILsFvAH0WKA+UyHJ8SBzJ8+6U
 4IScEXY+EYT2IK6voSizPZLz9P+re6GC/Ev5an854Ud3AOV0h51XYENu+EKDwKeOCYP+tDKH
 JMjvA33QadRQ==
X-Talos-CUID: 9a23:n7yNDG1yJHdtA5CHdmkORbxfF9wuWyH2ljDsJl6WFUlFGbuoCgav9/Yx
X-Talos-MUID: 9a23:zU9VbQTftOtbFPTiRXTPrW49OdYr5p+zUhwVmM1duOKDFwp/bmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 16 Apr 2023 13:55:36 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33G4PCj43415316
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 16 Apr 2023 14:25:32 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33G4PCj43415316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681619132; bh=FzLyzpQ8eY6cpJNDC9SCzOjYHhQ33c38JIvf7wUhPdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MaChyRLquVUUdovLoNuluJ4IcmgHNLeC8/smVf+QQtGkzOzXygUjyXpuereR1CURE
         /sVArnvR59fh3DBLu5Jle6WLXxDJJU0UB3GLk56x9yizaoIfpZYtEy5ahQ3Im9asbX
         ln81KeQZFGzU/0l/3d1DbC8z33FpcRaE9VMx8BZbvgSsHXJAO8LclRcjlN69DQBGvz
         v4yMHBzNA0OJ/7Hry3NXuaDCJQL2QlY+cxQOo+epvKMWXVdk7AzavDXuw0hJ3k2G1M
         3EWwBzee+EWjmtMDG09YIgua2mIdXTY90JxdjqHym0cIyKHk8O7ODMbEYy3wFzkXBU
         LLPxZl5L2vTgg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 3/4] hwmon: (it87) Add calls to smbus_enable/smbus_disable as required
Date:   Sun, 16 Apr 2023 14:25:09 +1000
Message-Id: <20230416042510.1929077-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416042510.1929077-1-frank@crawford.emu.id.au>
References: <20230416042510.1929077-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 16 Apr 2023 14:25:32 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Disable/re-enable access through SMBus for chip registers when they are
are being read or written.

For simple cases this is done at the same time as when a mutex is set,
however, within loops or during initialisation it is done separately.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Reorder patches within patchset.
 * Remove spaces before tab.

---
 drivers/hwmon/it87.c | 181 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 135 insertions(+), 46 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 920fb9b6b2e2..2922f551b717 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -746,6 +746,7 @@ static int smbus_enable(struct it87_data *data)
 
 /*
  * Must be called with data->update_lock held, except during initialization.
+ * Must be called with SMBus accesses disabled.
  * We ignore the IT87 BUSY flag at this moment - it could lead to deadlocks,
  * would slow down the IT87 access and should not be necessary.
  */
@@ -757,6 +758,7 @@ static int it87_read_value(struct it87_data *data, u8 reg)
 
 /*
  * Must be called with data->update_lock held, except during initialization.
+ * Must be called with SMBus accesses disabled.
  * We ignore the IT87 BUSY flag at this moment - it could lead to deadlocks,
  * would slow down the IT87 access and should not be necessary.
  */
@@ -816,15 +818,39 @@ static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
 	}
 }
 
+static int it87_lock(struct it87_data *data)
+{
+	int err;
+
+	mutex_lock(&data->update_lock);
+	err = smbus_disable(data);
+	if (err)
+		mutex_unlock(&data->update_lock);
+	return err;
+}
+
+static void it87_unlock(struct it87_data *data)
+{
+	smbus_enable(data);
+	mutex_unlock(&data->update_lock);
+}
+
 static struct it87_data *it87_update_device(struct device *dev)
 {
 	struct it87_data *data = dev_get_drvdata(dev);
+	struct it87_data *ret = data;
+	int err;
 	int i;
 
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ + HZ / 2) ||
-	    !data->valid) {
+		       !data->valid) {
+		err = smbus_disable(data);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto unlock;
+		}
 		if (update_vbat) {
 			/*
 			 * Cleared after each update, so reenable.  Value
@@ -927,11 +953,11 @@ static struct it87_data *it87_update_device(struct device *dev)
 		}
 		data->last_updated = jiffies;
 		data->valid = true;
+		smbus_enable(data);
 	}
-
+unlock:
 	mutex_unlock(&data->update_lock);
-
-	return data;
+	return ret;
 }
 
 static ssize_t show_in(struct device *dev, struct device_attribute *attr,
@@ -956,17 +982,21 @@ static ssize_t set_in(struct device *dev, struct device_attribute *attr,
 	int index = sattr->index;
 	int nr = sattr->nr;
 	unsigned long val;
+	int err;
 
 	if (kstrtoul(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	data->in[nr][index] = in_to_reg(data, nr, val);
 	it87_write_value(data,
 			 index == 1 ? IT87_REG_VIN_MIN(nr)
 				    : IT87_REG_VIN_MAX(nr),
 			 data->in[nr][index]);
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1048,11 +1078,14 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	long val;
 	u8 reg, regval;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
 
 	switch (index) {
 	default:
@@ -1075,7 +1108,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 
 	data->temp[nr][index] = TEMP_TO_REG(val);
 	it87_write_value(data, reg, data->temp[nr][index]);
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1135,10 +1168,15 @@ static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	long val;
 	u8 reg, extra;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	reg = it87_read_value(data, IT87_REG_TEMP_ENABLE);
 	reg &= ~(1 << nr);
 	reg &= ~(8 << nr);
@@ -1161,17 +1199,19 @@ static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
 		reg |= (nr + 1) << 6;
 	else if (has_temp_old_peci(data, nr) && val == 6)
 		extra |= 0x80;
-	else if (val != 0)
-		return -EINVAL;
+	else if (val != 0) {
+		count = -EINVAL;
+		goto unlock;
+	}
 
-	mutex_lock(&data->update_lock);
 	data->sensor = reg;
 	data->extra = extra;
 	it87_write_value(data, IT87_REG_TEMP_ENABLE, data->sensor);
 	if (has_temp_old_peci(data, nr))
 		it87_write_value(data, IT87_REG_TEMP_EXTRA, data->extra);
 	data->valid = false;	/* Force cache refresh */
-	mutex_unlock(&data->update_lock);
+unlock:
+	it87_unlock(data);
 	return count;
 }
 
@@ -1287,12 +1327,15 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
 
 	struct it87_data *data = dev_get_drvdata(dev);
 	long val;
+	int err;
 	u8 reg;
 
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
 
 	if (has_16bit_fans(data)) {
 		data->fan[nr][index] = FAN16_TO_REG(val);
@@ -1319,7 +1362,7 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
 				 data->fan[nr][index]);
 	}
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1330,13 +1373,16 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	unsigned long val;
-	int min;
+	int min, err;
 	u8 old;
 
 	if (kstrtoul(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	old = it87_read_value(data, IT87_REG_FAN_DIV);
 
 	/* Save fan min limit */
@@ -1364,7 +1410,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	data->fan[nr][1] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
 	it87_write_value(data, IT87_REG_FAN_MIN[nr], data->fan[nr][1]);
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1405,6 +1451,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	long val;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 2)
 		return -EINVAL;
@@ -1415,7 +1462,9 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
 
 	if (val == 0) {
 		if (nr < 3 && data->type != it8603) {
@@ -1466,7 +1515,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 		}
 	}
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1477,11 +1526,15 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	long val;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 255)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	it87_update_pwm_ctrl(data, nr);
 	if (has_newer_autopwm(data)) {
 		/*
@@ -1489,8 +1542,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		 * is read-only so we can't write the value.
 		 */
 		if (data->pwm_ctrl[nr] & 0x80) {
-			mutex_unlock(&data->update_lock);
-			return -EBUSY;
+			count = -EBUSY;
+			goto unlock;
 		}
 		data->pwm_duty[nr] = pwm_to_reg(data, val);
 		it87_write_value(data, IT87_REG_PWM_DUTY[nr],
@@ -1507,7 +1560,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 					 data->pwm_ctrl[nr]);
 		}
 	}
-	mutex_unlock(&data->update_lock);
+unlock:
+	it87_unlock(data);
 	return count;
 }
 
@@ -1518,6 +1572,7 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	unsigned long val;
+	int err;
 	int i;
 
 	if (kstrtoul(buf, 10, &val) < 0)
@@ -1532,7 +1587,10 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
 			break;
 	}
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	if (nr == 0) {
 		data->fan_ctl = it87_read_value(data, IT87_REG_FAN_CTL) & 0x8f;
 		data->fan_ctl |= i << 4;
@@ -1542,7 +1600,7 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
 		data->extra |= i << 4;
 		it87_write_value(data, IT87_REG_TEMP_EXTRA, data->extra);
 	}
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 
 	return count;
 }
@@ -1575,6 +1633,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	long val;
+	int err;
 	u8 reg;
 
 	if (kstrtol(buf, 10, &val) < 0)
@@ -1597,7 +1656,10 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 		return -EINVAL;
 	}
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	it87_update_pwm_ctrl(data, nr);
 	data->pwm_temp_map[nr] = reg;
 	/*
@@ -1609,7 +1671,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 						data->pwm_temp_map[nr];
 		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
 	}
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1639,18 +1701,22 @@ static ssize_t set_auto_pwm(struct device *dev, struct device_attribute *attr,
 	int point = sensor_attr->index;
 	int regaddr;
 	long val;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 255)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	data->auto_pwm[nr][point] = pwm_to_reg(data, val);
 	if (has_newer_autopwm(data))
 		regaddr = IT87_REG_AUTO_TEMP(nr, 3);
 	else
 		regaddr = IT87_REG_AUTO_PWM(nr, point);
 	it87_write_value(data, regaddr, data->auto_pwm[nr][point]);
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1675,15 +1741,19 @@ static ssize_t set_auto_pwm_slope(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	unsigned long val;
+	int err;
 
 	if (kstrtoul(buf, 10, &val) < 0 || val > 127)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	data->auto_pwm[nr][1] = (data->auto_pwm[nr][1] & 0x80) | val;
 	it87_write_value(data, IT87_REG_AUTO_TEMP(nr, 4),
 			 data->auto_pwm[nr][1]);
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1718,11 +1788,15 @@ static ssize_t set_auto_temp(struct device *dev, struct device_attribute *attr,
 	int point = sensor_attr->index;
 	long val;
 	int reg;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0 || val < -128000 || val > 127000)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	if (has_newer_autopwm(data) && !point) {
 		reg = data->auto_temp[nr][1] - TEMP_TO_REG(val);
 		reg = clamp_val(reg, 0, 0x1f) | (data->auto_temp[nr][0] & 0xe0);
@@ -1735,7 +1809,7 @@ static ssize_t set_auto_temp(struct device *dev, struct device_attribute *attr,
 			point--;
 		it87_write_value(data, IT87_REG_AUTO_TEMP(nr, point), reg);
 	}
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1944,13 +2018,16 @@ static ssize_t clear_intrusion(struct device *dev,
 			       size_t count)
 {
 	struct it87_data *data = dev_get_drvdata(dev);
-	int config;
+	int err, config;
 	long val;
 
 	if (kstrtol(buf, 10, &val) < 0 || val != 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	config = it87_read_value(data, IT87_REG_CONFIG);
 	if (config < 0) {
 		count = config;
@@ -1960,8 +2037,7 @@ static ssize_t clear_intrusion(struct device *dev,
 		/* Invalidate cache to force re-read */
 		data->valid = false;
 	}
-	mutex_unlock(&data->update_lock);
-
+	it87_unlock(data);
 	return count;
 }
 
@@ -2003,18 +2079,22 @@ static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct it87_data *data = dev_get_drvdata(dev);
 	long val;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0 || (val != 0 && val != 1))
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
+
 	data->beeps = it87_read_value(data, IT87_REG_BEEP_ENABLE);
 	if (val)
 		data->beeps |= BIT(bitnr);
 	else
 		data->beeps &= ~BIT(bitnr);
 	it87_write_value(data, IT87_REG_BEEP_ENABLE, data->beeps);
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -3177,6 +3257,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
+	int err;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!devm_request_region(&pdev->dev, res->start, IT87_EC_EXTENT,
@@ -3222,15 +3303,21 @@ static int it87_probe(struct platform_device *pdev)
 		break;
 	}
 
-	/* Now, we do the remaining detection. */
-	if ((it87_read_value(data, IT87_REG_CONFIG) & 0x80) ||
-	    it87_read_value(data, IT87_REG_CHIPID) != 0x90)
-		return -ENODEV;
-
 	platform_set_drvdata(pdev, data);
 
 	mutex_init(&data->update_lock);
 
+	err = smbus_disable(data);
+	if (err)
+		return err;
+
+	/* Now, we do the remaining detection. */
+	if ((it87_read_value(data, IT87_REG_CONFIG) & 0x80) ||
+			     it87_read_value(data, IT87_REG_CHIPID) != 0x90) {
+		smbus_enable(data);
+		return -ENODEV;
+	}
+
 	/* Check PWM configuration */
 	enable_pwm_interface = it87_check_pwm(dev);
 	if (!enable_pwm_interface)
@@ -3291,6 +3378,8 @@ static int it87_probe(struct platform_device *pdev)
 	/* Initialize the IT87 chip */
 	it87_init_device(pdev);
 
+	smbus_enable(data);
+
 	if (!sio_data->skip_vid) {
 		data->has_vid = true;
 		data->vrm = vid_which_vrm();
@@ -3358,7 +3447,7 @@ static int it87_resume(struct device *dev)
 
 	it87_resume_sio(pdev);
 
-	mutex_lock(&data->update_lock);
+	it87_lock(data);
 
 	it87_check_pwm(dev);
 	it87_check_limit_regs(data);
@@ -3371,7 +3460,7 @@ static int it87_resume(struct device *dev)
 	/* force update */
 	data->valid = false;
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 
 	it87_update_device(dev);
 
-- 
2.39.2

