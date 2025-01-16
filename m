Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA622301;
	Thu, 16 Jan 2025 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018086; cv=none; b=uJy3EL04FkwFNLotTs/QQDfvIKpUAEfA+TRFd8mbcDuXmwm//2dAoLnVLUwoebWVG+Kk35Cj5KSvBF0hFlZilNH+N6Zzuk0ZVqHFHqFAsMzJpnehhkEXrh340pXmlf8ehKSfMnF21aTIOE9DhPnZzo/hp53h+h4n0pk27Tswo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018086; c=relaxed/simple;
	bh=JAYaH3ZjBaDzSUnkJQ5/O4ZKTdx04gpprNGauvuOBBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YA02nUo3y9GdHLxXV/Vow1aybYUMl3mG4ndaDGrZStY8+I6MKF0BuELHPBSoCQka4hX7maNVfv3QymjAvPy/i2B3awvHejIA249chNYf0T9UhIXilMY6PX+mKppYSgB5XPedIIXr4qMfluTSh7pm6eeKIsu0NHBjOd54ndYJ5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFQGP0FI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFQGP0FI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216634dd574so6717645ad.2;
        Thu, 16 Jan 2025 01:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737018085; x=1737622885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTm6PHhAUwMc2jHmTy9LvrLrIFHYHub+28o8WXlyyfM=;
        b=aFQGP0FItKqqBXocRCIH6ypUtaCKJ3hbnS6r/XbnsyN+QLNqwzfnhHARXDR90xQ6jR
         /Yr2TdR43dcQTMCKC039JQ95JoglpNgouAKd1/mm/vjRJxq+KqxUNV2hCOTnpbtokGIT
         /15duvLjzaz1fyrt13uKi6yfmHA4EiBmWGEvc+mTmy3J2KT7rWlGNgywmTFYXRaeAuyi
         oTuIML4B6ESnkmY8YAUqK32Ld7PafFUF5NdSPQaI+IhaW/FSwj4wWePAs8UN2xdGssED
         9gko9PyRSwvBAITpieqWmvXxycmhzOyQSmyr5LRcJ93swB+ZS4WcXxzSM6WXooTIUUG6
         7zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018085; x=1737622885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTm6PHhAUwMc2jHmTy9LvrLrIFHYHub+28o8WXlyyfM=;
        b=xIJqAFXiozvFY1PYI/G1F2ttYBarsoMHUx6ryI2ErI6x96B2TsjXxpvXyLxX5AWu1V
         jgR9rkBSb3RayFZ6t5ZMppo+H5W2R/GRaMA/dbAxBTSkQNo82TqHtEb3fbVnTh/5MMNt
         b5n82jzHIoHaeak7uS6wI9bo5sezwYOW1DO3qtbZlgz9kVdLYrc8NP3YuUsKxkoICecV
         737iucQYzJCbx2fpLx6BjGeVUWtoE9QyaIjlxiOg8juYDnvxHi3gQmV6a/N7J0XV1JQz
         YsADY/5xAWbTyxY0AETYMVwqoL3w5AOsrum6v+rTXjfGCMjv+AyG9VFj1YSREONfBoSV
         BwUw==
X-Forwarded-Encrypted: i=1; AJvYcCU71rDNpsOt9a+KCeShweIQCYTDczwNqJk+EALQwe9nLlVOHb4sEASJ0n4xCd2SexJP1n1NAtXt6FU+0uX/@vger.kernel.org, AJvYcCVOxdRaUlZ/S86lO93XeCzUem7utqI6X6isNZe8naVXTiWC3rmCOTvr/+tmJ/kWpNPvNu8kaNVvWx+loG8=@vger.kernel.org, AJvYcCVu4wqXbfLKfWsu8WwH/zAiB+Aw3XzKwNbTgly+eaflX5tBg53ItYePoeqUV3dCoW5pM0TDGcPhm1mj@vger.kernel.org, AJvYcCX2x+Y28wEQRphhCoHq90uSoyK/VTvH5O939G/y+L1emwVkK2caMXkuEdr+EU4nwmE7skaXuYLG5CoJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2r82WTtnTmPAGT0xqm1VY2JCzt1RwSi+KXubG5U8jgowbC84
	wk95KPj4UvKFzlsdL1Yvw2Hw51Ezxtp+rF3IwO3F4vW9Lk9wtMZF
X-Gm-Gg: ASbGnct6pYn7j/u4+Vve0GupbjDr3b6WdVTwaLvVZTas0V9QOmE+C1jYGSA1HHqWmfW
	j4c35AzpTowCpcvJ+GovfI6iYaMMXJP9yTzNHGT5mDW2/F7x9h2l3eiVDUmNNLPC97Grfj7aL3s
	n9t+Ia02tv3BgbidCPWjstc1xtL1c1JOYcf7ku8LsggBTsFd6Bvsqz1FiOqxmT8TFMh5QFqjr2s
	e6lLij88C4IHTo+px7/DtiUOiZQZSNSE4udKWTRIrZlY51E0hCvsAZCVCRShdEw3++mxHK32hC5
	a7X7aX9QQOCuBJ++tVZX4vTO3CcEkZLTzrxf2Q==
X-Google-Smtp-Source: AGHT+IE/linAyiL8fx9QETBwQ7HD/wMDfPkr7b5N8Tt4Y12egU/jaj9pPv6G8VAJcJ5mDr9p/4L5BQ==
X-Received: by 2002:a05:6a00:854:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72d21f178e9mr47797676b3a.4.1737018084703;
        Thu, 16 Jan 2025 01:01:24 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40594a06sm10395721b3a.80.2025.01.16.01.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:01:24 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Leo Yang <leo.yang.sy0@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Date: Thu, 16 Jan 2025 16:59:40 +0800
Message-Id: <20250116085939.1235598-2-leo.yang.sy0@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
References: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TI INA233 Current and Power Monitor bindings.

Signed-off-by: Leo Yang <leo.yang.sy0@gmail.com>
---
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 05a9cb36cd82..7372e282765b 100644
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
@@ -75,12 +76,41 @@ properties:
       the alert polarity to active-high.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  ti,maximum-expected-current-microamp:
+    description: |
+      This value indicates the maximum current in microamps that you can
+      expect to measure with ina233 in your circuit.
+
+      This value will be used to calculate the Current_LSB and current/power
+      coefficient for the pmbus and to calibrate the IC.
+    minimum: 32768
+    maximum: 4294967295
+    default: 32768000
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - silergy,sy24655
+              - ti,ina209
+              - ti,ina219
+              - ti,ina220
+              - ti,ina226
+              - ti,ina230
+              - ti,ina231
+              - ti,ina237
+              - ti,ina238
+              - ti,ina260
+    then:
+      properties:
+        ti,maximum-expected-current-microamp: false
 
 unevaluatedProperties: false
 
-- 
2.39.2

