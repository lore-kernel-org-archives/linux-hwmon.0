Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F914389F
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129054; cv=none; b=NsBFjTAP8ZmcaXnp8OmgclThySA0GVdzWqZzM6z2Y6tzzsdPeP3l+iKjkyApJQy9/a36rzhFKCXw9ccti9ASPMG6DctMiCiiFUPKCZVUsywo2vUkh+9/90ZaeSVZEcLex54LMEXj8nx+xO9RBUFyCSgQHdzJdvPbUuDqyrElAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129054; c=relaxed/simple;
	bh=SE8x7ElzEj02p6L5ldM/1HhpMRKeg4zA2WFskxz/GJU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GZNCaBp38cJsicfEzwINdknaRphtPx7dae7k/aJ/5EawV2iuctSpWzkpv+1tCDHEk37QMxZeGFxfuCT/QFBxAN0GxuQqFYPAm2QxuwW8CjzY4PuJB6RD/VzXL4DyejzgKSJGolMMemSOvLK91BlhvcFBAe9neaiInWOEaVk5vFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtLVi3di; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtLVi3di"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7067108f2cdso733164b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129051; x=1720733851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUjCqcLJAoHtIkTsAxEvDiD5CBWAL7JIlIPUnZDZHJE=;
        b=MtLVi3diATrvdeOtgQuIo5KLOxC1exzUR1DsLJ7cgCqrRXcsiicrkWK5KT4yy5kCwk
         QJgWlShRdVcktiPgUIitTNo3kM+LdLl/x7nhSrzcBgYBzWcSmv83DSAAJ/fz4/0MSCVb
         z/IcaMlZMrPP9ur0UgHRjjNB/jWQIlC7a2DU/awIL5pgKa+7uA2ntPmJoJR45G8ilBPR
         nFZKIV6VX8yeoUggW3NNziivq6W7O08SESL0IDmZ2zeTq8cn4YhGuc3KxOZFJwkXY6ZI
         OjyoujgW8wj/+GO5t+3wIauAZSokJ/YgV+7BzAwJa0NsQ+lnk9ZFaKeGe25Y5rIvbDXu
         qHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129051; x=1720733851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UUjCqcLJAoHtIkTsAxEvDiD5CBWAL7JIlIPUnZDZHJE=;
        b=VHwBVZG4m4DSMwd0j5K8N9gnxkwvLrYjSF6sHjAf0upvsXGTRJ7yXss/bSxR7qfpQs
         AMzUtoTq5UtgOZrLGXrOsd6QD6EQTo3TXlyTJgqw7Lm4TWLV47JjbvW9nhIl50G3S21D
         fivJcvxqBineeTIOdodzNZNM2Wv5RSKGLQ/V/uLspWZZQwim7Y7H3jUILFTXpLfNhQmH
         o3uPkvG4Af0uHGyZ1wSEMfgaRW+ijbpc8vtgsV6qquBjSdTwQ+wOHJEbyUiEAi1HvC8V
         VjQPPWQQbxXroif6kAP46MOOXt1eqfwFfUxULPBQwI5eoJ16ruB+ikYiSkd3tr2it01A
         AkHQ==
X-Gm-Message-State: AOJu0Yxr/VQk++BOJsyLIxBGSOLgfKIx9c/H5yc2eWHw/82wVEgFmLJk
	87aXTu3G6MGPOdLckNrM5ekJCPsTYIld+nKMw07AJBJ9nZM3eUQHRwwG8A==
X-Google-Smtp-Source: AGHT+IFtIAbg3DRUNbuzAMypARxHOyNwUFi5VL6v4KjrLV/mkxVFQXOJzLUblbrmyByWWPOPlrEKcg==
X-Received: by 2002:a05:6a00:c8c:b0:705:c0a1:61d8 with SMTP id d2e1a72fcca58-70b00915013mr2800303b3a.4.1720129050979;
        Thu, 04 Jul 2024 14:37:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801007c62sm12738188b3a.0.2024.07.04.14.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/7] hwmon: (g762) Convert to with_info API
Date: Thu,  4 Jul 2024 14:37:12 -0700
Message-Id: <20240704213712.2699553-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704213712.2699553-1-linux@roeck-us.net>
References: <20240704213712.2699553-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to with_info API to simplify the code and make it easier
to maintain.

The conversion reduces code size by about 25%.

No functional change intended.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 473 ++++++++++++++++---------------------------
 1 file changed, 180 insertions(+), 293 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 5f8fd723a694..e513cd47fade 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -35,7 +35,6 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -154,11 +153,11 @@ static int do_set_clk_freq(struct device *dev, unsigned long val)
 }
 
 /* Set pwm mode. Accepts either 0 (PWM mode) or 1 (DC mode) */
-static int do_set_pwm_mode(struct device *dev, unsigned long val)
+static int do_set_pwm_mode(struct device *dev, long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (val && val != 1)
+	if (val < 0 || val > 1)
 		return -EINVAL;
 
 	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD1,
@@ -167,11 +166,11 @@ static int do_set_pwm_mode(struct device *dev, unsigned long val)
 }
 
 /* Set fan clock divisor. Accepts either 1, 2, 4 or 8. */
-static int do_set_fan_div(struct device *dev, unsigned long val)
+static int do_set_fan_div(struct device *dev, long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (hweight_long(val) != 1 || val > 8)
+	if (val < 0 || hweight_long(val) != 1 || val > 8)
 		return -EINVAL;
 
 	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD1,
@@ -193,7 +192,7 @@ static int do_set_fan_gear_mode(struct device *dev, u32 val)
 }
 
 /* Set number of fan pulses per revolution. Accepts either 2 or 4. */
-static int do_set_fan_pulses(struct device *dev, unsigned long val)
+static int do_set_fan_pulses(struct device *dev, long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
 
@@ -206,7 +205,7 @@ static int do_set_fan_pulses(struct device *dev, unsigned long val)
 }
 
 /* Set fan mode. Accepts either 1 (open-loop) or 2 (closed-loop). */
-static int do_set_pwm_enable(struct device *dev, unsigned long val)
+static int do_set_pwm_enable(struct device *dev, long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
@@ -255,11 +254,11 @@ static int do_set_pwm_polarity(struct device *dev, unsigned long val)
  * Set pwm value. Accepts values between 0 (stops the fan) and
  * 255 (full speed). This only makes sense in open-loop mode.
  */
-static int do_set_pwm(struct device *dev, unsigned long val)
+static int do_set_pwm(struct device *dev, long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (val > 255)
+	if (val < 0 || val > 255)
 		return -EINVAL;
 
 	return regmap_write(data->regmap, G762_REG_SET_OUT, val);
@@ -269,7 +268,7 @@ static int do_set_pwm(struct device *dev, unsigned long val)
  * Set fan RPM value. Can be called both in closed and open-loop mode
  * but effect will only be seen after closed-loop mode is configured.
  */
-static int do_set_fan_target(struct device *dev, unsigned long val)
+static int do_set_fan_target(struct device *dev, long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
@@ -277,6 +276,9 @@ static int do_set_fan_target(struct device *dev, unsigned long val)
 	u8 set_cnt;
 	int ret;
 
+	if (val < 0)
+		return -EINVAL;
+
 	mutex_lock(&data->update_lock);
 
 	ret = regmap_read(regmap, G762_REG_FAN_CMD1, &cmd1);
@@ -346,317 +348,201 @@ static int get_fan_rpm(struct g762_data *data, int reg)
 	return ret;
 }
 
-/*
- * Read function for fan1_input sysfs file. Return current fan RPM value, or
- * 0 if fan is out of control.
- */
-static ssize_t fan1_input_show(struct device *dev,
-			       struct device_attribute *da, char *buf)
+static int g762_fan_read(struct device *dev, u32 attr, long *val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
-	u32 status;
+	u32 regval;
 	int ret;
 
-	mutex_lock(&data->update_lock);
-	ret = regmap_read(data->regmap, G762_REG_FAN_STA, &status);
-	/* reverse logic: fan out of control reporting is enabled low */
-	if (ret || !(status & G762_REG_FAN_STA_OOC))
-		goto unlock;
-
-	ret = get_fan_rpm_locked(data, G762_REG_ACT_CNT);
-	if (ret < 0)
-		goto unlock;
-
-	ret = sprintf(buf, "%u\n", ret);
-unlock:
-	mutex_unlock(&data->update_lock);
-	return ret;
+	switch (attr) {
+	case hwmon_fan_target:
+		ret = get_fan_rpm(data, G762_REG_SET_CNT);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		break;
+	case hwmon_fan_div:
+		ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &regval);
+		if (ret < 0)
+			return ret;
+		*val = G762_CLKDIV_FROM_REG(regval);
+		break;
+	case hwmon_fan_pulses:
+		ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &regval);
+		if (ret < 0)
+			return ret;
+		*val = G762_PULSE_FROM_REG(regval);
+		break;
+	case hwmon_fan_input:
+		mutex_lock(&data->update_lock);
+		ret = regmap_read(data->regmap, G762_REG_FAN_STA, &regval);
+		if (ret || !(regval & G762_REG_FAN_STA_OOC)) {
+			mutex_unlock(&data->update_lock);
+			return ret ? : -ENODATA;
+		}
+		ret = get_fan_rpm_locked(data, G762_REG_ACT_CNT);
+		mutex_unlock(&data->update_lock);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		break;
+	case hwmon_fan_alarm:
+		ret = regmap_read(data->regmap, G762_REG_FAN_STA, &regval);
+		if (ret < 0)
+			return ret;
+		/* G762_REG_FAN_STA_OOC is active low */
+		*val = !(regval & G762_REG_FAN_STA_OOC);
+		break;
+	case hwmon_fan_fault:
+		ret = regmap_read(data->regmap, G762_REG_FAN_STA, &regval);
+		if (ret < 0)
+			return ret;
+		*val = !!(regval & G762_REG_FAN_STA_FAIL);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-/*
- * Read and write functions for pwm1_mode sysfs file. Get and set fan speed
- * control mode i.e. PWM (1) or DC (0).
- */
-static ssize_t pwm1_mode_show(struct device *dev, struct device_attribute *da,
-			      char *buf)
+static int g762_pwm_read(struct device *dev, u32 attr, long *val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
-	u32 cmd1;
+	u32 regval;
 	int ret;
 
-	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%d\n", !!(cmd1 & G762_REG_FAN_CMD1_OUT_MODE));
+	switch (attr) {
+	case hwmon_pwm_input:
+		ret = regmap_read(data->regmap, G762_REG_SET_OUT, &regval);
+		if (ret < 0)
+			return ret;
+		*val = regval;
+		break;
+	case hwmon_pwm_mode:
+		ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &regval);
+		if (ret < 0)
+			return ret;
+		*val = !!(regval & G762_REG_FAN_CMD1_OUT_MODE);
+		break;
+	case hwmon_pwm_enable:
+		ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &regval);
+		if (ret < 0)
+			return ret;
+		*val = !!(regval & G762_REG_FAN_CMD1_FAN_MODE) + 1;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-static ssize_t pwm1_mode_store(struct device *dev,
-			       struct device_attribute *da, const char *buf,
-			       size_t count)
+static int g762_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
 {
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-
-	ret = do_set_pwm_mode(dev, val);
-	if (ret < 0)
-		return ret;
-
-	return count;
+	switch (type) {
+	case hwmon_fan:
+		return g762_fan_read(dev, attr, val);
+	case hwmon_pwm:
+		return g762_pwm_read(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-/*
- * Read and write functions for fan1_div sysfs file. Get and set fan
- * controller prescaler value
- */
-static ssize_t fan1_div_show(struct device *dev, struct device_attribute *da,
-			     char *buf)
+static int g762_fan_write(struct device *dev, u32 attr, long val)
 {
-	struct g762_data *data = dev_get_drvdata(dev);
-	u32 cmd1;
-	int ret;
-
-	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%ld\n", G762_CLKDIV_FROM_REG(cmd1));
+	switch (attr) {
+	case hwmon_fan_target:
+		return do_set_fan_target(dev, val);
+	case hwmon_fan_div:
+		return do_set_fan_div(dev, val);
+	case hwmon_fan_pulses:
+		return do_set_fan_pulses(dev, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
-			      const char *buf, size_t count)
+static int g762_pwm_write(struct device *dev, u32 attr, long val)
 {
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-
-	ret = do_set_fan_div(dev, val);
-	if (ret < 0)
-		return ret;
-
-	return count;
+	switch (attr) {
+	case hwmon_pwm_input:
+		return do_set_pwm(dev, val);
+	case hwmon_pwm_mode:
+		return do_set_pwm_mode(dev, val);
+	case hwmon_pwm_enable:
+		return do_set_pwm_enable(dev, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-/*
- * Read and write functions for fan1_pulses sysfs file. Get and set number
- * of tachometer pulses per fan revolution.
- */
-static ssize_t fan1_pulses_show(struct device *dev,
-				struct device_attribute *da, char *buf)
+static int g762_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
 {
-	struct g762_data *data = dev_get_drvdata(dev);
-	u32 cmd1;
-	int ret;
-
-	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%ld\n", G762_PULSE_FROM_REG(cmd1));
+	switch (type) {
+	case hwmon_fan:
+		return g762_fan_write(dev, attr, val);
+	case hwmon_pwm:
+		return g762_pwm_write(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t fan1_pulses_store(struct device *dev,
-				 struct device_attribute *da, const char *buf,
-				 size_t count)
+static umode_t g762_is_visible(const void *_data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
 {
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-
-	ret = do_set_fan_pulses(dev, val);
-	if (ret < 0)
-		return ret;
-
-	return count;
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_alarm:
+		case hwmon_fan_fault:
+			return 0444;
+		case hwmon_fan_target:
+		case hwmon_fan_div:
+		case hwmon_fan_pulses:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+		case hwmon_pwm_mode:
+		case hwmon_pwm_enable:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
 }
 
-/*
- * Read and write functions for pwm1_enable. Get and set fan speed control mode
- * (i.e. closed or open-loop).
- *
- * Following documentation about hwmon's sysfs interface, a pwm1_enable node
- * should accept the following:
- *
- *  0 : no fan speed control (i.e. fan at full speed)
- *  1 : manual fan speed control enabled (use pwm[1-*]) (open-loop)
- *  2+: automatic fan speed control enabled (use fan[1-*]_target) (closed-loop)
- *
- * but we do not accept 0 as this mode is not natively supported by the chip
- * and it is not emulated by g762 driver. -EINVAL is returned in this case.
- */
-static ssize_t pwm1_enable_show(struct device *dev,
-				struct device_attribute *da, char *buf)
-{
-	struct g762_data *data = dev_get_drvdata(dev);
-	u32 cmd1;
-	int ret;
-
-	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%d\n",
-		       !!(cmd1 & G762_REG_FAN_CMD1_FAN_MODE) + 1);
-}
-
-static ssize_t pwm1_enable_store(struct device *dev,
-				 struct device_attribute *da, const char *buf,
-				 size_t count)
-{
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-
-	ret = do_set_pwm_enable(dev, val);
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
-/*
- * Read and write functions for pwm1 sysfs file. Get and set pwm value
- * (which affects fan speed) in open-loop mode. 0 stops the fan and 255
- * makes it run at full speed.
- */
-static ssize_t pwm1_show(struct device *dev, struct device_attribute *da,
-			 char *buf)
-{
-	struct g762_data *data = dev_get_drvdata(dev);
-	int ret;
-	u32 pwm;
-
-	ret = regmap_read(data->regmap, G762_REG_SET_OUT, &pwm);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%u\n", pwm);
-}
-
-static ssize_t pwm1_store(struct device *dev, struct device_attribute *da,
-			  const char *buf, size_t count)
-{
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-
-	ret = do_set_pwm(dev, val);
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
-/*
- * Read and write function for fan1_target sysfs file. Get/set the fan speed in
- * closed-loop mode. Speed is given as a RPM value; then the chip will regulate
- * the fan speed using pulses from fan tachometer.
- *
- * Refer to rpm_from_cnt() implementation above to get info about count number
- * calculation.
- *
- * Also note that due to rounding errors it is possible that you don't read
- * back exactly the value you have set.
- */
-static ssize_t fan1_target_show(struct device *dev,
-				struct device_attribute *da, char *buf)
-{
-	struct g762_data *data = dev_get_drvdata(dev);
-	int rpm;
-
-	rpm = get_fan_rpm(data, G762_REG_SET_CNT);
-	if (rpm < 0)
-		return rpm;
-
-	return sprintf(buf, "%d\n", rpm);
-}
-
-static ssize_t fan1_target_store(struct device *dev,
-				 struct device_attribute *da, const char *buf,
-				 size_t count)
-{
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-
-	ret = do_set_fan_target(dev, val);
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
-/* read function for fan1_fault sysfs file. */
-static ssize_t fan1_fault_show(struct device *dev, struct device_attribute *da,
-			       char *buf)
-{
-	struct g762_data *data = dev_get_drvdata(dev);
-	u32 status;
-	int ret;
-
-	ret = regmap_read(data->regmap, G762_REG_FAN_STA, &status);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%u\n", !!(status & G762_REG_FAN_STA_FAIL));
-}
-
-/*
- * read function for fan1_alarm sysfs file. Note that OOC condition is
- * enabled low
- */
-static ssize_t fan1_alarm_show(struct device *dev,
-			       struct device_attribute *da, char *buf)
-{
-	struct g762_data *data = dev_get_drvdata(dev);
-	u32 status;
-	int ret;
-
-	ret = regmap_read(data->regmap, G762_REG_FAN_STA, &status);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%u\n", !(status & G762_REG_FAN_STA_OOC));
-}
-
-static DEVICE_ATTR_RW(pwm1);
-static DEVICE_ATTR_RW(pwm1_mode);
-static DEVICE_ATTR_RW(pwm1_enable);
-static DEVICE_ATTR_RO(fan1_input);
-static DEVICE_ATTR_RO(fan1_alarm);
-static DEVICE_ATTR_RO(fan1_fault);
-static DEVICE_ATTR_RW(fan1_target);
-static DEVICE_ATTR_RW(fan1_div);
-static DEVICE_ATTR_RW(fan1_pulses);
-
-/* Driver data */
-static struct attribute *g762_attrs[] = {
-	&dev_attr_fan1_input.attr,
-	&dev_attr_fan1_alarm.attr,
-	&dev_attr_fan1_fault.attr,
-	&dev_attr_fan1_target.attr,
-	&dev_attr_fan1_div.attr,
-	&dev_attr_fan1_pulses.attr,
-	&dev_attr_pwm1.attr,
-	&dev_attr_pwm1_mode.attr,
-	&dev_attr_pwm1_enable.attr,
+static const struct hwmon_channel_info * const g762_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_ALARM | HWMON_F_FAULT |
+			   HWMON_F_TARGET | HWMON_F_DIV | HWMON_F_PULSES),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE),
 	NULL
 };
 
-ATTRIBUTE_GROUPS(g762);
+static const struct hwmon_ops g762_hwmon_ops = {
+	.is_visible = g762_is_visible,
+	.read = g762_read,
+	.write = g762_write,
+};
+
+static const struct hwmon_chip_info g762_chip_info = {
+	.ops = &g762_hwmon_ops,
+	.info = g762_info,
+};
 
 /*
  * Enable both fan failure detection and fan out of control protection.
@@ -770,8 +656,9 @@ static int g762_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							    data, g762_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &g762_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.39.2

