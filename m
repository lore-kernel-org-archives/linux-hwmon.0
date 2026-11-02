Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659995;
	b=rkV6iRuNM2jg8nhTfzXxYXMF0Yh2dC7YP9HSM2KBXn+oZlml55d8zBC4L7yY97euw2er
	 0bB/FjYvmv3aspWQ+d/jia1Efr1PUr6Z7KXBKOX0w50FWlMvUYiPGr4+EepI8ZoFFiUSt
	 hpuyHcR/5rjB+Gxh77ZAVH092ye4RVhQF7qzUl6e0ncMtkOs3s61YdYbws0r/m/6CZHTF
	 ZjZgWVS0eJ8IMLekMM91zSAM2AVAP4yrk66a75026tC8z/wPZyDr3+VV3lGqZRUbLcJu9
	 o3vYxjiySXz9VFYNGJzE9bIJy9P1cNFFzO70t1tpMpDa+HzYxTp3O21MnlpIF5HUc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659995;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=OFfhx99OzWl7MsbMDyePA1WYWIOQm2Am7tD8hFuXXNQ=;
	b=CUbEawKJqUiFFB86cm3FMuRAb2xyOOJw/mPFJXmzEl9gq7KshREW7raBDxWYWKKLRyTV
	 8f9juWO89qKv7MO9VKtebujaKM4ZwQSAORpjKIOAWRMyE9oEo5Jbk4BrEIpposLP+wxR9
	 NHnEtpj+jIdiACxucwpHrmzjxAVrvWje6vw3dtcCANgzmZ0ZaradIe+g9CvMHB8YbzWFI
	 jgygXQMkBL/GDRjVQeFI1NTvVNiOgeQP/0OLNoZITXIERmGXlCd7K4JWGtD5iHK633Cqo
	 1PescyFTjJSlJ+j1iMGoOnT0gn2CHMvet/1kUifCnZL1KU15NQZfKzi9M8MU/AHo+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=A+GMBfa4;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02E9606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B02E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=A+GMBfa4
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NyHEx2xpZJFmFO0tuxAVz9; Mon, 02 Nov 2026 22:53:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tuxnCHvvtkxO0tuxLU26; Mon, 02 Nov 2026 22:53:14 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae9145a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=b_54qF_R-jpbcLJ9V6gA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OFfhx99OzWl7MsbMDyePA1WYWIOQm2Am7tD8hFuXXNQ=; b=A+GMBfa4TyNx
	+zL0eDiPQG+z3kLECYEmgXS71ZKurBTf+DS7OxaGOCH9eZd69DuqbrVYApEZY2BHCKXwl1fZGFXnB
	fVkFsFXD3ovmIGVBWYYKf/cOq2wtN2NmLh+DFu7Da0U4F7gue5C3GIM8KdjYmPzzVaCtq89BD7oWq
	V6nqFepgOc6zYX9dHfeo2mDw6bL+orlkmOK8XObA6/KmLko1seLuNKCbHQLVVVRjsQX7JjIvbnyun
	JskV7MzmJ+22ZfxzJ+IMF4ULAkCXoxVeosqxWeODbcZlbqjzU+RXqoqo5zJaB2bslSedWVBrwD1oY
	dlmWBIjwvsvAirgS0DCcoA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52038 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tt-00000003kFc-3fFC;
	Tue, 03 Nov 2026 04:23:13 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 011/102] hwmon: (adt7411) Use 64-bit jiffies for vref update deadline
Date: Mon,  2 Nov 2026 14:51:04 -0800
Message-ID: <20261102225235.334487-12-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tt-00000003kFc-3fFC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52038
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 36
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPNkgyvMlF5apGlcpPCxIoqCMWOnIN+B2dOa18mIpGjYGMpA8W14o2Zq5+nUXkE1SPSyYnoXStlqkgxK6V5E4NMqVXX8lt1ZA2gQuVoR/rxRJOJ1G/qR
 n//gRStwFcPBC6WVWecROxhsfRQR6g8O210ZpYpFzbLx6Q+Y6wmbAPfRHBjmRPKKv8u2CXt3K4ld5b3PM+kd1NEaekn5q3Ls+gh4VFjaJC13BWcUxeUs98XV

adt7411_update_vref() uses 32-bit jiffies and time_after_eq() to check
whether the cached Vref measurement has expired. On 32-bit architectures,
if the sensor is not polled for about 24.8 days at HZ=1000, the jiffies
comparison wraps around and Vref stops updating.

Convert next_update to u64 and use get_jiffies_64() and time_after_eq64()
(already serialized by hwmon_lock) to avoid 32-bit jiffies wraparound.

Fixes: d84ca5b345c2 ("hwmon: Add driver for ADT7411 voltage and temperature sensor")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7411.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index 598f31647544..4c50f4167a10 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -98,7 +98,7 @@ static const u8 adt7411_in_alarm_bits[] = {
 };
 
 struct adt7411_data {
-	unsigned long next_update;
+	u64 next_update;
 	long vref_cached;
 	struct i2c_client *client;
 	bool use_ext_temp;
@@ -172,7 +172,7 @@ static ssize_t adt7411_set_bit(struct device *dev,
 	scoped_guard(hwmon_lock, dev) {
 		ret = adt7411_modify_bit(client, s_attr2->index, s_attr2->nr, flag);
 		/* force update */
-		data->next_update = jiffies;
+		data->next_update = get_jiffies_64();
 	}
 
 	return ret < 0 ? ret : count;
@@ -246,7 +246,7 @@ static int adt7411_update_vref(struct device *dev)
 	struct i2c_client *client = data->client;
 	int val;
 
-	if (time_after_eq(jiffies, data->next_update)) {
+	if (time_after_eq64(get_jiffies_64(), data->next_update)) {
 		val = i2c_smbus_read_byte_data(client, ADT7411_REG_CFG3);
 		if (val < 0)
 			return val;
@@ -260,7 +260,7 @@ static int adt7411_update_vref(struct device *dev)
 			data->vref_cached = 2250;
 		}
 
-		data->next_update = jiffies + HZ;
+		data->next_update = get_jiffies_64() + HZ;
 	}
 
 	return 0;
@@ -660,7 +660,7 @@ static int adt7411_probe(struct i2c_client *client)
 		return ret;
 
 	/* force update on first occasion */
-	data->next_update = jiffies;
+	data->next_update = get_jiffies_64();
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data,
-- 
2.45.2

