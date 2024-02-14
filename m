Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D413B785
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939830; cv=none; b=jrWYK7nTwfTCExtE2Rf7sMLTtx1wn5UxzAQPjHo1mnubhYvw1khNEMoypR5uymQJwfau/X9xNnF3c4zJfEdACPUlnv9NqWZCTFMhWOZhsrK37VuD4XVo/VqFyvfXrJT0DmVFX80zyFcu2CRXwm0ofBcgLmr49CQZxLn04i1kEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939830; c=relaxed/simple;
	bh=j9GqehY0EFwb24K9tnXbS2L0bri6iaYMS53DmOvz988=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pAsomOlLrvsUVvDiCXz2JruBVD30h+iPh2v38EeRoXzBnMaeNy0M5C0xAcG0t40Cu6jkYCCHSqP0GLwzfwu2VCOxoy/YxRMYPCbN/cbPOSayKhDvv/ajqKaN7JpsPWkjBvyaJteNM1iDixJFp3Wpl/9pw6duP0ss9DLIS2ss8fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjhD+xj5; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjhD+xj5"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dc816e4affso111955a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707939828; x=1708544628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOe7SOyfNtckqkUvJJMB+qo5fvWSIQ8q5XFf76XxDcg=;
        b=CjhD+xj55A9l2xvmKDTvhF99JZg1HDIvOD1vZJC39owi9QF5GA3qSvT5Jbw2yPncDn
         N+hJ7AVYxAmdE54H09oVrVvpqruH6IIYNG/aZTwCM6PgucykDHq7nCSMpcso7/7/lDxq
         0j140B4rgw/TsCnThgCen7A/m7ylabttXVtHwZi/w8WVdeDSZUpEzUJ4HrMxO5GOppqO
         SupcDzpsOR88LOwQAi9sd/KVMzA+Y/+e/5XaP5vFLM4p/9IqPjx6VqOiUeu1fYfW9uS2
         6q/n7wiFJE0sauUqr7dC0NKBh8W7FF5Yu7Va0hit4DTu+FfrheDVa4l525fjUuIdk6Qg
         uogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707939828; x=1708544628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NOe7SOyfNtckqkUvJJMB+qo5fvWSIQ8q5XFf76XxDcg=;
        b=DC9qBmgVNcrvtHyhgkayyEk3SlefCOXexzk3eOmIql+XWbPDuCNZxctfsrEh2qYu58
         6AoZ4IOh1IUOW8/BvvUutobHR6jSuSz0ogUsdY7PcF4XMqHOAKtppIi8pI+hFHcPiGEf
         DOLBLkedAPeKNepThmbnKm12eYwKCCHkBibT0z01z6E0Ae+KGaxj3v+w72TMAJrMRgUC
         ZbP5xUJo18eKt+STgCHUz2ZE2XbEnG4peKgDJD0obP5eOlzCucsziAMD5omyxrcGugKw
         J32OLo5xsHuOqfuEkFro5BZYGS2hIKZtvBRG+iG17o/cj0mr2ovehALiqektTeL0jh9n
         hgFQ==
X-Gm-Message-State: AOJu0YxjFT1hXRY9YYtvMKm5pxcSm7HR95ax2fxM3KwHEnpc65cw591f
	7xXl4AWNgIH60e39KofPNAyVkJP6UHR84zY0ZX44Ps27D0WoxVVqq/izcgPy
X-Google-Smtp-Source: AGHT+IFAhMGDR6dqLm9Ry/TOOinsHMhHl4nMMJoXUmY+hzmwTzrmugH9ie4LmkJ7dkNt6hVhQEbFdg==
X-Received: by 2002:a05:6a21:6315:b0:1a0:6ace:64c1 with SMTP id wu21-20020a056a21631500b001a06ace64c1mr3139284pzb.36.1707939828035;
        Wed, 14 Feb 2024 11:43:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJiI/mS6WszXqtHtf4dYA7cVoRANlEy9GsGyt8BJXE9xxlIS1C7YW0wJob2mDCZtoCSMi+feeoNivOfhoHz+3I79Th8qPPMwNWkmwuZLaGD9IpPaw+VYRf0NivwLcpYKpiuger28ZgsBeutkxAmiluv1Nf4YD5bw==
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n25-20020aa78a59000000b006dd8a07696csm9729947pfa.106.2024.02.14.11.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:43:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>
Subject: [PATCH 2/3] hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to declare regulator
Date: Wed, 14 Feb 2024 11:43:41 -0800
Message-Id: <20240214194342.3678254-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214194342.3678254-1-linux@roeck-us.net>
References: <20240214194342.3678254-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a chip only provides a single regulator, it should be named 'vout'
and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to make
that happen.

Cc: Conor Dooley <conor@kernel.org>
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Zev Weiss <zev@bewilderbeest.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/lm25066.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 3a20df5a43ec..cfffa4cdc0df 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -437,7 +437,7 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
 
 #if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
 static const struct regulator_desc lm25066_reg_desc[] = {
-	PMBUS_REGULATOR("vout", 0),
+	PMBUS_REGULATOR_ONE("vout"),
 };
 #endif
 
-- 
2.39.2

