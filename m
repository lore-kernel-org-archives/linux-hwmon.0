Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0E3806C9
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756687; cv=none; b=Bzfa0mq1eSv5wMGpZdFfFQBcuewzmwJjhWEukRxcVp+zNf5RluY8NEF7j1i4w+gdyWDnWLAJUPI08QUm1KxQO2B5B1brqwIsYjnY7XmL8KUC0xyCHTpGqtCIZkaCRAY9vd0sNFrJe9IipzDete9Y3crf9PkFJ864DYALUcfGvwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756687; c=relaxed/simple;
	bh=PvyDEtDG8TdjDcuAHzeqmpHFrdL1tyXkP2WE36J/VYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iJipdRaFKTLEc4uijaxRvCJ+wFTmQMv6GKb0EvnkvipOyjfDzv8wFFjnIM73h9HdQerA/ePr21ZUP24ad7lTxvxLB992rIP6Vm5z4S/pFiA8lx8J3Aa5ltHGI0GYVytYdLcdlVwChSAB42KnlwI/04buktDTHtGbHI6uDC4U4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caf228a910so12181795ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783756684; x=1784361484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf+wqnGQpAYU6cY0CxfR0PNyYQLqysQQrgD50QiJkT0=;
        b=kOPCLz0+lF81761Z9AUm2d6/YUq8oNJkPIx1kMep1Z7QxEukHHw1eUuNplDd7zytE6
         Dkhx6TA5K//+MaPtIq94WTesfuNsNwnTSv6I5Gz6epXvKSviziUo8JPY5/d4i/xAAhqi
         JgifdjP+zMiJVGitTIiV9RmoMN+X4QRJRmn9EdhyaJdRlJawMQs+YptdHRd1KsTTnMZ+
         DxBJsKV8nlzrcGJVU1OTkNuNRCCqznaY6TQDn5SeF2Rq4ZYeZTR8/3xE287MDxJvPQrK
         DlBTA1hzGHbwXpIDTiBCjr9skS3Qd4XRlndXznSGGL1XpmbrRr9QgYO2BdF6knJwxbXW
         VW+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrc2IVOgpTPVNpi3kRplmYvbSbyx7D2xQDEdOTyE3YokqAIfqGIWU02pSXMdZy+VcB7/hfW/YPimW/OZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAOxc0RC2bNM6dDOFMgc2zuRi/fk4EKsNpsBsNdrTqUdtPFcp
	pYsDAf1NfH6sE4nRWosRN6voQMsrwtAr1xRv65+jbb3fNxI9+6VPJnQ=
X-Gm-Gg: AfdE7cnhQeY4AKWjonPrdLx8YmZbGt2RzLi+AuS+RtI7zSzNFwk/bFt3TZBy2SWiLz5
	QWr3uqOYrPY1KE0Zz0OTtl3kzz/UgCwsGJeOgQDk+QUHHFm6LAnA54Q6tQp1R9rqjWBmKbtk1Pp
	ETbXPkUcbriuagKXU06yHWbK0mHakRyHwGqxVbRQ8igMfVT5WllKcVRjVR35pi9NvzLX6f4ZfYB
	B3UBvxs9MXtVqV4B6al3NhpCVdZOv9JeOZaPxphqg1L591e94lhGoz2tC5b0RGN48ZOczM98ycq
	UI9POFBvyZsDQW3GPrEi2jggiwgvNiKVx8ObgGHS9xNyVzEr2Od5dfjjJP++IE2O6NkyNWNA+oI
	mSLeVjXKB7/W1gjfLZlTodF7kdrSbj6SQ9l1XRniYBD7spPmJ9Ggcoz7vato8uI6qLYsQIC7zMw
	Zn4chmdNSklfhoYXKAIT31EvOSGecK/3VkxyHoiRRJHIH2W3sKR5155j1kgGeBTjGJSboF0NEtW
	s1XywrZDlW7Rxg1seIGWnhx+Q==
X-Received: by 2002:a17:903:2a88:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2ce9e9b2507mr22689155ad.14.1783756684085;
        Sat, 11 Jul 2026 00:58:04 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm71130285ad.45.2026.07.11.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:58:03 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v5 2/3] hwmon: (applesmc) Fix lockless cache validation data race
Date: Sat, 11 Jul 2026 15:57:53 +0800
Message-Id: <20260711075754.11358-3-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711075754.11358-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
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

