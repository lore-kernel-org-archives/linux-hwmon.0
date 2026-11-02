Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660064;
	b=sUI+bykQd2UTl7YKDxkikup+xncz8cxNeJQrOzNjI3f3pTEBNAhsNepus0NzGC6JEU5Y
	 2P3q+M7kxWwqBg3Ec+HKZHtPISHIVZQenfFGo1WaP+MdIaN6FKTmm7sd+Vf6HIGSgaU+B
	 R9cg/G4YThyPoVNlBOTd8bJnXMIBlKEPmP5j7vqaYjJCzRRITWYs3YZFeamAAGn9BOKok
	 pCC3lqedOQZVy7twNlM9NUYIxVkaecNOGKXWxmkiQSojZOb2GDqrsVIdZJ86KUQx97zqc
	 RJCz8rcyQ2gPFUh9zmF7+EkGAOimeDneNLVJqLswjrzuOk7HtujXqdlJSpbYE/H/tAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660064;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=b5jjSnv5tPntLdNf03GjnDmOw9VXFSd15Vvsni476j0=;
	b=Plh/kMlwA+2XDnyWv9FOH8ZX0J4ITiL7T8cwCCTts0TcpSNqXnGlWHHSgFJiZiSXdvrb
	 lcoVLwQjgGiMjpBElfzsPqOPpWor6tLO9CmFQFMESULKirotxdrNCsEjGfhpvbDvpTRjf
	 P8yQW6oWvbQVcplBXUCZXsO0BAlqgG8NGIjGw+/QvkE+W5CWXQvr6x/uWCcwB7Joz2Nki
	 0pX28ZSVlqwM4rbpZhbsfFJx8s6j17sSzVFaMq4+vMjQsc/uU7GFpfL3zaio02UG9wVV/
	 I0k6oFS+PhfMtxFKo5gxXjBJZfIYCql9Ls+4U2o4br5mlLEXLApFTaiZBmhgy02NH1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fPJaQJqV;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C438606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C438606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fPJaQJqV
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NxILx2j3IJFmFO0v2xAWJU; Mon, 02 Nov 2026 22:54:24 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0v1xPNCuLr2uO0v1xE8Dv; Mon, 02 Nov 2026 22:54:24 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae914a0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=TurQp9TYgWexQnFWOjgA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=b5jjSnv5tPntLdNf03GjnDmOw9VXFSd15Vvsni476j0=; b=fPJaQJqVGZzC
	D3IdBgIEIOMu6fgJcEibpF/g2dA2JKfYrSobqBgyuM4XWvA1Udtn/ju9Dv/9YADnP0L0SLEiXWDvL
	59LorKlwP3nTO0txvHUWRFEozQsxL/wTVbfAqTI+rHKd/IDOtJ5FfOel6KvEcFfZD5YHySPpxtdqA
	nbzyhSrUOR5TbvX8W71gd9E2rkQBlgZgmcGl1fqdNGWIOWXiUeIqgQv+Xne5roYiVX6LznilGO5to
	WDZfsjsvbBERVYYxOyeFa3nmk+tPcpmLaFpZGWlA4Z/fMz9sFxLisV7udsUy/t8eROrvIoxVA+sB9
	EL1zfbmC9gyVjPfCrw92Yw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32968 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0v1-00000003l9l-1vu4;
	Tue, 03 Nov 2026 04:24:23 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 037/102] hwmon: (hih6130) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:30 -0800
Message-ID: <20261102225235.334487-38-linux@roeck-us.net>
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
X-Exim-ID: 1xO0v1-00000003l9l-1vu4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32968
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 75
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCiFhBsagVrUNUlEQOUjMixvP67y2mvCG1Z7svN1a8RzDc41ot4Y7+gqk1jEK7y7W20EG5p3yzPVUVC+6PsQVafKlA9lnnrUiiMbcDkwDUDPVrg5WMBx
 rrqAdPCEeZyK7L0kpt41qEWiQgLOMlJx1J3piF1C0MQQI28mJbFvIj8/66J8WtEG7zVLc08wA24VbJfnQ0oiew8Ny8dzHtdMXccwASjLsMkq3y5e1ec/2v5p

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the sensor is not polled for longer
than half the wrap period, time_after() can return false and prevent
cached temperature and humidity measurements from updating.

Convert last_update to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 27f8b1355504 ("hwmon: Honeywell Humidicon HIH-6130/HIH-6131 humidity and temperature sensor driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hih6130.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index 6a79aab5d128..581a0250c142 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -36,7 +36,7 @@ struct hih6130 {
 	struct i2c_client *client;
 	struct mutex lock;
 	bool valid;
-	unsigned long last_update;
+	u64 last_update;
 	int temperature;
 	int humidity;
 	size_t write_length;
@@ -107,7 +107,8 @@ static int hih6130_update_measurements(struct device *dev)
 	 * than it can react against better response times in conditions more
 	 * favourable than specified in the datasheet.
 	 */
-	if (time_after(jiffies, hih6130->last_update + HZ) || !hih6130->valid) {
+	if (time_after64(get_jiffies_64(), hih6130->last_update + HZ) ||
+	    !hih6130->valid) {
 
 		/*
 		 * Write to slave address to request a measurement.
@@ -140,7 +141,7 @@ static int hih6130_update_measurements(struct device *dev)
 		t = (tmp[2] << 8) + tmp[3];
 		hih6130->temperature = hih6130_temp_ticks_to_millicelsius(t);
 
-		hih6130->last_update = jiffies;
+		hih6130->last_update = get_jiffies_64();
 		hih6130->valid = true;
 	}
 out:
-- 
2.45.2

