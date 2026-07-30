Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0533D6CDF
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447035; cv=none; b=FRYAlp8XcoFVEYl2E5Fnf8yNL0rP3XrUBYJy1AshRakSjmiKVcUM/Cp9C3s/jg9j3xRrkwEcvLhqU3R4OLZvt6fALvpkeYHkutJ/SUJrJbyiejHRhNbC7D1e1C/uAu8MBB8Y4GFp3KKf9YVDrz8DW0JI4PQrs1xq/bew6jk52U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447035; c=relaxed/simple;
	bh=rWZwf1SmZmy+I60NhIjL5+z4C+Nz7YTugxwvI3MpXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpWbDpncTXCM/AcxbTGAttlsEAzpKt9DRRc32A2SQvpS8s2J1BRkhd3p0uXNCWZLk22tjwQeUDVp2d9P7ukePyRRMANrNzlvjUUloWgU1MI0CDQsso3vbjAv5RZRMKt909JoObweSQlsPCe4Ul93QMfO8I7dRGWYu45QHsTeQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZ4AXi5X; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ4AXi5X"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso199260a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447033; x=1786051833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=MZ4AXi5XXq8zXMsnvQX3B3i45uMYB5KXu4ZcaBHprjjtucHo+LWLJFFohjCWg4aVyo
         +0pF/x4bmKEHBUEy5A+VLvXSRMb4FWYCwyCEtJ80VTpHzrN+cR4/U3ZvjCj7jWg6eD+z
         Rq8lTYWoDt7KKRSMslwc7MQip8W/jBl0YzbH6Ayr7m1JsnfuP6QLR54LKR7CTpIlan7g
         WkPcWfB3xrbZbyPLKKFq2H6OPH3S8GC0yjxTOIvroKLJXHwzmzPnRciSzXob1HE+3ki7
         GDqvzlIZo+5R5w5rqhQ9D/BRpBtZ1P/8GoRR1rsvNpUR9zX5yZ8Gs+iaWqfd6fZd9uyh
         Ke9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447033; x=1786051833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=eRm74uUv92N51pZ/EHtVRQjuzgKKvv45UR7SIn4Vpp6VmNbQR6DMN+M+bCvvFwOtwW
         NWKnvexa93Zool5Obqpde70Zh3+u8XAF66Tfev3fDCWasgnabJuPSD36PtPSHye+rdLg
         XLlRGoAyQjwxLxlJrGZlSvMNGadhUA/Mu0+IFksipjyBeG7ZN0fdry1/nlifpxjb040T
         58uWfY1oiYH8WVx6aOV3gEBwPNCEGuXXz8KRy4SlDoTYwyu9sx301dMYsZ4Ls0B7/L9V
         WWpRFMvH+nLgH0h18nSG8x1wGeGGxYVCAewvkpYySg8QDsHlnx/gQ+koHG0AA1pj5drP
         YHLA==
X-Gm-Message-State: AOJu0Yw5/WwZujLPi+IO0yBCLPD9vkLsfJxqXR70srs5VK7NY02QhHH3
	WaVFgRcEAZRns6v3ExEcF4/F2rKlJBHFsUkDaAqJvjXc9x9VQW6RqdLDz0gd7UGl
X-Gm-Gg: AR+sD11e/vKNngC1E/FvRLlFU7y5sfV8x9rJjvjNGN+TjX3H7WQwuc8GTINu8wnMH1r
	/ostHcrsSDw8finPW6kXIRMKIKFTJnhdmb4XDH/VCYb/PORoT3DJRB7OtHyTJqlisjPAxWs8aQk
	s7KOail6F81a8rmWp60m2Ca6uwDrZRlwvfcGztlHBf3TUz27qpRPD8CPjBTDmCOendRj5nlAeJA
	yPpoys6OCKX5VJBz04N/ZOO5ZYXYVdZW3U2GieX6urBJxX58EPpZLIFgLzsCKUU+UhmVpGQcnj5
	7ux9wp0BoLL0MSxGvMPr5dCZvtln3wvTXZAM73118fwRU4a2UG//QW943H+kRKnKmWEgwCpt7WK
	uAk/YSKJAf67gAYKj+amsZs95giVQR0oUDicLoHSExkm+ONyptu+kc+lmnm09WSKRjQIdk7D+LP
	OujXBIixB0XiQ1HjmGZYnpnuVYJ3RMuRzKOWQmp/CLfY5x7A51dvfi39xakC0GePbHYEc0Lh+IJ
	gLe
X-Received: by 2002:a17:90a:e705:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38f9c04cc35mr3804294a91.37.1785447033002;
        Thu, 30 Jul 2026 14:30:33 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm28584728eec.21.2026.07.30.14.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:30:30 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:29:57 -0300
Subject: [hwmon-next PATCH v5 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-adt7470_thermalzone-v5-2-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
In-Reply-To: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
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

