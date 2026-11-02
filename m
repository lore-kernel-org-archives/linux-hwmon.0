Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675576;
	b=VARHYa3lUAX+OF+LUOnxkB2yiOYxwJlBVS3dzFKqPEKvcyIISnZb05yjJfKvUK1c2UzC
	 pYbb6qM0fXJ83DmeGQkWPFgrL/s1z9uGcvesM3rANC6Nl9FRf0IDry6kz8hXBORZB5qjI
	 bYNA1crbBnxGJDkCTuENh+ByjQXkJ7rz0DnrX52vLMQ5hppInhM9m640i2PoIvmNmYjJy
	 tBPaumJzWdyf6Y6yKrGnHx23c3tdnwAMcalHO4nf7dN4bqoOfSIZ8bBskdIkLoW7SnPHC
	 96uuSYjsUhrAUe2TsKQZ3MCmCbPt7morpk9nG95RlGVXqgDfOjuEnrjovqRyi+PIcrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675576;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uV6c1TKVz+fl4sYPjCGdItWQDbscgDBOsMsemOnvXEA=;
	b=TW8cKVHZz7lW2FKy7gwR/ZHChYwD/fkLgRz3nmKzgpBndeOy6z1Bgfg7MaOHk5JiF3B0
	 zfKUuhXKkavH6Gk1mOhJFLx9QJWIr2m1jIalX2WYNH6iRnj1dHj8GkOiYbkr5Urf7xtIw
	 Kbr361obXxde4X3yWu2ECxHzyXYwJYmGnX5aJAH+d58BvYKK0+ddwOtqEl61BpjeabGBc
	 MPWsimfAIVVQK1JB5PWTORWs+Lq/yxQKpjbsCfhmrw8d6mtt7bWTlfgViFhuZJgXZVvJO
	 PpKHp+Q5sw2tZxaYcGJencq9TrgwZZCwVx7cBGO3ckq9TAAaNFN9gS+dZkqdSudV/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cbprvCj2;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D58606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 03:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cbprvCj2
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id Nl5OxEArvaC0UO4xDxYEaF; Tue, 03 Nov 2026 03:12:55 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O4xCxg1LabxHHO4xDxqEXc; Tue, 03 Nov 2026 03:12:55 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae95137
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=uIQ9F_dSYr64Mygn8EMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=uV6c1TKVz+fl4sYPjCGdItWQDbscgDBOsMsemOnvXEA=; b=cbprvCj21H6b
	5gmtrQZHdYwspugiX5u0Pyy1bz+VmdTq0JCuEfpHmELHsx8YqD3SM1Az5C5cEvaZV/aJ6aPeJMSYo
	qwIMKI4egFZsnV2u5Qj1cOvklNDjCJ0frcxwnA4I1uVYc3QiRG0Rq0NRcY+eH73mTYL7LBGK+H4q3
	MCX950rno+GV2MjEbBNtai6GPEax3uDS37K9Kp3H7owFETERjHhX4rRb4jYaSPtmlbnXGuGFPKZq5
	UOkfjCC6d4W6ceTZlZqkuyjLprZMm6QqqWDgdplwFqk6O68MIgHEtPZTkYTT+WRVGgckPVKMIkVDm
	mziAKcf8oC2WxoWmUl+zng==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52486 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vD-00000003lEg-2R8K;
	Tue, 03 Nov 2026 04:24:35 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 040/102] hwmon: (ibmpex) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:33 -0800
Message-ID: <20261102225235.334487-41-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vD-00000003lEg-2R8K
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52486
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH9DE9TpfEOju48mkFHhXIj12NDAK7JV+9pZB2vR0TyR70evhp+l9Rqk2n+sG7xrJx9qZhrdWcXnic82ZQQj3zn/bnUsR1W7XzkQN8naFS9L9bwtSnKp
 hCaVPI0CIBci/NrWqZ+gpMCQY9EM8OVuE0A6QPf1mDrZnVcBuGapUJkDFIwa+hQUp0Pnjtgfude5Tzc8tVoUpyiYlyIsPPmZi5vQpESlJV9S3BG7YsDLu1Cl

On 32-bit architectures, jiffies and time_before() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_before() can return true and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_before64()
to avoid wraparound issues on 32-bit systems.

Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ibmpex.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index dec730798d58..3a119be0d339 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -67,7 +67,7 @@ struct ibmpex_bmc_data {
 	struct device		*bmc_device;
 	struct mutex		lock;
 	bool			valid;
-	unsigned long		last_updated;	/* In jiffies */
+	u64			last_updated;	/* In jiffies */
 
 	struct ipmi_addr	address;
 	struct completion	read_complete;
@@ -220,7 +220,8 @@ static void ibmpex_update_device(struct ibmpex_bmc_data *data)
 	int i, err;
 
 	mutex_lock(&data->lock);
-	if (time_before(jiffies, data->last_updated + REFRESH_INTERVAL) &&
+	if (time_before64(get_jiffies_64(),
+			  data->last_updated + REFRESH_INTERVAL) &&
 	    data->valid)
 		goto out;
 
@@ -238,7 +239,7 @@ static void ibmpex_update_device(struct ibmpex_bmc_data *data)
 			extract_value(data->rx_msg_data, 20);
 	}
 
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	data->valid = true;
 
 out:
-- 
2.45.2

