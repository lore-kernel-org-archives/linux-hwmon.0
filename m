Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B2EC76196
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Apr 2023 20:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDGUIl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Apr 2023 16:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjDGUIX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 16:08:23 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F167ABF
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Apr 2023 13:08:20 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id r16so31686626oij.5
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Apr 2023 13:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680898099; x=1683490099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCkowVk9CzGbZfyv50ZuyFlXLoWLrNWHxmHXEcVCipE=;
        b=mY13X7cKenLHasINMY7MspvTdEcjpTI/WCJ19plAu6+8m1bSGzCQ828oszmmG2JbhI
         9pwRvhnzKNWheYoxEyDAfdgX23J9Q5+wuqhxKYWX0FEanQ1Q8H4FlLNs9Cb0/UBARVlz
         b6eZ2e+l1bLO5970+GgWYIaO77dJoFx33KFyTVk+rZoZQX+UH6La5vH2t5KE3wf3Q1AG
         fyvDIzF6u5F4IHzw2/FHSjBsRqxqmaDKJACdx7HJczsTHjREBtZdAd6JTmSx8kapBIDC
         YU3t6HaLlMINBeKO2qTi3REQf0OdJqOoYw6rrSPWq6X+IluT785GCINEfnP44oRPKkSH
         PHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898099; x=1683490099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCkowVk9CzGbZfyv50ZuyFlXLoWLrNWHxmHXEcVCipE=;
        b=KhchGHyMeHUeozwRMgAIG+alV6EVR/ZeKhgPgpYlIrt8bKPxm/0HpHqG/dvD36WE+M
         BtWQep/IXk9fsZwfZ6y7GoruDfKV/jJzD1kMnESZUO73Z5Gm7Tq40n+PBBBdUnGrdqNb
         gRAQcQwi9pZQMd52BIuP/usbuLmRd/Nzm9rqc+kB37fuP2vNKfZH+jTWzAX8oIFAeMIm
         yqP0Mz3Fq8lrM7HuWxBqMlcZekmAG2rrkNU2xxcCAm3B+BArwBbpuR5u5I0Wab+deeKl
         VbwBQSzDpK+3uikmedff1daMn1qnRMuVCeCgCfH7F4CSAaDlbK/Arck0fCyfqVk7TZId
         m3Ng==
X-Gm-Message-State: AAQBX9ftpyioy/VjJMCLorgdLt5EIxYtkYP4f1ldvIctbNYaxTBSbCYX
        nS3VStAsxC4MU27YgZShC68=
X-Google-Smtp-Source: AKy350Z0Tw+KZ6nLFCHBlbajd0slm/EVtqdrVRUh36ayDNErSxz1wkZLFsFc59UzfmiSXlCBKW3B8w==
X-Received: by 2002:a54:450d:0:b0:38a:9c45:87c3 with SMTP id l13-20020a54450d000000b0038a9c4587c3mr1475568oil.14.1680898099437;
        Fri, 07 Apr 2023 13:08:19 -0700 (PDT)
Received: from nosdev3.dzsi.net ([210.97.13.31])
        by smtp.gmail.com with ESMTPSA id y82-20020aca3255000000b00387384dc768sm2009450oiy.9.2023.04.07.13.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 13:08:19 -0700 (PDT)
From:   Il Han <corone.il.han@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, Il Han <corone.il.han@gmail.com>
Subject: [PATCH] hwmon: (ctf2304) rewrote from scratch to implement new hwmon registration API
Date:   Sat,  8 Apr 2023 05:08:10 +0900
Message-Id: <20230407200810.693258-1-corone.il.han@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

rewrote from scratch to implement new hwmon registration API.

Signed-off-by: Il Han <corone.il.han@gmail.com>
---
 Documentation/hwmon/ctf2304.rst |   9 +-
 Documentation/hwmon/index.rst   |   1 +
 drivers/hwmon/Kconfig           |   5 +-
 drivers/hwmon/ctf2304.c         | 598 +++++++++++++++-----------------
 4 files changed, 285 insertions(+), 328 deletions(-)

diff --git a/Documentation/hwmon/ctf2304.rst b/Documentation/hwmon/ctf2304.rst
index d0e9ef9ea52e..46f4b1671795 100644
--- a/Documentation/hwmon/ctf2304.rst
+++ b/Documentation/hwmon/ctf2304.rst
@@ -21,8 +21,9 @@ Description
 
 This driver implements support for the Sensylink CTF2304 chip.
 
-The CTF2304 controls the speeds of up to four fans using four independent
-PWM outputs with local and remote temperature and remote voltage sensing.
+The CTF2304 is a system level thermal management solution chip, including
+1-channel local temperature, 8-channels remote temperature or voltage monitor
+and 4-channels fan speed monitor and driver with I2C/SMBus digital interface.
 
 
 Sysfs entries
@@ -31,11 +32,11 @@ Sysfs entries
 ================== === =======================================================
 fan[1-4]_input     RO  fan tachometer speed in RPM
 fan[1-4]_target    RW  desired fan speed in RPM
-fan[1-4]_div       RW  sets the RPM range of the fan.
+fan[1-4]_div       RW  sets the RPM range of the fan
 pwm[1-4]_enable    RW  regulator mode,
                        0=auto temperature mode, 1=manual mode, 2=rpm mode
 pwm[1-4]           RW  read: current pwm duty cycle,
                        write: target pwm duty cycle (0-255)
-in[1-8]_input      RO  measured output voltage
+in[0-7]_input      RO  measured output voltage
 temp[1-9]_input    RO  measured temperature
 ================== === =======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f1fe75f596a5..a74cd43a3916 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -54,6 +54,7 @@ Hardware Monitoring Kernel Drivers
    coretemp
    corsair-cpro
    corsair-psu
+   ctf2304
    da9052
    da9055
    dell-smm-hwmon
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index da9fbb0f8af3..df30a5a921de 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -478,8 +478,9 @@ config SENSORS_CTF2304
 	tristate "Sensylink CTF2304 sensor chip"
 	depends on I2C
 	help
-	  If you say yes here you get support for PWM and Fan Controller
-	  with temperature and voltage sensing.
+	  If you say yes here you get support for 1-channel local temperature,
+	  8-channels remote temperature or voltage monitor and 4-channels fan
+	  speed monitor and driver.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called ctf2304.
diff --git a/drivers/hwmon/ctf2304.c b/drivers/hwmon/ctf2304.c
index 5788740a57e5..42939e39babf 100644
--- a/drivers/hwmon/ctf2304.c
+++ b/drivers/hwmon/ctf2304.c
@@ -8,7 +8,6 @@
 
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
@@ -47,9 +46,12 @@
 #define FAN_RPM_MIN			480
 #define FAN_RPM_MAX			1966080
 
-#define FAN_COUNT_REG_MAX		0xFFF
+#define FAN_COUNT_REG_MAX		0xFFF0
 
-#define TEMP_FROM_REG(reg)		(((reg) * 1000) >> 8)
+#define TEMP_FROM_REG(reg, tr)		((tr) ? \
+					 (((((reg) & 0x7FF0) * 1000) >> 8) \
+					  + ((reg) >> 15) ? -64000 : 0) : \
+					 (((reg) * 1000) >> 8))
 #define VOLT_FROM_REG(reg, fs)		((((reg) >> 4) * (fs)) >> 12)
 #define DIV_FROM_REG(reg)		(1 << (reg))
 #define DIV_TO_REG(div)			((div == 8) ? 0x3 : \
@@ -71,7 +73,7 @@
 struct ctf2304_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
-	char valid; /* zero until following fields are valid */
+	bool valid; /* zero until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 
 	/* register values */
@@ -89,6 +91,7 @@ static struct ctf2304_data *ctf2304_update_device(struct device *dev)
 {
 	struct ctf2304_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
+	struct ctf2304_data *ret = data;
 	int i;
 	int rv;
 
@@ -97,427 +100,377 @@ static struct ctf2304_data *ctf2304_update_device(struct device *dev)
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
 		rv = i2c_smbus_read_word_swapped(client,
 				CTF2304_REG_LOCAL_TEMP);
-		if (rv >= 0)
-			data->local_temp = rv;
+		if (rv < 0)
+			goto abort;
+		data->local_temp = rv;
 
 		for (i = 0; i < NR_CHANNEL; i++) {
 			rv = i2c_smbus_read_word_swapped(client,
 					CTF2304_REG_REMOTE_CHANNEL(i));
-			if (rv >= 0)
-				data->remote_channel[i] = rv;
+			if (rv < 0)
+				goto abort;
+			data->remote_channel[i] = rv;
 		}
 
 		rv = i2c_smbus_read_word_swapped(client,
 				CTF2304_REG_FAN_CONFIG1);
-		if (rv >= 0)
-			data->fan_config1 = rv;
+		if (rv < 0)
+			goto abort;
+		data->fan_config1 = rv;
 		rv = i2c_smbus_read_word_swapped(client,
 				CTF2304_REG_FAN_CONFIG2);
-		if (rv >= 0)
-			data->fan_config2 = rv;
+		if (rv < 0)
+			goto abort;
+		data->fan_config2 = rv;
 		rv = i2c_smbus_read_word_swapped(client,
 				CTF2304_REG_FAN_RPM_CTRL);
-		if (rv >= 0)
-			data->fan_rpm_ctrl = rv;
+		if (rv < 0)
+			goto abort;
+		data->fan_rpm_ctrl = rv;
 
 		for (i = 0; i < NR_FAN_CHANNEL; i++) {
 			rv = i2c_smbus_read_word_swapped(client,
 					CTF2304_REG_TACH_COUNT(i));
-			if (rv >= 0)
-				data->tach[i] = rv;
+			if (rv < 0)
+				goto abort;
+			data->tach[i] = rv;
 			rv = i2c_smbus_read_word_swapped(client,
 					CTF2304_REG_PWMOUT(i));
-			if (rv >= 0)
-				data->pwm[i] = rv;
+			if (rv < 0)
+				goto abort;
+			data->pwm[i] = rv;
 			rv = i2c_smbus_read_word_swapped(client,
 					CTF2304_REG_TARGET_COUNT(i));
-			if (rv >= 0)
-				data->target_count[i] = rv;
+			if (rv < 0)
+				goto abort;
+			data->target_count[i] = rv;
 		}
 
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
+	goto done;
 
+abort:
+	data->valid = false;
+	ret = ERR_PTR(rv);
+
+done:
 	mutex_unlock(&data->update_lock);
 
 	return data;
 }
 
-static int register_to_temp(u16 reg, u16 config)
-{
-	if (config & CTF2304_FAN_CFG1_TRANGE)
-		return TEMP_FROM_REG(reg & 0x7FF0) + ((reg >> 15) ? -64000:0);
-	else
-		return TEMP_FROM_REG(reg);
-}
-
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static int ctf2304_read_temp(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ctf2304_data *data = ctf2304_update_device(dev);
 	u16 reg;
 
-	if (attr->index == 0)
-		reg = data->local_temp;
-	else
-		reg = data->remote_channel[attr->index-1];
-
-	return sprintf(buf, "%d\n", register_to_temp(reg, data->fan_config1));
+	switch (attr) {
+	case hwmon_temp_input:
+		if (channel == 0)
+			reg = data->local_temp;
+		else
+			reg = data->remote_channel[channel-1];
+		*val = TEMP_FROM_REG(reg, (data->fan_config1
+					   & CTF2304_FAN_CFG1_TRANGE));
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
+static const int full_scale[8] = { 2560, CTF2304_VCC, 4096, 2048, 1024, 512, 256, 256 };
+
 static int get_full_scale(u16 config)
 {
-	int full_scale;
 	u8 bits;
 
 	bits = (config >> CTF2304_FAN_CFG1_MODE_SHIFT)
 	       & CTF2304_FAN_CFG1_MODE_MASK;
 
-	if (bits == 0x0)
-		full_scale = 2560;
-	else if (bits == 0x1)
-		full_scale = CTF2304_VCC;
-	else if (bits == 0x2)
-		full_scale = 4096;
-	else if (bits == 0x3)
-		full_scale = 2048;
-	else if (bits == 0x4)
-		full_scale = 1024;
-	else if (bits == 0x5)
-		full_scale = 512;
-	else
-		full_scale = 256;
-
-	return full_scale;
+	return full_scale[bits];
 }
 
-static int register_to_volt(u16 reg, u16 config)
+static int ctf2304_read_in(struct device *dev, u32 attr, int channel,
+			   long *val)
 {
-	int full_scale;
-
-	full_scale = get_full_scale(config);
-
-	return VOLT_FROM_REG(reg, full_scale);
-}
-
-static ssize_t show_voltage(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ctf2304_data *data = ctf2304_update_device(dev);
-	int voltage;
-
-	voltage = register_to_volt(data->remote_channel[attr->index],
-			data->fan_config1);
-
-	return sprintf(buf, "%d\n", voltage);
-}
-
-static ssize_t get_fan(struct device *dev,
-		       struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ctf2304_data *data = ctf2304_update_device(dev);
-	int rpm;
 
-	rpm = RPM_FROM_REG(data->tach[attr->index]);
-
-	return sprintf(buf, "%d\n", rpm);
+	switch (attr) {
+	case hwmon_temp_input:
+		*val = VOLT_FROM_REG(data->remote_channel[channel],
+				     get_full_scale(data->fan_config1));
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t get_fan_target(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
+static int ctf2304_read_fan(struct device *dev, u32 attr, int channel,
+			    long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ctf2304_data *data = ctf2304_update_device(dev);
-	int rpm;
-
-	rpm = RPM_FROM_REG(data->target_count[attr->index]);
+	u8 bits;
 
-	return sprintf(buf, "%d\n", rpm);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (attr) {
+	case hwmon_fan_input:
+		if (data->tach[channel] == FAN_COUNT_REG_MAX)
+			*val = 0;
+		else
+			*val = RPM_FROM_REG(data->tach[channel]);
+		return 0;
+	case hwmon_fan_target:
+		*val = RPM_FROM_REG(data->target_count[channel]);
+		return 0;
+	case hwmon_fan_div:
+		bits = (data->fan_rpm_ctrl & CTF2304_FAN_DIV_MASK(channel))
+		       >> CTF2304_FAN_DIV_SHIFT(channel);
+		*val = DIV_FROM_REG(bits);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_fan_target(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static int ctf2304_write_fan(struct device *dev, u32 attr, int channel,
+			     long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ctf2304_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long rpm;
 	int target_count;
-	int err;
-
-	err = kstrtoul(buf, 10, &rpm);
-	if (err)
-		return err;
-
-	rpm = clamp_val(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
-	target_count = RPM_TO_REG(rpm);
-	target_count = clamp_val(target_count, 0x1, 0xFFF);
+	int err = 0;
 
 	mutex_lock(&data->update_lock);
 
-	data->target_count[attr->index] = target_count << 4;
-	i2c_smbus_write_word_swapped(client,
-			CTF2304_REG_TARGET_COUNT(attr->index),
-			data->target_count[attr->index]);
+	switch (attr) {
+	case hwmon_fan_target:
+		val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
+		target_count = RPM_TO_REG(val);
+		target_count = clamp_val(target_count, 0x1, 0xFFF);
+		data->target_count[channel] = target_count << 4;
+		err = i2c_smbus_write_word_swapped(client,
+				CTF2304_REG_TARGET_COUNT(channel),
+				data->target_count[channel]);
+		break;
+	case hwmon_fan_div:
+		data->fan_rpm_ctrl = (data->fan_rpm_ctrl
+				      & ~CTF2304_FAN_DIV_MASK(channel))
+				     | (DIV_TO_REG(val)
+					<< CTF2304_FAN_DIV_SHIFT(channel));
+		err = i2c_smbus_write_word_swapped(client,
+				CTF2304_REG_FAN_RPM_CTRL,
+				data->fan_rpm_ctrl);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
 
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err;
 }
 
-static ssize_t show_fan_div(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
+static int ctf2304_read_pwm(struct device *dev, u32 attr, int channel,
+			    long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ctf2304_data *data = ctf2304_update_device(dev);
 	u8 bits;
 
-	bits = (data->fan_rpm_ctrl & CTF2304_FAN_DIV_MASK(attr->index))
-	       >> CTF2304_FAN_DIV_SHIFT(attr->index);
-
-	return sprintf(buf, "%d\n", DIV_FROM_REG(bits));
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		*val = data->pwm[channel] >> 8;
+		return 0;
+	case hwmon_pwm_enable:
+		bits = (data->fan_config2
+			& CTF2304_FAN_CFG2_MODE_MASK(channel))
+		       >> CTF2304_FAN_CFG2_MODE_SHIFT(channel);
+		if (bits == CTF2304_FAN_CFG2_RPM_MODE)
+			*val = 2;
+		else if (bits == CTF2304_FAN_CFG2_DCY_MODE)
+			*val = 1;
+		else
+			*val = 0;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_fan_div(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf, size_t count)
+static int ctf2304_write_pwm(struct device *dev, u32 attr, int channel,
+			     long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ctf2304_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long div;
-	int err;
-
-	err = kstrtoul(buf, 10, &div);
-	if (err)
-		return err;
+	int err = 0;
 
 	mutex_lock(&data->update_lock);
 
-	data->fan_rpm_ctrl = (data->fan_rpm_ctrl
-			      & ~CTF2304_FAN_DIV_MASK(attr->index))
-			     | (DIV_TO_REG(div)
-				<< CTF2304_FAN_DIV_SHIFT(attr->index));
-
-	i2c_smbus_write_word_swapped(client,
-			CTF2304_REG_FAN_RPM_CTRL, data->fan_rpm_ctrl);
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255) {
+			err = -EINVAL;
+			break;
+		}
+		data->pwm[channel] = (data->pwm[channel] & 0xFF) | (val << 8);
+		err = i2c_smbus_write_word_swapped(client,
+						   CTF2304_REG_PWMOUT(channel),
+						   data->pwm[channel]);
+		break;
+	case hwmon_pwm_enable:
+		if (val == 0) {
+			data->fan_config2 = (data->fan_config2
+					     & ~CTF2304_FAN_CFG2_MODE_MASK(channel))
+					    | (CTF2304_FAN_CFG2_TEMP_MODE
+					       << CTF2304_FAN_CFG2_MODE_SHIFT(channel));
+		} else if (val == 1) {
+			data->fan_config2 = (data->fan_config2
+					     & ~CTF2304_FAN_CFG2_MODE_MASK(channel))
+					    | (CTF2304_FAN_CFG2_DCY_MODE
+					       << CTF2304_FAN_CFG2_MODE_SHIFT(channel));
+		} else if (val == 2) {
+			data->fan_config2 = (data->fan_config2
+					     & ~CTF2304_FAN_CFG2_MODE_MASK(channel))
+					    | (CTF2304_FAN_CFG2_RPM_MODE
+					       << CTF2304_FAN_CFG2_MODE_SHIFT(channel));
+		} else {
+			err = -EINVAL;
+			break;
+		}
+		err = i2c_smbus_write_word_swapped(client,
+						   CTF2304_REG_FAN_CONFIG2,
+						   data->fan_config2);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
 
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err;
 }
 
-static ssize_t get_pwm(struct device *dev,
-		       struct device_attribute *devattr, char *buf)
+static int ctf2304_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ctf2304_data *data = ctf2304_update_device(dev);
-	int pwm;
-
-	pwm = data->pwm[attr->index] >> 8;
-
-	return sprintf(buf, "%d\n", pwm);
-}
-
-static ssize_t set_pwm(struct device *dev,
-		       struct device_attribute *devattr,
-		       const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ctf2304_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long pwm;
-	int err;
-
-	err = kstrtoul(buf, 10, &pwm);
-	if (err)
-		return err;
-
-	pwm = clamp_val(pwm, 0, 255);
-
-	mutex_lock(&data->update_lock);
-
-	data->pwm[attr->index] = (data->pwm[attr->index] & 0xFF) | (pwm << 8);
-	i2c_smbus_write_word_swapped(client,
-			CTF2304_REG_PWMOUT(attr->index),
-			data->pwm[attr->index]);
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
+	switch (type) {
+	case hwmon_temp:
+		return ctf2304_read_temp(dev, attr, channel, val);
+	case hwmon_in:
+		return ctf2304_read_in(dev, attr, channel, val);
+	case hwmon_fan:
+		return ctf2304_read_fan(dev, attr, channel, val);
+	case hwmon_pwm:
+		return ctf2304_read_pwm(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t get_pwm_enable(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
+static int ctf2304_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ctf2304_data *data = ctf2304_update_device(dev);
-	int config;
-	int mode;
-
-	config = (data->fan_config2 & CTF2304_FAN_CFG2_MODE_MASK(attr->index))
-		 >> CTF2304_FAN_CFG2_MODE_SHIFT(attr->index);
-	if (config == CTF2304_FAN_CFG2_RPM_MODE)
-		mode = 2;
-	else if (config == CTF2304_FAN_CFG2_DCY_MODE)
-		mode = 1;
-	else
-		mode = 0;
-
-	return sprintf(buf, "%d\n", mode);
+	switch (type) {
+	case hwmon_fan:
+		return ctf2304_write_fan(dev, attr, channel, val);
+	case hwmon_pwm:
+		return ctf2304_write_pwm(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_pwm_enable(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static umode_t ctf2304_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ctf2304_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long mode;
-	int err;
-
-	err = kstrtoul(buf, 10, &mode);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-
-	switch (mode) {
-	case 0:
-		data->fan_config2 =
-			(data->fan_config2
-			 & ~CTF2304_FAN_CFG2_MODE_MASK(attr->index))
-			| (CTF2304_FAN_CFG2_TEMP_MODE
-			   << CTF2304_FAN_CFG2_MODE_SHIFT(attr->index));
-		break;
-	case 1:
-		data->fan_config2 =
-			(data->fan_config2
-			 & ~CTF2304_FAN_CFG2_MODE_MASK(attr->index))
-			| (CTF2304_FAN_CFG2_DCY_MODE
-			   << CTF2304_FAN_CFG2_MODE_SHIFT(attr->index));
-		break;
-	case 2:
-		data->fan_config2 =
-			(data->fan_config2
-			 & ~CTF2304_FAN_CFG2_MODE_MASK(attr->index))
-			| (CTF2304_FAN_CFG2_RPM_MODE
-			   << CTF2304_FAN_CFG2_MODE_SHIFT(attr->index));
+	switch (type) {
+	case hwmon_temp:
+	case hwmon_in:
+		return 0444;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_target:
+		case hwmon_fan_div:
+			return 0644;
+		default:
+			break;
+		}
 		break;
+	case hwmon_pwm:
+		return 0644;
 	default:
-		return -EINVAL;
+		break;
 	}
 
-	i2c_smbus_write_word_swapped(client,
-			CTF2304_REG_FAN_CONFIG2, data->fan_config2);
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, 0444, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, 0444, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, 0444, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, 0444, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_input, 0444, show_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_input, 0444, show_temp, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp7_input, 0444, show_temp, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp8_input, 0444, show_temp, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp9_input, 0444, show_temp, NULL, 8);
-static SENSOR_DEVICE_ATTR(in1_input, 0444, show_voltage, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_input, 0444, show_voltage, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_input, 0444, show_voltage, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_input, 0444, show_voltage, NULL, 3);
-static SENSOR_DEVICE_ATTR(in5_input, 0444, show_voltage, NULL, 4);
-static SENSOR_DEVICE_ATTR(in6_input, 0444, show_voltage, NULL, 5);
-static SENSOR_DEVICE_ATTR(in7_input, 0444, show_voltage, NULL, 6);
-static SENSOR_DEVICE_ATTR(in8_input, 0444, show_voltage, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan1_input, 0444, get_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, 0444, get_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, 0444, get_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, 0444, get_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan1_target, 0644,
-		get_fan_target, set_fan_target, 0);
-static SENSOR_DEVICE_ATTR(fan2_target, 0644,
-		get_fan_target, set_fan_target, 1);
-static SENSOR_DEVICE_ATTR(fan3_target, 0644,
-		get_fan_target, set_fan_target, 2);
-static SENSOR_DEVICE_ATTR(fan4_target, 0644,
-		get_fan_target, set_fan_target, 3);
-static SENSOR_DEVICE_ATTR(fan1_div, 0644, show_fan_div, set_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, 0644, show_fan_div, set_fan_div, 1);
-static SENSOR_DEVICE_ATTR(fan3_div, 0644, show_fan_div, set_fan_div, 2);
-static SENSOR_DEVICE_ATTR(fan4_div, 0644, show_fan_div, set_fan_div, 3);
-static SENSOR_DEVICE_ATTR(pwm1, 0644, get_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, 0644, get_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, 0644, get_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, 0644, get_pwm, set_pwm, 3);
-static SENSOR_DEVICE_ATTR(pwm1_enable, 0644,
-		get_pwm_enable, set_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, 0644,
-		get_pwm_enable, set_pwm_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm3_enable, 0644,
-		get_pwm_enable, set_pwm_enable, 2);
-static SENSOR_DEVICE_ATTR(pwm4_enable, 0644,
-		get_pwm_enable, set_pwm_enable, 3);
-
-static struct attribute *ctf2304_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp5_input.dev_attr.attr,
-	&sensor_dev_attr_temp6_input.dev_attr.attr,
-	&sensor_dev_attr_temp7_input.dev_attr.attr,
-	&sensor_dev_attr_temp8_input.dev_attr.attr,
-	&sensor_dev_attr_temp9_input.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
-	&sensor_dev_attr_in8_input.dev_attr.attr,
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan3_input.dev_attr.attr,
-	&sensor_dev_attr_fan4_input.dev_attr.attr,
-	&sensor_dev_attr_fan1_target.dev_attr.attr,
-	&sensor_dev_attr_fan2_target.dev_attr.attr,
-	&sensor_dev_attr_fan3_target.dev_attr.attr,
-	&sensor_dev_attr_fan4_target.dev_attr.attr,
-	&sensor_dev_attr_fan1_div.dev_attr.attr,
-	&sensor_dev_attr_fan2_div.dev_attr.attr,
-	&sensor_dev_attr_fan3_div.dev_attr.attr,
-	&sensor_dev_attr_fan4_div.dev_attr.attr,
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_pwm2.dev_attr.attr,
-	&sensor_dev_attr_pwm3.dev_attr.attr,
-	&sensor_dev_attr_pwm4.dev_attr.attr,
-	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
+static const struct hwmon_channel_info *ctf2304_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-ATTRIBUTE_GROUPS(ctf2304);
+static const struct hwmon_ops ctf2304_hwmon_ops = {
+	.is_visible = ctf2304_is_visible,
+	.read = ctf2304_read,
+	.write = ctf2304_write,
+};
 
-static int ctf2304_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static const struct hwmon_chip_info ctf2304_chip_info = {
+	.ops = &ctf2304_hwmon_ops,
+	.info = ctf2304_info,
+};
+
+static int ctf2304_probe(struct i2c_client *client)
 {
+	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct ctf2304_data *data;
 	struct device *hwmon_dev;
 
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
 	data = devm_kzalloc(dev, sizeof(struct ctf2304_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -525,9 +478,10 @@ static int ctf2304_probe(struct i2c_client *client,
 	data->client = client;
 	mutex_init(&data->update_lock);
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data,
-							   ctf2304_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &ctf2304_chip_info,
+							 NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
@@ -540,10 +494,10 @@ MODULE_DEVICE_TABLE(i2c, ctf2304_id);
 
 static struct i2c_driver ctf2304_driver = {
 	.class		= I2C_CLASS_HWMON,
-	.probe		= ctf2304_probe,
 	.driver = {
 		.name	= "ctf2304",
 	},
+	.probe_new	= ctf2304_probe,
 	.id_table	= ctf2304_id,
 };
 
-- 
2.26.3

