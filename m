Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D89197A67
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Oct 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861010; cv=none; b=XR8oZvS0qAGCld379zfTUfdMU0I2P3xFxVTHshNeParoNAXaWqSrgqbbMglY7WUK8WhYnbNzo5z75BwsC3H0m4WwEEicQr1WNt1uOg5fMSM8YAsbqQfDVTKvgTUaKq8Hi5wkJM7OkhAeZLBIpqioYwAMzHH1VgFU5jkN30yh6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861010; c=relaxed/simple;
	bh=rHnHIuSyzhmPhP0FfAgMPg49xxDTPvlg4d1owihhlg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuIvhJ2sMBitdQjnWySc+qp886dfbMcl+3V2RhSPIXNTXV9ySgnSGRGkCvdhZcsB1Cj+nAtQa6+Fw2kRLRop7/jIBPkY2qZmviAC1FOILz/piskoAbfzqWExU4lZAB1NiraRWiOBWYmn/SjrsVL/QiDXL8eHwneYGf1jS3MjPRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Uqb4l/An; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Uqb4l/An"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so3869315e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Oct 2024 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1727861006; x=1728465806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vlfjEIyAahvf18dv7sYHryYHa0mCJBKK6mnx44cMQ7Q=;
        b=Uqb4l/Anc8axUKtx6KsimqdWPzxLkPlyP9a4D3Fx/JAebKdlxlaezn0ZehH2EmXOY3
         C9rwFVhyuf7GPV+ZSuAh95bnEgszk3F+UOtFSiXynR+o0/5A8QpZ7WYWrd0X9z112wd7
         ZD59E+I8NyIVpEk+9ZcNwZAYvNO3exkIkMDZaRS3iNEdPX8lMWu0e/yHsQRutGPyqkWV
         xrD5trb4Tag5Bkswp1vk6lc5/m1nitREkXchH93+nrUvMFd2IBjtGD5wcFtu//0bT4s8
         apWtVpEHJ3hcZhpbXQmWgJvLFmlIE7h37Km9lhlxjJz21HVvuHo+KgDQ2M3oo/Ll0Rgv
         bfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727861006; x=1728465806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlfjEIyAahvf18dv7sYHryYHa0mCJBKK6mnx44cMQ7Q=;
        b=o2irlhi1ZtjbgupRQeIcFGRAim4snghd0K3xRnccARUqlx+FuWD/uLD9VFbrRQlX8f
         qOxMOZg7fltqNn2lDhFBEG4kar24QcI3z47sJYyQzz1fla3qxjO28anWJuuCTI6Khvs1
         7db/XqRtHJv/FkhEJEWMAAkc1RYs/Q1O+0YqtuAcfWK1zkR71E7pBVcB3orhTn4ZsTn9
         T8Mp9Bak4AojqCc6IUFV3t3zK87ZhZC7VvXzvZVDlVomgAy+CTCvhznyOGUPbDrZZKX2
         oWXLX5J/xHtplgG3vMsU+y2BNel165/MqD19qAxXDYAiX7WH2+HwosKmM9h2j3mnijG+
         BTFA==
X-Gm-Message-State: AOJu0YwaSH6Udn6MPlwfxZJ87WGze06k49+xPEKdlXhRlTfo7r3Iwd5P
	mDD5c5tKWrYPuSeTFpgqu40UiWXtkvmxJro6aKkk4zmUCiMge+JQtZLHOeyqc80=
X-Google-Smtp-Source: AGHT+IEXO3zx+73ZsZBfYY1Gm4EtHfSbEd3IMn7R0Afp07XQzAfFGjOaxi2qGn1hoKttNi+MoTYkQA==
X-Received: by 2002:a05:600c:45c5:b0:42c:b603:422 with SMTP id 5b1f17b1804b1-42f776e0694mr14780645e9.8.1727861006222;
        Wed, 02 Oct 2024 02:23:26 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ec0a44sm13261905e9.17.2024.10.02.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:23:25 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-hwmon@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (max6639) : Configure based on DT property
Date: Wed,  2 Oct 2024 14:53:11 +0530
Message-ID: <20241002092313.500993-1-naresh.solanki@9elements.com>
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

