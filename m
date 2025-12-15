Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF7338907
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816751; cv=none; b=lqyfMpc/CvTFevDmHMSKpmDb0KBjLti5fDuVFhxhculLNCKC39DQ0wBlpoI98w2KZl7mpuwFsoKm2UG9Lis8dhYJcgfat5PMptwpGwVEeqV1u4zmZUfu0/bdQLnXJXdIi6G0qHdSGiK8E40Gjrqiv5eirushBwKBcK/rs2eTlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816751; c=relaxed/simple;
	bh=aWtpS5ukM6OTjJwDQlBjaGNr3tNfLPWIVyHdFTQw0ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtmUIpvU5VKTBzGRKoKY8BAWLfpY5BwO9pduP2yOoBDEszqX6rzSmDVCxYX5CO7mDStYuBjnPse6P6JS4ZR3wEUaaVJuvwzUiHWBIPImZ6CQlzjS6o1NcAgpYIIqRa0I6gY39suhnZ7EinbSapWrhPQjA16nsZJj5Mg/4u+tXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HO5Ey94d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HO5Ey94d"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso28048775e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816738; x=1766421538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzTS/0ZyMqSoKPg7ITuPysU9ip6EyV6+iAiPmDW2/tU=;
        b=HO5Ey94dpj6zWOoz0L5L0y8X69hFWvbeT04BkwlyT15jYCnbM2FPY47xRyxUSuPqq0
         CJYW5lrSNVziP6MP42xtzYz38MBnBl+eQurdkmVKST3mU2BBuppssWyfRd1DJcAkyG5o
         nLiKHlcX3Ds2BaedHt4ULkda+iLUJ7HgaENTayK0zbAufiulvaxMUHf/zJoJY50jgaPy
         vf3yqbvNxTUMYaeue/9jMOH6gOiWO9r5tXQDeePfB6H6ovEP277cbCOC+Se54QTf2bvp
         Q52StpqomWhNzdtWO6Nw007VnuvwxvRYkKBjjmLU5SY5IHblpNiPFHBan2jxZDCBPbZF
         zUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816738; x=1766421538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NzTS/0ZyMqSoKPg7ITuPysU9ip6EyV6+iAiPmDW2/tU=;
        b=YXCwne3wA7oPS2BSjqcfnuWAUqo1U+p+gmVNbIOziXnd5CAqKhGn/Xevgeofy5JqaH
         0DX1Zl6S/tGH3LaFy4QIvdaQkDDQCOZ539ltOFc+qaepR+OF7l6MWL5nZVTe+V8XWi2Z
         8VsqpnSAY5hgOe/3ynTGjIXw4mU3aewKlaqzWmEyjBPGidwF/JYZ2ahBHITsIBLQlgY4
         +Hbk6vL1u2lqXX+B13kdIZYojoyFiX/O4g4i5bSwpW2Xh9AK96YVgBAVQXmiV3XuytCi
         rPVTwSejkJAUovY3E/Ie5yW+CmSUDoqNL+8Dak7g2p+K/MYf2umnTc8ny4cMeX6Udi/p
         9Crw==
X-Forwarded-Encrypted: i=1; AJvYcCUWuKeQHRwBnA9L+8IfGn+iPHrwOSoH82EPw/x2bsraE2CbgqN/nQ00InDa2d03Yj9TBmzqXDnzl1hP4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgVGxwZThq6sE0p0Ax71cCPVYwW5uzVTUxa0TDxG/5SmEfK8X
	LC0vrtWlZBp5JB1G6hvqq9HRYW/lddkXeWMzhHp+Kl33ozvi51ovd58HIcuwlq8xmhGwZbuP/Pt
	A2/P3EVOggQ==
X-Gm-Gg: AY/fxX4C8iswnBSRIEI7ZQQYhshwJ1wLJrT+KStwU+AjElvJpMosW5MVf8SRbNEiU5o
	2SXTGaBlB+5pdaL+JPJsxMe9moiZ9MC/P73COBIVRByHfiYd3XR8UZTLRe78I7H9P9Z8Nyyypqk
	R+U6TTXKj0hfeA53haTLG4RieEmqx4E+IOa6Usa0ERmooYbMlgRIsSbEY8WuxWUHsDhEz+YMRL4
	ZmmeY3ADZO1BCjZD5BVtcyUVRl0BoBxCkUp0w3p7fv6+LkAqYmFVdu74OqlwxRdW62+Mese7SHO
	MQOqmBp3teFSOHun+Run43EQM0okDYGD49lsIrwM7a+dvJiT8Qp9W2PUCOP3QCXEkFU4DRTd0D9
	brbgPUcOkMlnhmL0juSREeGfJAd5bs65G6Z7k/eFFmbrZaRuJOOkDSGCGci32VPJrMZsvIhRU8E
	jopaoy+I8Uua3uABinmI3jaiBJn3sqvxfTxrZmbSIEzcF8r/trdCoP6f4=
X-Google-Smtp-Source: AGHT+IH2I2yw55Q0CXhaNIPIXzNi6FBLabOFndmnwZCutK6Ow3Ht3tHRyLRJOxKZGFug1XR5+KxRHw==
X-Received: by 2002:a05:600c:3b8d:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-47a8f89c8a3mr129879935e9.5.1765816737723;
        Mon, 15 Dec 2025 08:38:57 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:57 -0800 (PST)
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
Subject: [PATCH v2 13/19] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 15 Dec 2025 17:35:30 +0100
Message-ID: <20251215163820.1584926-13-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..b0802265cb55 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -32,6 +32,10 @@ properties:
               - microchip,sam9x60-dma
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
+      - items:
+          - enum:
+              - microchip,lan9691-dma
+          - const: microchip,sama7g5-dma
       - items:
           - const: microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
-- 
2.52.0

