Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665734;
	b=GqR6P6SM67N26Ocw5sAZ01B/TW1JQzZQRPBbGHLatjbdHLiyrTfyRgclbmtBBdqQHNx3
	 RUaBXqeWWRpA0YIi5mpaECZvCB7To0ADxsDyI9OQQgONpEIUkqCVf1hvFYNOrve6/9K61
	 XQ+uDmXvKF7H4/mEOmcFBggyooGqCpldgo0dG70ow5RVS6/e3e/OG07UetbhPrReRQf7B
	 MsPUiLufTsBCzRECayyGPrs3FCiSCa+i++q4lcm0tmuVFfSPMeK1T596o7IoZzN5bw3GK
	 VbH3a1QFOyYw5ePxVPiinJpxioAmBSunTkiNIX7ihcQzkPGDSoUs3fUbyCm8nFfnGtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665734;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=p8l0M8yW4VjyWGR8/3eVTyCZxDRJiv8QqRoeA4IA8xc=;
	b=H6qs4t5OryGedGyESeke2X0YtOrDcvHorCgFOh55gFSGleoDaXbS99gpPTPJ0iyhTee5
	 845uDF2BFJAxHemf58XPAO6Sf2Y+fiBFY6EoXfjtuAF5kZ0lqn/C5DLrnhYDWbYQropVP
	 xPgDozNKnd6UZ9v0bemQO6EP/EO0ZPbWqLCGwpnQISgE/A6KZUAxr8JmyALqWJZXIKlAq
	 Nl8gWlifKfMrqUu//ulU+bO9uDc6A+Nk7dLNz5SDwrvmXWllTvoRrq3s1mAppLdeKl/PG
	 nmUEHijeAcdh9g/Q2eBwAYaiDwn2k5izgQSRAi/m9EsR4n10xeHMjKN/7PNsRofBPqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DFox7BCu;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC934606A329
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC934606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DFox7BCu
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id O1oWxTC68MylkO2OSx2Lyl; Tue, 03 Nov 2026 00:28:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2OSxbbLmbxHHO2OSxmREt; Tue, 03 Nov 2026 00:28:52 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae92ac4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=kSx0fv9KhKuhGOkH0XgA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=p8l0M8yW4VjyWGR8/3eVTyCZxDRJiv8QqRoeA4IA8xc=; b=DFox7BCusryV
	mGhesYNkGiaTxUoZx+DQqCTUN5w3go8jWEwe/Oy24ftU/E92MaN1HvESQ+KARGvmkGyNbKOhlFFsr
	CS+asQ0uG3t6O1aAsQ/9pqycYK9q+O7oz8/IeoXKnIbESA5jV2VUIiMDuHD0akdOaWozBj8kWM1+r
	6ZQklCEUsqi6cJSL5hxehqvHEd/PgVLrLc/0RQkRxa8IqNykjNoHhb6ownMmRGvm3InJDaCp/LZ8h
	4YGSxpgaVY5t6jX74Nr1Du+q+WrgF/QJpPyw3oX5vlDlzzCVLBthTWxpeXhQrcNAb/P7YROGsI4gQ
	BmqGFU76y+5CnrBPp+od6Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40880 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xE-00000003n8D-18NE;
	Tue, 03 Nov 2026 04:26:40 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 087/102] hwmon: (thmc50) Use ktime for register cache timestamp
Date: Mon,  2 Nov 2026 14:52:20 -0800
Message-ID: <20261102225235.334487-88-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xE-00000003n8D-18NE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40880
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMmntq5UdWjIBWqsGI9FFJqt+jB2pm//RO6Xs9KvnxLrMJ6SIhzHmOb1SAYnlUEhNjP+gnMh1uzgutozCt3rfaPYRgjlJ68We9O5zp7XJzVhaLaH32bb
 uk3On5yFjNmpjj7kMUwBKrfre1rdnhCk2+tATnYm2DRyDgYn5TIbqy7MBJh/r4vVVrC0RhB3chfm7+W1pVa6F7mf+eRvihC4jrqife6mMTPcHSA03XRnglL8

thmc50 uses 32-bit jiffies and time_after() with a 200 ms (ADM1022) or
1200 ms (THMC50) timeout to cache register values. On 32-bit
architectures, if the sensor is not polled for about 24.8 days at
HZ=1000, time_after() wraps around and cached values stop updating.

Convert last_updated to ktime_t with 200 ms / 1200 ms intervals using
ktime_get(), ktime_add_ms(), and ktime_after().

Fixes: add77c64ca8b ("hwmon: add support for THMC50 and ADM1022")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/thmc50.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/thmc50.c b/drivers/hwmon/thmc50.c
index b385ef64af75..73755791af56 100644
--- a/drivers/hwmon/thmc50.c
+++ b/drivers/hwmon/thmc50.c
@@ -15,7 +15,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 
 MODULE_LICENSE("GPL");
 
@@ -60,7 +60,7 @@ struct thmc50_data {
 
 	struct mutex update_lock;
 	enum chips type;
-	unsigned long last_updated;	/* In jiffies */
+	ktime_t last_updated;
 	char has_temp3;		/* !=0 if it is ADM1022 in temp3 mode */
 	bool valid;		/* true if following fields are valid */
 
@@ -77,12 +77,13 @@ static struct thmc50_data *thmc50_update_device(struct device *dev)
 {
 	struct thmc50_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	int timeout = HZ / 5 + (data->type == thmc50 ? HZ : 0);
+	unsigned int timeout_ms = data->type == thmc50 ? 1200 : 200;
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + timeout)
-	    || !data->valid) {
+	if (!data->valid ||
+	    ktime_after(ktime_get(),
+			ktime_add_ms(data->last_updated, timeout_ms))) {
 
 		int temps = data->has_temp3 ? 3 : 2;
 		int i;
@@ -106,7 +107,7 @@ static struct thmc50_data *thmc50_update_device(struct device *dev)
 		    i2c_smbus_read_byte_data(client, THMC50_REG_ANALOG_OUT);
 		data->alarms =
 		    i2c_smbus_read_byte_data(client, THMC50_REG_INTR);
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

