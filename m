Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669110;
	b=w453St58n+XrKDLH1nkawDiD/gUlVppU3LaLq+f4jphtSyQNotmbsNkFcgfYnp3c8CbY
	 t1LPS5ySo4TjvSjsjusfTUGTJaoEazuUv5dN9iZD1tEY9tYmaumss7yftYiFyn+tA+4IQ
	 xtDtq12MAwYWOP72FIpL7W/NPaYH8ObxesZMrxyew1VFwqxocehtCG+vFHaaKGRliu082
	 ohLs17ZiVEZtpu/UhCLg0W9qdd0jVUhK/wEgeUJg5jJE+pNd/lo9HxHcYvQzssymBo8A9
	 a2Vo6zwYw3mYQ87LTOLADq+Fa2JKa4vOEtISSzRL8PFSZTAvXSOK9g+2/+s+UTQnz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669110;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Zg38O+ElHyckWhRZ2Ul2eJa0wZEYHQ06QNhl6J+eo5E=;
	b=EgCthjP5ULqpDmij5J7DItSODhntxkidY7d7UP+XlyQnLyguY7IX0xawD8ieszlGp0aK
	 A0c5+8zbNRfublzNatVdD7YsAodIY5Jycz5pOsH/KmZFFm8cM2iYZ6egHrWWPPfxVM6ek
	 nEgYQcCU1d2Co4ZDFb4P02VEMNbZb/1Zt6T4dbkZ/j56nNmAPPGT9sQFfou35KVwonmZZ
	 ++L8KmXcc6bhlzS+dPd+TjHtHAqouFIWdOMYQXaZEITMz75Hbnh4e2w8vwJar2mUtSK8q
	 oHm0ahRZKCWN9NfOrzGquE/8h2nkQB0UFiPAbPX8lPC7xxLqQIo7SQSEeTlIC/6seTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LcqUvRdD;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E226606A327
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E226606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LcqUvRdD
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id O2sdxZSRiLvgbO3GuxmJl5; Tue, 03 Nov 2026 01:25:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3GuxXs2k1fkWO3GuxyHw5; Tue, 03 Nov 2026 01:25:08 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae937f4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Rgnaiequoe4c2wbdOmIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Zg38O+ElHyckWhRZ2Ul2eJa0wZEYHQ06QNhl6J+eo5E=; b=LcqUvRdDJrMF
	IKZo3hHkFX8k1yMJsDsZhbe9kq05IWAXM0jkgUpGQnHiQ062oxPPO/BvGzNsbLlmZ7ubP0GVfzViJ
	4KGsZqjVA3/b6m+Eu9GS6a6KgQCAp/zcFInX9z/luTgBhACWxHWXOp8EZcKpJGYsKg4gu5peALA1/
	a+kTQDGZMzheiMWW+ZdviMsJ77njSXSfJKp/tycFvRE1odzLngOokHSTPyaYS8lU75+J6aVSeDDhc
	88Zuf7vKfxNBKFMn3YcKFfQrMxiQ9GhvhEe6QwoY3ahV/0eabmfAnEy9Hlrko4xn0MZQ945zJAJ+7
	yTfRfW2p0+1qdAl1BIgo9Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40894 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xF-00000003n9X-2aV1;
	Tue, 03 Nov 2026 04:26:41 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 089/102] hwmon: (tmp464) Use ktime for fault register cache timestamp
Date: Mon,  2 Nov 2026 14:52:22 -0800
Message-ID: <20261102225235.334487-90-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xF-00000003n9X-2aV1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40894
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNHpwojVEFZcjORVHXQe/DPFzK8a+bwTyIXNOakCXiO1oe4/UBmJrg7RP0oAq6T7K8NwQAlD/sND7CjMcZQgiLm9n1uAxVdu2j/hetDoia8MXc7p2Sds
 crJsVzqpN3tILcDjt4ybWKfr1jSOh7sfE39QPsg15Aou6NQWVCoKx3/k7TxTp1dpEHTSqDNHRbWpfXCZ0GpJuVLi0Oi1jYu77lBBAiHAvdjYKj/S4QDLQAL6

tmp464 uses 32-bit jiffies and time_after() with data->update_interval
(in milliseconds) converted via msecs_to_jiffies() to cache the
clear-on-read remote open fault register. On 32-bit architectures, if a
fault attribute is not polled for about 24.8 days at HZ=1000,
time_after() wraps around and the cached fault value stops updating.

Since update_interval is already stored in milliseconds, convert
last_updated to ktime_t using ktime_get(), ktime_add_ms(), and
ktime_after().

Fixes: 007e433cf037 ("hwmon: Add driver for Texas Instruments TMP464 and TMP468")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp464.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
index c3e031044d1e..00f6d4495eb1 100644
--- a/drivers/hwmon/tmp464.c
+++ b/drivers/hwmon/tmp464.c
@@ -12,6 +12,7 @@
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
@@ -94,7 +95,7 @@ struct tmp464_data {
 	int channels;
 	s16 config_orig;
 	u16 open_reg;
-	unsigned long last_updated;
+	ktime_t last_updated;
 	bool valid;
 	int update_interval;
 	struct tmp464_channel channel[MAX_CHANNELS];
@@ -170,13 +171,15 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
 		 * complete. That means we have to cache the value internally
 		 * for one measurement cycle and report the cached value.
 		 */
-		if (!data->valid || time_after(jiffies, data->last_updated +
-					       msecs_to_jiffies(data->update_interval))) {
+		if (!data->valid ||
+		    ktime_after(ktime_get(),
+				ktime_add_ms(data->last_updated,
+					     data->update_interval))) {
 			err = regmap_read(regmap, TMP464_REMOTE_OPEN_REG, &regval);
 			if (err < 0)
 				break;
 			data->open_reg = regval;
-			data->last_updated = jiffies;
+			data->last_updated = ktime_get();
 			data->valid = true;
 		}
 		*val = !!(data->open_reg & BIT(channel + 7));
-- 
2.45.2

