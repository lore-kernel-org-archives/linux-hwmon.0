Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29342065;
	Mon,  1 Sep 2025 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742347; cv=none; b=B/dKosvZ+iu1mv6i2Bne6ajLswIWt0b5+wvu90g92id9y4LtJATcXUp/c90sAoI+HWu6n1jL+rKN/PS+FK0e0+wwvJXLDpLLJC9+e91Q+1LlA0IN+B8ufFgxCc4FbDvLrghLz9QfspSg+QOX/i4plQ45GqMafPGq2aE3X6YxPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742347; c=relaxed/simple;
	bh=hT1kHHuvrD686EMcv1ezHh9tXjZFUf8055F3x+8es14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmIdeMglI8HcEkeHEzvGXLyQm4cRuZGIPYOVOqaaRDWFc33/prowe/omxVFMb3VLhKYaKSsp0WBv93AEZiTXjFc6veOcysFz2gHcqx4Fgf7j5LrmQMyM3BE+VLpmeDJDE8gIFYY9sHHvXL1WPoV0Hl5Bg8mjSxTwviBs4Em6xIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSnAAiOU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSnAAiOU"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7725147ec88so451698b3a.0;
        Mon, 01 Sep 2025 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756742345; x=1757347145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DyUOgsjEiB/zX3JIKPVQ9zqAGyRqrBWt3tQ86bxb2C8=;
        b=LSnAAiOU5HRu/5A4ww76sPqZ/QqU+TrcsZs8YMn3SGZ43Jj00rMb7MG6yp6mM2r7Nu
         HcovGEAp6UKdH1+RyiOc1gj2D7ZfTTKxsyVZotugBCY6bSpRqcee1HRq72v23WUWl87i
         0r6DLvzkz43Ss850qjNVNQbCplHQzvmumU4PRNRobp5aPnpByHS9KVcL/k8Y4XsAJPBP
         sK08NpB4ixALvm9xssY+s8Zyjj3SxYlHX5DKOjfaIbT6RytcQWck3MLpYWPtoOZSY7Di
         mIfN4ul8iVEvxvKlhceFoHrzEJTzIdgJZJSVP6Uip0pOke6hhe0vLxl/4Jneg9erKkYc
         uUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756742345; x=1757347145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyUOgsjEiB/zX3JIKPVQ9zqAGyRqrBWt3tQ86bxb2C8=;
        b=PNkvZjYKLQSxMvzHO+kSnBfBvQmqYINtZV6gYNwQ7HHqK0okiePKUrKopqOq9wh8bz
         xgTJyW7JHlRHFRgBaguuNu6HwcGnsSjWm3SgbVnUo2GCgoCS0JrHE11TdV00XElo9c0n
         UdI2zRrq/z1CbmZV1pjl3pWasAxfw2u/aIsswt9sgtoYXzXnG75PXp9qW2AehfaG9RAq
         6gIbgfE2cV5qYM+zsPbeYmaCgWV8jRW3xLeso5pYjubFFsTzuM1uRHtGjnaDy7T21HlE
         fYsBtUiaXJHlNjpn5dHg9TXquoTNpX1GPdURdtztizCUV5Lgg9nNqkROnecRnMZ7srrs
         a4Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUyPjk0/JIo88W06tpNK7alOPn+/bAp1JA/ffjCyEsg/OIXnJMs8tGNlRWJk5Pg511kC9GODvzQ2snxHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KCfkcuzYJZwazW6p4qklznSwY6jxT+2vUfjsWfSqYwGp3PQW
	F9pGcZ+L09B+HCzpknviTw2om8Iev7HoHqzOb3t4il8+7IoIiWc+0X8URm2klA==
X-Gm-Gg: ASbGncvGHZay1Ncja6Dp8G3aNbXVdti3QoG6PwSgcPbFaSbg4z3gJZmX0QWqq2zrCdV
	XyobBXq7m4BpCkdF3XSyGbsYELoVvcJYrNHLqDk2BkzsM6+oDgDzVVkwyMfCJeBBaD7O1uLthK2
	sbO3AdhoNLe3iXlPBMSmK1Faw0F3i0bR+EIcNZFGV/anbVGfMSaMtv5uySJLvUqmVyvAL8JsRBL
	G5m2HQ8TSCZVsbSoaZyy7o9bORb/PVuL5nv/8fu1n/JrT8faOSqT5YOTzNN2424QCLwdiCj55x4
	J/1DA5LixT2g57qxUn5a5UokZYEmuNO81nttYtMx2vlkJDzkAcfe6boVPvYRwyyFvsJzRsklwlx
	rU/9fdu5MhK3OQCwOOaKIrRiiTOKCwoJYOPY3/hpcTr275Q==
X-Google-Smtp-Source: AGHT+IFVJAQ6KwIwTMqnmzJYlChm3g6b/78/Wmqayf+kbx5L4k0cBeqtk4KsJAw4dE5khpTQT7foPA==
X-Received: by 2002:a05:6a00:2314:b0:771:58e:5b1e with SMTP id d2e1a72fcca58-7723e387aadmr9337270b3a.12.1756742344755;
        Mon, 01 Sep 2025 08:59:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772306a1870sm10091513b3a.75.2025.09.01.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 08:59:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] dt-bindings: hwmon: ti,ina2xx: Update details for various chips
Date: Mon,  1 Sep 2025 08:59:02 -0700
Message-ID: <20250901155902.2667063-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti,maximum-expected-current-microamp, ti,shunt-gain, and shunt-resistor
properties are not supported on all chips described in this bindings file.
Update the bindings accordingly.

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 980ecba6d811..8b491be9c49d 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -115,10 +115,39 @@ allOf:
               - ti,ina237
               - ti,ina238
               - ti,ina260
+              - ti,ina780
     then:
       properties:
         ti,maximum-expected-current-microamp: false
 
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
+              - ti,ina260
+              - ti,ina780
+    then:
+      properties:
+        ti,shunt-gain: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,ina780
+    then:
+      properties:
+        shunt-resistor: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.45.2

