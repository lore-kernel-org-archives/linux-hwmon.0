Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670872;
	b=g+NjV9561oPiD1ZZtGgn+HWxwlXUTR9iEt8jKapFyuaTTrCyn5zE3xWFCnJQuo8CMx9s
	 9J6m7tPA3bJKbZKpeHs4X5pZtzbrW2jur6VEi12kGwQhfvtQCnfps+spoK3HksVPReNIo
	 RzbpQsojMGpZXR++SgpCILn+C24N9MbHY8fsAgWDbNn3HvDUExElZegYd2IZQLE9snXjB
	 sn2/OoX8kyl3FtJnMtlHzTGL4fflQyBztl5nZnRczS3QHAsMBZd2mYwBhtRk2/L8qqLcC
	 PrSUD+5F060JrEmvMvWcSNOOso7ctydurVcvR1N/4THPWrNCrlb+9tSrrqxqALE5Vsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670872;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=roVgvFztCyq2IFsN6OVmzfpbKYdUd9EbMDc0RUmPNTI=;
	b=nLRvCKEt+ZU8cUpqMj3aGjzQPr6kicXIQ/O99hVtOcxicW/21THioQrZHf8Spu0h64Ta
	 t3DvZfTkFak1xnQupzGBcye2iGPWpsDQMi+iveZ2CxTBrB+ywFNmIXlGc93/qdPMqMeTy
	 H//XjpBJ40IFbKsoxyMwDTUK1hmiYFa/Olfx1rKOPjgHCokhn/sCBIdryBR6fQuUnsCCL
	 5kQ4EqPc5rVdToRDQnBWnZ1KFnC4X4RWXqaiybUlYCoxUFIhWAZq1xL08Q43NU2UNY0VT
	 0D4OLNNawzRcYab7pUhnl7FL66DDTbg33JzFTaOHtUDmPauJA+pPsNisYnXRmJGljWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="opc+MI6/";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84632606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84632606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=opc+MI6/
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id Nz0axOULdv0ndO3jMxCJyg; Tue, 03 Nov 2026 01:54:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3jLxgIdTe0duO3jLx3QwY; Tue, 03 Nov 2026 01:54:31 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae93ed7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=LE-7csiePtDvS8Q3lDIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=roVgvFztCyq2IFsN6OVmzfpbKYdUd9EbMDc0RUmPNTI=; b=opc+MI6/ESdX
	xbDRr93uarZvgH34tLTMfvPHiQxP70y/NXQM/VUxhmOxFmZKIwAP3XhOme6uJJ38zGbuXawlDgBcP
	Hp6ZwXVCNbCdnIYe4xHZ8en8pdGN+Lw+e4G0bngKtOiFJCOui2zrtGD0AzcXuwaDCn0tPOqnhZVgh
	ag2RbiFlt8IjaXvvdWdnO3JB1DMoAbYzDTaqLnBG6r7xhjzEjI1GqM7ct+yw3+1KKSKVKkB8FJtJA
	fl7WqW6Pgf9YzNuWKrR3iQoixPrj5dQ8LR5F15KUahyZPAT7c2MI6b25euiT5+sfxIsRWcLCDwMKl
	YBwl93h1v5HZU62Ut77Zzw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40760 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0x1-00000003n2g-1vU5;
	Tue, 03 Nov 2026 04:26:27 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 084/102] hwmon: (stts751) Use ktime for temperature and alert cache timestamps
Date: Mon,  2 Nov 2026 14:52:17 -0800
Message-ID: <20261102225235.334487-85-linux@roeck-us.net>
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
X-Exim-ID: 1xO0x1-00000003n2g-1vU5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40760
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJPBmB6EM9yXbbvC9jbz9LJHy2+QwrbWI1OT7TV0cUdMMQFdpGILukQccukKGW/IUpdAwqthZYTtGLaADlIa/xdgdaJhhSlFFqc57GGOXIT4n19JGKcY
 4LWbXRA37481/Gc0T2Eap6Zv90Hhg+qDvnL9CmBGoe+gUrNCmIPnqQ5A03o8TGGS/0c9v1pEAzR3fkEo/RdGK70jB+b37xmQJpze3V1/XpMLahYz9bXzfu4v

stts751 uses 32-bit jiffies and time_after() with millisecond intervals
converted via msecs_to_jiffies() to cache temperature and alert status
readings. On 32-bit architectures, if the sensor is not polled for about
24.8 days at HZ=1000, time_after() wraps around and cached values stop
updating.

Since stts751_intervals[] already stores intervals in milliseconds (down
to 31 ms, where adding a 10% alert margin also suffers from coarse
jiffies rounding at low HZ), convert last_update and last_alert_update
to ktime_t using ktime_get(), ktime_add_ms(), ktime_add_us(), and
ktime_after().

Fixes: 7f07ec0fa17a ("hwmon: new driver for ST stts751 thermal sensor")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/stts751.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index ce23681f7981..e90168dbc497 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -18,7 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/property.h>
@@ -92,7 +92,7 @@ struct stts751_priv {
 	int therm;
 	int hyst;
 	int temp;
-	unsigned long last_update, last_alert_update;
+	ktime_t last_update, last_alert_update;
 	u8 config;
 	bool min_alert, max_alert, therm_trip;
 	bool data_valid, alert_valid;
@@ -260,13 +260,13 @@ static int stts751_update_alert(struct stts751_priv *priv)
 {
 	int ret;
 	bool conv_done;
-	int cache_time = msecs_to_jiffies(stts751_intervals[priv->interval]);
+	int cache_time_us = stts751_intervals[priv->interval] * USEC_PER_MSEC;
 
 	/*
 	 * Add another 10% because if we run faster than the HW conversion
 	 * rate we will end up in reporting incorrectly alarms.
 	 */
-	cache_time += cache_time / 10;
+	cache_time_us += cache_time_us / 10;
 
 	ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_STATUS);
 	if (ret < 0)
@@ -286,12 +286,13 @@ static int stts751_update_alert(struct stts751_priv *priv)
 	 * Note that updating the cache timestamp when we get an alarm flag
 	 * is required, otherwise we could incorrectly report alarms to be zero.
 	 */
-	if (time_after(jiffies,	priv->last_alert_update + cache_time) ||
-	    conv_done || !priv->alert_valid) {
+	if (conv_done || !priv->alert_valid ||
+	    ktime_after(ktime_get(),
+			ktime_add_us(priv->last_alert_update, cache_time_us))) {
 		priv->max_alert = false;
 		priv->min_alert = false;
 		priv->alert_valid = true;
-		priv->last_alert_update = jiffies;
+		priv->last_alert_update = ktime_get();
 		dev_dbg(&priv->client->dev, "invalidating alert cache\n");
 	}
 
@@ -354,10 +355,11 @@ static void stts751_alert(struct i2c_client *client,
 static int stts751_update(struct stts751_priv *priv)
 {
 	int ret;
-	int cache_time = msecs_to_jiffies(stts751_intervals[priv->interval]);
+	int cache_time_ms = stts751_intervals[priv->interval];
 
-	if (time_after(jiffies,	priv->last_update + cache_time) ||
-	    !priv->data_valid) {
+	if (!priv->data_valid ||
+	    ktime_after(ktime_get(),
+			ktime_add_ms(priv->last_update, cache_time_ms))) {
 		ret = stts751_update_temp(priv);
 		if (ret)
 			return ret;
@@ -366,7 +368,7 @@ static int stts751_update(struct stts751_priv *priv)
 		if (ret)
 			return ret;
 		priv->data_valid = true;
-		priv->last_update = jiffies;
+		priv->last_update = ktime_get();
 	}
 
 	return 0;
-- 
2.45.2

