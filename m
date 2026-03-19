Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD44A38F231
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920347; cv=none; b=CwaM6IYHIesrNAcil+CgEaQCkD8n9wQOvOu7E1pkPrGGfxAkTHM9VrOgMAfj9GYhEFcT0b8xph6cxXoWSHdqQtJA2qukIJzoW29+jrZZienD3p+FWQwBTWbCn4txpYHh40Scgu9t4btrLqPaqH8CxmYcCZPfMuxVC8mrxryEbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920347; c=relaxed/simple;
	bh=WgahGU/Pdizw5BXW+8aqmvvAzDg7Xgrdm1f9qWuR/Is=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sMvMWFnbcfIJ3WoHH8fHBGGUnpprMvCzAssqWDq2TH0vjUfjb77UNSv5vCNcU4iVnGhmippRmqy3RKju24RF+iFAZ9Rvw1io+HO//hederK7xRPvybYa+Hv07xBv8XuGDTka7YrpcJkKmLuPqT50KYe9X1uU7+rQK93ELn91868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmGxBpkq; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmGxBpkq"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so345865a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920343; x=1774525143; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v39neei8o25k4D0ZjuJhQ38mRivgsoMoltQsRcBYuB4=;
        b=TmGxBpkqCCHXKKJl7uFiGOuNKP2Qf2ns77pyInXAcxWa54xov+WF6AIuRruT/h2kzg
         wmp+mDWumUSU2c0koZ+CYYl5hDPJVig/73PTxFdFFxGOBbmJeSlL4/k+lUFdN9C+tQZq
         D+Yb+lcheyxdQl/JTiZIaaKVyeL1hPowMwgZgeW2ZHIn/e7XEd62ape7CCEft5qPIPqm
         ZDGAuBWaQUjpC7CSYezNIfsafTTiEMbTVGtiroKuRpf5VUMfVf/XEZiuIijDcB24XQE4
         YG7v+3ARKbodnBWmzThxSSel4kQL2/1enm+HbABCHtAgFMTVqp3iM2LmjUI9hUEzlpgj
         Y+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920343; x=1774525143;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v39neei8o25k4D0ZjuJhQ38mRivgsoMoltQsRcBYuB4=;
        b=aCNIwP1DYbTQRTlEyhHCX5fNHr4e3Kjx1Zzm3Vj4brEmSLunk082Z+VvrI4lldZdNh
         vHxqXMYHZ7zT5NqwXF8RWX4ZHCfSRCiaywWBsI6czMqOCsKUNbsgzEnxf/8FlWGZVlzY
         ToY2uRxS3MwcsTJzyosevC2+/b4RRFahgPX8tVEKy9uhUHi2bKwQL9ick50mX6EjFp2G
         Qmc82wFMX01ebyCwPgevQX2dKPbO3EXhFrAmU8VoCyxz4P3S0fEVt0ODJ1Nvgp0NPtG9
         8ju8/sl10qWbuTyXH7/Wz5kjuPUNuZBi97NasXyt+ot5eG2dnLdXDlBdzbntGY0koJR4
         2YKw==
X-Forwarded-Encrypted: i=1; AJvYcCUtUIQypL611+YSvunskqDfF71zpRnEB22jB3uaZEqnwwA8AuQr9cywoBrQsBS+vEGEDeGk2gGgW6Ojyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVntHaTMISBGNXuDiQOKIooQFjYmKOePGpRfGUR8lEtl7zw2yi
	9gmsoXzffsJ3MPVO709YfABCmlC9YhqFldmwpNalZpTyC5Lng5R0kP5H
X-Gm-Gg: ATEYQzxS16t6LHTlF+QFw1EVlCHIgErnLA0RC/Z2yQzbTR112+FEqewKG8gN3z8+LIN
	iWpdE0gV1sv1VHKrk5sSyilo1WKz7/PQSsskCXJ/9e2loZIKinSqKGsj59x9FS4becA7Vgy6QLz
	FdI2zYdWtv6+02Ss0Alcm6wpXb/9dxiHQwhR0q/v2CcfAMwRm8hGvb18zZl3TznhZ/XM51xHNqJ
	QBEbYslspDz7jJvVxuCla/PXB4C+p3/fbUGojMVgTbTLONYlyKgk1m7A4z/ItvvrbNrzJiKIkwC
	sH2zKhnDNWci2NbGD0WSuPJYeIja8hoNAvtTdAUwhyMO+ZJe5E7hoBI49R64Nu1ufX7RRXZua/K
	9sAZZ0+oCa22ZZN2mPVwquriWX4myztLoTZmmpjthTOykHxKNgIkhVdUmCUetWNKMWGVvNFKFiX
	ym7A+HYvXt5iKrL7cHP2W5bLK4OAIk+DK1VQcgCHi+VJxuGVcB5qj1XfMFuAVKzB8=
X-Received: by 2002:a05:6a21:4916:b0:398:840d:39b3 with SMTP id adf61e73a8af0-39b99e03c20mr6603350637.30.1773920342955;
        Thu, 19 Mar 2026 04:39:02 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e545d38sm4985706a12.19.2026.03.19.04.39.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:39:02 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Thu, 19 Mar 2026 19:38:32 +0800
Message-Id: <1773920314-17755-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).

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

