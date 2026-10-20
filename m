Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533938;
	b=DUP3/WhL+5sty5jRvGzQjKeduKFeaQD/nUFLeNLPSEpIPOFmruHw6STzAge9t9yt5SXR
	 tOTQZRwVfevEJ+qAMKfRxv9k8lO8+iMfa4MzryQx8aCb+2/yl5GLeW3KodVWRdCiBPhlC
	 /NQgvu2igNWwtNOxHF4HRAPOhkWnGSzXsRtFpoev+BWqo5TU1qCM+K/Tx/wHLvyBhw3Xv
	 lN8p+N7o3jZ9O9eUz07TFjelySVi35xDoP2Jl5VTyfuK+aZYeVgO28+Eg30DTsWktk4D3
	 1+pOv9ZeRg9y3kO42vYbb9UCw/ZNhR2YLguGGcaRw7cFPc0bBt5pIRnJcZ5clzb+PVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=pOR4NSXHIMZBhiksBZjvs7Q4XDvpA/n79qbtVyXulfI6yZYV2cpJYlbz10RZjmIxTv3w
	 y2SbvFw6EK/s4vMh801n9rezHP9OceOfI3KAYi8WAl2Jv2Ti85Ltny/1ZJ/swCZnnrj07
	 10KLtemudxPf4LDQX3ZwW0MTRH0B8SQII5yZsbUC9puPaOWOeDHU7IRNocMJpTgHhPbuk
	 2eUwlXpjkIRjgGupblfSO1hY5TPtWOCiKzrrqwg2aGbQJZqHm8HnV+zz729Iwty5lWntR
	 HRMboQ8gzKOURFIIFdYjZ+zxB7Ng4uOZ+c9qRV+TJWJ0BHsWAi1B0CdUG+afHsk7tRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="AsV8CSY/";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE6606A32F
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFE6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=AsV8CSY/
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso201060eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=AsV8CSY/FdkRK3D9/1KNe7BgVcelwRhs1z0mHznTdxwQMr2iFbwwUB363Vf/p9W9KX
         8fS00qkgynfdEfGy6SOYp8MxhNrU7cn3ddfa74UpAzElWvKuf139ystaiXV3nCUylyA3
         8qqDxRQh0zGIhkVCWgO7Dddtrjjns1+8/StDLU3JgXwU2YSK3uCqkLdyYylhtJ6eUZga
         Dp/cgvsKpzWR0AoHd9+GAAQon9o1sSSedj8aGuCU24TQyOEB0JymXZ8kS+/eBQTYNNHZ
         AEd/ddl0aYNJzOcDn2Uf356RCVarHLYaN/HSVH5q6UkejoqdNucHypbK05mH9+E/lsbl
         czsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=VI4dh+2GAjjDCFeo19iLUIi1oOqVwfnf8qs4h4aBDKRvlsnbkgvdrF7y5jNJZ3Iq0U
         7xM7TDquHVP4oBKLDFk6n1A9myeQO5lQ2DE7vWy2CY4xqQFtJHj9g6rt/EK6HwPYMilj
         M18n6myI81jokk+Dzph9sH7uGbrxgvrWkYoP3z1xYhIkO8zOI9bCS6NXywML2GXizfQL
         VnyKKls94R96Yzi/hgpGGF9qEgHPPwjUbqK0BwN4pkmJ7hVKEXjEwBcOyN8ZRIyv/cKZ
         3Ep9h67M9mdMG60UKLz5qOJ2vNwox+A/SReI1BOS5QbLI65HU7S4uvNueXvf6vyP6HRX
         rKkg==
X-Forwarded-Encrypted: i=1; AKwUvBzPKotO4CIc9UtRoo6xDq3sLetCKpYOnXH7Rw/2QQ5A41ewnMutdP+64Ka3wlg6XyZX8ymPjTPYeL33AQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdDmtOFIDxDc6PpeHSr/p7H3zZg3l7SaQZcj/EZUQNUsteODEM
	BkRgPzx1ATbSChErff1E4fcsgznXo40UsFkruWcEWwuXwHSpNVAOiM0KAPucCTuMWz4=
X-Gm-Gg: AYBFou03kWdIARLQH/y0VEU8RsSUdAaI6Hxid3Nn7dpzm9O49jZm+wQgivsIyEOyrDD
	yAqRuhBYyrqtu5C3P6ZwUTULrdWRWqla69deqE5WT0CjS/BwfIEFecKwC9uw0HvMvHbN3/RM6wk
	0AgAK/26j8oRDOxT8Y//JD/Rc4Jhyrl04kZXYXxNUQER7AkUjTCA58yY1zknh3Tryy4Dpg+hioS
	lJvoDac2MyMvXAV8UDxAOCd0oS1Em54Kpt/38nwh5Z0imcg0gTBLPp0yF6AAG6QTNz22ceYYEfm
	FPA/JZW3O3AY3vJF5LyT6sUIlLVt28ze5C1xTw9Ar2qvfFUnxOHS1if6e7m/Pou5ljHmV8/RTVf
	+b85Zgm+cCYEMllYroTbkqSMRukCouryBwUPIbK3t3/vgs31pc1TiA7EQ2VP50w6LwAbZoEnWqO
	WAW+5vgKx2j1aC6Frgu104g/p/HleTXh4aZrHN8jrN+zK+LJO7vxa9kDi4L+HOddeMmxJJzKA3f
	rxGlI1z5oL0
X-Received: by 2002:a05:7300:f3c7:b0:366:3257:771c with SMTP id 5a478bee46e88-3674eb33844mr720723eec.16.1792533937462;
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:30 -0700
Subject: [PATCH v3 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-2-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=rZJt5k4qDB1MMTkhJjfIYX2LMM4Ew4G5PDKXZLCBM8NiAQFJTDWyj8o51aUe5b5PQWBLGGThR
 +D+asvvMwBdCTWgGnz439D/A/lN3CURvvsvaFuTkffY1vlFLkAIh0Yu
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

