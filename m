Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F33A1E68
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766786847; cv=none; b=qV79bSbONu3ijldIvajNCiOP/VkZ6a9KeRQHs8UFezJaohca6M8AhvUBBCnjPHiYSeLK7ZfVL0Ua2OSuUOtKLcq+BVHsgecUgPLxzLOORXs/zP3nnU5D/zd6TndEsBRQ+XY2+Gvw3IJvqGXQLxUOh3PjLIIPUaFM9hGc50iPljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766786847; c=relaxed/simple;
	bh=KzpQ3CBbDKifbLE2PiBF8wD8xnuZaHen6scgEm4p4Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jS5eh+Rx4LQ/pUr5CeoQ66fuX4wbRuzkVjXrzcv8ww4ypDagWc1/VKXw6ZBpdBv4QrxbE12byL/+x4bOVadZmMNdJ+vpdtyERWj+rdczFWtGsFDo+7n5ZNVJ1ZVet3TrA0owgGLbI0aaZoT7ReK/P+zufllHEXaMYFVsQdmySOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=PP71Rlu6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="PP71Rlu6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso32565725e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 14:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1766786843; x=1767391643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIBDxVTASYFD9JVJW9zXSkdaMqDbbaptrr38QZGTRM4=;
        b=PP71Rlu6oiUxgepwjd721esCUbTfsopF6tpeVCX/QcblWkKc+hnn7OHbduv1/wuHw4
         oM6yuYs/qID/MIPCllPH3TB5cuSeuJlSztJUB1kSdlA8qBi3C+1paerUwhztlU8F1jRu
         GXttRunUkRKFlc3RG3/KiZnjCh0WEvDIO5mSPzu7HmZDcBZyQ+h8rB7AYTi78g26VYoy
         1a/xTiU97ZnnwfdCPFUR8lHqOzDUnl3VU1cMTh2PRRNAUd6ebhJw1sTIn5wJDgYAidg0
         zFBDDZU1YBuNWkYffIEtXweK9+sEmM+0mvzgIi4YfyJdfK9LIukilIyG8wslAHEWqqyk
         4kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766786843; x=1767391643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIBDxVTASYFD9JVJW9zXSkdaMqDbbaptrr38QZGTRM4=;
        b=QF/QC1Ad1uE+j7g7FOH+/eIIyG0mvRMG4G1glNTBXAueuYWwUB6GP74LWvDlMBTPPy
         kpd9cIeriup2gfQWnItWN4fQz13fu4cPf9B/bTFTmn/vpt8ZaB4QaV4CJS1CnFOu3gPI
         JtU08YC0Osh23FbGgqcx2ikBcYdP0LyOIN0+kK+Wq6cHzJwHvlV1ZXsgs2YSWXREmqLl
         qy7PIZOchPr5UIXmfVWQqP1vGA0ggZ9+kz5G44lG6a/QWPYBLzuRJrtStdnseDvWbG5I
         Zj0hfK6Hm9foFGwNpOQzJ6gwvqL6UDpNTfinuGZF/iik/ZJuXv7s2b8jWfu/IPbwKTGD
         4Lxw==
X-Gm-Message-State: AOJu0Yz52hz5tR0BHEZG0FJvkCDt1HIbiYc2pUR3j2US16ZFKYwxknXe
	7xQwz/H1gaMDPfs6BXVteL4FsGH2kTP2LwOUXXehxaf0PzgQut/I/kaX2Oz6+2+WTw==
X-Gm-Gg: AY/fxX4/uQ8c4nmvDlLTSsYbuTocTbhYmXpJgAO54sVI7EnUqWUtrGZDdd0rtgVGXkl
	Eet4GfFIG8/PyIzv3zRYwlkVJfNs5PnfreaxdQ5XMEF2PCFYOyq226o7t5q5Had/AH2y2IzHppT
	WSmli0sifiDE4OZBR2k9KtGpFxKarlD13Omw6L0MPHFoMbY3+BWQooAefgxhWb+NehAhhkYYHOH
	P31970XAuF2ArmRwgDCd6kjfLtMUhkQgvpjpUxZZ+NZ/G1s6SqDjitlNlILgJvMIYRZ7ZT+cCoy
	Z5LRP0DiXBLIvrEWngy12H4w+yLRTmWQ5ZAVqyplkuylDd5Cte0HyAYtk4YwyH3RaU1S/XCCUop
	/1GPTL3SW83ZY26i7t8s4U0vPMJLyCDKKWu1ntfW8gh1NnqZvWHY7lPaT597X3i4bw1DEMmZjEp
	+eVN26pOPRbQ5tDlIPr7+U2ioIkIJi
X-Google-Smtp-Source: AGHT+IFv82h1870XhzfQDX7IFUP8PGhE1GRxtWA1rI0g9iahpggRo3ckZy94iIq/iOMSHIu2XZUY3w==
X-Received: by 2002:a5d:5e01:0:b0:430:fb6d:1442 with SMTP id ffacd0b85a97d-4324e715b2fmr30621446f8f.62.1766786842649;
        Fri, 26 Dec 2025 14:07:22 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:e0be:8639:3d60:4c9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm48935882f8f.27.2025.12.26.14.07.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Dec 2025 14:07:22 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH] hwmon: it87: prepare for extended PWM temp maps
Date: Fri, 26 Dec 2025 23:07:20 +0100
Message-ID: <20251226220720.39408-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 147 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index f9eca0bc02bc..1107039d2b6a 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -283,6 +283,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define IT87_TEMP_OFFSET_MAX	ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
 #define IT87_TEMP_LIMIT_DEFAULT	3
 #define IT87_TEMP_MAP_DEFAULT	3
+#define IT87_PWM_OLD_NUM_TEMP	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -331,6 +332,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -554,6 +556,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -632,7 +635,9 @@ struct it87_data {
 	u8 has_pwm;		/* Bitfield, pwm control enabled */
 	u8 pwm_ctrl[NUM_PWM];	/* Register value */
 	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
-	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
+	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
+	u8 pwm_temp_map_mask;
+	u8 pwm_temp_map_shift;
 
 	/* Automatic fan speed control registers */
 	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
@@ -714,6 +719,72 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
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
@@ -807,12 +878,14 @@ static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
 {
 	data->pwm_ctrl[nr] = it87_read_value(data, IT87_REG_PWM[nr]);
 	if (has_newer_autopwm(data)) {
-		data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+		data->pwm_temp_map[nr] =
+			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
 		data->pwm_duty[nr] = it87_read_value(data,
 						     IT87_REG_PWM_DUTY[nr]);
 	} else {
 		if (data->pwm_ctrl[nr] & 0x80)	/* Automatic mode */
-			data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+			data->pwm_temp_map[nr] =
+				pwm_temp_map_get(data, data->pwm_ctrl[nr]);
 		else				/* Manual mode */
 			data->pwm_duty[nr] = data->pwm_ctrl[nr] & 0x7f;
 	}
@@ -1562,8 +1635,10 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
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
@@ -1574,8 +1649,9 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
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
@@ -1688,19 +1764,14 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
-	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
-	int map;
+	unsigned int channel;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
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
@@ -1710,44 +1781,32 @@ static ssize_t set_pwm_temp_map(struct device *dev,
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
+		data->pwm_ctrl[nr] = pwm_temp_map_set(data,
+						data->pwm_ctrl[nr],
+						data->pwm_temp_map[nr]);
 		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
 	}
 	it87_unlock(data);
@@ -3299,7 +3358,14 @@ static void it87_init_device(struct platform_device *pdev)
 	 * manual duty cycle.
 	 */
 	for (i = 0; i < NUM_AUTO_PWM; i++) {
-		data->pwm_temp_map[i] = i;
+		if (has_new_tempmap(data)) {
+			u8 limit = pwm_num_temp_map(data);
+
+			data->pwm_temp_map[i] = limit ?
+				min_t(u8, i, limit - 1) : 0;
+		} else {
+			data->pwm_temp_map[i] = i % IT87_PWM_OLD_NUM_TEMP;
+		}
 		data->pwm_duty[i] = 0x7f;	/* Full speed */
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
@@ -3448,6 +3514,13 @@ static int it87_probe(struct platform_device *pdev)
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

