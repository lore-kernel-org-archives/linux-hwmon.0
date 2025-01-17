Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4191FF1AD;
	Fri, 17 Jan 2025 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737108564; cv=none; b=R14VjO8WqLxTMRVKRJKMRanRKby4tBBA0WdjslRpL51mK1qP6h4R41zTMUCiEFiWZc+JJcZK+7loPbAsnfLOh+/fO/cNpiTooTpV5Ze7OOYwBnsylfnpGifQ9uDsDvoD3nIz7USzgaAc04Rjh2biL+AIiC5cMSsbrlTtCWnQuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737108564; c=relaxed/simple;
	bh=W/meGVkJvpY/rtGEN5q9E1x2stNtg8C4/qbdLVh4RpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fXrQ5zfUEoU1cTm7lY93MjQX+nBWtA9a2cBnFKKyYBcRafE1SMYMK2MHWSmDA3bWXq6UKxWCD4BN5QmzxHxqsVN0ucxJm6ml9xkjTKgHp/FfdOc/ZpeVv7A6PVI7IHLsQASUEgTi/Wu9axIroxrQh6LDnnj1Lav0P2gCAnjzb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJPJZGn9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJPJZGn9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166f1e589cso46990135ad.3;
        Fri, 17 Jan 2025 02:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737108562; x=1737713362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txpxeHBAdFWIxVvsrZY+vd9V4pz1ZC+hkmKyDcVg/ac=;
        b=aJPJZGn9lYU8HWz6QZJK0FSFPi7Vge7cX2+xKmyRD9XcJJDxu1nunWVDiZfDqudcck
         yAdTjYLwzq7sh+vKMVNrjEvdRAR4xIwxycTgNNykeOv2Qs/kmZO1A89TJ5cvfCXxVo+q
         SgNaS/gHzPWyyGX4rOMD4tDHt+hbpQhDRtmtYGO6RzQdMI8zDgeRj2DZVPZNLn3+nJTl
         Md21Oyrb2VIKz8yuMaqHudoqSOPJHbtHoMlPuR+ZsdwypMfkSqSv4IgsCGuwhihadIBB
         mbDX5H1LsfoPGVLvfMr2I3cwfBMeOvQBsV/ekbCB8poCKCmGZyxt7HnR7FZH1dnxtbi4
         5fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737108562; x=1737713362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txpxeHBAdFWIxVvsrZY+vd9V4pz1ZC+hkmKyDcVg/ac=;
        b=bLHmdYuMoc2+cthne/wYi0DCcicqiQAp3Ni1PYoQbGJkBRsL68cCoi9ZvV9lwt6Khf
         v5pbBs7HnIgYYPW0K824pFtSrBYlZBasMMW+lzmYLfY3d3rhdhyv64PLanZZbHRAxVky
         Lfd4pZgT+ZDD0MmcGaHqfCIfiA8l7YfAS9TQGnawYKs4sE2mN6APP6nYyR7K+FNuolMF
         d3gJfwlKJCeN/N++R85l5699YlYrlCyYEYDB5aefEKsUN/Qno1luvuEigSv38cqx/SUp
         LjCJ/edY2FbLAtFs4bGSt9690zm63i7KOFa19lU4u3h4/G5ocuRLOFKonJsDLyKckExE
         Txsw==
X-Forwarded-Encrypted: i=1; AJvYcCUqVuHhTTaoOpCPv/zrk0HpqEHe3l8luinLz0qPYO73bttgtzDYcsfpxii7CDztpoTQBHdL/YO4at2I@vger.kernel.org, AJvYcCVsCeeOxDm6/Ixhdfu7NQmObCoMCRNm61B8Jha7zyIGctv4SFbxrAl+DZYLjq5VwCniS3f0MVXueGQijIyf@vger.kernel.org, AJvYcCWR12r+YMqVvSYjQiZlmTmWTEFZWOTwDkXFF1M6Mqlb61KqItzp6KmoUKSVOr0hGHgEGzPenQ+5PeWw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9ADbAxQsPWeFVZ8yWVHsPRfdKVbLB12qt13lvDvstIj4PDRc
	cmWKRIO7TZN1/zEj8Dfl2E6GLftSJ2g/7M5OF5MrF09MsFs2S6zm
X-Gm-Gg: ASbGncsq4gGX5kUPeaTi2JTZbgpcJfT8LzIKnNKD2J2zsf+0g5Sq0yfZCKG5zVJ7pWv
	xS+F28u4gSGMml/IJwGc9KCab3QSY+jTP+Tazt6VHe/enXsSWTh1054WWjQaEuOIsvWFQsxk0Mp
	7Ga2cJkGdeuVsYn+7hyOl1GqMj4rU6jd67wK0GzC3it+jZmsG9VUWktXjQvyP38/p2sG9wyoL8m
	QJKWOUpfx8hyGPTFalflgmMGyRZ93HYIwPafswsebA+jy8yDllgOgDvkOO2ICcMS+UATj7U1JZX
	b+qwUMp8wB7asmHmIBhY7M1h
X-Google-Smtp-Source: AGHT+IFBfJZqvUn9Ne012mH1HpVv9nGKtmaZr+J1FGuDFINVjH1w0pMMzDjKEnJqmQjoQB0dqMI6CA==
X-Received: by 2002:a17:903:2344:b0:216:32c4:f807 with SMTP id d9443c01a7336-21c3564e7b4mr27869955ad.45.1737108561890;
        Fri, 17 Jan 2025 02:09:21 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9af5sm12756925ad.82.2025.01.17.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:09:21 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
To: tmyu0@nuvoton.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: hwmon: lm90: Add support for NCT7716, NCT7717 and NCT7718
Date: Fri, 17 Jan 2025 18:07:44 +0800
Message-Id: <20250117100744.1571385-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117100744.1571385-1-a0282524688@gmail.com>
References: <20250117100744.1571385-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Nuvoton NCT7716/7717/7718 thermal sensors.

NCT7716 and NCT7717 do not support to add temperature offset.
The maximum offset supported by NCT7718 is 127875 millicelsius

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 6e59c8fdef30..4feb76919404 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -32,6 +32,9 @@ properties:
       - national,lm89
       - national,lm90
       - national,lm99
+      - nuvoton,nct7716
+      - nuvoton,nct7717
+      - nuvoton,nct7718
       - nxp,sa56004
       - onnn,nct1008
       - ti,tmp451
@@ -120,6 +123,8 @@ allOf:
               - dallas,max6659
               - dallas,max6695
               - dallas,max6696
+              - nuvoton,nct7716
+              - nuvoton,nct7717
     then:
       patternProperties:
         "^channel@([0-2])$":
@@ -155,6 +160,7 @@ allOf:
               - national,lm89
               - national,lm90
               - national,lm99
+              - nuvoton,nct7718
               - nxp,sa56004
               - winbond,w83l771
     then:
-- 
2.34.1

