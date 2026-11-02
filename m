Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660037;
	b=KiM97QQJVfGRVpcDyqZuyAsPLsvd4ZzVUBzSRVK0rPpg2tppHQT7NXhPRzgEzl//D8B/
	 hSBwRjmorIua5iVdAUHfmXlk4BOUZ9ccpUmljrMbpqPDD8WD5vK+FmQPPf8imXM34NgNl
	 poKkFAjfpjaayiVLG3e5DPv8SZoOndrZ/KuKHVYmr8BzhP77Bkoyi1DRHXc2rL5DwKMYq
	 M6h1J02JDydD28fJ/p+/nWmzAZiW3llr5gNse06esLj+RuC+DAbUb2aDJeNbD77M/9LJS
	 dWFVZfpcn82L+F4lVvLWnllmkMVBvnQYzc9GrTraLXKE7V/sJ2zlG+P9kgmVnfa3CNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660037;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ChsZTcVdJQ5H/tGdr6VbJXsHvXp4KKzl3/e+Xbt/OSk=;
	b=L/7eVnDMLPX0rX9Ffw9VOpjRCVn++Z7CC4R7gvVKTHnIaoAfW8qXkeWaedY2Daj62jhV
	 43K3wqyXaF0XySldzTnMsrLsUeBLXJYL7wkCq3pC7HG/xLRDAJdOZlo/L3oMQaDD6BEwT
	 2bYiQEZDi3aHM3y14SGXvDOoV45fVWKwwFffKyMgc2F4QGHgCaJZlFEO2eFNiT4gxXhu/
	 jHUCYVFrQ5im6wPpbsArqLS1PWbVBSW+5LS4SX1zzSQ48FmXZvjULCAF+4WE4i7bplSQI
	 vKaoRXX1hmfCxl/zyt/cmi3ZwR/XnpSihmPuMiDcI9wYaVu6mr2R97IUI49CtmbW8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rTVeWNTm;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED8E606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED8E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rTVeWNTm
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id Nl5QxEAskaC0UO0ubxX0dK; Mon, 02 Nov 2026 22:53:57 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uaxjM6kmTkmO0uaxidDP; Mon, 02 Nov 2026 22:53:56 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae91484
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=8m6ywMfGHsXNRg5B4C4A:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ChsZTcVdJQ5H/tGdr6VbJXsHvXp4KKzl3/e+Xbt/OSk=; b=rTVeWNTmuL6o
	GPSlNop2vbIu4QY+vYlZFJYT4g5hQ/2IH1gN4Aus0XPHCQs4TuzAHFDm1AC459XCU4Ev2KdROHWE2
	akiW9n/ePWjO5hN47o3bjI1tbjYuexbS9cBeiVOcfP/gSLpY/fz6U/bc8iNiPzBUstbsQqZ+fqotN
	fuElUyizW5H1ie0cOV/C4qSDl2luJ/0+l4C1C45u+BO2DHTv5NZRX/WHjvzotPkBqIBihIvFvyNOZ
	z8JWzgTG8NZsMO8SjSJx0gt7SdbzaRskSsXj3dUdVsDjkTQNt4MJQdP/+qGulrcGKWy1FSfxHH61S
	ZuWnkrcr8kIJx4EEbX7Dbw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42706 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0ua-00000003kms-0EME;
	Tue, 03 Nov 2026 04:23:56 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 027/102] hwmon: (f71805f) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:20 -0800
Message-ID: <20261102225235.334487-28-linux@roeck-us.net>
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
X-Exim-ID: 1xO0ua-00000003kms-0EME
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42706
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 63
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHsVKxuQXKoEPAvGvJqxD/CawhjX2kRxWeNJMAaC9Fs1xnsiu6YSVwirMAAZpq+oYM57WkXWhUbd576p+gm0/WRZ0R2NEYYKw3sJu/QTDblyiSy3ZoqI
 +NcnxAAYLFbqJWFg/hrHklGe+/BIxWmxfS9+bNsIPHUa0L1HHDLbn5hLTu1ng4bCk/aCA6nEmED2uaJPZeZTrJyz10thLluy4iWv3Yn5nvPe0qZ/sMj2HTq2

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached values from updating. In addition, the 60-second limit cache
check compared against data->last_updated instead of data->last_limits,
preventing limit registers from refreshing whenever measurement
registers were polled more frequently than once per minute.

Convert last_updated and last_limits to u64, check data->last_limits for
the 60-second limit cache expiration, and use get_jiffies_64() and
time_after64() to avoid wraparound issues on 32-bit systems.

Fixes: e53004e20a58 ("[PATCH] hwmon: New f71805f driver")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/f71805f.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/f71805f.c b/drivers/hwmon/f71805f.c
index 820f894d9ffd..fca779b157a0 100644
--- a/drivers/hwmon/f71805f.c
+++ b/drivers/hwmon/f71805f.c
@@ -166,8 +166,8 @@ struct f71805f_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
-	unsigned long last_limits;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
+	u64 last_limits;	/* In jiffies */
 
 	/* Register values */
 	u8 in[11];
@@ -337,7 +337,7 @@ static struct f71805f_data *f71805f_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* Limit registers cache is refreshed after 60 seconds */
-	if (time_after(jiffies, data->last_updated + 60 * HZ)
+	if (time_after64(get_jiffies_64(), data->last_limits + 60 * HZ)
 	 || !data->valid) {
 		for (nr = 0; nr < 11; nr++) {
 			if (!(data->has_in & (1 << nr)))
@@ -375,11 +375,11 @@ static struct f71805f_data *f71805f_update_device(struct device *dev)
 			}
 		}
 
-		data->last_limits = jiffies;
+		data->last_limits = get_jiffies_64();
 	}
 
 	/* Measurement registers cache is refreshed after 1 second */
-	if (time_after(jiffies, data->last_updated + HZ)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ)
 	 || !data->valid) {
 		for (nr = 0; nr < 11; nr++) {
 			if (!(data->has_in & (1 << nr)))
@@ -403,7 +403,7 @@ static struct f71805f_data *f71805f_update_device(struct device *dev)
 			+ (f71805f_read8(data, F71805F_REG_STATUS(1)) << 8)
 			+ (f71805f_read8(data, F71805F_REG_STATUS(2)) << 16);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

