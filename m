Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F53C3F75
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 21:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236919; cv=none; b=nfitPcu9Qva/+t+kkEvafVjXoLkJhV8zo4Rpr0QEvXiNhzbSrWJOwaDqcyj7XP8vVA7PF2yb+4pvkYrS/Pv4mIAL/nD1h4HzKk0jc/yWZjfDruxixSm2XXjABxsTK22pyjM850RM3Gpw4tCKIXNotIb49DlAsp2zd+TO5SjQUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236919; c=relaxed/simple;
	bh=JD5Lp8KBOzUlFKcqEFqYNpeW9EwGOL+uYSqusXaqVIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rL8AsxHAm0qAX4uHgy3NpGcS4ilgMjtGRFHpwiyVgdXAwz/FY+JjT+vNNpVq80dpj1YNfdX4W+EFjuiYOJqxzwe9PUYmEnThaDVskkp3q26uDjhzViE7vLWrJqNlSAPUj2YwxjZGjwtR4pR4ASos9+HQaYHSzJhXZ7+s4F+abUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJB7aGiz; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJB7aGiz"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81e69a2db34so15932677b3.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236917; x=1784841717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLUXzNCOe0RCZXyD10EHKPfmRl2c/iE1pNVJYbsebOo=;
        b=NJB7aGiz8fKIl7h0n9uedQgm+0fobo9CG5WSWDq56vQkLe8EkBrh2KWGycGgDd8l64
         Ae4xAfw+OLvT8bDLZWvNxmmKbglTm2sWzUtBxWU4Ppd1jci8dS6/0w7PArhfx1KzMhvh
         +uemWOukNxi4J+pzX8tg6SC2xBC3/RwjF+AJzLaxzckFjPkwmxy54njRJ0xyyqs5ey/C
         /XQF9bB43XeYhfEKRh2AyR0+hoPC7RjEXr0yuuhtc+QdQqF0GC+paSzxZe+MYoZQDWWV
         z4qVf1NJK1gexAFw0biRLD/br4h8GtjfMyf4QhkMZHn3kv2U9Fkp9S1741eG/vwmHVnY
         Q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236917; x=1784841717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLUXzNCOe0RCZXyD10EHKPfmRl2c/iE1pNVJYbsebOo=;
        b=iKGGKRWgFAIV5WFjT2psQMJUVWD6T6munNh2QIeoVDyEHkgWAyZ3k0bCHVrW7znvrq
         FLO1YREvr2VDB9mBiofNTb+S9THwVuN8kMRpA7RnlOzE65J5Y2bNqoynRs+2VYWnO0h0
         gdcUIdbpQUznPKnufkPytkLrMRXCcJsJBM6W1H1tUSu3GOMqmJ4ubS6g+0BuyLcKrgip
         eON47KqtRiGaT78y5F8GGvV0vVIA76URfqAQ2aDl68eRgwX/mvRBiBnTw6JlHY2CmJea
         saSQ6O8cyW0WRIVBTv2InSd2eRgmSXORP2BywCvcFaek7YL36MvD39J6adFD19GOCCWm
         vb4g==
X-Gm-Message-State: AOJu0YzRqxGaGEjkUw3EIqxOo4zVfZh5lEoiyM2DE4/iuzuw7IzygYyy
	M2yfOcsLHAUdgN+bUziq38p4oVSABfE8f6+67VQVr5QIG3o14P6PXOiA
X-Gm-Gg: AfdE7cnCHwMc71a7vMmCrNdWU847hXo4L4KlssdtQqRz8y6d0oTOg4d8N7FDO6HLs49
	qQn7PoeCpNS2kbasH2dWxG3nmbPMM4NAYoWkfVxgSB5+41PiILLzND1lW+pvJvq0jXCnBTVSn4u
	LrjeIGNCK5DnOw3U0Xdwi+xM2sOJhfElKktu3jh5w1jzHGMEB/n2A8Jov0rsy/pOJkBkyx5YJ2f
	yu81JrGfYCmDixtgMX8NrV3yP15D2CeDfnT8edaVzCeJNttRLrvqIHHeMPiitUwnAjrlBRyQAUI
	mHlvBg24CS69E87WRwvzmsj3QiGAWlFo9jqQbziKuwBCAfRqIbGOf/HXaBkYRPRszti15ZTI6vU
	TXvySfO95MfJUA5m7sI7PFBorUV7z/sOLEZvGNe/xEC1rovXUuqw/MpgEYo0IgwwMqMG7zvX8Al
	qcgbiA/8U67JojQWsN
X-Received: by 2002:a05:690c:22c1:b0:81e:bbbf:7f6 with SMTP id 00721157ae682-81ecfa6bedbmr67424427b3.52.1784236917245;
        Thu, 16 Jul 2026 14:21:57 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:21:56 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 18:21:39 -0300
Subject: [PATCH 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-adt7470_thermalzone-v1-2-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Instead of a magic 255, use a macro to refer to it.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 664349756dc2..4ac292cd7f47 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -100,6 +100,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_FAN_MAX(x)	(ADT7470_REG_FAN_MAX_BASE_ADDR + ((x) * 2))
 
 #define ADT7470_PWM_COUNT	4
+#define ADT7470_PWM_MAX		255
 #define ADT7470_REG_PWM(x)	(ADT7470_REG_PWM_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MAX(x)	(ADT7470_REG_PWM_MAX_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MIN(x)	(ADT7470_REG_PWM_MIN_BASE_ADDR + (x))
@@ -811,7 +812,7 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 
 	switch (attr) {
 	case hwmon_pwm_input:
-		val = clamp_val(val, 0, 255);
+		val = clamp_val(val, 0, ADT7470_PWM_MAX);
 		mutex_lock(&data->lock);
 		data->pwm[channel] = val;
 		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
@@ -869,7 +870,7 @@ static ssize_t pwm_max_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_max[attr->index] = temp;
@@ -904,7 +905,7 @@ static ssize_t pwm_min_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_min[attr->index] = temp;

-- 
2.55.0

