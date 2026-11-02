Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673156;
	b=ivWbA2G1nAZCvNbP2AkZf6mv62nLG0C4A5koUKHNXyI6TgzU4CX/BtAaDojoGw1pl9gv
	 XkATWL/TorWU9jmDpuL5V7nRayOhp2nZfOOI9qImN3svhX5AXAfUzk/ktGPeWRamGlcAJ
	 eVGvrWQjPmB0sKCFAhsOOmpiKaI3P8wF+Uit1g6Uau4pR1ShvF7ElxO7k6KTFFyRk8lxI
	 OnfHA1Gla/EzUM1Zv5yZk2XwcFtzhJNqEcy6+YzJYBy93NqfW89O1vjJukvpyJmkLDGdz
	 vXPcQLYEycMqMqq1MR28AeYTWWsBcvTeXxFG3QBdnV3zLU6HHzafaRYa/o22493k2Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673156;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=M7zg8mpxa6EQtfKCnmPI9X+IaCtTsJW4ww9gyzTZmZU=;
	b=lkIP8OMRnVOPHCN1HujDIjnvlvDO2833P5L57/8I7Gt0IKAcsTGbgAi0eEJFwR1Ps0jL
	 7ptyssDT2524WVUtQsUeKqy2YjMk/27fiZaZT2WxxcmTst3iRYBHHE7y1guP7mu7pk2YG
	 5Uz1G/beogF9CKZNi7DRgDVkZnVOOSNPBO54mzOHDwAUVomYxEVG4aJ8Fa7YOvBNcGnOU
	 iCM/+Mfk1ncGUwDnvTlcFZTJfrv+5FcVW9XtiKD7+HVfYHPp0PZ3tGc7g/1dG0bS2p0Wy
	 aMzCHTLMjNQLJ3VYFB6HO+lz9Los2roLlPKH5jGNCElMVbeim5RNdqjRZShnKcEOXeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=AXXLGS++;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259EF606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 02:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 259EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=AXXLGS++
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id NqhnxCWfBusRSO4KBxtyW4; Tue, 03 Nov 2026 02:32:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O4KAxytlTNSXiO4KBxGi6g; Tue, 03 Nov 2026 02:32:35 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae947c3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=35QXiCAjYUy7xKz_AtYA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=M7zg8mpxa6EQtfKCnmPI9X+IaCtTsJW4ww9gyzTZmZU=; b=AXXLGS++CWKB
	cKf4uZvsU+sef1TnOKpYKI9rt8CehvIa04bOiM5AAQMJbhC6AxmfXStPngvYyXpl1AOoPC8dqxZ1y
	4fGM9TfC2EYnuqul23naxwI23wbq5eUh8fCbPsKpCD69olMW3IuhL/76D964l4Qoz6OlpOShsLEIa
	gTgO4uiLjPS50epuXAVmXfTe7U1KfEIKmgdo+lWe4oDRdNGYEXLeWByNmy+wPUAY1oks2xM1x8+Xu
	iHSnWLJfjDGx1LS7RvElCrfgZTboe3I7bHJuwiqraGRNjJYa2qLuRn6IyIPaSQTMsQgkTYac/z9J4
	1tJM7Hw8KjklCRRW5oQG4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32976 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0v2-00000003lBg-3j5A;
	Tue, 03 Nov 2026 04:24:24 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 039/102] hwmon: (ibmaem) Use 64-bit jiffies and record update timestamps
Date: Mon,  2 Nov 2026 14:51:32 -0800
Message-ID: <20261102225235.334487-40-linux@roeck-us.net>
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
X-Exim-ID: 1xO0v2-00000003lBg-3j5A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32976
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHSEUN+WEdiwxSzbLPREp28V3UoCqZiuVKjSSZz8agqxGCxI9KdfGXFssnVce4n5GKjBg3cgU/HZDPqRbr56h8mQ/FLU6Mmr67Y9z1ZZwPsIoYDuF1hm
 SvFrvKYTezFA7JsgD5rJ43/UQTP328MAEIBvOxBQUcoeli9loCFR/Bs5ZaGe4e9lUoW1YXS6ztrxGiejLUnjik6fJPf2N4VktwdhIrynEGZ6DLzgG8XUiXnJ

update_aem1_sensors() and update_aem2_sensors() check cache freshness
with 32-bit time_before(jiffies, data->last_updated + REFRESH_INTERVAL),
which can overflow on 32-bit architectures after ~24.8 days at HZ=1000.
In addition, neither data->last_updated nor data->valid was ever set
after reading sensor values from the BMC.

Convert last_updated to u64, record last_updated and valid only when all
sensor reads succeed so IPMI read errors are not cached as valid data,
and use get_jiffies_64() and time_before64() to avoid 32-bit wraparound
issues.

Fixes: 8808a793f052 ("ibmaem: new driver for power/energy/temp meters in IBM System X hardware")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ibmaem.c | 53 ++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 0a9c3a29e6f2..b083d0d3ec85 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -128,7 +128,7 @@ struct aem_data {
 	struct platform_device	*pdev;
 	struct mutex		lock;
 	bool			valid;
-	unsigned long		last_updated;	/* In jiffies */
+	u64			last_updated;	/* In jiffies */
 	u8			ver_major;
 	u8			ver_minor;
 	u8			module_handle;
@@ -417,29 +417,37 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 }
 
 /* Update AEM energy registers */
-static void update_aem_energy_one(struct aem_data *data, int which)
+static int update_aem_energy_one(struct aem_data *data, int which)
 {
-	aem_read_sensor(data, AEM_ENERGY_ELEMENT, which,
-			&data->energy[which], 8);
+	return aem_read_sensor(data, AEM_ENERGY_ELEMENT, which,
+			       &data->energy[which], 8);
 }
 
-static void update_aem_energy(struct aem_data *data)
+static int update_aem_energy(struct aem_data *data)
 {
-	update_aem_energy_one(data, 0);
+	int err, ret;
+
+	err = update_aem_energy_one(data, 0);
 	if (data->ver_major < 2)
-		return;
-	update_aem_energy_one(data, 1);
+		return err;
+
+	ret = update_aem_energy_one(data, 1);
+	return err ? err : ret;
 }
 
 /* Update all AEM1 sensors */
 static void update_aem1_sensors(struct aem_data *data)
 {
 	mutex_lock(&data->lock);
-	if (time_before(jiffies, data->last_updated + REFRESH_INTERVAL) &&
+	if (time_before64(get_jiffies_64(),
+			  data->last_updated + REFRESH_INTERVAL) &&
 	    data->valid)
 		goto out;
 
-	update_aem_energy(data);
+	if (!update_aem_energy(data)) {
+		data->last_updated = get_jiffies_64();
+		data->valid = true;
+	}
 out:
 	mutex_unlock(&data->lock);
 }
@@ -447,20 +455,29 @@ static void update_aem1_sensors(struct aem_data *data)
 /* Update all AEM2 sensors */
 static void update_aem2_sensors(struct aem_data *data)
 {
-	int i;
+	int i, err;
 
 	mutex_lock(&data->lock);
-	if (time_before(jiffies, data->last_updated + REFRESH_INTERVAL) &&
+	if (time_before64(get_jiffies_64(),
+			  data->last_updated + REFRESH_INTERVAL) &&
 	    data->valid)
 		goto out;
 
-	update_aem_energy(data);
-	aem_read_sensor(data, AEM_EXHAUST_ELEMENT, 0, &data->temp[0], 1);
-	aem_read_sensor(data, AEM_EXHAUST_ELEMENT, 1, &data->temp[1], 1);
+	err = update_aem_energy(data);
+	if (aem_read_sensor(data, AEM_EXHAUST_ELEMENT, 0, &data->temp[0], 1))
+		err = -EIO;
+	if (aem_read_sensor(data, AEM_EXHAUST_ELEMENT, 1, &data->temp[1], 1))
+		err = -EIO;
 
-	for (i = POWER_CAP; i <= POWER_AUX; i++)
-		aem_read_sensor(data, AEM_POWER_CAP_ELEMENT, i,
-				&data->pcap[i], 2);
+	for (i = POWER_CAP; i <= POWER_AUX; i++) {
+		if (aem_read_sensor(data, AEM_POWER_CAP_ELEMENT, i,
+				    &data->pcap[i], 2))
+			err = -EIO;
+	}
+	if (!err) {
+		data->last_updated = get_jiffies_64();
+		data->valid = true;
+	}
 out:
 	mutex_unlock(&data->lock);
 }
-- 
2.45.2

