Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE941514EE;
	Sun, 26 Jan 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737902632; cv=none; b=ASVY21HZcRGvXpqPlOm+qdJiagecwRsw4aRvNP9y6OHBUEB8NQtMvKnOYbPRjUOZAiIAxGuL6CZQh5T2RjtHPoJhFBq3BcJAOheqSzjFhK1e6NV7g+Nn5hyM1YrIkewFJqUAKh8+BzgXdo3YgEfPU6Rxd09UE2ASqlQOYLsTsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737902632; c=relaxed/simple;
	bh=GWndnA0wB7cjw/zaWYcKXU7KwjY6Q00Z7TtyyU5h6nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yu6Me04c3MiPX0BxZoA8KOdDNXkgEBMsSkKJwyD+zV5vbrPL8KZsPMWNPBC/V//H/X1q/uGjNu3ve9hseciZzGqGWgHs6zjpa98hYkjDLACy/9c5fUN24ibMRVYQ/6ojkFzS4/8hH6zG8TPGWNt5UqbWuZMmfJuYJj4Cmu8lrEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5kRuQcW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5kRuQcW"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so37169935e9.2;
        Sun, 26 Jan 2025 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737902629; x=1738507429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoetCMsPEBTbCiMerLoGw3racvNVfo1MBXT9WyDE05U=;
        b=k5kRuQcWHaT7J3ZSKmWqhjlUDNwHnYd0Dwhpt56bIEfZQ1cLd7u8urKZ+hkmMgKUTV
         Q6VC/ZWvjah+RBejlBpK+paWZIzDaQfOckhNa+gENb3jkvBb4DZMJ6V1dsRFnERSLDMh
         ZjxIu7fVBtW+lgx6kgET1rfl7rQ8n9jWntRLQD0qB9FXMwrIglNj0jdpYxY3VPLAzybi
         5FRTdZ74Ub6MFit64JxeqGcJuWPUvJKtJqnVnzqOoymAUnZOI/fkZ+8n3qlxFB4x7rSl
         6Y5A9QE6YuGGl7F/DwWZlqZYG/QyEBkjLo3wO2WXQvQKip2Xx2XTaCuiIMOqVt0W3V9E
         3Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737902629; x=1738507429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoetCMsPEBTbCiMerLoGw3racvNVfo1MBXT9WyDE05U=;
        b=F8LB1mSZ48qZLdB++zJWB/w7u6YA9tqUarkshCjQYhq1r8AnrHu2ugjKVp3cMteXgD
         Q4l59jW5oPzZckB4kqqbmo8TIjflTMW2IfzB8reHstNMh04e7HeqeCcSfSRhEZipHkSv
         n8fHe+L6PXn+6L4PKuDHugfKdzO8Y4eFwQqg2nhBpE5nMbk+CXHzwtHLBLu3KkDoQ9/g
         NONrFk1hdwn1QqI01KGkYrjvvdxtkhrugT1RX1eOYm2ZDuRIIW1koGcqVkk8yLOFKD8m
         Bg9Q/EIPB7UZt9x2wohlHZ/RYAZBFaYXTNqnyPolq2FAm1QblK4+1qOazyLIsG7PLIfl
         a0xA==
X-Forwarded-Encrypted: i=1; AJvYcCU5fkZ+EWYUEF/L2het3HyCAUhaLa0xyX44G0WwRadz5N1Z5ji89k/y21MlN51S2nYv/tbBORfpWKZSRIps@vger.kernel.org, AJvYcCWUdzXIj8j3ha+uMLn1Z3teVacjIXf31jxWtE+4eF+kQEONMtplGWCN+D27DPk2xi0jAoJ3ruC25ihZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbJ9uudD2GaKx6H3yuYS+/6HApaOoretgbKiqg4TGG7T7KpOB
	ARA2Ll7dzOuAV8E15CmVwP2ft1QiQiRtTD+m01/ybe7JsFFgxhws
X-Gm-Gg: ASbGncuCutMEtF3D5rNFmu3Z2TICN9RIf5u/FprkP+k1PeWYNJ1xDu9+VQ8NcuHn3ob
	WYUfIbeJTMW/FYdxeZu9UWTX2tjOB5xDR/ASi9tJZ7q5mKBULgk2iVs0flB4e7KoR8TkpbX1HNy
	rpYrXXBG2JxvJuDYXSYzOuaIYRePLlWQcOEMfWpAt74y40vOu1iI2tqloiO3XTUMB1MnWXSapPc
	t7YAAX7kuq4rddTVBeAsFnIj8xXkepaGj9i0CznpBasowTIdV7/Fi9Fk52mjJiLw/ajLTc9m08z
	0wdvLC2l7+2SF5GD4vFA/C/lygXmay0D0PLrVOUhquzNqG4Vsfkb3fX3uzzytJR8nxD/JnB7tPP
	+7QKxMEL2sELEtJ5rCr09d9OJfn0p827iWg==
X-Google-Smtp-Source: AGHT+IF7jx68tQrPJmvSWlN4MYEpFKarihrEQc9vlqHHG3Z2d+SLrBe/lvc0awj6MLdcHHGwJDDAMQ==
X-Received: by 2002:a05:600c:468d:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-43891437546mr311593165e9.20.1737902628897;
        Sun, 26 Jan 2025 06:43:48 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f120sm98772065e9.2.2025.01.26.06.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:43:48 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	robh@kernel.org,
	krzk@kernel.org,
	christophe.jaillet@wanadoo.fr
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrey.lalaev@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: hwmon: Add description for sensor HTU31
Date: Sun, 26 Jan 2025 15:40:56 +0100
Message-ID: <20250126144155.430263-3-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250126144155.430263-1-andrey.lalaev@gmail.com>
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
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
index 6bdcd055e763..294e8f9bfb4a 100644
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

