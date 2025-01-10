Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22810207A37;
	Fri, 10 Jan 2025 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496976; cv=none; b=qB13nTjfu0TKwcX84lZjjDIi23wGKgG47FaoNkQ1iKq2hXwuJF0B+CJxTcQu7JjqJBoFSaBxOlJ0+0SwfaNrP7wXiQAyx/mEVQXDBI2F8KnH8zzpNSdvSQvzE5yj1O+Pgf/j/xLvxdQElpV/W7yl4p+Xvz0zLvwymOSBCDgbuGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496976; c=relaxed/simple;
	bh=Kfr0aYYoMaIqOA5XvC0Sy3w6Z19lPMkFWo2IoQsZG4I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L+r4VkfVMwlTP4AQmctLCeL8EDPHrXXg/+FlarULiferK+9gDgpbxXFrSScOlaeAB6mE7DNJm3LgJ8CNFues1uXWVo7GDeu1BlhZl7CHGu/AC8mXJFiQ4pquCnWq1P9DROx5H/dr4ib9FNRd3oRRs2nem7I0HYxkt4pk/I8MDhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4U3OwLB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4U3OwLB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21649a7bcdcso28097805ad.1;
        Fri, 10 Jan 2025 00:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736496974; x=1737101774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ju1jXFM82sCxf61BjpRyneeOEGcjOWcGi+5WZ1e0i+E=;
        b=R4U3OwLB/1pw1hwBDPXGJuBn5smb9afmiUjiuzNjfAnkn7AU6YWJkJ6jZffdAGfEJq
         aVLFHT0HeZvOpPasWR/7x4j0exIQt7JX6sLgg7GJbyeLhYpCr62mEl1QANgCZIRKIJ/W
         fNn06i+RwPVz90XfqJ2PPk7dyb26gOhoVfsOfgyxbvKjHEgsuAG27Wje5YjYnbwfaLl2
         un0APMg08daJf9D3wsy965GP+6XluzDOGNu4DQsnEjFsfNEtbw2Rnujky6lxyib4gPBe
         kEn3cg8pZg5dgOJHHlcJ5HK5/gYymzilo2hGUK7CU7Pwu2fwv2yo5eRKpsr+CR2jpxLQ
         otYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496974; x=1737101774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ju1jXFM82sCxf61BjpRyneeOEGcjOWcGi+5WZ1e0i+E=;
        b=LBRq9OILNeRznGCq4J5h80WEKReL3Jz24haA1pHmgfysPU1G0O2dSanbhbadgQF4G4
         RRpmKDY4jGk0u6tPcH+xZLn6ozaWv2iwn2Zi3lhn9oKGdwU/1bVBcZTWtjDkUEPu1DP+
         lFr95PfJrZVCPlMQ8aUOEj/9JIMhqH3iBCVK9oJddPhUt5mR0J4TYm2PJB/20EyRVjTG
         +/OoA6SaHfYy8qe//Dv9tGaIT0Py4P/qJ3GP7DpVe6WFvWY8rcX0WdY7SFqcU7aUy+K9
         LdtfE/Ym91Du9gh6Pp5h1JKZKaWkW1FYHL0PMViAAUpLF/XCer3GrLQYFUN+h8GdJGpu
         BINw==
X-Forwarded-Encrypted: i=1; AJvYcCVHTUi11kWRUENX7WtQDl7XAZSXj/t3wzkKoOXPql0AYd+I4SKVtIhn2TgisvXsPbbuuSU7NASE9fF+@vger.kernel.org, AJvYcCW1grAy5YOVD3KfkgHJH9k/iZbEHKEMg+rbCQa8E1oWq9Q/8IPTYibqinX6yxPU5FmCuBhgTOfMO+RE2rlO@vger.kernel.org, AJvYcCXOw8k/ZnvrnwE6fVdLsUC4lDKjEiEDm02++uPhB60HjZoIhucMengG7ITqMgt7AHpVm6ql2sFbJ6Ew@vger.kernel.org, AJvYcCXgnYdbuyWxOwCrZMtsG+KoHda2LpQadhDsu6m8+6AlzyIgFMLnQ8D6nu1RoQ8TAuxyFAeHMtxubabJWlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCVfkmuhCgEju29uCeZ1fiwLdBplWCqUkuz6yGvg8jjT99E4zM
	eBvEuDAeB8kro4j0wtWTpe31qZhfxeuc+5AOJa76gzAigQdPE7MS
X-Gm-Gg: ASbGncvvtqkAT8+/WU7xGd+R4/u8WKk308upTENqz7DBHONy2tjETsw0pIFPMouXIbJ
	g3BVPx9FE36RHmmMXMSdgeUAD18K6eVnMYBN7t46DPbhFk56axbKM+oxo30nJt8WUa7ew7AkM9G
	YfgcwL2wpsMuA9Uxs97zS8I/ITGT+pG2q+eUW8/y/6GcOplN60gtbq0RouyEpwBXDATzPRwgUwh
	GvyZ2wFpjszILM26AmaFU+takbbvAlkyERWQ92fcXzx8UTlY5+WdZ5xhRreALp5y6J2gS3ITlzm
	lbXas4XKA3aKpTaE+eD5mNIao8Yoi7qLgNiE
X-Google-Smtp-Source: AGHT+IEYprNqSPRQxSFcgmsCclb7L68y1E0u9GzHXN/JaUiC8lrqOQMPc5F0uZsGHJYrxEP5ydS9HQ==
X-Received: by 2002:a05:6a21:6da0:b0:1e8:becc:5771 with SMTP id adf61e73a8af0-1e8becc5859mr75967637.30.1736496974377;
        Fri, 10 Jan 2025 00:16:14 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de806694sm2431837a12.69.2025.01.10.00.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:16:14 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Date: Fri, 10 Jan 2025 16:15:45 +0800
Message-Id: <20250110081546.61667-2-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250110081546.61667-1-Leo-Yang@quantatw.com>
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TI INA233 Current and Power Monitor bindings.

Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
---
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 05a9cb36cd82..9759c69b904b 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -27,6 +27,7 @@ properties:
       - ti,ina226
       - ti,ina230
       - ti,ina231
+      - ti,ina233
       - ti,ina237
       - ti,ina238
       - ti,ina260
@@ -75,6 +76,22 @@ properties:
       the alert polarity to active-high.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  ti,current-lsb:
+    description:
+      This value depends on the maximum current that can be expected to be
+      measured by ina233 in your circuit, divide Maximum Expected Current
+      by 2^15 and express it in microamps.
+
+      This value will be used to calculate the current/power coefficient for
+      the pmbus and to calibrate the IC.
+
+      For device INA233.
+
+      e.g. Calculate the Maximum Expected Current(A) / 2^15 in micro ampere (uA).
+      30A / 2^15 = 915 uA
+      If value is close to 1000 uA, can use 1000 uA to minimize rounding errors.
+    $ref: /schemas/types.yaml#/definitions/uint16
+
 required:
   - compatible
   - reg
-- 
2.39.2

