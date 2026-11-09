Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219505;
	b=xWOBVA/by3/7gZexiyT86gTVeAC89IBelwZThC/YJCVZJgjdEGak483ss1myCqIhYKp3
	 e+hefXA2lJ71yv3N3dPa9UGikbq1UfC0yusxGFtyGNxDpEIAc8qdGCcBctEGV5I5o7fKU
	 gCtIDaRV+6o1jNOhcWgUKCH9+/4CGvLAHmfzmU7eNVK6aLzVa6I+P7pDUPfTtZl2VscOb
	 b1iVLjgAuN+fWYNk1M156c8Xtoalz5JnbnFW0pWJXq/Cvgu4wWVqPt1ZWbUXcAVjbmoD+
	 LRrGiPJ3cL4BtcmrR18zoNYcHRAJtqCpybFKX2MbPlbJWfSjgDnAeYAwR2eOL4BW3ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219505;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xff6E+9z0CnTHqojLK+6NKginIHfmn7cYiOYUs3M83E=;
	b=cigJLBfKhkhamYrf6XVAUL6l6Nqxh7XTaml2YZRIzfthG4qOMrQhRcekU2c6wrD102+A
	 WOCA8tbP7uqM5XJlDfxE/ajpBEDP9LIcN4kLVcSIjgCTwLVoHG8dlAaw9i5XmejffYoRC
	 rfFs4iHlf2U2B/lkuk/sSCujN1bO2/7OC+6GLImH+yz2xtG6UmSv9TgYpObr6mhNTmL9/
	 bdeUKq1r1AJCIsPr3znsKsCpckZao34i4VRW/3EMCgEYnrGd0e4RUNSe6RVmE5Bnifafh
	 nXzblSKFHgDiUqpZqX6zurxp9oxPkzvavVQz4H2aJlHBYjsEocRX3Y8Y5kF0fYqbANw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=e18CkcOy;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8D1606A31C;
	Mon,  9 Nov 2026 10:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=e18CkcOy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=e18CkcOyQst9a/4biBZZp1VgiiXrCHEmDmH1s+CZAffuuXA7Tno1fQGMD1bIfTH6SSuUmFzi2Bg12
	 sG5dzXJdJr7L56rYOVFrMVMVLZpA3fIP3t8sb+Rk6qSNSwKIbTkVaFZDi5Vqn2a+C1oRfRbvRbVzJb
	 wf13MDIK8HlNFRko=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af19dec8e6-9103b;
	Mon, 09 Nov 2026 18:18:22 +0800 (CST)
X-RM-TRANSID:2ee36af19dec8e6-9103b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af19dec468-8bffe;
	Mon, 09 Nov 2026 18:18:22 +0800 (CST)
X-RM-TRANSID:2ee16af19dec468-8bffe
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm80) Clamp voltage limits before rounding
Date: Mon,  9 Nov 2026 18:18:21 +0800
Message-ID: <20261109101821.17104-1-zhujun2@cmss.chinamobile.com>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

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

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



