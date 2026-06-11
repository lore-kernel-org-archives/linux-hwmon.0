Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9E3CA4B9
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172072; cv=none; b=YvB1QjGR0HZDmPb65kyd0kZA3LyX97w86sKlL14y/TL7zPIQt/I4jI3Lcq7GkV7Rkdu2YaekAsKhck9Lt0v4oVxUGyhfi7z+BhCFffeqX1YY7E7KbAxz1kzyFM5k6W7oYgKKOyAzlmnmHrftQkqsswpAxRi4mganOGAx0vyQmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172072; c=relaxed/simple;
	bh=Bkm56OYbKvczkDcJy+zdbOeLoWcfn+X9KiRBmUlNNFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpgnxKQHy6nWENOYEWG7wdI0E73nieEKALTB0mijM0QZ+PxjnqJsolhk2hpHzdZVxP2hMJ90qNG8mgEkHIUSfpj6ugzdFPKy122lH6OYzmtzGj4UWLbnA/DKqucywouDj5LzjCZG1CltOKHNa8EsY3W7i2gBZHu11mVNJ9MzoKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3AAyRpB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3AAyRpB"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so3170888a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781172071; x=1781776871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9j8g0i8AVrT8/B0nHX/MRisL409ivSz2STIIFpZzbQ=;
        b=a3AAyRpBo64ABAhBd21Y1NfVV/4iR1w2L0t5P4l/6xPgyF5oi6Rn/zcEPAsKpPgxwb
         Y1VAxusnuecbbEoej/LFiiVreFH5tFiKEFqUDiyagV0iErB3m8IsX7pjS6abigpFztMS
         /qZIOAWoaVXw6M4VpMU+mbSTgAJ8LpiN/CsAQ9eqr2PBKEqoO53Hq4+JVD+BT6n+5mDT
         m3gqHo/Okv1B2F3ZHgu9edrfIXQhK7qUMWOeuGBi3bGixj2ljJxKvT99YYaQHf+QiQFu
         J87sS1DnggODFONXxuvn393sr9SRVFS+9YbduAWp2dFckIeLGGcBZoH8hxkYF0LIJ4gK
         k9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172071; x=1781776871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9j8g0i8AVrT8/B0nHX/MRisL409ivSz2STIIFpZzbQ=;
        b=huvokLjWwzH1Xqqf/XENA8KVumB0NSqW3otMmGQd4A9SFp5i46EF/yNQ9conLl4vwI
         Yb2Pb6a0+HyU7zGARIRfprwfN8eQtrUfb0uqRAoe0hLr4e0mbp4NusHQNymftPCBkHr6
         VFmu49DQSLDdmac7SVlf8XE6EOfqorB/m7td+nB7fUWmHFG+DNKrR1OENyAqTXZk3tzK
         NCfdVcl4nQMqt3U19WYHYkw0XhMGWDO6TZVEWRCjYFFKACZ81PbxbI5hIhBEXiXd8Hrn
         VGAMzYQXjFtEhskgdX+VIE+fAs8BorXFfWakahEeSJEPNbRIXiF7VDb7a/v8BauU893o
         V0Bw==
X-Gm-Message-State: AOJu0YwkAtfHbT0WYzehWzjJ8v+x+5oEJgZ88YCmWSDHQEf9UaEMZadL
	M16VEbngrvnsAcT+/I9rpSKVGl8o7Ux0gW5IBuLW6G8YTgVTgfu5GkYs
X-Gm-Gg: Acq92OHeWdey0qJysmePQ7Nhdm9gDM4Jpeiue5MsVIQ5miV9S46ekXusfg17sm0OHR3
	qnJTpvIkPnzH1J4USNmM3xPkkc5WAJqluEOhP5oMWKR0XNhGTpTBRZ1Sp0X8/GUGsOo3/S+DU2f
	uyPR3IyQWfMwLBPQJNIxYsvAsVgA5Qd4F6yzpVh/NHMJ2iBuGzl50oZvY5z0+ty4oN+6sRDVt04
	mf/GpKz+DFej+cPSFfVcVh/BrBqK9IBulrOx6HesFuD1mZYd1fB8WHi+Qni/as+kMSbUilW5vEw
	cD+3h+b4GZHDA6o4mHzbZA+UirHCyN6/DazFQ7SOurWNISq91V04FD870TCduTTueo+YCw3mB0G
	YvuTbgF3Vjxw3Rjdedg6BQg3c6BwpQobo3Ma6yUyNNSfnn19GbvhOWuJS4/P3pJoaFpXj0oZHuH
	uESkyeXMXcIrnU8nMbE0fL8vRaZk9GyHgBRhPN/cy0B1bxNYKtd6JYNO3X95eEu55kbFikzAK2b
	Hk5
X-Received: by 2002:a05:6a00:3997:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-843367c7b55mr2563934b3a.5.1781172070668;
        Thu, 11 Jun 2026 03:01:10 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c92edsm1458228b3a.32.2026.06.11.03.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:01:09 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 11 Jun 2026 17:58:44 +0800
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
In-Reply-To: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172064; l=1259;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=Bkm56OYbKvczkDcJy+zdbOeLoWcfn+X9KiRBmUlNNFQ=;
 b=HKVit0bYM3S4HnTyk/8X6vYEEfgCX4OWtNBj/gAbkH0EATS1l3ISrJ1Ljs3WPYTqVrY+awYtr
 2LeJ0m1TeDdAMTgPJEu0LRwfeFz/r8P6dGwqpx6EJfNQR7p0fUAWu2+
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
properties to configure the device's Current Limit (CL) behavior using
SMBus settings instead of physical pins.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index a20f140dc79a..95ea7c26dec2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -46,6 +46,26 @@ properties:
 
     additionalProperties: false
 
+  ti,cl-smbus-high:
+    description: |
+      Configure the Current Limit (CL) to use the SMBus high setting.
+    type: boolean
+
+  ti,cl-smbus-low:
+    description: |
+      Configure the Current Limit (CL) to use the SMBus low setting.
+    type: boolean
+
+dependencies:
+  ti,cl-smbus-high:
+    not:
+      required:
+        - ti,cl-smbus-low
+  ti,cl-smbus-low:
+    not:
+      required:
+        - ti,cl-smbus-high
+
 required:
   - compatible
   - reg

-- 
2.52.0

