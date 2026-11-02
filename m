Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671092;
	b=5qZQwlyKPin8n2ebR5w6XAdYRuKJDvSNNm5CH+40jCdua2YDc7paH3BI/H5NrfwoRBbl
	 GqSkqBbd6Kxe2CuszQo4kpFuV8atW8aOHIIIjgzy7q/8RA4RHxjyk+KuXYURxvuV9++0i
	 T3hgYodgK1ckoZ9XJjlxDEYj9XhkSGZf64RWM4hbO9ALXFY7Ihq6U8vE+J4fAbvr8ngvZ
	 j5pSVUev5eNz7V2lM6bBQk+D9fdOjKbD4fuw1yzQ0pq0NDlNPdHfqsy+7UXiQjPU8TRWI
	 /iC5DI5x9pn/KO2z5h9Tw/l33jiPkYdA14qIsdOIronZepKJslMaHGfzT4MxoX3OpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671092;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=waGcG/YTqZ9u3chtVR77N+pYJxiC5+WmGoA7D27GjdA=;
	b=x9tHo72UKh1slrT9EYRbrv2D2dgJD0WLqBvc1TFh4nNHQBQHoDEfbGunmbdeIlLdqph/
	 pUo1owXpspWZdNtMoQDEwiKRWOz3c/4YL5sEVJeGYnniFjeMEl+AUl3k9yoGCA+nl4Nm6
	 nEsRgmARjytDGLPAxpE8U5E6+yGXBm3ChBKVN9dbyqd8I1Mce6nR5almgxuIMQjfOKIhC
	 q/rHHgcWGCfDvJNL+o+gr6LmQiSImGwTr3z/h1PEKSAB935vyr39cWc6eOoWSEXuKPYB5
	 yrcqSy4hiVj3Wcp92uJWK33sa+8gmAIw5j64+lU753FFjHcDW9y6kcxHRBWxdURyWrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="y4+xUi/G";
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940B606A329
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6940B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=y4+xUi/G
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NyqZxEORHusRSO3muxtp5R; Tue, 03 Nov 2026 01:58:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3mtxOUNi63hBO3mtxigD6; Tue, 03 Nov 2026 01:58:12 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae93fb4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=2aV6ee8lSjtT4f3mgsUA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=waGcG/YTqZ9u3chtVR77N+pYJxiC5+WmGoA7D27GjdA=; b=y4+xUi/GDGFC
	pJmipxfrNeBbuwM6tzHuzB5SRkQp51ujDadxVctLI8slsq0YrrA8o9eBMUcB2oaiSVRusxb4MSotv
	PxyOwQlxbP8705T1IDgzQZuLFwS25UVDPdvSO2zO8rwU6hJH9XdZz5EjuTVXLCy9h1rcWXvCTFZBR
	3VT2BPEZQerTipUij0fqaHr0Hm/C1jXxdVVV1LNdor1IyY4zEXgJJmOWIHotLO3QLgb7jNX41dDzy
	A8rE+j1y3JmSLc8Dv5pvlFuNqWV6Q33yC9/hJM1SDTny5LEAu8RHcQAt9exhr4XUjZhlOKtTpQ03L
	hhhtNotMznKePBrk8DnRiQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49854 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vR-00000003lKT-09nm;
	Tue, 03 Nov 2026 04:24:49 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 045/102] hwmon: (lm63) Use ktime for update timestamps
Date: Mon,  2 Nov 2026 14:51:38 -0800
Message-ID: <20261102225235.334487-46-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vR-00000003lKT-09nm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49854
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFEL4qdU4EEinnYowLpjwYnKU0SXG9wOGQtXtOFLae02c7xbqjKnAH04vbQjJ80IegMIkL/WggkCSJ7I5hMW9UJq941aw7NsmJ+QRN0OnFi204UWO65u
 TFLiG69mCqxCQtgR3+1LJWiLT7Eq2WpxQB7/9V/9AJ5SikgEvBwqxJwygdVUahh1m9hs7QdtAN2OtZu332v2p41Vy6QHK6/qYDzVUKIQKvL8XdMAxCk3czBn

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor and lookup-table registers from updating.

Since update_interval is stored in milliseconds, convert last_updated
and lut_last_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() to avoid 32-bit jiffies wraparound issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm63.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 607758bf7c58..6ae2d42fb30f 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -27,7 +27,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/i2c.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
@@ -156,8 +156,8 @@ struct lm63_data {
 	const struct attribute_group *groups[5];
 	bool valid; /* false until following fields are valid */
 	char lut_valid; /* zero until lut fields are valid */
-	unsigned long last_updated; /* in jiffies */
-	unsigned long lut_last_updated; /* in jiffies */
+	ktime_t last_updated;
+	ktime_t lut_last_updated;
 	enum chips kind;
 	int temp2_offset;
 
@@ -222,7 +222,8 @@ static void lm63_update_lut(struct lm63_data *data)
 	struct i2c_client *client = data->client;
 	int i;
 
-	if (time_after(jiffies, data->lut_last_updated + 5 * HZ) ||
+	if (ktime_after(ktime_get(),
+			ktime_add_ms(data->lut_last_updated, 5000)) ||
 	    !data->lut_valid) {
 		for (i = 0; i < data->lut_size; i++) {
 			data->pwm1[1 + i] = i2c_smbus_read_byte_data(client,
@@ -233,7 +234,7 @@ static void lm63_update_lut(struct lm63_data *data)
 		data->lut_temp_hyst = i2c_smbus_read_byte_data(client,
 				      LM63_REG_LUT_TEMP_HYST);
 
-		data->lut_last_updated = jiffies;
+		data->lut_last_updated = ktime_get();
 		data->lut_valid = 1;
 	}
 }
@@ -242,14 +243,13 @@ static struct lm63_data *lm63_update_device(struct device *dev)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long next_update;
+	ktime_t next_update;
 	int msb, lsb;
 
 	mutex_lock(&data->update_lock);
 
-	next_update = data->last_updated +
-		      msecs_to_jiffies(data->update_interval);
-	if (time_after(jiffies, next_update) || !data->valid) {
+	next_update = ktime_add_ms(data->last_updated, data->update_interval);
+	if (ktime_after(ktime_get(), next_update) || !data->valid) {
 		if (data->config & 0x04) { /* tachometer enabled  */
 			/* order matters for fan1_input */
 			data->fan[0] = i2c_smbus_read_byte_data(client,
@@ -321,7 +321,7 @@ static struct lm63_data *lm63_update_device(struct device *dev)
 		data->alarms = i2c_smbus_read_byte_data(client,
 			       LM63_REG_ALERT_STATUS) & 0x7F;
 
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

