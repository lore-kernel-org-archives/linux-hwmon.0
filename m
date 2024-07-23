Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807815748A
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749502; cv=none; b=DE0ycMbGtxvsNeTi7MPVMD7KvkgOFBfssLbAkkpiMHuWi8lSmPqZcVGRcRkK+zKko0BojQ/fAN5peLCf8KC5n8EscJyPWleflGDqEf4giZg3LvGtW0eUKgAsh5WLtyv2JzvhEZqeHU6c7T3RvMs5/Gi2SfWnlJvvT7bB+iUBwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749502; c=relaxed/simple;
	bh=8zsInA8DAaeDdSumMpxjEhl5Hla1K1acU4hGZ7x3Zp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTYsU2r032N8WWPm4i8rbSdSYh8kO3wXZXEHhxwtfl2yEzw0YpBjJQmFFta7VDUtKE4rVUPVeqbRZGOxWieBIRZMB3NVVzVY4vAJcZ78aH21A0wRZhlRBB+UahXjsX3zy1cViqsKKjRXblSSKhbzCG8DOvj9tm1jHAmNw4d89so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCa0WnCE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCa0WnCE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc49c0aaffso472695ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749500; x=1722354300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpkFDOXxqaBbKBp8aKeAMKNaIl5wnTEyTkSfJxDt/iE=;
        b=WCa0WnCEECZh81q/uaHuzmXBxCaSI5NJRjRjtzfW9ILpsivcNhHPrHZjD+hFSTv6ix
         w3/U8StdVn1WKE8l5M5badlDQFNMcL4hUuDr5NDFN0l3HKkZpjCVzIO31/md/qewnha/
         xUOSSTkac3J7PkVUnlAsymDNsjulMuQa4dB57IONZRdB4uhrZ931/5jsKZI8VFArmwF7
         IlnIp4r3xOut9diHm0bKZwweSHyo0S+RhJzLIiEqysJUeiWzG6kpOeXZ18xQv9MSMDRq
         kjOOmlFDN+Bxn70ru/TawqLbB2eOv+JTezrTGPvkzYiaCpSXopIFayLOxWA2hKj6rTpe
         4w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749500; x=1722354300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NpkFDOXxqaBbKBp8aKeAMKNaIl5wnTEyTkSfJxDt/iE=;
        b=B0zHYnOslw0IMnKtfgEh6LzTOJjL7nP49folKbBY/GuRelDrUigU4SzPnwqfVzsJzw
         zKqoZn4zLXhqaEbTps23FF1uhD07ldOW052Tf4/RM1arV4G8Hi098M7RtcjwznXSH7R1
         8M+cu/BQysF21kM6mFn6HO/DTWhdleKeVYy3uIdLQztuCzDkVfMdrneU9bnGT43aWTIj
         l5NGnRNA3r+A2TTGQGDUqxrMzK8k/Q8OwrQcH88TqWFARMl3u/TS+dacRYkEPPMdh4C0
         EmAd58xCjl8gAtddDGa/akkZUtVykcsUDjbmU8RBkUxZx68mQN8ypaFUCK1pllPY/CDL
         1a/Q==
X-Gm-Message-State: AOJu0YyswUadWCwcfLp8ku7lXdhiqnASewRxJFDGcjNi90LijUFOBgbj
	wsuaHCeYx2/Sw8Hukfc8l35u+5WcOIZCu4xtomJpFEfPNwkK5GTMDuFOKg==
X-Google-Smtp-Source: AGHT+IFJ+DWom6foVULwLZSTA9DlHjovG+X8aeaJNu2aLQ1G/9HWLqj2IMKRS/vhx5MPUQ1vlKljJA==
X-Received: by 2002:a17:903:1d0:b0:1fd:9d0c:998c with SMTP id d9443c01a7336-1fd9d0ca08amr57988855ad.56.1721749499919;
        Tue, 23 Jul 2024 08:44:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f48cadbsm76234615ad.296.2024.07.23.08.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:44:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 6/6] hwmon: (max6697) Add support for tempX_min and tempX_min_alarm
Date: Tue, 23 Jul 2024 08:44:47 -0700
Message-Id: <20240723154447.2669995-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723154447.2669995-1-linux@roeck-us.net>
References: <20240723154447.2669995-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX6581 supports setting the minimum temperature as well as minimum
temperature alarms. Add support for it.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max6697.c | 59 +++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index a81e60879c1a..1b7b3f0da662 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -32,6 +32,7 @@ static const u8 MAX6697_REG_MAX[] = {
 static const u8 MAX6697_REG_CRIT[] = {
 			0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27 };
 
+#define MAX6697_REG_MIN			0x30
 /*
  * Map device tree / internal register bit map to chip bit map.
  * Applies to alert register and over-temperature register.
@@ -54,6 +55,7 @@ static const u8 MAX6697_REG_CRIT[] = {
 #define MAX6697_REG_STAT_ALARM		0x44
 #define MAX6697_REG_STAT_CRIT		0x45
 #define MAX6697_REG_STAT_FAULT		0x46
+#define MAX6697_REG_STAT_MIN_ALARM	0x47
 
 #define MAX6697_REG_CONFIG		0x41
 #define MAX6581_CONF_EXTENDED		BIT(1)
@@ -173,6 +175,18 @@ static const struct max6697_chip_data max6697_chip_data[] = {
 	},
 };
 
+static int max6697_alarm_channel_map(int channel)
+{
+	switch (channel) {
+	case 0:
+		return 6;
+	case 7:
+		return 7;
+	default:
+		return channel - 1;
+	}
+}
+
 static int max6697_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
@@ -205,6 +219,12 @@ static int max6697_read(struct device *dev, enum hwmon_sensor_types type,
 			return ret;
 		*val = ((int)regval - data->temp_offset) * 1000;
 		break;
+	case hwmon_temp_min:
+		ret = regmap_read(regmap, MAX6697_REG_MIN, &regval);
+		if (ret)
+			return ret;
+		*val = ((int)regval - data->temp_offset) * 1000;
+		break;
 	case hwmon_temp_offset:
 		ret = regmap_multi_reg_read(regmap, offset_regs, regdata, 2);
 		if (ret)
@@ -234,17 +254,13 @@ static int max6697_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = regmap_read(regmap, MAX6697_REG_STAT_ALARM, &regval);
 		if (ret)
 			return ret;
-		switch (channel) {
-		case 0:
-			*val = !!(regval & BIT(6));
-			break;
-		case 7:
-			*val = !!(regval & BIT(7));
-			break;
-		default:
-			*val = !!(regval & BIT(channel - 1));
-			break;
-		}
+		*val = !!(regval & BIT(max6697_alarm_channel_map(channel)));
+		break;
+	case hwmon_temp_min_alarm:
+		ret = regmap_read(regmap, MAX6697_REG_STAT_MIN_ALARM, &regval);
+		if (ret)
+			return ret;
+		*val = !!(regval & BIT(max6697_alarm_channel_map(channel)));
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -270,6 +286,11 @@ static int max6697_write(struct device *dev, enum hwmon_sensor_types type,
 		val = DIV_ROUND_CLOSEST(val, 1000) + data->temp_offset;
 		val = clamp_val(val, 0, data->type == max6581 ? 255 : 127);
 		return regmap_write(regmap, MAX6697_REG_CRIT[channel], val);
+	case hwmon_temp_min:
+		val = clamp_val(val, -1000000, 1000000);	/* prevent underflow */
+		val = DIV_ROUND_CLOSEST(val, 1000) + data->temp_offset;
+		val = clamp_val(val, 0, 255);
+		return regmap_write(regmap, MAX6697_REG_MIN, val);
 	case hwmon_temp_offset:
 		mutex_lock(&data->update_lock);
 		val = clamp_val(val, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
@@ -308,6 +329,14 @@ static umode_t max6697_is_visible(const void *_data, enum hwmon_sensor_types typ
 	case hwmon_temp_input:
 	case hwmon_temp_max_alarm:
 		return 0444;
+	case hwmon_temp_min:
+		if (data->type == max6581)
+			return channel ? 0444 : 0644;
+		break;
+	case hwmon_temp_min_alarm:
+		if (data->type == max6581)
+			return 0444;
+		break;
 	case hwmon_temp_crit:
 		if (chip->have_crit & BIT(channel))
 			return 0644;
@@ -334,27 +363,35 @@ static umode_t max6697_is_visible(const void *_data, enum hwmon_sensor_types typ
 static const struct hwmon_channel_info * const max6697_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
 			   HWMON_T_FAULT | HWMON_T_OFFSET),
 	NULL
 };
-- 
2.39.2

