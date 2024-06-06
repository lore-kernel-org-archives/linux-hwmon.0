Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA20196D9B
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Jun 2024 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683921; cv=none; b=Gf785ASdrEWbD5au9PPn2+lyw3eMD18HqjoJlWODN7g1FxzEtnSwGIK/WKIcfmNwj4OdL0YKdgsMBgbIB/ea83JVtB0ruqFpKcWyZFYydxDkzuI6Y1mem9nnHaOvYc9AQ3jNGMO4/vwKF2Fw2t0RNOszB9QM/k9iJymfnS4pEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683921; c=relaxed/simple;
	bh=0wQW0SytZFHqZu9CzAw3kJQX9/NII/M1iP5Xd7waWCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADTG54iRF4NlvYOUcZSm1YHiLDB21WRN3Fxkag1V2nztVJeIwSYL5XZwP1LBdXHg2Lq8q/lU1ny/g/iiGbaXgrZahb/j1SRoEBBDzT5H2IqHis8MioJJe8Tw+KAv9wBffxk0nQUv6ppVwfbfafhj0HwPfgMT/KykEmlj+FILc6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O5enY7g2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O5enY7g2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaccc0979eso12574911fa.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Jun 2024 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717683919; x=1718288719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pCK3r9E2RWz6TR4ZIewd3qMgy92mHcIUo3XGpYyAQ4=;
        b=O5enY7g2yVl3zmaw6tqbg3jo2npAQRpwhXiCBx582RvjlJQxe8VMvU0EM9ILD5Mu+f
         HuSolOjnKQURKRCCw/pfXv7mVxNwkp02Oqu0JB4V1j4da06tSG2Y53xwu/0XXTuvp4m4
         ksN9JWgSlgQdAdexzgkYDOL5NcVJzDapjCanTOzONRGwMRkDU2fICjflFdtJf/oM2458
         69K4FqYU7KwsxmuAUHDNWkJXUUP1YuOgSV+Mk9kuRsmFufCamTLEHrqGCvy/OmgwlhWP
         PpGbPPYWtG0gpNwb1zoenVx1m8S5okdapIwo298508QM2lkBE9KiD5XJuYE+/rgaqUsU
         QkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683919; x=1718288719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pCK3r9E2RWz6TR4ZIewd3qMgy92mHcIUo3XGpYyAQ4=;
        b=FshtxoTfw5vlIulV2nZLhsAfvz5Xcgp/8matb/6tEz7u5FDYgOvHHlF5MrDywghUub
         6uPhTepnwQ8I0NyVmKxzsksliejGrzkWig4isxPMJJCpY8DNwzO1R5Z2lhstuggn5N3b
         YOcI27gOw5sX4+rIu6CdXQIhJU73Sp2ndtkWQ4h4ZXMRtSwo33RTNGa0KCGaHpmmU12/
         D5PPpS5gezArjt7tlSn/B60xstR4n5eGIUwunzX+DD8VhHfRaA1Yf3H+abBGCqkM1NEr
         dSkvZljPuCHxC8XgOuXr/NzM6pOTAvHU7MwtPUpTAQh2CtA2dl9hCuJTl75vYMQ214+q
         SCIA==
X-Forwarded-Encrypted: i=1; AJvYcCXFW+zg1MXOsJJgTrK1cX19vxv3/kVPCeGooRuTnNgtcUDhDYfc0K1u72gRPY4bS++gxUaaYj0GMwHlWdUvyvF56Tve1kY7ufX7jjo=
X-Gm-Message-State: AOJu0YyudRPRt/Htiwgv5daUVW+qsY9nkWyiRBJ05lZL80lsi2lYX6eS
	oUfI5Wjy2P4UL8/+Vm0ZMvWmWRha0KSByACTPg8e2BxMMgntmE5dBMXEL8XQBF8=
X-Google-Smtp-Source: AGHT+IGtLyF57Vmt6WZUTtXsspsBnLOJcZhvNhVu8VzggNj5mSsgsdeLLvuunFnpANoExVoW9/fzWw==
X-Received: by 2002:a2e:9c46:0:b0:2ea:bca0:8e23 with SMTP id 38308e7fff4ca-2eac7a986edmr31587991fa.43.1717683918722;
        Thu, 06 Jun 2024 07:25:18 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead41b0590sm2149511fa.89.2024.06.06.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:25:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] hwmon: lm70: simplify with spi_get_device_match_data()
Date: Thu,  6 Jun 2024 16:25:15 +0200
Message-ID: <20240606142515.132504-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use spi_get_device_match_data() helper to simplify a bit the driver.
Also kernel_ulong_t type is preferred for kernel code over uintptr_t
(needed for the cast).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/lm70.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index 481e4e1f8f4f..0d5a250cb672 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -169,11 +169,7 @@ static int lm70_probe(struct spi_device *spi)
 	struct lm70 *p_lm70;
 	int chip;
 
-	if (dev_fwnode(&spi->dev))
-		chip = (int)(uintptr_t)device_get_match_data(&spi->dev);
-	else
-		chip = spi_get_device_id(spi)->driver_data;
-
+	chip = (kernel_ulong_t)spi_get_device_match_data(spi);
 
 	/* signaling is SPI_MODE_0 */
 	if ((spi->mode & SPI_MODE_X_MASK) != SPI_MODE_0)
-- 
2.43.0

