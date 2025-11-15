Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5F303C8A
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Nov 2025 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763231354; cv=none; b=mZwv7uxoqwAm4Q3O4DkCHW+xyfpvstCXPDOx21dLI2BSZwH6UsE2oJuIx+XkEw8vWJ0tGLaIyqTqWcJR3rScjQxBLVhZMTvf+Fj6vzM6ZGp1aSb6ikmcq7e2C+Di6Dt4PT9J9tv+2efrTamPqrz+Ma/l7dBl/rFROMHxphPiYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763231354; c=relaxed/simple;
	bh=Xkp+AlOrp77vDyfTjWGA5vol4JLYgJgv4g0+c9b+DoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rINAxOdYd2SesrvExOseMJhGkdgtSk/KRLBWHldItC1ZO1rWDIVcPSeJnXrgPNFZ9T1ZMVfi04qbb+eIi1zDi5A4n5Kg/dWm5XqKG3EuSIvTeSTsemTM7kaE7SpmkgGP4coETTd7JeO0GCX3+gAzNKtLiULDMQPDhZJ+G/im1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=k/byuNno; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="k/byuNno"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso2629686b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Nov 2025 10:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1763231352; x=1763836152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iej97Lk0IpH9rmKjnGruuelwGjs+gRKjN3lzcMuN5y8=;
        b=k/byuNnoM9yy0zbpbuKZ8ZqeEKIDtQDCGxU+OWlbtGOM2FaU2m3AFwJHMfXzhMda3k
         Nmst1Jwe+R1yV6P71qeXnhDnyNGMeiK0f0d86nwQr05sEXkkdGxOvzFImCxhq++HM3zE
         fzRLQtkVvIS3DoxjBWZLGk3ysNT2gik3t40krDDp0PvZrxEwvZstuuKSWSB+9zlvZc+e
         fUpS+zIL7YNraxpHDQrW0brrRcovkEQv9y7EWcuCSIYe8Ix7RJR1tE8alyC3nFKx3sUW
         8ikwO7zNs1CvYWmOCyHj3ynvlJ1H34OFjSbm8aQhZmNOBRSEPNeXtcOW3M8xv1jVrQZ8
         3dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763231352; x=1763836152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iej97Lk0IpH9rmKjnGruuelwGjs+gRKjN3lzcMuN5y8=;
        b=HITn5OSul5k7JxsnbD+9RG/hjWO6jLTizldf9Ivfzvj7HbgFs+D81WD3HOgh8NSoD+
         +Z7t8EWRR/AWXHqGJtEwneD63h9Qh0aC0u+iR7ktOOpXlf4v2V4PJ6uHqzZ1hvSghKKB
         R3ulLRV7kPejV3K97ju/fxoX3idoP3J27Jha+kjJpEXCA0rJeO+O7pvO1vD8NsZYbFeQ
         ZwF+DBMh3SSHCbU7Py4xIcuylwlnIRZrSwjU9a9PC/AOKamXKeAFkW3eAmJczn7S2t3D
         qZSywXFKhmZ15bt9HjhgzFijIQ8CfptvSkH7zxatRSBggBf22KXREgpmhdQK0KTsHqPW
         4s9A==
X-Gm-Message-State: AOJu0YysIfvH6u9LNhWi9QYmYSqnT++qjiiHyrkI4LBpRW9uFEZoX4yO
	UN79QdUmkAlNj4SnnBaBufvYKYi4LwfaOyvsamv4VAoOrgY5z7tRpuUVjJ7ieY8F7ds=
X-Gm-Gg: ASbGncvpH2u7XJrwse2BMSBLRv0+tt2wR+MkZbV2f/OB8p+qDaLpbAWB6x5NsDftvt3
	UHV5jy3NufkaeNsY7Uhn7WuYs0mzYnfjfjNRKawD+tnZR+Mbg6eToWRntJeLPuzdc4cK1GHd1WD
	7E49laLdDFeylZdjosmocp0syc4CPQ6ysUegDBcQCsB3b58/meKDzqDyKlCECz4pKqsRadDeNqQ
	aIAci4TDHAoT2H0NWdmeP3bvD1C+2MHzF0lJCl3zXg2Niu9aCwMwfMOpILR5CbnHLvMEeKVDbVS
	TYRh0z7gwyB5U/m5AJcwXCOj72Ki2yn3DYEpbFXlW7B5Z0f8M5n6zI40F/kU/JLI+bGM2ElH4Yi
	bprhP2HRVYapwZIIb5A29cpMDPRQyU6zsSKGhM8hEYSrqnZrA0I8dQVFjCkdNAh8At8vK1NeIOy
	xNhX7ybGiFqmw96nzZ
X-Google-Smtp-Source: AGHT+IFr+7VrQ2I3mNfNSDZrGqD2SF80pfacPUgADezFX6U8zJsGzZnjhP08LKSVROpYiRoE/ISCgQ==
X-Received: by 2002:a05:6a00:460e:b0:781:2291:1045 with SMTP id d2e1a72fcca58-7ba3a0bd788mr8487955b3a.8.1763231352049;
        Sat, 15 Nov 2025 10:29:12 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:b19a:5e09:9d0:f111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251c99aasm8686206b3a.28.2025.11.15.10.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:29:11 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/hwmon: Fix broken datasheet links for zl6100
Date: Sat, 15 Nov 2025 10:29:08 -0800
Message-ID: <20251115182908.1357793-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the datasheet links contained .pdf suffix which resulted in 404.
This patch updates the links to the correct URLs on Renesas website.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 Documentation/hwmon/zl6100.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/zl6100.rst b/Documentation/hwmon/zl6100.rst
index d42ed9d3ac69..1513c9d2d461 100644
--- a/Documentation/hwmon/zl6100.rst
+++ b/Documentation/hwmon/zl6100.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2004-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2004-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2005
 
@@ -17,7 +17,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2005-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2005-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2006
 
@@ -25,7 +25,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2006-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2006-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2008
 
@@ -33,7 +33,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2008-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2008-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2105
 
@@ -41,7 +41,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2105-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2105-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2106
 
@@ -49,7 +49,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2106-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2106-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL6100
 
@@ -57,7 +57,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl6100-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl6100-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL6105
 
@@ -65,7 +65,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl6105-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl6105-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL8802
 
-- 
2.43.0

