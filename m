Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6693093C9
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816754; cv=none; b=tX7J0LDT9BRZl+LFCSSZMvQq/EV5hyDJZ1+uiVAWFQRcP2coFlp0zMy5d044zAJH/wjJbkNmcaXGnvj79RYdt9ppHOhjTG6FcmNwU4NVVK7Jl3+REAx9kBBDeBV9vWwt61j8WsbdBAtvyDtJ6gAjJ5dBQDwk8yKjJf0QAvCObyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816754; c=relaxed/simple;
	bh=VPVs4jF75VJXH8mdDS9PaTAypaYoWoEKaAjTQEnezGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsXWIhkPlR0gRxmb52D89pXBJbjjEpARayk2Xu2gk5NyWxr3swd4ls0GEO2LuYloJPcPut01cSkYLB7VbgV1+V1bok6jhSN9VmfTj8oLr85zKgHdY30BsIcFMYyRffgDGsjteYQEnaJT2A1YZqWy4lgZtgVrCwOGD2jnz2wUz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=VZQWF0V2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="VZQWF0V2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a637712so24958655e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816742; x=1766421542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0OEssTGK11BYSFNM6Q5GJFG0lDY4xg8K+duT0eXTMo=;
        b=VZQWF0V29r1IgpfaJxCInv8zUo3+O4jzEdgE4tPFejZmplpHFTHeqVt5D6cXNZ3Ukk
         L6AEFF6RG8SFASe5M2a4eiD/KbzxAgbQH36T3jjYKngJbqaWT/TPp/q/OpyhBY1sXQhj
         yIpYTxkVaUCjXyiqskr0VF/Bhig7ipzAFn37azEXrBmSHDP73kWveQSfb1/oJyoZhBqz
         rtPZItei02rqsC3yEHu6GAV6lTw9A7IUX0CoC7l23pFlwdi9C53Jyfagb4uKlZFcbfRm
         cI5aKxlYdr7G1ZK6jgWC4oGsmO+YoJznPt4a0HmkcFxhQfZfAJomZynzewNj9NqRqbRN
         jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816742; x=1766421542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0OEssTGK11BYSFNM6Q5GJFG0lDY4xg8K+duT0eXTMo=;
        b=TrbY+YNQYvl29W4am1vpTSMpJ5Atrmo5ZILV4GySQs5bVXVrtJKuJL2kOzeFvt6pck
         +SdJlT5rAiHy41zgJw8JbAbejaRS9xQr6wb4dD+iLH58Fbolo3xqKtSQkq4Mwe4y2U1a
         TXHRRVUARKydIlP0KqY+1sJxq2+/IJVyWCoAXxN9dGA+c179UBr+bfKihQHzz9+AXKni
         rEpjgfe/brB8JIhMKQSWbprLuIDkdi/SQBO3hAlku3TstkyN0fooqQHePVbFQn0XKjpV
         qP6VNWV4F1iL1a+YiQDObrZFEu5PfWylAnzy0hZrCGCS20B4wu8ysUAkQgpeqy9c+49R
         2zOw==
X-Forwarded-Encrypted: i=1; AJvYcCWVAbgNRFs5etao0yIhg0s4GAA/+4WI+WOFkwARp/Qe09ZCiAssTQ6f19ipy2kZRUU/V3H3obGF0HHa+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhtbX465tFLCad3f6CBxcFsA2T3FmxfdnsbZeW2gpTnnM3ewn
	czBDMbsDcFczrftZWSJceNyOo4LREAlfkYcIw4PZg4BIibH3rPeQwW+K4YcII3G4Bc0=
X-Gm-Gg: AY/fxX74+T2edkhSIEM/yO45vHoiu5fy5torvTcbxxOKeUTAZmafpxfH2F/xnE1y2Ck
	PL973Lung1wqtXRMlWH8DlET74Vp/CxrlBgjKjgG/c0p9j9XlsN6MvmtXeJkwYywkWvvYG/SXpq
	lsxGqdpAPiFAWW3+lLa2tQHFqgHSRUzQoAW26okFLEGMRMjYmU8TGxxWz3CD4ZGyBdB8zw7PQKP
	RK9Gkb8xLRD0N3EoocvN1RpwsoA3BB+j2xZrV/ep62RS2WCuo0noIc4jc2SmOkaUkEC8D89URNR
	AJ6+QJE5gdo6aEnNPAjSBK08xuXcYUqgtGAMwewWAZktUWQR8ao8CuSjIWDRalcZeZF0d0Qy4CB
	z4luba9k2YjJDArXxJYEtR+Z232YCpgScznUQxG2qARXt7aPDi0LYBkm5OKT5sjT5F43j7bDmN7
	tLcGdwwOwCiIZEakUFtkt8spUhdGcWFZ8beEQuaDwTNZ3Q
X-Google-Smtp-Source: AGHT+IGZRk0nLa6XE7JBLcVbJ2etCXd7oowIPMfnZx4Z6qSPahCqU8A7b4zUyWiscDsHFjn+GrD1MQ==
X-Received: by 2002:a05:600c:8b16:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47a8f915711mr129583515e9.33.1765816742452;
        Mon, 15 Dec 2025 08:39:02 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:39:02 -0800 (PST)
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
Subject: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add microchip,lan9691-temp
Date: Mon, 15 Dec 2025 17:35:32 +0100
Message-ID: <20251215163820.1584926-15-robert.marko@sartura.hr>
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

Document LAN969x hwmon temperature sensor compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/hwmon/microchip,sparx5-temp.yaml  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 51e8619dbf3c..611fcadb1e77 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -14,8 +14,12 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - microchip,sparx5-temp
+    oneOf:
+      - const: microchip,sparx5-temp
+      - items:
+          - enum:
+              - microchip,lan9691-temp
+          - const: microchip,sparx5-temp
 
   reg:
     maxItems: 1
-- 
2.52.0

