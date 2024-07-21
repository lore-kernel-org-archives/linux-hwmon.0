Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BA1323D
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721590514; cv=none; b=QRHFqvSjR1kAIg8NBZc3YJnB0//qJo/WF324JI0FTsTrjuu3l0ET7Xpd4XmoGCxts/Nb+UFLu6c9Wr6uFjgo7JykCYRHU1GamMt9/ZFluMKqj5OIrqwHPWG/jNU7TG/5hN0vcZqB1FQgJN/z5TEKITuHhwwQ7DpKuI0VLdKsLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721590514; c=relaxed/simple;
	bh=4gHkUUltNhm2cTkJlM7SP0khTA2I8X6Zli+I8pkBhks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fmhE9soZKix8yRnpuDGbpXbL9gVSLV6DdQ2MWGsGwaNkz2PtdNUHFR3LgIMZrl+Un9k1Bn6Ok5ib37PDV84clSH33g5WRdwUHxSC0mBEOVoVUPyqkc2cri0ZoFwZjZM6Hm6GWxAbxJSzZMnqI0I3utfWr9qfZGTcFnWuFjZ/vQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHKwPC6W; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHKwPC6W"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6678a45eaa3so32660767b3.2
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721590511; x=1722195311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BSkAn7EEW2JNVPll0iiX5W8n+BwPxahYpsDZLchK37w=;
        b=BHKwPC6WDMs0VYeHzUhFqmfBvO0lPbPb000avHkU8MyHZLStauSDj94ZnOYZgNGyxX
         QkHrl7mfK9iAJYb9CAk6xJHdRfT/jmRlkVWaEm7VmJi1SRhoxiHLjhFYNB/8sozHSKmt
         MuW8Zr/fLUesm7Zdes8HsaAShRO5IsaNsv9DJLmTEzDYMBlZUylQUmt+dxeNewBL7z4r
         1qxMiygMs+wKpAuwGzAFYQK17teeg8TjVTziVd6syu+TyMNhaqYrigIk5P2QSBcA1bTM
         4D6yftHNaERcIfXaI/S6Os+bGdjzx3Eej6zrZLajCCKgwciBGmtqpdeAMxA7yTefEeR6
         4jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721590511; x=1722195311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSkAn7EEW2JNVPll0iiX5W8n+BwPxahYpsDZLchK37w=;
        b=b8+lcxlRlid8KYTHxyY8lHexPDjuML4naIhWWCMnRHWFAIU0G4xdlBu03t5jV648wD
         4hFuWJpTWqjXaa+FzgEuuo+X7u7B9GaIWhlN1Y4wMZ/slVQ7y+UzhfgPjAGuVmYuvb7T
         iuMXxHgeUiM8QqlOsBr26rP56C+o83IFRGHXDEnAws7X9jFiU3pu7fWQi2kIip4fokQ3
         NfQGB7zQfs5nv+BHTuTQLGBAw55bE48siW8qF7UTj1G62SBe/i1COISSSi2S/V/0nAO1
         qEn6PMCtVma8hvOFhstW8Inv0FcwTga2DUeDzyYw3Yop1ScuR5xUP2BQAdOegLJJNnKK
         7QSw==
X-Gm-Message-State: AOJu0YyjIDPLLSo3c/UlS0q0Z5c2Rd0ED8fHcgvVX3AH1dfWnhnCQGdJ
	MLaDhQa/aiBjvMYxCYaSnT1Uax1zbZBNrd42xxYs2VVZ/APMJMd8f/xT1A==
X-Google-Smtp-Source: AGHT+IHrXQGOJPqeeXl08rD1eELLRIyy/Au/+LV2f6BbHC9OA/y6Y91Ogx4V8P/lUsu054sp2o28kA==
X-Received: by 2002:a05:690c:3301:b0:64b:2a73:f050 with SMTP id 00721157ae682-66ad8ec4979mr49340037b3.23.1721590510732;
        Sun, 21 Jul 2024 12:35:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2628be4fsm823799b3a.80.2024.07.21.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 12:35:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (max16065) Fix overflows seen when writing limits
Date: Sun, 21 Jul 2024 12:35:05 -0700
Message-Id: <20240721193506.2330006-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing large limits resulted in overflows as reported by module tests.

in0_lcrit: Suspected overflow: [max=5538, read 0, written 2147483647]
in0_crit: Suspected overflow: [max=5538, read 0, written 2147483647]
in0_min: Suspected overflow: [max=5538, read 0, written 2147483647]

Fix the problem by clamping prior to multiplications and the use of
DIV_ROUND_CLOSEST, and by using consistent variable types.

Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max16065.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 7ce9a89f93a0..5b2a174c6bad 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -114,9 +114,10 @@ static inline int LIMIT_TO_MV(int limit, int range)
 	return limit * range / 256;
 }
 
-static inline int MV_TO_LIMIT(int mv, int range)
+static inline int MV_TO_LIMIT(unsigned long mv, int range)
 {
-	return clamp_val(DIV_ROUND_CLOSEST(mv * 256, range), 0, 255);
+	mv = clamp_val(mv, 0, ULONG_MAX / 256);
+	return DIV_ROUND_CLOSEST(clamp_val(mv * 256, 0, range * 255), range);
 }
 
 static inline int ADC_TO_CURR(int adc, int gain)
-- 
2.39.2

