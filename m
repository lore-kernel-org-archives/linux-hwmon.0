Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219559;
	b=bC9c27Y/NdZmzVPXZ7lFGCf3ewEfxW1GNq/5AxxK2jBwUsJrScI1g9T7apsdzcx7eAq9
	 2exn9GAxhChVcrpt5RPEFhlwRjAQXNLy6qtovNIpMViZZAMT+wCHaHZG2/0Klcoc3Y/gz
	 8boIvy3zzMYCTWz6f2fNQE7M9SmaBOPtbokBtPUYDQR50s3dSh3ViIyEBCRmISgH8eh/u
	 3L8fNjkppED33aJvb92SC3DWzwrmH52Cc0zGP1lvLF7F71uNUjatWXZ84Ya8lynhsy+Qp
	 Z4lujVdI4Wmj01C/5Jt2FjxXwffQr60Ajmv57MBS4rBeGe9wzoQdoKXwx1Mr9cUWcEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219559;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E0t6MsfuW+XxWkVjpL0Aj71g9+y9Dg7DgPJLNkOm0iY=;
	b=o6QYMC+pVfYywEJgXs9kmLSVGsRvgQyNEOm9fSmB6BKZi5zhPY5Zhh9CeF1Ntn2Vz3dH
	 Brq/9G/RFnTUhnRZekM9/HJyyBcsex3zaIecQWO6J06hFg5hogee7KVSrJkstF0GIr2ut
	 giCzTo4KE0z2NiXTf0bwQMKft/mubIJ4xxbU59TW3hiJylz3ZAV469mPUGr+cFJZzlGVD
	 rC6NAeJn59tJrik8xY8CwXq9lgTBHh/WnQ3CtaAjkSLyaQYRBzPfdNb2po+hGy3d9n3wd
	 pZ8HhBug5vQ57tCiCFEIZeTE0R45Ts2LMA5xjMpY37tDGG3GCzvEJYxPj+j1XXpJtuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=TCGdSjS8;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C82A606A321;
	Mon,  9 Nov 2026 10:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C82A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=TCGdSjS8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=TCGdSjS84ptgymyragoMmqh5D8c4zR0DhrkLOGtVlUVLKrM+M6fTPsUUEcjM86N/IJyQkaQ3DipAl
	 LBp9c7sjfB4svtQwBqh3q0UH2b/Cz6Z0A3ac2+P1KQjGxypEDgFss11lQigkBT3axJbk83uEF6hevn
	 pm02z26TBBi8bTLk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af19e2328f-c5aec;
	Mon, 09 Nov 2026 18:19:17 +0800 (CST)
X-RM-TRANSID:2ee76af19e2328f-c5aec
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af19e2213b-8bc27;
	Mon, 09 Nov 2026 18:19:17 +0800 (CST)
X-RM-TRANSID:2ee86af19e2213b-8bc27
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83l786ng) Clamp voltage limits before rounding
Date: Mon,  9 Nov 2026 18:19:16 +0800
Message-ID: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
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

IN_TO_REG() adds 4 to an unrestricted unsigned long. Inputs close to
ULONG_MAX wrap, so an excessive voltage limit can select register zero
instead of 255.

Clamp to the 0..2040 mV register range before rounding to 8 mV units.

Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/w83l786ng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index d16afda34e41..0cd545011e73 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -101,7 +101,7 @@ static int temp_from_reg(int val)
  * in mV as would be measured on the chip input pin, need to just
  * multiply/divide by 8 to translate from/to register values.
  */
-#define IN_TO_REG(val)		(clamp_val((((val) + 4) / 8), 0, 255))
+#define IN_TO_REG(val)		((clamp_val((val), 0, 2040) + 4) / 8)
 #define IN_FROM_REG(val)	((val) * 8)
 
 #define DIV_FROM_REG(val)	(1 << (val))

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



