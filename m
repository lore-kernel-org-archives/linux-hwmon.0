Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028722AE65
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755838; cv=none; b=MIJiP2pKZgOj2wlE2wgIkm8MEztL1UwDK3SA+C0J6xaiW+y/WnXzQ+5d6oyKnIYxJKSIdGtA5d8Tp71Gx7SaYwx/FnPAhc664EHqNgXbjWTNQjDUeEdRR0VeneG7YJZM0RMShVOGxXHPWnjh+0Et0xnc/AgmdhYUs0b+IsELpeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755838; c=relaxed/simple;
	bh=La/atibUoT6eic8PejS1GPeGnQYvwcYlBjGixuQk7wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqDx457WvuQwKVdbcuC7Uy4URhTy95un0a5VKDlbQOW4Gt4qEmBGnBN+PXErwVtlcLZvxK+cmxD+DUuWAd0C5brBYIqyhgRVK/s4XlDdHt23YbFkKvNCeTJgh5efFuTW/GTIlhee2+3sH27QT42w4lmd1hdUMb0BedEj0PkZH/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EonK2LtQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EonK2LtQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso14946745e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755836; x=1784360636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjAq0sAF8cZ8WvSRijs7+aUYE7rdepxgPgaP3UlKdeA=;
        b=EonK2LtQbN0dETqjEkmbM/xtrGEOL7NWrl7y6ysSEjOtN7EAXXsBqWh8IgMblU7rng
         trJ4bcsfAyvVYx79EhwUTaqKlHgYlieyp3+u3j5tvMahOFvpHsCzzf3ld6R5y/+ekXWn
         XLmvwbIz7/hnfIHxu00wc2m3aFghhyEqWHwTWdxX3wq0TcjI07w7cQk8UOlsTzS6a6Ii
         iLq9zbb5L8boqv+6b9PxXBdllZJCbhrO/wasu1pB3117uAzUyYJtFDSJhQr/3lhqhpgJ
         9+wpx+E5HhsXv9XRrKvXUCx0v62YVbNAV6JzA5Z5hGpVNUNuYP01NJuX9flVzCR0IfKF
         Pu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755836; x=1784360636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjAq0sAF8cZ8WvSRijs7+aUYE7rdepxgPgaP3UlKdeA=;
        b=elpZrsc2Tb34CsKmlx4zZQoKhsKo6LbOVq4btTC9EOwHuAptTqDavfsExZ+ANH2n+S
         KoMu7AYEnSNQXoBP6biYq7RL+eWNddNAdu+gmrGAr5cn+DWxotTOvVUj2PwDtkpakVa6
         HiWF1qG3Rr626UzndZs80mJ/PX1lIiorrUzWckefV/1M6SiHlQu0iVqtTTQ3GFYgxN5Q
         gySoXkLzw5DuVKoYC6JbKhG22qyLd4mO2bFmNWTi03WmaeL8ZaxrQBok3GBSPkNsRWwL
         0nFzgrNairJkDWgQguue8BO5k0JugpY1I6Fa0z5vL9feHqKDk3qkES9aXKLU80AXzJU1
         ckig==
X-Forwarded-Encrypted: i=1; AHgh+Rr8tP6rUQPOh/CbWMpTcD7L0y6ZzJAlsY+t89Uoklfrj5mBZrufUO7wrHS7FLK7VHZB3Wf9WgF5Zb5ZFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo4OUJw2+KR9av6RSOyFb+hxndB1a6lsRuolSruhppbxiLd8Gg
	8wfg38BJTwSIf+23Pmc2a1N12VlsiDNyOUbct4GxTrr3pb6gil2mkOVU
X-Gm-Gg: AfdE7cnVDKrJotPV7XkPosgAl07MNGa2+vPXUdGoaQnLETtfZDpaZDGk0T0pkVeXaPb
	Nkw+8sh76BKqxQwByq5eKGCeiGfHt/FNYdUn6JiLbgWPAG73FadtLIwh5Qh+pcRRfmRzy446/On
	YATuvVQjaKMpFf73KgimsuE5VHP7KfK+r40PgKdkXetgZ07JzONytbiDx1vO2YrkqqbddV/unbl
	IV/B/CESqxr9XslqZhBctVF0Zz2aJ9KqPjZMIGFXvzDjjvvdiSz8YR9Tm6Egq8hKV6tww7yFE3W
	O70hbbezAsQobzW7oYszDNeq3bjYE1htflMGOLyHu/xoqlmGvivm8au/gJXjlSatXFS38LvJAu7
	B1a4i43ca7k/zN861oAFRCUp0G/M3t4GnjRnSgvFLVmFByRHTT2F3cg8m669Fj0cUl+nyBQ3TEk
	ChFzp02xwZndIODRUN+Gc0qqBk5XOP92I=
X-Received: by 2002:a05:6000:184f:b0:475:f0d1:eb60 with SMTP id ffacd0b85a97d-47f2dd1b450mr1839947f8f.59.1783755835685;
        Sat, 11 Jul 2026 00:43:55 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm69499434f8f.21.2026.07.11.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:43:55 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) fix looping over banks while reading from EC
Date: Sat, 11 Jul 2026 09:42:07 +0200
Message-ID: <20260711074217.554656-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not assume there are only bank 0 and bank 1 available, just use '!='
for bank comparison.

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..4de6045d1b68 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1189,7 +1189,7 @@ static int asus_ec_block_read(const struct device *dev,
 		}
 		for (ireg = 0; ireg < ec->nr_registers; ireg++) {
 			reg_bank = register_bank(ec->registers[ireg]);
-			if (reg_bank < bank) {
+			if (reg_bank != bank) {
 				continue;
 			}
 			ec_read(register_index(ec->registers[ireg]),
-- 
2.55.0

