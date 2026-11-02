Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659996;
	b=zv6CssVp1NaUOwGT3Q7CqEsSO02Rbpk8YLYciOfVKN0eLygQDVroWynmXUevwEH4jbWS
	 KfLGuTPg/ZlKHaaZxdvtTxWxUckY7BMH66kicVc6cxLc4vmgtwahHXsycc2sVJ0hOW7HX
	 kMoNtfpqEXeMYHXkDfpSRJS4cwrcCHzvEFBzhATn3c4jq+cKJ59Ftml/rtEkgQCCTiY/T
	 xvFnqExlr/FZphouNxUo4iVjJTh2Z4y6EYpDSLPcbOGFVLGFwJWiOgy2PjISYZY9vuhFL
	 v38g90Q5YN/Mc+QUyaT/WA19W7P53o4gGlM8D3MDwqmPL/whVwxw0Ct0ugI6yMr1xaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659996;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=OYWSVI0q9jO/MItyp95Lj77osu43jTL9HL2XEkt8As4=;
	b=TB60yTICXcVgUCg5aS5i6qCKrIcF7EMlkseTW3aGK6wCYpawmV+Dlag5t+KGLPdP3949
	 UmDENpI6luBKsHNbxdU4X65Fz6d0x3xymWNqE5hmagcDzByD9Iyb7cBL5Yn+zqPoY0heC
	 oeLcSw42BYTJLNvi/55s9ElnVPjrWOQu/oSuV1MaXac6GGJljV++u29jknJ4fktyub/+G
	 xem7/iUnzHBEw4FG3Pc0aQuoErT3HaZ8gW97APnqH1JxMnl7BS/JNW6g+NCTjfulci0zk
	 MUaF8ksmDaPBFK+h7bZaeaUFpr/XjT5OsDKyuVSYRLnNI9o0DrB5D4xtfPFR90d1XPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1HH5pRYh;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B858606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B858606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1HH5pRYh
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id Nl5Rxe5yzc3XsO0tvxXleW; Mon, 02 Nov 2026 22:53:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tuxEjaEQfwNO0tvxXURj; Mon, 02 Nov 2026 22:53:15 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae9145b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=H-W2ODg_JNSdK5jLy-MA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OYWSVI0q9jO/MItyp95Lj77osu43jTL9HL2XEkt8As4=; b=1HH5pRYhxoTK
	CEAC9SF3pbZx7ShttrNdn+yNFfbJK22Ves1251LrPl/q2AsNC/T5M/mJA4KQwJFja2ItKydorCjO2
	pUaGnEajXEvuAbj5zdknCw1N8xwLqIaRs1CwgF5VifGCHcFsCtNF0T8DYUYe2eSL5rno5gftPZTiO
	03vgnOfJWeg0rGKB3wG6rkxSdOFdeBkzrKqRSRJea+EfLsZxh4Uxjh7msjN8IC7ER2HwBcXUjv1QC
	tzO7THyj0OeE3DVQPHLf/HcucqLMWorHE5bFbE+H1Bbj5yTFnzZyCEyV/eqHRqToq3MItzpfnagGD
	1X47aaLQHwSbTPTfJ9z5XA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52050 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tu-00000003kGG-20VL;
	Tue, 03 Nov 2026 04:23:14 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 012/102] hwmon: (adt7462) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:05 -0800
Message-ID: <20261102225235.334487-13-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tu-00000003kGG-20VL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52050
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 37
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIIOdGCjKvM16Js2ivn8tULw6rhKe2ITyHbOair31X8lut3HLtMNV6GtE4Ur0rM3o3Zg5Ay76OATe+YtPFa7Y8AyznllRwGd3bRxeDDuUfLOI8D6ypRf
 DgJsgJPZJXl4NRBq5OzPJO2b+UTs6UVVgDzG/nEJ98fKhWfoQfSUAjneVfnuySx7pfaFHAAlPj9COH553PNLg/5tRymy6thT7sg/pIvnJdHTA1ov7w62tSqT

adt7462_update_device() uses 32-bit jiffies and time_before() to cache
sensor and limit registers. On 32-bit architectures, leaving the device
unpolled for more than about 24.8 days at HZ=1000 causes time_before() to
wrap around and return stale cached values.

Convert sensors_last_updated and limits_last_updated to u64 and use
get_jiffies_64() and time_before64() under data->lock to avoid 32-bit
jiffies wraparound.

Fixes: c0b4e3ab0c76 ("adt7462: new hwmon driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7462.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 376331f7fa17..61deb156d304 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -193,8 +193,8 @@ struct adt7462_data {
 	struct mutex		lock;
 	char			sensors_valid;
 	char			limits_valid;
-	unsigned long		sensors_last_updated;	/* In jiffies */
-	unsigned long		limits_last_updated;	/* In jiffies */
+	u64			sensors_last_updated;	/* In jiffies */
+	u64			limits_last_updated;	/* In jiffies */
 
 	u8			temp[ADT7462_TEMP_COUNT];
 				/* bits 6-7 are quarter pieces of temp */
@@ -673,13 +673,14 @@ static struct adt7462_data *adt7462_update_device(struct device *dev)
 {
 	struct adt7462_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long local_jiffies = jiffies;
+	u64 local_jiffies;
 	int i;
 
 	mutex_lock(&data->lock);
-	if (time_before(local_jiffies, data->sensors_last_updated +
-		SENSOR_REFRESH_INTERVAL)
-		&& data->sensors_valid)
+	local_jiffies = get_jiffies_64();
+	if (time_before64(local_jiffies, data->sensors_last_updated +
+			  SENSOR_REFRESH_INTERVAL) &&
+	    data->sensors_valid)
 		goto no_sensor_update;
 
 	for (i = 0; i < ADT7462_TEMP_COUNT; i++) {
@@ -726,9 +727,9 @@ static struct adt7462_data *adt7462_update_device(struct device *dev)
 	data->sensors_valid = 1;
 
 no_sensor_update:
-	if (time_before(local_jiffies, data->limits_last_updated +
-		LIMIT_REFRESH_INTERVAL)
-		&& data->limits_valid)
+	if (time_before64(local_jiffies, data->limits_last_updated +
+			  LIMIT_REFRESH_INTERVAL) &&
+	    data->limits_valid)
 		goto out;
 
 	for (i = 0; i < ADT7462_TEMP_COUNT; i++) {
-- 
2.45.2

