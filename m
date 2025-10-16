Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67002328621
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610719; cv=none; b=pQEWEO5Dw2BwlcjDHC0mk3BKpHDGNkt6YEODTzd1SGbL7fbrmFnzU9rChiQU97nwXMwO/TNas8dzQ6hKkvFgHBxtT73nxgCGXMhFr+jt3LopAVw0TGsjCKTj8DWzlGrNPFBaAW+wVUUBqjyc/mUI+S2yVlDJC/lmR+hJB8UgFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610719; c=relaxed/simple;
	bh=WleEz1jDhFGxeIs2CY0OgjieUL0QJH/bHnUi6b4JJ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEajTscAD4CN8gdzPkY1iWWfU6+muWV6nWyQ4F3vlBvisZIrbq9NLhFLy7dELEWcgCm/9XR5t/glOi2IVAUM6667UUWhIunw4WXT0bM0nypXNiC14/nP+ZgVZNmqQFIGTN4W3YI3GMI+MwiZ5q62nXeGNL9aVM05Lb1cB2m9BI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aso+rX8l; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aso+rX8l"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6a0a7f3a47so527515a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760610716; x=1761215516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XdDhDJMoxJD2rsJZbe4GsNrMXtzir8r6EJcyMjSDT4=;
        b=Aso+rX8lb6ecA8K9vhhnpK1zeokC0F0V+q326s1g47IYM5f8dhhGEOP+AFfFAh3xUd
         nn/LETYS6RLFXwCP7T0+VZHZIuPujjWEjfsTQ3UrYrg08p5UbOjGnXNhMiHPB8cdS2Ze
         eIUiqqyOTYPtUpk3EOzZWUKk3yF+5XrChTTOipxV1E1n7issMskeL6Uapaj/i7uX5Kdx
         U54WL3jqYrKm5lkll7Px2IKhJM6pyhj/skWDpMyB6aKzeaB7QwlpQQcVylm12nOgUy/c
         yB1NXVIjLoPnZv7U8DBVaPsfjVwkNDepWITzixI8NdOcMRl193lqiaMLMZZ87TxUJUS0
         qAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610716; x=1761215516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XdDhDJMoxJD2rsJZbe4GsNrMXtzir8r6EJcyMjSDT4=;
        b=AyaauZ6z331R+MK2wrverdyXvr+UIsgxfd1DCEwl6KpupjUTrSDV7ArkxdqqymaT3x
         Q1Gz9VYCQTLm7eyPcep85d/IZ9HlDC92+5W5mSzRLuOuI+TCaI6i3aDZ1W+qYRqtVOCZ
         q1hQXUr1qx2i/bN99jvhD0RasDVyfh8zeyKVf0M1+XVLTNBcv71eG5ji5Np4mOgAopGU
         RNEJBtnz2pL3aMeV4M/aRPosFsz/6Anu3U0rJyqKoc34fnW813rVhh1XlJouAWFukFWa
         Si55dtgKfrSHPXYg4BwXITfdOgK1IcfRJvUPLFaobQPOfGFfg0xl/4h6FixXhf1muae0
         9c1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxsOq1g0m/o8xjWAumjBQ0SWKmSNJFTssLWMzRgy7zLolhY9dkqYa3CK2vIsVHFaGVsVTGiXXuCgbPLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2pHdvd8VYEsyu3G65/ldjEjQWwnIefOD36cOBzhctWsrS4/aJ
	zbV8c/W4XeoCPflJiqYjXq3cZYBZy820vtswp8MaoHVwT0Sm3FAFjHhv
X-Gm-Gg: ASbGnctuge95/uCVJDeTBuuu9FdNxSzo47+H6ih1D/9ZmS2X0Mbja75GGx4jl9oU5k4
	/dxACdAjOxYm5bGwNl1IEW8hZZluM4IY9wz/h8vcnY1CvD1ru4gwo+jyQ6eb5AbC6lq1rl9U7DG
	bwvLzCpxI/qZPljyGvpnp1GHS/HUe+O16LX2BlN14npstT2ZOnNfKcZmnyIySXoMBZVQa3Ryief
	dHi3ZF6v9VOKVvx+j+x0duOrLp11BjsTOCDrL/zgZ0JvkgUAc2GZfGiQZDtTsP6b6NGwePNHrVV
	KEpx1QU6fvTQxhcd4jGOUKB5OFpPuqzqO8XV3jLrl5j/zva8mL4R+fDDSS202w6dYYMTo2XZwcs
	B0rr11s4Vv6QnD+7J8ifOhQNl/1gJSVj9q/FXjCZ2tAJNUf3PgxQAbOdhveBLnJVjCV/q6K0vw8
	TUOe2N0w==
X-Google-Smtp-Source: AGHT+IGjBFuJvAMg2CCNAuWmCt1wkNiJYWm9mdK+6gFWgDz+yO8eXWxmZN+c2qpxak00Rg8z+kuJ1w==
X-Received: by 2002:a17:903:1b4d:b0:26d:353c:75d4 with SMTP id d9443c01a7336-2902724dc40mr375545515ad.0.1760610715577;
        Thu, 16 Oct 2025 03:31:55 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb65222b1sm1422670a91.6.2025.10.16.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:31:55 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH] docs/hwmon: Fix broken links warnings in lm90.rst
Date: Thu, 16 Oct 2025 16:00:47 +0530
Message-ID: <20251016103049.2573-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes warnings in Documentation/hwmon/lm90.rst reported when
running 'make linkcheckdocs'.

On 2011-09-23 National Semiconductors became part of Texas Instruments
and national.com is no longer accessible. The datasheet resources for
the chips are now available at Texas Instruments website and have been
updated for lm90.

In 2021, Maxim Integrated was acquired by Analog Devices and maxim-ic.com
redirects to analog.com. The chip datasheets are now available at
Analog Devices and have been updated accordingly.

Some additional broken or unavailable links have been replaced with
equivalents hosted by DigiKey.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/lm90.rst | 127 ++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 54 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 98452eed16d5..79c023521d39 100644
--- a/Documentation/hwmon/lm90.rst
+++ b/Documentation/hwmon/lm90.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
+
+	       https://www.ti.com/lit/ds/symlink/lm84.pdf
 
   * National Semiconductor LM90
 
@@ -17,9 +19,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/pf/LM/LM90.html
+	       https://www.ti.com/lit/ds/symlink/lm90.pdf
 
   * National Semiconductor LM89
 
@@ -27,9 +29,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c and 0x4d
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/mpf/LM/LM89.html
+	       https://www.ti.com/lit/ds/symlink/lm89.pdf
 
   * National Semiconductor LM99
 
@@ -37,9 +39,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c and 0x4d
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/pf/LM/LM99.html
+	       https://www.ti.com/lit/ds/symlink/lm99.pdf
 
   * National Semiconductor LM86
 
@@ -47,9 +49,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/mpf/LM/LM86.html
+	       https://www.ti.com/lit/ds/symlink/lm86.pdf
 
   * Analog Devices ADM1020
 
@@ -57,7 +59,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Analog Devices website
+    Datasheet: Publicly available at the DigiKey website
+
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1020.pdf
 
   * Analog Devices ADM1021
 
@@ -65,7 +69,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Analog Devices website
+    Datasheet: Publicly available at the DigiKey website
+
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1021.pdf
 
   * Analog Devices ADM1021A/ADM1023
 
@@ -75,15 +81,18 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1021A.pdf
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1023.pdf
+
   * Analog Devices ADM1032
 
     Prefix: 'adm1032'
 
     Addresses scanned: I2C 0x4c and 0x4d
 
-    Datasheet: Publicly available at the ON Semiconductor website
+    Datasheet: Publicly available at the DigiKey website
 
-	       https://www.onsemi.com/PowerSolutions/product.do?id=ADM1032
+	       https://www.digikey.com/htmldatasheets/production/53140/0/0/1/ADM1032.pdf
 
   * Analog Devices ADT7461
 
@@ -111,9 +120,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4b and 0x4c
 
-    Datasheet: Publicly available at the ON Semiconductor website
+    Datasheet: Publicly available at the DigiKey website
 
-	       https://www.onsemi.com/PowerSolutions/product.do?id=ADT7481
+	       https://www.digikey.com/htmldatasheets/production/234607/0/0/1/ADT7481.pdf
 
   * Analog Devices ADT7482
 
@@ -191,7 +200,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1617.pdf
 
   * Maxim MAX1617A
 
@@ -199,7 +210,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1617A.pdf
 
   * Maxim MAX6642
 
@@ -207,9 +220,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x48-0x4f
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://datasheets.maxim-ic.com/en/ds/MAX6642.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6642.pdf
 
   * Maxim MAX6646
 
@@ -217,9 +230,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4d
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6646-MAX6649.pdf
 
   * Maxim MAX6647
 
@@ -227,9 +240,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6646-MAX6649.pdf
 
   * Maxim MAX6648
 
@@ -237,9 +250,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3500
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6648-MAX6692.pdf
 
   * Maxim MAX6649
 
@@ -247,9 +260,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1617.pdf
 
   * Maxim MAX6654
 
@@ -259,9 +272,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       https://www.maximintegrated.com/en/products/sensors/MAX6654.html
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6654.pdf
 
   * Maxim MAX6657
 
@@ -269,9 +282,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2578
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6657-MAX6659.pdf
 
   * Maxim MAX6658
 
@@ -279,9 +292,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2578
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6657-MAX6659.pdf
 
   * Maxim MAX6659
 
@@ -289,9 +302,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c, 0x4d, 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2578
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6657-MAX6659.pdf
 
   * Maxim MAX6680
 
@@ -301,9 +314,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3370
+	      https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6680-MAX6681.pdf
 
   * Maxim MAX6681
 
@@ -313,9 +326,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3370
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6680-MAX6681.pdf
 
   * Maxim MAX6692
 
@@ -323,9 +336,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3500
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6648-MAX6692.pdf
 
   * Maxim MAX6695
 
@@ -333,9 +346,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/datasheet/index.mvp/id/4199
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6695-MAX6696.pdf
 
   * Maxim MAX6696
 
@@ -345,9 +358,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/datasheet/index.mvp/id/4199
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6695-MAX6696.pdf
 
   * Winbond/Nuvoton W83L771W/G
 
@@ -355,7 +368,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: No longer available
+    Datasheet: Publicly available at the DigiKey website
+
+	       https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/1128/W83L771W%2CW83L771G.pdf
 
   * Winbond/Nuvoton W83L771AWG/ASG
 
@@ -381,7 +396,7 @@ Supported chips:
 
     Datasheet: Publicly available at Nuvoton website
 
-               https://www.nuvoton.com/resource-files/Nuvoton_NCT7717U_Datasheet_V111.pdf
+	       https://www.nuvoton.com/resource-files/Nuvoton_NCT7717U_Datasheet_V111.pdf
 
   * Nuvoton NCT7718
 
@@ -391,7 +406,7 @@ Supported chips:
 
     Datasheet: Publicly available at Nuvoton website
 
-               https://www.nuvoton.com/resource-files/Nuvoton_NCT7718W_Datasheet_V11.pdf
+	       https://www.nuvoton.com/resource-files/Nuvoton_NCT7718W_Datasheet_V11.pdf
 
   * Philips/NXP SA56004X
 
@@ -401,7 +416,7 @@ Supported chips:
 
     Datasheet: Publicly available at NXP website
 
-	       http://ics.nxp.com/products/interface/datasheet/sa56004x.pdf
+	       https://www.nxp.com/docs/en/data-sheet/SA56004X.pdf
 
   * GMT G781
 
@@ -437,7 +452,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheets: Publicly available at the Philips website
+    Datasheets: Publicly available at the DigiKey website
+
+	       https://www.digikey.com/htmldatasheets/production/97606/0/0/1/ne1617.pdf
 
   * Philips NE1618
 
@@ -445,7 +462,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheets: Publicly available at the Philips website
+    Datasheets: Publicly available at the DigiKey website
+
+	       https://media.digikey.com/pdf/Data%20Sheets/NXP%20PDFs/NE1618.pdf
 
   * Genesys Logic GL523SM
 
@@ -453,7 +472,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet:
+    Datasheet: No longer available at Genesys Logic website
 
   * TI THMC10
 
@@ -461,7 +480,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the TI website
+    Datasheet: No longer available at the TI website
 
   * Onsemi MC1066
 
@@ -469,7 +488,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Onsemi website
+    Datasheet: No longer available at the Onsemi website
 
 Author: Jean Delvare <jdelvare@suse.de>
 
-- 
2.51.0

