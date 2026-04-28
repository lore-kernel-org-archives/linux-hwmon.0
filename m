Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878A3EBF1F
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374593; cv=none; b=Vb8KrlyQZdYWHAWeDJvBU7ttY2mVHhiONMaaq9T8z7pxYLrzTa6WhRTdoFcc/SbnihvPDnVQb4YrbGjTltumhU0kHxkmVNnmKiAbfsh7V96ugykUC0N/3R9Q5t4wQRRB/yTCxYH3Q0EOJUBRZFQLXPTo3Nu/jBTzBNH0aBZuAWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374593; c=relaxed/simple;
	bh=M8pM+GPIuGPy5U0CrCsD+rzuXxctkeEQCRG4ScSiarg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CVCgvp+B+TwqiaNkmtejzwRBL3PT8RREj7YviD6HP+e6yYW1uwJ0F3VC2EGLsft5yqMslOba7XOOT5VftSuQSrGlDeFC1Mha2l246Sm38WkCuJdU0uHXLiGFKNYPKttHChIW0GKDvJr2G70cwPy3SK7qib/loF8VTMrKqLm+JDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UN4IHCNb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN4IHCNb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2addb31945aso71208045ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 04:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374591; x=1777979391; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=efhMbwARh0s/fyMoKyosJ1VtXtEFuu3Fxddl0+j9z2o=;
        b=UN4IHCNbaBrE/kEZXmqDlNJV0Sfn/RHzNs820Zdf9XKHKEpGITQmUD1U3PS7cH3nwK
         FEL+Q0HAPjUh0O4IeqO94/VS1afXNS/wjQJibH6yr6+1ep8ExNBsgPOxq8eU18DlbBNT
         DXYPsp5GpVtvO09SeIjiYggiWa9bZcRpSZkCShOpjF4N2QRiHCoMLhI3VZpga9/Azkro
         HSQLw9BmUpsTuCBcDHXc774ZcU07YiBtm0LqnX4UFr8Vgrkgo3KPUKbHPTKJ6uTyszcQ
         PYiBAL7brQlq5vl6d3DUkh/0FRQtG5FpfbaWV/qRBRUEXLEkItdDGBweqmQIK8QOTCn8
         Twkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374591; x=1777979391;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efhMbwARh0s/fyMoKyosJ1VtXtEFuu3Fxddl0+j9z2o=;
        b=n/aFV0y5HNkLF6KlVzAX7WbEekl1KO6R6wlETwLVXv7dPSvSF/nyVhQKHCdFzoKjZZ
         m8hePTOLS71J9Xhpau0lqeHoEEREbH45DPQhqx/hqlvdKcbM2piFJOs2aP7aMGT8PWXK
         FqA3GvBl8OVSYvcqh4Y/uQjgtfXZHF/wxY7g8o2thTL35Smld7h5dM69bdh6qYuGdo5J
         1t8FO+2bCQIekZXobdLYFRjwigpLnk/HEQkmIFUV2c40zsvlVzpBeVLx7EjisGMXUOZI
         pdQsyk703A2hjApoSqfizFowXv53zntgCMA7tdnXmkFtAfd8RWX51YmPvu6WXy41AT/b
         WRuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ohym5yQmj6wMs2RrDMutmPP9s5a2ZkcowGcYWce3SBfaCaWLZ0YuyXeV6d8Z41WXkEoFl1vweg2CNvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxgRrIEKs7iLzccqtyUd4tHvS5f3wzG+I4YSEapClNJMk3riS5
	h3pCSNzfBf3oJ5MdHl/OBoCzV7HzCo22ZJz5MZBMNRvf7OWgB5o6DXJY
X-Gm-Gg: AeBDieuV4jWgltRk1GHGpaK6uR1xsGkflXRcqOPMdINlmv1kIm5ONGQCqYYQTsgpZzn
	SSRmceD1EtqOZ4m8PEWfS6mBciEscZdtWsdnzAdWkWAcQRPUiKpPOpKtTMBTyZst/PjSUSxfux6
	/RtYfoCZCoWVa6er3L8tDsfb3Ysu4yKQc7Kv32abfkD50ERLaiPdwbCqo31XeqfKZSEQW75RAaU
	3S9XSHhSCrku7m4cle+vS5Hba2uEmu7XyYMl4PCugDAIxVlVQ9jET7pcA35JpYkU+clT8a3nMGw
	Pk1guVE8V0DhuG8YNSW2R5TRrAjbmq2ny+DKVrHp/CzshuZzg7yqujDNEif/H1P68ZgmNV3LT34
	cNDeRMs5f1VS3wqIvInTTbmzfx8Ptmqg5LUrG78Yw8zuzGVxYbXBhNbYrScstWneHO+xeCTTAoq
	wpFr3rWIMrQK4aT7dkOMGPe4FAFsW3nBZOb2uArvetUEJiEwUAGHIhquF51U8ir932OIqRMIyQu
	Q==
X-Received: by 2002:a17:903:acc:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b97c4d7e5emr28519055ad.32.1777374590930;
        Tue, 28 Apr 2026 04:09:50 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93bd4sm22828885ad.23.2026.04.28.04.09.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:09:50 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v6 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Tue, 28 Apr 2026 19:09:26 +0800
Message-Id: <1777374569-59233-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..354836eb8e72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -676,6 +676,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1

