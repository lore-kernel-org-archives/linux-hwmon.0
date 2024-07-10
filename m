Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662B139CFE
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2024 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600565; cv=none; b=cozrB6FgUjbvB8SglHLKp5+At8dXekO3MTpGS3IdeHQQVieHz8cROSD0YoXQ6P5qMhu9ubAEhl2+g42GXwHcaH8xLjXTZcukRva2cVmUHAqC35eufO4PRmIvn7tBduGfLIdysGjl8cZZrBmYIKw43Y/iVw2ARdQgVXqN6BlgaXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600565; c=relaxed/simple;
	bh=0DuTUjwKcmoUD+Ke26uRDuGLpnimVtC5VfEgQi4p3U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RRvwhRvBFoQq3JSPgAycC8x8mCsnvd0Q2kCvpLyO1VupA+A+d8Htb5DdXY+5Cpy7Ta8PZUg/zesOQJVnKChLkn9kUZ1OK/wGiq8xJBzs9uyug4PJ0Tau3igp8NVgB86f3EZk4iiWSlYOj0OukjFJ8AbYN4+Toa7OkGXW/A44H/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SN6+SRSS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SN6+SRSS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77b550128dso757146066b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2024 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720600559; x=1721205359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLnwa9y8M8tKEvQAZNZ2w3HnhPeZmNOTX46tGK9rSpA=;
        b=SN6+SRSS1eCPzL7u/6SnA1+sviuYLtGgXRGCRMPouQ2w2bRb11xdTy0DMo8WEo1kDt
         HQ4bnkCzqH55hJc0fiw/GCN8o8W78rh5UfTZgQ/uOWNSwMKe7MXU6ay1bSbDk0ZEVQyj
         KwIlR8yMJ40EmlYskO5p3pOIQH0KiVRlTI4f1vtn0H7/o5j/AOXH9G4mhJQH46xxTeg9
         5uif4UsjCsEhL+nXnFf7VyFEWT4+OV3X5taqL22p+hCZMCfaPTFz7YLVOfWzimtWhUTT
         ORoJ9vAQq93NfrhPapxbtv6YVSkbtv+3aJybNuROgGDFNblHO/mExZbQAOLlIHul/CFS
         O4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720600559; x=1721205359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLnwa9y8M8tKEvQAZNZ2w3HnhPeZmNOTX46tGK9rSpA=;
        b=cxvUdllQXPNEs58BF+nhS1SVcKMO3SI6Ft8/Bh8VTUyH8e8JPmKtEtYxVsxdC9djT/
         r0+1tlV1kEHwnvwkwJ5fHiJp+UDwHU9vKmxnIVb9lpTv5mQHXninIPjPmXGrLFe8Kr0A
         p/eALKN7nZHCpDKv0aYN+apj5oKsft57SQy6gjX9R602oB8JwUdm9zCoJnQHXUGOrQNw
         UxToW3tdAMQdgya1rJ9TJR/DPqj7ZdRmJARLqyv8slsyS9/91QpqfzFb2FXXuyQxRv63
         GAEkq0LghISQotnsVpPGXM5yinyN4w1g5W2SJldyEGKnzOhJk1hdA6peX0nqtGJ48SZU
         /WUA==
X-Forwarded-Encrypted: i=1; AJvYcCW4xViEmbyOFl8hpxPBRiYwpfptutKjJouBA+vYnHwmYlzOPUJys8mna/7Z2e74PwfO+dTq4aJyZwg60PN14NiiJcRzB3SLE3qlYvg=
X-Gm-Message-State: AOJu0Yz2HV5Js4jgXeJm6GGroglt2rSUu04AvzG7lCFNLdFzOGo5vl7g
	hlW0Kgy0UKuNeuAJ1C+8hLDyVFo510LN05rrL4O5ZMsKfxlLV5WBVcxNadueUnE=
X-Google-Smtp-Source: AGHT+IEFUtftJWnURm9euQd5wYTZtACuxZYzLcX621O/JVpAJ423LEJTYkmjw4xT134ngDHl8bYBag==
X-Received: by 2002:a17:906:c154:b0:a72:455f:e8b with SMTP id a640c23a62f3a-a780b5057b4mr465633866b.0.1720600559204;
        Wed, 10 Jul 2024 01:35:59 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc6f6sm139986866b.9.2024.07.10.01.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:35:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (pmbus/ltc4286) two patches about device matching
Date: Wed, 10 Jul 2024 10:35:43 +0200
Message-ID: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0DuTUjwKcmoUD+Ke26uRDuGLpnimVtC5VfEgQi4p3U0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmjkffDrfQJJHtXnrlvW+E3VTUKNuuKVdBRl1MF zTlV3x2jvuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZo5H3wAKCRCPgPtYfRL+ TmFzB/9QVm2ziqfe0y2Ptgw6IKf0pLBWTyuepzUAlEcFTz57HH9cNQEHvXAr1z/Fx6Lk6imTAIq sY5urp7SfQpnGYS2RT2KJooy/VY5M7sPlO4aJk0vnChFPhnosQCdOQzJIvR8EUEZNi80CLXSSTu AbBL385+rrfQTsAqUp8OMr8hKZHAnv1720y6RyOt83gRPnycZr6/id21SvM3l0r0wJjcY02tQ5n SmmyiQfWl3PtIDR4cbI5oe2pkO+7JH/z+epYMEP34ZrGwrnPVUN1oO1Vi7b1DvPzfdtD2jw7pO7 I+g7rF/8s9tKYh1IjhVmXaRKdnNSKshvkuPeIJv9ovEN3yCz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

while working on my quest to improve i2c_device_id I noticed some minor
strange things in the pmbus/ltc4286 driver. The first patch just
documents the first peculiarity found, so the next reader doesn't wonder if
this is done on purpose (and the patch gives the opportunity to notice
if this behaviour is unintended). The second drops the other peculiarity
I identified.

Best regards
Uwe

Uwe Kleine-König (2):
  hwmon: (pmbus/ltc4286) Improve device matching
  hwmon: (pmbus/ltc4286) Drop unused i2c device ids

 drivers/hwmon/pmbus/ltc4286.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
-- 
2.43.0

