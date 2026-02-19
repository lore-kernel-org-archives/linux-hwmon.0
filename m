Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F822B8AB
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498726; cv=none; b=DAjl8uW2Ra1fIH4zyPMrfX8GMlRR0LErkwaxOrD3zSgB8AHqJ3W5wRkiYG/wE+rTsBm/09Oc79U6n7zibW5tJyoBm9qw0J0AePdupo/O4I8x17aPxb0ieXvoahYYoadcOvtwst69m9N2kdoCakNQ5Z6gT9A60p+xSQLVYH/fQcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498726; c=relaxed/simple;
	bh=ErS3wJTAyTaQRYawS6VwyuFEeddf9rFQGTo3AZ++III=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uD/RosNj27d3uaW+hP2VS4P/c9CFarl2HncQukdVYbm6Et5CkLyagRSxeYhBJxB3CpHjj0F3iZ2RjbNemMg/GSqHT8wV+4zPKzg+1LcJSyeHrp9GLMSL73eKgzrR7UAc23hUiqw1NcJineP11B7jKsK0T6UVm2SXLaljHBK7lNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9NO88Th; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9NO88Th"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a9296b3926so5159885ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 02:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771498724; x=1772103524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIriBNBZ/cMMJ/jUXL45O4yEu1LeY7GdlDxQ1g/V6qY=;
        b=d9NO88Th1qNJSS4zNzw7ZIm5YplwKIgH8jXcWUQiE69Qan33QM8abP8eAEUJlXvseW
         W9zf+vyI1fql9wy3jKdK8YkfbK+Sp9qnGy3eFPlXIlAxmU8YZBiMzP5zfsTI4FaEc+P5
         UBTUukuO7QGekn3OoCkY6AK9FdMi6WmkQ8bs6kkJD2qpTbRzXk6KFoY+jJlP2LE0JEvl
         rGew5kvqmEwS1D10E0w+tUONyQ+lg5zAn86nyPbT5lN292ssILzXew1hT4lYRYoBITQ8
         z7KLPAhHj/n1sEZjUj8yRW2O1Kc4/+Pdaa4uQsVk9LnkEMYNnpfCez8cKc2HAtEynrRi
         yE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771498724; x=1772103524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIriBNBZ/cMMJ/jUXL45O4yEu1LeY7GdlDxQ1g/V6qY=;
        b=PEULju3f+a5zI02b5AfeuepD4i7RdcaXIhdQI45JkFswzl8sgxw2XdTatgpwFbvliV
         1JayKmo2tniJycLX5WTIiznxMcdiKn3T4lMM8qWfUal5WdMVIeCrmajlFVzzMfHmGvc6
         sZbcOrY4ej8cZyXZ7tpZ6fry5Jiy0wagOSQo1oRaHoiRWmDSeipX/b3IvHJlDAOx4Ru2
         pErWDWV21od73jjq8pgYKD5FQPj6Q9LLhqO4QdmiXcq/+IStcI+m11O/lJt9xDTfin+s
         3+b9HBPZcrKoTA2l9Mq7/bu4AK1IDIHzRcIKbQHPXh98RFiN9noRU08XBIGeuVp5l+Uk
         7tGw==
X-Gm-Message-State: AOJu0YzRCqerr1OrcoxyPdnW1CbDrr4l/1B1Oo1EGwlbvdFZVNN9W3QB
	DgAH7oYJxe3vexxk1bSAMzPPn74WYGxzf5D12b1o8BvGeGR5AiYV3ha/kvWGmntp
X-Gm-Gg: AZuq6aJN9s+XKua1FXHhYOl1P2h+fQUvks8fAOZSxtCnpg889DBu5iucnf9zfQYwwDz
	TevxvSsB5CQEUGRsWVQz3k3LCL+bHUKnniRGKHsBMXu6gbCskdZH88uwZ85uJV5eNM5DR3zI2aI
	dauZCdVWPoAFFX3YLBYm7ZlaE5TgogxZvKo/yLPrG7QyHimBNeflzzCV81dqoJyvIrlDA3qOBuU
	8ki+EkNokHda3KsbVnbIAOLxvPZPpxeoUFfXQcpVwc0ED8XerPw8dZTQqFrmupIz+Wk1nXHUiIn
	LPbkesWRqe8DkXI/wzyNEOaHRG2cT2roX4iCoz0Y+HguJUEGePBEl2O5ONO5trVcMvCaxMKHr/i
	ROeXXcvikdg5CXaRM6IUf6M6vT5E531LQ8IOGhH6jlBGpIJrdq24/MW9Zh2iz2VtvJgJge/Vsqw
	SyAvkMW1D1sTmcyaD4BBcyFrja2y76QaIZ0wvSjaBHx8MxEw==
X-Received: by 2002:a17:903:2282:b0:2aa:daf7:84ea with SMTP id d9443c01a7336-2ad50f93ed5mr50572765ad.45.1771498724458;
        Thu, 19 Feb 2026 02:58:44 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:939b:3231:1953:3f2f:aba4:9c8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadd9e8sm164339745ad.74.2026.02.19.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:58:44 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v2 1/3] dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
Date: Thu, 19 Feb 2026 16:26:28 +0530
Message-Id: <20260219105630.11929-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
References: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add Infineon Digital Multi-phase XDPE1A2G5B and XDPE1A2G7B
Controllers to trivial devices.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..343f1e62c373 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -157,6 +157,9 @@ properties:
           - infineon,xdpe15284
             # Infineon Multi-phase Digital VR Controller xdpe152c4
           - infineon,xdpe152c4
+            # Infineon Multi-phase Digital VR Controller xdpe1a2g7b
+          - infineon,xdpe1a2g5b
+          - infineon,xdpe1a2g7b
             # Injoinic IP5108 2.0A Power Bank IC with I2C
           - injoinic,ip5108
             # Injoinic IP5109 2.1A Power Bank IC with I2C
-- 
2.39.5

