Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659983;
	b=5Q+qJVfpI15uwL+I/+IP8WGwHq/yTVPHMe+Jt8m2kRZh1uyfgPrYqSOWKtLtzZire7aK
	 M5mfHdtwlZjQPxNAE66k31xg3XDhIt22xBk7cSOjdamYq3rTRWlGKxlJjtr5+You0ILkT
	 xfOD4jWiBgaZTQucn7PUE3m8NljQU/Ze6wLP5Lj9bAgMFH4Ur8K1i80OMRfiCwBD1o0MW
	 Lr/SY0tFyNuqhdOJdU0KtqixRq3zEbmd1BmtNeO8MDXvM4DDS3fOQdX3pYc0H/yY+QdPB
	 OF5+5sCYEzV5sp00+zqmw3ICVnTNXoGhjteuSBDFzUG87fCUpYnCiLwcrAOV5oGaSHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659983;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=hls5aOD/SvzU1JAoyLcLdNmrON8somBugKDcRsOenXY=;
	b=ZE9nVTGNMOxJ+aONPPdp/VuyxJV13XXp4KuIt4GW7+c40dERJomPVpxw5FDj1qYudfTp
	 HiKTNuvAJrT5wPr0T1FJ6TARQueVKXz5F73yAPNLsxlKWrtnKuTnMibkd7oXlHcX6z1xJ
	 JGpdM8FD2ZO8n2yInmbpslXndE0tRH0Wru2PlyAkz8j86NjTjBSKYKqmxzD+PUc7odZrQ
	 Ywhgxh5X+3jI5pM3Vs9ecCw8kGNjtzRPHwKlb2DqoU8K0z25f8LEmPThTgMiLsIi1YQ7/
	 g46OS3bDwz2u+AQsnO3YMaRXIL82x1YnEKHzrUxkgSPBNHatWmBM6up3ql/ulei4skg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lyQvtH2Q;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B43606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B43606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lyQvtH2Q
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NwKCxYBUhLvgbO0thxlYew; Mon, 02 Nov 2026 22:53:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tgxJX6363hBO0thxeahm; Mon, 02 Nov 2026 22:53:01 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae9144d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=agofVQKObDrp1vJju4sA:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=hls5aOD/SvzU1JAoyLcLdNmrON8somBugKDcRsOenXY=; b=lyQvtH2Qj4ym
	uAdE2NAJoOqAzaRUIds6VXch4NAU/qQl4RKquo+CcjhxbLcBBdGCnkwMz/mbhZ/0GR2jEUUw7r/k7
	wVvnQRJqHntXzyfqX56EX3L0Ubk3JRI9XiMGTyCfFsn5FDYlnfLNa1/16cCuD7X6oUcqqhyDarRRN
	mVA3j/1zFmp/B1mzMSU0qoX8KuLvbHT27VFwpHvbsvRle/eVvzfXFARkNmMaR7x7ZYEfj5zY4eYnZ
	3p76EpFNBr+rSdnOyxXTwEWhS0QI2wv2ePDhn+FZG+gYMDCqp6DWVA7VyFRPGuJ2+U5Eyz7W4cqct
	BfLJ+q+7+DXtaCGpZ7gdCA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52696 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tg-00000003k7z-2Igp;
	Tue, 03 Nov 2026 04:23:00 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 007/102] hwmon: (adm1025) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:00 -0800
Message-ID: <20261102225235.334487-8-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tg-00000003k7z-2Igp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52696
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 31
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFTDbSYFN24z7erWQYzFK6B8nEybCwg5qa3vVF/+DQATJZ2y+URDgHjF3zB1flK+dFyQTFvtiV6fUKrfVlZPgQDULOAusOYYiPk5uX8q7Vlnudiy3d/N
 XBtp80UpU7VGUVWNY8ahgAr85qTyMYz/F27J/yVTka1jU3cQpNjWxiYddiNfAZGut8HuJenBXl2dWawtKC0ffzdjPt+GHwe2HDTmA6RlHmpKEu8lMAedT1ex

adm1025_update_device() uses 32-bit jiffies and time_after() to guard its
2-second register cache. On 32-bit architectures, leaving the sensor
unpolled for more than about 24.8 days at HZ=1000 causes time_after() to
wrap around and return stale cached readings.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
under update_lock to avoid 32-bit jiffies wraparound.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1025.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adm1025.c b/drivers/hwmon/adm1025.c
index ccac7ba601e9..1a947cc91d85 100644
--- a/drivers/hwmon/adm1025.c
+++ b/drivers/hwmon/adm1025.c
@@ -98,7 +98,7 @@ struct adm1025_data {
 	const struct attribute_group *groups[3];
 	struct mutex update_lock;
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	u8 in[6];		/* register value */
 	u8 in_max[6];		/* register value */
@@ -118,7 +118,8 @@ static struct adm1025_data *adm1025_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ * 2) ||
+	    !data->valid) {
 		int i;
 
 		dev_dbg(&client->dev, "Updating data.\n");
@@ -147,7 +148,7 @@ static struct adm1025_data *adm1025_update_device(struct device *dev)
 			  | ((i2c_smbus_read_byte_data(client,
 			      ADM1025_REG_VID4) & 0x01) << 4);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

