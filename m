Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5494C2FFF8E
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455538; cv=none; b=Gjo6lHIxH/dTo7HcvFokMq18eOLgHzTn8f/vi2Th10OHlZq/rs8jkWbtjQlNuFzK6v7fKIEkRlT6RmX+eaSgwh6bTXvSwU7rlUkvXmJY8OmAEADxvSMbfUMAvukvJzxuwOfC/9PyFlBW8xyIcKDyuK4xsM0trwYyznGgGJLIQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455538; c=relaxed/simple;
	bh=wWTIs+Olqj6sl/p6i6C52CQmbANTV3wqR4WCNu0L2R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9fj3Q8YqYHIDneQh4XV7g/8g8tKNUURjkdeuA9U6F40et9Q5JPmZhEdrWn+8s5o9NRx3evbMVr/8dOZ1y348PHtEHK4T/Pi8ZllYYvOqMtWoZ+dHotvCEi+lfxThYj1uRyHYWSJWTguBAhJKgIi7kHSENz+BpyY8ULowTjVrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd3gQasr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd3gQasr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7835321bc98so5264492b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455536; x=1761060336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpsweppLJWzhkZ2vK457JR6nslnxX8Hrojtgis4qNh0=;
        b=Kd3gQasrK785fip+Xp8It5p4ZHRaHlVnKFJEPZZaTJlj5yziqgMT2/sO7avv78rFSr
         chlB/WLz6OZg9FbeQPosyMVuXaQV+cMtyxNLsCc+gX1k5EidKGnYfBiC9h1T3aeMmurs
         u0hwRQ6bq11AaRG5I2oM0hZNPDA1V2B43TPAORy2Zn4bw+glAxM7oo4+uyKrIHHMLLgs
         81K9Vgjv+lQRpoIMtzMoJgqBJRFjnaDUYmqb4OJiD3932+RoY9h9yTXNoyQh0DfF9ABA
         klSwLn8gmgTBKUJ2yEa2Qvo4A4zxgKDyFAbgz3x9dHk2IV2t9cxYyhT0wtRE+DnCf+ke
         +rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455536; x=1761060336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpsweppLJWzhkZ2vK457JR6nslnxX8Hrojtgis4qNh0=;
        b=R1HmidGuii8A5iPYRqzYCspTOuk79U+4oswQUVrCRPnbyqAAGs5EIfUw+eScNwKN2U
         G6WbZD/3tZ4ZepJLmIVA/FCwpv1i1ky8/0chpKFHAHbxCcUU0wWaN3Aur15SKYUGR0rC
         q/t+1y2Ri61fJuta7LTnnzJYRNwdy8zLfq/lvy9MfxkVtMRvDD2uZBbxLVRj0KQ9pHxr
         C83ZdI3t+NQ5FD9eDD50jJA2gtxyV6Y4Xs9XUwUkz90SrdZtdwnXHxQv85Lc5JNWMmbv
         rAMaq7KDYvvF4S0ZtDWvbg7MMY5dSRWHkaMympGvYcSP+/jjPzsiT9d3HWCok/tXhAry
         Cvxg==
X-Gm-Message-State: AOJu0Yz6TkUeRwDCwt95wrSlg32MQv2qwlunfSBOyZextq/xNtAPyXPc
	vqci+2SwyZ7A6t5C3iDeOVjsNnfmeh8/BanyxRNqXbvO7fjzVCbRdnxgMH041g==
X-Gm-Gg: ASbGnctcie4itynSZFyBdi49YqDHiZ5+A4JSLy5vYgc9W+Tw21l2QPUMSmMa9eQa55r
	fYyG1ZY3ZDJgNrx+bRLcz12yy9DEDSrqa8I/SqJxjwcyIgyHZ2PWH4Z4yOlYwMfDBfbzYVcMELI
	1TBMl8gHG/cGFMqKppJyeqpneo2bLOi0OUFXY3zc4JpLyRr0wq5ZshZMhi5JYd2uunRfgLW0kpU
	gWAn6vLHRdkQejYrnRLG/k9m8GhzI0npXncSsw8gd/qFMKKI0Mr5ISiGdVgImpqmtsWebm+qgi5
	+wah89eVyHwtzU2VFAUioDvCSP2uWMGp3T6q2DfdwwRINCZNv8PNg6fN6IwwSzq7vMlPo69iOml
	0gfrSu76cetSiYsFbeoeAeYHEwMkVXRJT8FkdT7NAFvmB9cSMLQDR0g==
X-Google-Smtp-Source: AGHT+IGPXwgUB+q+LRGH6o5DSwROaK9YMu+jzeNnhrp8PKPJzKA4obrmBBBDQfQKz6HFovc16XgMlw==
X-Received: by 2002:a05:6a00:3d52:b0:781:1a9f:aee7 with SMTP id d2e1a72fcca58-79385709970mr29728856b3a.2.1760455536180;
        Tue, 14 Oct 2025 08:25:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06076asm15621813b3a.4.2025.10.14.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/20] hwmon: (lm95245) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:07 -0700
Message-ID: <20251014152515.785203-13-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95245.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index 3bdc30530847..9ed300c6b5f7 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -13,7 +13,6 @@
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -86,7 +85,6 @@ static const unsigned short normal_i2c[] = {
 /* Client data (each client gets its own) */
 struct lm95245_data {
 	struct regmap *regmap;
-	struct mutex update_lock;
 	int interval;	/* in msecs */
 };
 
@@ -279,20 +277,16 @@ static int lm95245_write_temp(struct device *dev, u32 attr, int channel,
 		ret = regmap_write(regmap, reg, val);
 		return ret;
 	case hwmon_temp_crit_hyst:
-		mutex_lock(&data->update_lock);
 		ret = regmap_read(regmap, LM95245_REG_RW_LOCAL_OS_TCRIT_LIMIT,
 				  &regval);
-		if (ret < 0) {
-			mutex_unlock(&data->update_lock);
+		if (ret < 0)
 			return ret;
-		}
 		/* Clamp to reasonable range to prevent overflow */
 		val = clamp_val(val, -1000000, 1000000);
 		val = regval - val / 1000;
 		val = clamp_val(val, 0, 31);
 		ret = regmap_write(regmap, LM95245_REG_RW_COMMON_HYSTERESIS,
 				   val);
-		mutex_unlock(&data->update_lock);
 		return ret;
 	case hwmon_temp_offset:
 		val = clamp_val(val, -128000, 127875);
@@ -332,14 +326,10 @@ static int lm95245_write_chip(struct device *dev, u32 attr, int channel,
 			      long val)
 {
 	struct lm95245_data *data = dev_get_drvdata(dev);
-	int ret;
 
 	switch (attr) {
 	case hwmon_chip_update_interval:
-		mutex_lock(&data->update_lock);
-		ret = lm95245_set_conversion_rate(data, val);
-		mutex_unlock(&data->update_lock);
-		return ret;
+		return lm95245_set_conversion_rate(data, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -542,8 +532,6 @@ static int lm95245_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	mutex_init(&data->update_lock);
-
 	/* Initialize the LM95245 chip */
 	ret = lm95245_init_client(data);
 	if (ret < 0)
-- 
2.45.2

