Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659983;
	b=4urVtvG/ar/XVXnjwQ7Jyposqzs55zSNYYq62MVWN/tVIn9ap92Qg4Fjpm2JZZQbjXqZ
	 BRa7lu/DGHIoDmI+Qub7AnE7XKdr+Zkk8pcDxUBk4blqVMWF6GnvuIdvd1cIc5cQ5xN/t
	 EtWGBd5lH291nw728L1mxxVJXIUy4219jqnnqB5nsn5fAVa7njRGfPedfH06asr3pSkyS
	 VakFtf/9hUo+6JcOUShgT5VMsz9E1BSTxBx0pdH6PBLu1tYctzb19jHfLzBJFnnVvLw+Q
	 SEztTz+z40/83x16IlqdhLaxlO5Kv9GLczNjEYJmv6mm/s6MKplfmY5R1uPUmWuooCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659983;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=bSQEp9/02nkanXqwanhfiQ7850wtB6B+skSAvzLM05s=;
	b=D+ohw4kRHpUDsc8En8549oh6zceFvBDJmITJKCrFCNmxCJAPtl26fw5TuwUn6R9azp0X
	 jXeSGMT8BDGRVh6XDQg+QsHml+SaagrB2FLNyUyeZOHm8VW7D0BzsZ79DLdj8fKMsy0pC
	 a15WHXwUx4XwQ/sX6lLZuKQTFR5kd++2MT3oNvux4qW0AIJRH1XLq+fCc+n3gXK7IUmxI
	 iXPY6isSQMKjLGlevROlLNI6Jd0W3FBPd5hMiIjVUiVLKE4HPxE6C7PzisuYGvJ6BmHJp
	 wprYZYJ9EcXw714ZfropAMJRvw2RMSIPlwyqvr74V8DB5yTRVSVG9e/6mGVZR4GYcFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=M7i7BwH0;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A07606A32C
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A07606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=M7i7BwH0
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id Nz0gxH4YEaC0UO0tjxX0OC; Mon, 02 Nov 2026 22:53:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tixhn3GsTgvO0tixxhz8; Mon, 02 Nov 2026 22:53:02 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae9144f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=gjPVwmnhkBixQj24p2EA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=bSQEp9/02nkanXqwanhfiQ7850wtB6B+skSAvzLM05s=; b=M7i7BwH0KE8r
	6pksvLB58/9xz0rc8Ynyf6so8+e60qAmRUPaa/dbmcmV7Nwpm5RWuXQZKW7NQdVep7zqt4fA382VH
	vULH0mypYmcxFy4sEq6T66AnCk1IvNnbFNMQA+yMXh0+ZE71Hw0BKBl5c00z/oyw1mrtseE71XbeX
	asuUHlTcdSK+TmJM9kTT2QV/yzmNQFDtLCg79j0MkclE6Ddm6OMewNVgfhF97KRdNOC+WL1NiD3oy
	s6eeKeLMvuIwRo5dKhCXVTGM16w9Mr6T2WHrd07TfxnpMvfVQVDAXKH3UesJK+Mmt3wghE/AAnNJO
	FiPAr2LmDgPfJgjEcu6C5w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52716 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0ti-00000003k9Z-11JU;
	Tue, 03 Nov 2026 04:23:02 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 009/102] hwmon: (adm1029) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:02 -0800
Message-ID: <20261102225235.334487-10-linux@roeck-us.net>
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
X-Exim-ID: 1xO0ti-00000003k9Z-11JU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52716
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 34
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ//AXTkIiuSXZTh07JkaiVU6EfEHesU8lrf7TVMq0nfvVUH0cS9e2cldzAxNIaLXFd1j5g4cvKg3S8Ex0zxFtqvwLH4DeUA1VoCL5dIVZ+NcWoPBQEU
 ynbyicTcxKQNvUOCMy7rrPpdPjz6bOITFBaHgngTBht1bxzsT67o5wfcXXNBVJ4AVO7iBvmaozxYsFhk9gbRkO+pVtKrbvGfKnXPup5xsTXPUtW45ImERAlK

adm1029_update_device() uses 32-bit jiffies and time_after() to check
whether its 2-second register cache has expired. On 32-bit architectures,
leaving the device unpolled for about 24.8 days at HZ=1000 causes the
jiffies comparison to wrap around so sensor values stop updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
under update_lock to avoid 32-bit jiffies wraparound.

Fixes: cae2caae7825 ("hwmon: New driver for the Analog Devices ADM1029")
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1029.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adm1029.c b/drivers/hwmon/adm1029.c
index 6cb0a238e059..0af5d48dc01f 100644
--- a/drivers/hwmon/adm1029.c
+++ b/drivers/hwmon/adm1029.c
@@ -100,7 +100,7 @@ struct adm1029_data {
 	struct i2c_client *client;
 	struct mutex update_lock; /* protect register access */
 	bool valid;		/* false until following fields are valid */
-	unsigned long last_updated;	/* in jiffies */
+	u64 last_updated;	/* in jiffies */
 
 	/* registers values, signed for temperature, unsigned for other stuff */
 	s8 temp[ARRAY_SIZE(ADM1029_REG_TEMP)];
@@ -121,7 +121,8 @@ static struct adm1029_data *adm1029_update_device(struct device *dev)
 	 * Use the "cache" Luke, don't recheck values
 	 * if there are already checked not a long time later
 	 */
-	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ * 2) ||
+	    !data->valid) {
 		int nr;
 
 		dev_dbg(&client->dev, "Updating adm1029 data\n");
@@ -142,7 +143,7 @@ static struct adm1029_data *adm1029_update_device(struct device *dev)
 						     ADM1029_REG_FAN_DIV[nr]);
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

