Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662039;
	b=RUVCUSVHebGhydXu/AbfXGNB3TEfeLlhgMi2ynzq9INpwsgYoBAMi8Y3V7iNYRbZJmoq
	 eB3biiXXTkhVg6IvZk2uODFzoJj51fOfbAncj9Uz4yuLUARpqSXD1XIOYaRHW5zJS2S9A
	 WRTEVLChiy+husH9dPlwW6oJMRa3wKmMbbx1KURP9q10Pq8dcYYLuzFKX9BKnT50zK3pi
	 2t/MgYvGuizWOqfZqSKMFja1LE49ihpwXg7PbkoCA/yNVTBbBL5gt+WaeEJu6cBoyRVzp
	 7aQZ/mn28DJiEf87BZwq7U2D90gbDE1ptMqB17h2KINnKMmYy+AYEw7NP5olAe+/qVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662039;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Xu6AqoJFNO19gUdMxfgyRc/y2btZVPKDW4XTDadSvq8=;
	b=vl8oivPcqApo5AhJhVi4vAbbaJJEOhh+FVl0tFUzCFM1c312MV34A00Y8taOQrlTT6yQ
	 Zhm3EaFBv9zuy1LE5G2ab9IvnYEJJm/JNJr6AWJoaqYxMXUlX0AMeEMeAimnnDGcYX5Y7
	 hnsTdLw5aTFhyc9nKPKxenxp9Pxzoc3ICJ7fRdfreAnjEsI0IVBpn0QQx1g7g6HOGxyW4
	 Jfda/ExzYbOmavDQKRh9mtu6Elf8LgobvlhAir3I/yBpprEXiuFJVsDFzBUR8Wsn68Nos
	 U23eKQyyYGAVU+iWezmdqiITt+DcBByLgpgAkAd6ugjrbPHBZj66AqDQWCK+fmSAFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b9pWjk8W;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC3606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DC3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b9pWjk8W
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NtJUxD5kOusRSO1Qsxt7h9; Mon, 02 Nov 2026 23:27:18 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1Qsxih7CsTgvO1QsxySWw; Mon, 02 Nov 2026 23:27:18 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae91c56
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=uIQ9F_dSYr64Mygn8EMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Xu6AqoJFNO19gUdMxfgyRc/y2btZVPKDW4XTDadSvq8=; b=b9pWjk8WkswO
	YZhaetdtFfcFAZuIIqj5rR5bwHuQ9/AWegPz3aOA+ZwOBYEdWZy3gRt6Vq2QtJSCl717bFpCNCEX8
	9PF7LyCispvFPM+bIMjsyXcSAm19V5RWxJ9dexh8MV2epmQMuxyyIPJ3qFR7RPV6jDVfXsUbDSDqY
	jUufuE76pWtV16UKZ0UqL4tOf8ZSGAa2Zzk1BG3J37+oO3u6EAdzt95uJJTDx1+d7bOdZK2kvThot
	aDb5+z3z2WaDgF+d76FI1lRYl8DBqpFk8k/tVbqyvHnnwuaDdSkGt/UXqAtWxMp0WTyMaZ4iA3hwR
	gTv6GKTAA9UJMJlrsmxz8w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49880 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vT-00000003lNd-0sfs;
	Tue, 03 Nov 2026 04:24:51 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 048/102] hwmon: (lm80) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:41 -0800
Message-ID: <20261102225235.334487-49-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vT-00000003lNd-0sfs
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49880
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAldZbZW8b3uBfq+UwIqDYkNNjagZRGhVcKhekXYJIpoWg3KH8gHErELRnorZBTTekkJsjJEWl0soZGvuoD9ELtDdES9Cc675LUIsLp01/hzjv7Tm+Ff
 iJj6crU+uuBmXRTAGUt1A62i7Q+Su66Vbts2hZlzv8himheS9v24kJ/gj6gKR/M47bIZIH2YVozSluToLfACVX8hk/4o1lPjVKiOYf1CBwPq/8yHnn/uOVy3

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm80.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 94f3dabaaa6f..a81f14bc73e5 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -118,7 +118,7 @@ struct lm80_data {
 	struct mutex update_lock;
 	char error;		/* !=0 if error occurred during last update */
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[i_num_in][7];	/* Register value, 1st index is enum in_index */
 	u8 fan[f_num_fan][2];	/* Register value, 1st index enum fan_index */
@@ -167,7 +167,8 @@ static struct lm80_data *lm80_update_device(struct device *dev)
 	if (data->error)
 		lm80_init_client(client);
 
-	if (time_after(jiffies, data->last_updated + 2 * HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + 2 * HZ) ||
+	    !data->valid) {
 		dev_dbg(dev, "Starting lm80 update\n");
 		for (i = 0; i <= 6; i++) {
 			rv = lm80_read_value(client, LM80_REG_IN(i));
@@ -235,7 +236,7 @@ static struct lm80_data *lm80_update_device(struct device *dev)
 			goto abort;
 		data->alarms = prev_rv + (rv << 8);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 		data->error = 0;
 	}
-- 
2.45.2

