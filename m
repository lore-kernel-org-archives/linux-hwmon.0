Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665938;
	b=rpixuj19RxHvWgPLBQ+e/vnr/Hdv49GwWSJoa+KsZ5ROApZd/E6KnZMV1ikTNJLzDj48
	 lGoHtoRL4cQzl/KgoOYPKBAaZWI/smdHgKUE7U5kX8gtfWYwQweTQfVFJie9c3GhbLnUa
	 wsMUViliLk8G3sh3qNXV3761u4myKkTIe1/ZhH6X/ph/8Ft3Qu1BqGta+rVb4qvTFJNVA
	 Gi718WOJhoWea7uoBO0KfDtGMHVQLyAB9+3HZOIN1HzUaRLR2Z9FenZzLew9aGCYwIIQx
	 P2IdT9Ff2pem4oTvz07n6kE7FB7GUCNf1QsyzDFHwKTDc7Y/fq6kIOQKbfpjFaY6HKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665938;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=PVneODFgAj03Tns1a8qGtS1shq82iGEVJ+yMq5Umixo=;
	b=iGlJnuvBdB5uwllFAEDswns7wFplLuo6HGQqOPimc1loqkXmpcyZg5mUVvRXtOWHneXu
	 xLYZdPoOyYHpO/fi9IH/v3OT4S6tf3mIkckFN6g6ybOllyiDHMUYfvjuT9LRbN1b8D1e/
	 LP44Alt6GNkdh0HnMR5VIERygVfIkzKYwGIksj/7CvIYcb8hVF+IKuTebNQsxIpQlpe/D
	 liEBOoqrBo0YeCqrT3+HxjwccGifWcf/i0iTiqGPCsgi9ns4/vO074vneUfhC3gYOsnxS
	 2tZxwsAUyhiCMGnbc6eAgHfL5qcFkMwCEbRTR2eOEpD+IbXjlMeNaul5re/RsWFJumw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=19dMvKys;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BEF606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BEF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=19dMvKys
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id Ntb7xDA7zusRSO2RlxtRxp; Tue, 03 Nov 2026 00:32:17 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2RlxkUKgsTgvO2RlxzwwZ; Tue, 03 Nov 2026 00:32:17 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae92b91
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=q0YmJ--GicJ0iz4tRCsA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=PVneODFgAj03Tns1a8qGtS1shq82iGEVJ+yMq5Umixo=; b=19dMvKysxPvu
	VNK32RgaPX7/uMeFQxEEJZcARRV4g1PGBJC8aQSkqSF1sFH9hLM6gRtdb8soMrhoviRoUbKv6AdiY
	lGrwMGjYzh3lnlpeIQgtLLGOsyIEcyNq9LPtsj0RAzdWU3qVCiJI3HLvXWBeRbUVUbGO/kNcnxVLC
	a+1oD5rMBRc/JP38okw9WXMsTK++Z4aldrtsmzix/OjeZmb7bFqNCHZLQ7qWctG0vQq6ZUbiqoeeq
	1n0o/cxkjkgnbXvx0OwgZQGF/4dTPSj4caB6uurU650kYNryCoPeXX1iECZHCDI4ffs3V5cUgDO7+
	AQgI4e3vduzxF/IPNFf51g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44666 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0w9-00000003lgV-1WAa;
	Tue, 03 Nov 2026 04:25:33 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 064/102] hwmon: (nct6775) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:57 -0800
Message-ID: <20261102225235.334487-65-linux@roeck-us.net>
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
X-Exim-ID: 1xO0w9-00000003lgV-1WAa
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44666
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI3BgDqjYixVSHRe0EZ23joDS7LOXyQeCjboUzCMZ3ZvOls2em80UX90BOfOCoRv/pUEjfDseYk65hrIFQ1aRjR11RPJ65rcRnqB9z6VVoWpl8UZ3mQJ
 dtPU5tZAs3Op+Eq7dOV/RCyImPi8oU0jhqrnJGeOChga2AAYwvMf+lr/7z4VfNQwTUnY8qMndPX8Fe4nv3fYGJyeqnU7hAe1HZyDaZ/NYqgWYVNQDGcTur3/

nct6775 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and NCT6779D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 6 +++---
 drivers/hwmon/nct6775.h      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index cf27b9c7a89e..7aaa8c397b5b 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1611,7 +1611,7 @@ struct nct6775_data *nct6775_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 		/* Fan clock dividers */
 		err = nct6775_update_fan_div_common(data);
@@ -1735,7 +1735,7 @@ struct nct6775_data *nct6775_update_device(struct device *dev)
 			data->beeps |= ((u64)beep) << (i << 3);
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 out:
@@ -2114,7 +2114,7 @@ store_fan_min(struct device *dev, struct device_attribute *attr,
 		if (err)
 			goto write_min;
 		/* Give the chip time to sample a new speed value */
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 	}
 
 write_min:
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index d18ac91be497..2c90a512d18a 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -93,7 +93,7 @@ struct nct6775_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	/* Register values */
 	u8 bank;		/* current register bank */
-- 
2.45.2

