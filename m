Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F714052D8
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355395; cv=none; b=h/Lovg3U+Cn97NTFol8Pd3Gp6BXZMR+kykpMg0OgjX73+bKcPkZQtEHehoDBtT4+dzCjm1+GAAWW67pC9Afs0dDLj2jpMANNoUCeUAuYxcdUm+RKluYZ7yT0jT5GhZBlWSI0uQRXZoYp1uA3Xw4o0VXPgLeC4AFXwWO3t3ock+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355395; c=relaxed/simple;
	bh=EB6QqlSVWarMeye1kh1q65olBZUJiWm7l+J2a8MO2n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CY4rZgEbOqd9qhRUKR0POHPOFhYmwhVg9vBLn10/Yt+fRKv/9rlxywb1fKVziojAzW4Ex3Gsab3PYYSMclDLca27W+aK1spPbgVBW8U0PVcjROWKFMAfcrNPdoZTDPNAX2NhgcITacFCAaILnh37OOy7OwhfurtZSx76zzoLg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFop07ua; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFop07ua"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40f29667e6so46542666b.0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 13:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792355392; x=1792960192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/Qhp9t+1Fd28Odv/3FTJ8y5S/UZdDB+q77+/opU0Qo=;
        b=PFop07uacbGVqlspG0KAJIjSODBGe+X9OeJ5ko8P5mEpZPvkmoMUPpz3YD2ekD+wbL
         tHrQt83vsohMEShXYFTQsLZowsiBp1SpYwzXmvilWm/7MsvFs4FX0h3cryFmv0v/hxE0
         eUuYn8BKwuNCt5zx2RBUw6TC5vfmcA10CUssOzB5wMcaFrRg/MG/PKTSDQkttL3ssYov
         nZzlJrIkRHxa6y4i8oA8oLKzi7N6nY3Crvi5xAPplQc9RIxlcVz4ACJpklQA5U/XC19s
         UXksNujOrJ5fDpxtrVfORcsSXoVQN5YlooWVPQgv+3FIUxjGS6P2nTIKcgp99xfMIM4+
         4pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792355392; x=1792960192;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m/Qhp9t+1Fd28Odv/3FTJ8y5S/UZdDB+q77+/opU0Qo=;
        b=Fa3iSs0DCjLleU50Xmc0uxRYXJfwke9Uvwusqq/5dhKO33iBXfpDK2p3bGUU7LEs+g
         GCcj1IELsD9zuH8btmd57oUk1wFRFOI0oxubWBOHCmu4ECf56GqZrvdyK0oh1x29R8df
         WxEh5D/ATLG6GAtx4XIe4YwD3QD0Us1Gel8JmiZ9I/RHZv1x1pw8IJgiZoouAxayCZ/1
         erTdodL4oMn/SzacrOorAK7mtsdG2oUFHMezzLK2Q3Vk9KN0DvMBTAtTCm5BZpbjPMan
         /HgY3bAPQConWocsS0dOgkjj7q02VOAz9URU/wY9x8TYvyy+QkzR36FzmNtLNMeyPVTw
         ByLQ==
X-Gm-Message-State: AFq9FYKEcE1gUC54FXPpcclR2itRyVdSOVG6P46TSF5WKWzKcyZIhBOl
	uLTPKgrV46V2cmU5XgoDOaeXPU1CDFNKnc3PUbC/UnRHDE5KhyshPK7b
X-Gm-Gg: AYBFou0v+vx8CeMVcU8Kr7fijfO0NWXmtDiJyy14PbRGsBDuf4GdTjwfycCc/jY95VQ
	RlWJ+sGNNRjJy03DAqTambSlmVPev4vxIEAmdKPa5cocW7pnBfTYaQ6s5D+N6srPixI550Gd6k7
	CD9rN5MfKb4V/rH4JUyTXYKBzVAOYPhJpgLi/6/tD2SSfxXNiVS0tIWTRQJLMuUDhWMiX2LmtVS
	Cg4tAMPEwAyQrs5O92jPre3zbm7v2WaAl7OhoHHink20NJ9DAwsQiqm+saYQL6mTadfUuEgosZz
	nnRNGZLdr0tld0UmL1ZRFBhBnNTY/DvxfAx9GmOCG82fR+1tfuLuhkKkzJBOJfA2XsTROgfqR0s
	nHJDqQ34jHjocjkA0tszfrQ4w+A3uBO7fXEsxLddnnlIGkOgOyg+IjeN+xHJTF5lYzLWobuGjdo
	XtZiZzMELalFBOOO9AVuIPc3YP//ZyYDTVcmcyf1Wv5OLKpHG6aWaKZY38VOsWOVU=
X-Received: by 2002:a17:907:c008:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c419e53bfe2mr410972366b.22.1792355392456;
        Sun, 18 Oct 2026 13:29:52 -0700 (PDT)
Received: from CachyOS ([176.88.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm284529566b.33.2026.10.18.13.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:29:52 -0700 (PDT)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Subject: [PATCH] hwmon: (nct6775) Add ASUS PRIME B760M-K
Date: Sun, 18 Oct 2026 23:29:34 +0300
Message-ID: <20261018202934.1111462-1-ycistak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASUS PRIME B760M-K (DDR5 variant) is missing from asus_msi_boards[],
while its DDR4 sibling, the PRIME B760M-K D4, is already listed. Without
the entry, the driver does not use the AsusMbSwInterface ACPI method to
access the Super I/O chip, and no fan, voltage or board temperature
sensors are available on this board.

With the board added, the chip is detected:

  nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

and fan speeds, voltages and the SYSTIN, CPUTIN and AUXTIN temperatures
are reported (BIOS version 1838).

The missing entry was found with the help of an LLM, and the change was
tested on the board above.

Assisted-by: LLM
Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
---
 drivers/hwmon/nct6775-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index d359c28f3e0..6af0cd54b9d 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1330,6 +1330,7 @@ static const char * const asus_msi_boards[] = {
 	"PRIME B760M-A WIFI",
 	"PRIME B760M-A WIFI D4",
 	"PRIME B760M-AJ D4",
+	"PRIME B760M-K",
 	"PRIME B760M-K D4",
 	"PRIME H510M-A",
 	"PRIME H510M-A WIFI",
-- 
2.56.0

