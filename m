Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660223;
	b=3own9jmceXylzEcKX9VacZy9BN8nH9Z5pWZcnab778t+hYnnWYKawlGbQYBVPOhSCN3W
	 PB0voofT/93AMCPkn1SlquWVrSrN2n4ZKtQj2He7eQCY1u/J+geifJTshkD5hAaNr+Ebe
	 5xIC/PQA1/CSh4/CVLxqdlXGfgMw2BfsbTsl9Bh1ZO53EUowL9uUh2sG0TD0TRR6ZIjOl
	 upRCu/DuTypyBf0udYvIlrPQnTtEZSVvItEmJ2DpRCR0gpj9v7DNreC5CWm0ytyfXc8cc
	 piETXjLuZGMyL/gTXj0K/n0JrGEIWecDTZiNo2p07vQDnLAm6mXYw2OjdFG+XfPTwCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660223;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=mxhlXrXWE0YnTYGiw2a3Bq+w5zbp0GgIuvmF+YzZCAU=;
	b=KD26gW6+dyQGPVxkrJiSm70ybRfdHhfqzsIvu3hZyI0g9yZUAmmnk6RLqhm80mrv6dwp
	 iWc0UKTdAB6YNxcFKlWN1/9CeGyrLd0oI0put+6Wq9yTkZtMHf0cgJaIGVPtLhN1vqhq2
	 e03XOJJuiEAXXa11cnJffmVYlczuvRJnTlOx8VqFzsxKu79q7NqbCCChM2dIBzsYzn2Lv
	 SQWqOw22/8K+rS3tL1BRejtapQ6GJ7tprzXhtf4yBSIffR+ow8FQSvUsSLBwaA95Wa+Uw
	 2AYDClJg/X7mT5b5+3rcbpktcPUCYTf926YF34zh2d7S6utZ1IT0E3NBQSoClYzHIuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3PVrECeT;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA53606A32C
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA53606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3PVrECeT
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id Nvu4xY5m5LvgbO0xaxlZnv; Mon, 02 Nov 2026 22:57:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xZxJdAc63hBO0xZxefmv; Mon, 02 Nov 2026 22:57:01 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae9153d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=N4X_Y2vUnc59bwN8jIwA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=mxhlXrXWE0YnTYGiw2a3Bq+w5zbp0GgIuvmF+YzZCAU=; b=3PVrECeTV3du
	1X7LNvfmzXDgq8m6atnYaSea8+pAu1Lf9mUVnKS6O3UbGMdDIshTLyRHFKk78byhlJBww7EobiQAZ
	+FjmTw1pFUk11n0bs5bCpFGCNSNqHPcXMe1OW/noadflAaBJ2NBtldFV5RJ1gxLGW49xBAm8PHxT5
	dWMfoSJmV6jhVuGl4Jl583SJjYNO4k1NCFqFCtDw1XgadXuc3ZtvJ1UyLKJnBodKVVxM58oW38ti1
	S07aUi23TepQc18Ta8vJ095/PllcgnImhMOWYnY2IihjesGdeHBSU+/IUd7hKWh7VejSXX8G+ugNN
	RIomKBTcXzYkyxNMEAMW8g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48674 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xR-00000003nEb-0St4;
	Tue, 03 Nov 2026 04:26:53 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Juerg Haefliger <juergh@proton.me>
Subject: [PATCH 091/102] hwmon: (vt1211) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:24 -0800
Message-ID: <20261102225235.334487-92-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xR-00000003nEb-0St4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48674
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 142
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEPU92xy/5E6oBENgN1QDWXKzaFL2OWmgsMhamHUEugxp+AnsHlULu/R9ah5wAMQ+ldvT2yzvivkeMKJ8W/JhberurYZ80jxjLiIvizzhF9buU7qlnJ9
 QfBHLB4nGmZOHrWnWNwWFO5xQ9XCgz8ePDFQ1vKeX1LjKTaCi00ovkTM6YAUCtelmNumtBvs5Ybe3hsWJDMwpsXXm3cSl2dVVdpnVX141NhPiN1LjWzXEYp+

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: ab41319eab3b ("hwmon: New driver for the VIA VT1211")
Cc: Juerg Haefliger <juergh@proton.me>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/vt1211.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index 1e52cabd6e24..675468a77438 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -106,7 +106,7 @@ struct vt1211_data {
 
 	struct mutex update_lock;
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 
 	/* Register values */
 	u8  in[6];
@@ -263,7 +263,8 @@ static struct vt1211_data *vt1211_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* registers cache is refreshed after 1 second */
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		/* read VID */
 		data->vid = vt1211_read8(data, VT1211_REG_VID) & 0x1f;
 
@@ -329,7 +330,7 @@ static struct vt1211_data *vt1211_update_device(struct device *dev)
 		data->alarms = (vt1211_read8(data, VT1211_REG_ALARM2) << 8) |
 				vt1211_read8(data, VT1211_REG_ALARM1);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

