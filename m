Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665735;
	b=MvB/PQedMf35ln5CDs7TJo15cb7DcSIscRt99lrL54bl4A4ZFFQzmAWZvyjV1r/3R/Bh
	 cR3h1kANpoUk7pcZ/P+Ox0q4ESpr9ItXdTgtUeQ5gVt33obh/5X32LhTLtuTo7l0g8bwt
	 RLEyiFth8YoaCP29Tc759LnnxogVPe9Q+ExWepYmMk6TrKi6bIyRqszX5h/bruZUqqMfO
	 vbhkwRg/IgmWQPBDW7sHGWxaCyFWfVYIgIZ1wITmfUPdEMh0r/VemGnx6EcCjALnBF9e2
	 /LvoL0yRvxDq33Mr7QUxXwwkk55rsYcz51T4QGPgCRKjeHRKpmy2Ep/ZR25DuDjxJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665735;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=kQ1w3xTRGJ8eGV1fUVG6v0y7RRymG5HCy5XlSkC/TSs=;
	b=OFAe5F+gzo4PTp4gXGjrQMJGarNkRSQr+8qzukAzNmvamPnQTG/WimFwJlXAtVz84FIX
	 uml99p8gA1HCbepJ7wbKJUQaPCixkAFXJiROFP27QWuewf+oJuOcgb6NnrWrAsRPa6ZcS
	 /z1DiG2OU8GmE5jP6y01Sbe1weTatv2OLpjOXKGfkbseEpQbd/xnT/S1fjngSOYbcVq8Y
	 g22qIyxWlaeJC5hqtLhEgdP7aH84wfVUpcIbqUd+wyAbdsEnh5Dcy348ZCpsVOHaSu1Ah
	 vCwXiU5roWqUrpj1nfcBVbs+DrJYLP+iXMfo9NfTMACTMIWxXZgLClzw4nYzsNEFexQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2KEjPy26;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B661606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B661606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2KEjPy26
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id NxGFxSE4SMylkO2OTx2Lz5; Tue, 03 Nov 2026 00:28:53 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2OTxvo188LLeO2OTxgFfj; Tue, 03 Nov 2026 00:28:53 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae92ac5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=U4vSxbllF7VvBOfj7nwA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=kQ1w3xTRGJ8eGV1fUVG6v0y7RRymG5HCy5XlSkC/TSs=; b=2KEjPy26KGbt
	eAJwPXHr+V64EE/tUkTC10RZIZdkOG5x4hT+kgSb86MQRfBQJ5uWnqQwj9+9aVWyd0WvMonBXFfwu
	doVblnqE/VHpWFRFPCnwawbZaZkx0peFNOg6wFC3OgKZarRPmHeqVyLIlKu520PmgKk9Qk+4ycrtJ
	IujLhkatEah2WDPgKRY7CPtv6UAMD289R26oRQj/V4/WA0KXA+cZ2DcEQ5NYrUs1rirF3IIvLyGa0
	KDcLkqplUkO6vWri9c5L996YAiUPX4XeB516TZkE/oy3IZacZDHm3hesnCfcQnJAFQZCu0VELGUo5
	CK0FYNaaxDTtH4mSfOjquA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52498 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vE-00000003lFE-1CYx;
	Tue, 03 Nov 2026 04:24:36 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 041/102] hwmon: (ina209) Use ktime for update timestamp
Date: Mon,  2 Nov 2026 14:51:34 -0800
Message-ID: <20261102225235.334487-42-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vE-00000003lFE-1CYx
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52498
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ8DydJQJJlWus5uB6VkQdzhD9QGGNZah3nCx21LfyGwtCKSQzElswXg1ra4IAhAQ6uYIuWlzFlVXoMQz7lUM5mWrFEkPoekT4MH5HEBrDOB8ubcH8iv
 Zp2KddBjHnE4ny5hE0wo1DaKzFjHMZ56ltV/rvWiOlCr+umoqL7KLzaAYCHYuKzDfZNlW6K6xuaHMK4luXPQEoFS6x9MQNau5CP9ZWtjOeDYY6NI2R4weDYO

ina209_update_device() checks cache expiration with
time_after(jiffies, data->last_updated + data->update_interval). On
32-bit architectures, 32-bit jiffies comparisons wrap after ~24.8 days
at HZ=1000 and can prevent cached readings from updating if unpolled.
Furthermore, data->update_interval is in milliseconds (up to 68 ms)
rather than jiffies, causing mismatched units whenever HZ != 1000.

Convert last_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() with a 1 ms minimum cache window (matching the ~1.06 ms
default single-sample shunt+bus conversion cycle when update_interval
truncates to 0 ms) so rapid sequential sysfs reads still coalesce into a
single I2C register dump.

Fixes: ceeadc5c5187 ("hwmon: Driver for Texas Instruments INA209")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina209.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index 39aca2cdf27f..e52ba7d97300 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/err.h>
@@ -62,7 +63,7 @@ struct ina209_data {
 
 	struct mutex update_lock;
 	bool valid;
-	unsigned long last_updated;	/* in jiffies */
+	ktime_t last_updated;
 
 	u16 regs[INA209_REGISTERS];	/* All chip registers */
 
@@ -81,8 +82,15 @@ static struct ina209_data *ina209_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
+	/*
+	 * Single-sample conversion takes 532 us per channel (~1.06 ms for
+	 * shunt and bus), which truncates to 0 ms in update_interval. Enforce
+	 * at least a 1 ms cache window so rapid sequential sysfs reads coalesce.
+	 */
 	if (!data->valid ||
-	    time_after(jiffies, data->last_updated + data->update_interval)) {
+	    ktime_after(ktime_get(),
+			ktime_add_ms(data->last_updated,
+				     max_t(u16, data->update_interval, 1)))) {
 		for (i = 0; i < ARRAY_SIZE(data->regs); i++) {
 			val = i2c_smbus_read_word_swapped(client, i);
 			if (val < 0) {
@@ -91,7 +99,7 @@ static struct ina209_data *ina209_update_device(struct device *dev)
 			}
 			data->regs[i] = val;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 abort:
-- 
2.45.2

