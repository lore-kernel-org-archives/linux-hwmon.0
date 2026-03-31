Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECA433ADB1
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979705; cv=none; b=PwE8a7MGbiJ2Sjmi6Dot2UkGq4eMt6sZ0C8YVFdeEPkibc6ALgc5vlsUr2AhS60RBjzHiAucOHcXXOTBu5201lPsJAWaptjFeZdLEy0CoggDIiCz7e/Ol2BxofD12BySlY7/u+38TcmajLLxn9ibtQeem8hYncCrgdh1rlP5Xyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979705; c=relaxed/simple;
	bh=1jp1OboeQ+O1ET4HZOtv99KLrYPGTbApOMJgCl0hKWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQHvRxawOUz0SF6XRYqApW7eeAZZoBeZk/y2rbdCy7yQbE4OnQ8ee+C4TrUJiyfywiUS9TEe/7km7Md3xsuSIghjqdiqXZn4Ey0lN+T6KpT5Z2I2JJonI91RVcigGAoTVnynPYTyBBwCpk9bz3W2o5ZgFPFDXJJo2qqGPTzfeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJQcmWxh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJQcmWxh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43ccda008cdso100551f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774979698; x=1775584498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFoqX0s456APxRZScJ0cr+kcv9K0kU4851+kyMBYLdI=;
        b=mJQcmWxhGjTqmnEdaRcKiQ/uamzaglkZssONzpkzqp+d9Yun7H9rEJ5HoZHQyPtBif
         6bp5TH6jI9YtqK9IrBrEWPlwm0SfLJRRn1TUGrnNp4q2OhjW9OGxON6UYTL+4aIfOYU9
         wTIG9CODyZpGU3Ev3Zp27JJR4y9bzNXZbSbOzJ5zfRVlI5zVlEdSPnyG2lZrV6+8Kh5/
         i+Z/Qv6d1LOrorCp5aMuxnLpEqgIkxXWvQSn9onJtROU4O9nRlD8XlVuLH/AFlWvYhRO
         e490NWkMlygazQkUj/J9j/BrwFAx69Mo3cnE5vJkbayD0/yGn14c24I/WDff1kOC8JoV
         NaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979698; x=1775584498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFoqX0s456APxRZScJ0cr+kcv9K0kU4851+kyMBYLdI=;
        b=SMuzLCguftxd7b5cQfJKy7S16BhtoczYs8QA6kR2pRAeHYY5Ajtsd/oA04QRpwjK27
         ceMe1gj4wV9zQ1qbNJox7XQNuLTAYre8nFpfTiecYxq0X+oqSUfKRLFdSBcu4tqYjIut
         s+8RKwKRUiF7jZeVjNGM/wPRqDQYUPq0ZSxwsVxh7o7RmYf+lgrTd08sOxQ50jfX9+Zc
         Y43EPbUBJdyDpuWcYQVsWr8oJj7HnTfNflc4gpuhyGANi2yqjGxP4I/3Wl8RrmfEGbZO
         SiPazLxn/7p7rU2UVD3Ylt2NnlbYQuPkDPYW+aGtLEQjk53S0yKF27Wcz3wEDuDMS3mq
         p6GA==
X-Forwarded-Encrypted: i=1; AJvYcCUortrlTgL15U1eYjBMGNmEW7XXeNm/Xzxc6ZJZtDp3cMcz20EJUg9sNCrJiv1AGcAt36ELLwkXrav8/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRhWAt4m8SvkGWp+APmHjc07D+79pwiSz+Chkh1R1z1jF2/IIh
	R/JnbLQNVp+LnmOWWJDycNzy+J1AqSl6RzaaG8Y7GuyEPaG7/R94Ef7E
X-Gm-Gg: ATEYQzy6tHP/mfsHS7j9TpvYsqBBaN/6RwJSpruKoDGbbeaETOCnQejKWe4eTXy7GFU
	pvZhaRCmV3JjEORAFQUvOWME0Id/nUTlA9W2H8CJhpiYQTzgb+UCS69i0egjj5pxtvHIu9aNfTA
	Fpei58jTwai9tiDsmj3vPURDYiDN/27IlPU06Te02Ac1/cBxpNzfES8KJH7Sli4sb6w+5QHmyoJ
	sRSSAzIvUliquZ1wM3ocKbJ/70/p5AACoiSZMAQOi9rY+YqB3Wj7PSb1/vkR2uGf3oOwO85yGDk
	WaidgGYJbxJeu/7RI5eMkv0Rpxm/76amWT9sXd2prCCVB8E4m9Ye+feYQecXnUGxSUNqxSdutdy
	r/xuTuPwv3OHgDYn+Nxx3w+5CpFryiOqWwkri795zi3Roz5ymrv8w92H0sB7TueHoiE5jwo9sqr
	Q7QIAgovHOAVa0XvsMZLbLBhFwkU35dSYkj7PiWuRNej34i4e1K5Q6QI9FSwLI6ch+fy7gS28WV
	Q==
X-Received: by 2002:adf:fa52:0:b0:43d:1598:2d6e with SMTP id ffacd0b85a97d-43d15982eb7mr217393f8f.20.1774979697518;
        Tue, 31 Mar 2026 10:54:57 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e2f6sm29901913f8f.18.2026.03.31.10.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:54:56 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon:tmp102: add support for update interval
Date: Tue, 31 Mar 2026 20:54:18 +0300
Message-ID: <20260331175418.16145-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the sensor supports different sampling intervals via
bits CR0 and CR1 from the CONFIG register, add support in
order for the conversion rate to be changed from user space.
Default is 4 conv/sec.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/hwmon/tmp102.rst |  19 +++-
 drivers/hwmon/tmp102.c         | 165 ++++++++++++++++++++++++---------
 2 files changed, 139 insertions(+), 45 deletions(-)

diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
index 3c2cb5bab1e9..7ed649ac4cd0 100644
--- a/Documentation/hwmon/tmp102.rst
+++ b/Documentation/hwmon/tmp102.rst
@@ -41,12 +41,25 @@ degree from -40 to +125 C. Resolution of the sensor is 0.0625 degree.  The
 operating temperature has a minimum of -55 C and a maximum of +150 C.
 
 The TMP102 has a programmable update rate that can select between 8, 4, 1, and
-0.5 Hz. (Currently the driver only supports the default of 4 Hz).
+0.5 Hz.
 
 The TMP110 and TMP113 are software compatible with TMP102, but have different
 accuracy (maximum error) specifications. The TMP110 has an accuracy (maximum error)
 of 1.0 degree, TMP113 has an accuracy (maximum error) of 0.3 degree, while TMP102
 has an accuracy (maximum error) of 2.0 degree.
 
-The driver provides the common sysfs-interface for temperatures (see
-Documentation/hwmon/sysfs-interface.rst under Temperatures).
+sysfs-Interface
+---------------
+
+The following list includes the sysfs attributes that the driver provides, their
+permissions and a short description:
+
+=============================== ======= ========================================
+Name                            Perm    Description
+=============================== ======= ========================================
+temp1_input:                    RO      Temperature input
+temp1_label:                    RO      Descriptive name for the sensor
+temp1_max:                      RW      Maximum temperature
+temp1_max_hyst:                 RW      Maximum hysteresis temperature
+update_interval                 RW      Update conversions interval in milliseconds
+=============================== ======= ========================================
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 5b10c395a84d..c0805f6271b9 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -50,11 +50,25 @@
 
 #define CONVERSION_TIME_MS		35	/* in milli-seconds */
 
+struct tmp102_params {
+	u16 default_sample_time;
+	u8 num_sample_times;
+	const unsigned int *sample_times;
+};
+
 struct tmp102 {
 	const char *label;
 	struct regmap *regmap;
 	u16 config_orig;
 	unsigned long ready_time;
+	u16 sample_time;
+	const struct tmp102_params *params;
+};
+
+static const struct tmp102_params device_params = {
+	.default_sample_time = 125,
+	.num_sample_times = 4,
+	.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
 };
 
 /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
@@ -80,58 +94,113 @@ static int tmp102_read_string(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
-		       u32 attr, int channel, long *temp)
+		       u32 attr, int channel, long *val)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	unsigned int regval;
 	int err, reg;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		/* Is it too early to return a conversion ? */
-		if (time_before(jiffies, tmp102->ready_time)) {
-			dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
-			return -EAGAIN;
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			*val = tmp102->sample_time;
+			break;
+		default:
+			return -EINVAL;
 		}
-		reg = TMP102_TEMP_REG;
 		break;
-	case hwmon_temp_max_hyst:
-		reg = TMP102_TLOW_REG;
-		break;
-	case hwmon_temp_max:
-		reg = TMP102_THIGH_REG;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			/* Is it too early to return a conversion ? */
+			if (time_before(jiffies, tmp102->ready_time)) {
+				dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
+				return -EAGAIN;
+			}
+			reg = TMP102_TEMP_REG;
+			break;
+		case hwmon_temp_max_hyst:
+			reg = TMP102_TLOW_REG;
+			break;
+		case hwmon_temp_max:
+			reg = TMP102_THIGH_REG;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		err = regmap_read(tmp102->regmap, reg, &regval);
+		if (err < 0)
+			return err;
+		*val = tmp102_reg_to_mC(regval);
 		break;
 	default:
-		return -EOPNOTSUPP;
+		return -EINVAL;
 	}
+	return 0;
+}
+
+static int tmp102_update_interval(struct device *dev, long val)
+{
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
+	unsigned int reg;
+	u8 index;
+	s32 err;
+
+	index = find_closest(val, tmp102->params->sample_times,
+			     (int)tmp102->params->num_sample_times);
 
-	err = regmap_read(tmp102->regmap, reg, &regval);
+	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &reg);
+	if (err < 0)
+		return err;
+	reg &= ~0x00c0;
+	reg |= (3 - index) << 6;
+	err = regmap_write(tmp102->regmap, TMP102_CONF_REG, reg);
 	if (err < 0)
 		return err;
-	*temp = tmp102_reg_to_mC(regval);
+	tmp102->sample_time = tmp102->params->sample_times[index];
 
 	return 0;
 }
 
+static int tmp102_write_chip(struct device *dev, u32 attr, long val)
+{
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		return tmp102_update_interval(dev, val);
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
-			u32 attr, int channel, long temp)
+			u32 attr, int channel, long val)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	int reg;
 
-	switch (attr) {
-	case hwmon_temp_max_hyst:
-		reg = TMP102_TLOW_REG;
-		break;
-	case hwmon_temp_max:
-		reg = TMP102_THIGH_REG;
-		break;
+	switch (type) {
+	case hwmon_chip:
+		return tmp102_write_chip(dev, attr, val);
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max_hyst:
+			reg = TMP102_TLOW_REG;
+			break;
+		case hwmon_temp_max:
+			reg = TMP102_THIGH_REG;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		val = clamp_val(val, -256000, 255000);
+		return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
 	default:
-		return -EOPNOTSUPP;
+		return -EINVAL;
 	}
-
-	temp = clamp_val(temp, -256000, 255000);
-	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(temp));
+	return 0;
 }
 
 static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
@@ -139,27 +208,35 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
 {
 	const struct tmp102 *tmp102 = data;
 
-	if (type != hwmon_temp)
-		return 0;
-
-	switch (attr) {
-	case hwmon_temp_input:
-		return 0444;
-	case hwmon_temp_label:
-		if (tmp102->label)
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
 			return 0444;
-		return 0;
-	case hwmon_temp_max_hyst:
-	case hwmon_temp_max:
-		return 0644;
+		case hwmon_temp_label:
+			if (tmp102->label)
+				return 0444;
+			return 0;
+		case hwmon_temp_max_hyst:
+		case hwmon_temp_max:
+			return 0644;
+		}
+		break;
 	default:
-		return 0;
+		break;
 	}
+	return 0;
 }
 
 static const struct hwmon_channel_info * const tmp102_info[] = {
 	HWMON_CHANNEL_INFO(chip,
-			   HWMON_C_REGISTER_TZ),
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST),
 	NULL
@@ -237,6 +314,10 @@ static int tmp102_probe(struct i2c_client *client)
 	if (IS_ERR(tmp102->regmap))
 		return PTR_ERR(tmp102->regmap);
 
+	tmp102->params = &device_params;
+
+	tmp102->sample_time = tmp102->params->default_sample_time;
+
 	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &regval);
 	if (err < 0) {
 		dev_err(dev, "error reading config register\n");
-- 
2.34.1

