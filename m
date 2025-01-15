Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF18D1D9A54
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736974114; cv=none; b=ksbEyKoZYDiVv7+HCWTq2yVDQI8RRfq6DAsQNcNy92YyWrgxbIhUkrUj/Yzgjluq5GUMrmMXGd+xw2hAy1y4Dw5Yrhheb1XFQ4YTjQN/zJFCkwaKdxKpSjFUipIGd1O1Wi/ROkHUms3c8DMoRTHbbYv2QHEJECkKRGZhvsTbsdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736974114; c=relaxed/simple;
	bh=7R2fFbTRa9jyzPSq6pCeQGsv3qDqn0dYMdlOncvkmCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sZaahQGHhRWbYyNTHQcAEOVK1tV1kUzjJWSFGiZqnWWNCAK9S1ysyuvSG9gu4qM3pfPtlsSG0pIVfYTAxBPRA6GPDcQ9ZibJMKfeMZs4ztdL5sR/Fagmtp+kv3I/9FvIbNd0w9+UQUUWoCUW/A9THlhI6RzfstSToz0tsbtQ294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uD6dX1ob; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uD6dX1ob"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3eb98ad8caaso164028b6e.0
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 12:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736974111; x=1737578911; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RislyJ38ffH3kseLHrdMfgjRdb2ij3ytmiw2qQlFEJA=;
        b=uD6dX1obb6GtJEuA0lM+5//9DOXYAdD6cRfi1YA0e3hrhydJ44bj0c739T+7ipK7mb
         /zuQXaVp2UzGUaKzZH4uolHga/Gtx3UvyBSpsBrrxqXEltcXop92af3mRaIKT435cOub
         W43jow7ni2Fw8VgHwpPU1QM68WjUPGjpTnkPopZuiVYVvxMAucs2H6L9SERwSsyd1u2v
         OrOSi95UybAA+lSvEsBu1rzKrLcAj9tRNmjFwS2UCQzo+ZKlSz+8c/SMrEbOquwfES9m
         CzEy5o5pkBWtl71QDt5/SwFXFwH0Vd08R4YYLS+YerbL8aMbpfX1i0KyWbTcbhFGzBwg
         sWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736974111; x=1737578911;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RislyJ38ffH3kseLHrdMfgjRdb2ij3ytmiw2qQlFEJA=;
        b=BmhKGYq+vmTfrPuDc55dt9KWr4Yfd4By7WLbVPcPue/ZAPLW18z2n4ZLrNLswtE263
         HhmUlyxgsa7OqWFjb5yyGDF5xEoUtTvzoJKCd78haCB97rjV2yEsCQAFY2Vx6zWQ7EMm
         UKiBqcFu2ip4N4K8pOTmpajuhgyE3mRgSVsIJRt8FL6mbFL9NCvLF5HNqssXux0Gpp0/
         h49dDrh53ymROPIZ/Oim7N/LnI8SomyD3lTnHwSdHbbjMk5m0tXySpDGTfpd3xerwDWq
         T8w8pqLmLZGD568gFgFJKxRcbbftqOS4NXkmrBXh+JYr03mxPVST+zAvl2CCScVKCyQV
         D47A==
X-Gm-Message-State: AOJu0YwZA4JL4KQjoyhgfjm5ArMVY2tlEJzwr1d0POJvxoyLW+Hym4oM
	RVD0RtS/ddM5WBs56gWngDrqLN975DZRT59sGJG9vKk/eiTltgIIUCqoHhzaW0mYMU2OXHOV7pT
	/
X-Gm-Gg: ASbGnctFj9lxyyqIJAgKQaEX/l9Kwo6v0ctPA3T5Yc9+ZbE4ToexMZKGCk6K4ItCMLu
	AFD/AUTywn/quuPUqNOXqDX7eKm/sXGPr/7x7DDmv0yhN3JiiAacF0bQBMEi+MwLqoEXz2aBQ2R
	d/epoEWJnCeYG0Txfb+aXuVnR1mkaWCyIMnJyQvVGZTzApH04Bh4ZuHE4W3B6DoVvxWRfo6U9JU
	7sFPAlmoDaws25gMflVJ9g77LRd/URc1GnjE74ZJ7wtbuApRXm9tmZfsaOTrCo8au1uAAR4615a
	wU6OyptOfC6n
X-Google-Smtp-Source: AGHT+IGOQEon/4dseqDVuh3t5MUAh3cEmIgyuI93HWnWEWljJhZdrEB68Pwjar3EVczrdhjH6nQytw==
X-Received: by 2002:aca:1107:0:b0:3ef:3954:1baf with SMTP id 5614622812f47-3ef39541e9emr15688221b6e.26.1736974111032;
        Wed, 15 Jan 2025 12:48:31 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f0376126c1sm5284695b6e.10.2025.01.15.12.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 12:48:29 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 15 Jan 2025 14:48:27 -0600
Subject: [PATCH] hwmon: (ltc2991) Fix mixed signed/unsigned in
 DIV_ROUND_CLOSEST
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-hwmon-ltc2991-fix-div-round-closest-v1-1-b4929667e457@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABofiGcC/x2N0QqDMAwAf0XybKApdOh+RXxwaZwB10rj3ED89
 5U9Hhx3J5gUFYN7c0KRQ01zqkBtA7xM6SmosTJ454MjCrh8XjnhurPve8JZvxj1wJLfKSKv2cR
 25FtgF6b50XUEtbQVqeL/MozX9QPdXx0tdQAAAA==
X-Change-ID: 20250115-hwmon-ltc2991-fix-div-round-closest-c65c05afb881
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Fix use of DIV_ROUND_CLOSEST where a possibly negative value is divided
by an unsigned type by casting the unsigned type to the signed type of
the same size (st->r_sense_uohm[channel] has type of u32).

The docs on the DIV_ROUND_CLOSEST macro explain that dividing a negative
value by an unsigned type is undefined behavior. The actual behavior is
that it converts both values to unsigned before doing the division, for
example:

    int ret = DIV_ROUND_CLOSEST(-100, 3U);

results in ret == 1431655732 instead of -33.

Fixes: 2b9ea4262ae9 ("hwmon: Add driver for ltc2991")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/hwmon/ltc2991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc2991.c b/drivers/hwmon/ltc2991.c
index 7ca139e4b6aff0b6c3024183e19970b36f927f6e..6d5d4cb846daf3025e55d43cfe311f38bb353621 100644
--- a/drivers/hwmon/ltc2991.c
+++ b/drivers/hwmon/ltc2991.c
@@ -125,7 +125,7 @@ static int ltc2991_get_curr(struct ltc2991_state *st, u32 reg, int channel,
 
 	/* Vx-Vy, 19.075uV/LSB */
 	*val = DIV_ROUND_CLOSEST(sign_extend32(reg_val, 14) * 19075,
-				 st->r_sense_uohm[channel]);
+				 (s32)st->r_sense_uohm[channel]);
 
 	return 0;
 }

---
base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
change-id: 20250115-hwmon-ltc2991-fix-div-round-closest-c65c05afb881

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

