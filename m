Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2B3168EF
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471443; cv=none; b=HI/5jkIsI02rJ1g5gg1sNkfDiRHPHif/TVGYTKALwzd3+xZymp3D0dI75pDsq1+orOcLuJN6m2Rtzqhzq/IM9QdHH0sKk/J7LjkGDJtXjT+LTw09iRsYQj8dnWcyKwWf/+eO15+dZdT1b9AT0Cyh0St9dDtmf7C1KKJrK9WVDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471443; c=relaxed/simple;
	bh=wFC3uacQOtLA91H18q8YDGxjUWrFwbqfyIofOp3fvHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L/8gno1b9FrVanhqcPtqscY4K5KCAVJPNicvTCBnA3jeOSeQd2onOJzSCu2Shnnc7xoXJBFu75gB2Hn53uKrBCc4QyKyb2q77+X/9duCNJsR7oGseY8t6mHpR71RZIAHuwYOs7uMZg+tNmhUD8cJxK45HRJAEKlCVc4nXEXx268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4sPjVDV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4sPjVDV"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so306029e87.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 08:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765471440; x=1766076240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OavUonQftMPU4AusrYb98irWIVF8Pjqq16PFFGKIUtg=;
        b=K4sPjVDVflBKqfbsDXOZvNWEwwTi8iG9LYe4nRgWW0+n5gOgdm+1yBjUL1mHm7ft+T
         I6fIvBH3zcn7cmaYfV99h8haVmqP25lRQVgKZxQSu6rzrQDxQV41/5MRZMOtL5f3hpfN
         /K2ZjVmX0SfkuLzZtHoLQxfCrQk9HXXbr521pF+7jFowOqIzC+KwjDN5zWd2v+gnoTS6
         W9cBL1/IplELR+oPVMMmTXaxkqJfi2y9WU5iv7EK3eZ+/4sJyeNXLWCoD+g7VX1r0bSh
         xgNP49ORmAULLC/KQeJR45ZbTDXMmA8J+rvv+aZRtQhP+6SogTl89CzyxUA0/FM2MyV5
         BHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765471440; x=1766076240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OavUonQftMPU4AusrYb98irWIVF8Pjqq16PFFGKIUtg=;
        b=fnj9XJLsrhHN1LpMllTgcZc7qvXcHn85lq/t1y4MJr90cnR0kYjYsRUkx9DDKgnuUR
         JZ8n/Kb873WRSzUCjk94uTdZ3nW9I/jRY31kbqjKa/1WcAZu3qfhn5zp+20EDuGybOia
         0dLPd/l7Lan59jwm9mN/kpuuo0KjCPcMgtdJ9t6aR/kS/KBOBcop7UF0L6hvH3rZ2l6y
         H8tImdZK62mxgTAmepHyikjeTmCl2Jh88ncRMmhSQdQ75XEG1B9XPealFpv59OTWmse0
         Z8b+yvMfNImiwHE7syWObFT1d32eru0OncYy6KfTkD9AcIvNwzzaXyVgfI5iadcAm9Rp
         051w==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZvbON8PDeHi+6hdnJykybDm/HBDX9mz7csNejNc5vrFQewQMz08XQSMekjuLxNZlt1KqXLo/Lz8G/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9HkaAv2J8NZ6FxXScnoubk9DER5t2ooEknXJH4nb90wRky4Gp
	OlXOlOxqtaT6+AK/eMs44rYmkNni2tVWQYpY/j+z4jZ0foHUYIgtPNHL
X-Gm-Gg: AY/fxX7sqRFHjBTnRLI7aVRU4pfkeBKCX0sJ3Qd5TI67SxvB6SSLsDW3d+sPX8Btf91
	UbFIU2SUwhJG6/qyyM/o18D9S752sZ+QHkI8mzycMG2gmdftl7DEoAfNsK4MLrLGOHZGWP6cSdH
	Zovtg0wV0U1uftGFRuD6y4j/j4TLWVWOb22gzJbMBb0V+0m+lAtzoo9Nre3apydoUEFD9Ij5V6O
	VwjEAsbhzUK3N9mfYxNtNTNUYYLzaQTKjzOp8SbWsauIsj6IleFoKvPs3jiw4l53Nh+40dzWZPk
	2mVuoZODQrTCLyZMpTrI1ymbLiVhsItOnqJPDp+GMfUWRDa8jYD6iJpn/E4qV4MNTyzkimDmZki
	rwDnH9TFAoajyznktoDFJBQb5ZgjAt55bu6gyN1mbafjlAdotQIR6cgj/McqOEvCZX4wf5iHW3r
	cPQ6fuHZKTKJEkg+Kvd/P89kc44+7B2CSCf5npdHiUz4KQAzeK
X-Google-Smtp-Source: AGHT+IHTEtRxy1U1n075qhAv+e9rs1LRt3U/+P5ZaZEE4Enm/Bu3yoBNRSvtsoFvldNP4eV/vPi8sQ==
X-Received: by 2002:a05:6512:39c4:b0:595:7d7c:59a9 with SMTP id 2adb3069b0e04-598f42a6f23mr865413e87.22.1765471439546;
        Thu, 11 Dec 2025 08:43:59 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru. [89.109.48.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f44d36sm1023437e87.36.2025.12.11.08.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 08:43:59 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexey Simakov <bigalex934@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] hwmon (tmp401): fix overflow caused by default conversion rate value
Date: Thu, 11 Dec 2025 19:43:43 +0300
Message-Id: <20251211164342.6291-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver computes conversion intervals using the formula:

    interval = (1 << (7 - rate)) * 125ms

where 'rate' is the sensor's conversion rate register value. According to
the datasheet, the power-on reset value of this register is 0x8, which
could be assigned to the register, after handling i2c general call.
Using this default value causes a result greater than the bit width of
left operand and an undefined behaviour in the calculation above, since
shifting by values larger than the bit width is undefined behaviour as
per C language standard.

Limit the maximum usable 'rate' value to 7 to prevent undefined
behaviour in calculations.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: ca53e7640de7 ("hwmon: (tmp401) Convert to _info API")
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---
 drivers/hwmon/tmp401.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 02c5a3bb1071..84aaf817144c 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -401,7 +401,7 @@ static int tmp401_chip_read(struct device *dev, u32 attr, int channel, long *val
 		ret = regmap_read(data->regmap, TMP401_CONVERSION_RATE, &regval);
 		if (ret < 0)
 			return ret;
-		*val = (1 << (7 - regval)) * 125;
+		*val = (1 << (7 - min(regval, 7))) * 125;
 		break;
 	case hwmon_chip_temp_reset_history:
 		*val = 0;
-- 
2.34.1

