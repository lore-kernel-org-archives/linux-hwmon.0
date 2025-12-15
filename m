Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF6329E79
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791538; cv=none; b=q2TbexgIrCXbOrJikih5ePnzvxRpNXQx1x0DI6Vi4o84+xnAUFB7I7OhjJUuj0uP3DnXs3vPgCO9xwR5aW2SMbyntLMyfqQ7hJz++k5wI+Fzr9PlWcKs5i8UZn/LmHb0f/kUySCuNB+eTZBPzkKdhEwKMgk1iZ2TjVYy/SG7Tz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791538; c=relaxed/simple;
	bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWZT+XjTsV1OcnHAEc45Q9FmgNRCknWjulz+gVg79Ezwn2Ih01811WQNtLRrsxGhHXhtkozShKSajisy4PITx6tChu6EnzhgrQw00U7CQ/tT5BENPAlecVo4BQsXdUbvqUurIGMCfu/piy41PWHhP2Qagyp5JilxTBGLN6AkqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjkvHY0X; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjkvHY0X"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09757004cso19544835ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791536; x=1766396336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=UjkvHY0Xq0UJy73I/OqNKpoBSQdfFQq4EqazPhDCvXTFAZv6dXFPgoZ7LizwceY3c4
         nOAcliXa6uoVCLHLEFuzqRNfgpDPG8Ha39dKcYpWxQa0StnCCvmPUUJSmSwGO1oFAgvH
         /RTKri5+BrUcs8ZS6rDZpfhg3GaPiNmQM+jdcabWogNkq1iiuQlFhCBzIKYM7y78CcB+
         1pcj8QvNyOXcebiflMSfvNKtI30AcIvyIW03yPFYi++xHj8ZZaGUqpGIK+WMfa2wg4K5
         8vGFkXxARywAmmovJ1legc+uCwA2nLWrReziRO+93oMUoO/zyS+0/wHyQ3tZhcVghsFz
         t2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791536; x=1766396336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=j9noh6pYEyTkMyzXdAto10BIsUJAMwoMa1qxtHiKbLJsyFVtBUWAcGjtCSl1C6zJle
         jM9fObyECLmPY0XlVi6DZWOJwiuFpwhHmvLly0PmxQrlKQ/n81t+iqKtOYr/WeXtdwpc
         c8lqTv+SKdrU8I6FhqlMq7rg27fLyeoit236rUYxE6INn2yTmcWjBjLC3+7y+ecN+t5Z
         FGI8sHdhLE1oRSmYLRAu/DgSiqc7rt8eUbZk1K2sWWPOWkIoR3WVNG3g7FQBd6hxoMgp
         sX5dmVptY2Dq+HRFpjA2f0k9z8DTJO6x2CN10PTRcsH6PE4g81ZhyBAiUQTCWmxEvj1u
         /xXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI7qvdtTCjXuWQqhEt/NEo0Cz19b3V2HDNeeukaNAl8cNHyLdEdzO06MebVAjApxsIQJnmtCFIWqoTzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjAnIdrJlXAA6Vvi7K8MNH0Y4J5a8RLygF8wJAj75SuPwvF0Oz
	JndnK1ojgTP561CQIaw0MKXdYsjbjGt+AVVuZg4FrAWt4PCOgBW300tv
X-Gm-Gg: AY/fxX4fE6pdPEzwEq+/X0QJDNarT38RoS2scmhLf0ASqq8X9YPuDtgpRAnJGLFkeQ2
	4gkf4GjGiY+j2yqcZzhqwPqiirhuRb6FDPqDvgef9TGBEVKdgywhjU4dqPyDjBuESbHK3SNLpM9
	FPcG8XrcXmwc5DuR6p+IgNCRyE3vP7yuyZCu8UgzaP6FnMY5kecU+N4Gt5fHxdYZKXX/qgo6HwV
	IWg3xUPCQrp9VVHdjoxInzsxtKmyf2H+VKIYT6v5gjhv2s0ZgjI6fCH2IQxWBd7es3IZ80cr4lD
	J4D4VxTQ0dkUn6tQJsvFSLVquxX5IZGfSLjr6PZ75QhP6siIEm3R8+3/3j3LmrJfQT6F4VGqT0j
	PCSABGFqeb9ayeVgmcyJVqFh5RWTsE2LTGX3DJWcnYlPKrSbeejaL5UvkVGsQeS9AfNo8DeqoW/
	9jFBHYJ5lFf5nauthQuYNvG5Wgb+ni0l6mWnLw9yjwJSm8JHQu87fkRYMoCUzov9lVR2F9oG67F
	GrCbAYzih5lJYhV+1xNjPxsenPfsgEY0+CHBL9AQkeWUWZx0WQd1uglkp6YEWyEVK2iqglKtx+6
	hPoTioFb5/KC1ljV5kR09MfIWEeCaRMFvK5oqFZ/4aiaUT7AevI=
X-Google-Smtp-Source: AGHT+IE7R5Rq59mcZglu2dMbSmwzQA0DuoEDw9ET7Cf1MleDlYYipJlEUwm/OuRe6KJQVxXlQvBRNA==
X-Received: by 2002:a17:902:f70e:b0:2a0:97be:61a9 with SMTP id d9443c01a7336-2a097be6574mr64303105ad.35.1765791535968;
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:49 +1000
Subject: [PATCH v6 5/7] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-5-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215ktRXclLcr81bZJ/cztR0mm1/JFf93fenKz6+6l8
 py6fnM3dExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6uJGR4amuWV/mXtO6mp0XihoUH5fHRSRaVhe2f+TVfXRAQXC6GyNDh446+7P
 CrSess8xtlknsz/4hc33JghmFvFFfQ2ffZbvLDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index fa7b822d55bd..85410f357603 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.52.0

