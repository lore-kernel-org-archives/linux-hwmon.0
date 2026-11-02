Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666426;
	b=PG1tJUFuKhoA4TYRbcaBpdx8twnYk4rrqHXlyfm4XXlU07AUq6Eg2wWUAQzVc5jYX9k+
	 2R2WDSWFaJn/elWdkVa7kdDp/E2AThIhJRc19Ww7BshyrFuLDd8RYvGn+WJ/WVHZ8xIan
	 aZL4klwKBQjjMja0dnEY7n3o3gAgChAMdQJLDKI7DjFkOYtl0pA/c9UdQHBp4JiAmFiXd
	 wvy3F2WHz6aBQ6VmgQAM3HrXGfWIL7b8yCceEibNh/i9RIbW4nglKBk0R2bnXcpHtu4kN
	 VKTp+ovxOkEi+xoI+VqC4YHThJDavgZ/dd0OfkQWB3Ra/SHI273dAZKIsk5g6piOs+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666426;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=+TRnCy7ftJ7h8QDtVbAUvmcjhIjC7D06v3EcImu8ZXY=;
	b=wCV4CW2QEHG+iSvMXM/cx/qGyNwKbltBAWjoFngHxl4PevE84uP98MrbNK9livQBbXnU
	 h7sxH9bx+klXY5kY2g7io9+Am608xM5EKqhEd/Ez9cmZkE6wQBBwR9+AhsI2C4kVOaG4d
	 fMTnivoKX54tlXsi4l5NsDrpidBPFFnNAI6Fdv/I70pA/N6YmMs3PEPtxbuf+Pz4TYfZX
	 half1aP/F1izxSbH1QBCTNBrzmGzyx0YHwnd3iU6A5bGS1lsnHAru9fk6jIDTqDk5QfD4
	 IM6RAcUKPyQ/TzOKyjIwA6WVQ1ij7oM+keiquQe/mUhyNH9HyMqP939FAafD79jOd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3q4ljWKt;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C3E606A326
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3q4ljWKt
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id NyKtxGwC0aC0UO2ZexXYIn; Tue, 03 Nov 2026 00:40:26 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2ZdxeL13e0duO2Zdx1oQg; Tue, 03 Nov 2026 00:40:25 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae92d79
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=edvktuduleVQ9f6P3rIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=+TRnCy7ftJ7h8QDtVbAUvmcjhIjC7D06v3EcImu8ZXY=; b=3q4ljWKtMerW
	5USw7kRcRjNQqsJGc45yb+txn7oHc4TVbLRJhTACqKNVngb6vTt08ZBTSPIF8LjfxS6VJFBGXdkOZ
	fAVhn0yDYmbiIeadMgtJpionhBk5gTIHtu/pc8pXahad9wMq+0dXhNbx/O4NperVWx6ZnzZ3jmqPV
	0Y/AasEp7PaNDYQJoLdIDL9UZXNC4/ttHbxJtgnUFJp3iymkMPtoiQQvJIxl5UzOGpmj2NFSYMLpx
	Bj7ZeMKlcogDa6AT7IT63LbV146UA+6o3LNrvHoPEE0ys/fAGkEo4uB1Cf5vR76dakpKt+cX7kpvm
	CTRngBRM+VMy+nx+rXUiFg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40730 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0x0-00000003n0o-0JfU;
	Tue, 03 Nov 2026 04:26:26 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 082/102] hwmon: (smsc47m1) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:15 -0800
Message-ID: <20261102225235.334487-83-linux@roeck-us.net>
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
X-Exim-ID: 1xO0x0-00000003n0o-0JfU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40730
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC+ukr9fGXSC96Ptay9O22y5iAEJU8db1xbXPg2Y+T9zhub2Ws+xreR4uG8iW7DZ7kZe93cTjTen3DMLs+BZVdooPST7UnTJa26xxkzYUUBa8pJBw0vW
 B8gmfYPYtxRLzTe1ML3dBRa64jcwoexIWgGX4bOBjajL8mCQEL5dZgVliPj3TqssKKRcz6iymbxzrS5eN4G5lA7zQKa6YCYNNAVaFhTirHuHlYDkhUCGL1kb

smsc47m1 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/smsc47m1.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 595bceb78d76..5502da2d8f8e 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -120,7 +120,7 @@ struct smsc47m1_data {
 	struct device *hwmon_dev;
 
 	struct mutex update_lock;
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 fan[3];		/* Register value */
 	u8 fan_preload[3];	/* Register value */
@@ -152,7 +152,8 @@ static struct smsc47m1_data *smsc47m1_update_device(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2) || init) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    init) {
 		int i, fan_nr;
 		fan_nr = data->type == smsc47m2 ? 3 : 2;
 
@@ -187,7 +188,7 @@ static struct smsc47m1_data *smsc47m1_update_device(struct device *dev,
 						     0x40);
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 	}
 
 	mutex_unlock(&data->update_lock);
-- 
2.45.2

