Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2681DF4F1
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766781032; cv=none; b=EhmJ8L6teidnWOujMCNWgSiKYV3IJdJZTBr4ZwkujRlHUCbVSubq0Zj0gynUFmPlAuGahmtczcqbzgEJEpGizsAisUkpZWn+xF0joU++LJjsV2/8UHvNLkFF56HDusqkptittMAhxrfOYS1/c/3lG5GZGisS8gjqAu7R3Un7ys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766781032; c=relaxed/simple;
	bh=5fyyHulaV/XeElNbem/+Hoap3j8a3zldwxmTl8Ij3Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h33eWujTEcN7mhPiVyQtlhK+OOAnYfb+QtFP7hWj2/OLNSH1iFd1CLNSaQCIIVgk9Sffaob2QT/5pFLK+oc7BJgczwcqSy3leqU6o3BOSeORe357gO6Gyv1TkBDILFsim4qFwXUHMx8IUSUCW+6kxS3ztwHDURocxM1VbXAmvW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=js5Vjz8U; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="js5Vjz8U"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb2314f52so4166373f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 12:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1766781027; x=1767385827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBnZiuQkPl6fpr7C0btMJbF7KW3SNie9ZDSdnI6ur98=;
        b=js5Vjz8U7QRbiIeixfzxBttaS8Zmw+lxR8a7xLqHW/P1YKJ1i+8zJQnd8DLt6xdQVr
         hNYUnwuwtyuwQOf7HMNDgNKBS1LeDDqZAumiD8wbw8/XpnIVPxyEaqm7V+WyLbwHICw3
         DJN2mjAGAf6qx16SqhwpRkoULZRhO/hs+20q/sVZ+I2rANUoBuI/vDitq1dc2NpJRkqc
         4n2JyZu33Tgl+yBw4pGCMmWkrNJmVxYkrFZ4a6rLRMHIxfDAgQAnhDdLaHHiQ0fQR3D2
         rIxn9Xw3yDNQ3z8wh+Ewn7tux6h3fEZ9eEPSgmKqkkX7dMMOHF0TXopbQA22SeJcNpS9
         A8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766781027; x=1767385827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBnZiuQkPl6fpr7C0btMJbF7KW3SNie9ZDSdnI6ur98=;
        b=bJWmCq9LXH5Hj2t6NlvsRFPJeLcRzEnPO3CwWwcCIHlL3pwlL3YZaVGL15Ra7pQj02
         DzH+DWVza0uZF0oRQWAfjNREp2X4ZW/X/OHdAEsfLiN7GvT6aVn/ChYUwUac/O7qOr5Y
         GE7o+KqXDsPwQ2LqC9+ibfmHN72uMicwgDcYBAukNk60uzuzTyWCgv7S0hOnrabpxkrh
         Npy56qAl/GNOiRK5N4pPMFfN8O1hJFbF2oImN4kTl5BsEORk/FkBeIDSvk6SltNHv/bB
         v5cO3IEsX/IiP9qRg2syC6AH+Y6Ey27Qzlx6fVdAGABIl8JJPcsAvzrxRa/MVqn9Kf1y
         4v3w==
X-Gm-Message-State: AOJu0Yxa/7TVD6K6r9OzoghXdO029It78PG1GuKCeQkpYJn4l4o7w36x
	cr1rdRhURcZLXXH9Bk7ToKIg+iM/wkZ0vp/vDGOtSDtIWjxRrNjyN5dwsNm85g8aLQ==
X-Gm-Gg: AY/fxX7Dy4bCFUmEansjKcL/GZXL0u3twgnjJsl62TCcJDGaFcAQz/IJ8KWW8dSEBn1
	nJdsVrpbB2nI+ZxTLbB+F7tUYfgYGZ4l5MmFagyv3knDVpQwVXN0/TDkZmahX+eggzyC0gDKc+m
	qZ7dCrrXqwQkUmdx1GCawqw1buJ9eluy8SgUD+tCe66hpLIJLcS/PPP9ZDcUotTmONoBsSU9Ep+
	cRRTKeScEkWhYZ4d+1r8x6k6aOhuO0xNO+osNIJ3aGGc7qVctT0OmJ7ya/yHo8P1+8QlOlUB/1J
	jotu7NA3qXQr7uB6BZBNiCvBCiwSZ7eBvhUnEmdyJnniaNgUrfVEZWlkR90uKjZSlfh8NAjtH3I
	K2smZvkdqNDZePK7Q7TKPx8kxlp/lNrlOwkMGmAADNKk84rGjIRUyhkRxvtNY6/al+nafLWmFa/
	vMOsRkBoXn3XFgqO10X4GK8Zdo37Rw
X-Google-Smtp-Source: AGHT+IEFHgzBgCk0QlrzGZJ9+1MGR6S5yBFnY0QU/JQye4ItPwxlUJQCnrNWLvphZzEIbPPBRpA2Bg==
X-Received: by 2002:a05:6000:611:b0:431:3ba:1188 with SMTP id ffacd0b85a97d-4324e4c70e5mr24282710f8f.3.1766781027306;
        Fri, 26 Dec 2025 12:30:27 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:e0be:8639:3d60:4c9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm47337222f8f.7.2025.12.26.12.30.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Dec 2025 12:30:26 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH] hwmon: it87: describe per-chip temperature resources
Date: Fri, 26 Dec 2025 21:30:21 +0100
Message-ID: <20251226203021.27244-1-yahoo@perenite.com>
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
 drivers/hwmon/it87.c | 50 ++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..f9eca0bc02bc 100644
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
@@ -1679,16 +1688,17 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
+	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
 	int map;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
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
@@ -1700,6 +1710,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
+	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
 	long val;
 	int err;
 	u8 reg;
@@ -1707,8 +1718,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	if (nr >= 3)
-		val -= 3;
+	if (nr >= num_map)
+		val -= num_map;
 
 	switch (val) {
 	case BIT(0):
@@ -3206,7 +3217,7 @@ static void it87_check_limit_regs(struct it87_data *data)
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
 	}
-	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
+	for (i = 0; i < data->num_temp_limit; i++) {
 		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
@@ -3399,6 +3410,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
+	const struct it87_devices *chip;
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
 	int err;
@@ -3421,9 +3433,21 @@ static int it87_probe(struct platform_device *pdev)
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

