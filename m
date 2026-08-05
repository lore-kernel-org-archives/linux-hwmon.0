Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6395471263
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935750; cv=none; b=DPNhu2WPl635YtHszTqsT2thwPHuA14JI3liVNgTZsAoOI//xJ0yV/9nWbXHJVriAYflqFnpyt8YUO6ByOXsvJdHtqreOa9IZrC8E40pMyBylUsD1/qQWA3sVhxph4thd4XYGkhRST64+CLFTB69u/96f9mCZ9DSijDtqMCmY9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935750; c=relaxed/simple;
	bh=rWZwf1SmZmy+I60NhIjL5+z4C+Nz7YTugxwvI3MpXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CC3GieE3dDK/SoMlmRjITW3pg/pLhLmouwbGOJ13OHRpcH1z6eP1CyGCd2/Kz7QxNsUZbTM0wTtRO9SLrbzKlUxApEbm2/P5mDeyYAiWojeP/d5FQyWlbD7zkL21aBYnv4yeYLrt9JEOefby1HrA8JhZ5IkGzfFMOjm9jrTilIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+ZB/KGc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+ZB/KGc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so794510a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935748; x=1786540548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=V+ZB/KGcCtaDUhzGKcko0RPPEFoX1wQ+iAPr9VHD24Pi8+mygCZl+EK+U76uF3m89f
         RkuNWEDL5OepG2kZ2iw0dktkc/1AIrAMJpP8I9v2R3AcLvIBcBNS86jLdzHezf4I6Gk8
         gsA29QMrI/9dPoRtg1sUPW/hUEnDo03iwPm+ILMw8GaUGJEMXLa3V3AgGjUHvEtRXLpw
         AI+VdWfy78O4XiLp5AdV0CuUOvuprABCfMVucW3Yv2emsBvnXMCz4nx9du0V9q0WdO//
         YxFfGOdOVH94MbAY0EgFWaG/JFJSNxLxBLat+mt7FakWDP+icgKO5l2K4xQbpjRDVgm5
         v5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935748; x=1786540548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=k8FRZnoj1nTvbRCxIHu/DGRt1p8j/uO3KBVm712o3YjR8l+9pqp3NC/CkkXKqEcAzd
         VVGWI1v2JfPLyveguF+xvLnpOyW3Q/I+AUiw/HLmW5gerUGDvZuXK5t5CvgW+MHMmlZW
         6oQeSdMBGtUd6gnYJsX1fNXrEUmNZqS/r6N9XexZRrYKb6Ay4oMMhhKiMtF7vOTLNWNH
         29WVGBpZN8S3uLd7nKcThXLTmVzHplo+HPTQz6KRa6fG05ssJdEXWg0UUfGwagKOJ6ls
         PTrg+LlUZw86M7QmQfpHUm/+ZvElOSgK3B6ouRn+mVS2GPyAPvzgQpdvXvliL/Gh+kXN
         neiA==
X-Gm-Message-State: AOJu0Ywv77xVYhTxi4P7j/u631Cc6SnflCX1dnpw84Mv9acoU66hcpxB
	9uDeXToWoYjkoHAwDFpHQlJPxWfLF2ABOba3QlzcS2ml+EhQLIswB01g
X-Gm-Gg: AR+sD13FX3tyNITM2gTRoZKJcdDz06LxEGo1P7atnTVkQEW8fiJLhtJhi/ZMYgVgI5d
	Q/1dZ94He/1bSLdaCSkRXMeGcDa3bqSTNX8SeBMNKB5Og9UcvXu46JYZOdPL/LspoWntR48bW5b
	GORd54j//mqFPdTjh2iogxODeaOlybMennxllj8vcHXu5i2GyjZF1laoQNRbWH3SdH/QQ6L6v5B
	7BLk5idgyUx5lQ5zDob2t5JjRo3g/S+6IWtEZH43yUQ+S0MW6x42D1Si+I65k1hbLTadrRFskjD
	wyyG0yTp88RUHxAwjSEeRNELZK7JTO9eiRRE+hOrAqBWxyxVlVbFKhrXCn4909bQvOAqprqaVCb
	e3tOfZc+7LnKZG4j18avm2b5/o3Q0jKu7Uw4sbpCcdfGBsOUKTd8oeNb04w+CsCiVXe+/PuJrSu
	BVZTjNJZNh6yn5pLxrLOhE1MFbb3o5dEzV5YvbjgmGOf3R/Hre7VLSYz7OPOLkhhA79oR13LsF
X-Received: by 2002:a17:90b:3812:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3903c592834mr6034525a91.11.1785935747648;
        Wed, 05 Aug 2026 06:15:47 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:45 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:18 -0300
Subject: [hwmon-next PATCH v6 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
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
index c45b984c02e6..87ddd7b8ddae 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -100,6 +100,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_FAN_MAX(x)	(ADT7470_REG_FAN_MAX_BASE_ADDR + ((x) * 2))
 
 #define ADT7470_PWM_COUNT	4
+#define ADT7470_PWM_MAX		255
 #define ADT7470_REG_PWM(x)	(ADT7470_REG_PWM_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MAX(x)	(ADT7470_REG_PWM_MAX_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MIN(x)	(ADT7470_REG_PWM_MIN_BASE_ADDR + (x))
@@ -850,7 +851,7 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 
 	switch (attr) {
 	case hwmon_pwm_input:
-		val = clamp_val(val, 0, 255);
+		val = clamp_val(val, 0, ADT7470_PWM_MAX);
 		mutex_lock(&data->lock);
 		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
 				   val);
@@ -910,7 +911,7 @@ static ssize_t pwm_max_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_max[attr->index] = temp;
@@ -945,7 +946,7 @@ static ssize_t pwm_min_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_min[attr->index] = temp;

-- 
2.55.0

