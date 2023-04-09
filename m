Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36279C77B6F
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Apr 2023 03:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjDIDrt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjDIDrs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Apr 2023 23:47:48 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 520965B9F
        for <linux-hwmon@vger.kernel.org>; Sat,  8 Apr 2023 20:47:46 -0700 (PDT)
IronPort-SDR: 64323560_BnCHLnH8RnoLxDsIy6M7rDnXXWETJ1eL8L2QooW+FeDN0Z+
 dAH+aNAHphdidblcioRbMaJOzYObtO96T6A48VQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C6AABgNDJkjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YItgk+Vf59eDwEPAQFEBAEBhQYChT0mNwYOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQEWFaA2GBAIBAycLAQ0BATcBDxk4VwYBEoJ+gl2sc?=
 =?us-ascii?q?zOBAYIIAQEGgmKaaoFeCYFBAYtzgRaDNnpCP4FOgRWBPIIshByGapovCoE0d?=
 =?us-ascii?q?oEgDkpzgQQCCQIRa4EQCGeBeUACDWQLDm+BSoMqBAIUZAMJAwcFSUADCxgNF?=
 =?us-ascii?q?joTLDUUIF5sLRISBQMLFSpHBAg4Bhw0EQIIDxIPLEQOQjczEwZcASkLDhEDT?=
 =?us-ascii?q?kEZbASCBwoGASYknmABWAE0MIIASiySMQEHsQGEB4FZnxRNgUaCN5NRkXQul?=
 =?us-ascii?q?0Uggi6fZC1rhCwCCgcWgXmBf00fGYMiTwMZD44gDA0JFYF1kVFjPQIHCwEBA?=
 =?us-ascii?q?wmIbYJYAQE?=
IronPort-PHdr: A9a23:ANnmeRQl2w8lJFE5wC+PhofP69pso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23: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
 T3EFqYc4jDqqn2xedsu2w==
IronPort-HdrOrdr: A9a23:0n6l+aNiPPxTT8BcThujsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re5cjyt3fP5Qr5PUtNpTnuAtjifZqxz/FICMwqTNOftWrdyQ2Vxf9ZnOnfKlTbckWUygce79
 YGT0EUMr3N5DZB4/oTb2SDYq4dKaG8gcWVbP/lvgtQpB9RGtxdBthCe32m+pwffng9OaYE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 09 Apr 2023 13:17:46 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3393lL5D3520033
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 9 Apr 2023 13:47:37 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3393lL5D3520033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681012057; bh=3cA6CT55Ntk+NVvnr/1W6iQ7ojZQrqAWuXeW5mfEmRQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NEAicRf04Pk4pbLVr75wzjTKwtPXvupOZ0z+EX4NeHb5pPwt0Th7uv3/xkSZat7OH
         vo/c3fG6PLKzV/ifds6vgsKfgHAhOPXnZuiw5dpY4y9tOecvXwZiBeSDbmS/YsdW3n
         UMg5e2EAgLZaanMniBZ9h7WF3d9TUByvocnQUdhhuaKCZ1BIZN7EOgKVJGnMvpcEqS
         q0jHKOLNez3QziDoJqi8pbhaQwCfnVD6iX6Z3NsaNFksZCnAaFi+XPSFa2IdmV0Vqa
         q415hEZow26/vsHR7prISxLKlrt92PxzRNg4hpnckIW9y4xc2eJ3zGKg9DwGV53rzx
         T3+iIWq8NTGAg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/4] hwmon: (it87) Add calls to smbus_enable/smbus_disable as required.
Date:   Sun,  9 Apr 2023 13:47:16 +1000
Message-Id: <20230409034718.1938695-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409034718.1938695-1-frank@crawford.emu.id.au>
References: <20230409034718.1938695-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 09 Apr 2023 13:47:37 +1000 (AEST)
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
 drivers/hwmon/it87.c | 181 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 135 insertions(+), 46 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index b74dd861f0fe..1ca3247efb9e 100644
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
@@ -953,17 +979,21 @@ static ssize_t set_in(struct device *dev, struct device_attribute *attr,
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
 
@@ -1042,11 +1072,14 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
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
@@ -1069,7 +1102,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 
 	data->temp[nr][index] = TEMP_TO_REG(val);
 	it87_write_value(data, reg, data->temp[nr][index]);
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1126,10 +1159,15 @@ static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
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
@@ -1152,17 +1190,19 @@ static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
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
 
@@ -1263,12 +1303,15 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
 
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
@@ -1295,7 +1338,7 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
 				 data->fan[nr][index]);
 	}
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1306,13 +1349,16 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
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
@@ -1340,7 +1386,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	data->fan[nr][1] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
 	it87_write_value(data, IT87_REG_FAN_MIN[nr], data->fan[nr][1]);
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1381,6 +1427,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	long val;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 2)
 		return -EINVAL;
@@ -1391,7 +1438,9 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	mutex_lock(&data->update_lock);
+	err = it87_lock(data);
+	if (err)
+		return err;
 
 	if (val == 0) {
 		if (nr < 3 && data->type != it8603) {
@@ -1442,7 +1491,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 		}
 	}
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1453,11 +1502,15 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
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
@@ -1465,8 +1518,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
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
@@ -1483,7 +1536,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 					 data->pwm_ctrl[nr]);
 		}
 	}
-	mutex_unlock(&data->update_lock);
+unlock:
+	it87_unlock(data);
 	return count;
 }
 
@@ -1494,6 +1548,7 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	unsigned long val;
+	int err;
 	int i;
 
 	if (kstrtoul(buf, 10, &val) < 0)
@@ -1508,7 +1563,10 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
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
@@ -1518,7 +1576,7 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
 		data->extra |= i << 4;
 		it87_write_value(data, IT87_REG_TEMP_EXTRA, data->extra);
 	}
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 
 	return count;
 }
@@ -1548,6 +1606,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
 	long val;
+	int err;
 	u8 reg;
 
 	if (kstrtol(buf, 10, &val) < 0)
@@ -1570,7 +1629,10 @@ static ssize_t set_pwm_temp_map(struct device *dev,
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
@@ -1582,7 +1644,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 						data->pwm_temp_map[nr];
 		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
 	}
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1609,18 +1671,22 @@ static ssize_t set_auto_pwm(struct device *dev, struct device_attribute *attr,
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
 
@@ -1642,15 +1708,19 @@ static ssize_t set_auto_pwm_slope(struct device *dev,
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
 
@@ -1682,11 +1752,15 @@ static ssize_t set_auto_temp(struct device *dev, struct device_attribute *attr,
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
@@ -1699,7 +1773,7 @@ static ssize_t set_auto_temp(struct device *dev, struct device_attribute *attr,
 			point--;
 		it87_write_value(data, IT87_REG_AUTO_TEMP(nr, point), reg);
 	}
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 	return count;
 }
 
@@ -1902,13 +1976,16 @@ static ssize_t clear_intrusion(struct device *dev,
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
@@ -1918,8 +1995,7 @@ static ssize_t clear_intrusion(struct device *dev,
 		/* Invalidate cache to force re-read */
 		data->valid = false;
 	}
-	mutex_unlock(&data->update_lock);
-
+	it87_unlock(data);
 	return count;
 }
 
@@ -1958,18 +2034,22 @@ static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
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
 
@@ -3129,6 +3209,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
+	int err;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!devm_request_region(&pdev->dev, res->start, IT87_EC_EXTENT,
@@ -3174,15 +3255,21 @@ static int it87_probe(struct platform_device *pdev)
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
+	    		     it87_read_value(data, IT87_REG_CHIPID) != 0x90) {
+		smbus_enable(data);
+		return -ENODEV;
+	}
+
 	/* Check PWM configuration */
 	enable_pwm_interface = it87_check_pwm(dev);
 	if (!enable_pwm_interface)
@@ -3243,6 +3330,8 @@ static int it87_probe(struct platform_device *pdev)
 	/* Initialize the IT87 chip */
 	it87_init_device(pdev);
 
+	smbus_enable(data);
+
 	if (!sio_data->skip_vid) {
 		data->has_vid = true;
 		data->vrm = vid_which_vrm();
@@ -3310,7 +3399,7 @@ static int it87_resume(struct device *dev)
 
 	it87_resume_sio(pdev);
 
-	mutex_lock(&data->update_lock);
+	it87_lock(data);
 
 	it87_check_pwm(dev);
 	it87_check_limit_regs(data);
@@ -3323,7 +3412,7 @@ static int it87_resume(struct device *dev)
 	/* force update */
 	data->valid = false;
 
-	mutex_unlock(&data->update_lock);
+	it87_unlock(data);
 
 	it87_update_device(dev);
 
-- 
2.39.2

