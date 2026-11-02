Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660051;
	b=zSKMZQ8SCPvhbd56YUOvO5KNb0mgL9ZqNZ2IUIKU3cNDB0s998wh494ov24R03E7KG/S
	 tMKmw5IyVzfE6VEkJroLxhJNyteEqass/xpUvcA607HZ1zbEjMex/9Blm2JPxJcXt1CR/
	 iYr6+NC8unLV2q7AjFuTZv1Y0fGdxU/bfUjLfynVG6MDhkGmDOCH4KYcpH3V3vQ9AoH+x
	 dqjFwFsMoXKFextQPNJpXwmRdqTGLNi+Srac5/yJTlyENqZtrIM4ou+O33+bJrIoeFjZS
	 aMKZOWg3rS02zge11BmwPmbMJz/wLOPAeybuWqz7fWJ8d2RK16fmu5lirgiJi/XL/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660051;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=7kwR+Ei6kUbJA+sfhl/MbK0IrtIH9h9hTNu8IpYo+Us=;
	b=Iofw8/FLAhvVa8MzxpxupYmX4GlrCXY/6epc/8kMrwBxddS3oHK8fECcrKJSQeQ3x4R7
	 l54lIzJnztn5njEdnmaRDdQbQ5A9ldKhRKXfBa/LCO+SPfFNo0rrimyyvbisynqupBCFb
	 tir2+8rfInaLXuUDDaz1ZFtFMzkuQGTayR0GKooegiiOT+p/wJ45P/0ddV+jnYC6xmPXV
	 u9KYqx3X5u213utvjevbf1WV8Z0riNfuTlM5aa9EOkMVes4sozmf8AJKd0XliEe2K/N2W
	 wnwy+WN1AQLqlP7YRGoVqpexZoyOrOfNTDfw3ajVyoOC6MhYT8aGUcmOZSET3i1itcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="a/t0Eskg";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A5606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=a/t0Eskg
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NmxYxLtILv0ndO0upxBS7Y; Mon, 02 Nov 2026 22:54:11 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uoxjMTnmTkmO0upxidWT; Mon, 02 Nov 2026 22:54:11 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae91493
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=XsESRFL8gdzgaRyLTTQA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=7kwR+Ei6kUbJA+sfhl/MbK0IrtIH9h9hTNu8IpYo+Us=; b=a/t0EskgANuF
	q3Fu2oBnZto5mlu/WeIItXRcJy5XDaA2E9c+umDw68NntiE/KFBRDe9OV9mK2X/rGcXgw/IMrrAUn
	ZU1F8CTMRPdnC5bcUEf1egMvab3urQOaF2WVJjlJcx/F3qpBCnLKh+sAamNigRJLAkQB9rXQ9hyVS
	e3bv/3fDEDDS7VNHKtF2pCXjvVhjxoBPxrPJS51jzGN/13pIOV6fZP/pQYeqvU+jEN7m7ipi5WzhB
	jQKvqd4ludY/RG+z55HMApoU+uN4tJz0L0a/HWtvqgfcZeGQvmbPV7mSy/1j2QO00puupOFKqPAA4
	S5kdSX56/oJjcpIylzTryg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50202 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uo-00000003l3T-2PfD;
	Tue, 03 Nov 2026 04:24:10 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 033/102] hwmon: (g762) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:26 -0800
Message-ID: <20261102225235.334487-34-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102225235.334487-1-linux@roeck-us.net>
References: <20261102225235.334487-1-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uo-00000003l3T-2PfD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50202
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 70
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMY7cz6b3jN4POnStBwJRalhnQBEFksrCi8yFTVd6KSHch6xk3oSmdDj/jkqrSKKQjDEOm7APKv7lKLUClXHTJs67uCkljzMM+pPUjqkMhty09eeK9tX
 iiVkEhbo3CZBejmpGjWI9HUU+fgZYqj0TEzWsix6vkP8f+et3kzbXasX2Rbv0c31efhPBpW+C3+0eRLaHzx2TPyyyzd4Nu+vt0UQILZjWtlBhWn9thwmQK+N

On 32-bit architectures, jiffies and time_before() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the device is not polled for longer
than half the wrap period, time_before() can return true and prevent
cached fan values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_before64()
to avoid wraparound issues on 32-bit systems.

Fixes: 594fbe713bf6 ("Add support for GMT G762/G763 PWM fan controllers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 407cf7af4fdd..119a79eb8d4f 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -128,7 +128,7 @@ struct g762_data {
 
 	/* g762 register cache */
 	bool valid;
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	u8 set_cnt;  /* controls fan rotation speed in closed-loop mode */
 	u8 act_cnt;  /* provides access to current fan RPM value */
@@ -202,7 +202,8 @@ static struct g762_data *g762_update_client(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&data->update_lock);
-	if (time_before(jiffies, data->last_updated + G762_UPDATE_INTERVAL) &&
+	if (time_before64(get_jiffies_64(),
+			  data->last_updated + G762_UPDATE_INTERVAL) &&
 	    likely(data->valid))
 		goto out;
 
@@ -236,7 +237,7 @@ static struct g762_data *g762_update_client(struct device *dev)
 		goto out;
 	data->fan_cmd2 = ret;
 
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	data->valid = true;
  out:
 	mutex_unlock(&data->update_lock);
-- 
2.45.2

