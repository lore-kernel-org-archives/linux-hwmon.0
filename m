Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379990;
	b=hG8RFl/mQ35dHIXEZiqXbRSRktsGynIxYesgbHPJw4bTtc3UOH+zIhrodDmXi/j+mhev
	 iOHW/3sBI5De98ndMvRq59gFMoX6dR9HfSC6dRrGS0WKBHFKE4IMVcljcf4gMuPZuS7Jx
	 2llvRQwkLREQ9BU/Gh+R/659Z6RTtezyNZuY3/k0fvVbf2C1/lGfeA7on6wzKYGdWdA5r
	 ITKKU4+4YCi9HPc7b6cQHwFUOxnru4cbsCzP3mR0qw7xlZYYDtHdcT+eReTd5+07tMkT6
	 5HG6pOol0efCgqakX880XGG/rK4naE15l1gGQ9jWmMqEuPL+xoARYFh+c4DZZYO0hkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379990;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FHnXSqUbFlkuTaX7b2PW4LqXPvnPDYC4FCyfsdCC63E=;
	b=ren+5BVrmbMtPxGlip6E17Cp/I9QqEm2sD6KXVPSexsU/U0jvfJokIhw0DWvVS83txm6
	 83Qjsnj3lkfQWCYIbSY97KxuNJ5gf7aDgYQFMkJvBPhWGypfHvA1iD9CbFKS7/JhyQA4y
	 e2g5jbBLI2o+us7Vay+WHPK9rzmeywjtWuZDuOD1WiqvnNkSlpeNqXK3h2NWPyFHDxnWd
	 YMqI8FLIu1pdtV9wAF5TrdXi1ARW+4Qf3rkKjNPC4ugDNf7Fji/nW6P9gxNVeP2C+6i2c
	 6YodqSMRgGUGbCiC6vxU1PwV9CjnhwQy0RcBJYem0KEG6JKlxjCrKJnnoBVutX1fCZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Zmxqv7Pj;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25A060A2602;
	Wed, 11 Nov 2026 06:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25A060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Zmxqv7Pj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Zmxqv7Pj6diJT2dCEjzGD8xnx2GCevjmDmE2H2m3inlIGTgKX/C2IjzmaEx7Mv6oYkt+mqlAAEV6p
	 3SsQmKMkLQ0T4Pba9M6ECSef9/u2qPHH+HpPBxxyprjreru7pLVDZ+eecHz7cI1+uqqZ40wO+/fHVM
	 G9Ylgr4nSqv8GivY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af410d0319-751b4;
	Wed, 11 Nov 2026 14:53:08 +0800 (CST)
X-RM-TRANSID:2ee46af410d0319-751b4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af410d3247-d248a;
	Wed, 11 Nov 2026 14:53:08 +0800 (CST)
X-RM-TRANSID:2ee96af410d3247-d248a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83781d) Clamp voltage limits before rounding
Date: Wed, 11 Nov 2026 14:53:07 +0800
Message-ID: <20261111065307.17735-1-zhujun2@cmss.chinamobile.com>
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

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
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
-- 
2.51.0


