Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217061;
	b=g6uB8aBZTm5hq0PkBhWc/qDbTeulQBzvTQ1M3EaLqYZyq14VEh+jbkeCR9/NzHDiaYu8
	 yGhcYI/0l2KLJ3R0AR+C6HqtwTdcR5lTHBCn2Tg2uB/7W/SxAdDx1CyAkleYbgK6r2z6H
	 6KrwE4/KFhsdJaV6DPKsEbxzVk6iwaz96q8RANd9jwSjHXpNO9srtA8qGx/npEU4zF6eP
	 KXN9Q/dispsrgAkx/tpXi8Jrp7KqXiGN3CDMgy+aSEgeWv2HDANgcRDI8ap+SjyQrJbAI
	 pj8wdRJPm2Zyi4fyDoZqe/M10Ng/YsF3Tdb8VZxfpmAyRNzXHial2N4wCkZkvpc4hwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217061;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OkRHc2cmgVoZUU8yVpYqPctgpLaAuhYHRwd/fn2w3Vg=;
	b=N822zBtZwYtrG2AC6SJ7Oe1z+laphsBhEgOeGp50VUzuD7TIHHCl16LIwwqHqW2ily5W
	 ArZl6pSs7fFpTtAyGdk+xfEQWM2AxkbPffLrKrjZ1QAjsU5/Q1M04nugH6gfU3YZ4hom3
	 9J3rrFDqkWtdW79vBJENuerd06zUdUcdL9JI7U7r/MfAf7STn897Tfu+z8uGaH3I2y6yk
	 qrAB7euIO/QCjQcu1AOMdpArH/I9C8t0tMNiOYTwqDZgCqAkSTCFrjhmy+F/yezlw4594
	 HZEFVf5UQXkEKMk9mlhcMBTnFJ3Ypouh1bf/zqil6NjrTg4A2y6K75TpvzvlNn2/uzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=f2CljVG6;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0AD606A31C;
	Mon,  9 Nov 2026 09:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=f2CljVG6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=f2CljVG6DeRdXZwdfVr91AhFFoleblpq2Ymr9aeK+CxQU/XqnpUDYahjlaPAmlxMasq9rSU2NeCmO
	 AzrRH5DyFWLVc7AeVqdBElqIlNACylg39C1jgjK0D845o2jKQq6TSw05n9if6sfulhjM8D91kdpJk9
	 MMX91xNwElmKYDB4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af1944f4b3-6457a;
	Mon, 09 Nov 2026 17:37:23 +0800 (CST)
X-RM-TRANSID:2ee86af1944f4b3-6457a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af19451a08-8a8bb;
	Mon, 09 Nov 2026 17:37:22 +0800 (CST)
X-RM-TRANSID:2ee56af19451a08-8a8bb
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: zhujun <zhujun2@cmss.chinamobile.com>,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83795) Clamp fan control times before rounding
Date: Mon,  9 Nov 2026 17:37:20 +0800
Message-ID: <20261109093722.5508-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

From: zhujun <zhujun2@cmss.chinamobile.com>

time_to_reg() adds 50 before clamping the result. An unsigned long close
to ULONG_MAX wraps, so an excessive stop time can select zero rather
than the maximum. The same conversion is used for fan speed transition
times.

Clamp to the maximum representable duration before adding the rounding
adjustment.

Fixes: 792d376b4f3f ("hwmon: New driver for the W83795G/ADG monitoring chips")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/w83795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
index 96fbb0a5006f..9b0ef0c8c5b7 100644
--- a/drivers/hwmon/w83795.c
+++ b/drivers/hwmon/w83795.c
@@ -260,7 +260,7 @@ static inline unsigned long time_from_reg(u8 reg)
 
 static inline u8 time_to_reg(unsigned long val)
 {
-	return clamp_val((val + 50) / 100, 0, 0xff);
+	return (min(val, 25500UL) + 50) / 100;
 }
 
 static inline long temp_from_reg(s8 reg)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



