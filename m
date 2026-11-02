Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672261;
	b=3dZsdHxPfRmCSweemlG/lnul3OxHHz2zExnNrqq0ecu9hAcS3PWBxNJ+ryXuJ4lpnF+K
	 UoTzPFMG8p/FGNE0IsQWIbEjWcunQpoYiDCcwEv60YTONPOkC9hFVD1uI0ZuJdOfYETDz
	 yYNFQKx0ViqbZ3QoHLQz4RYSQ3Tn/DNanQ0ITOQZc/65cSBE33rWw4B5ytsH/m+1ClDOu
	 UnKIebm+m9CNSwgkW39+aAyCVUOFs7KgXlQr7fmb8kxQDgPLuVCoMWARjz7OJoQ/Q/ikx
	 moz5d0iPgt4YPi6gR+tBSLyVkyhQ7J7QtmPObZ/G1RnyYBkSaV0O8KKx8hHdppHzRHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672261;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Cb92B8tyEjFOj8hSTYRpZVIsPPlBIBZqmTyqgyHf7vM=;
	b=O7FihYaV4mK84spThOpgjHJZ+CN7MKQiy0JdMLVa1fvvaHKeq2ftR3ga5vVKmt1ZkUSi
	 Nme3uMXOaycgUDZnBYFi6ge/LCCOJeIfNQqKwvwMIxhk+Fdj/oS7ZRSixHj+sPzMIGvK9
	 awEAyl8YzbDhMFPp9uumwKd0MTltSvaIkt0vLjHiKu+zRIHUWVaYvw4jyMZGDEQ/QUpFA
	 uS0p4bqgkG5+Bid2A2tO6GnAFaAgOWTlrIhkPaY/8+Cjn3ZZBxo4e6p15v3zDpw66Z6Go
	 n1XqfQhpXF7LSh+wTjv0UpXzkd4kA2JzHxb14/lyra/W5KomINmTnGHjX1zr1rvE5bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0NHUP8h1;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D035606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 02:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D035606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0NHUP8h1
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id O0vPxhOe2c3XsO45kxYkAy; Tue, 03 Nov 2026 02:17:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O45kxgrQVe0duO45kx3tJE; Tue, 03 Nov 2026 02:17:40 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae94444
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Hh69Pv9AJhh9NZDVz14A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Cb92B8tyEjFOj8hSTYRpZVIsPPlBIBZqmTyqgyHf7vM=; b=0NHUP8h1Mfyl
	vaxuDej4W8ZKNB2C/ij1Kp2ZMKn/cgIdl37Tao1mhAuR8fZBMZW+8kmCLMQPQF+GbYedpHtUYHmR3
	xVMvir4aRQsG3I04/X4rdk9Bt2V4I1zEwPaRf4H4n4TC+9/OqNRDrB4DXHxEPme2aR0FkcPDkvekn
	ztBBjXsMveC3bwAVaKYYGnfgvPtwaV63037OC3IJPGXtQd4D//56LqnCHS1sXJmz0AX6J4PdgfKhx
	3en88IB+KtW3ZKM42I3t1xC18IE5+a6QoamHKnHlh9CQhwE3sMxLMN8CBl+5pFnJ4LgtgdEnKLnQF
	qLrQKS/D27q30k0+xAp75g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60148 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wo-00000003m7C-0Dg7;
	Tue, 03 Nov 2026 04:26:14 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 079/102] hwmon: (shtc1) Use ktime for measurement update timestamp
Date: Mon,  2 Nov 2026 14:52:12 -0800
Message-ID: <20261102225235.334487-80-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wo-00000003m7C-0Dg7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60148
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJDdz/qRXTaIaeig6MKWozBvlanxLIPj9rwHpKAFtFgnfxwGIyJL19AwC1pZpKoglM9hslABEEOcI9y3s3rpLhDS48mE61hd9VkCd1IhrAB1Er2iLjvp
 FroG+7TCLeuqGM8FodISGvHgZ4+e5wuGttheKpklpMys5Ubj8on2Gb7VhgtRd07l5idFKWhk78pkVC+DK0wyd9pSswgyjdJaCO11IFXRrpAao3dxd6xE9i6s

shtc1 uses 32-bit jiffies and time_after() with a 100 ms (HZ / 10)
interval to cache measurements. On 32-bit architectures, if the sensor
is not polled for about 24.8 days at HZ=1000, time_after() wraps around
and cached values stop updating.

Convert last_updated to ktime_t with a 100 ms interval using
ktime_get(), ktime_add_ms(), and ktime_after().

Fixes: 1a539d372edd ("hwmon: add support for Sensirion SHTC1 sensor")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/shtc1.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 362a73cf661b..83dd24fdd0da 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -13,6 +13,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/ktime.h>
 #include <linux/platform_data/shtc1.h>
 #include <linux/of.h>
 
@@ -56,7 +57,7 @@ struct shtc1_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
 	bool valid;
-	unsigned long last_updated; /* in jiffies */
+	ktime_t last_updated;
 
 	const unsigned char *command;
 	unsigned int nonblocking_wait_time; /* in us */
@@ -108,7 +109,8 @@ static struct shtc1_data *shtc1_update_client(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ / 10) || !data->valid) {
+	if (!data->valid ||
+	    ktime_after(ktime_get(), ktime_add_ms(data->last_updated, 100))) {
 		ret = shtc1_update_values(client, data, buf, sizeof(buf));
 		if (ret)
 			goto out;
@@ -125,7 +127,7 @@ static struct shtc1_data *shtc1_update_client(struct device *dev)
 		val = be16_to_cpup((__be16 *)(buf + 3));
 		data->humidity = ((12500 * val) >> 13);
 
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

