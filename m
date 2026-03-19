Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120BB3C8713
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919225; cv=none; b=eKVxO/w9aaghNwBOlz0NJgKJSMyWsaejW16WxtP7l34vFJjIYc+cif02poYaB256RN5GqL2wz/UxmiTbShosV2OOrkYSt3RxIMDreFMt51MqwlECMO5S9iS1WAXq6bRwYVbBUXo4D56jghaBznJWothqjnBQ1ARJk8FIiwUxGY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919225; c=relaxed/simple;
	bh=WgahGU/Pdizw5BXW+8aqmvvAzDg7Xgrdm1f9qWuR/Is=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jBpiEvZZm8FVH9W8Sw68N1p5kXClgkqSlNEnTXy+IiXHlrynhqNVNC0o7hwWB6sLoKC7+ZdMVGfBkwD94OXRkNTE5IhkEVR7AcbZJPjEeCURhRdN+MBN+U4o71NoA7o7RBDOHGscoJrei970kLKrJT5z53hzKvseYoMfa+R0DMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckoYYnC8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckoYYnC8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad9f316d68so3800375ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773919222; x=1774524022; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v39neei8o25k4D0ZjuJhQ38mRivgsoMoltQsRcBYuB4=;
        b=ckoYYnC8TNYM/HEPsVon+L+V77JTIKjhAaN3ytYZN136NXXatgL5PG8sOszGyJLKNc
         tDs1OIH17j1HyFiNBt9VlhyTj2EOkT0818crESUYV9Kfr1MRWpTp4KC2a732WNTfLRAg
         P8/Zba74ruJJR5zEctiOxNuWJiuCzshga5lcGLALgnhL7QkFkczPBNZ480phmKhO8vOV
         BxWvqwR2LidAOOUBOcInwdnJ2LYDfPBrEIn7+1ZEbE5R1gjNLcpktE6i8M+sCuWdvFMQ
         6xAkqJuOtz51uj3MmSf0vYpLrMj+xeip4oFiUq56ChgXLjp2EmlTW1G9SfHSsFasXk5O
         4rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773919222; x=1774524022;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v39neei8o25k4D0ZjuJhQ38mRivgsoMoltQsRcBYuB4=;
        b=eQOa7YU6VUVvjKYa+h/yPwmKkvOVoTZfKB+kkUF3KEeRZMTvGTMg9Zwr/W7py3VNM3
         0RFTMaIn2wqMlJvrwtHiNSi/CoYZxzYaREG0ch9YGvlcQwOcFh18MIca6hVN0LWAKNJW
         370GC5WV1H+h7/6MqmH1/E1pMBSxZu9ssZIwNvgybM7HePLD3w9S1cuVgR+tRSAEjHVE
         aowbil3X16F5Z/mBJehW+YK4bcGv3Ey3llVMod5q+Ym1AnH4AmZ7Ti9Tka99/BDKn2fs
         rJCZ3eJvs4prVvHahnSqd8UMNPlB/8Cj1Ov32nsUF7r0Uh8C/ehCgcMZZRhbqH/rSc6s
         kjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuNyDYXX44s+hFDe7X0iSbdPkeciZGD8++2G7d/O7P7e8qNA6spjGnnX1J12AORDH3ScVoiN459DlUgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwaZTGKa9avNRuV06p1mvh7r6E0/Sy4OYJjMC0uli51Rwk55Wy
	i8CxbfiQ0/k6SwSTFyvNjMZW8AdQeDCVNKHHsMQEklQlM4XgqP0iR10W
X-Gm-Gg: ATEYQzxMIity4MVEWpSRN6pw6UVNJxXOBq5a3rsD1G9pwbUM8yuLy/QUXqtdaxUW1WY
	01/Ekfo8hi2L9TjnYmcQaFTJ0OYVzfvRtkpa0C68IsN/U1I4wsHAGVaGpvvJOZ8gxrTumA+1CWO
	8LoxvCbjawe2uiK8lr3o9c6I5bCukKZMf3gB0ZixJIgRfmeuHqBMPgQBokNDDcukhJZeMGBHNAY
	Ye0CWfthsVo7YrXnNJD6E9/zewWLwVHH82F68xCRLrQNJmQouQrHMeby9tsTs4UzclxQUNO1V+C
	ujYE/sWltP0mAIQ3Rm0mMuRKX3SnP5nSbLXOBvKId/nn7MBP26M7KoucbfgeiO8P+I00HLf5gpk
	g0tvsTMdApcMUPdvqbVJ0B+kIFywp0Asxqg3co5f3Vr+cQvRCcaET1qZuJLhqyiedET51K8Hpal
	bcp/BSJAzzXx0veXXhSpTpE70+ZqRhQ7h/CkQtAMkBcsFpqwEDF92W
X-Received: by 2002:a17:902:fc4e:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b06e2da3b4mr68943775ad.1.1773919222420;
        Thu, 19 Mar 2026 04:20:22 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199easm76524585ad.5.2026.03.19.04.20.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:20:21 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Thu, 19 Mar 2026 19:19:44 +0800
Message-Id: <1773919186-17515-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1773919186-17515-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773919186-17515-1-git-send-email-zaixiang.xu.dev@gmail.com>
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

