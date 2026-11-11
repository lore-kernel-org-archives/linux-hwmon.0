Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364778;
	b=rm0NxDbzBYjfLDWQMSEnVtWd8VEWqGX1vpO8kK6zsa0KYFUKubVwt5/LLdPj9JE26NMa
	 0g71F56VUou2O60w7XtosXXI6eWBUhSx0sJQj0v1Kwa55ZcbFQTzTBoqInCMeYJ9xeUob
	 +oN7ODu8WzN+Ntk4rma0ma3qTVJcve4olZ3cfwIH/NQlF3o4dMZpZ4cipc9czxf3nBYyv
	 gXzGQIkK1Z5oppMJg8iNkX1I6YWsookNWZk5LtcwiJ0oJT0CO12XGGZ+f/BojNxF9KOqu
	 q/83BTPovt42M1F0xhrklJSUn+w/ez52okNgFeHLTMOJ2fOBxcA84qoyaKbuCX2fYHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364778;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rFhbmKmMJi9mGdLbso/FKdXw9abtublD1KPqag2vqqQ=;
	b=PsZiV8nM2yEepJ9yY2eyT0ackLgaKrDr0liMm4a+E1loVy8rE4mr+fwn7jkgRfLcQ77J
	 KnyA7NqAam65IWevCSD/HBDkQbsrGd82sY+x6yaICOwEdsM//tyr4j/jrqndS2qDSvjeE
	 ZgGdYXMJW6oykkqJOBVIb0ZmxBDCe95oafzFDRKv/dtbh/EcYUOooapkozVA3oJTAXqwW
	 K9UsiFk1EINLLK6Rc4GHLRuZU77fW8VUvlnSDDD1RSBR/xY0c8W9vPDSg7KiGo81IdIgT
	 NvY9xjQrWGzCzlnwtTfhcBe6QxV6mqD9vDGte7/3WUhhJg/Zb6yEk/OxT6BCGFonVvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="yf/yaPeO";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0917606A31C;
	Wed, 11 Nov 2026 02:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0917606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yf/yaPeO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=yf/yaPeOLeHRjMNpvpPa8DaYQQXQ9tXruXBAcJ6E6YhnXSva3ImqratZre7v7RoiLc+T4/4IqO6Nz
	 IMVT2FpaoNdKHJmA+tOrkkv14ZoLINzZRQIHHZNAF9EhkE6bZELakjkievu7GQD6FJwMfdMhfa4jx9
	 4hMxbxEqeIVTPZGg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af3d55f1c5-9fdbf;
	Wed, 11 Nov 2026 10:39:28 +0800 (CST)
X-RM-TRANSID:2ee66af3d55f1c5-9fdbf
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af3d55e33f-ca419;
	Wed, 11 Nov 2026 10:39:28 +0800 (CST)
X-RM-TRANSID:2ee36af3d55e33f-ca419
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing and scaling
Date: Wed, 11 Nov 2026 10:39:26 +0800
Message-ID: <20261111023927.9234-1-zhujun2@cmss.chinamobile.com>
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


