Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F1333A001
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816750; cv=none; b=SQvRm2wpxyPVi84aajMT0suW4iPqozzWr0PhT6Mwcpw51hzVu3YJjJhVxChR++YUx6AzroCPi1ycomJyHwRHOlA2+Udau27Oe7Ll+WQOWN8HN6AKnYq3/ReDg5ipwD08wljQ9gB/sXEs4D+OwwSRKw2iaVXzxA4cnIfMqBq8zsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816750; c=relaxed/simple;
	bh=yzcerxGw6ZEQ5EAWvF/XHa1fvQNZAbIc9+3T/p54DUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq2tYc2SsMwJg4GsltyMrya0T/pKWDYQFb7011aU6EZazdxua0Tzg4w2SvQNiSqKzz7qhq2P400tbhVLZKl3xjpQhWTQLv6az5Gscalcy0j0Gm04uSdc/SWR6rrHVKWcsQl+0JaHYsZtTWTp+ID2eTP/IdpMHiKX3iUOq7rnIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=wuE/sKde; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="wuE/sKde"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477632b0621so26594465e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816740; x=1766421540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7uXKaE9ntPCAZ2rjdGBHoMUGCXZvwAT6+sIs1szqdY=;
        b=wuE/sKdeZ1o995m+SXaS8gdLHPqBj9GX4ItZqDHLT/qyQVo6rZb3HQc/BcqB9c7y5T
         WAWKU5zNvBo3ukX5igI9stooGkl2JDOJfHn4J1f4AYJLQrPEKVd2idNvS1PnecZcOAyq
         mFoxp5oktt9oRgiksHv5Z4zX/eFmpFXWKx3IIax7Z8kiRoMB+FT6Ll34iiTLPHD+qAzV
         7re8uKM49/6YD+Lft9crtVxLMzWamLgsxkgI/dyKNTW413QTLQSC3Df6Xs8ax13SyOye
         EEfiPyAgiG/5/DD9prlU8lV/UkYUcRTK6gB78zSOSaMZ1IvI6Ok8OZ10nBaYz4uByJ64
         jtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816740; x=1766421540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7uXKaE9ntPCAZ2rjdGBHoMUGCXZvwAT6+sIs1szqdY=;
        b=cgN2kiZ0parWnEZlxIwT80v9XvPGHvf8sovrTW/hE8G5bhyEleZsHwZilqUGum2PhJ
         zV1PZlKbf8VlSlhKEn+a4cJ/2daAO3tI4L/7zedG359JhQQbxFl888zCds62hf2WEZcH
         Pnfs5dxZCasDEt4w2mc3kYhE6e8uE0KE4isbNpbXibwBST2cY4KgSkIjz4lzfSVbw6jD
         LGEFdo1Sifv/OZyI/wORd9tuTttIxEY3EjtmUuUf/oR01CHvat3Kyb163moday6oM3sI
         AmOsN/1FImPibUmN/1uSNkQQsOviq9KPse/Wp2QjI/yxwqbcJjPitVWUsZioHflILJVg
         2okw==
X-Forwarded-Encrypted: i=1; AJvYcCU/lGIC9ywQleTDTL8zmuwWy/DN3COKgi/PLjb2DPGRJJptd/RMXDzTrE8nbB5uBqvWC37RsY5XXddQ1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YznrazYCkBuA/yHgOlRQTM2sZCNHY7RFwjk7ndtCfFXAV0GCmOj
	VLFtYmHqz3L3qiulTyFcAX/UVdnaVk+aTa2hsK6nVTxSYWlCHm7V4Z7/kYf6CH8GK18=
X-Gm-Gg: AY/fxX6WKZb8CdhRxJUae4Qwj6K4rM9gpibHhjyfjrCNqkC2mKzwyMgj8CHlGE6MnmA
	oyLQR1lFAqgDZi4vOeI7kAcRalsNey0NBoqeMMqDrToK8gp7xxLWtOE32CEMciyf/aH0vDdAfze
	2CYMvXniymkuaZM7vY8VDhLmFjkVu75BVBS9p1K41souyZPUmrqWKsZYtW2kFxOtq0Nuos+qivv
	8l8mrD43eYQ69K7mF0NPR1NC8FkAkObantN4GQCxVRPNMsVAUDfRTtzsNR99uqmgb51A1YAsOlX
	/XEl8B+LyAEzxERZhkcsMfAwd6Xd/97+rRNB6liVPlX6YRC6//h7a1pWI+Eq/KqVOOR5k7y0KGR
	TggHioJ745B1KY1HdsOkXLL3QGkHEXr38xTQxT8xE6ourShCTrmWC21Sw5yvxrfweLQTmrQeMtc
	A8i3zHyaESkfeVIOYD9ZO4XSKZKZZKfTnwql9Hrx4Sg+m2
X-Google-Smtp-Source: AGHT+IE8U04tM1LjVUd6BjLQwQ0IIQCLbUIBLs6wp+cysOg55uq2vnToFSgCzvzZIateLKaG+nb0Ew==
X-Received: by 2002:a05:600c:46c4:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47a8f9046fcmr131388855e9.20.1765816740113;
        Mon, 15 Dec 2025 08:39:00 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:59 -0800 (PST)
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
Subject: [PATCH v2 14/19] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 15 Dec 2025 17:35:31 +0100
Message-ID: <20251215163820.1584926-14-robert.marko@sartura.hr>
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0

