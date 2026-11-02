Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664558;
	b=5CRvvTbGGxibXe6onMmVa0vA7vseYAowelM38rHlM1cJp4uGuCvUqYVm8RjqkpxRmbt6
	 T2yW4EWjwJJdDaNwBWCNj3zm4+AHsIqF6wYTXDDWrADLVcTez+mAcV7vrfqmbSkXKvH5p
	 KH7AoKtRo61wI7J0uyrL9UU+wgwAl0ImKFXjYIqHyxDUFd13d0WKlb2oU+SS5H50FsSQ7
	 c88L6vqD5SDuQ7bG7q82d6KoFEDYcTKu3j1QZJIft/NZXsWWOjCtqCnEqZ2j7IjoRlWWb
	 m5qm19qCKltfN9kg8S0LKo/GTCyNGCbIB3zsA3wgpZXJG7ptNIbMQvxp3v9OlSZWH7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664558;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JI8k4s4+hmoPsyzETxGeqCeua3m72ftuILH7xkRFTR0=;
	b=Ax+BLsU+exkEfulxozTxDac8hBEOfHv6m/42///fsRmqwillhdBkPq3HM9QJp36+tHer
	 nHW6eJxHw4G7XS+jjUfPZQZLmeINPRegZHJMYB/+yDGC4Sprl6uJA3g1AiFqSQuBIpSFX
	 YycVuGGOfjPxpqGN8poyIuCQVspPyzthOm9hSK4x8WGxzh5+eQ5y3ifiDuiqKnNwZSZpJ
	 jcKB/GIaWPjjz/Kl2+LdAyxDQzglhzpi5uWA93uHf7/VIn9By5w2rPDoDkcu+T1lh7Wq+
	 uB4VgGUN5ZQOf4WE3Y1n6DBn0Dq5xnkx2c/6PeXYGoLzp825/oVNGAbzZzPW32erQuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="GWKJd/6/";
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DD606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90DD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GWKJd/6/
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NxXvxGkvdaC0UO25VxXPKU; Tue, 03 Nov 2026 00:09:17 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O25UxLbnm63hBO25UxgJr1; Tue, 03 Nov 2026 00:09:17 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae9262d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=mG5P5BnYauvNeeFvbaoA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=JI8k4s4+hmoPsyzETxGeqCeua3m72ftuILH7xkRFTR0=; b=GWKJd/6/nCVn
	YnEH4FwbG++v4QE72sYsJCQTaqGAUS8iEqy8vGGdZn1o4eSfqSvD52bY63cGGb5tT6s5EEJjYZOV9
	LKGRMNAXTN4e/QIQ5f9Y3FTHhC2LUcCmbzF+jmE4FyweyTIlZL+buMzqsp+CfqTXdSmR2NPaWfVqS
	MdniRjbHqv4/gYwiHNatTotja+owcpZonDnuY3eUKhgSFDq65Cr98RL70S3Tg7qlpWyne7aTHAb+L
	1h+EiQ07xtTMspJWR78/ALMpyCyy5arcS4+0gsbvPu+5dla5TvApMEYdGFY5uR3i4rdOpVYgfGR4e
	rTfoRXHqlBcQP/qL8Eqgtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53946 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0w7-00000003leb-1DWw;
	Tue, 03 Nov 2026 04:25:31 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 061/102] hwmon: (max6650) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:54 -0800
Message-ID: <20261102225235.334487-62-linux@roeck-us.net>
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
X-Exim-ID: 1xO0w7-00000003leb-1DWw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53946
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOONfSE0KLNpOPPQNNeBD7rd5XMGGDlKiYiSWm/NXdLZ7DJ9wj56poQYNHI1wXhJlDgbVt+VS010EpyHdZ8zpmhF/zSaU/8+/XUA58MopDH6ohx4Gkvj
 qNIV5WOsdleyiiEzigJ+qRl1kq1kRhDmn12U5WVUlIeG3mSCFODdFP4k38gqJuNyAfNRLLR+wgsdSDMZPLztqXKj8XRXHbAph4v+WobXlFT6sCMcaHYQ0Kfp

max6650 uses 32-bit jiffies and time_after() to determine when cached
tachometer and alarm register values should be refreshed. On 32-bit
architectures, if the sensor is not polled for about 24.8 days at
HZ=1000, time_after() wraps around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: d20620de0c3d ("hwmon: New max6650 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 90c37f5647bc..62909a19a238 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -105,7 +105,7 @@ struct max6650_data {
 	struct mutex update_lock; /* protect alarm register updates */
 	int nr_fans;
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* register values */
 	u8 speed;
@@ -163,7 +163,8 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		for (i = 0; i < data->nr_fans; i++) {
 			reg = i2c_smbus_read_byte_data(client, tach_reg[i]);
 			if (reg < 0) {
@@ -184,7 +185,7 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 			goto error;
 		}
 		data->alarm |= reg;
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

