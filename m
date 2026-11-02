Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666152;
	b=FRtILK8/wa0orZoPgM9d1qxFJtmZg44dyWp7XpgLY8vEzBTquE961VFQCIliGc+UJPJf
	 vXnbuQvOxyKZCLiBr2at4bGd5lz4tY8wxRMQh8vx+hbLMDpCq1kXRqBb604BRPndjqZB6
	 Mcz4nu4YFu6Eid3Y52+IYIgS7qwM0J6pDvBHOuKdIg8vYSTfwKvwfzuuhwH2JDdVJLqf8
	 11chHNpFoysJlCgxzWsc6vjGiAumzAwmPpq/rdPk3NkHzsW8J9qJxDZfxj5wM72FheVxL
	 5w46lD9Ozfq2IdNTvKlZKyClTYYtpEgqWktK7FqJNDN5Lqz2dQ/ftaI2SO0xJoc7nPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666152;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=wjPNDFV7IGr2eZnlZv3vQskUBKQNDMZdZJP6YSlIqGg=;
	b=y0uPOs4v3zg8QCxhz+TwLIZbRchoGmpjWFI2CTRFXoW9zIiDPyhRL5pZ31ePzrFrJJfA
	 XqGsZKgf7gcaFNwAmYr3rFM3MmbRnNgt8LyupnVSo7+xBx9qJfOushJA+5f/SJzuFFaJq
	 uQZE4vJmqg2Q+T3R1dINkPdZhWUF0Tn2mLfvmTUg3DJKFoop3OSz0d3Vlti4r9AUZAk+5
	 IpXq1zoi97ZZXHfNykrRAwmFf7e/F/40T7yWVy5dfmE3rj+JkfrijXPDZlhb0H8QPs5AU
	 2AfNweDqAGdICh2qmTNv9DDnT2CDFdlb72z6OAwJM+dkb37xfOEOHNN0Tu8IV6ghxAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KbE0eQPZ;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42B606A32E
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF42B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KbE0eQPZ
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id O10VxOtO5v0ndO2VDxByj2; Tue, 03 Nov 2026 00:35:51 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2VCxS4umLr2uO2VCxGT11; Tue, 03 Nov 2026 00:35:51 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae92c67
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=MLi5uv6IfNYOFz_am_MA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=wjPNDFV7IGr2eZnlZv3vQskUBKQNDMZdZJP6YSlIqGg=; b=KbE0eQPZHxjJ
	sBCDvYHTN0wlmSVbPciFyZQ7kK0Fx6/qxENfNBbR7Jtji70hwt8f7+UvjNlRSv25WjqWdcmwbyKOH
	LpX/7kxXK3gQbagYx+80q33fH5QzjzpPvMLyhg9lVi4TzengSNN6YBEGVuKwPHXcBBpnZZp/sD/nD
	tvYd6ldaUSsP9uXG0gxH0fbP/H+o+OBO/TMsvWKgBEfCQAXFgdzg1OmJpeumZPtJIi2rPwWEIrqVN
	GVZOUFlMtSUNytXzEUw1b112q5daju3PgbhRAAYPFoeImqndEq4cjiJIFh5sor0SzwY9BSruRXOvR
	+XAebBVcfjT6L2sSGRfExg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46952 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vu-00000003lad-3xj7;
	Tue, 03 Nov 2026 04:25:19 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 058/102] hwmon: (max16065) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:51 -0800
Message-ID: <20261102225235.334487-59-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vu-00000003lad-3xj7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46952
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNwjAQ8hlKVN148xONNUJv2+hFaV8t+u/Y54Vm3Obr5LDqasCcxgPMBRDB4PGieZ7Q5NmQwXtz8xMchaKSX9CR3UUa4VNtOfANcOg3glCdMztP5t4HoW
 AyE9UcqdbR25H48IjT5PDXlMXxMa1sUm1+xmOB2iBK4BsVGn76aFLNNSQG2ZQ4ZHoiAik8OPdhfInxbCpI/3flcDt0E5aszT0EiW5xsq519LpMM/NVXGETKo

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached ADC and fault readings from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max16065.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index f8b421754220..1cad2b54ed6d 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -84,7 +84,7 @@ struct max16065_data {
 	const struct attribute_group *groups[4];
 	struct mutex update_lock;
 	bool valid;
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 	int num_adc;
 	bool have_current;
 	int curr_gain;
@@ -147,7 +147,8 @@ static struct max16065_data *max16065_update_device(struct device *dev)
 	struct i2c_client *client = data->client;
 
 	mutex_lock(&data->update_lock);
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		int i;
 
 		for (i = 0; i < data->num_adc; i++)
@@ -173,7 +174,7 @@ static struct max16065_data *max16065_update_device(struct device *dev)
 			WRITE_ONCE(data->fault[0],
 				   data->fault[0] | data->fault[1]);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 	mutex_unlock(&data->update_lock);
-- 
2.45.2

