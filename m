Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1CC3376A1
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Jan 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953718; cv=none; b=Qqk7IkM535qVmbpxvnoJB0GvyRM6OOFJqvcv0m6Rz6TqQFgzw/qz2MjIYmlOQypoX6gYVJ0/wekvtRE096RmLDwdFGLm5IzaaCo+AW6aLzIuixuWH2XOAVPy+WaSmbRgCqfdL9PjeGrnXzLxfIgExBcIkuF6zhAWNcLqDcMxIic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953718; c=relaxed/simple;
	bh=pMtwfbUJq76AR+TVReYLsL2lZ8fFtnfZ1WIqDgsZpJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bIE+bD0RPhan0A97LB7rtNVWZ+HSIwNUtprb1X1GX7QrBJYFXS1MfAX1zTbxoTvdsSd3FH7IDVaM9Q+ix8gc2/ZMOYBvSZ3NPyEkBETREyQei81CS4bKcqoTopSiytOYHFOMF52k9iaVka6Qfz9NV9fhkQC4xIQH+8ibmeoLfsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=cm/YjqNS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="cm/YjqNS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432755545fcso2346994f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 02:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1767953715; x=1768558515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8QNXkiirNoatIlS4pVluyk9bNvPV2KQdVexmCeWJQ8=;
        b=cm/YjqNSbzQFDs0eh/A9TfNcnjqUYMk4y7YpEQCyRGBm/Ms7Hx7uEjUkRcvMnBIvNm
         SeKkW58Cogve2RYkfeug78gMz45JhIDGQRQymPvLGE/wcWlpb4KIxTmkvQy79hyb7osF
         UenHokjeCShL6fOhOG3rAk0mpddFY2O8X+MgcFraXXQJMYAW2C19qFTj3Lxc1itkMtAA
         dwmaOQ0QyGqfS11DFTVKcmOPWwM27yJwEisSC+V0WUiFoTZO2FcHDaSI11TetzQxx/xA
         WSr4gIoj8vHhcTNxTFb3jQiIK2ppKY6wrJHhcpTHwb54bXMBMAHkKvrvvX/PtE3Nex+o
         CDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953715; x=1768558515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8QNXkiirNoatIlS4pVluyk9bNvPV2KQdVexmCeWJQ8=;
        b=uMjdF36fi2ZYB2Gbn5Q/RL5LgT63RqhLsm1vWo2a5eJCHxx6B/CINFGte06ChrcZjq
         mYksM0o44YQWG4ZIxbd0i3TaUqlyIA4OCQu9yVSBuXwnH9zg3/WBMSFbokep43gLYSvn
         w5M94tQGXWJK0dzbeV3UBfjPQhPxH2TIfzdxQvr33m0dMSnJhs3GMxY1gC9BXhK91Mrc
         GEliExdf/5ggUvh5gdLOaCo+Dln6OgEr8UaOhqNsv7xkJHv8rW74LkdKucm/Nuxio6fl
         8TTq9qtM+D7KIXQqmbIXuz3otOj7mvr64ICUkD19CoIO8vzt63G6FTwMQhl/ZH8QSilf
         /T3A==
X-Forwarded-Encrypted: i=1; AJvYcCVddPyNoCXoHVUkowVzieex7ZtcNwsxQk6ReStxF8G2Mbr61IewDm3RUExYJtOX4qRqxNHXoHRDodAqPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7/N9aMe2A5HgLOa7GmK+D2LBKTM29O1YUHTP3uTkTQdr8G6F
	5jnWHykT8mfvHHAa7KlVlPzdFop5EuyPMXp5mQHYDdeDiWf7/wQykQXCMSwT6YXv/A==
X-Gm-Gg: AY/fxX74nTtFW6p7G+MD41Se9pgw5hHv+WdlKg7VTsVwUQNTF7Zqjh3U6JqShukeil6
	h0tvuqZQ+weGXCLb+Bbh/O/yujMluKMhRlFqOf7Wa88LaJPJe8RwHbNORcDMEq904AOl1D5Ylsd
	KvJkXbUA0HFxz5j4yGNZQut2NOVUwdWKdwQUDMvA54lzahlCCeRs91B+lQP7TWj2TVpchy/RPxw
	JIBbQIsqDCELbtGH4AsSxW+cliGiOmnV7HqlDooOIb5o3UqibAi+KQbosD73dvSZ05ocfmQiabB
	6dBd+tWUzkfva6qsXd7DU68IHh8Ev2o5rBKdb6KhMs/sWIxaSWzfPu3s+1EvLF6ec/INyg8yL0D
	Bp5aSRWUxhm3z4Qg3d+v+1MHfYxvIYiSBwXHoOWqTXPKHsdO1wYcp1BKRsLwWqxR/xu2JUHgzQ7
	iUl27cL5xSB69mxbTbPbha9uSf8yxv
X-Google-Smtp-Source: AGHT+IGls522NzUZDA4HDfsFe0rrgJNe6t3m4gc2fbplejDX06fyifOJbSg0hQzDtjNonJPwxuP9Vg==
X-Received: by 2002:a05:600c:1392:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-47d84b34673mr109204885e9.23.1767953714079;
        Fri, 09 Jan 2026 02:15:14 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695956sm205125565e9.6.2026.01.09.02.15.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 02:15:13 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:IT87 HARDWARE MONITORING DRIVER),
	linux-kernel@vger.kernel.org (open list),
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH V2] hwmon: it87: describe per-chip temperature resources
Date: Fri,  9 Jan 2026 11:15:04 +0100
Message-ID: <20260109101504.47515-1-yahoo@perenite.com>
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
 drivers/hwmon/it87.c | 51 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..ec5b1668dd7b 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -54,6 +54,7 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/minmax.h>
 #include <linux/sysfs.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
@@ -279,8 +280,9 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_VIN			ARRAY_SIZE(IT87_REG_VIN)
 #define NUM_VIN_LIMIT		8
 #define NUM_TEMP		6
-#define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
-#define NUM_TEMP_LIMIT		3
+#define IT87_TEMP_OFFSET_MAX	ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
+#define IT87_TEMP_LIMIT_DEFAULT	3
+#define IT87_TEMP_MAP_DEFAULT	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -290,6 +292,9 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	u8 num_temp_limit;
+	u8 num_temp_offset;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
@@ -578,6 +583,9 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	u8 num_temp_limit;
+	u8 num_temp_offset;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 
@@ -926,12 +934,13 @@ static struct it87_data *it87_update_device(struct device *dev)
 			data->temp[i][0] =
 				it87_read_value(data, IT87_REG_TEMP(i));
 
-			if (has_temp_offset(data) && i < NUM_TEMP_OFFSET)
+			if (has_temp_offset(data) &&
+			    i < data->num_temp_offset)
 				data->temp[i][3] =
 				  it87_read_value(data,
 						  IT87_REG_TEMP_OFFSET[i]);
 
-			if (i >= NUM_TEMP_LIMIT)
+			if (i >= data->num_temp_limit)
 				continue;
 
 			data->temp[i][1] =
@@ -1679,16 +1688,18 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
+	u8 num_map;
 	int map;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
 	map = data->pwm_temp_map[nr];
-	if (map >= 3)
+	if (map >= num_map)
 		map = 0;	/* Should never happen */
-	if (nr >= 3)		/* pwm channels 3..6 map to temp4..6 */
-		map += 3;
+	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
+		map += num_map;
 
 	return sprintf(buf, "%d\n", (int)BIT(map));
 }
@@ -1700,6 +1711,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
+	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
 	long val;
 	int err;
 	u8 reg;
@@ -1707,8 +1719,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	if (nr >= 3)
-		val -= 3;
+	if (nr >= num_map)
+		val -= num_map;
 
 	switch (val) {
 	case BIT(0):
@@ -3206,7 +3218,7 @@ static void it87_check_limit_regs(struct it87_data *data)
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
 	}
-	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
+	for (i = 0; i < data->num_temp_limit; i++) {
 		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
@@ -3399,6 +3411,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
+	const struct it87_devices *chip;
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
 	int err;
@@ -3421,9 +3434,21 @@ static int it87_probe(struct platform_device *pdev)
 	data->type = sio_data->type;
 	data->smbus_bitmap = sio_data->smbus_bitmap;
 	data->ec_special_config = sio_data->ec_special_config;
-	data->features = it87_devices[sio_data->type].features;
-	data->peci_mask = it87_devices[sio_data->type].peci_mask;
-	data->old_peci_mask = it87_devices[sio_data->type].old_peci_mask;
+	chip = &it87_devices[sio_data->type];
+	data->features = chip->features;
+	data->peci_mask = chip->peci_mask;
+	data->old_peci_mask = chip->old_peci_mask;
+	data->num_temp_limit = chip->num_temp_limit ?
+			       chip->num_temp_limit : IT87_TEMP_LIMIT_DEFAULT;
+	if (chip->num_temp_offset)
+		data->num_temp_offset = min(chip->num_temp_offset,
+					    (u8)IT87_TEMP_OFFSET_MAX);
+	else if (has_temp_offset(data))
+		data->num_temp_offset = IT87_TEMP_OFFSET_MAX;
+	else
+		data->num_temp_offset = 0;
+	data->num_temp_map = chip->num_temp_map ?
+			     chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;
 	/*
 	 * IT8705F Datasheet 0.4.1, 3h == Version G.
 	 * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h == Version J.
-- 
2.50.1 (Apple Git-155)

