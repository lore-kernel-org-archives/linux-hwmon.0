Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36D33E344
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179272; cv=none; b=tNUKmwrzVgMDhngj/lXoS/DG4TNa70cITnLosfBEKuCo6HozRZG+ZZNOQRJ++Z2R6/yaCFPtBw07EsaZDZYe4SzW17F9720ZZDtdrRqe9ZRp60xrMenq8z9sdVrRxMqLlmgRlbX1P2YynJmDwEFX6JtBijZjwwuVBMMiFxoEZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179272; c=relaxed/simple;
	bh=FeHdaBBfyV4F3PeK8+YiWOaoq1RUM3CERCLEzLvj6vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVJVcV/ARC6z1u2PgkKlRFtbQ7rf7dPNwoHIryM6vFmV8r+FLa+H1oaPcNVtpAuI2682LhtcHkWMkg9plBTq5/fe2qBDOpEZjnVF4vg6/anmd0KMCgqVJtpUnbcZkApLAcLXSpzK98Q9fBEMX020Y6entFsJzoGuQTM0qhcWFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJClpdV9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJClpdV9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1560141a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179271; x=1780784071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUVvVFEPyFCdwPbawuwyV/+BICpnO9Bhunehl4oYhLs=;
        b=VJClpdV99Zkhu0zMMuwfyeCfod1IHs+QZ234KPDy6WBjtrIFIqDvIJ4PXrGyjM/HDx
         siyNcBFwOpo1sFVsbzQfeYQGUHi9TfWsXFloQZGaY1zGibrTjyj0tVYVhZg00WlqU7pr
         lvB6lhwQTDtSn8bicxbLuBVsNrPgDsCGk6Kl3uPRvuidMr43WKtC8/7I0D6F6xBoyU+0
         UPlaR4LCmLcbDgfShHRNjBpUug7tOtSDiaB67Gqa9rura18fA15GqU8+JM+vebUFon4t
         C8jYL8b5S08efLRrXivjIijR+QIdcgn+Gzozipkt6gnIbeLKpYG549vSNRkSWcmFR8WA
         5EbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179271; x=1780784071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUVvVFEPyFCdwPbawuwyV/+BICpnO9Bhunehl4oYhLs=;
        b=OFfIKJVK3JZBjUqnQ7Sm+R3Iq7wQps9yjU9K9AlX99Y/XG8pPCu/l6SlH8Yk/39oQG
         /SlS6CbutY8MH3RLJ1WZLRP6yv8nQIzs+Gruadk1V4WI1G1yTF3zFMmkGq+FuxY2NnR1
         rL9unwXmN35VzvBrzs5gVWsOx1dNjwIJn9WGtKNWPVSA6dVWpUADtqr34lf5s5f8H8Aa
         iUFPjbv9S3LeIRKvegKWOfhbhZf9saFYZpFGDpl9zcFHG12kE2iPTmVClo3NvhxS+63b
         jWfSn24pusnAtEVF4ogxTH+BCwuEHRZghWfkDJ+AoGcnG3VfnYA1Kurop2POfcgNTYkT
         NXBA==
X-Forwarded-Encrypted: i=1; AFNElJ/ilz2OJsxn8bf6DxeD8dsnHHrznv4AI9Lly2VT/GAiDcI53KTkGfSZihL4YR/FA9bGfKraNUjbl0EB6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Yqv6UITPWye5s4oICt927X9ignTOJs2/ek2d/uN+YwElIajo
	GoPNTiYNER31ejKb97X0NFOyb59Z9tIyngqy8x8PgI0WtLYzUBQ+0dV7
X-Gm-Gg: Acq92OHrjCZVJa8pZrRzX2v1vAka1bsXHbFGyCB9M7IVh0o5vRMOiFqd5gqycLf722i
	nb3PCLE0PZiaxlczzLcooBlTuGrkOn5LApB1lJTI0uS/q91EI2MPsquItetrt1pJBSvRU9kcmcl
	Kj+H7B+wr+eF6GOIzZBhlORk8I50SEGW4phcbKhzW4fOBikXkjE00QyEBjlnQQBGJRsI9ndwXvi
	+cGYSkymj0hHqlCKE5OlFfp/FbsgAEzDbOqW4rFmF4DnrKPoN7rPXYOMlBERNVr3z8msF54Llzx
	g+BM34jJpCyIHGqMKwhPE0ImrY0GDBkkblEGooE3zqoAnqf8lvZDIZ4ebaolYEhYk8Ht2WLd81H
	ObkAY7gir7+OdRUypaW0D9r+0Yrgv1JZaYNIeFlgos71t+aAGLBbdsJJyyjlEvTBO+GWLBKvSlq
	7ppP11OOjmnUd03xfIFjS/KYRvL3ooaM4WtWcfrGsZ0/xoGftLC7j7NwiIZqfJEsA1G1+2uF9QG
	n3bEGXlwsM7K5o=
X-Received: by 2002:a05:6300:279a:10b0:3b2:92e0:99f0 with SMTP id adf61e73a8af0-3b427e62a8bmr2776268637.6.1780179271103;
        Sat, 30 May 2026 15:14:31 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:30 -0700 (PDT)
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
Subject: [PATCH 4/7] hwmon: nct6683: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:49 +0000
Message-ID: <20260530221353.159461-5-manishbaing2789@gmail.com>
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

Reduce the scope of 'struct resource res' by moving it inside the for-loop
and using empty brace initialization (= {}). This ensures the structure is
safely zero-initialized on every iteration, allowing for the safe removal
of explicit memset() call.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/nct6683.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 0581770380cc..bd30867f9e7c 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1437,7 +1437,6 @@ static int __init sensors_nct6683_init(void)
 {
 	struct nct6683_sio_data sio_data;
 	int sioaddr[2] = { 0x2e, 0x4e };
-	struct resource res;
 	bool found = false;
 	int address;
 	int i, err;
@@ -1454,6 +1453,8 @@ static int __init sensors_nct6683_init(void)
 	 * nct6683 hardware monitor, and call probe()
 	 */
 	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
+		struct resource res = { };
+
 		address = nct6683_find(sioaddr[i], &sio_data);
 		if (address <= 0)
 			continue;
@@ -1471,7 +1472,6 @@ static int __init sensors_nct6683_init(void)
 		if (err)
 			goto exit_device_put;
 
-		memset(&res, 0, sizeof(res));
 		res.name = DRVNAME;
 		res.start = address + IOREGION_OFFSET;
 		res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
-- 
2.43.0

