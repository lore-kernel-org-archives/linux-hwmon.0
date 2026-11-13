Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548981;
	b=f54OW8wDt01XfVhJZQJlo7hZduaCl4q0QLNtEk51uQgeFpnaZd5laU6LpTM4lloFh1L4
	 TnFiLirYq+L2NxrCs/DH4PGTsmDO5FoCpNMockqU2iooclSpUOacgvZAkaXPTdIThtdCH
	 zkjLSuq0W6BnKfEoQyccAYtfX5fAg0u+Vv7XE0OU/zwDOrHJuxvWAZuNjSjrPi4P1pjkH
	 LMHTVzUjPUICmjbMA9kA9wtXEdgoBPORrsuwt/hz8NBn4Gx50I6G1J0nKiDVe5tzNLi+d
	 p7QOB9Q0HhEF+WIpGGsmvdHbd184M9hClAzcBSUTAvJDzPEyn7RNTmTsSuhTHbzGxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQdVfz3MZ0n2Y8Oaz47zK9HN2fz7nOQrOgwJG2ZDEIg=;
	b=vkTO7ueSwK4ZqjwoM52K143hmz2vPoXUdWDICRg7y/yKz7MIOKPzMr0C0cfLzf29nJpT
	 bdGtCaiYGMYVeI3TIvTvwMYW3DhtEXKaccLVCmrmn6ZDTRSXqBAF9krSqgoHep/oPSw8p
	 ja3Hp/DvTtPPNbDcteK8Enw2lkRPos7l4Lwc+daIOWZ9BHPgf/nAxtGsQ5qUwIQsdJxjc
	 P5BRDTodYwlWUUbYuz+mb5JeCknDOgyPlPiERAg43IlRvhImzfEXTvOl7mP54wCWSBvtP
	 IfhDwY0DmFHEoPiQkHzekAY0yuhmi3rEoO8GGSELIA63WMclHaiRn4uopKU6skViepQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vo+LxCNq;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168E606A323
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 05:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D168E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vo+LxCNq
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1204019eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 21:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794548980; x=1795153780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQdVfz3MZ0n2Y8Oaz47zK9HN2fz7nOQrOgwJG2ZDEIg=;
        b=vo+LxCNq0Hxjv1jXVu/Ve/PTfjdV+EGgC8fcfGVeqPQdY1IwMwUXiq+8hqvNvnjgrs
         hFJy3xtj79ub3Npkw6fs4B8dt5KeFLkyl021eKZ9i5io5GId4/1yQ1wPf9aKV62nfL+9
         L18T73aQXWNONCCLnYpPtUlLQRkXM81Ma0oUVliXA+uu8KQMUR5CjMhwVTwzF+k4DX3R
         rMthfnqBZAQWj9I7Gs6dC5XbsrRqO746THiMdaylZQ0ezW3JnlGzLusrMIkfEuuVuU9v
         /KtYDujZ7dU82S9xPh8KTXfAGxuKLRc7gHZwwajDkAZGdl22lepzQ2zRMhjh+CRo8RBl
         gkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548980; x=1795153780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQdVfz3MZ0n2Y8Oaz47zK9HN2fz7nOQrOgwJG2ZDEIg=;
        b=AjeY1EhelMg4BWEupIvcKdPriqxuuOjeT4r5gV8O7qZwzhuRzO7ruNm6E8+j/PTcaV
         g8hrdkp91zV5gS8vy0cnHF3bTwy0Y2DHX2eehPPc+HkyvRBBaprnOM+Byg4fCHTHTgnN
         aj7VZZU3zG83WZKe6ruKdMb1pBcPpQssyQ29shUZSGvaS8PndLAaGEC5jITO24xfCxk0
         G1McKHj9zFQ08yUHz1/gHGVCkOJ7LrX6IbWQUxUQsNsFAAXJwiokYODgiy3vySYLgW/i
         HP7S3QI0XYB7zZyNpqgJiCwFitGAC3d0vwIi9iXY3t72y/Q5b7Em725AfmoT3JoAEgU5
         fr/A==
X-Forwarded-Encrypted: i=1; AL+hErGoSlGyfs1jbHhJtZw/xZslbna6WJvmzaG/SA5P+aG4lNHz3x1+vS6s/IGSSNc6yP4bZnNVa3LLZPosiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fEbU2UMubousYKU0gslR7COmKcUkFbcrvP6AXokNg1z8nVvl1
	ZJNNzRYgm4w15wDQqngTnTAjafYlfKYy0AEohz+WLrSeA/r9e/KHCMTNwpCPebNYniA=
X-Gm-Gg: AYBFou2KferNxuUzQ2fs7EqciBL4bWeAIekamrwygFKY+GHUooUVePKQbHyoNtTE4IB
	8J22lKazCS8WK5kEqU65aFdGM5BExHRJ4/m1fCUonFQh7E0vr0HTE8qqaIrOAQNhGoeeWmFDG/N
	DWS+y9O/pIb1X4U+7joO8sfotCWCW6yKrwJBOcufJ1UJhnLiSAvwN/moO6AW3z/vA7jlW7Mncex
	eAqBGPhGeIVJUyBgcwtzr6WMxo/cawWE6yBJBgXD5bNRr1p+B+K13vpicILxuAKMkPqPX29Bc5W
	9ncyJ6v3SFTvgtXGNkL6NGCuhv7+b4wmApr2rfvVvrClx1zpJEAwOm/9HHvYvh87vDwW5YwTDB8
	WJxs/En0lapu8kX6jJ9r+e9bP8zV0r3qAJtFmHL+VIjgxkQe1F4iyiWvAGhdfQMmWydWRA3BY0C
	DrZrxnl87Ei809a7Hqi2+wfK+MQ8mTvjRtaU8LAXjopeT1SLuUw20xAs1YCKJtv6ul1k3Vvjapt
	lhZrRE1XL9mAlvRFiazYO7hKOOpbL5+WhF66mZXaDAZYzByGF+uV5gkDw5A/anl8M/8ZpdhLrj7
	fH81uf0mK6ihkE8LlyGPfUbWeXu8FceJFm7sh32p+CjACiELlgEElD+haMFzrSJNEpDbvO7eLN8
	B2WzBkKABNW+FH+3jLNk++n2GqMcE+Dxv/rGo77w9Snot5c87RdscWEQGzFWmUxE=
X-Received: by 2002:a05:693c:3f02:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3796365ee8dmr1372806eec.3.1794548979615;
        Thu, 12 Nov 2026 21:49:39 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e25c-c447-241a-96a0-8669-d6f0.emome-ip6.hinet.net. [2001:b400:e25c:c447:241a:96a0:8669:d6f0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm3518485eec.22.2026.11.12.21.49.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 21:49:39 -0800 (PST)
From: Wayne Ho <wayneho219@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pascal Sachs <pascal.sachs@sensirion.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wayne Ho <wayneho219@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (sht3x) Fix overflow when writing alert limits
Date: Fri, 13 Nov 2026 13:48:57 +0800
Message-ID: <20261113054857.97048-1-wayneho219@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

limit_write() encodes the limits with 32-bit arithmetic, which overflows
for the largest accepted values:

  (130000 + 45000) * 24543 = 4295025000 > U32_MAX
  100000 * 42950           = 4295000000 > U32_MAX

Writing 130000 to temp1_max therefore programs -45 degrees C, and
writing 100000 to humidity1_max programs 0 %RH, so a limit set to its
maximum makes the alert fire instead of never firing. Reading the
attributes back returns the cached values, so this is not visible from
sysfs.

Use 64-bit arithmetic and clamp each result to its field width. Even
with 64-bit arithmetic, 130000 encodes to 0x200, which overflows the
9-bit temperature field, and 100000 encodes to 0x10000, which is still 0
after masking.

Prepared with the help of an AI coding assistant (Claude); I reproduced
the bug and tested the fix on hardware.

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260725222229.EA69B1F000E9@smtp.kernel.org/
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---

Notes:
    Tested on an STM32MP215F-DK (SHT30) with this change backported to a
    v6.6 based kernel, reading the high alert set limit register (0xE11F)
    back with i2ctransfer (before -> after):
    
      humidity1_max = 100000                          0x0133 -> 0xff33
      temp1_max = 130000 (humidity1_max is 100000)    0x0000 -> 0xffff
    
    All other accepted values encode as before (checked exhaustively in
    userspace). On hwmon-next, this was build-tested only.

 drivers/hwmon/sht3x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 866e9113f..68ab1cf1e 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -388,8 +388,8 @@ static size_t limit_write(struct device *dev,
 	 * adapted for fixed point arithmetic and packed the same as
 	 * in limit_read()
 	 */
-	raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
-	raw |= ((humidity * 42950) >> 16) & 0xfe00;
+	raw = min(((u64)(temperature + 45000) * 24543) >> (16 + 7), 0x1ff);
+	raw |= min(((u64)humidity * 42950) >> 16, 0xffff) & 0xfe00;
 
 	put_unaligned_be16(raw, position);
 	position += SHT3X_WORD_LEN;
-- 
2.43.0

