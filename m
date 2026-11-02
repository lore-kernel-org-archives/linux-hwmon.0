Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660039;
	b=bwhjDnUDlhFY7xBTANDge94kh7sP8+inosFPJnFZyLjAKTKUWl7ExGsjvROWeQuGRq53
	 H/xcfjhTgxCjO1IxSpW4KWVL+qjZD3WwbMCQGOh8LrHiZHX3E+DtGcSPWiDHmzuF/+I3Z
	 WdbaEPs8qCURgucODUluXXkDzZZHuGkG7ZhbzGS9RZH7ZRGNW9VBjZN0P0B3NL0uAaLPU
	 itotdAl/cAuSAsQhOj37Lo041hs4IIDypL2b06ALD9g3/GIj9vd9F4HeldwUBWNW/+m+p
	 mWNifCvimckVbE9578d8vAa2Z1sdQjos/28mE3RfJoOC689YfvcabaI+ikL9GwIiAvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660039;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=LN9bMcT0euj+zZdRfqOju/ozAJtIj156Wr4bgcrgzRw=;
	b=AnXNhxTR+lSutE8cxxRSh4ub2tnBKiPV6vsKfwkh7H5hXx0ReXHN0G5XUevfOTqoNBqn
	 nbrBW1+UKO1Pj/OEO9KmioRKVbbHm5cTydaVUXlY0HA2MNzDHXBf3jooX42P7wLpVe3qa
	 JfsLvMKK+uPE9IaGjS1z3dgPa3afvDHXm0cUNdogjwYL6Nj7dRW5ISGKbJtIzh5PUxHTK
	 zjPEvgE7elxhxy/ZIjBXwaoOAp7BEmaHQkpyOdo0EsQ38aIChjrUMFpG2ohLcaLBGoVT1
	 DwldqJJu/fLXURwfzUbx79a0rtRW4YGAWaWKOiXu0V+CxkYAP/qdTZeMvEL75D58apQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3KMG0sM3;
	arc=none smtp.remote-ip=44.202.169.32
Received: from omta033.useast.a.cloudfilter.net (omta033.useast.a.cloudfilter.net [44.202.169.32])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B4606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3KMG0sM3
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id NvI2xyLQUPG7QO0ucx9GKs; Mon, 02 Nov 2026 22:53:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0ubxVIhT0ULmO0ucxLTq3; Mon, 02 Nov 2026 22:53:58 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae91486
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=1Ez6V3JJn854t96LNywA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=LN9bMcT0euj+zZdRfqOju/ozAJtIj156Wr4bgcrgzRw=; b=3KMG0sM36bkK
	iUyYwJHYnBM9u4Udq0b4mjR9swjAcAwWqHac7iDPEshg1FumUjXfK4LUBTYm4746uBFqSvc2CKVkA
	hcigGl0c08rsaAAo91HJtUY58QrXMmUsryL0X4JoVHPFzj+OIiBzXv3s99sDjJPZccdCS31UK6NKG
	qfPCYHyzB6fV/5ilQ72lA2KkZ5MEDDd5c0dE7bCpWcD8mSAArt1dLT9NraMEFTYNTy8PSF9UbxyFu
	7qJ+aitXRVIRxWxVEHYgfA6Sgi42QJYTQlXAyQVpFgeqUSFhA6ZVIkjaoUDeuyqv7XkiiizxQ1R6p
	eLaW3wHACSn5PkBVQyO5pw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42722 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0ub-00000003kpB-22gY;
	Tue, 03 Nov 2026 04:23:57 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 029/102] hwmon: (f75375s) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:22 -0800
Message-ID: <20261102225235.334487-30-linux@roeck-us.net>
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
X-Exim-ID: 1xO0ub-00000003kpB-22gY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42722
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 66
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOI9Q7/vVRciUPULw98Vq5Ms6c0DrFK74YI4MFA2vIr3Rf5iRZlCx2VbLFg3NpLs1kgbftI8qw0sULNSi+POjaYvuEpub1vTv/utiKSQgWS8suZxA3Lu
 18sqUQxkiTy2a/p0b/JpTuxSM4JL/oggWiSb/k989qT6sft6lPD+XLDfx/Po4PyqOnvsovk0sI9HzA6XZ+B6WEtuQdbkmUA2pDFMTXLLo4BEf1JQ53f2pIvq

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached measurement and limit values from updating.

Convert last_updated and last_limits to u64 and use get_jiffies_64() and
time_after64() to avoid wraparound issues on 32-bit systems.

Fixes: 84f1e442968a ("hwmon: Add f75375s driver")
Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/f75375s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
index cc3a9612f2c0..ec51051ba09d 100644
--- a/drivers/hwmon/f75375s.c
+++ b/drivers/hwmon/f75375s.c
@@ -86,8 +86,8 @@ struct f75375_data {
 	int kind;
 	struct mutex update_lock; /* protect register access */
 	bool valid;
-	unsigned long last_updated;	/* In jiffies */
-	unsigned long last_limits;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
+	u64 last_limits;	/* In jiffies */
 
 	/* Register values */
 	u8 in[4];
@@ -157,7 +157,7 @@ static struct f75375_data *f75375_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* Limit registers cache is refreshed after 60 seconds */
-	if (time_after(jiffies, data->last_limits + 60 * HZ)
+	if (time_after64(get_jiffies_64(), data->last_limits + 60 * HZ)
 		|| !data->valid) {
 		for (nr = 0; nr < 2; nr++) {
 			data->temp_high[nr] =
@@ -178,11 +178,11 @@ static struct f75375_data *f75375_update_device(struct device *dev)
 				f75375_read8(client, F75375_REG_VOLT_LOW(nr));
 		}
 		data->fan_timer = f75375_read8(client, F75375_REG_FAN_TIMER);
-		data->last_limits = jiffies;
+		data->last_limits = get_jiffies_64();
 	}
 
 	/* Measurement registers cache is refreshed after 2 second */
-	if (time_after(jiffies, data->last_updated + 2 * HZ)
+	if (time_after64(get_jiffies_64(), data->last_updated + 2 * HZ)
 		|| !data->valid) {
 		for (nr = 0; nr < 2; nr++) {
 			data->pwm[nr] =	f75375_read8(client,
@@ -202,7 +202,7 @@ static struct f75375_data *f75375_update_device(struct device *dev)
 			data->in[nr] =
 				f75375_read8(client, F75375_REG_VOLT(nr));
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

