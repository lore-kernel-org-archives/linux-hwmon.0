Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22042BC3D
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278340; cv=none; b=bPU+SEjmVBrBZfuimn4mUAFQoa2f2w8yp4iYAW3/41t3sH+lqcT+ce5HPmXci3lwFc5VxMKRmvmlle8AV0wJfxwa9xQIk25Yyt0EFN/x1Ovuo8ZLt/TWsUAf27QppUOB8GYd7pwvnRUGUNPHLTtfj9sjBj2J/eH4SaCaLD8qA/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278340; c=relaxed/simple;
	bh=Y25ZfFIxBhDOGUWVEJAecNuMSUqszdMQjw2VjAfHskk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RIfdP2XqJPo0MXiFmJOaeosFTXSXKJDMImS2ZPXuToguq0FO4TQ5JMPfBUrU/a0R4gtJ5JGVeqSE5cvuv+1sY0RNSsPKb7vMnv2d9kwhUao3EGukbv67FhADYCA29P1pf3E99PVMyIQzybDqpHtgztHRq4vOdwcO9G5c8KC7YIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2PoN62R; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2PoN62R"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso3336189a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278338; x=1788883138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHlmQPyMxuK2/4fncYc9lzGccBisveBJQIOdVcUgRoU=;
        b=H2PoN62R2yug/HNhKMEtqinJsy2Uf1TrQFk9+xY2QXYmXGUmtR/KQ4xSyLmQbqmfQl
         SmoaCtns2UTrkhzVeCrQzn0NejaaZmMabkAeg3+1lblZBZZal6TvyCorZqWZ/ePoNigS
         mTDiZ1bY238ioCNfyKksERioTDgafJdXQdTIXw9EvIbcu4DbXU0aIEJnfOS3cnnWEhf3
         Gv2Ea5JJPM+ef9+SI7VHdAPXgyVqcOyfGA/qPFmzj0JevjqXA4iOT4Y601zB6Yac33xF
         iL8viIecvWRgwKlPfZwcqo0sfEPojI/KmeGCBILpfTOOYgDV5MvcHukgIqxHXB50J25U
         ZOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278338; x=1788883138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHlmQPyMxuK2/4fncYc9lzGccBisveBJQIOdVcUgRoU=;
        b=rkbWtdMG9ZdA6/WUC8eTGJ1ViSnigRU1QNOvXJAFJsO6sjydACjwFJ5Myoldg0rsUV
         uZshn47HsXN+mIhRJgtaPaAxmDJDmsbYa/rTcNO/L8F8WC4hH/JFWzGz429zmAPYbxcC
         6o6F7GKOB2V/xWLnWKpmsGCJ2ymJKTYJ/v+4B8NKAQU6nKn9wrqs5NhE/YBVah1EmH8Q
         HvKK84vZvPXOGk4mRgU96pD+NL3WidGvVrsjRxh28KNQ2Fz9/yN/aafFRFmR3YSBksFu
         qqRCQ8a8eM0kfjEkOaKgXsf4hlYMRiDZrdy/3rEVyy+q53G6M3ITPqVdZ++2EQ/1vjGU
         w2bA==
X-Gm-Message-State: AFuF++kSVu0dNNmT/2PLB0ELPv4+99BPabAJ2lJxw7tBGkUNHVjErzG5
	NIc9hLhtGNpOSDRcbmsh5KpDeaMCAnJegYClLJFcyJqpOtyykH0Y/qbl
X-Gm-Gg: AYBFou2YSdnr0WI50Hnsxh+oXNHOVXtlpZfIIPARVQerTzTZHRCPTcjaeR566ly8may
	VPjGhDp3CrlWqjttnQIuX/h7tTyf2oL//KrfUTxvYDWzZeFoQy9Qms6apHINzhUa0w3ySESdiEw
	LORPLCEaY2Tbd2PKCqOoRfl8GSICGaytFP9dAb5acLpRFhv+8OlxasaGPdmDSk6eYuTmI9hvtWz
	1xAeMw+/tGuI8Kne4ETjT/1rzMJpT3AJOEoryT/NibNJ9tIzii9fErSPwpMeoJLYx9IWwufzaed
	yFhAFTXSJ9v1CYqBOfEaNGM4Lq4w4gGLpX1BR+xvG6gqRJ8iwhS10vsT04qS5NS70nmg13xTntY
	d4pcSUgOQRKwKbvw87KQExfWRpFSr3VuEbQ90S+ZixPmfh42eXjj6SnZ702VVGHM6vKCcT/N1EU
	wUME3GwwgRSiAzFDrd4In3GZZHwS2ZxwA2pYgWYNcSko2zTkQAwXgt9FJoK64tgNz2VeXNaGj0m
	8nd8VkZwYsw5Q==
X-Received: by 2002:a17:90b:5544:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-398bd376c65mr31470657a91.12.1788278338408;
        Tue, 01 Sep 2026 08:58:58 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([42.116.29.172])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430c7a173asm1741874c88.10.2026.09.01.08.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:58:58 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Simon Guinot <sguinot@lacie.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Sashiko AI review <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler
Date: Tue,  1 Sep 2026 22:56:48 +0700
Message-Id: <20260901155648.1538876-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_alarm_irq_handler() is IRQF_SHARED but unconditionally returns
IRQ_NONE, even though it always schedules work in response. Enough
"unhandled" reports on a shared line trips the kernel's spurious-
interrupt detection and disables it, taking every device sharing it
down too.

Return IRQ_HANDLED, matching what the handler actually does.

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..a55a7ea07fc0 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -67,7 +67,7 @@ static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
 
 	schedule_work(&fan_data->alarm_work);
 
-	return IRQ_NONE;
+	return IRQ_HANDLED;
 }
 
 static ssize_t fan1_alarm_show(struct device *dev,
-- 
2.25.1

