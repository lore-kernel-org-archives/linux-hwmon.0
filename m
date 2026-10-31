Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418479;
	b=V7PWMHTILAQaF/KcZPhCpcwewnWV/qtouOh2w9nSauHGN6ictmrkM0GBQd27ESohyw1a
	 L3A4u1AQStMDHmv9G7n62t273EeHmDYqNgSPZmWDX1n9uUGXvECLRLWibq1c9daWvrJym
	 j5/RWWIN/6MFy6ywRiuOb7OOzvKK7gtaUONd9EcPdn2SSbihFAQSXgtFUsxog7AbiInAI
	 jqu6QgR9tA+p40xltL/5Wkl93+52xFvkoIua9nGQqJe8Vwl/wXAbQZDzYfGbus3zSHExz
	 pIIh6MqZBiE6dkIhYvyDg1I82+kHEryJAE1eIErcSfwM5VqQD5fBZgssS8iO2jAdHnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418479;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=wD2mM9CLhcvFTD4b5dKS6E3r3UPreAdTD3FWmeiWhJw=;
	b=B0kYBkhnoZEBmAg0BFaT601wi8sdNDAdAX6wi+2OLgFJ5cvE2jmWIPZzaOw5yucwUtpA
	 3mY+K77hBgji7YTyT4onmGLFhecVZGkadGp2ssGcOvvkqNRvmmkvXFMo6Q+7a2DDhp35B
	 3ZxSTeHnCjEkgQ25uNGRhT7FJu0qsCLZyjW+rX/5v/XAD31zg3+sUXBnaYar/nGByHRx+
	 Ur32ed9dsdG14TQN4sRcp33w4n2ubHCJ7GGRqLLLe6gcHrq2U8G86b/KYDgvGnouc6d6z
	 6JjGMqI3Bl52DHOHovTmnliqkPmNgVOp5SM2zT9wPgbomw4Uv1H2BRZyBPcx1Wx6lDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lm3x41Ws;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AD7606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 03:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lm3x41Ws
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id MmDExpDHJJFmFN04TxsyRI; Sat, 31 Oct 2026 03:47:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id N04Sxy5Q6kE4RN04TxdZy9; Sat, 31 Oct 2026 03:47:57 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae564ed
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=8V66wNYF8r3ic7oIgFcA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wD2mM9CLhcvFTD4b5dKS6E3r3UPreAdTD3FWmeiWhJw=; b=lm3x41Wsp6teUuX6a6+QT1TuvY
	/ON788CQQpxy08LWH2XFZ2Vb1pOSVijfxKKVCNkJjz5aykjsypWSPudlJdPmiy76oNC3YyktRNNr3
	qt5t0/UUw5Loqfx6QciyosKdotCdbyXymsJZ/sqyx/yl4kt9xfiPbMkYQ/tkKn2dcnijA1+FfSj3x
	gtnQe6wkr/HYZyWH3qow4v6L67T1QdNEHXeCPrZqH2O0lo64OFgCQK91XluUPEPW1ZadxeDLstJLs
	pghDJExsYqSAfGVQXTs9THYSTz86hOpGXkIpoRLYo/yi5utU0CXcdLNqLNfqBYhzAcXiybPLHzOxj
	1jDA1Glg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58622 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xN04S-00000003hOT-33CN;
	Sat, 31 Oct 2026 09:17:56 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (lm75) Fix setting polarity mask for chips with 16-bit config register
Date: Fri, 30 Oct 2026 20:47:55 -0700
Message-ID: <20261031034755.1079779-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xN04S-00000003hOT-33CN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58622
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFUyqCfICHTJ5aiPFI9UdBN3UzfjVx2QFSkeaqNA5mKX236aE2emAskQ4RcxmEiCl9eG8KStKto9psMJ0J5zsz0iW3QEHPVl7aIBbINp4rn01/yytoPO
 z5vgzuNaY1fZl0eposkgahiN2Nbzi2Y1JWQ/r5zj4LqoGLJXjnXb5XhwvY7YZd2ncZ9Wb79kZDAigeJ+7sm7ZFmAPuvXVT9TdxmF0kzRvd7/NayQ+yxIOaUa

When probing a 16-bit compatible temperature sensor configured with the
"ti,alert-polarity-active-high" device property, lm75_generic_probe()
writes to a reserved bit instead of the alert polarity bit due to an
incorrect bit shift in the 16-bit polarity mask.
On 16-bit sensors, the polarity bit is physically located at bit 2 of the
MSByte. When accessed via i2c_smbus_read_word_data() or
i2c_smbus_write_word_data(), the SMBus protocol maps the first received
byte (the physical MSByte) to the lower 8 bits of the integer
representation. Consequently, the polarity bit is consistently mapped to
bit 2, identically to 8-bit sensors. However, the
LM75_ALERT_POLARITY_HIGH_16_BIT macro applies an 8-bit left shift,
erroneously targeting bit 10. This causes the driver to silently corrupt a
reserved bit in the configuration register while leaving the active-high
alert polarity unconfigured, breaking the polarity feature.

Use BIT(2) as polarity mask in the configuration register for all chips
to fix the problem.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 1be4001d9b9b ("hwmon: (lm75) Support active-high alert polarity")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2d2d752aeac9..917ac250a648 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -123,8 +123,7 @@ struct lm75_data {
 
 static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
 
-#define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
-#define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
+#define LM75_ALERT_POLARITY_HIGH_BIT	BIT(2)
 #define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
 
 /* The structure below stores the configuration values of the supported devices.
@@ -770,11 +769,7 @@ static int lm75_generic_probe(struct device *dev, const char *name,
 	data->orig_conf = status;
 
 	/* Enforce polarity active-low (default) or active-high (devicetree) */
-	if (!data->params->config_reg_16bits)
-		pol_mask = LM75_ALERT_POLARITY_HIGH_8_BIT;
-	else
-		pol_mask = LM75_ALERT_POLARITY_HIGH_16_BIT;
-
+	pol_mask = LM75_ALERT_POLARITY_HIGH_BIT;
 	clr_mask = data->params->clr_mask | pol_mask;
 	set_mask = data->params->set_mask & ~pol_mask;
 	if (device_property_read_bool(dev, "ti,alert-polarity-active-high"))
-- 
2.45.2

