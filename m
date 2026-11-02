Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660051;
	b=RLnuYCldKfcbQgv8LGOA8rXZO8kJrFLAuLKja5GvHyNXr0iZ7mbKtsf8AFaL4IzvZ9MR
	 f0M4pKzvSjI0tIPnq1W6abQLyWXh/9SIhmEoNpefkqYDLBzcxcCBfg3lJtan8wtkp58zV
	 VzQVsHE1Rp0awnIyIf071iWBHyJcOruaUbb66rYU7+fKVSM1iol/tNINXx4L33z8tQDei
	 9yBgI8Fm5Z6akRZiYYa4lKQMqKdF3Tymv9wNwb9nHvNibhU+6Bx6hXnIxpftUCL1wvNoG
	 o8LNwAV0Bjlmhg7piV9jrdxeKIWGqfB2p7nX7CIbzCRSTut19hi/TeHr+uUdbYIP1+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660051;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=4o0naQrb4zxPcxp6o/l4rELf2ry5H4v/frRv5hXXhqk=;
	b=W3Um21MUqyBomXG4VPKd0l3/l3a10qg8HFjBbi/1xs3Yzi4h2EZgrkIFEPQibJ84KQ/1
	 a1ZqHfE7l1K9+4+gWVcNhJdHPrZtzvjKRgqoPzSVYcBq5GfTtjlhfNvorPJsEzdQuOKKW
	 B+jTzlARBtdrwk3hZC2mnSG8hYbQQUr4oDZRVys6AHOF/m/zAyl/J25vpmsdIxRkktMbw
	 6iM2zR31kFmX7ayiwrwA3QuRD1dwu/Ikz1vlOaRFkv08I/H9fSPkXbYALBoWRF6fFGNkM
	 2B74hxJAw2Xjz0xDOw2FaUHRwXAvQ2eTzBiXgcuWHG+pCUZkC14S4L56PUw68Cq+tjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=T872wuV6;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D851D606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D851D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=T872wuV6
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id NxH9xgcTQc3XsO0uoxXluM; Mon, 02 Nov 2026 22:54:10 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uoxbSVKe0duO0uoxzREQ; Mon, 02 Nov 2026 22:54:10 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae91492
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Q1bZTFlCUlp_ALP3PH8A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=4o0naQrb4zxPcxp6o/l4rELf2ry5H4v/frRv5hXXhqk=; b=T872wuV69CDe
	Nx+LJDHxPMaKG3hsSxwN7PRtCzn712YBzvOz/1o1JN8MCbYwMBNlvpIPWlr9tuIvvhAi6kMrdCG7M
	jnEq+J/aratrKQujV/moIS0mxIqq+3RakqTDI6b3jgNl2hAftKLQD5uBwQhgG+mikqKcTnlTbgIPa
	jeCJvaUyCSy2hHezqeFL04Hi5JeJINuBlQ3eMP8Q5RttrY280RjKAL2c4yDFfO3LiTPUI8mMiNqmo
	nAo/bf4C/EasOAQ9gOOWJfus+0Y6JU+QFWRtMv/rp1cLRzJShQMPkXKubqxbKxNakY8qNsuiUQCQv
	v5dIhRG2BTtYGx8f34xb7Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50194 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0un-00000003l2t-3Z5d;
	Tue, 03 Nov 2026 04:24:09 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 032/102] hwmon: (g760a) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:25 -0800
Message-ID: <20261102225235.334487-33-linux@roeck-us.net>
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
X-Exim-ID: 1xO0un-00000003l2t-3Z5d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50194
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 69
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKujoR752yd4O+0pdVGHb+8li+Hve/QaN99xB80HmQh8de+96eBka2+S/sirzs3+bZy3E+1ypsk3rm/ZDO1A4HpiIi0XmFz+ZnJQ0R0weqRPPZ/DsUwY
 EGX5utXCOGkTRkiVULPULmRH3t4qRQ81XKOYDo+msTH9GYM1LxO39wGbunm/bhi2VfcZYOiFvwRNXGx8I5U41tM2qmYkcL0xIx2QE5rvFjm2XqysoEu9co/S

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the device is not polled for longer
than half the wrap period, time_after() can return false and prevent
cached fan values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 3bcfa9e47a7d ("hwmon: add support for GMT G760A fan speed PWM controller")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g760a.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/g760a.c b/drivers/hwmon/g760a.c
index e2166ee76286..3253e55f1d59 100644
--- a/drivers/hwmon/g760a.c
+++ b/drivers/hwmon/g760a.c
@@ -42,7 +42,7 @@ struct g760a_data {
 
 	/* g760a register cache */
 	unsigned int valid:1;
-	unsigned long last_updated; /* In jiffies */
+	u64 last_updated; /* In jiffies */
 
 	u8 set_cnt; /* PWM (period) count number; 0xff stops fan */
 	u8 act_cnt; /*   formula: cnt = (CLK * 30)/(rpm * P) */
@@ -86,7 +86,8 @@ static struct g760a_data *g760a_update_client(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + G760A_UPDATE_INTERVAL)
+	if (time_after64(get_jiffies_64(),
+			 data->last_updated + G760A_UPDATE_INTERVAL)
 	    || !data->valid) {
 		dev_dbg(&client->dev, "Starting g760a update\n");
 
@@ -94,7 +95,7 @@ static struct g760a_data *g760a_update_client(struct device *dev)
 		data->act_cnt = g760a_read_value(client, G760A_REG_ACT_CNT);
 		data->fan_sta = g760a_read_value(client, G760A_REG_FAN_STA);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

