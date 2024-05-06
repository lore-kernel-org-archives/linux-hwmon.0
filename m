Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB3E155A3C
	for <linux-hwmon@vger.kernel.org>; Mon,  6 May 2024 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011191; cv=none; b=K6+IN3CGPVqd5TfeS85CEKrCY8BmIMsgaW1G9C7gUoAd7xpfc8a+rBUZ9GBAEDjdKIYG++HW9TnyTQMQ/LEdeEK6eXQWhybxMVvwzvOBJaOSUC/TmcaEuXnurCW9jeTDJ8Cd70uIINx4FIxAPGGGZPaY2IOpvknMTHr0vze3PCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011191; c=relaxed/simple;
	bh=Z4JtbWwDYUVBekkPFVCgO2D/g+JZlEmJ5TZ/YseaHn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zq564jHEc/ok3v7h48OD2dE110IoAB3Ek1VUCdELLPe6GG1TMQdML2ySLAJsTt/cVn7m8DqM5kRtYa4PW9OJMqjbvh7ek7Hj58knwdZ4HCuW9koWYF1+PECLHXiuDVqOA8YrlRATF9b/aU6zA39q00+LpuoLvzjrT+F1+0MG4HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uZNr1gnf; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uZNr1gnf"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-23d621abfb7so983748fac.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 May 2024 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715011187; x=1715615987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8bK6fC+/hctk+PwvfTwpigK2iNyGvKKcVfohzYbxwA=;
        b=uZNr1gnfdcxuch5/Cxj8FV/ntFB1WnNgLWVzpmp4U64+hYMkP08FEVuroXFwMA3SFz
         TiTH6LNd427ct88IyvjCx7wZQRDtn4RBgNZ3/VMitqeRlOKPxQvjvQvrv3QGQ1qGbygn
         IwxA5LxNJl5c+zUxmIcP2wpRARBVUMfBFkpWVHpq6QjnOYSh/GE4LMB/nJHNG1zfxfE/
         YtsT7PFj3HJDlsgmMQb12L9b8rQmmGjhfV7ZMlsb5lYLC4dUg2UkSMafpYWmlK3DaPtw
         XdZ/X2JBB0/bFgWG50/DzpopPE0+y+6j2f/vUgvlfYdZzKTReL+/EhEmlzjcVJVSim6l
         938w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011187; x=1715615987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8bK6fC+/hctk+PwvfTwpigK2iNyGvKKcVfohzYbxwA=;
        b=id0jmIfvVLMp1awbFi8duKrUz5UZ+DeA9g3VZ0n3VMTzHl+qnoYKDoqRl5BXR98TvU
         2fIy2D1hbf4+8IFGTeDeN60gQXUmknrb70YwHy7XvfHb++um41hr9+LVD3jggWyqkzfu
         /GxIA5GN+dBl5/UPfXsnW9T6q1s7UmDypvQ/f8PYPdPBOA9fSLliJUBS5PArAgCgpdjj
         sL2F9cAsJQS6B6liNri+3s7aSsJmp1VlvdtqiofOrpcGQ+mIoN4dhqCD/Jzyg1zrwtvo
         Uqrdl5+cvv2LbOo+MCeDBRT4QPx4Lv4xucwZF0RvI6ZNLpQR9vqKEui7yUIYqyqfLYfK
         u6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWf3pYo1IQDNbBbjfLfBmv/f+TnsR2/Uspv/6y4LcKH+KLQ7sKAXQ4/T0sFfX9H/NQUycU2zeb8dMAH3AE7EGqY9wIp+YZaQwxXTO0=
X-Gm-Message-State: AOJu0Yyydkdyej52snw0JydvoI+qKG+OzXJs8r6DOOv9J3G5flEfrrbr
	ay1sWrW6rjHbLxtOU717PFwJ0q0rKZSw98W5MPDK4x+yx3QGM8zSlVjHjj4pR4Q=
X-Google-Smtp-Source: AGHT+IGceg5dzRVIGMGeu+y17mgOISrw/lpfzXT+ptk9o2+Vn10KZdcOhZRcjW//XSOCilsK6On4tA==
X-Received: by 2002:a05:6871:713:b0:23f:4413:67bd with SMTP id 586e51a60fabf-240193912c8mr35622fac.6.1715011187143;
        Mon, 06 May 2024 08:59:47 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id e17-20020a056870451100b0023c82e5be0fsm1955226oao.7.2024.05.06.08.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 08:59:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (adc128d818) simplify final return in probe
Date: Mon,  6 May 2024 10:59:16 -0500
Message-ID: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-2-356cdd152067@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-0-356cdd152067@baylibre.com>
References: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-0-356cdd152067@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

The final return in adc128d818_probe() can be simplified by using
PTR_ERR_OR_ZERO rather than an if statement.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/hwmon/adc128d818.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 2a35acb011eb..321a61977396 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -475,10 +475,8 @@ static int adc128_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, adc128_groups);
-	if (IS_ERR(hwmon_dev))
-		return PTR_ERR(hwmon_dev);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static const struct i2c_device_id adc128_id[] = {

-- 
2.43.2

