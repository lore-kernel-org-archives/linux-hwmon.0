Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216419;
	b=mKJYT8qKFrCgJ9nQybAbAYn66vBtF5FYRldec8RyBN+6Oh6yjZ848mkeJUXIpE6trNGX
	 c/JUEuY7dxro2zfQqQa/7trSutckE7YTPfR/YAZ7cy2wDXVh4ceGJ0Oz4gwDwVQuxm0kW
	 SVYuRFX3OmEjf+RsmSEIPPDyQlR+XRt9POxNVWIg12xxXS0OHpWj5yGTeP/25RXY8/VFQ
	 PmGF87SIkfi9toY+WM71EC+nxmT5bL1QNozI4NXvDUm7JZ2MtjDzl2i5y9LKaKuIyraVP
	 cUixM0UmrwcEjQy6INQjZc2QJuVzUNb0j6UJCwQQqJRlAjobPHIyPn/cV9Qq6gYX8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216419;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DdokkUU7jtX0nt2wAdDB24Xb0J518CPnR4clvwHs950=;
	b=knhnwGpNqtRaU63zCMijxuWmZ5VbIHWkpS9MUW+rkJbBfnC7D5lEmqb3W9tEIMnixt/k
	 O+9IwSDxnKL4NpbvdxseIgJGDEOtiJVUxxJL4b+IPhhI7NTpu3RKTqgJw6XhJC0Z0NmMi
	 p/XnwZ0NOc5G/3tTZ5vXgjfppfLt19Iry6B3NNBpXKomH6Zy6tmYAdGu+ouIqOFzaspiE
	 sJxxNN2uemeOPJ4/rqs4IZAN6BIlJc5cb1NklW0uc+iVnfTisRza+1/QKHXMUOkH2d31l
	 xpxp5BTUJVrFT6gVolf21VKYKnkHa9rACjRnejROvJ6CfVqz+JrXc1rvte+U0ZcMscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MrrEeOQU;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D96C606A326;
	Mon,  9 Nov 2026 09:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D96C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MrrEeOQU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MrrEeOQUhAldVu0pFnKq1YQX55Fhk3MZWvIHPKf65+8gDY6s3T+aZMnZFOqp27jG88juUlMb1fQ2W
	 fA+KVPIBReYBaZybvTy5zPj7aK2nmKDvTAi44aoS2TwJuWM5z1drJ6IiJdBgX8pW/ad3Q7rVJ7m3Kc
	 crJzBbu37ozCOwas=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af191df7df-c9a86;
	Mon, 09 Nov 2026 17:26:55 +0800 (CST)
X-RM-TRANSID:2ee96af191df7df-c9a86
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af191df6ec-8a1c5;
	Mon, 09 Nov 2026 17:26:55 +0800 (CST)
X-RM-TRANSID:2ee86af191df6ec-8a1c5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
Date: Mon,  9 Nov 2026 17:26:54 +0800
Message-ID: <20261109092654.5177-1-zhujun2@cmss.chinamobile.com>
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

in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
before clamping. A large positive voltage limit can consequently be
programmed as zero instead of the maximum; 4294967296 mV reproduces this
on a 64-bit system.

Preserve the input width and clamp to the representable voltage range
before multiplication.

Developed with assistance from OpenAI Codex.

Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/w83627ehf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 9c08ab662dc6..5c04b9c52b76 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -293,8 +293,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scale_in)
 	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
 }
 
-static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
+static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scale_in)
 {
+	val = min(val, 255UL * scale_in[nr] / 100);
 	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



