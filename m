Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671022;
	b=AuGtqDDadvTzc/7rOm+G63lhBLfeta8IBv5anHbuWyVqyFfBzaXn2UtviM65k4T/tWrj
	 6BEkjqgpZ7qu1gl+RIy/jj0eJ2LtxSUaIfXxbZdkdCVS3Rme8koZ9JSBSwo2jVtiIIr9E
	 icVq/3ka32/VYMODR61HLyo4RGiZwlq+aDRy+NpXY2p1RpDvkQ4rXEKNCIfbJLihs9O/W
	 JKBUs7wgMFGolkafwr0yhrghGMShDVReLt4PIpVIMlwgilnxb53XhZ7NdBEvGe4PXDCIB
	 7LKPMbyq8sSj6hmIOj5vfN/0LzMRwKV4NwpZNoJ41VNksD9UcDPyopmK6C2UgPDdiiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671022;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=2d/asoibZcbkjKW8wenpmAdSI4p65XrIyn5w52MX6wQ=;
	b=tKJqTLbhd9fP/zM1FGDeRWGLwmMmzN21OBFXmn0+VAUHD7OqaL7YH0axjZ/SqTodT4a/
	 URRQRmtiVA9n7weTJIzUWKmC3JhXEKz7+LSCCWgZ3LkWwJD4XKeNK3OyOW5UHgPLlmMgn
	 tp7BLnvt2I3j92MeBCz3TUtyNhXFE++Hee62dP1A2zlvmYraTheH4d5ooFoJL+U3WUXPf
	 HLdFSfLbMDWjfrD+x4ISbFBTJI5949HdblpkB8ce49KflfibuSNOrp9vpJ+6mN9U9wQst
	 4Ju17XBexAjCA42pE9BQAq4SkT3MrGvXvG4gq+XwNh3cly3LNSN0BkIe/rnfnaG+yWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vQ1HXqGS;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57734606A327
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57734606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vQ1HXqGS
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id NrdrxChnNusRSO3llxtoq4; Tue, 03 Nov 2026 01:57:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3llxxywjNSXiO3llxFvPt; Tue, 03 Nov 2026 01:57:01 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae93f6d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Kh_8P0OEGJwvOW57jisA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=2d/asoibZcbkjKW8wenpmAdSI4p65XrIyn5w52MX6wQ=; b=vQ1HXqGSaQZu
	fJ+h/W5QTffNuG6cLQWWB8Oi6yrYzwbtuWY+Cs0nxKbFzr6rv9JWndw5wpX+4bRRuLGboaz+Sbd9K
	Mg4/upEdsSUQfPKqcZswAVOrfEgVO8Prm1uLOH/MbspAmUxp9HvFiM00mJomQYTWwKYZRFJhpYe+Q
	1gzeXWk7QYrGlz/+3LetOB+klfpsJhYfmKJq8t2QnH2OR7pf1I/UisN/pGoECk91LNiLC6mQZxCej
	q9vb95Mgok97WGRwpS4lV3TGoQOmOb3f+nyQD3u/3N3A0iN6/A7FGudLXCDGJdj9umfl6pYX2mCLs
	T36ObXg9Gf9ThRVZ3xuExg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53936 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0w6-00000003le2-2TPm;
	Tue, 03 Nov 2026 04:25:30 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 060/102] hwmon: (max6620) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:53 -0800
Message-ID: <20261102225235.334487-61-linux@roeck-us.net>
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
X-Exim-ID: 1xO0w6-00000003le2-2TPm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53936
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ2vWCfHkNMgFwEBRKTsJDHyH2wpH9DBCIDo+QzUIdXAHamD/ukQ2qNgKdidVlkAjtSIXlDkwGtxH4RuNgWeJ+EzlwEBJxDAimQVOLxfpuUpfXReyAF7
 biS99EmIly5gYLcz0XMX6JM+K/7PHQ/dGzBMo3+2U1VP9CaFlnVpsQHIUK5zjhsmYa6e7fJNk9ymYsjxPnjDCytLtIAoD8eHJPDpo5h9P9Um5fGeZMRy1ZCN

max6620 uses 32-bit jiffies and time_after() to determine when cached
fan and fault register values should be refreshed. On 32-bit
architectures, if the sensor is not polled for about 24.8 days at
HZ=1000, time_after() wraps around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: e8ac01e5db32 ("hwmon: Add Maxim MAX6620 hardware monitoring driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6620.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 100acf357b5f..dc39f247825f 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -131,7 +131,7 @@ static const u8 target_reg[] = {
 struct max6620_data {
 	struct i2c_client *client;
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* register values */
 	u8 fancfg[4];
@@ -162,7 +162,8 @@ static int max6620_update_device(struct device *dev)
 	struct i2c_client *client = data->client;
 	int i, ret;
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		for (i = 0; i < 4; i++) {
 			ret = i2c_smbus_read_byte_data(client, config_reg[i]);
 			if (ret < 0)
@@ -203,7 +204,7 @@ static int max6620_update_device(struct device *dev)
 			return ret;
 		data->fault |= (ret >> 4) & (ret & 0x0F);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 	return 0;
-- 
2.45.2

