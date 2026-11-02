Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668638;
	b=ryxwZV+HlRMLgWiSVx13pzxc/LvADJBxkJk8vEntnVo890vG/sKG891ZV04EJ5jnNGTl
	 MHJDI9uG8pCeM9B1s2lP4Jpp8PLSkaK4vmKhJ48pnsAFRYn/ZeMvlCIWVgi3JXA/madfK
	 FMDh6wEX8d7mrIoui/x6gQttTcHuO+GRjlF4HOASbMPYhsmY8X1HjsleCdoHjvaX/kpih
	 F4wg1zHHNlrTL1/LAuG7CA/PQhfrLmMc/5Vao+hB9UHd/w20GQyV9Va7e03/7gw26B9F5
	 1b3c0q3+rSV8mKc99AbUbyR4+ThWd/CIuIWDUbHdaLHmUFwSRbjIYilsWkICniUoIDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668638;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Ct4dEeuc6TsTrRGAcIJFVg0NEX1RTJdwX9+SosQ8j/A=;
	b=IK+W8EetpFxgJ3/wN/+KRPJ1Y5wHUOhMQobPO1kxJqdsHa/P/K647m4ouPgKJ6EQvcYy
	 4o1Fg1BXeDGbvvjdxNluRY2FZMh4Urqxy64dPrtHp+U6P0LMeMedNcCWqE2XONzOsRjG6
	 7zsVettPrZHzHacLAB64smKIv2YI+hizyZo80OTdNrad9fMjoVZbP452IddiKPgXhR+qr
	 6QakK8eFVVi/OaMsYzgMtDKw6R1wLDOjnMwI1/YKvd0rSnqTqjGQ1xmK38QgpYI/82CQ2
	 QRghP+oxjAf34tws7i9PYwakoafhu1olHSw3covuJ+xG3/ufdvS4zkby5XjuviuU6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PAe74kb3;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F040606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F040606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PAe74kb3
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NxGOxYOfcLvgbO39JxmHqM; Tue, 03 Nov 2026 01:17:17 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O39IxNVBd63hBO39JxhsUE; Tue, 03 Nov 2026 01:17:17 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae9361d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=nz0xlxbqSiAl9R3AXk8A:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Ct4dEeuc6TsTrRGAcIJFVg0NEX1RTJdwX9+SosQ8j/A=; b=PAe74kb3Ro3R
	Vc3br7tGOgRoYmiMzFNSYzT8STlo5peUDSZSxZ0h6pUDXPUi6g5e8zFx8gRJMaQIwxj1dBT/s6gNI
	3BZRiRbEoP2d9BlxQA4hzi33W4cwiALtP+z/d427xrUfmqnwmu9J6QBLNnWl0KipP7Av4rfM9wvVI
	hDencNyl9kap+VujRtfwk6aBu3x0StRKLjjB05UgqDRT6K2NRsqeO21lYgVBVkI1bXoQM5y2fPLAA
	NurEOfDXYhjcF4ymdzBRxeD0FeOcbsIJuUUW1QkA9H8PHP3tIMFrYwB+b/1PGyGl2zk7l4Zeldwg1
	BV3LMQQ8pM9LnOdZy9K34g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58300 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vf-00000003lSq-16Vj;
	Tue, 03 Nov 2026 04:25:03 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 051/102] hwmon: (lm90) Use ktime for update timestamps
Date: Mon,  2 Nov 2026 14:51:44 -0800
Message-ID: <20261102225235.334487-52-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vf-00000003lSq-16Vj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58300
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJKz6+YZDoShesNp0CZGUoNwtFXYDVAQoNbMZ1pHaoVWlPnGqRA+q3/5muKXr1bwutStXy1jDCGwEqzKNjigldpfvpRfae7pc/YpU90UPr6FdAmJqjLJ
 XNYd/8GchbF7OPakmfZoLJBkCTlwyrzmHm5V8HyDoCupFpTqrhBcZPCfBgneendG7E4UTb83Orhpum67sfpJT0MJf5E6QLzTB9Q06RRYySRBoQJ1StzZ9GuK

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors or alarms are not polled
for longer than half the wrap period, time_after() can return false and
prevent cached temperature and alarm registers from updating.

Since update_interval is stored in milliseconds, convert last_updated
and alarms_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() to avoid 32-bit jiffies wraparound issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3faeb2c6ab01..3e511bdf2872 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -108,6 +108,7 @@
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/kstrtox.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
@@ -740,8 +741,8 @@ struct lm90_data {
 	bool shutdown;		/* true if shutting down */
 	bool valid;		/* true if register values are valid */
 	bool alarms_valid;	/* true if status register values are valid */
-	unsigned long last_updated; /* in jiffies */
-	unsigned long alarms_updated; /* in jiffies */
+	ktime_t last_updated;
+	ktime_t alarms_updated;
 	int kind;
 	u32 flags;
 
@@ -1160,7 +1161,9 @@ static int lm90_update_alarms_locked(struct lm90_data *data, bool force)
 		return 0;
 
 	if (force || !data->alarms_valid ||
-	    time_after(jiffies, data->alarms_updated + msecs_to_jiffies(data->update_interval))) {
+	    ktime_after(ktime_get(),
+			ktime_add_ms(data->alarms_updated,
+				     data->update_interval))) {
 		struct i2c_client *client = data->client;
 		bool check_enable;
 		u16 alarms;
@@ -1219,7 +1222,7 @@ static int lm90_update_alarms_locked(struct lm90_data *data, bool force)
 					max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
 			}
 		}
-		data->alarms_updated = jiffies;
+		data->alarms_updated = ktime_get();
 		data->alarms_valid = true;
 	}
 	return 0;
@@ -1247,7 +1250,7 @@ static int lm90_update_device(struct device *dev)
 {
 	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long next_update;
+	ktime_t next_update;
 	int val;
 
 	if (!data->valid) {
@@ -1256,9 +1259,8 @@ static int lm90_update_device(struct device *dev)
 			return val;
 	}
 
-	next_update = data->last_updated +
-		      msecs_to_jiffies(data->update_interval);
-	if (time_after(jiffies, next_update) || !data->valid) {
+	next_update = ktime_add_ms(data->last_updated, data->update_interval);
+	if (ktime_after(ktime_get(), next_update) || !data->valid) {
 		dev_dbg(&client->dev, "Updating lm90 data.\n");
 
 		data->valid = false;
@@ -1304,7 +1306,7 @@ static int lm90_update_device(struct device *dev)
 		if (val < 0)
 			return val;
 
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

