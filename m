Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F63932C6
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762416; cv=none; b=p6PYTku3K794Z2E23tQi6dsdlZ2h3Tp/AMGhRd6IX9Mv5Meo3pq2DTjPv5Ex1qy94aNrINom3OHceWZgYnA/ey9U8jOK7yKUCBIkcx0LfzoShuxpGA4VSkAao206hHnpc0Vw4Foz6BpdI9WC97TbU0Dei781z0i0aGlkKUuDKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762416; c=relaxed/simple;
	bh=PvyDEtDG8TdjDcuAHzeqmpHFrdL1tyXkP2WE36J/VYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eIcKRCn6d9WkfZ/z8MYt88VT4i+thUw3zvutNRH9HEBATzmEBWVZAzsghDy0goRtPRAhQ9x4qMZvoxGBEw+P/3Nqfzz1iiNGNEQ3ZFhBE3PJDV7ZIJUqf/Zo+YgEyNpuSGdrxtF5XrOjk0CA/lsEYAqvVRXQW3tR57t27uDlbY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso1598155ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 02:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783762414; x=1784367214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf+wqnGQpAYU6cY0CxfR0PNyYQLqysQQrgD50QiJkT0=;
        b=LVlbqGDgpkKe0lkjI8StSr6eVbmKeCWGi7LJPQtpoeILqlZBqTpx1y2tb0j2mV6txe
         oE9GFTWrUn4k21YMXOENpgj9bXx6GQ3oC9VNvAGeFxP/ii7551QiTqPtxZKP6hyt30Ke
         kCv0UGVsQ1MB8pz/YMHD60fCky/+OUYOHMnzzTErWu14M8Z9a8pEt6esXmwa4uQjRB37
         vC4U25ecCV/G6HUm2cEyR5gtTvUsZpqhVDfzkuC6+/pOzCU8ToUfdItJ28yi5kDiRBK5
         6GmHe42iV+RLnnWwgZv8CjNXPQ5zWSJ7+OW7HkT821+v8PuU1aThY9Rptf1oxLIXnOTb
         niYw==
X-Forwarded-Encrypted: i=1; AHgh+RqA3CEaoVbxH4zDzspmkqEE+SfxI5dpvxFJzXy3hbniWDFm8U0iZUxf5zgqZH/BToby9Z28VdLNOosqkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6ieOp2rtfuPrzkeqs0BRyaGi9xEsG3wJqTAaS5rZ1EMLbBT7
	RaiLwL2p8Tt9pwX+1+k7Eqm3kJBQfwA4xstx8WcaW0SobnSja6NISao=
X-Gm-Gg: AfdE7clMx5ioglSc6JLCx5c32cgUp9YmHeSNyvTPj87tqjDTG/DVopg0v6qEBwvp/My
	Q8OFh/uFtY7PbgghAZYx2ZY4RWrCzAhCqVCDluKuUwExw/N3KLxU9iTulFoBxzppwET10Jj1hMG
	LSlY4LGw5wFy2U37TrF96F7D96LeLx11DVLf4sBRXuVCKcTB839mikuqw8yziAQlgQYHKnsDU2K
	UWkXebwqnOSmTsub6J0zddlCp2di7HFCk97VPDOTefnsG+X1oQxwzzjCeSjWDsWTC+Iz7qqDiGC
	kvBvFXvWiAxetx9jX4D0n9nt4P9CMVk5RrNdIRilXi+FdDR4T2xs5WuRX7lLnxeaymk9+xarjMh
	wAaYEIyzicMzHli/2fklzJDkcYRLZJwU0JAFkjayFgXAqaVlO2bNShd3y2Pejo78S45Nb9z0mqJ
	X3XsbPUFIbMlI7ocSVDSKBArzxv9MJKQkXH0V/I5Z8cRI+ri67UlaRztEGBa4DP6vBdKIDbf/WY
	Xoxc+zYlbYnb5NWT2iMsn+GSA4oOVOW5bDw
X-Received: by 2002:a17:902:f68d:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ce9f17d4c0mr24607395ad.35.1783762414004;
        Sat, 11 Jul 2026 02:33:34 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm71389135ad.65.2026.07.11.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:33:33 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v6 2/3] hwmon: (applesmc) Fix lockless cache validation data race
Date: Sat, 11 Jul 2026 17:33:22 +0800
Message-Id: <20260711093323.14529-3-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711093323.14529-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In applesmc_get_entry_by_index(), the cache->valid flag is checked
locklessly, but setting it to true lacks memory barriers. This can lead to
a data race (TOCTOU) where another thread sees cache->valid as true
before the actual cache contents (cache->key, cache->len, cache->type, etc.)
are fully committed and visible to that CPU, potentially causing it to read
uninitialized data and send incorrect keys to the Apple SMC hardware.

Introduce memory barriers (smp_load_acquire and smp_store_release) with
explanatory comments to ensure cache synchronization is thread-safe and
fully visible across all CPUs.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/hwmon/applesmc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 9b2d9ecb20c0..317135fc4b73 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -33,6 +33,7 @@
 #include <linux/workqueue.h>
 #include <linux/err.h>
 #include <linux/bits.h>
+#include <asm/barrier.h>
 
 /* data port used by Apple SMC */
 #define APPLESMC_DATA_PORT	0x300
@@ -373,7 +374,8 @@ static const struct applesmc_entry *applesmc_get_entry_by_index(int index)
 	__be32 be;
 	int ret = 0;
 
-	if (cache->valid)
+	/* Pairs with smp_store_release() to ensure cache contents are visible */
+	if (smp_load_acquire(&cache->valid))
 		return cache;
 
 	mutex_lock(&smcreg.mutex);
@@ -392,7 +394,8 @@ static const struct applesmc_entry *applesmc_get_entry_by_index(int index)
 	cache->len = info[0];
 	memcpy(cache->type, &info[1], 4);
 	cache->flags = info[5];
-	cache->valid = true;
+	/* Pairs with smp_load_acquire() to commit cache contents before setting valid */
+	smp_store_release(&cache->valid, true);
 
 out:
 	mutex_unlock(&smcreg.mutex);
-- 
2.39.5

