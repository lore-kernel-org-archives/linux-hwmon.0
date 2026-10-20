Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514906;
	b=p1CxUWnIvONrmnS+/IZc7dUYUNOy51BNPS//22Fbk10oqRC3b6I0C36/uv0VPTztwD0/
	 ugzGEMXsZgQbwv/GbixQPlmdEIfmfX78q1j2AKlywjSlKjtPCaBmPPie8PYX2L8JuBwEE
	 RVGpALq1FKN0K52OAa2hBvRYkEB3B9lR6YEASlmSl8B5TsPQ7wOM5VJ6oyI2Wy8pT8gIa
	 7/cN7HU3CD9rRR+8/eTV8HgHyp4Wcvqe4ABYnF5leLV/sPQmGgIdlecBJXU6uDhQmiG9y
	 3UBsse+RLm8MG8IcF7NWHriTQc0g+K/NX8IbU09XOP9TTvuPz9fE93wQegyHf10p1+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=jRcEbHIKEx2yVcCmZ34JdeecQ133rotWn1cfe5b1Jhnetg3RlP4NR9wHzKJawMgUy0fP
	 W73YF8fMQLaTFY2IJFB5IHuiMxQ/Hyi2bQbDQWmUAlakjlWUsfoCshkJKY/BEY5BsziRz
	 3Dhmt61MnSDDE7wWfJOskfcwAFGAmfKGfsJoSsRTmmt4f+Yqyoy6UHmB6BKtzmFUBz4vz
	 Zi+HA7pK6odd8gGIGVYv4VOSZ6lShIZwFGSdnldp4Uws5A7KrcW1onWmhu3yiqsiF+yem
	 n0BkLYBG39N4qbyiWmD56/YGktFmJpY7HCyqi+QFldi/QSYeyJCS65lWkA0zqrGXlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAD606D549
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCAD606D549
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so3468893c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514904; x=1793119704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=MpsKsNpUPa9OV+dFwz6mIl+c77SGqOYzrbVx2rnpteX5BPlPEJwM44zo+/HlLyridu
         Wh5Y6MzKSI6U8paCI7G2guImYowAT5lsf6NLtyhhUaIjEoBLTobTeGX1YeGkP/5OB43c
         IXvGDmp4lpSuJzRmU7B2sYkh3iDXc9nsRpOj6CsO4uatd6o3Yfx3G95/uwS5L7ptzX09
         pGi+0u0SPEIPdEvH0sWtIsOWH8jTd4zf7w4GaLZE8yV9l44zRSNh9XGnUTutIWKTJm+Z
         AmyPoRtzB5LxAC9tSTuEAV+vazbcKN1k/GGXqvPT3+auHUE816zL2doQBTUbeLN7AcwB
         SIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514905; x=1793119705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=PVgLNgvjtqxc1gNhK+SOi+2tSGZlyV6nUpbRc8i4jFcTQgZu20kKGJJ+eGqXDWXppn
         04Ix9zXc3jXKAju5RWz/YCWY1r+ZukKx1fjxPv8m8QDhVohi5V93cMtEbYiuLPL5udDf
         VE0qxsDy7M87+X29+PJvocOXONHxBc+lhDeu7005mK0mJA3Ud/DptqGQ9jtTKnYZ6+50
         GbdjRsAbxo9gwFyc6hw0wQprCSYUN7IaZZh/XBdWWrskEjbHOdQksCfvSlus1I6+Biwe
         1a2tsJ1515bVpXS1f8xdV/XeCPL77kRWpATPom8ZwabsZ5vNsJLafW6BARuzYjGaVv/B
         0AQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVKnjTqh2X9DJK9O2Vl4XRI4yVi/rSppm0Ccwz3xznrjP6YGYb1n9KATYa37/EcSU8F1MK4JNk/T6IPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIzWjIqVlRLXBW6ilg4cvRP/rYgG+l7TKd0XoEBArE/awUUM50s
	Mb0Rc1mVvy3Sdc6AQKzNYq4M5drsFs/h3+NA7Oqdsoteoa6sTLQHozJ3fd9fW4qIPgY=
X-Gm-Gg: AYBFou1O5unLAGp7v52y4t/ZGkQfOWHEP+bDQ8PaTr4RbjgqfHiPLT8gzDMgkzCdlzC
	XObxj66gPdP4rYn82JRJjowhRTVJvT4TZqlnpFhiPdd+w1Ltlxu4rynNs+ToQrKojJQYFGjuWig
	l4tEqgesjGL4naiCcZoiYZNWvgQpxppxdJLOPzfTguCr/XaRDdDQ2Mvys+YCCrP2vvjMd+gdx1u
	FaITe/cSdFYf2qHti3qDvSDarH6mIEHCidcDmU9+Em4tjXQWQBJKW6TarFy1scNOBCnoTJOIWfZ
	9XfBGNSfIohfHlxbgxo+gWSiddTEKa17+hqKCFZqSrJjv0A0EHJfUG8hDnKE7jH8+yrp9fWhjX4
	jDZ11TKMC6zN6akq6VdhrvGFzdJz5/m1WuxQBstLW+ev+emcnDLzOYCPMvFCqppXYnZB8flNy0F
	bt6K3NN2p8Mni1GyYiGEGD5p+CA3J4fK/sLJ/fF0XGW4aDtm+SSF2jLNDpgsMnFm8W
X-Received: by 2002:a05:7022:7e88:b0:153:7a27:b7d with SMTP id a92af1059eb24-18512c381a4mr23295394c88.20.1792514904284;
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:20 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:14 +0000
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add TDK
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=YYXyiFzWZmnmcU5S2oOonde7bNLiYUA6N0ss7PIEEY7AN7tqRSbLfGp6g9tqO6P5vmrvGqDew
 z7yU2imn6/8BEoDXMMxHqN9uoxvqj7QFD4cLZ40g0DV4kCszBvsqQKb
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

