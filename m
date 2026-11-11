Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379987;
	b=hcaBepgIwpqW2ElZRv+XREjOE9elnA7b/hNy7kbueX7XJgLmixVkLto/ckUDU9w3JUMJ
	 VPKJzQj5MpHooXv7XdL7TZZQxnlpr8MUxL+Ft0nIBUwZaa1St7B61o4+rJXYiebDeO5ZQ
	 kKGuEjMav+SOi1MbGxIAd9a82gaN8G8eNLQUBGc8LhM9E1FAh4ZlVGmMKv0K/6V2ERMQo
	 3rJOs2GbKf5TH9qvR9S95va496EILWlimRQh2JA0dDxdKGAa71brTovu4ttlxYbLr0k57
	 vPBCBMmbH7ympfyEHE/ufw7KxUBABIanh5kCXZTntcmGXNfi7SWHShSrcwVFh52XR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379987;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=awFRE3w8AJgGExFkiyTG31fuHkX3Sv4JYhpiENOZUjU=;
	b=cqM2fb7EBf9PFqRnDLGrcxe4ayXRWsYydCJ0Cx67/c9yPbK62o4FxTa4VfHj1KJNVrU/
	 fmCG/s9E8hy7aPHvfUq3bMilNLSD3S1cfRkm9ro9BJ+PQ+vUYuJjZe+HwcNsOeybzxrCb
	 8TsL5tNyy+B/LBn6Ek4hvZcu+LH42X3CJzKRxo3oEW+L3pLgBZm887fe9dQgj2ySI5jss
	 3m8saMB+yqUsZmxyOplg8iVso3b/O760jNTcQDAztATnsXaKAjVe+brha+qzLOykutuWX
	 zq5ferIgkqQEDBsD4E25R7emLTdpgn4xRhQfhmr7gk4sFS4SIDVN5pKh9LE7cmV2gNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZkCSZtiM;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76476606A327;
	Wed, 11 Nov 2026 06:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76476606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZkCSZtiM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZkCSZtiMT3vltBE1PB+JbJWBEr6fhABXUDYvEk9hUVWXMoAxn4ZZxspTMXcTzyzoSpkfEQ64xnzKd
	 PpTH6gjj2DserRcr53ejOEo2uDdxRjjx6HP48bXdV916hIHntpMDpImAd3U/NMcYnvtDUOsYjy9vVk
	 vppdP7b9f8EWAX5c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af410cf685-da9e8;
	Wed, 11 Nov 2026 14:53:04 +0800 (CST)
X-RM-TRANSID:2ee96af410cf685-da9e8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af410cff37-d2054;
	Wed, 11 Nov 2026 14:53:03 +0800 (CST)
X-RM-TRANSID:2ee76af410cff37-d2054
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (lm80) Clamp voltage limits before rounding
Date: Wed, 11 Nov 2026 14:53:02 +0800
Message-ID: <20261111065302.17721-1-zhujun2@cmss.chinamobile.com>
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

IN_TO_REG() adds 5 to the signed sysfs value before clamping the
register result. A voltage limit close to LONG_MAX can overflow and be
programmed as zero instead of the maximum.

Clamp to the 0..2550 mV register range before rounding to 10 mV units.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/lm80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 079f79d9b02f..9864df05d24c 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -59,7 +59,7 @@ static const unsigned short normal_i2c[] = { 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d,
  * Fixing this is just not worth it.
  */
 
-#define IN_TO_REG(val)		(clamp_val(((val) + 5) / 10, 0, 255))
+#define IN_TO_REG(val)		((clamp_val((val), 0, 2550) + 5) / 10)
 #define IN_FROM_REG(val)	((val) * 10)
 
 static inline unsigned char FAN_TO_REG(unsigned rpm, unsigned div)
-- 
2.51.0


