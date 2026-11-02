Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664835;
	b=BgzeS/frIzGORmro8i0g5UG8dD+oyetDt4eBbTXZCqvwfWlGQ8Xmau4HW9ycXFJdGpl1
	 +7K1D7yesDS8VFhfoMFWSeRdcSubl9hgfHVgtFRXqgcekd/NVP93F2/7EKh5dViMoFwQp
	 EQa5DXQirstE4F7qnDHx3z0DEgXMbHfb78d4wjKR2au6ee1yP0UOrSREebUEJr58ssuvP
	 WSFCh840gPzcO2vHZPasG+EIOW1sLZ52brzNXyAKKWjh/yqEYJ7hJlkme4bENI1VWlz2C
	 H/MksFJw3UupbyM30D+D4Bh7UDjb6HafhWp5K2jNQuXww1IhLtS2sLy6yMcuYq1R3Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664835;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=akBIG4dPdZTYf2Rcm/Qa4aSNnEf+tX8oPEJAOGW78ug=;
	b=lZ3rr7a1Q9POI+KGBg3YD5iRvM3CLcgVhLwQCpy+fU9YJ8PKvbqXuy5rkZQEt7QEB/9h
	 o5h+yn3u3CU2sQQHvCZNLjhxFG0JyQfN3SMUJwZ31ddQaZOyqgR+qYF27bZpc2fRolru/
	 VCKf6LUnkZ+H1hs9/pwp7bJ3deDkiNIVAuSNTJv3uAHCukIZVmLzAes1nP3/DQeED0LtM
	 u4F8a9MWutlzksQrHrvgXHUVsap/fwb7EYUJjPFsB2PYf8XZgKumNfHCWle0AUWFbJk9Y
	 5qlLNXI0qze8LoyCFduEffABeEB4eVXqc8U705MHAq3qGAax2X8QHwZEfIPuz/JaBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TfqUbpEk;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72C606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE72C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TfqUbpEk
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NxG6xYOXGLvgbO29yxlyw1; Tue, 03 Nov 2026 00:13:54 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O29xxRUvLLr2uO29xxFyHu; Tue, 03 Nov 2026 00:13:53 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae92741
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=9u2sqNYZrjaiMMmOxjYA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=akBIG4dPdZTYf2Rcm/Qa4aSNnEf+tX8oPEJAOGW78ug=; b=TfqUbpEkWnWD
	ZiuYrwHzGX3QilmPV5r09DeckDAhfIq4BRIBB0IIt7jMBWETlidnvzX62gR1eGdi5+Vvzczc9EW5K
	WSReTmlPWJUvuwhvVg7itGLyVRv8T5YiCgJNoT0eXcOE9aoczpcxchJbbKFkS/XDmLQlspmLCWyap
	zsSMJD6A4rxy2QdJSDwDsrVwlqvm4xqFkZxGhfowwWT4Ly3A5ZTDV0d5BIYlkt0aGyAPmetR1SKEc
	GPzYJ2c1fBiKjFwLxRwYUxfwUd6JMSeos3rwaxw+YLdz8rUE0QdvCiLqSuu1c+odJcjrfnRO1YNLM
	XcmyFn/Av6RampsfquwZpg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58322 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vg-00000003lUc-2mh6;
	Tue, 03 Nov 2026 04:25:04 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 053/102] hwmon: (lm95241) Use ktime for update timestamp
Date: Mon,  2 Nov 2026 14:51:46 -0800
Message-ID: <20261102225235.334487-54-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vg-00000003lUc-2mh6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58322
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEqq9q2UhrQQHi9vTkMZ/H1kREarmnZv7oWtB5fgLGFwGXDB17i7GX5rDV50qaW8FWHrbHlongl3erMw4OvEtYurFySBWEJO1W82M1C2IHBx6o+wK8A1
 buYij0k45DfoOkDjINEmEo3BnsgrRSSLgcOaS+03XkZSbp1QyDEwul7mwnG/2/GrKM0o6619NA11K5Qw8hyFmuIdW/NU2o+0QZ2KULeLQ33cY0S1k7nvOSOP

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached temperature values from updating.

Since interval is stored in milliseconds, convert last_updated to
ktime_t and use ktime_get(), ktime_add_ms(), and ktime_after() to avoid
32-bit jiffies wraparound issues.

Fixes: 061603275814 ("hwmon: LM95241 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 0cb0edb3845d..8359a7fdd6b4 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -12,7 +12,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -74,7 +74,7 @@ static const u8 lm95241_reg_address[] = {
 /* Client data (each client gets its own) */
 struct lm95241_data {
 	struct i2c_client *client;
-	unsigned long last_updated;	/* in jiffies */
+	ktime_t last_updated;
 	unsigned long interval;		/* in milli-seconds */
 	bool valid;		/* false until following fields are valid */
 	/* registers values */
@@ -100,8 +100,8 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 	struct lm95241_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 
-	if (time_after(jiffies, data->last_updated
-		       + msecs_to_jiffies(data->interval)) ||
+	if (ktime_after(ktime_get(),
+			ktime_add_ms(data->last_updated, data->interval)) ||
 	    !data->valid) {
 		int i;
 
@@ -113,7 +113,7 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 
 		data->status = i2c_smbus_read_byte_data(client,
 							LM95241_REG_R_STATUS);
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 	return data;
-- 
2.45.2

