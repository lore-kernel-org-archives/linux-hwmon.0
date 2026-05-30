Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470533E344
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179259; cv=none; b=G3QTsaPvAPJ5TeDGFvN4WUmCtRcz3tf/lznWliB4LUY0Es5wkQYic0wEH9ypf5RI8vPpTXv0OS7uB/0hpPpGAKq0PB8C5TMWHC0w7dO9H9A5FjHVHq5vV2j5lU0gBbl3IRFuCvY2BvJ2R5JFIxFBiUKsNzMCfXByp7rw5zKiw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179259; c=relaxed/simple;
	bh=3HA5TfAYgA27WFltK/brd/90JL3CvlhqcjCAbynuga4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hePrC7PNE9MMCNYaK5uWy7636beImbteqcsjn+PdWEML3eOCLplhNH2OdByb+rAo5BOkWMbekQJoI1aJtWRp1gzjoGHiGNC4D+twLBNvjjLHkrmzitz45m0AoLFQfUzdB5ZPxaZIQlKo7l36G/vnRutmGRn+l+i9ycsR72uB2ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sA0Krm+a; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sA0Krm+a"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso115756a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179257; x=1780784057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Rn0dHEWuJHQLW7yHyQ0EgHJRgfAXOs0zuE0Hwdwx3Y=;
        b=sA0Krm+a4iHLxEVOwINIRVQC8SbpqlQE6QZAakSq2YsMOlGORGs04zy1lLyCKDiuWN
         bafn4H6SkPhVKf/Wq7gBxsQ3Tm/tAjYj5/6GFtTfYZXfSgf4xI/84cNkkuAbe46ECq3E
         Brs1TnpNpDZZv2QSUEAQUzUk3Abv7tlV5glZmnNvsKtUi3PckM9J/DBGnKrmP/AbEZJO
         3cDwfElWxiMRD1xWNF3aXFJ6W3qz+RTDvq4eL1Z8IV4b0qi3co4nVVhNR00OrCS0xy9r
         EVSpbmE4WTAXzqeGp6hdl6CLPkW2aWIv7ghLHBXq5zz6kFAvIcDIvCAF1WE4bsjeRfIm
         sUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179257; x=1780784057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Rn0dHEWuJHQLW7yHyQ0EgHJRgfAXOs0zuE0Hwdwx3Y=;
        b=ejFe4z2VvQBZaCbnzFQ+nTlDSsoGFIWFbjmLDrmqt4dzpEEG7zx+qCdNHlFBGwrEr2
         AvT9+nZFHpbvPYSV+2BIvwUk9cvFzpjiDgM7WyPXM9V1isnsejMOLaTe919G1RMD/dK6
         RcCH+VHxM6MNMXrrl85fTACXTjwIPe7kCLMHxv8ev4PXHbaHDEGYWkfb2bZgYQwDvvFN
         E77uBwZpa3FmKq9a3g3VXJZOgyLadmhE3/kjktwiYPyyUrSSJrR5+h8akHnEwf0QGBJR
         xMfrtefzy+2xDhjSeMXq3w/GkILpwLqsG9vlQiTg0VZOXwlgdtJ1KfZGcNqsOCOMB9uv
         gsMA==
X-Forwarded-Encrypted: i=1; AFNElJ/tmBzDfDgwHmrdPzdTwzM5MM/+JkpM+cF3LgaePGcTMC9IlGPLsmXUSH8oiBzxbEbjW/DGdqZ/Ochomg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qkmqbWK3cuVZBF37Hji3NF9GwSpx1NeUJnyVLz9Dv/zrtCBK
	blb9mrWNt/XZPeLmti43Zt+8b13tBhhS6nn0krZv3V+0MQdI0/noxcc6
X-Gm-Gg: Acq92OGOfLAnqaYCIRznNF9rRlUNPMb21GdT4B+NJJuvNnze/WQUobl0h24rLPIGQuh
	LeDBNyj+QQSYEm1ZoNdt9VlKRLnQBOLN51EmHMRAryFaDRej1IDL0m8FofmxImQ01JHjdaMjhOg
	rrHJ4hLCe7D4xcnpWEqnUU7yl3g7ApgG8SYXVisacxn56h4UJ3CwpUjXkUPDx47AvqyJJB9O+7o
	h3oDSj76fs205yybYvtivFWN3Ie6k3u78/u99ZfnBsuY1IvJCzQqxYoRN8L/mvCa8g0aTdjXKj+
	Qtio3kf4CqCEmfxh65MXnmGR7lnrWAYz4ZZJm2sYVj/Nc148qbRFk0IeO1i1vBsywNKyXj6+6lu
	z3pQ9k4ey2SksFv3cz7rrWooMuemfttzjNutwGOjjhUgX3oAEwUNW3B9bnCFR89U+P1NvqCxPBS
	SoT0j/rqGQWR37gGKfd2BmaryLaCR+P/CjLvDNdouvWnJjfrGMyohrEDqqzRpfrs+La76xD2znt
	og/
X-Received: by 2002:a17:90a:9a81:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-36c6847f5c9mr3413747a91.24.1780179256824;
        Sat, 30 May 2026 15:14:16 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:16 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 2/7] hwmon: f71882fg: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:47 +0000
Message-ID: <20260530221353.159461-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use empty brace initialization (={}) instead of explicit memset()
to zero-initialize stack memory to simplify the code.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/f71882fg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index 204059d2de6c..c1d02d4e7b76 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -2667,9 +2667,7 @@ static int __init f71882fg_init(void)
 {
 	int err;
 	int address;
-	struct f71882fg_sio_data sio_data;
-
-	memset(&sio_data, 0, sizeof(sio_data));
+	struct f71882fg_sio_data sio_data = { };
 
 	address = f71882fg_find(0x2e, &sio_data);
 	if (address < 0)
-- 
2.43.0

