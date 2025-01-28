Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C61DFD89;
	Tue, 28 Jan 2025 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738091864; cv=none; b=S/HnJCmo/Icq8kCmcTIOH99dEuqoY8dhOuGSZBSP87gVkqS+DtWtLQuj135nf7zcdKJycbaaMPnd5cVzsIjSqn8QJC8PR7ytr4oGeUbLjfIQ/1Fofs7jlTfFsUjk7VnSoV4kaNH7Mq7vXU7v8FoHKYaWh+AHqZFabYN26HqI3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738091864; c=relaxed/simple;
	bh=bgnTcyfT5GS7CuKBUWPLESjyiP8WMrNY1oSZnqVtiXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOJfosjfT4V3HFRk/Rx9+Wa2USQM+pd/uSQ8Mq1nyWXeVEfr/Gwck2RFFZcV4gNgapAqckHnwAUgy0saIeo9GSEJL5zrv28it3qDhTm0GC1VKNEKv92wre//6Sl12LqfGhT4zZvBavIQrQW4iKghRghuA5VHBYivgX8V5XEEWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1k5w7b/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1k5w7b/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43635796b48so38997455e9.0;
        Tue, 28 Jan 2025 11:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738091861; x=1738696661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtcHMHzsCPY8m2uh+Fm3smuT7g5v7qu+touota16XQU=;
        b=U1k5w7b/wNrMv9+7VtAdD1o7zzkKZEeTzBqw4gv2oVeMMJm8dbCSRt0AOqPhqSIXLl
         SpUWugIUZlhKUnlm94e7jG/1lzFRFzjZL8uI3jvJyMaOT90C4fNxx2dvJLkH3hoVOx0y
         849Ydo5HaWUvnAj3gGAQus3CyaY9je1vodFPiv3Adman4y87WSN3poY5hZYYjJaH8wwr
         OBffA6u7htwhD1lt2ZsszPIc7OU+7MteLHdboKpSbRgjS2QET21N5BP0xsRfS9oflsJc
         +u9kd4jxcRD7pOWBtR7biq4QpM7xrJGRZ40Fh6ivQFTydc5Xhioqec0ExkeN0Id8OOYH
         kAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738091861; x=1738696661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtcHMHzsCPY8m2uh+Fm3smuT7g5v7qu+touota16XQU=;
        b=JHMf2w978MIZGSLl+I5nUk6zBLe0g78ukFG35/wTJUUIiH6ZERRTry/mK635x0vY9/
         ZjIXwss5jO/xasfhYEvFU+ElDUXbuiDFdTvRT64+EyT5xwhZOlduX+cp19+x56NuX1VV
         wIWWm2gDvSNR5O62GvALKxbH/S5jAkyqWEhAkOsHFF56L84y8QEdN8QihXcfPOpFzCVN
         NbzQB4zP9pBC9F7UJI9J658bgkey0hg41SlLMX7KhvkrBZutc676/z47a2KflG0+X2uZ
         mrLkfT3uSxZiXGHOZ7YubZndnK2eLuc8IMPvkKx3qwPnXE7V2+pODh7/uTowoZr475fS
         5e1w==
X-Forwarded-Encrypted: i=1; AJvYcCUIFWpTrlqFaj7dbgRMEju9kzl0aET0+20OOmLaDyh0AFy+apZlRqCgwM26ZJ/1x2SZ0/YOyJX0lxQG@vger.kernel.org, AJvYcCWOvOTAVFCsjN3bCVwW5WzwAoZMh8hFi/5FybU58FfCfDZn9a5KCwTmhki6aOtCRtLp/xXlmYpAnuv4Hw5m@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwQqwaRgIAixxmn9ho+PrcrrsozXUUVx/K2K9SK72iL/kX1Yv
	rn/c+wHFS+L0ZIglP2UmBabrn7pNhpuMY2hBKRIVKuqcUychc1RP8GazXi7JDVw=
X-Gm-Gg: ASbGncu+RpfX4PAeF4dXS5lkMFgv8GwqyAKn7kum/oZ0pBMsM9Q1G++QduNUpuqw4Su
	nqWkfj4pHb5/VG+P5YCOf4yinSSW3YFb42UIZROzmHlF0MmCJsl+jUzUJn4iUUQIrPzdbdkg588
	dCm9BMFauWhxvbOyu/M6oE2IYgqtzkk3Ni2rWSZkFQe2ntCNyyD6Xuc+hNncl8MBBLDMfb3Z2SY
	+nAt1BYGmF3YAHZQdIv/lpgHsbahWpg2r80aRFcjuorR9bc/+K4kHHWDnDimh9NtbCmZeMSkm13
	PBMBp+YLacE7s2Z7ksW/a+M0DKKFph7xgzjoKM2KYCrnmD+RkyFBPh1amJ/P2CoKD3v/ZqE4h7F
	tmxckwnBtSSEh97mYYaeKy2JioysyUBcQBf9jJadFbbFa
X-Google-Smtp-Source: AGHT+IFPt4i7RZlXb+LBvzZ/PTNGiA+ggdgrw7655oEDZ8N1b+ZKpuKJtBT54mmT/sLkmyE0Z9HWAg==
X-Received: by 2002:a05:600c:1e09:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-438dbdd3128mr4007595e9.0.1738091860764;
        Tue, 28 Jan 2025 11:17:40 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54c0ecsm181224365e9.30.2025.01.28.11.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 11:17:40 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: linux@roeck-us.net,
	krzk@kernel.org,
	robh@kernel.org,
	christophe.jaillet@wanadoo.fr,
	jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	andrey.lalaev@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add description for sensor HTU31
Date: Tue, 28 Jan 2025 20:16:41 +0100
Message-ID: <20250128191730.739428-3-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128191730.739428-1-andrey.lalaev@gmail.com>
References: <20250128191730.739428-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add trivial binding for HTU31 Temperature and Humidity sensor.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index fadbd3c041c8..30e8f89fa032 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -189,6 +189,8 @@ properties:
           - mcube,mc3230
             # Measurement Specialities I2C temperature and humidity sensor
           - meas,htu21
+            # Measurement Specialities I2C temperature and humidity sensor
+          - meas,htu31
             # Measurement Specialities I2C pressure and temperature sensor
           - meas,ms5637
             # Measurement Specialities I2C pressure and temperature sensor
-- 
2.48.1

