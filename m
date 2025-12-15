Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DA433A70D
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816762; cv=none; b=E02CjHWorgFuvOW/2Z9VYBb9ZzSE8p2NSsxknCjUs5d9ha2qiASI9lvzGHdvusQEIRaSVi53dLPHzoiMW7jjLtekTgvPUycwQOSsp0gigXfClPPKLV/PBoXhIK4IUGVP1Qno1ce6/q/soqpaLSamXw1/O3EUQB2XrIubLFmQzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816762; c=relaxed/simple;
	bh=gV+TkM5zsztCPBhE1oQ2+V8DbMXqPzezIUs2nyTxXhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkPQ6/OYSlf7rprJgR/pyYVU/abrUe5FtFVfceE5jYYKDVpCOEpSqMndGVfMztKdy9jscxLsdfqBCVMy6ziuM9ImMgP2CG6GJlyxClYOjtal7ysT7zvJrXTLVS2F7D0Kcg4nlxOuXlAaPiI2Vb2S6hZBchDUwaq47x80W7sl6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rn33ZXnX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rn33ZXnX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47789cd2083so19222215e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816745; x=1766421545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tTqTgQ3RTUpDiEW13WMdCLExMtis8Qsfy3jipvKGlU=;
        b=rn33ZXnXrEUhiqrS7JriKukKQKWUMch19+hIe4N4Bv/WJEHSMLxXGFcTjjHxxtmm/Q
         246+I+MVHCghoIhSeZLgpd31ii9B9rbx2NkrrIVLIavwg8qn7hRok7xp0Kkx9vGNyB+m
         vUAfWPLSBxo/J1Wp0eTFbpJBrl0UpvL3gyb3WY4pOZldzUJz1lw7+1N323Vxy/3/nmAX
         rwzoS0btRzMXb+kaIj/HWNEIbWiPMmqWwNGUKI/OxB/4j7lYS/idkTrn6dL2GGjhNd2a
         SP5w6YQMVX1eRB39CoflRlo5pciO8xJd3/gzTce96rknAtQH+YfUNADQXy8Z+3gnXXRE
         pGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816745; x=1766421545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tTqTgQ3RTUpDiEW13WMdCLExMtis8Qsfy3jipvKGlU=;
        b=MKR3ev7CkyqUHl6oFyg5mEcQDgcAkiOLioCo7aIkFqabpzlhwfCsgBfEw1kGEp5FT5
         CoeQpIvsiyO4otJLf2+JR/8hI+v6m4Mc/iq/heehIA4lO2Vxkzb5CpoqS/1h2CB1+OPk
         ipwY6qnRvGhR2tILdqUy79JRoHEDaF/bEqvU5mKmrgCX64crU9gnG5KiA+vtBmBHvx/2
         VCIbKSZwq2tGGoHVLQ6H4Hp8AVPWKnABTnrBwhwcYNPGn7ece61K31jucm2xesaAbtXM
         85X2A4jQYuIP5/0PykpvcZSlkiY5snNkqpM2bgGKRkiN7y4tMwLguI5XWlg9vB5+0Ys8
         xlZA==
X-Forwarded-Encrypted: i=1; AJvYcCUwpMJn97fxqdbuRo3NbdeAnrC5T1TQefcoDxD4VZu0oaF//mf7U7FzKP6R13EZCmZ0N7xj1kCjgYNNpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8CJFHqpQO3nsTbSLYtie1mylUSPRBLkLXnNhHZPahMUJ1O/O8
	azZXnhwGwpkChQJwHv8RYpJtHx21RWkhWB+05C1m64R8Hkcvo5bzwQckIx8cG4yKkFM=
X-Gm-Gg: AY/fxX56l2pST2ACWbC5plI61TE3+pdcZpOFnu8LjBPsT2XdAThQbDDAwRJ0NurH6tU
	AfGBHquQarVem7ghURiyJI4DiCf2CO8HO/q/iPOEr0xgMhlT31kp/g7oFiq9hTb5JcCx7XuhRhN
	qmwYHgvqRmN/dD1012mIDH+9E1LDJ6IV1UbDSvB9gjyUMPJp3DLSRERZ44iI2w9rk2SSkAlnJ5p
	STifRS2phjgitA63D0WGG/y7e0YZjUUj4vnnZh05pVaYD2zGZTddGs7V8740x1gZCAeib4ssGmB
	Zx+wam9pHCzaI2XwRs3ymsOvS1VOCxwOXBlKb6ZoFT3+3LGv2Ns3+8gjjT2oxefyFlK+v5H36y/
	BnV5rw8ueuTjel5tztwyO2SWoOV7u5IcNfs7E7+Cswp06YzRvW2ig2cpTXK7xnDycMjbkCxUeZn
	dsMq2hNvxhVacYOYTpUUxO2nbUIFKRwqOAxbagHAczEDid
X-Google-Smtp-Source: AGHT+IE6M+SXBjy46AfoFYCz7iRvtgEH/vJDLvmdk1N3q4CHw0hjvoykYQUZxdniQx5lw2yIA+Byqg==
X-Received: by 2002:a05:600c:4f86:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47a8f9057fdmr118554685e9.24.1765816744763;
        Mon, 15 Dec 2025 08:39:04 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:39:04 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 16/19] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Mon, 15 Dec 2025 17:35:33 +0100
Message-ID: <20251215163820.1584926-16-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0

