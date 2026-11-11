Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365128;
	b=WR8/1h0UBSRNlw5t9iOQluDPfgJ4VnuUMiHDic8L+6KbzGXaGvldoJPYFtybC1ngHn94
	 5OTJst8Ma99ESz36OYe2+pjH8tyPh80B8RGC39F3OMwuPLJjIjbYvjrWbuQ/16B/EI1un
	 ppBA5PaKSCJZaSzcDKS7VjXsBmVbiw2Nn8micGmRw6sFsWy5rHxS0TJoO4Xr/TJijl0uG
	 jQcTuGwADacK5AOfnNXR2uMe/9EYWauVlNtaTLqsltdfKOWtBTwwNVORCReqf4PJur+Pm
	 grnE7gSx9L+RW6h1GXcG9Qy8giBdXKgel7EGfuoYgmNUwKNak5sRf+8FbRM/kKpTtkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365128;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rFhbmKmMJi9mGdLbso/FKdXw9abtublD1KPqag2vqqQ=;
	b=tqYJxWLp3uFEMc1+ME1hql4CVJJ1PvoYTblHGjE9YW+nfb4thWctlvKciA1eszFO+wrW
	 fCA7PLtdKTctC3GMlNLmJ4f2Ah9kx65rEMAbMPRNcUwBMnVYlc9s3jqv1wAri+OtBpYHB
	 XGKrPbrjX6oohzMKdFD6qKlZxgGQJa+HQEp0xw8ZUrpTVDTT8TROSNpzrNiorJGQNKz2S
	 FGxDHvl/bWT3PeowWiMmN6HQKCMUfpLe054Owvq5buLWdUeCiSHjTp/ZYQkQ8cRE3JYd9
	 ggCidl08ICORvY6615LdSY19cc5b34E+CIBFnpMlIFspOYYEJ309YVFoU2N/fMTRTYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=U84ndGE2;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB37606A31C;
	Wed, 11 Nov 2026 02:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=U84ndGE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=U84ndGE2HwwT8rAHtcGJhVLTlpyk1uvw+drnwqbjZPl0jmE6Gfe0OWT5dj3dG92iPZhc6/fbB27QQ
	 WKNzFpDk1Am4C3aaT5/UC9eQJoBGpiQ1Iac5Vb16lpCG9SDzI2ypYpnIcq961xLkkj9PD5jWew2nUh
	 gpynUYQEX0SX8ExI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af3d6c51ef-73345;
	Wed, 11 Nov 2026 10:45:26 +0800 (CST)
X-RM-TRANSID:2ee86af3d6c51ef-73345
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af3d6c5149-cb115;
	Wed, 11 Nov 2026 10:45:25 +0800 (CST)
X-RM-TRANSID:2ee86af3d6c5149-cb115
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing and scaling
Date: Wed, 11 Nov 2026 10:45:24 +0800
Message-ID: <20261111024524.9627-1-zhujun2@cmss.chinamobile.com>
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

store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
multiplies it by 100 before clamping. Large limits can therefore wrap to
a low register value. For example, 4294967296 mV becomes zero on a
64-bit system.

Keep the input as an unsigned long and bound it to the register range
before scaling.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/nct6775-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 6e97e4f08b90..b7c1e8ceaac9 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1039,8 +1039,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
 	return DIV_ROUND_CLOSEST(reg * scales[nr], 100);
 }
 
-static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scales)
+static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scales)
 {
+	val = min(val, 255UL * scales[nr] / 100);
 	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scales[nr]), 0, 255);
 }
 
-- 
2.51.0


