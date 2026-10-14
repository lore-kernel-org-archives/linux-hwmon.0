Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CFB568544
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999275; cv=none; b=BlKf7d02K6q+bjZNqBT7RuXyOJqHf+hFqvqPKu8L4tu6ffX0vD4M/L+MB5GKfbXIsNnXIM05QdUtQQfKE8g1chfsNM3ELH9otQYRGmifd7wjVRyAJ5ABD1FyTAdJ1NoyOZev2XCaP0ZRicgGjxUDZPw/usbw+vWdBVBoNIC2s7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999275; c=relaxed/simple;
	bh=Ykf+THWd+wwdgtBisDTMGKg7qHYCcw/sjql5oejhnnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZVR3RthXB1Dq3BmfDqTsJUYa1CVb6zdMgdziLRrg2MH+D4hSlywfnbwbaUrVnZR6BPwNEF6b/wUVrqy1Ih6m6/uIxqZsfXXxvzT7NNSf0ET/ku5c3LXFD60knWWym+bHdqtjHVPGNZN9nkGlDVYMX6xx4vNrFdDteNP7U7OLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy+oW7hU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy+oW7hU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso739756866b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999267; x=1792604067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmwpXY0pkazAyjk8nr8JLuf2WFindAFqPQA6knsCB1s=;
        b=Dy+oW7hUiHgBkmmHY0E6bAR6VFqDJ6JOveMyBQg3XTZX2fd2rHbknSS1Gl53z+BRCn
         AXVt7DX9eZ5nC07nO1IyOPlYedkqvsEsAXsFdYtsmA3hjSGZ1iFFIbnTLpw9SD8NRpiw
         uCKOdlE07drXqKVe3fcDpb8vh/nGS+2YHQjQwq1+EN44FU7iGkVrXYUwv0IjF3dG6n9T
         Fnhkhu5ttdQ747V6MZZLUJc9joFvSd9agHgONB81p+RFrnrMfjt4kdL3OIbE4eEYNl+t
         PMykS8+CaYrgMwa5gyaNg2AnJt6jgrdcFe+DUVyhbLAr5pbeq6xI0iTXdjUadDNzEO9P
         U3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999267; x=1792604067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmwpXY0pkazAyjk8nr8JLuf2WFindAFqPQA6knsCB1s=;
        b=hGHwouuq7hABNDjsSe+2W8cbfB8hQ+r+pwE7DbTUhqPTpDxgBz5m2vuObN0W3eAQwC
         D5107iFPlLopjzdwHgmAFUV11zrERjh3VfZy6ZIKch8VrQ/yoABhiyZ7gkvnIHNad0wY
         EdpSCKtmnvEjWF7qu7zjPemKD6pdJBURZ0VS+aKsxoHSlzaJWl9T9lAPvSXQ+avmWSIL
         BHA8PFvi35U9U5iyjc3mNkwqFoNaiC3Y9eUbN6W9cO1sGqOUgpt+litJ9zr5UNcr65AH
         YkpWquj1yTZEsFwPnjrzmFpuRRDlVNIWC3EJR2MEtdOP2AwX59BEWa/NkT/n+k/AcTiY
         B2qg==
X-Gm-Message-State: AFq9FYKjFQrA24VuzVH+e10pW7J6iT/DeNmaszghTPsSa8/uBMvcMrcb
	aP1Bln/+eczS95d+vnSpMst4aPIN0xPCexkxaqCv0XqdbmD7I7n2KFIUdsht6jGC
X-Gm-Gg: AYBFou1KPJn15/2mE283PnBAwppBPJ/XoKXuoXgRe2lYT7eVRHyqYcIqwYEjOO5vt5+
	iu9gM1U4eqL1NJDwD5Jyj4K4u58vcr8YLLtQxyh9HNIYxIU8Q834GTctN+LuoKttWrmFQ9BXBui
	nSl/8pdSWEtB0c2+cK3vygHf7H1pKF3L8utSLJkqtJ6JuyvpbZsy90lesYf07X3Y1fVEHTItnGW
	iPfOSCJ7okf5oXy92x3lEME/INkQLTsbn+RzYZTl8VFTtia8469uUFn1JR9F6y9vv93fngqPST1
	8WUVlg42srmvyDdrMkSftMuDd4QjbSgcwF69rZEujKf695gQxFXsh1Uwl3pWdgM1V8r6CzaF91F
	RueHZ3MTVfRH8ZT3ujpO63VzFn+q5RPpGGY8x0j0YHlsMJBf9dPxFKUUaMFKLm07S6xqPGPLJZg
	OSL7ssCRPseEVMN46vEy9IHgPsRMVthxpr3KMuO5vtqgh4Xju+KfkScbU9dY1ft/sbs/Jv6RVPX
	BZtzXyvhh76Ipk2/u+aN4/Wb/A=
X-Received: by 2002:a17:906:100c:10b0:c33:cc6e:1058 with SMTP id a640c23a62f3a-c33cc7d5811mr649024866b.24.1791999267535;
        Wed, 14 Oct 2026 10:34:27 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:08 +0200
Subject: [PATCH v3 09/11] hwmon: chipcap2: do not discard pending alarms on
 disable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-9-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1461;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=Ykf+THWd+wwdgtBisDTMGKg7qHYCcw/sjql5oejhnnE=;
 b=rPohMS7f4C8gD/qGD/7EKwN795k5pUHWIqrYc1aW14it7pL9S5jKSjA1/029RW2pOCBWJFZH5
 jqTPS3H0+PgD0hpdiVMFcLt8mmKQaou2RK3O1xMX4E3P5QfMn1R/kJh
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

cc2_disable() stops processing interrupts before the device is powered
down to ignore the alarms caused by voltage toggling. The handler of an
alarm raised by the last measurement might not have run at that point,
and the alarm is discarded when it finally does.

The sysfs read that triggered the measurement can then report no alarm
although the device raised one.

Wait for the alarm handlers that have already been raised before the
interrupt processing is stopped. This covers the case where the handler
thread has not been scheduled yet; an alarm that has not reached the
interrupt core at that point is discarded.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 952789fdb9db..eba6469940ab 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -146,6 +146,13 @@ static void cc2_disable(struct cc2_data *data)
 {
 	int err;
 
+	/* let the alarms already raised by the last measurement be processed */
+	if (data->irq_low > 0)
+		synchronize_irq(data->irq_low);
+
+	if (data->irq_high > 0)
+		synchronize_irq(data->irq_high);
+
 	/* ignore alarms triggered by voltage toggling when powering up */
 	data->process_irqs = false;
 

-- 
2.43.0

