Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660229;
	b=s3h8NprVcBgx7gd4yT3H2Gy8aOoW/P1BTgwek2Q5EzZQuPOzmE99PdG5KUJHwWgojToW
	 4DM+geBpcFCkuIVxUW7mCN5g3LUl659TeoEXbhcyxqGMEty5zDXTzFJJroy+oBwQT7PV7
	 GddjO2XCWZJrIYyF8CMY7lse47jVcov07aMsNjpLOIeSeCbsyZaLDkYJ+0L+aM6fKMLSe
	 1BesaTRyiuXv3hUWFoI0tTN463LwbjRqfy1pAeyB9BZNl6I0s8S1fvu54TRU2X5W6oOmI
	 N4Tighv6gS7MflUTrIWqvPP1/ZAPPlFD/3TNO66ZVv1/TMLzsoF7Rl5iuZ3yyutr5lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660229;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=i8h7cyWO2T4PaSebAT+vxIfpupy+ukYzf6cVk8naQ0M=;
	b=zBN8SbPeGqjylaA6ytnjCLuExVVzdd4jfR+hPxY9iEmcRM1446UrcDZOpCLPAc/zcZQf
	 xAM883sBoGKakO+FX8Jk87QePsCpNs3xSc2Kx3bt6TmoG02M59t2I2nKOwG1Q7GQowyhi
	 sD7jXIGAXSm3gd8YdH2UwgFU1qe/NG9XGnmnd+pRGKnehtKNg46eYdtB+kNEXxgvO8mpr
	 zely655u8vsNSYvEzcLmOtMe2F2F4QMPVIcWyAFcJ9mXmxDpRwOvIIV8Pxck66/gL3VBa
	 d++FeYdBU1FAFpLY8IL9oypIysWBfL9nEQqMUxWQ6LRR1kkuaV4jDWk1eXXlt/tg9XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yhcpPDyu;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1847A606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1847A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yhcpPDyu
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id NxGExE2vHusRSO0xgxsxKp; Mon, 02 Nov 2026 22:57:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xgxTnkx1fkWO0xgxuvYH; Mon, 02 Nov 2026 22:57:08 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae91544
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=icDNWNP11I8luJT-CDcA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=i8h7cyWO2T4PaSebAT+vxIfpupy+ukYzf6cVk8naQ0M=; b=yhcpPDyuKmDA
	x7L18We79tmPJapGKej92pJYowEk5HM/Nb01sDXkRcpNIbCiC2KIjHRUqeiVsDIqQekwSWgqj9P+m
	gosFGsbfYWM6h5ejfZOI7QbiM1K8r7+M4lt2ieozrvyMd7PiQNxYLq/Gonh0LplppW2SOa4SqU+eT
	IfR1NrRRM7ginAfD21y9ebS6TAv8xsK4f7ERYVd6YHklpqEL/82BmHxVSoMcf4QhXYmIFhKZOOs/J
	NVcL5Nn5K22eXR8X2FJiJId0o1AJmXPhO7N0kEogHoxBkqYawl6d+aH56aU8ub7/IH3cYZLgLDuj3
	Ib4t10E3wGTOvfaNpQ7e2A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44612 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xg-00000003nNK-07bh;
	Tue, 03 Nov 2026 04:27:08 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 097/102] hwmon: (w83792d) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:30 -0800
Message-ID: <20261102225235.334487-98-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xg-00000003nNK-07bh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44612
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 150
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMEsNugUacSRWaSsxvml4bbA84L/B5UXe5E43XYCOiehYE+FTU88sbCLjNrn1A5mnD5q53TqqK0AMSIHP3Z0jPTKRpJPfVZc+GDULrYzdoYWKFdbmhsn
 IGi+XWZx815A5Z8XazpURFMkEP67Bfx4Q7B27/f3UbTemeZDMu2bGK5Mib/iHbNTniQlJvfs3akHNBTDDjUTTzzafVdJCjJmIhj84Zuv0RnHRHcQVc6Q0ZhH

w83792d_update_device() passes a delta (jiffies - data->last_updated) as
an absolute timestamp argument to time_after() alongside a separate
time_before() check, which misuses the jiffies comparison helpers and
suffers from 32-bit jiffies wrap-around issues when the sensor is not
polled for long periods.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to properly check cache expiration without 32-bit wrap-around issues.

Fixes: 5563e27d3a42 ("[PATCH] I2C: W83792D driver 1/3")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83792d.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
index f715c79389a5..1e6bb883757b 100644
--- a/drivers/hwmon/w83792d.c
+++ b/drivers/hwmon/w83792d.c
@@ -262,7 +262,7 @@ struct w83792d_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[9];		/* Register value */
 	u8 in_max[9];		/* Register value */
@@ -1484,9 +1484,8 @@ static struct w83792d_data *w83792d_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after
-	    (jiffies - data->last_updated, (unsigned long) (HZ * 3))
-	    || time_before(jiffies, data->last_updated) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ * 3) ||
+	    !data->valid) {
 		dev_dbg(dev, "Starting device update\n");
 
 		/* Update the voltages measured value and limits */
@@ -1586,7 +1585,7 @@ static struct w83792d_data *w83792d_update_device(struct device *dev)
 			data->sf2_levels[i][3] = reg_tmp & 0x0f;
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

