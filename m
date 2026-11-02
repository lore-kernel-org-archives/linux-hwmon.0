Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660223;
	b=XQl8ja49jKqmdTqWyOlI3xllX0azqcHm+anCZOf9i19snhNiGNtVoTOSVJD6EOy3/EzV
	 ZSVqKQfp/Oe0ZxlH1Mb+7Y0ll3b75D+tuFApP21UpfI5EZcBXAPFdGxrCZNVzfhyNDlLw
	 r5oENFfsZ40C/GUx77CM+/D224kC3DzhrinGRhD3b15TCvmB72XcB5lvPWFERm+LuOskW
	 obtb3A9RxIqztnGwwnp2iMg1wPfbop8UWfGv0IJP7ztiQjGRw+elhzJ1iiwddRbH493oz
	 qd6HoDY1VcGB57Ov3Q3M7RDS/KOEhnqU0pcUY0zt6ECMqA9tPYBhMqtooIwG+im7kbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660223;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=rvxtCoXRQPzdd+86iKmwnFOwhr+J/k4aiB9zfpY246Q=;
	b=TUuip2WwxAkzCJAAqOZ5AOFJK7QZ6BSuFLOmm1xRhzBkMEzx9RdyaiTpxCOe/bolCZz1
	 +BBjttGMqOpJlV4FpgThiSm94+s6x3yn8GYctkSWMHyHUp5iYyBH++l7VxI6ZSMbI1QbD
	 kxzZlXAs0JSCSbDXncXF+/8SErhwZ9XHxh9Kzesv89WHnoojVjygyRpOGqQ1r51+32Hj6
	 dYltID2vYWFHMYcpn7JatDM0v5/XXwnSLjPBBAI7OI0uMK3ppMYaqo3hGGJrzofMJFkVn
	 Dj2dhLYPj410L/LRtoCo8VsmUL2IuccYenSQOzxsu18tbFCoiaMzBWCsdBYRslQu9yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=X611twVL;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83205606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83205606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=X611twVL
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NxGIxYOcULvgbO0xZxlZnk; Mon, 02 Nov 2026 22:57:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xZxnI6yvtkxO0xZxLYw1; Mon, 02 Nov 2026 22:57:01 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae9153d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=edvktuduleVQ9f6P3rIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=rvxtCoXRQPzdd+86iKmwnFOwhr+J/k4aiB9zfpY246Q=; b=X611twVL3kzT
	xHed/nUB2Vq8chPTLivJu74lQXJqHniPjdqoyODn9W0WeQaV+TaJKslGugmX3+fDb3KaNG9DJR3fO
	Dnx1n4jFeZsVtz4JLGHjJBTCxJw/cgMcBPA6cXYvnicFf/gH0D4zUOT0t/2V4u/Wq1hAqxJrEjZV1
	SvnAt/34ZF45mMK8vC9+wpVVt3J/06LaJOp5SfR2JJDpTaLElF+OoSQjfXczD/yDAR9L9CiH5f9Al
	d78Y8FNcS/5PkNV8UBMYl0aGWvGSDukOtGvfZYsnEQNXxPuygKqADK/vsNphAkp9ot/7oZcCEmOZl
	R73pKSr5IeotGu3ZPq2d8w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54092 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xQ-00000003nDs-10At;
	Tue, 03 Nov 2026 04:26:52 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 090/102] hwmon: (via686a) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:23 -0800
Message-ID: <20261102225235.334487-91-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xQ-00000003nDs-10At
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54092
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 140
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfA8B/sa8c25XV2B0p4ykHSdTjrGNl9WqPz2rl9wgz/F96EMkkweuX45a78VV5ytjYyVAmuaZgDXWzYADu7ad9HwYiQFMjGs2Vrn/fep9bSgjVPdgYq+u
 xtmgoDe8RFadcAZDpxcO+TUAjhp45ZJo8AMN1Zi1cjvAfLN3gKkdggUBIFenkBCbgSqB7uLvYBh694HQnDImOnBeZyvPOo7zjh/iIvEj5wFhXMQPVnQqDzxy

via686a uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/via686a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index bbaeb808cc15..56e822201349 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -307,7 +307,7 @@ struct via686a_data {
 	struct device *hwmon_dev;
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[5];		/* Register value */
 	u8 in_max[5];		/* Register value */
@@ -348,7 +348,7 @@ static struct via686a_data *via686a_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 		for (i = 0; i <= 4; i++) {
 			data->in[i] =
@@ -396,7 +396,7 @@ static struct via686a_data *via686a_update_device(struct device *dev)
 		    via686a_read_value(data,
 				       VIA686A_REG_ALARM1) |
 		    (via686a_read_value(data, VIA686A_REG_ALARM2) << 8);
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

