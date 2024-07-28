Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C546450
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177452; cv=none; b=UNwpjJnGzTXXi28u+42nSAmfw9Fal7aoQAZ3SPvRdiRou8VqitEJuv+cfE9+WX7t3qDTRvRy19WXjrHm0sLrxkL9qtaozd9mHwxe2FMpuUyVLkGYLY1lSwOePc/HvCCtnvxPGX8i+lBG4Xud9J+DapFNKO9IRxqsLCqHsjZFr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177452; c=relaxed/simple;
	bh=vKAXfPU2jmnmfulNz+xXcrRGpqCzdRJX9qJ/BczlgTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m8RRoI2XCaDMCjcmAe2tOB7g7GaJt9bYFe15B93u+nTAdFjbskPCe8/8DePQEXC2rIntbAAGnER1YDSkLL9j4hR/FUkDZdIhbGcV74Kzz7n78AGvK4lZ6LrUhQBD+e1ofz9dCORy25YEAULCeKq2jbo/PwSUIj/TKp4UCu7/CbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY7QXQk2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY7QXQk2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb5243766dso1839777a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177449; x=1722782249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVOSYEX0JAjA7HDHjEzgiZYocwvk6kRsqAgdNKClBQk=;
        b=jY7QXQk2fNSIs0yfz5s5T7DB3vdQFuk8mJqmS1AE46DalHOzBY2l05E9iIdt66QNAQ
         ytD30oedyLT8pl8x2mlxMKoNvlfxNUrahPG8Z3gHC5Q9DrPUkcb1aE3He2nQ+3MRixPU
         QO4bdza7smJL1zBZyVWAaP7Py4WlvnF9J37DGGSBrVLCMazyb8zlnjLZhKIaFpf8pftn
         zUd4CD5mdFWbC4/DqRlcRhU/A0tgKclJnheZK9quZnQ+wRsLM6McqO5B4vf4PmdZZ/ql
         N1SOOKYu7XUBBjnykqQDmbepb7Z2etmNazXAaXvrmsUqdMjaOxmfPRATQ7wT96VklBb2
         i5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177449; x=1722782249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVOSYEX0JAjA7HDHjEzgiZYocwvk6kRsqAgdNKClBQk=;
        b=HqHoGIxl+9UONQw6ZHvUbGyiU8g4VaHjTu3c+0+ZEfD3qRZBgeB0LG62S2riZb9+xh
         PMkptgAXr/l9TLGxi2K5AOET9R/ZO8Ey7MrvIzm3eiJK4kLyjMjXN2WU/BIr2a6us2v9
         K0p2BiRbcUs80LWehzij5r9D8CZw06PpXMFzGma7FgLYaFFa1A7Wim+9NnxyDQWGKrY+
         qx4bKBWTCmZGgd0ilOtgX59efupHfp+2mGR8zdJraMxks6gSiXoeFa9omXjMrCdtXa2h
         MHZzcb9Rsi5ReD2+uQY2aek/0nBjZcHa/QgKHwiPz7lETro1l7LafpZXerP9Gpsrzucs
         lzow==
X-Gm-Message-State: AOJu0YzFiFHiAtVCZrkjwe40joqEBVyLbBZOBJicYHNQR60hqb/KAS7c
	c73dZo7CdINX3HWkiN8JZeiqX6+ASu8KyefFkmnq0WHGMcNx4OvV6JwKkg==
X-Google-Smtp-Source: AGHT+IHqlUE0EXUE4PvxkD9a0yMIA6zI70YzmVgvKfPCigEejXw3YYG5In6wYMGOx3XlsrpRwPpB+A==
X-Received: by 2002:a17:90b:1e03:b0:2c9:7219:1db0 with SMTP id 98e67ed59e1d1-2cf7e097ee5mr6001904a91.3.1722177449466;
        Sun, 28 Jul 2024 07:37:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cd8cfb9fc4sm5958202a91.0.2024.07.28.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 6/7] hwmon: (max1619) Add support for update_interval attribute
Date: Sun, 28 Jul 2024 07:37:14 -0700
Message-Id: <20240728143715.1585816-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728143715.1585816-1-linux@roeck-us.net>
References: <20240728143715.1585816-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip supports reading and writing the conversion rate.
Add support for the update_interval sysfs attribute.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1619.c | 50 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index fd84bcc789fa..69d3156fa2ba 100644
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

