Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E51FF1C7
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008377; cv=none; b=HV+UxD5/QE0xtz9v3B2sGgHckd9Sl2jYObTW4PVqwtpVr4XdDO4Mc6t6kYYF6+6k+I1IqBBcZEtiVjoZVBlW3fZCtLXS+6verBZDqkUITwIi7IvaZKIvxUJgpTr9cdW4+CZe1bBbdigQ+DKacQzsScBCNrR3946lw7XqF8VwmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008377; c=relaxed/simple;
	bh=froxk4PADlHWWB9u4YlxTiYqS98oexpEIGurQzKdi2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPE6C9e0RsXTTc6LXc/jyYjrpFhCVQjw2XTjnZzHkyhqIJquWRPN63naOmnYQkWRqA13IHC/nsyzTpiFP+khNQtGnvA1HN4ZKik/1ecCGvT9ESR+wJllkwv4DPlLM6ARP92SLq72jCHqM4Nr0JkiMNmwNUGtzV6HzQyC6NH2ECE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=fOQlRfQy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="fOQlRfQy"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432dc56951eso715386f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 17:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768008374; x=1768613174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLmqCogD5IRismsS1z8wCFvT7nmCRDdaikYelA4FtTA=;
        b=fOQlRfQy7AEjos4waJRWDN8nkxb4GFcuFwt8Qh+zKfl7A51zYVNH8lPtf1T74YYu8Z
         EMvV3MHottPE1xiH/Ih4/dltkbxTTQBzLICAJSpN7KzwloC7J+/D8yxAIUyYRU6GHYb7
         +VWGs1luYERuW53MnmJnjvZL0RyXXeYxlLlYe7TGOdOiS3dbEuv75lmJwta2m90OMAeJ
         +hPTJZ2OMoLEsFUTtNSCq4N5BK/DHf1mv+H3GkcwoxujVwoazI4+LBSgIUphqTRurVnI
         usb8t96+Lwf23rJoK9T2PF7nEJLkukAKpuSXtB6ejFHWo/4JxynOAEQTyM64JvYbmdRK
         p0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008374; x=1768613174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLmqCogD5IRismsS1z8wCFvT7nmCRDdaikYelA4FtTA=;
        b=xJDFjv8FC0YeuvG4vE1iyPBkfYMXHPW3+I/kQ8HFihKjrQq3o9LjLrktkY3L1RezpF
         c58HgDs6WquyHNPpGS2HU2UDBi/Bjn6GrSTkJjrcjFRpS+6F3LHSSwcD32KT0CXp08St
         FTxeUUQwhES+sVEPhjepuYBl9eM3rYLVbRJwRwMZkDV6KIJpqgJvNSffjWigIfNTCSqp
         jPNcLj570xhV0Qc+NeX0dMNL/thblHL8Q0N3kbzvK8kq+ceipL8FfBq0DCPNzOrP/OU4
         9KmDjjs8i9mDSbIOixdQhrd/qFIFYsPFPsWVJ7m0IeHZ47qoQKs92m7fJu77NbzpZkhn
         NcVg==
X-Forwarded-Encrypted: i=1; AJvYcCUz7zF58htpEh6LTiipXHt/FyHG+DrbKkdzMdo5FFWKVuf/tGTsdP2m4MLfMFgkAVHqSHEpYNYMv0OgKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+lGxPDYYK/MAleW4NsN8PcTHb53tPR8cbDbxehqj3C2mSfiE
	Y5ryYW2G2csy8T28b73gOmdH9ogpzb9U/baULuwdp+gW649k0bVjc7dE2x1mhx0KIg==
X-Gm-Gg: AY/fxX6q2rzQZrZdA+XRoOxanh4UOfSIGRoaIGBqCQqUeySN/tGSD98tFSkSSEhrv1n
	KJWUPJ0pzn2JSjZNShMB5/0CtDIRjMxEDvtueQNEwSN2PAVMipGpYzjNx42YZvFY2z1ouYfizx3
	mJNKVVo7p/pazn0IyJzQCRM04ETtLw0et/kamIEqjP3F3hJjTwa+RUTJHSpMXKPZdVKrATYS+kp
	EFF3cuQWd95sI2atl5MymnTJ38TEnyVZTFqVA700qTBH2x02pn9yaDL98hmuANPlWUPcd48xVjk
	J1AN7SnpDndHvrZX1EzVNEx2g2v80aiLlHScLdjajkVtW6NsJRHbh2GxDrhnulXAW4I5X6uldac
	E71Y7+GFKweO6cdhEipm4xN6CpZf0vmJ6xy1Il7cW/JfWi8fjHMeE52qwCtfV2YT92SCiafHC5l
	NjU6zhaBkgSfeR/W4wwC85Om15a5PP
X-Google-Smtp-Source: AGHT+IFRVg/IVVIXgnAwYUtatppcQRxnxF6r6KkeDRCo5XdXv2qoOYu7jSZthjAesiq5tsCrwOuTIg==
X-Received: by 2002:a05:6000:24c2:b0:430:f68f:ee96 with SMTP id ffacd0b85a97d-432c37c8649mr12769092f8f.36.1768008374519;
        Fri, 09 Jan 2026 17:26:14 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm25859761f8f.17.2026.01.09.17.26.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 17:26:13 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v3 1/5] hwmon: it87: describe per-chip temperature resources
Date: Sat, 10 Jan 2026 02:26:09 +0100
Message-ID: <20260110012613.48150-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add per-chip temp limit/offset/map counts and wire the driver
to use them.

This keeps existing chips on the previous defaults while allowing newer
chips to advertise larger resources.

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

