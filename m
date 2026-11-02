Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668640;
	b=4TrciUzI+DpGNBq9y96grFasjg+J8Vzd5v5ANnD3M+OWZaHHmbcPTbV3gagSDT8rtBrF
	 nsIbiG1JhznaikhvzeMCg+oHgTmI9/TZdpHVWPk/C9htpDx31smxeGNzETO5fawrMTJDP
	 dLYl2IQCCtfcy+y/5U2tPkXlEOPvTjqdqVKDi6bob0m8YQ76qwIZw1wPJucgpYZj99/8A
	 fvhzx4nq7qKbBU4ZfVmL3j7TY7d9LP34qv7zrpveVRURiGRgPtGnJWcE8MZbSja3srwY+
	 jkdm5gPNWyD0wvUCtmBYA9eoorcYGvknxEnBSXOQFlYA+SpJMdcjjHc97t2AlmQuucg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668640;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=IlzXv7UkbPzrYAVZS/RzWtHjBYoW5TstHo0cr73mxjA=;
	b=GnBMS2op74xdlreu6V3xMWsnwL2iQlHQ/kTjIf3om5MXrEbO6TfUMKAok2cqUI7lzY0E
	 008M3+g0rRr7NL5eReYX8Y6U/6UjA5c/z/8zVHZQMQP2MPkcoKdNX78w8dx0i+IO9Rdg/
	 jy92BpCLU3jpXx0J1T+18NzkZ7MaomHFaVzaC3mrWwtJ2wKTExQ/jrXIO5oLw90rb1ulx
	 tNVaGc9lZbHMPXJLKOwL3OpUaC+9MC9Q5tsw0zrLymhASj5MbyOvbBHjog7Cqw4tJcGkO
	 lLUU60PhGDuCVeQ8EhQuZlmczCiB6CWez9J2A35Acmo31z3jaiKyTKO53lnAKvYTmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fn0tFZtH;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88028606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88028606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fn0tFZtH
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id O16txT4PUMylkO39Kx2aSx; Tue, 03 Nov 2026 01:17:18 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O39Jxx2e3NSXiO39KxF7zY; Tue, 03 Nov 2026 01:17:18 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae9361e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=c_LlYydiSkxdqLXZ7DEA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IlzXv7UkbPzrYAVZS/RzWtHjBYoW5TstHo0cr73mxjA=; b=fn0tFZtHf2xL
	I6PHeZqmmVHoqiKUtnunZgmq4oRZzu5v2Jut8ECnX90chU6lKAAy7umn/khEBqY15mbPcze1Amat1
	U8Be3+hOvwIKJbxPsMLo0Df7UWJ6ofhpa3uo6SYbfUGCl6dXtX1EqNVqy4n7xssGIOKiLWLn/0DIF
	vKuj0/4quOdhQmXrBPdw8eLqPGs5G19NwtpgoHFdL7VfdYgtVPq4b3ZQKCV4oD2TKZrFgWWzDp0lP
	s4nVKqQwTlXpTLnQdM+fkQ1Z98ScEj/QTNBvz5ZZzY4570/hvI/uO2rUGvyALDRovcYEkIrF5ReWX
	fkv9U9PqO6Yrhqb4Q0bnGg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58310 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vf-00000003lU1-42mt;
	Tue, 03 Nov 2026 04:25:04 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 052/102] hwmon: (lm93) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:45 -0800
Message-ID: <20261102225235.334487-53-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vf-00000003lU1-42mt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58310
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIysGwFSgydu6gQRyOOXVAZZ6o+JSwZadf0sSuuj6+Js27lqpAmP8j0AZ9KBHtGlNKnV8nDRL5Wt9j67/N9vfU1CDuWY99ICnCUI+LqrS1S2VLMemxnw
 AMZ/pWQARigPWQfO9BPc3qPRBXECpww8jxSgAM+4eGxdAC71zeO/wzmOFbinqGvjDIVGT1e3L7JorcEwky0hv4Kufd36wmRIZrKqSW5Biec5CRjj+viI8B6A

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: e46957edfb85 ("hwmon: Add LM93 support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm93.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 2cbf0af22f61..09bc7fe650ad 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -197,7 +197,7 @@ struct lm93_data {
 	struct i2c_client *client;
 
 	struct mutex update_lock;
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	/* client update function */
 	void (*update)(struct lm93_data *, struct i2c_client *);
@@ -904,11 +904,10 @@ static struct lm93_data *lm93_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + interval) ||
-		!data->valid) {
-
+	if (time_after64(get_jiffies_64(), data->last_updated + interval) ||
+	    !data->valid) {
 		data->update(data, client);
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

