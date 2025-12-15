Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E16223DD6
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816741; cv=none; b=ue5wWuD5MJD56ehGJjm2jIGgJ7spRfBlCuIULV7FWj9pDiMx4hK7HdKMdIck3v6I52hL0f8rRK8j8CJTgM8pU0Gxs505lVtr/bC0k4NgVZM5olYnx0CT2VBxhjOD/uQMaN1vq+wN4mNzytnsgcpn4FtiKoDHxzTqzYDoxkFoBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816741; c=relaxed/simple;
	bh=h4KBW+OqWMvRHvXvtXgMj+kYkCK8alyetopM4+3I/yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USULQmQSS4DZcmmKtww/NBBqahdSSxPjLh19TQhq3DaDf+UAnSu/tCLnwAPIni45cATNgMSedWX4Jhx4moyr9yMwq4t9Pd0g4P+cbOCQcUBe1amNATfy99aOjqOZ9hyl4JtTn6j9QQ70eRHmQl0MyLhLLfeOoLHbCFRY7oYmZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=OfUP/ICW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="OfUP/ICW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so44371785e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816731; x=1766421531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRhTYOFBvq7YVDoxsO44nCdQXJPNAFf/GkuN2Aepibs=;
        b=OfUP/ICWkdj/41RG3vUqj76mrUf7etPXv1VDW9TPrcx/pbN/0ZqaNMYefTovfAq9wV
         3gSG8GDVlA8WGkb4XennljmZKT9Z/RdE+rgKupgAE9ynOzGJbZlqiPGhmpSai8gk0W3p
         uYYzMMBKoc7UHytUUyzTeNkoN4zNudPYqNyIVoShBl8b7/SGacT6NopHVw28SMw8Hx0l
         LaHRh1t8Lr9jeU95EHQ8koV0ig+m7rOB4Pq9EG96Z4e3cdYVBy6PsiQXH+aHWKdYkqMb
         /inS/mpHbUwzNkk2NjXNQBGHfdxT78IO7GvrhvprYOc7qAzItPVRLil2MBBtGeAJ1g0U
         0ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816731; x=1766421531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRhTYOFBvq7YVDoxsO44nCdQXJPNAFf/GkuN2Aepibs=;
        b=BWs9bho0txRgCV63mqjbzPho8JyhXF/RfT6LYOvx7LYpVFJYIxee91TKEMwhs2mqkp
         u/LmxRt0q7qT+VI1Fv8R8Z6HWkWc5Cf9+Pw6X8PyTIot1lDpmHo+hGVJ5NXpo73unRdE
         0hftYy2pAXAYvh57IFfD7bM5oILWl7ixNovGePq03lgXLk535FvgZfM9FRs8XOlAH0GR
         wF2GbzNU61339Ig7qgoEPmCHaST0llD4+ZRfALAaKJzbKjyftMExwRKTd8LjrSzk3z3z
         b49PLMccE5c6gwZ4/QThd647J+Uh2yMcbsSmKvspkwi3YPEiAUO7qIUiqVWCNjHrA2Q4
         je8A==
X-Forwarded-Encrypted: i=1; AJvYcCU7lF2H6VRICbUt9DKs0gIo+TLtjse1bttX6dHt0qg3QNIw5D0MJdg1cSBEzgrU5B7ASrquVnpqn+gKLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQW1cxgTN6/IN6vyxO1B5QJWDUXWyBKI67NKRiOliF3rdpgjk2
	ASmC9sU+n5vn8KhHHCPl/3dyjaxFipia613NRfNFhOtLbB3smqwo9AINwcBYpmo1oUw=
X-Gm-Gg: AY/fxX6ErKcHC3jv6fcgGzvU6wCe0yoW3BbM3ZO5/3DAuxICRCcQJPzsFOKdmsKJr0e
	Dxrjbrgt9Tqp3kZyTT6wEzEVbuOIzAcPBMIfsTbJCpsE2CAfzPzmN9qq9SZibocd+rXXK85nQ1V
	wwlxVl9+CuKdJvAzX/nGwGB2cWN3RWqKHtPH3OOkspoa0qH5vY5ic0qJWqtKjAJbvRPsp7u5L2S
	Y8x++wRJx1y0lLhe92mA2MJ0cBL2LB67hNBp4bGaqUHaGfC8YXTYM7S4DyHgM9DF4adxsh1mXSN
	bZ8X1/GZ1U3AOtyllA6GqFwPn2MlVqi7wVh8aS5qJ05AJ3tCOSOdYNAt/CZavAQZ7Z/Vkn5lTN3
	RjmiCPK8KOTI2Bkizms89ILrXwA+jBQ9mk9WCDpfqMRdK5PuK4WUso8rNP4lm1E8epSNiejuhGW
	OMgPSCHvHm1Iy12jJotd1clp3c9tYICBA0pBzSQQd+Mi3H
X-Google-Smtp-Source: AGHT+IH8ueFxxMMyV68FeFfRx9NsSwNlL/Ao6Q/rQdEFzAIzqPflgAc/QenJHtj3S1aXhik6vqKjfQ==
X-Received: by 2002:a05:600c:3489:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-47bd466121emr3483595e9.24.1765816730643;
        Mon, 15 Dec 2025 08:38:50 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:50 -0800 (PST)
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
Subject: [PATCH v2 10/19] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Mon, 15 Dec 2025 17:35:27 +0100
Message-ID: <20251215163820.1584926-10-robert.marko@sartura.hr>
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

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0

