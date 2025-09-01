Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F9202997;
	Mon,  1 Sep 2025 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756763817; cv=none; b=etdTVb5cK+Yq6M/GQO9HCBJvIUSB7DyLFfMsKsh4KJFBXbe/N6f0mIJeIVML/CeGPvfoEP7ZGsUrEKaQG2zrwDxz1GQEAgypDCzviO7aKXEy/FYhzyB+OChfX2e1RVKF6ZOXut+pKwZiV0QAKb7f6lmPwUrpcJPz1fHx0nXdxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756763817; c=relaxed/simple;
	bh=UdbThDd35XS5kTlBPSANg7bURHeZjITCBnVgTWkAmY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RetZh2v2529L3FHQ6MoMAatXnxxCdGmWODLwxwBjbdY78mZytX9ZMpgiY1OFxtylMku/nk4TTLZ3uHZ889jNJGuEXX/W/pwMjXUq2jplwFZIuI4EBqBv7o0NXXjpcAVRNW7hp/zKs4c41yG20+7dtGCW4wFm8EzwsGRMiJ/SRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6DP2eJW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6DP2eJW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326e20aadso5186553a91.2;
        Mon, 01 Sep 2025 14:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756763814; x=1757368614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rr7ttRRfISL7LXawvmUUwtcVSdkKIkQAp3QFqYkgQGk=;
        b=J6DP2eJWk0wnnS1oJuSxXRAHqvjGU/2lKpyKkLJ5gu/qlvEup/u7yVqtGP1XidmI8U
         8ZQDBJoif6rNwPCDmUBiQlj9NaV56CUW7Sp1EijAoQKmFPoTAlonIj9QcoDxlyq6fbzx
         w3AJQ8SCWUcSu1HH83cN+zT/+ZP7wM411Gj9x+tqeiOhVp8IbAs/BFpyAu02uR5n2uNs
         SvR+EcBtTz1e7yqtIqmHUI3IhxTdB1AOc4UNS4gksqOllg1tweczPKsjJYEA/aK+dZgH
         C4r2slxnCtYjUJLLVCkcvFkLdiq4kFtRNrZ/MTZ2LHOxYP6ohAK4n/zX3M5vHJrhie/Q
         Sxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756763814; x=1757368614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr7ttRRfISL7LXawvmUUwtcVSdkKIkQAp3QFqYkgQGk=;
        b=S3AdmCUIl3zsox8rcqmOZUaYGzozqvaeaH2R/7XkKgQhYmgcvgqOBhe0sQAbssC7PA
         O7WENiCaOGyLIUJFdDdQ5SvxRQveJ0vlxDBqlHwnRqnP4PKHTU9llZNu+MAOJhmgXjPk
         Vbi4GVzGwwRf67eKJ/xVSmBNfLhoYr6Lzt8uNTrp+mXggI9QaeZyolI9keQ2yGKI3gi8
         OWSxf1oALjpUHTdzWShHarHWXvY4ZsKP4fcHveyE1TwTHF9dvN0FZNl2B6p+nV7oM4ty
         dHUip3DnBdjmkME8J093vC6FMCpVKHY3rTPrexEut/fdVKHA7LNGicyQwkR0wtp5oPGt
         Z1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIGx7Cs8qeXxJKEWT+mFsXm1nA3Kgm2vwfuPqOHWqfUnWE7jzo4cPanRFD0M1DpVQDeyGKR5tUbFLdvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBudxJgAZwiwtRwibABm3cQ2bmwTHbYUk4KIYdKxxVI9LgFc4
	L/bZSPw6DmkqCumcggrWpB/Nt8SgJ0pK2xYcayihqU2tzlg65wP+ODkZB1LiWA==
X-Gm-Gg: ASbGnct4pHtay5qeSoZWcmpUp2uwlV8gKKemKEBRTgIDugegAsX+zkU1JS01Aclotvg
	m+4EYrBmQBe5bJO24wCbYiFg1ozyWqHu5vE0zusy/tt1gchzuPkX1ou314rFEH2BUM7xJhtMDJ/
	QqGW+ghv5lCjf604AG+wTLG2gdPsHcZxqgRCPSGw29MlsI2MANkicdwR4cUm0Inw7B/7DsLay7g
	PU/bPOZWBuUa0nXHGppW81v107o/oSM3GV7OmjWcSTR5/lHSrYozGqbBIiy3LGS1zjF+DGj9qKI
	wGeHof32eaQ/0jiOeB0vQpMIvxIJWmELOXHbJ2lC+4/VPPqXP0CTMItsZWRv0IrK23xiWAk1wiP
	33fObJcQmAUY48DimN19tX/zInkerhNm/jYSBCyxtk4JBXA==
X-Google-Smtp-Source: AGHT+IEDxOOqY0dhCtISjArqy+nLDGC/4CdQ8M0o23H8a0H2FAof25d+gFI8pVtBBd6VEoHUH/8uoA==
X-Received: by 2002:a17:90b:4d81:b0:327:96dd:6294 with SMTP id 98e67ed59e1d1-328156f9a23mr13697686a91.37.1756763814248;
        Mon, 01 Sep 2025 14:56:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274188757bsm8912793a91.1.2025.09.01.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 14:56:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Christian Kahr <christian.kahr@sie.at>
Subject: [PATCH] dt-bindings: hwmon: ti,ina2xx: Add INA700
Date: Mon,  1 Sep 2025 14:56:48 -0700
Message-ID: <20250901215648.2696843-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for INA700. The chip is register compatible with
INA780 but implements different ADC ranges and thus needs a separate
compatible entry.

Cc: Christian Kahr <christian.kahr@sie.at>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 8b491be9c49d..d3cde8936686 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -32,6 +32,7 @@ properties:
       - ti,ina237
       - ti,ina238
       - ti,ina260
+      - ti,ina700
       - ti,ina780
 
   reg:
@@ -115,6 +116,7 @@ allOf:
               - ti,ina237
               - ti,ina238
               - ti,ina260
+              - ti,ina700
               - ti,ina780
     then:
       properties:
@@ -133,6 +135,7 @@ allOf:
               - ti,ina230
               - ti,ina231
               - ti,ina260
+              - ti,ina700
               - ti,ina780
     then:
       properties:
@@ -143,6 +146,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - ti,ina700
               - ti,ina780
     then:
       properties:
-- 
2.45.2

