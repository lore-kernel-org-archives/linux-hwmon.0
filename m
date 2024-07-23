Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E831311A7
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695941; cv=none; b=hYhFY/O2WWQ3ttD/kAiPrY1IeSId1Ecas+RYhM9vIBGftNKZg+9pHAOoj4pLdTgPBN1UhaJBH5E+HgGpTniWlGeJFuudgSfPsimav0KJeAS2JHlxBfQceABfCrEO0ZwzqxubdM3UnNmiycYeHRC/tGdWSfJZYRCKIOIPEXA9gzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695941; c=relaxed/simple;
	bh=S5QZA80lhF4eaLBtFtxU3tRR7M2V+EChdPstNO83d3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JWDsNZBaBxzvqN9y6Kq4WMeE9w0mAIl6UgNEqOP/ylbiJRRPYObBkAgi7cVtM1V9GBm3cCxd4UV5vD5qP4ccm9aWedaSouD5gIWaKHaEdi1elBggwIgpFIuDXxe0swD3W6piPEAbvsMVnDORs8T1lupoDXzKBYCFUD4mykAKEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHX53S4a; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHX53S4a"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d1cbbeeaeso1031334b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 17:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721695939; x=1722300739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nB5+q1cLh9iZ99GCUGsuV9I+wkqVY2epG/v5xeZS9o=;
        b=eHX53S4adNoPdkXQRKbkqdYYpWnRZRs6V4T/sjrGr30LFMecKh60tocXiPXTnLDMY/
         AOuN789238qT+dY0hG1+IE6DkTns+bABUA5ZnK33AENKRdjlfkKZerocgHqLO7DjfzyQ
         Fnr37tq4HIuhE8m4KQn2EHczaj/SPHHYCHrSRDHPN8CWdk5qULClGLGU8lvAIbw0E9co
         hDEcqunWDJCfgnODn53sHy11CaGtiPqypXSGf3x78PhHMa5owl9fLMF6YfbQ8WMn/kMO
         8iBSSxGE3LLuB1CvjStd/DdT4Fu3jmMK4b3hhZeIQfJ+ofeYP6Gov/Aj7G2DCyshQdvU
         jo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695939; x=1722300739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nB5+q1cLh9iZ99GCUGsuV9I+wkqVY2epG/v5xeZS9o=;
        b=cOxzCMKkQioUp9l9aBAqkB5jFAa09MB42QefQb9JgfwZzkJd91ksErWqeuSH/n83l0
         Migv+8BrkV1nIaofWzNRYef46Yq3iTFMM8AH9hc/ZbgLbhiYDjESh1PNhhTncBS0G2AI
         vM/NScK7cRZz7q3HqJscQAi8bdqiseT4jGMXBtys42Rjkih9aNPCgUc9VsVJ4dcHSbex
         gT65NWj5iD/uDh/z3/GjCKbwx9FCCi4oKNrdT1JLZcOUCsWM8MoDl38SQzsFCmm5nf+2
         lRkYP8b9ocqKC75LZk2CA40NDh8t/Q94Ie/s/zZQb34CMMt/zodoiVF8aaRhKyRoUfyU
         frlQ==
X-Gm-Message-State: AOJu0YwH660UnY5duzUhmZfpgI6r7SF9QuOAqbNq1kPf8j3JdSu+9rtx
	6VDOgM10f3q/vZ6aP1BqHzaDj1KV72TK05U4ZXjDSQ2wpAu/cR0Lm9CSiw==
X-Google-Smtp-Source: AGHT+IGl1qX0ORX6P3pwtFFkDTh0xJox+vY+mi3Ht+u/hnOmuG9ht8H6mGxOPh+b9H1RBfFGiV08NQ==
X-Received: by 2002:a05:6a00:3989:b0:70a:f57c:fa27 with SMTP id d2e1a72fcca58-70d0862a20emr8994114b3a.19.1721695938913;
        Mon, 22 Jul 2024 17:52:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff5ab918sm5912872b3a.183.2024.07.22.17.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:52:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (max6697) Add support for tempX_min and tempX_min_alarm
Date: Mon, 22 Jul 2024 17:52:04 -0700
Message-Id: <20240723005204.1356501-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723005204.1356501-1-linux@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX6581 supports setting the minimum temperature as well as minimum
temperature alarms. Add support for it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 59 +++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index fbe90ab18b10..a00d38ed4d52 100644
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

