Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37E338F35
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816748; cv=none; b=BYxlXv1OEepkin9mzy0JGBPfWen+aenb2bbCz/aBIgEwNLwvdRNd4ajLj8BWT7YzJwA/35cCtLdDoU0FHAqbhutjP4pRlfjE1aqiLdtvB70QutEg470KlnxNRK7fCKSl07VkMrSV9mTbfRZtgOZYZUDHqOUI1NkiXn2+LuyveLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816748; c=relaxed/simple;
	bh=E3VI+rCrnmESMLY+TqQMYn/Qmb4uG9OsOtBt2o1msik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTwDLkzLBhD+0CXPgbb+H/nqEiNJcp/IHr7KSfDb/t2Vud566akVtcmQWUH/7PNws+xqROFE786e0gmVBTlVOkRKdF0pYmpxy7AUfzglSI5H7UjJgsbsP3U0PMTGpvERYlGX5xEegBHkcd30TKmGGN6AqS+XWEW2TWJVQ1RfFFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=wO7dD4TP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="wO7dD4TP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so5335405e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816735; x=1766421535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0/OVgNCzmU+9SvTTiS2Q9ByKJcSPr0aQjDQgeNdxB0=;
        b=wO7dD4TPSyGMuRk0L6Ap9dSOcZI1MZ1dmXvZP//4NxH9Ao2EtrEp1gij5AvQqRBoEf
         8/YKWDj0e6ORbpDGL0K2pmL2kANfBBtNcCXZ/FLKXdN0Aak9995tfCaYWT0liApnYAF6
         /k7QAludqmVxhJoPW8yzEenGG98K3ZS6GslinItJqraPWqJ3aAhA2DB7tElRJBStUOGT
         TGig3lOlaSKRh0ClgQL5MNGq5Q++TY3eJbJMEXqClIM2iIQPS4jenSvoWsXF8TDQ+U+C
         5ddf6xKmuhevQI54uTki1bmtabDkq+fkecpTNbUxb3Fr7saSEf26UVilsblB5krE+rZi
         rwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816735; x=1766421535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0/OVgNCzmU+9SvTTiS2Q9ByKJcSPr0aQjDQgeNdxB0=;
        b=B01EMCb8KRoGJkdkuXdD5MTjl0497b/T+vFARWkxMmX5FOB/QtHFDt/aCJnhdb51ts
         EnklaRDD9lirApNyCU8AAQ1TYIaVUx4H/7LZk+fZkfs3BYMCsO3akvefSnpv3IIgnEuJ
         14HykM//XYSn8R0s93H0Hi3G/6pkNZ/E3EYHmy3JAM7cBkDUyUfRm+28O3hu7bXmfEdm
         ba7/alVidJcfXfk9Hrzfd6qfPyQ8snczO/Q3Owxc+KLWKGmI53vpqBfQyLprdD+e6B2/
         ff7nv2veXxC4Tb6nO4oHJ+qoLAhlYDfJR5mmSlB8eLSs1f6CWWqxX7lojmLQptVAAaue
         vo3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLaa4m413v0uYEW3wPA45mHVuOZANKT/WhPq0bFzzpWkxNOFd0RhA+bnZUfptG/ELL1sAyNxpTATzMCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmmL3VFfIrdte+kW2TYXfTYg5vBB8xrnShcLNQEzU4QnvwISzE
	2Te5b96dGJ/PdJdglaKowrIYSEza3GZG1KM8DZAW1X/eBOufIfXPqdwPPl9jKQ1KpZs=
X-Gm-Gg: AY/fxX5K5nRpiGWn24RGqQjcOnnuk7YWw40NTm5yu91oQgygvXycmYtYLagxk5j2c1n
	dCRz1Gzr4vKux0fgZguNfA90gPVcM+oteb0/fl8ix4Y4nDxkCPdEL4DpEmfi/wPIyPpkzqb+qUM
	C8AEJmGWu/akZJ/g0AirHJzo2FclaMYBhubPMpGYLBMFnp9FnMVEtggJYxyUws0r/Wt5obrlzqR
	+xbVt+J3oHn+QWlHaU+7w/fXl2qBd/7N9B8XXMgcQFCC999swZYJqciZ6Flgl3VeEpdMgG+CDTm
	eGzheiNltSr9Q03VxZ/SZStSxsTRuTc1Te8DddPlrWuhzs9Uj8TYoeTKq/dhYBGpldLbf1Nhg9M
	HJn0Lt0onpR8vIzX1fl4gAXzfyn3QMEdnmgkaTSz2R7OhYjhxGeboJPFfsXhDNgkv6gXo6P24rX
	FPOFi0XBoRODWCc1EeZBoLuFtXUHNOU+96ulcI6cZSZDbJ
X-Google-Smtp-Source: AGHT+IGUYIEgjlTnPr2tLcPVUCL9l3M6N90prpNBbolsxQuhh1uHZmWWgCbqjrFvhJbCg5Xq2mMw6A==
X-Received: by 2002:a05:600c:a012:b0:479:3a88:de5e with SMTP id 5b1f17b1804b1-47a8f92029emr95523575e9.37.1765816735298;
        Mon, 15 Dec 2025 08:38:55 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:54 -0800 (PST)
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
Subject: [PATCH v2 12/19] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Mon, 15 Dec 2025 17:35:29 +0100
Message-ID: <20251215163820.1584926-12-robert.marko@sartura.hr>
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0

