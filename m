Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660242;
	b=BK+CW0h8XKBnFPyHCCOMTaJUABCmeIZmjIhUN+Ms9k4RF/QScFgJObXBl2T3GXmKFmp5
	 9TFJAu315G5tG3O97IqmBKPvrsbDrCueYOnTxPtQ8BLLTm1kYbXlLWncyupNhkMzn6/oa
	 z1AjYx0D55leCn3T97zwk8JB2sUf9WiFiGlg/v+f+oYEMyX36YHCspCvRArLBsgD1/3OF
	 5uN3o6Mq23A4hRNM7Oz16ek+gJaM6eCiOvW7DE4r3H+WmH1XtKxsDNhSxWkCJNQffx66H
	 i20Fzha4F0PLF0HlpJxdE/PLBuphyNN0oZfYh+nYuWia59fQBZ0oI5yD23+5VNadEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660242;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=GJYO/j9d9Ui4wPi8clMgzNrA14ZuBXLyn/e6aoSQ2qE=;
	b=2u8tqavEXKt6k6eAfHGX8lP404KKcZr7CIyhlJBTAt3UT6k+B6HcG6Dk3SDrvTnzGuly
	 hsg2tq1jVWIdp4VEE7hvegUsZPffQKEhq39Y1irINJWfQqOjA0YiaZ0Lt+hEns/kYs/1t
	 t55/XT/Nu0kLM06w0Gus/KLyJZBnbGl9+4GF/WVYKjMvk2rTzgYxUp7kEqkSskaedf+qm
	 Lxqng0ae3GweuN6v2Yuln6S3JRi3nk99SdCOdsbcJII90JrCP5LAgAFnp51cEARCcYY2Z
	 +uxvNXQsLw2QUZ3duHswjnOwfsZvYK1CvbPDI3+ezHTqc7Qf49MS25kaVoIwbexTPug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="oP/jMArv";
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AE6606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43AE6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oP/jMArv
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NxIux2jCtJFmFO0xtxAXAX; Mon, 02 Nov 2026 22:57:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xsxPRnuLr2uO0xsxEC6Q; Mon, 02 Nov 2026 22:57:21 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae91551
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=FeMBgV1fbRl20CW5rp8A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=GJYO/j9d9Ui4wPi8clMgzNrA14ZuBXLyn/e6aoSQ2qE=; b=oP/jMArvUEHx
	oioR5UyjI166SB6jKodfd50JRWkhGhpgygljVpCIU2ifkoHthMHcixnhaHm4fDMCORK3aEz2B6Ddl
	E+lj2bMdrBbPAHCqje//tBNV86udq4asydjAMyMXbKfyTZ8Q6P+ak7dssZLYMjBaLOosv3pD0/GCD
	O8DWuh7dLgUmq97BncBuTgt4cPpn25RoC/oG468rbq1hsx894ux44ekC2f4Ye+cocveoZ/CElKSkh
	PqBAAHfSrmnKumqBuw5ERuBdTAgIOaalwb0xGG36Wu8jpRmkwboIPm9Xzo0v0oRQe5ntESe2juJCz
	p9habtrlgnB3PZYr1S3n/Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55010 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xs-00000003nWt-1RsI;
	Tue, 03 Nov 2026 04:27:20 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 100/102] hwmon: (w83l785ts) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:33 -0800
Message-ID: <20261102225235.334487-101-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xs-00000003nWt-1RsI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55010
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 155
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKjh3k827w0U2e6njco9/F7ueSG32K4L4ljt+dGEk4JuSi3DWUW5kypgJpqdSZwBzrDd4J4WwqJpGg3vFrbK0oDmoY/xEigrozn/wa2G4d4gzW9cbry9
 qhMMAe697+2BsSZ1CUZ89fVRL/pySxT53QvwhZ0u2EKHwFEDkd/pkvi8iGUn+pXoyRG+eTOGE27/lGvppgnoTan0xzB7Pc7K9cj71ybsI58AhXhFargvT7ZC

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83l785ts.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/w83l785ts.c b/drivers/hwmon/w83l785ts.c
index e42506a3bcbe..9e7e8ab11f21 100644
--- a/drivers/hwmon/w83l785ts.c
+++ b/drivers/hwmon/w83l785ts.c
@@ -99,7 +99,7 @@ struct w83l785ts_data {
 	struct device *hwmon_dev;
 	struct mutex update_lock;
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* registers values */
 	s8 temp[2]; /* 0: input, 1: critical limit */
@@ -260,14 +260,15 @@ static struct w83l785ts_data *w83l785ts_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (!data->valid || time_after(jiffies, data->last_updated + HZ * 2)) {
+	if (!data->valid ||
+	    time_after64(get_jiffies_64(), data->last_updated + HZ * 2)) {
 		dev_dbg(&client->dev, "Updating w83l785ts data.\n");
 		data->temp[0] = w83l785ts_read_value(client,
 				W83L785TS_REG_TEMP, data->temp[0]);
 		data->temp[1] = w83l785ts_read_value(client,
 				W83L785TS_REG_TEMP_OVER, data->temp[1]);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

