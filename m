Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA13C3432
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225225; cv=none; b=rd7J39vd8EoqGP5Gbu52unQ9TkbYs9qjuv7KKht1SPdrklub/gHlGpkPSHTT1xwQVFB94VrX9p5T4iR2hh40hK8yfsGgTa2j0wqUOPVN7tUrwYEau3GgwToAcvTPcrk9NvvgDzEN6RS9fN3WGnfL74FLC2K4W9kGnGkYoxhUX+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225225; c=relaxed/simple;
	bh=ZaQYLQ79Qi1e/GYAO700zaQe68OP/sNqETSfVAS4jbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CmLWTA0wbNjtYorR5IRjrALR5NesrNIOmUn67Cf6zZ+XTpzvwqagjZ4gG4YOGUDmWvLUczZ8eJyvS/YeVGXOKBv5mZmL/TBXuq21GbdR9iWmLC5FQCsEc8jLijmPsX6OxypGHeih4RwND5qWW2pvYjYSNPCx/VyEQi2ixgv9rkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLlddQU4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLlddQU4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so13349145e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775225219; x=1775830019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTKG/4DEdSl73iOWcC16gcuOW+Fph4H/Ug8xetwoxhY=;
        b=DLlddQU4UGBGTZ6+VbxOKgUKJpGtJ7CHADzwp4SNqrWPBOmPwYvTWt6YbbZPVKfG/d
         Zz0cZUxuENPL5zM22Nuz29HIRRN6ong3nbJNbGuBY8PV1hJzuAN2RuQIzIVRCfLiU/pi
         vARHeTcEzk7Mr+cyt/POAtii9XuOFRdLxbm0l91OtDhkUqh72dvRboSTNpqhp3GvrGfR
         nkJp+t9SRyvT1DQ1owI9znbpBS35F0G7MbTFTSKA9ONvi7TDprwYrEHi+2dyxxJHjl1q
         1QQVnB1B5aQ9THvcGzvseBOqHZvVAe4zufU+ykOoq5LymdggnKiEvxC7kHCuSRhjSxOi
         4oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225219; x=1775830019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTKG/4DEdSl73iOWcC16gcuOW+Fph4H/Ug8xetwoxhY=;
        b=R4ud0NFdJfKwl722tB02ub5KbSfQVzlTLC6WdSh7R7XRwxsYsMz/mODBQfs2nwKinO
         lLEZ0iYNiDVsCF19CLtVL3gNzbazQiH7JGouw8arhWFaLe/SbgHQSFSfqLu6/qWbb8Rs
         PjXVEx/GeuHUxc2DhQfNRm4lzmkYbgx+pmXDBtp98AIwsEKtvCel8ZdTCPhKbd8ALaVG
         0yQgY1GNLkZkOsDCvN0KKUuJcCJoXkhJlILmy0l7nl4v3CtxTJAgYGq4ybleHajM//Cc
         l7el0yoOatRCiEekRbCNKX2tGIwnJ7KO/Rx6CrDVm93Qa0Jnx7KjwxDNM5nlBDYobDw+
         ddlg==
X-Forwarded-Encrypted: i=1; AJvYcCXtQxfzoRK+xE/DgssPESn+Gt6S/dEAQU1heZCZ3EZPmB1Ncj+3eHcGejhyxw83kz17YrsjEcdjb+OGHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwStyhJAD6Mfz8s1LwVF0N8G2NZj8RE48R+rLLprE0pGeKAzzVy
	+WOJ6jeNId+ykwUs4iMlMmFWm3H4uUvKAvBlIEzv6oKQ7t+yTHCGBaRj
X-Gm-Gg: ATEYQzzt7deWDYQNdfbcn29CjYWVpp/sMSU23yS/+NGVCNvcbvxEV9rl23p/Smdfm9t
	5KpNvHa+RgGrC3DwA/EGF0XU4UAA2qoKy45q4BLeQy98kGzAOuK0KLSL2n0OjvlrhcLEJCkP7B4
	cXQYXinvSJXP6ik/iI1cKy/jwaY+RoGfZ3S5OIJnRGX1cc7naixuTZWoZyBgWiv+8dNRjiy7rBp
	ezEG7t8K8dlAvBjR99BwIojuHwHS9Bz0kZsToGELSLBK7koqmsDiwOQmtBvy+24vZ1qm5gwuIR1
	FerQJ/yh1co7Ezc1ZbmxvR2TvRgHmqChVK2meA8mOjNYp0bwSG6D6h9PYGImuiwIsbkCBbbTR97
	DuyreYPhQKwdSD+lYiAOWuZPeR5eX6hRPqoJCEEn2leCEbPaZJBh8+n7Y6dJLgsCyYafe3q9CPz
	Prv4nn989ne0tgFB/NMWKG8OGFc7ThK4cnQHuIzIiH9lDYwsjiFBa4ga1NFZYLMqYhrgTeGiAxM
	jMHkhQtsVW4
X-Received: by 2002:a05:600c:4752:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-4889976ea80mr51847825e9.12.1775225218911;
        Fri, 03 Apr 2026 07:06:58 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d3a4e9sm42069665e9.6.2026.04.03.07.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:06:58 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon: (tmp102) add support for update interval
Date: Fri,  3 Apr 2026 17:06:54 +0300
Message-ID: <20260403140654.10368-1-flaviu.nistor@gmail.com>
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
Changes in v3:
- Implement all changes suggested inline by Guenter Roeck.
- Fixed identified issues from link provided by Guenter Roeck:
https://sashiko.dev/#/patchset/20260401164701.18456-1-flaviu.nistor%40gmail.com
- Link to v2: https://lore.kernel.org/all/20260401164701.18456-1-flaviu.nistor@gmail.com/
Changes in v2:
- Implement all changes suggested inline by Guenter Roeck.
- Fixed identified issues from link provided by Guenter Roeck:
https://sashiko.dev/#/patchset/20260331175418.16145-1-flaviu.nistor%40gmail.com
- Link to v1: https://lore.kernel.org/all/20260331175418.16145-1-flaviu.nistor@gmail.com/

 Documentation/hwmon/tmp102.rst |  19 ++++-
 drivers/hwmon/tmp102.c         | 128 +++++++++++++++++++++++++++------
 2 files changed, 123 insertions(+), 24 deletions(-)

diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
index 3c2cb5bab1e9..425a09a3c9b3 100644
--- a/Documentation/hwmon/tmp102.rst
+++ b/Documentation/hwmon/tmp102.rst
@@ -41,12 +41,25 @@ degree from -40 to +125 C. Resolution of the sensor is 0.0625 degree.  The
 operating temperature has a minimum of -55 C and a maximum of +150 C.
 
 The TMP102 has a programmable update rate that can select between 8, 4, 1, and
-0.5 Hz. (Currently the driver only supports the default of 4 Hz).
+0.25 Hz.
 
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
+=============================== ======= ===========================================
+Name                            Perm    Description
+=============================== ======= ===========================================
+temp1_input:                    RO      Temperature input
+temp1_label:                    RO      Descriptive name for the sensor
+temp1_max:                      RW      Maximum temperature
+temp1_max_hyst:                 RW      Maximum hysteresis temperature
+update_interval                 RW      Update conversions interval in milliseconds
+=============================== ======= ===========================================
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 5b10c395a84d..3aa1a3fbeaa9 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -50,11 +50,16 @@
 
 #define CONVERSION_TIME_MS		35	/* in milli-seconds */
 
+#define NUM_SAMPLE_TIMES		4
+#define DEFAULT_SAMPLE_TIME_MS		250
+static const unsigned int *sample_times = (const unsigned int []){ 125, 250, 1000, 4000 };
+
 struct tmp102 {
 	const char *label;
 	struct regmap *regmap;
 	u16 config_orig;
 	unsigned long ready_time;
+	u16 sample_time;
 };
 
 /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
@@ -79,8 +84,20 @@ static int tmp102_read_string(struct device *dev, enum hwmon_sensor_types type,
 	return 0;
 }
 
-static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
-		       u32 attr, int channel, long *temp)
+static int tmp102_read_chip(struct device *dev, u32 attr, long *val)
+{
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		*val = tmp102->sample_time;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tmp102_read_temp(struct device *dev, u32 attr, long *val)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	unsigned int regval;
@@ -108,13 +125,54 @@ static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
 	err = regmap_read(tmp102->regmap, reg, &regval);
 	if (err < 0)
 		return err;
-	*temp = tmp102_reg_to_mC(regval);
+
+	*val = tmp102_reg_to_mC(regval);
 
 	return 0;
 }
 
-static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
-			u32 attr, int channel, long temp)
+static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return tmp102_read_chip(dev, attr, val);
+	case hwmon_temp:
+		return tmp102_read_temp(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tmp102_update_interval(struct device *dev, long val)
+{
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
+	u8 index;
+	s32 err;
+
+	index = find_closest(val, sample_times, NUM_SAMPLE_TIMES);
+
+	err = regmap_update_bits(tmp102->regmap, TMP102_CONF_REG,
+				 (TMP102_CONF_CR1 | TMP102_CONF_CR0), (3 - index) << 6);
+	if (err < 0)
+		return err;
+	tmp102->sample_time = sample_times[index];
+
+	return 0;
+}
+
+static int tmp102_write_chip(struct device *dev, u32 attr, long val)
+{
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		return tmp102_update_interval(dev, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int tmp102_write_temp(struct device *dev, u32 attr, long val)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	int reg;
@@ -130,8 +188,22 @@ static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
 		return -EOPNOTSUPP;
 	}
 
-	temp = clamp_val(temp, -256000, 255000);
-	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(temp));
+	val = clamp_val(val, -256000, 255000);
+	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
+}
+
+static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return tmp102_write_chip(dev, attr, val);
+	case hwmon_temp:
+		return tmp102_write_temp(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
 static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
@@ -139,27 +211,39 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
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
+		default:
+			break;
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
+		default:
+			break;
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
@@ -237,6 +321,8 @@ static int tmp102_probe(struct i2c_client *client)
 	if (IS_ERR(tmp102->regmap))
 		return PTR_ERR(tmp102->regmap);
 
+	tmp102->sample_time = DEFAULT_SAMPLE_TIME_MS;
+
 	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &regval);
 	if (err < 0) {
 		dev_err(dev, "error reading config register\n");
-- 
2.34.1

