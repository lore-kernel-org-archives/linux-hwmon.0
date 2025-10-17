Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479C2BE05F
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718920; cv=none; b=BtBT+XTOyjhDn0CGS+qDIUWyBbPpwAG9P65y4FkSgosTTEddY0Vj5fPl9r8oiWCxJfNld0gikL4D6y6yFbsqBhgsJ5X2xYZvS0rLHvkzcVnD/Zg5PHoGc5tGzUqkdTgAjg+rSpWXqdkL63JqPYk8znCMm9TwK9t2LE2mQpr/4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718920; c=relaxed/simple;
	bh=H49Z27nHZ+fdxryXvm9vrn0wLZGUrohUHscjeinVTj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nj3cPe6IoSQB53e/hQ8o+ep5murJv2BhorGDqJGVJHtPahh6UH2yAvHdjWHIKhNWZWscTYDCYPr4mQFIUJBJUYHTQjXLKuBcKfkD5bZtjz8HWxmxXXWDGuVd7Ro+DTaiHr37OGqN/VPohjgOYJoZUI2RK4PI9CdBm2SjI/t2mUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2NjocDF; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2NjocDF"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so1451804a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760718918; x=1761323718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1lHgyoHKMQ/vyhrtUoKDDc3oR+UCVpAhn4oqMVmHPY=;
        b=M2NjocDFvXVF7doJb0m12ucuXQJpUv99i04/2oaq9DhULBOgRt801iZsQRWgauk9++
         nqH7nJ8XuC7/ZOLuINjncJ4LwZ0cOSPeO8t/t3/uVJuQ6Cjh4BVHmLriJweXuF80XNoj
         8O7YM6qNQs2ZWT0Zzznh+RSd4NSPvIXpgnMKVBjxdVEjMYos2lwhLDc7DodHRSz5ZCsS
         OYIKdUSnWYIPwWadSBv94RppCE91TmctLdXiofnPRuP3efq4jFd5SsqFeplSX0MydYlm
         jPmRgsRDMAMxx8UX7N7HiKhDlDOrjwhpT4i54AF/+5WITOsX+cTBUDKIGQhtAbic0eAZ
         21KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718918; x=1761323718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1lHgyoHKMQ/vyhrtUoKDDc3oR+UCVpAhn4oqMVmHPY=;
        b=XdiQ5ZnFEuYNFgb8EmFKlnz43uDZa+JkYItyXHP9mmKzRUaVLiL/4FGnldk5NB+SkF
         2q8e/pkos3y/fYf7zj+WG1PYvK55Q2jpddO+RriaJsiZzUDy7+Vc+Rp/opjLq6xeez8h
         wc4acE4YfDBEdGYHG9MbsUS9IoWxqQ1aH3hv8nW3aFTxmr/qomfKOAUG3lbgIMFtMyJ6
         fD2Isz1kLw7qodgOp/u7S87yVMwFGPC6i9upnUWUMI+Tj5ko7m3WQhqp+qrNm9monSOV
         zQjoI2wkxpBBprmFX3XdGuPMXXoLgsceD5D77KqXJcmMK2n008SVsRTrJLI2+Fg8BinZ
         kE8A==
X-Forwarded-Encrypted: i=1; AJvYcCW4MVmdpJifNCuaG88ANqnEO0RVHwiVxB65gmrDP5g+/mDmTvzWPZjU5OhAQDhAbmPvigeWFro1UoDuiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHekjtRNMISdVQH4DPs7LhIdfrUNMQf0wLXy2iBt8W6ML9gH+P
	/Ys5rk8dm3UOYXlm96bmezDFwl/4p9lfDijvx72tHmkUMKa4+V284W3R
X-Gm-Gg: ASbGncukWO1CCPGRPmWW0ZjGZYQh0HEURo9VPzsOOwx7oHkB2UPZ7uTRYOnrceZwZN+
	3Jw8gF2dMq2ZHICuidtwCHlAF8+BpzbWdg1g8VQZ5r/6j2ISTaa6Wq4AmR66Wg6oU56lL+1o8ms
	PWMQH6S96Q3JGvQRm8EjBJqxkQ5dfD7AvG1ZFpIwJrpYjq0ceTb+xsjsPynziloTxm1CePmdCSX
	2V+zBBdWWlaQzAzPlRqkQyWuiOFRE1JVYFOIJfZW2vqMmTH85Z66omCmpOF/wnNphlOyWnpm1Cb
	e17SCmMDuGlgJHo35KuDDCm27SrPrzFhR0BBar2d3vNMRvh+CiadA0QnUpU9EmCz2qVG8SrEa8E
	ALXMJKhrg7/rNZEwxroUmHUy6inLVpc6JlJTwthhaWVUPywLs8gHVtIxMOG/82stFOVdbNRLrlF
	wGPjC9OA==
X-Google-Smtp-Source: AGHT+IE3VXh+TdVPCiYzexlDEDdofLJFwIzTxNzxCwsNcNjIWltjG8LXixIGZpxC+yW/uD668xY7vA==
X-Received: by 2002:a17:903:3bce:b0:27e:ec72:f67 with SMTP id d9443c01a7336-290c9c89dd4mr52278775ad.6.1760718917322;
        Fri, 17 Oct 2025 09:35:17 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099ab474fsm68020775ad.86.2025.10.17.09.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:35:17 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH v2 3/3] Update maxim-ic.com links to analog.com
Date: Fri, 17 Oct 2025 22:04:31 +0530
Message-ID: <20251017163501.11285-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017105740.17646-1-spyjetfayed@gmail.com>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2021, Maxim Integrated was acquired by Analog Devices.
maxim-ic.com & maximintegrated.com links redirect to analog.com.

Update maxim-ic.com & maximintegrated.com links to analog.com links.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/max127.rst   |  2 +-
 Documentation/hwmon/max16601.rst |  2 +-
 Documentation/hwmon/max1668.rst  |  2 +-
 Documentation/hwmon/max197.rst   |  4 ++--
 Documentation/hwmon/max20730.rst |  8 ++++----
 Documentation/hwmon/max31722.rst |  4 ++--
 Documentation/hwmon/max31730.rst |  2 +-
 Documentation/hwmon/max31785.rst |  2 +-
 Documentation/hwmon/max34440.rst | 12 ++++++------
 Documentation/hwmon/max6639.rst  |  2 +-
 Documentation/hwmon/max6697.rst  | 20 ++++++++++----------
 11 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
index dc192dd9c37c..09204b45f27b 100644
--- a/Documentation/hwmon/max127.rst
+++ b/Documentation/hwmon/max127.rst
@@ -13,7 +13,7 @@ Supported chips:
 
     Prefix: 'max127'
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max127-max128.pdf
 
 Description
 -----------
diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
index c8c63a053e40..3b1392bf547e 100644
--- a/Documentation/hwmon/max16601.rst
+++ b/Documentation/hwmon/max16601.rst
@@ -35,7 +35,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX16602.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max16602.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max1668.rst b/Documentation/hwmon/max1668.rst
index 417f17d750e6..e2b8a4056abe 100644
--- a/Documentation/hwmon/max1668.rst
+++ b/Documentation/hwmon/max1668.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, 0x4d, 0x4e
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX1668-MAX1989.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1668-MAX1989.pdf
 
 Author:
 
diff --git a/Documentation/hwmon/max197.rst b/Documentation/hwmon/max197.rst
index 02fe19bc3428..00e16056823f 100644
--- a/Documentation/hwmon/max197.rst
+++ b/Documentation/hwmon/max197.rst
@@ -11,13 +11,13 @@ Supported chips:
 
     Prefix: 'max197'
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX197.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX197.pdf
 
   * Maxim MAX199
 
     Prefix: 'max199'
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX199.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX199.pdf
 
 Description
 -----------
diff --git a/Documentation/hwmon/max20730.rst b/Documentation/hwmon/max20730.rst
index cb0c95b2b1f6..0ce473bca889 100644
--- a/Documentation/hwmon/max20730.rst
+++ b/Documentation/hwmon/max20730.rst
@@ -11,7 +11,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20710.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20710.pdf
 
   * Maxim MAX20730
 
@@ -19,7 +19,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20730.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20730.pdf
 
   * Maxim MAX20734
 
@@ -27,7 +27,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20734.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20734.pdf
 
   * Maxim MAX20743
 
@@ -35,7 +35,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20743.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20743.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max31722.rst b/Documentation/hwmon/max31722.rst
index 0ab15c00b226..b9d176ee7a69 100644
--- a/Documentation/hwmon/max31722.rst
+++ b/Documentation/hwmon/max31722.rst
@@ -11,7 +11,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31722-MAX31723.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max31722-max31723.pdf
 
   * Maxim Integrated MAX31723
 
@@ -21,7 +21,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31722-MAX31723.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max31722-max31723.pdf
 
 Author: Tiberiu Breana <tiberiu.a.breana@intel.com>
 
diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max31730.rst
index def0de19dbd2..1c5a32b64187 100644
--- a/Documentation/hwmon/max31730.rst
+++ b/Documentation/hwmon/max31730.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: 0x1c, 0x1d, 0x1e, 0x1f, 0x4c, 0x4d, 0x4e, 0x4f
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31730.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max31730.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max31785.rst b/Documentation/hwmon/max31785.rst
index c8c6756d0ee1..92817436759e 100644
--- a/Documentation/hwmon/max31785.rst
+++ b/Documentation/hwmon/max31785.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max31785.pdf
 
 Author: Andrew Jeffery <andrew@aj.id.au>
 
diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index 8591a7152ce5..b1b4bc0135b1 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -17,7 +17,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34440.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34440.pdf
 
   * Maxim MAX34441
 
@@ -27,7 +27,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34441.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34441.pdf
 
   * Maxim MAX34446
 
@@ -37,7 +37,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34446.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34446.pdf
 
   * Maxim MAX34451
 
@@ -47,7 +47,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34451.pdf
 
   * Maxim MAX34460
 
@@ -57,7 +57,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34460.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34460.pdf
 
   * Maxim MAX34461
 
@@ -67,7 +67,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34461.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34461.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max6639.rst b/Documentation/hwmon/max6639.rst
index c85d285a3489..492c13a5880d 100644
--- a/Documentation/hwmon/max6639.rst
+++ b/Documentation/hwmon/max6639.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x2c, 0x2e, 0x2f
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6639-max6639f.pdf
 
 Authors:
     - He Changqing <hechangqing@semptian.com>
diff --git a/Documentation/hwmon/max6697.rst b/Documentation/hwmon/max6697.rst
index 90ca224c446a..5b37ff08ff44 100644
--- a/Documentation/hwmon/max6697.rst
+++ b/Documentation/hwmon/max6697.rst
@@ -7,61 +7,61 @@ Supported chips:
 
     Prefix: 'max6581'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6581.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6581.pdf
 
   * Maxim MAX6602
 
     Prefix: 'max6602'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6602.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6602.pdf
 
   * Maxim MAX6622
 
     Prefix: 'max6622'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6622.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6622.pdf
 
   * Maxim MAX6636
 
     Prefix: 'max6636'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6636.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6636.pdf
 
   * Maxim MAX6689
 
     Prefix: 'max6689'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6689.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6689.pdf
 
   * Maxim MAX6693
 
     Prefix: 'max6693'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6693.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6693.pdf
 
   * Maxim MAX6694
 
     Prefix: 'max6694'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6694.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6694.pdf
 
   * Maxim MAX6697
 
     Prefix: 'max6697'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6697.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6697.pdf
 
   * Maxim MAX6698
 
     Prefix: 'max6698'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6698.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6698.pdf
 
   * Maxim MAX6699
 
     Prefix: 'max6699'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6699.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6699.pdf
 
 Author:
 
-- 
2.51.0

