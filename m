Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660224;
	b=bSnA5u4r7cPN5TmvJNF0rf4rA06TX+zAhcQq3YFyEo2lkJe+xfZQDThv6lDYTopxnoWn
	 SRXdEP1iCUAZFnNn+YvWzuOSs9gHSQBc27oMCzcrV4AQ8LmP9ORpWrpDCzN2r3ldEEN2z
	 rpAh3c7+d4NmtbcJlRGlcjiaIWQakXqo5DLT5rsUmhE8lD1BwikcRcUK4s2TgirT4pdi8
	 r6tQtdxGMOfdotZYZpL5YsZtyIa3eRXkZu9sHm25DH4yCjDkQx3t1sOM1fuHkR8KD6Wj/
	 fI+m4+gdX9WnFX6vjqMArHbCXg47jat+1hqpYdIpjilePF9RGx8RP/Hk1BKXxTGyOFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660224;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=jDzK6eYNVnszsKa9GV9LYBijgeE6l0B0QWQ+XTMJv6A=;
	b=b+qvPhtQGFcGk9mEXrr9hs4FgpaOpiV3UstYOZalyFskTQjddDvzF+psgBP7v3WfZMMa
	 Y+HdtaSdt/cOyNKi70z6kjuyPj6nkqDEV5NBnYSgBVL7wSdq4e+SHii5Lycfsq4+gpWFm
	 vCU0ggLVPgtSA6fewRhejVdoxMPb03rQWCCBfnwa8sxUnwLdQzes9lbrtXY5vvi1ITaup
	 Pocd3eek5vlSvRVVoxAauc5FHH2lihEjLc0s83HDIAyVecYan2xgeRz/uLuCEPmu5ccUk
	 UKfAYvj9g7c5dXCfV4NXRgr9/VFKLWZkFGR6x3Xhx00ulCvcMUCNRoX64T6EkP1JuhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=A0e53XuO;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3120606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3120606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=A0e53XuO
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id Nw9kx2REKJFmFO0xaxAX57; Mon, 02 Nov 2026 22:57:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xaxEpWDQfwNO0xaxXZTM; Mon, 02 Nov 2026 22:57:02 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae9153e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=EprCN7UrAAAA:8 a=_jlGtV7tAAAA:8
 a=wtRbYlYNgOHHpvFcmWEA:9 a=HCbi7XInCiJmNhJA85EG:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=jDzK6eYNVnszsKa9GV9LYBijgeE6l0B0QWQ+XTMJv6A=; b=A0e53XuOdoRd
	CGWAaAP3fmNFci59fbN3kn7m1tsg0BPjMKo1Ly0lFniFPMJcQMCfoZipsu3X3UZzWw7m4G2RIab9W
	5s8M5DS1oHSm7Ft/R2V1krPNav7iTrdYF4L762/0+LnGm5r9OAl464MOKmlC7qmo32VCZ6xrVDf8f
	wvbISHfhyfpIUGSJnfJJwKW2qvA2U0d5UXO49CMvoyLf9MLZMJ+BN29+oIY880T0InhKeyEmIAzXm
	qKZ1FvWY+J/pNe5IhsXnYYaQ+E9xr5m9tvD2sQAKfMyqRYjuuDXxTI4Q/YAbgyjfmJEOz0y/38Pu0
	NV7yEmL0kW1WeyXRxCjk2A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48680 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xR-00000003nFX-3h9b;
	Tue, 03 Nov 2026 04:26:53 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Roger Lucas <vt8231@hiddenengine.co.uk>
Subject: [PATCH 092/102] hwmon: (vt8231) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:25 -0800
Message-ID: <20261102225235.334487-93-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xR-00000003nFX-3h9b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48680
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 144
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHHD+HyYttqb2LXDYCL5R9kPcWGwqTw8dPv98sRJzkXeJ6zgapO6OEmEZ6XzPwDa0nTNqKjGL45nyhf+0Qbe45V2KhhKVeopqCEXRZiojkt/o9gzgu5+
 zFnWsxf8oXMwmgnYuU2hlgzGBHnV5mQMsHiQO6xrlGkZTGx1uiahAokWUcD/M4EJkjt/P/mcLe9wRCv9+R8xlp11er0Yy3ASsBIiJAT9xg9zAvwiTndwI3pK

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 1de9e371b89e ("[PATCH] hwmon: New vt8231 driver")
Cc: Roger Lucas <vt8231@hiddenengine.co.uk>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/vt8231.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 5757a0979f3f..6e036f123fca 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -152,7 +152,7 @@ struct vt8231_data {
 	struct mutex update_lock;
 	struct device *hwmon_dev;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[6];		/* Register value */
 	u8 in_max[6];		/* Register value */
@@ -188,8 +188,8 @@ static struct vt8231_data *vt8231_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		for (i = 0; i < 6; i++) {
 			if (ISVOLT(i, data->uch_config)) {
 				data->in[i] = vt8231_read_value(data,
@@ -239,7 +239,7 @@ static struct vt8231_data *vt8231_update_device(struct device *dev)
 		else if (data->fan[1] && !data->fan_min[1])
 			data->alarms &= ~0x80;
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

