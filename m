Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666426;
	b=qm2wYNGkaXHgl4W2hSqb22eT4wzky7RmZeM6L3LBvQJBKfdX3CSVUnyDqlMteHLEAMZ0
	 A2zJmnGfDEu8iFB8z2lOAIsQJPpTha61MvwzX84EQ3elzfMfrdCw8FxNlHpjG9vNzDpdu
	 7pyxV1eVv1Kosz3JY0Ew+7TxBBlMG3S3pvZEoPQWOCXc5ewPKSZjbmb6hU5o39y96S5Ya
	 0Pq0WNlhwcZuFr819buR0O5EyEfvjtfebOi2vXqF/bQglfPgd2tt4ATauVgfsWvP1VUfG
	 IIgZgpH18ae7QB4VBt3lOeDlBa7EuMFGK6R1Z5cAl+b1Pl/mIaaxgh/xnMUQb/Ue1Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666426;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=udLeOkuLaYs2tKawHgHDPX67/7DWCXsfdQockRk3M9c=;
	b=F8+WO+hAgtYFVk75Wh/durIT4ZdiKLy3wy+iZygQ17PL0/O24CHLAc37mRMN4MQY4IT4
	 JVdakJbkpSWBQXUbDUwMbVPC98H8q40LnraSxaGMpN/WSAIqAgy798+wGPZeOL+mMj3e9
	 Ibdk5iBQwT3O0GMTzLnmeP+6CgysWB9/CeimWvrvNZZx2T/hiE4wqXf2s8EnFmsTeSHM5
	 jrq3lvLUnpwCL6eVxPdg8UHf0UwRQKdol9XSc+f0TA9nyZOPvOKQtMbp7bcLt5h2lLcpc
	 3ZLMmDkDEki7LJLGab8eALyl14H4O8OFdhhCHJkKmQd8JOgum/08MC9g/EyHGFAoJxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=zqlaTxiX;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC0A606A326
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=zqlaTxiX
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NxGHxE2x8usRSO2ZdxtU0y; Tue, 03 Nov 2026 00:40:25 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2ZcxmBuomTkmO2Zdxl4gT; Tue, 03 Nov 2026 00:40:25 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae92d79
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=CssxY521O7rtTyjDhrsA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=udLeOkuLaYs2tKawHgHDPX67/7DWCXsfdQockRk3M9c=; b=zqlaTxiXtVgg
	9hPhGT+I+pnHSO/DiRrrA6ZU5Qn1iLIO3EEssfFnElLuDeiMo2OazVDHGivm99KEdanQTI4Fwq7TN
	rRBWRIIsXwNKwk/9AmZWk/I3GKOhIbbfQqeHOndwoB4yvX9aX6YkbxiEdpTEMe02tkH0HVkLwpyRr
	bUPWW2wdkskA5/iYJwSinzKN37r6CXA+R58CtERoyu9kJr7Xskq81zXbXDQSub2cvHLc8AUqDH36/
	sD3KblQNoV2GMUldFmoOBqnzYpX5HLCdyjLSC5GXY9nnXux5i6NuJjTTrchmXIlvy6E3UzNywMWak
	v5HsuAwmunSmlsSxikmQOQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40744 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0x0-00000003n1n-2sNQ;
	Tue, 03 Nov 2026 04:26:26 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 083/102] hwmon: (smsc47m192) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:16 -0800
Message-ID: <20261102225235.334487-84-linux@roeck-us.net>
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
X-Exim-ID: 1xO0x0-00000003n1n-2sNQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40744
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLZehSJItXP8jD9Hb8F0P5Os8O6KBBpNqfgXN/xbD4gO7gUFXwjin8kTulYZ1+SobHD5CokPq588KUhyCUCP1siwUCBYFkuBWw/lrJ0bcMFuYb6D0A9x
 7QJaBE2U5LoxLoSVCWkC6lIxw1+fJKMX/fImqqJj+BnCwol+UpLRDQOR52bg5lNeW+FalKQjNQh1p41gFrVs1NHx4zRRRrzXKNyLmr7Bk/hhDLfHVcMdm9j3

smsc47m192 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 59ac83677f72 ("[PATCH] smsc47m192: New hwmon driver for SMSC LPC47M192/997")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/smsc47m192.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
index 1429b66e09b0..00acce370913 100644
--- a/drivers/hwmon/smsc47m192.c
+++ b/drivers/hwmon/smsc47m192.c
@@ -87,7 +87,7 @@ struct smsc47m192_data {
 	const struct attribute_group *groups[3];
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[8];		/* Register value */
 	u8 in_max[8];		/* Register value */
@@ -109,8 +109,8 @@ static struct smsc47m192_data *smsc47m192_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	 || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		u8 sfr = i2c_smbus_read_byte_data(client, SMSC47M192_REG_SFR);
 
 		dev_dbg(&client->dev, "Starting smsc47m192 update\n");
@@ -156,7 +156,7 @@ static struct smsc47m192_data *smsc47m192_update_device(struct device *dev)
 			       (i2c_smbus_read_byte_data(client,
 						SMSC47M192_REG_ALARM2) << 8);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

