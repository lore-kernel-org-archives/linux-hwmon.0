Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219523;
	b=gxVQXO/tk3cHS8oe7ky2w5yd/33gtHpbYvYT8hUcD2ZaHFFvAZ+BL3z6JuCg1qErIfkA
	 nk6QeX6QgdEvFh7gS75drNTnzCdZecxYlp7yn/4TkcJPsd8/S/4IMycem6KSwJ58JXmmc
	 JXlK10LJICVntBtUbYH5Ub1BPqKPuRpz1U8RVu02KVOQ+u7CSI3AHRxHZmYsodnTTfEO3
	 76VPsPH3yH7duK+Etdvs7k9QDScfeYGGegphsZtCXqZJbEoX19Mp3TGU/S7OVV8cUNWSV
	 P/3n6RPbF+XZoglcfu1Y5QXggBEMmz0RyfosWhWwMqk6Varvv1QOXO6y3NoeO75qQqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219523;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=biYSe33VgFjS4CrVoWavx64A7JmoiOhNbzVRrG/IDsQ=;
	b=yoZSeinoNBbzTtvP2Jskdz3tWYaeFLd70kcPsbpVmuz7euxVyiTOD0csBMV3ZTCwZ+lx
	 vjWqlJ+SKW+JHn6pz/HKAoWOAYp45tF8YwBDvPuE1/t+XWE/YE+6S5LbMTnd10PdH3+y4
	 eLrnYc/EYlwlGg3wiC4/v+eav2uXZBYtigckH2JkFIjCN/y1Z4S33MhFtli3SET5kjreS
	 U65UCF82vz+gA9veZHooEZZj6jKGs5QmpLgnnYXO1KaEA/DZ9McqDlhx3P3KscK37fTcY
	 ELv5Al+aqpSVF2ESbXqYDKjWLcsWsp5nnm8OQN6rFShg2ehEKjx0nesiAtFgyYsnUUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dTXuc+jK;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF152606A322;
	Mon,  9 Nov 2026 10:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF152606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dTXuc+jK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dTXuc+jKmZ7BSQ+59E9uy1VXLlzVOXWgAy8uuU2fiVevUA1E9lGGf5pAXa/cl2kJPFQAb+lyakUqU
	 PWqYGrjZX8TUVa7DCFncW7r1swDnJkaQgeHb4Zap0sTLgk52GCVgp6aQ5LhhCoC3m50+nns0bEaSUO
	 RT50tmD9Ximtp4mo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af19dfe280-c5add;
	Mon, 09 Nov 2026 18:18:40 +0800 (CST)
X-RM-TRANSID:2ee76af19dfe280-c5add
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af19e0033b-8bda9;
	Mon, 09 Nov 2026 18:18:40 +0800 (CST)
X-RM-TRANSID:2ee76af19e0033b-8bda9
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83781d) Clamp voltage limits before rounding
Date: Mon,  9 Nov 2026 18:18:39 +0800
Message-ID: <20261109101839.17181-1-zhujun2@cmss.chinamobile.com>
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

IN_TO_REG() adds 8 to an unsigned long before clamping. Writing
ULONG_MAX to a voltage limit therefore wraps and programs register zero
instead of 255.

Bound the input to the 0..4080 mV register range before adding the
rounding adjustment.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/w83781d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index 59d2b9d40920..0a820e64a7a4 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -146,7 +146,7 @@ static const u8 BIT_SCFG2[] = { 0x10, 0x20, 0x40 };
 #define W83781D_DEFAULT_BETA		3435
 
 /* Conversions */
-#define IN_TO_REG(val)			clamp_val(((val) + 8) / 16, 0, 255)
+#define IN_TO_REG(val)			((clamp_val((val), 0, 4080) + 8) / 16)
 #define IN_FROM_REG(val)		((val) * 16)
 
 static inline u8

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



