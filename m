Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551734;
	b=mEwCN8eqWJjutk+cdjJ/JJC2YxT2Pe2cyYJVBdPATkbLKCnR6tquSpLzQkAvrWDduZBa
	 J4k3miLrpN7Jtel4TfIntcPG/075S4gdVFa+q1nSdC5be1l0tRRfMp3/2Wn6FlcQqYM5G
	 SWSTMpCob1oL6XfCoRg3P7BTMGU1k6CpFAGhrn02/ViMdQVGHEWJr9R6MftauVs+i7onJ
	 7RgZMEVEfR+h9CF1U9S6y3/Ryj0cX0vMykeLkrn2mGRT+RFvNH5/B5XEIuMSH6UkRsqh7
	 l4KRQh5/MZwLVzEdVCy5fIiROWBNv1ieqMoaNuGlguT5V4aMdR5dy8GdiFp4qCojVtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=V4p6sKoRp4zFf4YmB+/LeRy6TNky3bXHe5mGqFSwlVCkDbd9/vfkPhcK14+MsVcyI0R7
	 EcNjw0+pzRukLUUnARe2fyCRPd6hoF99FpDq0s4Mf5Iwoc1HXRzbj1I/yldLRlVGt5vhV
	 W4dT5xHxP+XnuWsOYAPps6y3LWXSjvb4RXT7oSqNoq/9b8D3M9HN+a/7BNcZnKxRFNG5v
	 FmlIV8hy4gsr3NFZ05dWFO8NvsfKgDMwubg/jm7vNj/LIXqg67rXenDeHwaHYokXzeZeq
	 GClgF8OlN9DNLJQGaQq2VsI+6p3m8bc0Dl3op6COi7Mn/T77GBSvboIwAo0SfWxLFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41743606A329
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41743606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso471370eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551732; x=1793156532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=X8kWAAgGwp0SKv+CFS7ojR51KNSrqnta/qAkbfHkLtuT0riX+O6xGeNfLd/TJMB+kt
         n//S5DfSTuB3UBax1bjyFY8/IedkMSGEBMUZDVleIyW9E4urbhooEfjcQcrDYB2UmeDb
         KXJdCDF5wSU1ufbez/VijPdHZeBSZ41H+EOHQGlh1gTl6qIfJv8VTfND/LHVohkMF1SK
         ScI+He46Fa3sLjoabRoa7RO5t95OBKUFWrkUzn9Xgglz6+Ua2q+pye8dDH5hpJ7ZPO85
         5wJ+jvaQuRjgGQwXvGDv+8FXxSdf/OLIK6nthEo+ioQZeF+YFfcjXjLPkkSix8CrD0zB
         8u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551732; x=1793156532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=NiwdSaxHPq96IQrTqCC+99geOlaN77y0rWWWqUVnd9os/sSQ4Ae5ZoC8ztlrjgdDYr
         duf6ikuYDLz2Maf6dnJ2UaMX6JOIjcXjA73lDA60QfKc3ovfoFTlebvnNA2ZHIg8g8ut
         OG+IVfJizmIp26t8Ub8fO8IVNipxm6oMSiasbvVB7Pe7I9VsyfOeqN8PbXDmASo5NE5N
         66PVhRo3tg8atiqoKIL/1lV3tZUR586lhknMB/wK7cWwugfc69Wt5EsDXXF4KpAuLyiQ
         v8MJCyupq2he+BksKWO/pAgxB0Y0KRvmvXG3zhOgFn9kNgQWOX7G0OCqGo2G32H6EJwW
         ieVA==
X-Forwarded-Encrypted: i=1; AKwUvByCh/XX0HQ0dPl8JLMY0+2o62YY6rbw+4bLDhAU9RuYavF1A6w8yH3epF5bvJ0aO+YZmyU/eVFbKrwR/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIV8dSN1byhLFepE0pOEsn5pYHIvrVCDS06hkR3DGsS9Gk3kMhY
	Hb9YJ0Rto/2G2hImY37i8MlQYh1TWSkDyaPZ7WI3or/iF9tMx2oWQUZXRHhmxBJf35c=
X-Gm-Gg: AYBFou0PbZf+q/yGmM6pUkti6DBeRff5gnAD6u8uF6tIjth8w0S+maDkitG4F49unJD
	08hL2cK0gbF74U3jhnQ3RqnIzlVDpNYVWyTkMLB+ZLBTazqHB3Qm0NyuaHyZgSmtoymZwR2go8Z
	iabuvENyAa9MezChXP8sMVtI2syY1HwqGOAG11WAxY1wD2qdsh18S4KjuXxshpdwcBWjoVj5C/W
	KrnW1pYeCbbxIS8Ym+n8TP82sj1E1WG6xSHSCffO0ePqoxdN+bBWE3WXKWnopPDmgwWee+qdgd5
	X0PYpo9OZLe8GVipOwMBxS1DoLlW4PPvDTIdM2qh0al/dopJW5iLQuZA477V83ZeGCpmFYij5np
	gvGsqPDaMbpq6OJhoOUQ0nzcUjS0hpK4tOK11etQfD2zwtKITPAuxfXwy1jbOqOTasTZdi1rit8
	P1aOgEmKb1Hd9+jQWInYmeI+evdhMCKcxZAt6bMIEEf6oitQGrz/D2D03KdlLPj+YreThkVPt2x
	o3JUoHQlp/dy5uEd0Xu4r08HL/PiY6NqhHy0geMzf27SXaGCg+fIsYw8La/uwqztrY71jfFUhZV
	xDLZ
X-Received: by 2002:a05:7300:80d6:b0:35d:2c2b:215a with SMTP id 5a478bee46e88-3674f11d996mr1956331eec.35.1792551732270;
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:10 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:05 -0700
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=rko2sOAQYQ6YKmixqBcMieuEhqCema6ugmvbB19RSjqYLJ6NH3/YxenCEWl9qOkYndCiSaPqT
 niDkVQkKgGdD5uBHGU+odEvuQ/LIugQuoWlYefGKh2frpz7WWdi9J/6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

