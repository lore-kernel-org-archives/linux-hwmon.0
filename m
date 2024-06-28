Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC91865A
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Jun 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575704; cv=none; b=IdTc1Xn9HmJ7HUkJ99yLuKSHUXahxwPyhFXkjh5iYrpGYTta+6cGq1E2S81Ky4+u3LWgUtje9niWYSVp7/ClDBCdpfw4XyqkYePXen2h/Y8cWCV/KuwsDz4hJP9ixNsKedCEnJ7i0lv49aGVQjOaoOKcV1D74ncfzDUuaJpqwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575704; c=relaxed/simple;
	bh=bDgRZvXfr+xYcPohdlUiNo+bgU61G6SZiqtXj1MIhUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hq3DeWBhVo/RAsp1vCf9UptNAvz820lU3kWLY8SnLIPeYheIhAlKQLWJlqYG8TEOltodn8WCvE4cNpW+Qg2aXKn/+IwKa39/+lm6ZyXxfPNBkczhaRKqqtRoEbT2SejdrI/6kNBbu6SQmqZd5Xw/5fYRMJa60QeOSdwuSPnDJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SXdOZzSv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SXdOZzSv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42565670e20so10113405e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Jun 2024 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1719575701; x=1720180501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TwFTBEIPvGM9Ex++g4fKeM8/qdwV455RPuyTONqsHs=;
        b=SXdOZzSviMOw7doCBbCXOfWerJsHs/GYTck3nmaN29IO/IFP/Xl350ybMLoIv0vXgR
         nhgVT8us3gqdGlxYHfo7lgxapUdWIzakZf54utiWG5fKRNuHimJfotfAtJGKrCOUpfef
         DclraEbN0ac/cBQaeC27OLAezO7Gv4Sn/vEdNxJN1+hnwGyUI0EpPnl5LABTCrrKmr1J
         gDwJdH99XeDbkbTyfzyAOd0HyOdO5pZi/F2r8YIqyAjMISYWbuxUoE925BT6tOQmrRmh
         p463+T9KAgWvMacoSWRErfyIim/WsYTbAHd0tHQYIpgwIH7HlY2mmQBafsWfPXIl3Gcj
         aw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575701; x=1720180501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TwFTBEIPvGM9Ex++g4fKeM8/qdwV455RPuyTONqsHs=;
        b=SY0jcKNxN6Y6Nqsd2hZhpdVG0HF9n4w4F8iH3BXjyMLElxyUm0uFkApDF90jSMEJsg
         q/c8kaYwEX46CgzZjJVnra62OW0FLzFKaVAfMxSILj0FGCOCy4ZuCM+d9tmBbEjeQ0Gu
         aQDpJLsBV6/2Bk0csEwj38qblKBxUpC0C/RbEixgUHu1q67jktAq4OIIDtWTmC/NZthW
         smMHZOoT7w4W2LSbtk4tv1BhveKizCqEcWlsQpi2qruhKLEitv+5x9olTdufsEj7n7a5
         AR5NP/ITBh37/0U5srfe/A4E7jub/gV+1qg4QGpXovV/K35SA2NJ5SnW9DXuGfDYxRL3
         8FCA==
X-Forwarded-Encrypted: i=1; AJvYcCUdUon3TQN27/fRTm9N7ta4nvPPM6BS1bE4VnRQ6v9YpePvYu14Q1AxiczleqxpYMc1rY3h0w4MR+1Gy3pXj029TgU+tntYvkOX03k=
X-Gm-Message-State: AOJu0YwxxQ+/L+Ok3fDONpHr19BT+SRlgIc9gQTb3szEu1CcHai7/IuO
	EbrxWiuDxnO2r/6uINq7UmjrvZr4OQT3bdnGc/cQy9ShdmXQrucWYABLw8GwgTFHUxwPCoIjzvF
	q
X-Google-Smtp-Source: AGHT+IFJ2s0EV94XDoTmpx2GkTpJ18sqsSQ4LFB5IAj0596ZGa8OoDKEh0tJ1MYTNf/OlO3uDT5YEw==
X-Received: by 2002:a05:600c:12c4:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-4256d4e5b37mr12062505e9.6.1719575700918;
        Fri, 28 Jun 2024 04:55:00 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af37828sm33369635e9.9.2024.06.28.04.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:55:00 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (max6639) : Add DT support
Date: Fri, 28 Jun 2024 17:24:50 +0530
Message-ID: <20240628115451.4169902-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove platform data & add devicetree support.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/max6639.c               | 99 ++++++++++++++++++++-------
 include/linux/platform_data/max6639.h | 15 ----
 2 files changed, 73 insertions(+), 41 deletions(-)
 delete mode 100644 include/linux/platform_data/max6639.h

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index f54720d3d2ce..9ae7aecb0737 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -19,7 +19,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/platform_data/max6639.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 
@@ -81,6 +80,7 @@ struct max6639_data {
 	/* Register values initialized only once */
 	u8 ppr[MAX6639_NUM_CHANNELS];	/* Pulses per rotation 0..3 for 1..4 ppr */
 	u8 rpm_range[MAX6639_NUM_CHANNELS]; /* Index in above rpm_ranges table */
+	bool fan_enable[MAX6639_NUM_CHANNELS];
 
 	/* Optional regulator for FAN supply */
 	struct regulator *reg;
@@ -276,6 +276,11 @@ static int max6639_write_fan(struct device *dev, u32 attr, int channel,
 
 static umode_t max6639_fan_is_visible(const void *_data, u32 attr, int channel)
 {
+	struct max6639_data *data = (struct max6639_data *)_data;
+
+	if (!data->fan_enable[channel])
+		return 0;
+
 	switch (attr) {
 	case hwmon_fan_input:
 	case hwmon_fan_fault:
@@ -372,6 +377,11 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
 
 static umode_t max6639_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
+	struct max6639_data *data = (struct max6639_data *)_data;
+
+	if (!data->fan_enable[channel])
+		return 0;
+
 	switch (attr) {
 	case hwmon_pwm_input:
 	case hwmon_pwm_freq:
@@ -544,43 +554,85 @@ static int rpm_range_to_reg(int range)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(rpm_ranges); i++) {
-		if (rpm_ranges[i] == range)
+		if (range <= rpm_ranges[i])
 			return i;
 	}
 
 	return 1; /* default: 4000 RPM */
 }
 
+static int max6639_probe_child_from_dt(struct i2c_client *client,
+				       struct device_node *child,
+				       struct max6639_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i, val;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &i);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+
+	if (i > 1) {
+		dev_err(dev, "Invalid fan index reg %d\n", i);
+		return -EINVAL;
+	}
+
+	data->fan_enable[i] = true;
+
+	err = of_property_read_u32(child, "pulses-per-revolution", &val);
+
+	if (!err) {
+		if (val < 0 || val > 5) {
+			dev_err(dev, "invalid pulses-per-revolution %d of %pOFn\n", val, child);
+			return -EINVAL;
+		}
+		data->ppr[i] = val;
+	}
+
+	err = of_property_read_u32(child, "max-rpm", &val);
+
+	if (!err)
+		data->rpm_range[i] = rpm_range_to_reg(val);
+
+	return 0;
+}
+
 static int max6639_init_client(struct i2c_client *client,
 			       struct max6639_data *data)
 {
-	struct max6639_platform_data *max6639_info =
-		dev_get_platdata(&client->dev);
-	int i;
-	int rpm_range = 1; /* default: 4000 RPM */
-	int err, ppr;
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int i, err;
 
 	/* Reset chip to default values, see below for GCONFIG setup */
 	err = regmap_write(data->regmap, MAX6639_REG_GCONFIG, MAX6639_GCONFIG_POR);
 	if (err)
 		return err;
 
-	/* Fans pulse per revolution is 2 by default */
-	if (max6639_info && max6639_info->ppr > 0 &&
-			max6639_info->ppr < 5)
-		ppr = max6639_info->ppr;
-	else
-		ppr = 2;
-
-	data->ppr[0] = ppr;
-	data->ppr[1] = ppr;
+	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "fan"))
+			continue;
 
-	if (max6639_info)
-		rpm_range = rpm_range_to_reg(max6639_info->rpm_range);
-	data->rpm_range[0] = rpm_range;
-	data->rpm_range[1] = rpm_range;
+		err = max6639_probe_child_from_dt(client, child, data);
+		if (err) {
+			of_node_put(child);
+			return err;
+		}
+	}
 
 	for (i = 0; i < MAX6639_NUM_CHANNELS; i++) {
+		if (!data->fan_enable[i])
+			err = regmap_set_bits(data->regmap, MAX6639_REG_OUTPUT_MASK, BIT(1 - i));
+		else
+			err = regmap_clear_bits(data->regmap, MAX6639_REG_OUTPUT_MASK, BIT(1 - i));
+		if (err)
+			return err;
+
 		/* Set Fan pulse per revolution */
 		err = max6639_set_ppr(data, i, data->ppr[i]);
 		if (err)
@@ -593,12 +645,7 @@ static int max6639_init_client(struct i2c_client *client,
 			return err;
 
 		/* Fans PWM polarity high by default */
-		if (max6639_info) {
-			if (max6639_info->pwm_polarity == 0)
-				err = regmap_write(data->regmap, MAX6639_REG_FAN_CONFIG2a(i), 0x00);
-			else
-				err = regmap_write(data->regmap, MAX6639_REG_FAN_CONFIG2a(i), 0x02);
-		}
+		err = regmap_write(data->regmap, MAX6639_REG_FAN_CONFIG2a(i), 0x00);
 		if (err)
 			return err;
 
diff --git a/include/linux/platform_data/max6639.h b/include/linux/platform_data/max6639.h
deleted file mode 100644
index 65bfdb4fdc15..000000000000
--- a/include/linux/platform_data/max6639.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _LINUX_MAX6639_H
-#define _LINUX_MAX6639_H
-
-#include <linux/types.h>
-
-/* platform data for the MAX6639 temperature sensor and fan control */
-
-struct max6639_platform_data {
-	bool pwm_polarity;	/* Polarity low (0) or high (1, default) */
-	int ppr;		/* Pulses per rotation 1..4 (default == 2) */
-	int rpm_range;		/* 2000, 4000 (default), 8000 or 16000 */
-};
-
-#endif /* _LINUX_MAX6639_H */

base-commit: 52c1e818d66bfed276bd371f9e7947be4055af87
-- 
2.42.0

