Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668809;
	b=f9ZfXDVm65pnbtyzVy60XZq+cKMVY7jJpzWT2ea0fvFna0yiwsWo88o5kOBRrBkuTKQe
	 Z6W3/HNDKubqOLk5yKBn07GGl+treKdfb4Lveb4mqvH06n+2s0qM70yCEEMEPBfDGpwWR
	 dU+Fk/txIayBv8UZlXWqz2zWErLjJJ5ZAie+YQ6LQZJPi9UFlJKcnkXiu2uXLl8gb2qsL
	 d4/DV5pTCQQxDd2tE6QRmNxtw1qsaNMtqEGFgRdXMdYWt2/h1ncH0cfXgU1ESPKpXveGZ
	 eSfHw2ylSSA3AJUjCDNLUqVO+lO1SSxV+pM53LmB5lZOrYPw/a1DSInKpbr8+vZRL/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668809;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=is1+X5Se0eiONJaKvnFgEGXEnpDKT/rMb5IXzkiJ35c=;
	b=JIhzp+5JIlpMlHx7CCzojs1Z8gZ1cXPykK48wrGkXP306lU0zh1jtOlwpjeS+kMnupCU
	 CECoZZrLoGjvR/RGEygAfkhmTGpY69nZym4M90ezqwW5daE6MgRv0EsTQozSAIvDi+KxA
	 WxGgInyA6WTWlmFgiA8ZD6UX0HyyYtmyt/5ABtFhzNrrpoeEs+wKuvagDCLpsFkOcDWph
	 Vv1/xhycQnO5w06v9uMrZAY7GyklJbw9p9NqSpDKfvJyHwB6sqCadKQfTZ8uYEA9w/5a/
	 raT8FhfrCr8tU/rIEWQGDBB2QTQzDP4QvrF3HG/+RPcpUMRKB58SrVRkhU0l0POfjlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vLI15IXZ;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E910606A329
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E910606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vLI15IXZ
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id NyCIxgpXvc3XsO3C4xYVSy; Tue, 03 Nov 2026 01:20:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3C4xx74hNSXiO3C4xFBma; Tue, 03 Nov 2026 01:20:08 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae936c8
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=edvktuduleVQ9f6P3rIA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=is1+X5Se0eiONJaKvnFgEGXEnpDKT/rMb5IXzkiJ35c=; b=vLI15IXZfxrc
	CQmEqT+lkSlcUfsb+CLhm0V1SkB0whC7akBGGm7vqv4l7Gu7CorHgg6cbAcN+zOs3LV5GPxblxf0k
	K4Pesa0tJSLjXZxIkgD6jxpvolzdK4N1zqBBV8olPhvzzdwB6LZYLxLEaxK/kjsXY2uraeFNU+Roh
	A+qsqwm4ztGq5Sx2h7k4KcEZA8xlfpSWANQsnTG4ZFXZXTZStz6gAxeV1G8Hxz6/jIIlPA9+znzZs
	1czGJyxvoWgVGMcqFlEvUiMo6jTzBgu4j6utNZOZUBTX74krTOYmHXT+XqZcFEXqHcvIcdSCLtlQG
	+siZyk0lajwBR3Mhvs4IsQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37850 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wN-00000003lni-11YZ;
	Tue, 03 Nov 2026 04:25:47 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 069/102] hwmon: (pc87360) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:02 -0800
Message-ID: <20261102225235.334487-70-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wN-00000003lni-11YZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37850
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMTFOp5kksQawoQVYMIBq092aCeHsuT9Pi15vydyJkKYbWI68cV8+oCERTUpCpPmcvGco0l70Jh00CutaKEaoNywoVfHIICZS9TI7sfag6GHLpuMhHZB
 8LIeyrYa7ujGZeMhN679yfjn5ZGMMj5ZuXouyfVEMm5CsSTA8hgnKnjhYJGX1/O09jsndAJ7YtpIAY/tQ0MDhcDNFaLEAgOFm6kngn4lvt6iNvRYPYDgYd+w

pc87360 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Jim Cromie <jim.cromie@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pc87360.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index 0f8aa6b42164..d2702d409d0d 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -191,7 +191,7 @@ struct pc87360_data {
 	struct mutex lock;
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	int address[3];
 
@@ -296,7 +296,8 @@ static struct pc87360_data *pc87360_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ * 2) ||
+	    !data->valid) {
 		dev_dbg(dev, "Data update\n");
 
 		/* Fans */
@@ -394,7 +395,7 @@ static struct pc87360_data *pc87360_update_device(struct device *dev)
 					    & 0x3F;
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

