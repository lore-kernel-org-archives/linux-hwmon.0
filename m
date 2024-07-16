Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048F013CFA3
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170866; cv=none; b=PNjK9THOYSHwre1y6ZNag1LcJl9QXxNfMA8AU2n9PCV2OZNKGXBHOtzinNiVhajTJNx1I5N57DoK3mARsdYpxlXubrf1zNNof3bYWmhaKWmFECrXJRTzRcAZq8bRqUl9GXyfmyEdlQPdZ24+UQHA+ERpqEEy2QVtFISaRL1N1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170866; c=relaxed/simple;
	bh=5KRu6nKVGaIlnN9OCR5zGlA+I97IxU9GGfRmJsf+Pyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BLl+iayFCb59A+FUNrJdDHLPJCcIr519vRCJ3AXflUPG6N1Ad9XrgDwM7t0Fg/+NEro/q4AgRLJCADzNwfbJbuD/wGCi6LDwIglsVmlwWQ3CdYKCrJTZRkH94LuEtXARxQKSE0jeIoBWzX2XescBiw1uovP7u3PzWkFR2Vch5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WA5IXj5b; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WA5IXj5b"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70b07bdbfbcso188031b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170864; x=1721775664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBIc44ePzm+Ayf/98yNwj7sQekbnxNa9YFMUCHmbPMg=;
        b=WA5IXj5b+uB+elLhHCdFFoboHdVNEwN5WaPEOBBmcQVBFOqpWhxJQ85NdW9gIxfUEp
         S8wU7NI+y4xFUteHI8NKDKYZC45uklUmBbH+xEciht75H/gyZM2P777HiGEvYPMYWNtQ
         WZI9dcGh3f/AYxbR8G1r/cyzaf8ycYwVF0odIHWM8Np5dBIkNZ3BLDPfbID7uaOnyVhS
         XLqd57S37+jqpGSv8C9yP1hFmQ1RQmoSMSYzQufReIR5TM4iEdRU+pYvwu1PES0goV4M
         aYsF/g0MrA46KiVCL3ixLrq9bc5PnzgbxmLaRyD+IlWuNMIncwCCdArVINh10+3TaNnT
         8y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170864; x=1721775664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBIc44ePzm+Ayf/98yNwj7sQekbnxNa9YFMUCHmbPMg=;
        b=eyFJ5czIvt4NN3X7PAV0XidLc24An/kmpQX+JMdMW7dBYES88+7BynhXGVx8Ct32wU
         VCsQUrF9oERVY99xJ2RBukne99ijG99H3RyG57tVUyusX3HHfuvOiJfN1bWI6wYcuTsx
         ZfKnWbVj5+8X16pe12ZTdhXFFF/ijDkkd5Z+ACvTphn0AgkI+00bDxs41uJm69fMgKwg
         yrVydyvzNtZY3AaFNn/2k72y4SrwZS6xxj38xTg9TF5jfPqsxLRBhJNcNp2wiwWhuFD7
         ++hXRN22/yzZocR7pHroP7iY18Ped+8AntGaH3Mcb9/9HtsLUpbXjN//EI2s6m3WStNd
         CFEA==
X-Gm-Message-State: AOJu0YwEYzMCcrQ+HKEwhtjJDhMUaNc4tUSAUNVVEuZZ4T6OIwbfqr2Z
	/u5ThNcI0eYThVyHhxOCXq5KfCwSFSpqPVziZ+J8yoZ1G8Ou67FKQoaSVw==
X-Google-Smtp-Source: AGHT+IFux9RiUw7s1OfnhrlqeBpanuJqJR3d2WwCIeKkFuzEgLySHiRtUVncKdQYLWuFGOhRqQ/a/w==
X-Received: by 2002:a17:90a:bf91:b0:2c9:63fb:d3ab with SMTP id 98e67ed59e1d1-2cb37e39a07mr4949078a91.22.1721170863747;
        Tue, 16 Jul 2024 16:01:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedbf71f1sm6956854a91.16.2024.07.16.16.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:01:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (max6639) Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:49 -0700
Message-Id: <20240716230050.2049534-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716230050.2049534-1-linux@roeck-us.net>
References: <20240716230050.2049534-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use multi-byte regmap operations where possible to reduce code size
and the need for mutex protection.

No functional changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6639.c | 40 ++++++++++------------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index f54720d3d2ce..e877a5520416 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -88,25 +88,16 @@ struct max6639_data {
 
 static int max6639_temp_read_input(struct device *dev, int channel, long *temp)
 {
+	u32 regs[2] = {MAX6639_REG_TEMP_EXT(channel), MAX6639_REG_TEMP(channel) };
 	struct max6639_data *data = dev_get_drvdata(dev);
-	unsigned int val;
+	u8 regvals[2];
 	int res;
 
-	/*
-	 * Lock isn't needed as MAX6639_REG_TEMP wpnt change for at least 250ms after reading
-	 * MAX6639_REG_TEMP_EXT
-	 */
-	res = regmap_read(data->regmap, MAX6639_REG_TEMP_EXT(channel), &val);
+	res = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
 	if (res < 0)
 		return res;
 
-	*temp = val >> 5;
-	res = regmap_read(data->regmap, MAX6639_REG_TEMP(channel), &val);
-	if (res < 0)
-		return res;
-
-	*temp |= val << 3;
-	*temp *= 125;
+	*temp = ((regvals[0] >> 5) | (regvals[1] << 3)) * 125;
 
 	return 0;
 }
@@ -290,8 +281,10 @@ static umode_t max6639_fan_is_visible(const void *_data, u32 attr, int channel)
 static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
 			    long *pwm_val)
 {
+	u32 regs[2] = { MAX6639_REG_FAN_CONFIG3(channel), MAX6639_REG_GCONFIG };
 	struct max6639_data *data = dev_get_drvdata(dev);
 	unsigned int val;
+	u8 regvals[2];
 	int res;
 	u8 i;
 
@@ -303,26 +296,13 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
 		*pwm_val = val * 255 / 120;
 		return 0;
 	case hwmon_pwm_freq:
-		mutex_lock(&data->update_lock);
-		res = regmap_read(data->regmap, MAX6639_REG_FAN_CONFIG3(channel), &val);
-		if (res < 0) {
-			mutex_unlock(&data->update_lock);
+		res = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
+		if (res < 0)
 			return res;
-		}
-		i = val & MAX6639_FAN_CONFIG3_FREQ_MASK;
-
-		res = regmap_read(data->regmap, MAX6639_REG_GCONFIG, &val);
-		if (res < 0) {
-			mutex_unlock(&data->update_lock);
-			return res;
-		}
-
-		if (val & MAX6639_GCONFIG_PWM_FREQ_HI)
+		i = regvals[0] & MAX6639_FAN_CONFIG3_FREQ_MASK;
+		if (regvals[1] & MAX6639_GCONFIG_PWM_FREQ_HI)
 			i |= 0x4;
-		i &= 0x7;
 		*pwm_val = freq_table[i];
-
-		mutex_unlock(&data->update_lock);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
-- 
2.39.2

