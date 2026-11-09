Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219544;
	b=TbFxBUit6v7lbAwHazhg5g60hqWK28dHhEKaxowlWjeOFslwqyc4jq2EUpQompgLDQ3U
	 KCIWQQfJ84bvsA2EC1/WBHGH9EQlB9+g0sxDrSD4Uk4M9SB46ioi9IA/IM2olCBPStc+V
	 C1xi45zoVq8qtEnIDkMsWctcCw2XWoIzKMilK2FMkaR6lf9Sb8F0soOonL7SFxVZhT+3A
	 CxNxRtxovhAg1BfGYBbw0uFk2dpx0WQfLxcciFMoPmEM1icz4Rnr2kIUOaKvL4StnIKZA
	 UDTSfvA9nP/jobkyARhl8Rm7oQSpwTU9LxRMSHsFn7oUfUiZ3DwTTGk9GMDV49xUjRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219544;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yu1CMeW2y/ScxWHJvL6JF9YcYR+i4PwSrezMj7RE9CE=;
	b=uDCdp9XP0PF9RK/zM5+hX1x927tVNfhf42Ss5K48/NrsP04v5LdPBCsmZDKIGZv/mTbK
	 RM4xUP88XbjIO49+AI89Q5C72vIKhK047BERZrGQ7C0Rb/zFgmCyHibuj+/sNeoYZhBgK
	 gPt6JZ6qzKHzP1ZV4QlvkOxw86wttA9yol283QH2i8ZmFZ5c0n+OZ0j+qIXwVez/+L+mE
	 eqMMqbcXxk1JWA6Ml/aPkihvBzHyKQhhod8ApzFSw6fWA1RQUIoDF9MogXpXRO0Poj1PK
	 0opF6uKvTTIABNlUTErmZ27x7rcNWqEb9/DpFPzURR/kMKu9FLSNEJ1e2ORCE203wMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nlGJyAsP;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF593606A323;
	Mon,  9 Nov 2026 10:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF593606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nlGJyAsP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nlGJyAsP2z8jLOzEZRBdvy9vh7r+z8rB3mYMOfHRHcqtejEZ1m5UHhCpmFqFP5lTIIg3JHDYT1/JO
	 WwQqRxmMFeACsetKEdvYqM8Ufo6cI3fmODHLKS48CpLVcesJ9c+PHufynseovStsWHD2CXiD3yLv6U
	 nTStL1/O2Ry+4Hu4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af19e1469a-a0a5a;
	Mon, 09 Nov 2026 18:19:01 +0800 (CST)
X-RM-TRANSID:2ee16af19e1469a-a0a5a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af19e144b1-8c047;
	Mon, 09 Nov 2026 18:19:01 +0800 (CST)
X-RM-TRANSID:2ee16af19e144b1-8c047
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: m.hulsman@tudelft.nl
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83791d) Clamp voltage limits before rounding
Date: Mon,  9 Nov 2026 18:19:00 +0800
Message-ID: <20261109101900.17256-1-zhujun2@cmss.chinamobile.com>
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

IN_TO_REG() adds the rounding adjustment before checking the register
range. For an unsigned sysfs input such as ULONG_MAX, this addition
wraps and selects zero instead of the maximum voltage limit.

Clamp the millivolt value to the representable range before rounding to
16 mV register units.

Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring driver for the Winbond W83791D")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/w83791d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 8bb457326c0b..41c73fca388d 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -207,7 +207,7 @@ static inline int w83791d_write(struct i2c_client *client, u8 reg, u8 value)
  * in mV as would be measured on the chip input pin, need to just
  * multiply/divide by 16 to translate from/to register values.
  */
-#define IN_TO_REG(val)		(clamp_val((((val) + 8) / 16), 0, 255))
+#define IN_TO_REG(val)		((clamp_val((val), 0, 4080) + 8) / 16)
 #define IN_FROM_REG(val)	((val) * 16)
 
 static u8 fan_to_reg(long rpm, int div)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



