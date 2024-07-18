Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1869E29CFB
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273990; cv=none; b=EJYWyKpSaKk1VcJ8Eb4MjR96l/ZYO/Uklsst8yRUHvTOZPviKtRSYd7XzdD1gxq8+xdC8vA4PqI59yeoR04tRR4bDyn9T6Qa2av8CbWc5T9xZXKr0fza3EB3xQRslRWihmr9GfjvPHZS6IEIazAjFmMevDP8ENF20pNJ627UBKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273990; c=relaxed/simple;
	bh=LQ5d9lXguP9bTKK4RlKNlY68L4o/NPa/2cSucBUXfKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FrkEv158Dtl5hGh9EwVhxqKuKqPlFtrzw2Qr2WL9/PrVKRjtZ1re9xmU9bbJq1P2sIqApvj7TgIKolLbUR8QhAYo6a9ZJAt56iyu9huzqLXellldF9VkDV/4dkAXI0JRSE6Ygb7dt79mXIMwAS2nKVbvYDpP0ScRXPuiinnTGrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcFuXz2X; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcFuXz2X"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-381f24d6bc4so1050055ab.2
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273987; x=1721878787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0L7pTOARV5ET+Bp4V/IgQd3bIzYDALg6WqZkmWTvDE=;
        b=AcFuXz2XYuULT+yzxh3JpyI/7YyeL7QHIk//79NIBQ1mL3HD+I6n+Eqp7uO0F9UcTz
         dLR0Pq3pJ9f0xpG9s7pyEVDbcnWVZV0s5YMPCWyJvNWBpgJQBtU12M5t8SQ4hWsKAYNy
         b1yy6adXLW1P87K5Ekew/BLT9GpQeX93ARDsqoLsSq6lMbQhg2oXtKOLoX4LszCe9bt+
         HTtRwlnWzFOe9e+CbrETqUXUjLU+vvTDtj4hDq78vgX9DC6yps2GgvCcPwjlMadbCJgc
         aDerMcWgPo9lJxfiynHKtYY8XJzijvb0jnnwk3dMbXWELDy1bAgqvpTQgNC6caTjJLGj
         CZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273987; x=1721878787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0L7pTOARV5ET+Bp4V/IgQd3bIzYDALg6WqZkmWTvDE=;
        b=DLYk2bTUp9fPcUJLXmaDdBMKGWSaY2i7qHWN9VjFO3pu4C1IQbGv/DnUpPs0kVf3KT
         WWa7DdQ9DOssM5u/D2UsGo8yvervDVfpwjyfYckDiwtsB3k0XqlQiUzSQnBqas96E85H
         jXGBdtPDyYkhTfom23igjcaaX1HXwW7zM7GIedSVpqW32k1wndGGgdYLh2jbciLAT083
         1CO3qx52LSy4VT2EBfK/fzTMZaG8hwF+2jwasJ6eZ9CeBgb5MHPvEDOScVLJW+OQstJ8
         7Tzz6+9uNaNEg59j8KxLj860yFZ9vlxnH6BAWiV72w/sS3UwNDj7qpavrRqO6In0U88B
         iPXA==
X-Gm-Message-State: AOJu0Yw6TV4JlD2SeaMI760duuTFGyCi5YrPDlKXnyQUYshGK7E/2Ahf
	Oz4FJm/kDV3dvQ7nXshthZUBh6IRTR1UXSLJdeCX5PT1vXf+2oFQJSF2zw==
X-Google-Smtp-Source: AGHT+IFNEXDG6KQAyxWex8tWsZ7/5RL7WxmJmyDpGJvJEabuVf9iuduJ5ho9pXNGzt1EmQROIikmjg==
X-Received: by 2002:a05:6e02:1e0c:b0:375:e93b:7c8c with SMTP id e9e14a558f8ab-39555613f3amr49927755ab.12.1721273987326;
        Wed, 17 Jul 2024 20:39:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7d2a1sm8940983b3a.123.2024.07.17.20.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (lm95234) Add support for tempX_enable attribute
Date: Wed, 17 Jul 2024 20:39:34 -0700
Message-Id: <20240718033935.205185-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718033935.205185-1-linux@roeck-us.net>
References: <20240718033935.205185-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LM95233/LM95234 support enabling temperature channels one by one.
Add support for tempX_enable attribute to be able to use that
functionality.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 1a164f47fb3e..f0df1134f811 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -144,6 +144,11 @@ static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long va
 	struct regmap *regmap = data->regmap;
 
 	switch (attr) {
+	case hwmon_temp_enable:
+		if (val && val != 1)
+			return -EINVAL;
+		return regmap_update_bits(regmap, LM95234_REG_ENABLE,
+					  BIT(channel), val ? BIT(channel) : 0);
 	case hwmon_temp_type:
 		if (val != 1 && val != 2)
 			return -EINVAL;
@@ -183,6 +188,12 @@ static int lm95234_temp_read(struct device *dev, u32 attr, int channel, long *va
 	int ret;
 
 	switch (attr) {
+	case hwmon_temp_enable:
+		ret = regmap_read(regmap, LM95234_REG_ENABLE, &regval);
+		if (ret)
+			return ret;
+		*val = !!(regval & BIT(channel));
+		break;
 	case hwmon_temp_input:
 		return lm95234_read_temp(regmap, channel, val);
 	case hwmon_temp_max_alarm:
@@ -331,6 +342,7 @@ static umode_t lm95234_is_visible(const void *_data, enum hwmon_sensor_types typ
 		case hwmon_temp_fault:
 			return channel ? 0444 : 0;
 		case hwmon_temp_max:
+		case hwmon_temp_enable:
 			return 0644;
 		case hwmon_temp_max_hyst:
 			return channel ? 0444 : 0644;
@@ -350,21 +362,21 @@ static const struct hwmon_channel_info * const lm95234_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
-			   HWMON_T_MAX_ALARM,
+			   HWMON_T_MAX_ALARM | HWMON_T_ENABLE,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
-			   HWMON_T_CRIT_ALARM | HWMON_T_OFFSET,
+			   HWMON_T_CRIT_ALARM | HWMON_T_OFFSET | HWMON_T_ENABLE,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
-			   HWMON_T_CRIT_ALARM | HWMON_T_OFFSET,
+			   HWMON_T_CRIT_ALARM | HWMON_T_OFFSET | HWMON_T_ENABLE,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
-			   HWMON_T_OFFSET,
+			   HWMON_T_OFFSET | HWMON_T_ENABLE,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_MAX_ALARM | HWMON_T_FAULT | HWMON_T_TYPE |
-			   HWMON_T_OFFSET),
+			   HWMON_T_OFFSET | HWMON_T_ENABLE),
 	NULL
 };
 
-- 
2.39.2

