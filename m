Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36E384CCA
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321993; cv=none; b=C2L7krTLBTwW3Tm71FtiQQlRqwLE+6rUBkc4sHtFqjgJFE3Q04Kxu1YjQv7Gf3mQw6PudsUX4AexrgVOQCbNQCxGlBHYmTe6F5YhVjTJemqkUuqjpk4VfDA5/0J3C3RGQyMclHr4xLKjG60otU9Y6/13kMTkTVKDR3Ecn1H2IYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321993; c=relaxed/simple;
	bh=fnVgoboZr5j9JDLEgQ4eEddGgsOOhWK2bjedrn78jJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hnpx951HhKtFecXnJ9yRP41NplkfaRHSj5J5NeFlwNvCKgsvFQGHmd2be4zQd+UxF2ITVm/XgYl0jYjuKyM6OgFu800JA+Il6IJfAa5R82BRxHu9zYCJJWVLnKeqBfA6WQwD8p+oq/D5Ge7ocvo6uluhFoWsRzOcOPfkJSPIEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeBM+QjU; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeBM+QjU"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81eaf3709b4so59571527b3.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321990; x=1784926790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtAAUJ2YREqt6a8rhFME7soHPuDVoeI++mttqZ0tqsE=;
        b=FeBM+QjU/wUftkYjyo/uskNxGxckRqu/m7ZWYXcAgKD5ZA8xsjQNAL74/Nkvh0Rb10
         SsxsZQf/EF9CD4F2TxOxz9aM+KCBuw+PDPMUleWLc2dJ8c45k0soCIOkltgR4FsvaWJK
         /4Zpd7J/EcR/iHsdeIDkXZQA5ig3VdLyidAr/Og91NvtwPTFFniARZ2QYYkXw0Hg2fS9
         FKqZ4CMlWGC4srWn+RFpkhKsv/cP8dQzWMk9r3IgaM8w9NgGcK9USoDsv1eRgBe9TP9C
         +M7EbXRgMMV+EhpCy0noP0V72hMKHcC49AnIc8xzr2FRw8LXJ7k+Yp8SsrqP7OMBfzsI
         mIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321990; x=1784926790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtAAUJ2YREqt6a8rhFME7soHPuDVoeI++mttqZ0tqsE=;
        b=W+/Nxz7YjH0UcqUC/WqF3qVUkzduV8BFT3CJMdApiSlUtKqp4ijaNBlg8OeMewQqhu
         zCXcq8pgWB5idFDg5gA/BEUPHxvbVzjyZ1wC9KCDwGSj8kMq/JIxCtUZDCDFWcHeNg+i
         KyVcdsWYZY3P09+1gcU5lyBIAw3gF+pk81J2MSc4nwofJx8lNvQVouERFpoTtDH42+DM
         KCFZwsWSrOrfEEfwfcRgHSSh8GcU8FbzFhIFv7EG5vwJxRbwJsCoS9b7IlFjFch/axvQ
         OcFsTfl+OYYXdlfO6k8rmO1PwF+518jksoSAC8CgYTIXzzz+mpn2PdosETUBWq8ca4v1
         eoPQ==
X-Gm-Message-State: AOJu0YzLVr6bvRRbnvdmp98hLSRsTy12O3EIPekWoa1fU9csd8ulO4oI
	RZ0GWPgD8hJoXTbSVxpnjSRXi6CjzoIllUvL7yulM2gkwpY70aIERmRU
X-Gm-Gg: AfdE7ckgpGf0gRxSu4hpRH/eupaHrQL6ilVSaVqrLR61BmzXjwAnB+1V43hTP7u7dll
	y9agIEqdk4YfU5ynYyovsivSj4ddlKsFFM2NLvHPqROA0OqYkvVeOhgBBi6bNd6tshdw3ICMscU
	uXKvx9YgfWjhLcNqWHab/q5d13aeVWQ5PGzqCYHMWJ5CcxVCEIGtwOnJ9Jk5przp4ox1f3KH9+y
	ltIZ9Yd96IqjBrarfpr+FXz4n1yq5VpbYJwOC0HcKwWX4Pa7I7tDtW7orEXiYMm+XyrWckUhayA
	Y36XR0MwEb8xT1qniReVKr0g7XvmZ94TfuVS61dD19knXiwzHaaCarIIgCeohTwjUYdg+Y+O+dM
	i/Dkw6ivix/ts1cPi4uA68LoplWyNxOFUYJGRTws4VpBtXBeU6kwbZ1BClfjgJrko/m6dIq9Pgw
	Yt6fuXZZ/iZzUsqqRx
X-Received: by 2002:a05:690c:7244:b0:80a:9f1a:d48f with SMTP id 00721157ae682-81ef283dacfmr14086577b3.54.1784321990187;
        Fri, 17 Jul 2026 13:59:50 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef3e6656dsm20013647b3.0.2026.07.17.13.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:59:49 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 17 Jul 2026 17:59:17 -0300
Subject: [PATCH v2 4/6] hwmon: (adt7470) Add ADT7470_PWM_MAX macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-adt7470_thermalzone-v2-4-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
In-Reply-To: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Instead of a magic 255, use a macro to refer to it.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 77e7be692790..d881609c99aa 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -100,6 +100,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_FAN_MAX(x)	(ADT7470_REG_FAN_MAX_BASE_ADDR + ((x) * 2))
 
 #define ADT7470_PWM_COUNT	4
+#define ADT7470_PWM_MAX		255
 #define ADT7470_REG_PWM(x)	(ADT7470_REG_PWM_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MAX(x)	(ADT7470_REG_PWM_MAX_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MIN(x)	(ADT7470_REG_PWM_MIN_BASE_ADDR + (x))
@@ -829,7 +830,7 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 
 	switch (attr) {
 	case hwmon_pwm_input:
-		val = clamp_val(val, 0, 255);
+		val = clamp_val(val, 0, ADT7470_PWM_MAX);
 		mutex_lock(&data->lock);
 		data->pwm[channel] = val;
 		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
@@ -887,7 +888,7 @@ static ssize_t pwm_max_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_max[attr->index] = temp;
@@ -922,7 +923,7 @@ static ssize_t pwm_min_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_min[attr->index] = temp;

-- 
2.55.0

