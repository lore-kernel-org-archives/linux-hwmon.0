Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414028EA
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Oct 2024 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291875; cv=none; b=WvejJ9KksleIJZaW1Ffv+k1Ry7allNLNEn1tekX/4nqAKF+TEFXZVdA6tiKM2SPVIij/e4JzxNxwko/yPB/t+Vp3Wd+g086vKvx57qoPSs3OnFgozd52z7hSzJENTkTzoljcYUL9aRd9oLulQStjaDMqNc2Z4HpfLWC09Zqo8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291875; c=relaxed/simple;
	bh=r4Hefdp7jmqnhB4BcINQYp3uyMwa4Roxp9yO+tqu+pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I27TdQV2uOLtEus1R6gva+Ze3rb5clEVKJZBBneBz9lIb1+ApnbKf5PmInH/SW6vtKxPnR1xmXeGKBpzy+A2qPyzrP23NkejLXaw9jjizbszfnwi3t80p6K347AOUxYr7jwMbr9C+5c8ac/6D2mCsCjz9EYuazOsDVw720QSwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=R5AVfZvu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="R5AVfZvu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso41822375e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Oct 2024 02:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1728291871; x=1728896671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxQS/l1S5f4q/J7Eu+WPkU1XrzUO7pYeH0O4sjkh4Jc=;
        b=R5AVfZvuKxt9cH9vYl+8OUpWwsnt09QomoXmAFZ2+H5Vuo+eBVD/4ZfjzwZ0AqRdHP
         3P8HxWmhjdxxopZHQ/Us95v+jurGNUtob/pnBm6moJsc0FH3AJ8NFrS5nyv/ZeZe0E+V
         kbX4bdCGa7lS6ndwSlftrr1RcYwaO3XopUcneb9TTNMEa21j+lmtq5GS/TDXLg9PjjxC
         SF//5cUtDDixb4EzESsM0NOoFHFiERfqfg1U5Kj8klYjQEe+7DwKaGssSglae/R7w1fW
         QdGP2+9Jh7zF3pxTfp1vEkJURp7fcVd3Zkbdx7SJgNpiGKYmc4va3MWdyqVuMvah/szl
         FeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728291871; x=1728896671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxQS/l1S5f4q/J7Eu+WPkU1XrzUO7pYeH0O4sjkh4Jc=;
        b=EvaTd+3kxbSkac3n5D3btCwQdxPsORXxw1AM7VrwieBojZw5aRRJps/tZmLm9T0SAn
         31sIM3Uvo+/YlJPnVyeb4q0AH/+T1CGPBASbCnvgG5DSETvCLmYcD794NLW/n15ZZ6cQ
         KpQX7vynTBHt7SZnf8KHFhw5W80yZtj7528wAmaGl7vFUtZfIslAx8qceEopzdQP2/OO
         CkocWmdHybcu6tOSL40kp4CD1PXBg1ZKvCMAtWfpp/fnrwpwLC+M9ZsfoJNXD+FMpSPV
         SHnj3u1XNvrrYkHrm1TMlDyLgE7vQtZR9Y2Hyj+7alNXDvnHj8V0xCbeUz9pgs1sJ9J3
         OoYg==
X-Forwarded-Encrypted: i=1; AJvYcCX/VFOcIQ7Dhm8IBd93VEGyBtxgNm/k/CGswzfDcPGIIDa2ScZRzgkfVxXrrAWxMrq8tqOxRJB9NjXzzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzpNYeLUhv/ZuS6Fx04r/eZxx1pUcKmhloMxX4R949nLUI6nJ
	SY9W6AnVMt0Y3uRMKH+VoDeML9qXIc6pN5ySReJ0jniQxjlA9ccuruBSBerXZKA=
X-Google-Smtp-Source: AGHT+IHu1e2HthveWdVl2pRLqlE63KKxY9R4TlkpOp7LjjomIa4wkuoqQajX4hFx9XtzyKJ8HYywvg==
X-Received: by 2002:a05:600c:1907:b0:428:e866:3933 with SMTP id 5b1f17b1804b1-42f85ae9d2bmr91093225e9.22.1728291871055;
        Mon, 07 Oct 2024 02:04:31 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89eda21esm68453185e9.46.2024.10.07.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 02:04:30 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Subject: [RESEND PATCH v2] hwmon: (max6639) : Configure based on DT property
Date: Mon,  7 Oct 2024 14:34:24 +0530
Message-ID: <20241007090426.811736-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove platform data & initialize with defaults
configuration & overwrite based on DT properties.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V2:
- Allow initializing the driver with defaults & overrid based on DT
  properties if specified.
- Remove unrelated changes.
- Optimise ppr check to remove unacceptable range.
---
 drivers/hwmon/max6639.c               | 85 +++++++++++++++++++--------
 include/linux/platform_data/max6639.h | 15 -----
 2 files changed, 62 insertions(+), 38 deletions(-)
 delete mode 100644 include/linux/platform_data/max6639.h

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index c955b0f3a8d3..6eacb5aed96d 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -19,7 +19,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/platform_data/max6639.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 
@@ -531,14 +530,51 @@ static int rpm_range_to_reg(int range)
 	return 1; /* default: 4000 RPM */
 }
 
+static int max6639_probe_child_from_dt(struct i2c_client *client,
+				       struct device_node *child,
+				       struct max6639_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i;
+	int err, val;
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
+	err = of_property_read_u32(child, "pulses-per-revolution", &val);
+
+	if (!err) {
+		if (val < 1 || val > 5) {
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
@@ -546,21 +582,29 @@ static int max6639_init_client(struct i2c_client *client,
 		return err;
 
 	/* Fans pulse per revolution is 2 by default */
-	if (max6639_info && max6639_info->ppr > 0 &&
-			max6639_info->ppr < 5)
-		ppr = max6639_info->ppr;
-	else
-		ppr = 2;
+	data->ppr[0] = 2;
+	data->ppr[1] = 2;
 
-	data->ppr[0] = ppr;
-	data->ppr[1] = ppr;
+	/* default: 4000 RPM */
+	data->rpm_range[0] = 1;
+	data->rpm_range[1] = 1;
 
-	if (max6639_info)
-		rpm_range = rpm_range_to_reg(max6639_info->rpm_range);
-	data->rpm_range[0] = rpm_range;
-	data->rpm_range[1] = rpm_range;
+	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "fan"))
+			continue;
+
+		err = max6639_probe_child_from_dt(client, child, data);
+		if (err) {
+			of_node_put(child);
+			return err;
+		}
+	}
 
 	for (i = 0; i < MAX6639_NUM_CHANNELS; i++) {
+		err = regmap_set_bits(data->regmap, MAX6639_REG_OUTPUT_MASK, BIT(1 - i));
+		if (err)
+			return err;
+
 		/* Set Fan pulse per revolution */
 		err = max6639_set_ppr(data, i, data->ppr[i]);
 		if (err)
@@ -573,12 +617,7 @@ static int max6639_init_client(struct i2c_client *client,
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
-- 
2.42.0

