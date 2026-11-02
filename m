Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673157;
	b=ZiiFMIFBOQ6z/gzVUgN0h9nXUyLxq5M5I0nky2wefb9iIvIDb0EADWGo7aHhGTTpsJTf
	 KtxlU2PqiaNxas34P8XRFEBjL8RsUFmqvgli2C9zvRgMApjRI58fYtb8+CbHP1oD/vOKT
	 UTWTbeM/0lU1NlxzVBolRJ4NS1vlM7W9+Q3CHqDtwfogI+pCBepQ7Z5yvPvTfoFIr4iR0
	 8NFWFzqfFhVxfXVD89Ee2iv8ys9lze/H/+u8RHoYH2bNeYHnM90Zv8KMX4xEejCVsGYgk
	 RKYHAQhPnuWB9a545vo+IB8Nlo2mACdHdI35onIn/6XyVyF4W0Q/6A1WT0ha4M31edw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673157;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=T59ApYyIvEsmmKfMJllZ6RD0EM6a6TztqhGipjkuwm8=;
	b=MsDSrczkHk0SZHQCbfFOr4xuba88N+ckWLybtdJuV9c41IN/UKZrqADUp7dWcSMOibme
	 1nEdO+nPMrBmgxFS0EwPk3WMtIDw4lE1dX3DLIppWE0tuR2XFHq9YQTAc3hk3P+nj9ji0
	 D8mnXFnSM2gFOLiLAViGYdloMEpX7dCbu2ZHH4UCsrlcpeej7n6sL++BgnVhwItBxsT3R
	 FyAK6t682FTBr8H72JKCCfiFZWaH1qsTLbQPDIqH9DDkParPZ8QCY4gEMfLU20uh+L0C3
	 jt7JzeIIabYV1fQ5CIbeh4DVVYd3+hitGIuXSpsPwkretvZE0AuqpM00VO6k6q8p6Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="EoDIUdB/";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3828A606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 02:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3828A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=EoDIUdB/
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id NrdtxMk8Pv0ndO4KCxCUJ7; Tue, 03 Nov 2026 02:32:37 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O4KCxKTseQfwNO4KCxcQpK; Tue, 03 Nov 2026 02:32:36 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae947c4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=IDpyhEXVXgWWzvkM564A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=T59ApYyIvEsmmKfMJllZ6RD0EM6a6TztqhGipjkuwm8=; b=EoDIUdB/2pIG
	B0pf3hVKJv+Z0Bml18r5TPWxewLxR8eu4OLjRk7V5926pJlb9h0plF4pXGxV1PIZe41A2pEL7CIiY
	lpF8ccREVOdmPq+sqMGGkkcvMWoVjDNWoUBCmFJH0jozWOXrKqAWhhNf8PJ4S/SN+sLubMgnkLZKG
	4DUqUF23YTO9zKNpwdHaHXI1vPCQu/ch20dM0/6dMF+7c4khp+f3BKEQoksGILCpKwVNcodfyqHS3
	RUmmqNcAAPkYfRR1nmQFV1aGKD0wONsjNSsT1luGlkJaZq+St44pBv0YD8dsvq1gVUriPLxcB0fEe
	s3+zyLLyrWeza5KC87vXpg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32974 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0v2-00000003lAK-0mDB;
	Tue, 03 Nov 2026 04:24:24 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	James Seo <james@equiv.tech>
Subject: [PATCH 038/102] hwmon: (hp-wmi-sensors) Use 64-bit jiffies for sensor cache timestamps
Date: Mon,  2 Nov 2026 14:51:31 -0800
Message-ID: <20261102225235.334487-39-linux@roeck-us.net>
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
X-Exim-ID: 1xO0v2-00000003lAK-0mDB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32974
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKoHYoYgWy70Uf0ZvXNSl5l80xwM9l+C4QO8sjPko029fBJoYMF4lV6/jTHl9zBUi55C39yk1lJuVTiZoSXE2MJ1kY09E+X6kY22ixBfUu4Q6X1CYQG6
 uRhbDTb6F1SUFNapdoifK4QUCHRQRz8Ps3uIX6qFvRqvKNw2onXZaQl6BAc3Jp7KTo1ZUrnGDaN3+J5bDYsVxpKVrJ19majBmIvR9I5K6aRddlfLYYjcJG/W

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If a sensor is not polled for longer
than half the wrap period, time_after() can return false and prevent
cached readings from updating.

Convert last_updated to u64, use get_jiffies_64() and time_after64(),
and acquire state->lock before checking info->last_updated so 64-bit
timestamp reads and writes are properly serialized on 32-bit systems.

Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
Cc: James Seo <james@equiv.tech>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hp-wmi-sensors.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 1953d672edaf..db309cb0c471 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -375,7 +375,7 @@ struct hp_wmi_info {
 	bool alarm;
 	enum hwmon_sensor_types type;
 	long cached_val;
-	unsigned long last_updated;	/* In jiffies. */
+	u64 last_updated;		/* In jiffies. */
 
 };
 
@@ -1196,7 +1196,7 @@ static void interpret_info(struct hp_wmi_info *info)
 	const struct hp_wmi_numeric_sensor *nsensor = &info->nsensor;
 
 	info->cached_val = scale_numeric_sensor(nsensor);
-	info->last_updated = jiffies;
+	info->last_updated = get_jiffies_64();
 }
 
 /*
@@ -1215,9 +1215,9 @@ static int hp_wmi_update_info(struct hp_wmi_sensors *state,
 	u8 instance = info->instance;
 	int ret = 0;
 
-	if (time_after(jiffies, info->last_updated + HZ)) {
-		mutex_lock(&state->lock);
+	mutex_lock(&state->lock);
 
+	if (time_after64(get_jiffies_64(), info->last_updated + HZ)) {
 		wobj = wmidev_block_query(state->wdev, instance);
 		if (!wobj) {
 			ret = -EIO;
@@ -1229,10 +1229,10 @@ static int hp_wmi_update_info(struct hp_wmi_sensors *state,
 		interpret_info(info);
 
 		kfree(wobj);
+	}
 
 out_unlock:
-		mutex_unlock(&state->lock);
-	}
+	mutex_unlock(&state->lock);
 
 	return ret;
 }
-- 
2.45.2

