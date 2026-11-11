Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413793;
	b=ZKpwlgbXxjI+EBiMEAsV7SBMw/p3jAQ4NEDQKgWZR0RkWfxpiWpFveOWJC7jBLOOMxlk
	 FxxhzlQM83TQ91CwDJMx63ggm/uhlPORej9KjtC0rWwJznFHv7umkGJ/tPEVO6SHzfM8T
	 vjgRdFAb6Pq5X4tYbBmqpjrlcd60SD5rqTLOXcBFeN6VuKU+wWAroaOrI2LoRRIJsbUjy
	 QkewSmxd9mUPOP9MD/8yMILE9jqGhte+/fWyqItDa5VgY0XLsa2H6JlCvw6cERRPZwWg7
	 CuyPRNIDVrfUv+vwD5bK6vR/dbMznfqn8J4P3MRCqovXbEBID472fYGHzQEWf2/n2WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
	b=suppwvBmT5/cMrexAR4lO766GUOSgV5ZtMZqTXetJpRJU0vOQ47oUUxL/SKIbnwPBXUe
	 7BNHQWphgxx28dcEMgUHt/IQVGU3viDABs+uoz3tdEjgibY1VQ4KrmKe32nm6qP+HfObt
	 63X5VIIGVQ0YPezIIdFo+iQRWVi9yyC3qn1OFIpp4q4VfVjQ6uicH/y2vdzUcCOyldxW9
	 gowYhgd45iLh6svohB6DRuBNwfxxZySfokToCFtj5Y+3JrwLgVsb5v4QzuTzkg/knAn1H
	 sjRAfHXkGWMEu53A6BHL1VZ10jeDH7HhTSa8fY3oVi+wQEgHGoCyQPojHSeUbxSS01w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB980606A32E
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB980606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29185915e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413791; x=1795018591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=l7LxDYNQO/ktuoSV8CAdZ5TDHuJEAW/pzLB0sbQ0wOpmhAl7anQ4L1+DrgtEFMHXTi
         qPszFxpwtRiPrtM5FHhfHHjGOOkJbv4lDlpEnSGomlz6tMwSYv7Vcgq+ZndRH8td/Dc/
         7RtyNgIYqr89gQ82DAQnBor2py8ks/BVoCJPCcHZCwfbaozBctN4ATrL6931ZzqdXDZP
         UOguDUjcJwm+W7lEKIy7LoyabOnqyDnI+JJarCo/FLj8HR2Iv0jNn/b/4cq/Liv5MntV
         MZ/TFVTYRhWico5wfus7vRP4XOk4IThG9z5XjfZ7JjecTWNXSXhqcGpatjK3dMs/TPgo
         ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413791; x=1795018591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=rqjWJFet0KCK7qF7/lOOWhp/y+abxyK1f2g/Rpv/kpfkelo6o0bMWhmBRjLu5c7B2f
         dVqXwbAuJSscmuRmFayEbJbkX6JLk9GysEb0by6cHqM+TeGqSsEdnke+YZ+CK/UiRJlp
         qdJeReMvvGzXrXhnoCODL58kwq26RzlPcYR1EDNe4oygKLxLJracek5064UFPBEWtdcC
         FaLd29m/YmV28qOlRsjNNiO+xCWKfZMbyKIPWJEyfgLj71iiAlFqwnaG4aUMLE0yxZTq
         T9+FDIpkbP84UZh4ftKof4rtQVy2db322UxpiCX5s9O460KL69mHvRtXyyk1//bp73KX
         4avA==
X-Forwarded-Encrypted: i=1; AL+hErHae50R09WnvzknWKNhCa2jXxJeL8mH1seS5KULbAiVzAfMhVtNC4B8nxRSo/coQ3i1yh0UHFPmY9LasA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UxuisbizUSOZreutZW6HmAimToOd6bDC2t9W+UnEdH/3sAYkB
	2aR1j+UkttBAHJwiCy5eNPrtzF2N59c9r4B4o2seFHwHhLaOYMnj6jm5NyGjHx5JcuM=
X-Gm-Gg: AYBFou0X+Oxj2daqGYwQt6E/5BLQ95LxVzVzgOTMoOia6MBYvnQjSSL4nCh19ciP9ii
	Ph3zWCqlAqG4XH1E0Axblqf4Uidv0u1ghLikp1+KJeyc/mO2apkMKqOjjvft3DmRD5lwxuqsJ3z
	H5MIogbqfy9JIyB2TkjctyNyFox4Syy1mVFWZXLEW02dK/1h85XK2/2fnH6gdB9tCDXxJ+5my+3
	Ma76zg77fNDqg7PLGGVAz8EjVhsiLTZhfo3PQXrL6PkxZ7OTdNY22wTP3gtvkvyksTQj9jwri+L
	QlXoIRGgXMYJbBex0XgaARKZp33QT2i8Jjwg+bboJLL7pYVEZDwcYvxI79c8RSIlS0zw0gMuJZK
	oVjTJLaR3CLmtlRjIeKZvAmNbUVCJ5UkdikX+0bzENrnt7SELT/x8JqwQk7Pqsq5tviLkupN62a
	07cUNM+Yjb26huqUjnrbIz2/lm8DTsba0roeYY3+tDwsEIbuFLShQ9KyPnOzWnUciwAizrQdXSU
	jTGCCXixFWQF+dOSlwjKxh2hZBPA1qk5Xlym1d8vV0Uu/4rWHuJ9bfufjVxa5unvgRbKkSsaDT/
	/SQHRHlaobc0YYKpF/NG4oEhhsSF03bJ2rvbn/acPfTpL68nksFdP/flPe0xEqqLnt6PEpk9AwN
	uYbYx7lpClDq/va/L/2xUKPuJXSsN9BOBE33oMPAKX1+zetRmW3ELQSBgaBQ5e1KuYT64aBF4Kz
	gJCAC4TThbCjS9JP8S/SiEmR0=
X-Received: by 2002:a05:600c:4e87:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ba0938ae31mr51209845e9.32.1794413791046;
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero pulses per revolution
Date: Wed, 11 Nov 2026 17:12:45 +0100
Message-ID: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A fan sensor cannot produce zero tachometer pulses per revolution.
Add a minimum of one to the shared fan schema so every user rejects
this invalid value.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- New patch: require at least one pulse per revolution in fan-common.

 Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
index 0fb7380816994..63a369628a3a1 100644
--- a/Documentation/devicetree/bindings/hwmon/fan-common.yaml
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -27,6 +27,7 @@ properties:
     description:
       The number of pulse from fan sensor per revolution.
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
     maximum: 4
 
   tach-div:
-- 
2.56.0

