Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659981;
	b=Sk9r903So5TMY4/m1AcTOCBWsubZt0ODYXFZqvo9e7a4wC/zHmpIW84VYPxn2XM8mLAF
	 IKEfOKQADcYjp0mWJaKN5mN2IC4X5Vf4nrtRZNFeOiXzRGiLXgHWJLBhrwNoHdyCp9Pgr
	 6MG5YeXHqxLUF1nDWVIieT1FAVIIYazw90qVnnbifrMgsBNXvVKKuRX9Ys6FNU5/HfD0Q
	 JTXKaECRGeO4/a9SOlu6yehWTzId1TXBbS7Xiq12KeHVtHGR3QicxHKgx/WkJiWR3qc8o
	 IMXDqa4jLEP9F+z+T9H1GNVOBqGBuB5RFFM/Eos7NF4yh70Z3ZGgdv4k/FWqgUHOq2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659981;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=SuPBv1QyudiinLh+KW9xb0L6H/xrxFTqVMEFUO7U9AM=;
	b=YP90TBOh7ngKIEqNUQZarFNDFcC/KVbv6r/QIbN4sSZCs2KO8+Ugm99SxKe8Su5XfwGT
	 1YO//YviOSwUHCpsYC/WrQtjyv5umzSowUar66rChk/tP/ZAZ8GeXOo4k+6Svvgai+PdI
	 QoRr54LPT4+NWXsADdwcuAh+f/xg7r8iQioc6GMJ/85++G1uh+M3+GwF9URQWRHQH+R2j
	 NU+HaEQt/o/sISr+/MIStWkptUbZWSPlADWl4xyyDXOS3VSAXDnE4AYs9LZHNxqXakxvg
	 DB13iowhckzwowdV1l+QtDhNyshuB3Mc5d/SlsCPoj0Giybe66q/GP7DdGuxRVhOkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2d3R1acO;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E5606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693E5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2d3R1acO
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id Nrdrx1H8eJFmFO0tgxAVuX; Mon, 02 Nov 2026 22:53:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tfxtCbV8LLeO0tfxe5Il; Mon, 02 Nov 2026 22:52:59 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae9144b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=coqORsLqf-ZoYBxgQFEA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=SuPBv1QyudiinLh+KW9xb0L6H/xrxFTqVMEFUO7U9AM=; b=2d3R1acO34H5
	txrI9DElT9B8h/yrGgnobqyRPIv6tYwUaCfVQi87oE4iUO7ifXo6po8ty3rgerU1T1yeA+TR11oZi
	s04TFKaeO4p0jKclpYFbuwcKbPWaPwH/7s5bTtH1zhjNX674XQaFpWIWoF1jSCjFKqRP/GuVoLw1D
	7YFssx6ra4kDnmGdiVHGeIdjSjsd+txL627NrDp7McTDs/HaGWmctKyfsfwMOI39ios6rnu2lpxk/
	47i/gcdMjlwy4LQzzLJdKa2gDi3PTooq3J8xt7PeZT4eyu3urHPUUxijpmlKswwaoznFdSwoo2RV9
	jt7ElxE2PljBt4LIaHvcQw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52678 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tf-00000003k6o-1FEo;
	Tue, 03 Nov 2026 04:22:59 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 005/102] hwmon: (ad7418) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:50:58 -0800
Message-ID: <20261102225235.334487-6-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tf-00000003k6o-1FEo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52678
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 28
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMafeITxCtQLCZdM7Bn+UHlJFKRT6yuGdxPoHIZyn8GDJZfNOsoWlXWvI4S6Dk9LbymY4GVP7snnW5Q8lH3Dn0+7hl2++3lJcOJ8p9J9wfC1ba9JcWsL
 VAp4rV6h9ybahf2zzEey3bWOTskS1As1F8fVZwQIw4A0soTnFwBIIbnFNfeJid+onf5bezLWALvJ6JrHH96ibz9vhM0kjy3wDXmRdMJ9J6j1tasqHAG9vd+E

ad7418_update_device() uses 32-bit jiffies and time_after() to determine
when cached sensor values have expired. On 32-bit architectures, if the
device is not polled for about 24.8 days at HZ=1000, the jiffies
comparison wraps around and sensor readings stop updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
under data->lock to prevent 32-bit jiffies wraparound.

Fixes: 2d8dd65fc142 ("hwmon: New AD7416, AD7417 and AD7418 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ad7418.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index a0c9cf5e12cc..a31e08fb7fe4 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -47,7 +47,7 @@ struct ad7418_data {
 	struct mutex		lock;
 	int			adc_max;	/* number of ADC channels */
 	bool			valid;
-	unsigned long		last_updated;	/* In jiffies */
+	u64			last_updated;	/* In jiffies */
 	s16			temp[3];	/* Register values */
 	u16			in[4];
 };
@@ -60,8 +60,8 @@ static int ad7418_update_device(struct device *dev)
 
 	mutex_lock(&data->lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-		|| !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		u8 cfg;
 		int i, ch;
 
@@ -110,7 +110,7 @@ static int ad7418_update_device(struct device *dev)
 		if (val < 0)
 			goto abort;
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

