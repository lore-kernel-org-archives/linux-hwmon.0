Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660009;
	b=YBC+FQmsLzaBUabdVvjAuCDxTFYaWnKkr0Ef/nAqDl0JeoPR6OtgX6NtKgItTtMwagoq
	 F5WfmuyK1mshxxhz0l5ds5xE6F3pqIMADDPMl0fkFrBWRnQaW1ZC+rFcK8D5P8LAfku/z
	 oNte1L2Sb/k5wgmZfaAh9sveBIEKwTgKYKSGbo9JgX44NWmtGjmSUpCPbYf132G5DHXYO
	 M2XBIa/vKTq49GJR3DvgF7b1guALhK9p807gogyXVubgs8gFh0ou9fmTGqTgpILCRaiNO
	 g7OnFjfQ368fK6Jp1FSoP0kew7PWQ+mjb5sOzy/J4M/TBFShjp30Ev6JC8lkq4s0LlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660009;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=b/Vbnkc6qYwAGfywvpfMZ/0ghMpLAMA8q6ThwzZYDqM=;
	b=zXrroYWkso1LkZKxHIeW0jIceA/GE3D4cXYlVUHeJZHj2FN3iSHcjgJoCmOmzdxXyBR2
	 MME/94sX3bC8HUv0BlW5g16PpF1Gw9jsv8jvsQ3FVuLeosgLqUUxMcLgjdp2Z0KmaPinm
	 ehSd3B/i1ETPjlYlYn0k6tijHomX4xdqrfkF//+dBLjZcEGvMs7B8m92iIKc8d2UPlytG
	 UtQBr5BQqqNAwbc/W8taGj/QYRHjuiwZiqyV7Zcnt6EP4fcS5C1+8c49BOEt7UkFLOV35
	 LDfH/b/yLshUN3j54u5sDbwNjGvv8dvMq6pA73v2ABzQEDc4bZNWvgbAL9OmVZ4vr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gIvokq++;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921D606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3921D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gIvokq++
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id NzAQxESXZusRSO0u9xswHT; Mon, 02 Nov 2026 22:53:29 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0u8xbRSJe0duO0u8xzQMF; Mon, 02 Nov 2026 22:53:28 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae91468
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Jy0dmyxnAAAA:8 a=_jlGtV7tAAAA:8
 a=UeJiQpD7duNuCTLLrO0A:9 a=QdD7hOnY_o00qASb27ph:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=b/Vbnkc6qYwAGfywvpfMZ/0ghMpLAMA8q6ThwzZYDqM=; b=gIvokq++czPj
	UnzzvTCf33DffPBaTFohlbAbZN9O77ZpbMWazimEsLat5gUMKtBZEJjbSewe3f5IqRcwmogNojudp
	oIDiwx+Iu8V711ofYYiCKS+kWoGPZGpF1rbenon52AYdQ/TcQtr/pxZ3lf4QHxiH6MUYX0uINkuBy
	Xm7zQnqfAmR7Uoj4S0iF6VcauYYYHyaAR1ErWM0y23bDgWqZVS7haM0tZBgsD1O4DycfKrGDjN80u
	AwxueSvYLkF2Y53UOq4zLnTtW03OcGeJWB4zbQpGWEuNlXMiXpBV9ttTe8uayiBpgYwTYFGYXNp8B
	QINKD1quNcCohqzOoHxMiA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33464 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0u8-00000003kMl-13pF;
	Tue, 03 Nov 2026 04:23:28 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	George Joseph <george.joseph@fairview5.com>
Subject: [PATCH 017/102] hwmon: (asc7621) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:10 -0800
Message-ID: <20261102225235.334487-18-linux@roeck-us.net>
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
X-Exim-ID: 1xO0u8-00000003kMl-13pF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33464
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 46
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN1zoPTcuXcC8GeDPG5kPPD+urs5JElc3LJ8VNb/noKHIufTrgjThE+hYkln09/+PqGjTxDS1Rq/SwSyeEr18g7fBOeKDDyXYT4DFutynBjA2h90nqxQ
 FnRHt0RBXPDIStg32upyFywSlr8whELpLmgyQe7K5kDLVQjnU/WTDBLqpTnv/drbi4dzKB4Y7XcqRF6lAWnU5FVyASDxV6QDPJyl6NqOaqraBKcVundHE7Hq

asc7621_update_device() uses 32-bit jiffies and time_after() for both
high-priority and low-priority register caches. On 32-bit architectures,
leaving the chip unpolled for about 24.8 days at HZ=1000 causes
time_after() to wrap around and return stale cached registers.

Convert last_high_reading and last_low_reading to u64 and use
get_jiffies_64() and time_after64() under update_lock to avoid 32-bit
jiffies wraparound.

Fixes: d58de0387282 ("hwmon: Driver for Andigilog aSC7621 family monitoring chips")
Cc: George Joseph <george.joseph@fairview5.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asc7621.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
index e8145bb13ab3..ad32918f4c6c 100644
--- a/drivers/hwmon/asc7621.c
+++ b/drivers/hwmon/asc7621.c
@@ -78,8 +78,8 @@ struct asc7621_data {
 	struct device *class_dev;
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_high_reading;	/* In jiffies */
-	unsigned long last_low_reading;		/* In jiffies */
+	u64 last_high_reading;	/* In jiffies */
+	u64 last_low_reading;	/* In jiffies */
 	/*
 	 * Registers we care about occupy the corresponding index
 	 * in the array.  Registers we don't care about are left
@@ -1007,7 +1007,8 @@ static struct asc7621_data *asc7621_update_device(struct device *dev)
 	/* Read all the high priority registers */
 
 	if (!data->valid ||
-	    time_after(jiffies, data->last_high_reading + INTERVAL_HIGH)) {
+	    time_after64(get_jiffies_64(),
+			 data->last_high_reading + INTERVAL_HIGH)) {
 
 		for (i = 0; i < ARRAY_SIZE(asc7621_register_priorities); i++) {
 			if (asc7621_register_priorities[i] == PRI_HIGH) {
@@ -1015,13 +1016,14 @@ static struct asc7621_data *asc7621_update_device(struct device *dev)
 				    i2c_smbus_read_byte_data(client, i) & 0xff;
 			}
 		}
-		data->last_high_reading = jiffies;
+		data->last_high_reading = get_jiffies_64();
 	}			/* last_reading */
 
 	/* Read all the low priority registers. */
 
 	if (!data->valid ||
-	    time_after(jiffies, data->last_low_reading + INTERVAL_LOW)) {
+	    time_after64(get_jiffies_64(),
+			 data->last_low_reading + INTERVAL_LOW)) {
 
 		for (i = 0; i < ARRAY_SIZE(asc7621_params); i++) {
 			if (asc7621_register_priorities[i] == PRI_LOW) {
@@ -1029,7 +1031,7 @@ static struct asc7621_data *asc7621_update_device(struct device *dev)
 				    i2c_smbus_read_byte_data(client, i) & 0xff;
 			}
 		}
-		data->last_low_reading = jiffies;
+		data->last_low_reading = get_jiffies_64();
 	}			/* last_reading */
 
 	data->valid = true;
-- 
2.45.2

