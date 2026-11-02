Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667195;
	b=0T01JWLDAMVdjYCDguDYIjpM5ELvmlXUK2nTGUlQO6WtImW2ZFYXes7Rhd71BVEGvqT6
	 azVp2PIkNCIIcxDBjG5BaftfQHbsMzxKfWsP8/PZvh9Ji+DJxHW/3sE+1UWM224Ju3B0E
	 d77xuCOGkILH2tcZwg623G/opzpXK7ZM0uJ2Lslxlo8bvVamwcKm8nEIuIYthVijT3i29
	 XyaEpywXKWCsoVUibfT/B/AU41yLsyuzct/CFuffYV0x1r081I/wARgXHSdBtQW/iMbIA
	 93a8w+BsSh5Eqq3xIVvdD+nub+985Fgdbfkhv/BDdJ9d4iIya1HcfGM3ZbnIedbyRQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667195;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=eTWaGRDLNJJisXD6/CsGrU8u9FHQ0voY3qea4iI4Mh0=;
	b=VQ3zRP0F0VE46CrA/Ok5WOj3iJ7qtRLzQQ6AX5ydx9zwaP95elSXIlwUfcz0IfU9O6Kq
	 f10QzvSYvvUe++vexD7NsqaRiL9g6pzgIbWqAFNk0cTmOtjdZ+XwhE0vVLTYGY4BBb5eQ
	 T4G6jv4c7E0Tmsy+BIhfOjpCXxxIegHzXFmloarKQyvyH+1bPnmjc33hMdydtI30bssy8
	 k/MXBMnZrNn1NVlhQoZ+lZ/LhTw827DOaTYh/GPN0uATzzP5yeyaYtqGbZ/Oo0pnpbotU
	 zNHl2W/Ab3EiT2iuca5qL0TdhqKMdixDsC4nBVv/q1i3OPh27hjF0po0wlYpYTgIWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gct853An;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8DB606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8DB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gct853An
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id NxN6xYQRRLvgbO2m2xmAIR; Tue, 03 Nov 2026 00:53:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2m1xHxtEQfwNO2m1xaH3q; Tue, 03 Nov 2026 00:53:13 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae9307a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=agofVQKObDrp1vJju4sA:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=eTWaGRDLNJJisXD6/CsGrU8u9FHQ0voY3qea4iI4Mh0=; b=Gct853An3zIO
	x2eB16Euboz4+V+R31mD4SQMnwEr7KHGyO6gjcX8Ms4zJRlZbyikqbr19LLYEhzoGh3wU9S7pNFep
	c8ziZujLuhrgeETbBrjwFuGhuAs5pIzOhx++DCsteIO4/HvCB+EalWrQFI7CPh8+Kh+Z3QwlzToWh
	ppIrxAxEjrp5z8neggsXKusDrCOyxaDNAqv3FGl/Z1Jip0af384oHbSdnCwlQRlknWUEMR5QhHRo6
	Bz0gzYRniQbMFFIXODRwA1mx1tXefqrCeF2OizaQGatYu/n1utuzO7Tfz+82dLYAM0DkUOk04NnjS
	40DmUJEcrqjB2Pzct4DFSw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49868 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vS-00000003lMb-27JD;
	Tue, 03 Nov 2026 04:24:50 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 047/102] hwmon: (lm78) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:40 -0800
Message-ID: <20261102225235.334487-48-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vS-00000003lMb-27JD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49868
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIJNNJQLfSHN5WwYXei/2LA3o09/XH3S0KYjOt0u+nkKGXLMmMKsFJqnHJ+pIf85/Zdhf2jzc0M/6eqvMhbslR/Ylzt9gBFDo7LQw61DX9ERg3PZgvzN
 wY3jHJQxdFo5AIEtjIOiHIXk6aBIYAhjzqwN1nmsJJgaHtLafyUNczj1OEptDRQWEato2WjmThmICkwCrOFATOw75MJNOtQYmtKbkS2FRUqzpgQzvJD1LEI7

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm78.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm78.c b/drivers/hwmon/lm78.c
index e4834f9eca6a..928936cec849 100644
--- a/drivers/hwmon/lm78.c
+++ b/drivers/hwmon/lm78.c
@@ -118,7 +118,7 @@ struct lm78_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[7];		/* Register value */
 	u8 in_max[7];		/* Register value */
@@ -733,7 +733,7 @@ static struct lm78_data *lm78_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 
 		dev_dbg(dev, "Starting lm78 update\n");
@@ -769,7 +769,7 @@ static struct lm78_data *lm78_update_device(struct device *dev)
 		data->fan_div[1] = i >> 6;
 		data->alarms = lm78_read_value(data, LM78_REG_ALARM1) +
 		    (lm78_read_value(data, LM78_REG_ALARM2) << 8);
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 
 		data->fan_div[2] = 1;
-- 
2.45.2

