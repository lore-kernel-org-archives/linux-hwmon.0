Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B921CC64
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 01:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008378; cv=none; b=QwFHDXDTVXRRNE4ETpbwbIAzPxHvJefGOHLaoAIWpQ456sgzFP7h19E+HwNpM2NyYZ6vQfbEWydoUuK/D7ZurZy8gzAy2Cw4TL5I0mWTCJsnDKczhq9/4N72Nnw/MAC2CI4/awqq7dOU5lX2L2uD5JH9fHNEFFiPrnx+i82xRDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008378; c=relaxed/simple;
	bh=MieA5Akag89s+NXXEwoNS1VTLoPm0zm+ACtd3VyY6QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNxfoN/FIgTW4ZmBcez2Ugm2X7VMyLZbhp/hIH27qnjBoCyqIFiLsl4wI6FQmOI/K0kUMius9rsX9xVX75ZgL+zlc7s3wvhMlB69C4fimnfF/TeTmvrfbVZg/zJzY4RQP8b+7HdvYNlYPCVrcfZEr9P9avwiHKpjzXy03dUR4VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=wWrV/ZlH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="wWrV/ZlH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327778df7fso2963322f8f.3
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 17:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768008375; x=1768613175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rtdgd2M7oLVFWRY5gq81iKkWS3z0tPWdcWEAuEYt6oc=;
        b=wWrV/ZlHhJZyg9FgC62bExB2rC5Ti0pvuoILqmuTpNEW97S3iqxEDcJPA8p2v5NQM2
         s9ScyDaVsWXg62+iZnD6Mg9ZL7Zcvs/9DD9WUEfrrcLnk2332B8YRBYXe8SR1Jg9KeeF
         yNLGYyWHQgwpxt0E+s3Li6FfXGhyfYXPGSIzAxNqywA27kSyLDu+VhkIcYsl8Masqxry
         pYmeIfXsaaER0TgJlIGGVnOMbGHb1fhkdbP2x5GpNRA/AbVJpuQExt3QGjkrW/oGwTdw
         flNvo0x+DZ+uPt/B20TZVyqaYsaJnPCzXseK0jqpGl/W0gev5CUDBL5GLBzqRDwz4bRR
         R1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008375; x=1768613175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rtdgd2M7oLVFWRY5gq81iKkWS3z0tPWdcWEAuEYt6oc=;
        b=HEPFNI/f0fBKb/nQZdJ9HJRwxEQtRoBpbCFZ0q1qIKep6X3oRTGX3Zvl87OMvAcyB7
         6pg4sFTExrv1N0XB3WK9CDPOSIFVtN7xfBf3gE4HpUfBjSvKrtNWJkOeQ9dYeD+qqWVR
         kwtUN+kyrLlDV0OTYik0eKOaXWa3cyoOF/LAo2qDh88U3eXbL4f1n99+dpqPEAjhuPqy
         4/Obfk0rdvBxpUDE+jBpRZ693Za3C1hSaLZ5s/++7mxSKp08zlZBT9s17droo4f58IYf
         IYBfdP6hHt4+E+niKiesyeC+eIetVMrvLCSxQWC6Oi2cOIs7EQji0BxW25NoGwppQAg7
         zwfg==
X-Forwarded-Encrypted: i=1; AJvYcCUO50a72vNMr4DkNYLtq9xQjWQA2uQ9sX9HSjNRURUb3VErxWD1SGaPINim9KvQ182DFu9X4OVBsa1K/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyvfv2M49ZVFgwtbszerNzBFpsa9DTlc2nkYazhMhvN7DTDebi
	8ROW7MV3NvuJcZ7QPgrtx4QRtkqXofB42Pcpg2vsaqIWRPePkR0U1h1yw81gHLGp6Q==
X-Gm-Gg: AY/fxX6MCfrSgY4uIUzfHefx79l33YV64f1BYQ8Ykuz0dpkOo7OxoTZ/dDTz5mtomZT
	MldlMNDpJBLI1eNjjS/EeM9V0MDhtofcxkU3KtSyJFztgiDQKlzgsVZuE14o3LSQKYmfVHUDpvl
	OlXyVfCsIOymTaEd/NYluBwvFPOz/ZCtHY9G/6xUUPN79GcFaG3AfjnAURXEuD02CPED+jrtro8
	XfP8vEAUJxI9ddzU9qxtfkxz4ybC9kGc7P7QdhcILai+cxvWPbPgaYWqWZkd71vgNgg1HVIFrVh
	x1tVH8R+3TxrVHFSMwqs+9hx162QHVwmey5m1nplNiZOpVhwgno+x6gwA+DofnCOqBdxR5RbOk+
	/Jccr0G4XlWRMam3KqMY0FCJ7BIm4xp+UrrcmtsEOBC95CBsMqHXYrqeYxy4QzkuyP5JrN0QBaQ
	AU3MA3avteunILwLEhUgIGS4IOFB76
X-Google-Smtp-Source: AGHT+IHyLGlNS8hnGoRWDtWDhZiesDmgYPQ4nmjWHW3rpX+kqj1BPGYnw2O7DchrMnqlQ6HcbQ6+qQ==
X-Received: by 2002:a05:6000:40e1:b0:431:488:b9bc with SMTP id ffacd0b85a97d-432c3629b8emr13171669f8f.10.1768008375159;
        Fri, 09 Jan 2026 17:26:15 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm25859761f8f.17.2026.01.09.17.26.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 17:26:14 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v3 2/5] hwmon: it87: prepare for extended PWM temp maps
Date: Sat, 10 Jan 2026 02:26:10 +0100
Message-ID: <20260110012613.48150-2-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110012613.48150-1-yahoo@perenite.com>
References: <20260110012613.48150-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helper logic for PWM-to-temperature mappings so newer
register layouts can be supported without affecting legacy chips.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 178 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 133 insertions(+), 45 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ec5b1668dd7b..dfd1e896c1ab 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -251,6 +251,7 @@ static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59 };
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
 static const u8 IT87_REG_PWM[]         = { 0x15, 0x16, 0x17, 0x7f, 0xa7, 0xaf };
+static const u8 IT87_REG_PWM_8665[]    = { 0x15, 0x16, 0x17, 0x1e, 0x1f, 0x92 };
 static const u8 IT87_REG_PWM_DUTY[]    = { 0x63, 0x6b, 0x73, 0x7b, 0xa3, 0xab };
 
 static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
@@ -283,6 +284,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define IT87_TEMP_OFFSET_MAX	ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
 #define IT87_TEMP_LIMIT_DEFAULT	3
 #define IT87_TEMP_MAP_DEFAULT	3
+#define IT87_PWM_OLD_NUM_TEMP	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -331,6 +333,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -554,6 +557,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -632,7 +636,9 @@ struct it87_data {
 	u8 has_pwm;		/* Bitfield, pwm control enabled */
 	u8 pwm_ctrl[NUM_PWM];	/* Register value */
 	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
-	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
+	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
+	u8 pwm_temp_map_mask;
+	u8 pwm_temp_map_shift;
 
 	/* Automatic fan speed control registers */
 	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
@@ -714,6 +720,72 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
 		return (reg & 0x7f) << 1;
 }
 
+static inline u8 pwm_temp_map_get(const struct it87_data *data, u8 ctrl)
+{
+	return (ctrl >> data->pwm_temp_map_shift) &
+		data->pwm_temp_map_mask;
+}
+
+static inline u8 pwm_temp_map_set(const struct it87_data *data, u8 ctrl,
+				  u8 map)
+{
+	ctrl &= ~(data->pwm_temp_map_mask << data->pwm_temp_map_shift);
+	return ctrl | ((map & data->pwm_temp_map_mask)
+		       << data->pwm_temp_map_shift);
+}
+
+static inline u8 pwm_num_temp_map(const struct it87_data *data)
+{
+	return data->num_temp_map ? data->num_temp_map :
+		IT87_TEMP_MAP_DEFAULT;
+}
+
+static unsigned int pwm_temp_channel(const struct it87_data *data,
+				     int nr, u8 map)
+{
+	if (has_new_tempmap(data)) {
+		u8 num = pwm_num_temp_map(data);
+
+		if (map >= num)
+			map = 0;
+		return map;
+	}
+
+	if (map >= IT87_PWM_OLD_NUM_TEMP)
+		map = 0;
+
+	if (nr >= IT87_PWM_OLD_NUM_TEMP)
+		map += IT87_PWM_OLD_NUM_TEMP;
+
+	return map;
+}
+
+static int pwm_temp_map_from_channel(const struct it87_data *data, int nr,
+				     unsigned int channel, u8 *map)
+{
+	if (has_new_tempmap(data)) {
+		u8 num = pwm_num_temp_map(data);
+
+		if (channel >= num)
+			return -EINVAL;
+		*map = channel;
+		return 0;
+	}
+
+	if (nr >= IT87_PWM_OLD_NUM_TEMP) {
+		if (channel < IT87_PWM_OLD_NUM_TEMP ||
+		    channel >= 2 * IT87_PWM_OLD_NUM_TEMP)
+			return -EINVAL;
+		channel -= IT87_PWM_OLD_NUM_TEMP;
+	} else {
+		if (channel >= IT87_PWM_OLD_NUM_TEMP)
+			return -EINVAL;
+	}
+
+	*map = channel;
+	return 0;
+}
+
 static int DIV_TO_REG(int val)
 {
 	int answer = 0;
@@ -725,6 +797,14 @@ static int DIV_TO_REG(int val)
 
 #define DIV_FROM_REG(val) BIT(val)
 
+static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
+{
+	if (data->type == it8613 || data->type == it8622)
+		return IT87_REG_PWM_8665[nr];
+
+	return IT87_REG_PWM[nr];
+}
+
 /*
  * PWM base frequencies. The frequency has to be divided by either 128 or 256,
  * depending on the chip type, to calculate the actual PWM frequency.
@@ -805,14 +885,22 @@ static void it87_write_value(struct it87_data *data, u8 reg, u8 value)
 
 static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
 {
-	data->pwm_ctrl[nr] = it87_read_value(data, IT87_REG_PWM[nr]);
+	data->pwm_ctrl[nr] = it87_read_value(data, it87_reg_pwm(data, nr));
 	if (has_newer_autopwm(data)) {
-		data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+		data->pwm_temp_map[nr] =
+			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (has_new_tempmap(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		data->pwm_duty[nr] = it87_read_value(data,
 						     IT87_REG_PWM_DUTY[nr]);
 	} else {
 		if (data->pwm_ctrl[nr] & 0x80)	/* Automatic mode */
-			data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+			data->pwm_temp_map[nr] =
+				pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (has_new_tempmap(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		else				/* Manual mode */
 			data->pwm_duty[nr] = data->pwm_ctrl[nr] & 0x7f;
 	}
@@ -1543,6 +1631,8 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	it87_update_pwm_ctrl(data, nr);
+
 	if (val == 0) {
 		if (nr < 3 && has_fanctl_onoff(data)) {
 			int tmp;
@@ -1562,27 +1652,30 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 					 data->pwm_duty[nr]);
 			/* and set manual mode */
 			if (has_newer_autopwm(data)) {
-				ctrl = (data->pwm_ctrl[nr] & 0x7c) |
-					data->pwm_temp_map[nr];
+				ctrl = pwm_temp_map_set(data,
+							data->pwm_ctrl[nr] &
+							~0x80,
+							data->pwm_temp_map[nr]);
 			} else {
 				ctrl = data->pwm_duty[nr];
 			}
 			data->pwm_ctrl[nr] = ctrl;
-			it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+			it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 		}
 	} else {
 		u8 ctrl;
 
 		if (has_newer_autopwm(data)) {
-			ctrl = (data->pwm_ctrl[nr] & 0x7c) |
-				data->pwm_temp_map[nr];
+			ctrl = pwm_temp_map_set(data,
+						data->pwm_ctrl[nr] & ~0x80,
+						data->pwm_temp_map[nr]);
 			if (val != 1)
 				ctrl |= 0x80;
 		} else {
 			ctrl = (val == 1 ? data->pwm_duty[nr] : 0x80);
 		}
 		data->pwm_ctrl[nr] = ctrl;
-		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+		it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 
 		if (has_fanctl_onoff(data) && nr < 3) {
 			/* set SmartGuardian mode */
@@ -1633,7 +1726,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		 */
 		if (!(data->pwm_ctrl[nr] & 0x80)) {
 			data->pwm_ctrl[nr] = data->pwm_duty[nr];
-			it87_write_value(data, IT87_REG_PWM[nr],
+			it87_write_value(data, it87_reg_pwm(data, nr),
 					 data->pwm_ctrl[nr]);
 		}
 	}
@@ -1688,20 +1781,14 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
-	u8 num_map;
-	int map;
+	unsigned int channel;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
-	map = data->pwm_temp_map[nr];
-	if (map >= num_map)
-		map = 0;	/* Should never happen */
-	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
-		map += num_map;
+	channel = pwm_temp_channel(data, nr, data->pwm_temp_map[nr]);
 
-	return sprintf(buf, "%d\n", (int)BIT(map));
+	return sprintf(buf, "%d\n", (int)BIT(channel));
 }
 
 static ssize_t set_pwm_temp_map(struct device *dev,
@@ -1711,45 +1798,34 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
-	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
 	long val;
 	int err;
-	u8 reg;
+	unsigned int channel;
+	u8 map;
 
-	if (kstrtol(buf, 10, &val) < 0)
+	if (kstrtol(buf, 10, &val) < 0 || val <= 0 || !is_power_of_2(val))
 		return -EINVAL;
 
-	if (nr >= num_map)
-		val -= num_map;
-
-	switch (val) {
-	case BIT(0):
-		reg = 0x00;
-		break;
-	case BIT(1):
-		reg = 0x01;
-		break;
-	case BIT(2):
-		reg = 0x02;
-		break;
-	default:
+	channel = __ffs(val);
+	if (pwm_temp_map_from_channel(data, nr, channel, &map))
 		return -EINVAL;
-	}
 
 	err = it87_lock(data);
 	if (err)
 		return err;
 
 	it87_update_pwm_ctrl(data, nr);
-	data->pwm_temp_map[nr] = reg;
+	data->pwm_temp_map[nr] = map;
 	/*
 	 * If we are in automatic mode, write the temp mapping immediately;
 	 * otherwise, just store it for later use.
 	 */
 	if (data->pwm_ctrl[nr] & 0x80) {
-		data->pwm_ctrl[nr] = (data->pwm_ctrl[nr] & 0xfc) |
-						data->pwm_temp_map[nr];
-		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
+		data->pwm_ctrl[nr] = pwm_temp_map_set(data,
+						      data->pwm_ctrl[nr],
+						      data->pwm_temp_map[nr]);
+		it87_write_value(data, it87_reg_pwm(data, nr),
+				 data->pwm_ctrl[nr]);
 	}
 	it87_unlock(data);
 	return count;
@@ -3300,7 +3376,10 @@ static void it87_init_device(struct platform_device *pdev)
 	 * manual duty cycle.
 	 */
 	for (i = 0; i < NUM_AUTO_PWM; i++) {
-		data->pwm_temp_map[i] = i;
+		if (has_new_tempmap(data))
+			data->pwm_temp_map[i] = 0;
+		else
+			data->pwm_temp_map[i] = i % IT87_PWM_OLD_NUM_TEMP;
 		data->pwm_duty[i] = 0x7f;	/* Full speed */
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
@@ -3372,7 +3451,8 @@ static int it87_check_pwm(struct device *dev)
 
 			for (i = 0; i < ARRAY_SIZE(pwm); i++)
 				pwm[i] = it87_read_value(data,
-							 IT87_REG_PWM[i]);
+							 it87_reg_pwm(data,
+								      i));
 
 			/*
 			 * If any fan is in automatic pwm mode, the polarity
@@ -3387,7 +3467,8 @@ static int it87_check_pwm(struct device *dev)
 						 tmp | 0x87);
 				for (i = 0; i < 3; i++)
 					it87_write_value(data,
-							 IT87_REG_PWM[i],
+							 it87_reg_pwm(data,
+								      i),
 							 0x7f & ~pwm[i]);
 				return 1;
 			}
@@ -3449,6 +3530,13 @@ static int it87_probe(struct platform_device *pdev)
 		data->num_temp_offset = 0;
 	data->num_temp_map = chip->num_temp_map ?
 			     chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;
+	if (has_new_tempmap(data)) {
+		data->pwm_temp_map_mask = 0x07;
+		data->pwm_temp_map_shift = 3;
+	} else {
+		data->pwm_temp_map_mask = 0x03;
+		data->pwm_temp_map_shift = 0;
+	}
 	/*
 	 * IT8705F Datasheet 0.4.1, 3h == Version G.
 	 * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h == Version J.
-- 
2.50.1 (Apple Git-155)

