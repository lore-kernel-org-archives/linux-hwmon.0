Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687228;
	b=rswP8n8dy7cgjEdXiMrikyzHev5rptQanyroKtSx+/rECitfYpL8xmHTCuW9rH/WTUgk
	 ovTbDNec6pUIdG19x48Sto0nomXj4jYu0GEml3YPF7jwxZJrIhOYJ9xdvevJ4GozYOGsT
	 c8mZwQhBoOlHoWbC7Dp29oBnigVikRvVnwYO9L8hK8U/NwhtGIu35gBC9xBLpiJW8h+Tb
	 vMobs5N3Z6//Foq1ME98NEE6q2Pz8HgAaSFYJRmHpnCcX+hCHPMFye1mc06QeNwAeXM9e
	 xniegwTpul9ySTAJ6aDHLRaC+LntLg3XbY33KYKZnnZT5j5GAdZOexm7NurZqtJ2LZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687228;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=iZMyxOo+FOjxoMDW77+JGsuZVpdgAUJTgIYFVKEaZYE=;
	b=XwADa2C33ZgG83Fv4KhSQZQyQYIlzO81lT2+1wn9t2mIyXE91YPmsj9siBh5cULajG8F
	 vp5ByyOkd/Vl4JbxqgCP7xPL54BQyXk9dlz293OgcQ2HK8SPn/N97zJsF87G4u0yhB2zG
	 P6VOxJlf9MaPMFprQn33MDj9TWyjZ7RQWy59m6EwUGCjJQu+EiOfcKbyf13jv38VKCDIe
	 +LbkdBQeyJ/inA/yECYJbHSOXY8EyKiqOyICs3uPoI3J4wlc79K+N4owk9EA6qC6Zwoxg
	 KjsaPxckFt5VWwK/vfX0Z4I5tZwz7ECP+xPhaQJKA+WOUMIP0JjFwO7KY/35Mv1LXmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="DNexb+X/";
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA34606A329
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 06:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA34606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DNexb+X/
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id O4nwx4DnrJFmFO7z8xCh7b; Tue, 03 Nov 2026 06:27:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O7z8xciBoKD1BO7z8xn5Bd; Tue, 03 Nov 2026 06:27:06 +0000
X-Authority-Analysis: v=2.4 cv=N6MpF39B c=1 sm=1 tr=0 ts=6ae97eba
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=_f5xWJEEkEkW62GEnhMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=iZMyxOo+FOjxoMDW77+JGsuZVpdgAUJTgIYFVKEaZYE=; b=DNexb+X/ytzl
	Er/P4cN5w1GVxSkfuCSJHksjLMsBpar7ok8gXPXTAb6WTlMyZBPBfKeRSih7oxYuesfZXL6RWvt6X
	RpwfNJJRbjinulh6M2PLHsxGZUqjLZOfLvLlig+xwHa9aA4PpMkgHCBhtetzlhiFEKTSQont17lFm
	fBM8k1p8X96tHtoPj2S/VnM29t8kYnxZUgzJ7+vhGJvNNd7YmyBHwpXKl572Xwuv+nw/KJtXmymzE
	vXpiw/zNTf4hBXc7U5VM+qGqvXtVsPu3IjOhPiMbMlP7dBTbKtgnA0cGTCvsrRlhrIKr46kW9uYT1
	MgMS0EpbxigF+BbcGr1I0A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46938 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vt-00000003lZF-2Qud;
	Tue, 03 Nov 2026 04:25:17 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 056/102] hwmon: (ltc4245) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:49 -0800
Message-ID: <20261102225235.334487-57-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vt-00000003lZF-2Qud
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46938
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCSF9FhMDdP0TW/FpD1YgZotL/DniMn2Z3Sev288NA8v4FkpYpg2mDGpaeZfvOCix7jhVYkGcp2+vHBSZP5++SEShznEZZjCYKKi7XeLjvGkk4df/Ktq
 Qza3X1Gu3yjz7cTF38UEw5q/6SDcL3OsBi533Aw9Z/7mtCg2p9/UJeXtkyF7xwXGmJ/ZDLv+UonoaUsSQwTVWt6CBHxcBEjZ8hseL/ZpLjuCRz1aiez+Iigx

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor and GPIO readings from updating properly.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 6e34b187bc21 ("hwmon: Add LTC4245 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4245.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index d87aa9c32c87..46d521ee5aca 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -51,7 +51,7 @@ struct ltc4245_data {
 	struct i2c_client *client;
 
 	bool valid;
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* Control registers */
 	u8 cregs[0x08];
@@ -88,7 +88,7 @@ static void ltc4245_update_gpios(struct device *dev)
 	 * If the last reading was too long ago, then we mark all old GPIO
 	 * readings as stale by setting them to -EAGAIN
 	 */
-	if (time_after(jiffies, data->last_updated + 5 * HZ)) {
+	if (time_after64(get_jiffies_64(), data->last_updated + 5 * HZ)) {
 		for (i = 0; i < ARRAY_SIZE(data->gpios); i++)
 			data->gpios[i] = -EAGAIN;
 	}
@@ -130,7 +130,8 @@ static struct ltc4245_data *ltc4245_update_device(struct device *dev)
 	s32 val;
 	int i;
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		/* Read control registers -- 0x00 to 0x07 */
 		for (i = 0; i < ARRAY_SIZE(data->cregs); i++) {
 			val = i2c_smbus_read_byte_data(client, i);
@@ -152,7 +153,7 @@ static struct ltc4245_data *ltc4245_update_device(struct device *dev)
 		/* Update GPIO readings */
 		ltc4245_update_gpios(dev);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

