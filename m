Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C230EF68
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 03:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208054; cv=none; b=N24g2SihaJ6SIEMN7DegazBA95kWi9W7yiSUuQrNR1j6WKdlRHG3nN9RxFt5+cdzsRg6JeyGSGSEwh2pFC22xVyE9/oKI7ND4+w1YR7ViuWzkqi8UN5MSyR23LjR0iFd2QXQBO+T/xQzR2Q5LTHx7wrlKDLwcvMUrCc4CbQZNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208054; c=relaxed/simple;
	bh=rWZwf1SmZmy+I60NhIjL5+z4C+Nz7YTugxwvI3MpXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVfyVIM4fEjNf0ofR4WmEmlt676f645fXp5l+RsSo2s59GXq/mJfTjE65iEA5MENzla2RwcJpbJqXudDQxIgGZjjb/TLVtq2vAmlkJITXdnInpkwvvAQysYMCjnmnVHUHPhJ0oeqszh8DXzZqKePZRFZ3KFicxaSHV1n60JUQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSFj5MFh; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSFj5MFh"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso1853965e0c.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785208052; x=1785812852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=NSFj5MFhXUC2HyIcXEtaJ8lgvXUzqezQNYRr4yEuJVk5M/4IwVpZT9hGivAKBWEMKB
         JVVEcIUqW+2uAsv9tBQBnUjrVjI9uQxQY4YYEjTsteWRSD9JsuqmhobHWMwsXdhiliQZ
         Ftee0S3jpIFL1dZ4Zxj/+WYiT+1hYTGZLxnIqdXrIRoBjMIrjbqVv/40lQvgtEiIXJ8o
         MYwXB/+dZI0JCSVuMY+KcoWXeTOETpmfjlTSn52tX7HD6t9Wz1W0d+QoC3h45y/EcYj5
         IUViDamIpbUm3veWey/xdhH7g3DwWyYNlpX4c7iSrjEWxaEW7xlFgIfyHyaESXPxzKT6
         PMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785208052; x=1785812852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=pTvnkp761qJOMLdRfxRAOk0R5a2kfSwn0EBxvsxE0EOzFJXhowzsW/99w5dM274pyM
         IXJI9b9uVuXRrWF/YmwNXXC2NFGGeYhpngxKqwirCzw6vSdfQDxdo7Wp8/dzzcEkrUsX
         P4a/+7ME8S83YAdNC9H6StTCy5V6eY8SqTh43cKcPyZaWenQ1e8D85769AmSyntOOOeY
         zkx23e03+8U0ItUZNr29R2gfPToxqHe6yhxttTE89AaDld4dj/cl/MBU/5IO+WPm7dRb
         YKkI8cj7CFkq6swPY16B7uTR0Qea9WxmMBSlDa4Lv4Knp4NR7VvYvdTYR1uL1QI4nJrW
         BvKQ==
X-Gm-Message-State: AOJu0YzHXpkEkLi9M+OFhU0sWZT7j5SXnpfycPQHPYG71Ui3v6LdoDFH
	Rm6UN/t9hNKiQTViXAzDb8pe73RxET5WQTpzAGyxHTMUys0DZooCUzIP
X-Gm-Gg: AR+sD10kYyr9aU4VCU2UNYDl3PgvD6UlEIK1aH+RfHbIGx8/vsvnTfsPf/iARH/fjYX
	T0jmZZynOH2GVTHMfphr2Y6/YBopqWzVc/wzavW7ynppVBsJQ4TtqX/t2Yx6Rd3eyM7qOHnDsIw
	nyvZ44sQbbE/U4QimG5j20dv8/SxjI/Nf5XCDnihtZiUr33AEFb6KPnHorS2og8Fj5U+ZloqfNU
	6qM1QxnAQW1/0x0mneogCmI+hm6+vTWIrxH+vHMpMVHDpCNDw62qfJZ1EAJXRnGv9SKuqp+r9XS
	l+2I/kR8KpILIHTXSIaxrUo4UAh8Nho0ukmFgaQ2UTNIKJxZ7O5cUjUAkNHwA62cfboSiF0stzQ
	nrfG2B7d+FCG/C7G/KvFx/qHadlBEN+fWaF+p1DYM6jXUOyUQTicCbZmwY10dEVwNrIU7RJKf/R
	smoorKnOFhNjHwBiv2yw==
X-Received: by 2002:a05:6122:328e:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5c33f89b5d8mr301894e0c.2.1785208051755;
        Mon, 27 Jul 2026 20:07:31 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305759d35sm8148812e0c.18.2026.07.27.20.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 20:07:30 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 28 Jul 2026 00:07:10 -0300
Subject: [hwmon-next PATCH v3 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adt7470_thermalzone-v3-2-d4586478cdba@gmail.com>
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
In-Reply-To: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
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

