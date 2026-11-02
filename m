Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669600;
	b=BeOkNO+kKziWNlkp5Zz+z0fuHTCYm7EE/ISHS1IpViv3D+0RAlUQp3qLlUlTmmBm2h3N
	 eNYM82ZTqUK9sQliyNL9AfERyg1JGTvBomAzh4SHLcFClj2q7YuNygycsV3bK3HZzPKhK
	 rRQaoT7V4weu+mX0iWClOsMFGCqHa1GVGsaxOJxQj4f7eDjIB99wU00p5GH8AQncvCT0u
	 BpEaBbiKsLPjOKkdI6LoD+o0F7aX3q59Ol9a6W/7ql0Z9MbRhEFGD1R72ECuuW5DTTOGc
	 TAPqFnbG60ov7FMzFXH2HtrnhjPwHwfgu/xlFNdTg860yJu9SR8qR+Gapu/hpWeQbWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669600;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=OKlbMlgQ+aCIqQNv5UBkuYgdgfiK4osL204xnleQ2kA=;
	b=QUc8HtktsdT6ebkzgDHm7sQxh9GHpfxnB6pPrWMZOEqlbPRLHceopgCw2Nooz+SsHrz6
	 XxzetrW5V0oi9K0gyIkfY+8FyObnaIz110sNEq5U3F8dUYQDJFhoGwlm82RORBXyXfr/b
	 NkoOW1AsuN6FsVA21xJvCFwuHGxUAgLlKi/rC42XEqjlFv9lF8iFUPmksKG2Ui/xrGCUb
	 gr+kcv4uGlPCD8IY+noEcQ+QAow6BauRPt7A0rI27ZOh5HP8Ne6u+Ujq8HYbime54tCuE
	 wUu5OJOdacltJuetUbOe5ZK498V135KJKJjPizQefHtKPGB2W7Mq9XJXBjB9l2XM32A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=B1ParjwZ;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBB606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADBB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=B1ParjwZ
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id NxMExE4XbusRSO3OpxtjJP; Tue, 03 Nov 2026 01:33:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3Opxfngre0duO3Opx31kn; Tue, 03 Nov 2026 01:33:19 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae939df
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=caNha_uuByuZbvYLolIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OKlbMlgQ+aCIqQNv5UBkuYgdgfiK4osL204xnleQ2kA=; b=B1ParjwZgJsS
	2oy7wCZr+CyvrD63AGHE2K1Mlf1eAlLOroPZGTyo8UNFloztbKh/8qTDQ8l1ahaj0bMyOq5ZlB4sD
	vlAfwyfkjERZ4m6YQW/vEmB/zff4sd1DEpWWa3gN5B/PStYRpCFM36a5nER7P0ipHfEdq7n0jGYUB
	LNDw+tNgg9atbOt7pW7yrProm68uGjgEbUt+nPp8GdBTZeQ18Qd22H++EH+Iq/kTIBS1zRRhe79PU
	lokoGTmHITYBHIX63Ac/66vs9128EtqUSdBNMkajpu0LIoHTRtRd030sdT0v4ay8C6NqvMEQLvlwh
	wx2N/W/gV0kGp3fdLNvpJQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60128 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0ve-00000003lSB-2Gef;
	Tue, 03 Nov 2026 04:25:02 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 050/102] hwmon: (lm87) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:43 -0800
Message-ID: <20261102225235.334487-51-linux@roeck-us.net>
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
X-Exim-ID: 1xO0ve-00000003lSB-2Gef
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60128
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEnDGKt5F7a6XtgjKQa/JzbCWi8gI6x8KHpKp+77+SqsfJacuDf1Y4pyBrsPy8LRpfrZ96Cg9rtR9KmZVmTfiywgoHWZr8hQQvrK+Mt/s7N9BzYHxFu/
 Z7yQvRxn3jKAzfXMmqeoiWAlcBG6EJDP/abtjSIH1na3OorXDOPKuj+5N0Qd3OdANxaWKpGeSx9SvJJbac5tUXOjsfOCtNajIGq6ppA1gpPHB2oS8Uhx4FTH

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm87.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index bb4e15b66355..902fc617cee8 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -148,7 +148,7 @@ static int fan_from_reg(int reg, int div)
 struct lm87_data {
 	struct mutex update_lock;
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* In jiffies */
+	u64 last_updated; /* In jiffies */
 
 	u8 channel;		/* register value */
 	u8 config;		/* original register value */
@@ -193,7 +193,8 @@ static struct lm87_data *lm87_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		int i, j;
 
 		dev_dbg(&client->dev, "Updating data.\n");
@@ -256,7 +257,7 @@ static struct lm87_data *lm87_update_device(struct device *dev)
 				<< 8);
 		data->aout = lm87_read_value(client, LM87_REG_AOUT);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

