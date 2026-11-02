Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676620;
	b=CeEm/bry+soO6T4PE1AHARa4Br3CKRaJjGa06XizJPuHytMUoVdbXTtaQw/lYPwsNCyv
	 uQreq2WAZZChqt/juwVP8+05jMgxAnjf76v9Dqzoc1RMAePh00N9SEw9NnY7IfcVydhLu
	 +brZ5kqTRN3FzKp+8kJiUcA43aj4D5i1gFA51JNVNAGEQY9pKwvimg0BsZDDwUdhNyhso
	 RW7eBeqYxW01iLlDRnUaDZ1Xyh59w3xJY+BfMUWXG9RX68W59+6TJT5DY/JDsUsDmwr/L
	 WsieRQfZTwH6jLJl42ogZv5lYxSw1e3LZocijXh1m4988uoMmMxFBytU1NHH+o6g9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676620;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=J6bdTQGwYicpSa9wKxHWoBCeNX6P+TmJOmRwcqPtry8=;
	b=1Kwz2SUby8xMIdTIHAPw475+reu2q9sZ0CYBZxMLJaBBDI3DLRcSX/fGN21Ba0Qeb/+H
	 8sVf56bLAScqd729AQpDSiLR+OyawKB7uJWhealrCqObwaZbdYdgcYhVRJkcn2SHqsIkv
	 WVaVXAvEl3Ttg6EF4i6LC4XuSTPpOpIr/N7XBq67tysI5ji8bawYPgX0Pwere4jqCmTUL
	 PErd6WW8QKNOxvZXxahIgJOGJPJ5FzsI68D5aOpOpPIQ4DZ+D1Ttr0ZVKv/5eKN6Aro4E
	 oAMhU7nY05mOwxLBQ7rYYEEjRRkH0wkWvuhbOxsC8cxbbWUgvTqnQMMtc9Pzl8EaPXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=49bvpzsW;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF314606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 03:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF314606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=49bvpzsW
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id O4skxI5mwaC0UO5E3xYJHR; Tue, 03 Nov 2026 03:30:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O5E2xOeGIVqSeO5E2xzZZX; Tue, 03 Nov 2026 03:30:19 +0000
X-Authority-Analysis: v=2.4 cv=eLETjGp1 c=1 sm=1 tr=0 ts=6ae9554b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=aQ4eF6z-QQHIBQCw7oMA:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=J6bdTQGwYicpSa9wKxHWoBCeNX6P+TmJOmRwcqPtry8=; b=49bvpzsWZkND
	qvIVMu2Ywv4JMnergdV1Jn1JytnRjbCv7Z+SovDFGyvGwYg2b/X47+rA34/2zJ2l6h2C8w/6xH9Nb
	m0EnEfT2q94G17J9SBeWp/T4aXvyN35U+V5JEDlFVUgN0DFs+zKqt4Ts8T0az4FFz+ILeoOzSEsKH
	rTYnD4F38v4r7Jpi/q0qgr7mGNsZB7Jth5Eq7NXna4DBGipA1b84G0+B7NGl6drPILOH8l5Tjoez8
	1ND96hOG6jzP6w/h8n7HDav0Q8guBhtNs8g8Vg7GTOLqFQjA14/F/J8WkabJkzmZlSHaE5y3jV9zu
	83K3u3tVFRBwpoDg+8unLQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38168 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wX-00000003lr1-3wrv;
	Tue, 03 Nov 2026 04:25:58 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 070/102] hwmon: (pc87427) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:03 -0800
Message-ID: <20261102225235.334487-71-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wX-00000003lr1-3wrv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38168
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMb4i2D0rlB7QHMsdqlAcUuExYDJhV8RVnBxyQajqTvxcviEF3UPR8KZD9SCi/LnchvFob+7e1cLc5+B/RwMmEsyhNAQpaW7bHFWSHxfkS7HTWq2jUV5
 6H98GCDw7Mm4iIBZCOs23kYf4seaZQRDUBUIOpRyidDApRHP0H9dCe/wQKW/cj7X370vkSQ3PZ7YZ5LHxTHmMBuGudcakFjdVPSiA3NElBSJ51uoo5HvUy/K

pc87427 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: ba224e2c4f0a ("hwmon: New PC87427 hardware monitoring driver")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pc87427.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pc87427.c b/drivers/hwmon/pc87427.c
index 571402a89368..28ceee620d36 100644
--- a/drivers/hwmon/pc87427.c
+++ b/drivers/hwmon/pc87427.c
@@ -49,7 +49,7 @@ struct pc87427_data {
 	int address[2];
 	const char *name;
 
-	unsigned long last_updated;	/* in jiffies */
+	u64 last_updated;		/* in jiffies */
 	u8 fan_enabled;			/* bit vector */
 	u16 fan[8];			/* register values */
 	u16 fan_min[8];			/* register values */
@@ -352,8 +352,8 @@ static struct pc87427_data *pc87427_update_device(struct device *dev)
 	int i;
 
 	mutex_lock(&data->lock);
-	if (!time_after(jiffies, data->last_updated + HZ)
-	 && data->last_updated)
+	if (!time_after64(get_jiffies_64(), data->last_updated + HZ) &&
+	    data->last_updated)
 		goto done;
 
 	/* Fans */
@@ -377,7 +377,7 @@ static struct pc87427_data *pc87427_update_device(struct device *dev)
 		pc87427_readall_temp(data, i);
 	}
 
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 
 done:
 	mutex_unlock(&data->lock);
-- 
2.45.2

