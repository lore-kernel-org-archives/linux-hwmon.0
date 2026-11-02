Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659981;
	b=iSvhI3RR08weyNZ06Gi6afe/Zr8PSKPtnJ+9RO39gFIxAk+X2NoZkrINns1Lqwx5H56g
	 ZAkBWjj+Rz4unzrlbliIhknYf8n96FR3nfJ0fsE/1Kyj0WBT6nf1xqA/Svq6826OhpoiH
	 u5qrxaqk54w1oijS5WrpXrM2zyPaKHj+e+Dwei0bG2jmxLoAX8N5hrQltN0BZga+EhPl7
	 f9yqeyUpLksOFhbcxeibFNcFvBJT+ByWFy2H1iptXyDSMSY4FaO3ngTxQgDl5JLBhtKje
	 TLEUHjpJOEQNlkcIkI2WABCHE1lWoCIBiVPmDpUKI8ihYU6tVIa5PZwVsz0ZyXW7DVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659981;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=OMUU768u6HMq/zuBT3ENyn5psy3KOr5HUe8B2yc20fU=;
	b=vfKLB8QnvQYu4iYtxofM7r6kxdZqsng5bRxB0Zzf2DOfoj6DHFGUsttXDUMDmeOfNYZA
	 RA42eNo+uNuzwiav019RKlMkCuUPNOSdUPo1JVTLbr2a1WARG5FW7bChmyPxG+Ns6vFbG
	 uyyZNPv7WDkEwbPImwcE5SQR6Kby/YjKWYzxV+evIXu7WtE6PsppZe8bHT38k4iwG7EMD
	 GzQqfWNEVrI37WeHkmjNkAm8ANoGj7SWzhtkXvVZ52g8ltRtyezkKsqkP4aJOHREK9tBT
	 M0JxyGXxZn7/xyOk1iNDD4W3jHlltopScV+O5S0fLmkaNDaoiLe74wCJKAUw5u9X53g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZchteEqA;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4B606A32F
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B4B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZchteEqA
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id Nz9Hxh2CFc3XsO0tgxXlaC; Mon, 02 Nov 2026 22:53:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tgxtCcW8LLeO0tgxe5Jk; Mon, 02 Nov 2026 22:53:00 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae9144c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=TwegPBokEqnqAMjFF_oA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OMUU768u6HMq/zuBT3ENyn5psy3KOr5HUe8B2yc20fU=; b=ZchteEqAMKYi
	AE8bcOJXMnqVPxjGWcm2G/IoMGs3v8ig+gGEQxzrnqf9aQKBVDxsYlpwjsnyCrkxd2wJjg+JEP3Ha
	ikNJhSUtrPqR9O0Ly8Bkgh+8OVBhkxqaLTxV4KIbjuKDgC9KnJ7D8yaec+5AyHJXgOmwq8XoSHum7
	19CoxuVnoY8Swn534cLoZE1E1I1uc/G3ki8OUWw7eMcDVBqTrwPm/SY1Cr1Gy9v7qLulMSOQHwZjP
	96GOWfcJgh4p1OV4utrYgRcFXq/ycmOtVqVmlK1uboQKKYxZ57wDyjwDzbIFaNAFt0BkU4uQJJxT5
	MxDWvcUnPLm6cSL/jVqwuw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52694 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tf-00000003k7R-3vNb;
	Tue, 03 Nov 2026 04:23:00 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 006/102] hwmon: (adc128d818) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:50:59 -0800
Message-ID: <20261102225235.334487-7-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tf-00000003k7R-3vNb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52694
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 29
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKjPqnypae7P0kXlmSXT/QnOViT2G2yx2JaPet7PuJhY70NyOqD04ZqTKtNexHgEUuWYG08kZIE63X/I5yeANcOyWWgaltSFT7rlJgsaWrUKJGbFrkWH
 8nnoFdS4XO1/retLsdpLi3C/YSgx1QftUD6nf0VaHGmTo/vjULkaWkeqDMZXxNavZPmw+NBMHOLtck2B9Gy108kyjsBXCRQQ14VFsB3rQAq7QxPYjCxgTdy2

adc128_update_device() uses 32-bit jiffies and time_after() to determine
whether cached register values are older than 1 second. On 32-bit
architectures, if the sensor is not polled for about 24.8 days at
HZ=1000, the signed jiffies delta overflows and sensor readings stop
updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
under update_lock to prevent 32-bit jiffies wraparound.

Fixes: b4c9c1a7987e ("hwmon: Driver for TI ADC128D818")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adc128d818.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index e45adc0b84d1..d6108e561515 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -62,7 +62,7 @@ struct adc128_data {
 	struct mutex update_lock;
 	u8 mode;		/* Operation mode */
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u16 in[3][8];		/* Register value, normalized to 12 bit
 				 * 0: input voltage
@@ -84,7 +84,8 @@ static struct adc128_data *adc128_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		for (i = 0; i < num_inputs[data->mode]; i++) {
 			rv = i2c_smbus_read_word_swapped(client,
 							 ADC128_REG_IN(i));
@@ -130,7 +131,7 @@ static struct adc128_data *adc128_update_device(struct device *dev)
 			goto abort;
 		data->alarms |= rv;
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 	goto done;
-- 
2.45.2

