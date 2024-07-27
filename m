Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E86317F4E7
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091116; cv=none; b=TZjWb4uGcA+VzVC+KrLQ7ii/erxKtkL9rMxO3OYFsJrAfISizpBZ/GFhXY17n13av9FFbYcK9l8W2P9A4nfzC+Uofzb5OVjOEZIe2o7AXq/YdesTU3lxd9OVD3knagU1ocuOBjgUUa1GVNrG26B2VZ6Mi6fIRQ5uifFhaeeog7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091116; c=relaxed/simple;
	bh=P9oZ68LneqTkxD52x28dXbNSxuL0oRl4hl0x7QpyVEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oLuBFZ8C9jJvXKus7BzqHVwhHhUS7ztBIG+NZu0eq9TfauhO7QAY1+HS74BVYYQYPS/X+8RFqrkBki9xt7v6dgIyNQ2q8XA5+OxVWQ0VTmkb1ZBPjM2KW1jIPPe8XSwImBf8n/z5/Erxddr8lakf9ubSIZdpUXz15PKfdQNR3PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaPxl9cF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaPxl9cF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc4fccdd78so11768815ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722091113; x=1722695913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgP4eqX8nQMm7kPlYFEnUJf4BHxvfPBYpZaKMJ8sc3g=;
        b=QaPxl9cFk59Zst5mex2EvCMGBvt0B8Cq6RfXrvBi26R7V/kNHs33Ddh/xZr4VPTCyM
         Jf9sqUZCTOSaOa9kuJ8+wf63lk8/2WzYcN8rsWsTTB9fJgEOyh5eCfZ7BZYkLeRWtTHy
         GIPmQSkDEQwCNve2veOA8ci5ioWppYGeq7lKv21PTiQyd/zQAxFJ09aWwuGQm4aI19Am
         ev3xrfw6SqSXZ0t17kxa8BIJkgN7QVLVNQzA1yyfP0yssSmxC5l7g/27YeWTzV7JxA1y
         60+EbCtem+NS4ApPgErhvrV3Aid3r1e10WSPv37/d1Ipikvw44QhgaDtfXOITPRqwFGk
         oDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722091113; x=1722695913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgP4eqX8nQMm7kPlYFEnUJf4BHxvfPBYpZaKMJ8sc3g=;
        b=PNAwkQ6EFXi7i1Xo+tbDZFZfVaPMc+Em9GkfTpQmZhG9NaDRSWuvvqH5hrTKG93Krl
         izKciPQympfKre0CbUcoRJ3MBamIQxJIpaRAonaExKk+aXRORuYBnFVoeLTljJ7fuCGN
         uKU6CzpqZA+I207tzFkgCX3Cf/VHgQ+qYugvfaW5IMN2QAyGAardqffSyK9gTPj4WVyR
         LBCrfChB1T4rdlfmS/vbOUlVTwmM8e8Zk6A55Dkox768ECpfNOujI+94Zd7b4jdOsqxK
         SxQLM0YzjMt2IuHIFKkeowf5ABFRWb92kR+ZoMwPe5gTV13xREPNP083dJLZvO20AAS4
         6Bzw==
X-Gm-Message-State: AOJu0YzRxXxoZaExPpWUfCdY/VcOKaxQld0EcB+TkpCes4sZF6mNkI9X
	w608r7MQoMBwBIgeGNbYwo1ex+Hrr2OyeRbhsHz170+3evo/QIjAfZcp8w==
X-Google-Smtp-Source: AGHT+IFFVlfYIaALMCa9EgcPBwv4f2+faksMDySfpSB98W77nflVlpJrz/GGxyZdXatlEAJt6QRHRg==
X-Received: by 2002:a17:902:8208:b0:1fd:9269:72c6 with SMTP id d9443c01a7336-1ff04950890mr22758165ad.62.1722091113411;
        Sat, 27 Jul 2024 07:38:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7edd813sm51477515ad.170.2024.07.27.07.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 07:38:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (max1619) Add support for update_interval attribute
Date: Sat, 27 Jul 2024 07:38:19 -0700
Message-Id: <20240727143820.1358225-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240727143820.1358225-1-linux@roeck-us.net>
References: <20240727143820.1358225-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip supports reading and writing the conversion rate.
Add support for the update_interval sysfs attribute.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1619.c | 50 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 966fe650aa59..40f0726e9f22 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/util_macros.h>
 
 static const unsigned short normal_i2c[] = {
 	0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, 0x4d, 0x4e, I2C_CLIENT_END };
@@ -102,11 +103,20 @@ static int max1619_temp_read(struct regmap *regmap, u32 attr, int channel, long
 	return 0;
 }
 
+static u16 update_intervals[] = { 16000, 8000, 4000, 2000, 1000, 500, 250, 125 };
+
 static int max1619_chip_read(struct regmap *regmap, u32 attr, long *val)
 {
-	int alarms;
+	int alarms, ret;
+	u32 regval;
 
 	switch (attr) {
+	case hwmon_chip_update_interval:
+		ret = regmap_read(regmap, MAX1619_REG_CONVRATE, &regval);
+		if (ret < 0)
+			return ret;
+		*val = update_intervals[regval & 7];
+		break;
 	case hwmon_chip_alarms:
 		alarms = get_alarms(regmap);
 		if (alarms < 0)
@@ -134,14 +144,21 @@ static int max1619_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static int max1619_write(struct device *dev, enum hwmon_sensor_types type,
-			 u32 attr, int channel, long val)
+static int max1619_chip_write(struct regmap *regmap, u32 attr, long val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
-	int reg;
-
-	if (type != hwmon_temp)
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		val = find_closest_descending(val, update_intervals, ARRAY_SIZE(update_intervals));
+		return regmap_write(regmap, MAX1619_REG_CONVRATE, val);
+	default:
 		return -EOPNOTSUPP;
+	}
+}
+
+static int max1619_temp_write(struct regmap *regmap,
+			      u32 attr, int channel, long val)
+{
+	int reg;
 
 	switch (attr) {
 	case hwmon_temp_min:
@@ -163,12 +180,29 @@ static int max1619_write(struct device *dev, enum hwmon_sensor_types type,
 	return regmap_write(regmap, reg, val);
 }
 
+static int max1619_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_chip:
+		return max1619_chip_write(regmap, attr, val);
+	case hwmon_temp:
+		return max1619_temp_write(regmap, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t max1619_is_visible(const void *_data, enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
 	switch (type) {
 	case hwmon_chip:
 		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
 		case hwmon_chip_alarms:
 			return 0444;
 		default:
@@ -200,7 +234,7 @@ static umode_t max1619_is_visible(const void *_data, enum hwmon_sensor_types typ
 }
 
 static const struct hwmon_channel_info * const max1619_info[] = {
-	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS),
+	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-- 
2.39.2

