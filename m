Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660015;
	b=oX4vnxAdu6ujTnN8WGu3DssQyN3E/Hn5zKuC0MPMBEx6E8iWjSQdMlIjnYVRxh9AUW3R
	 gAWLvjFSRVym4WnCsa/F3LVn/iYS8jmoZk0W8woKXVaE8u+iSU303UknyKyDTihuGUkft
	 NRHyd7esw/MDCZWhr2CCdKSF9xiOMmsrUqr+MYOzvEPEKalIG3iIG5uxXGa8NHHJJbBKj
	 Fp5To/S8JvzJ7Ev6PoU1+whf9N6iaHpZjUzdWY+rS5yJPC0OBWRoaIEYu6foRXdZBwjSu
	 r6+hZphyFMzsaGC2Wkq9qXvxDH4OR+1z9MFg5eFS4no8sRmBpVGwAVp6Gj5zoyKwXPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660015;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zFf6OOCkLsKAQI/cxS1bFWTt/A4HGycOhzhFJEXXaRw=;
	b=fmsDEkkZ4fedpetyDsGGXOU9balMiFi+3PYYNz57cRhyNQQ9QgqsFAPXpr3N6SSFM+zG
	 XOlnQJsbXh8HIviff8kyDoKJxopUhY8iioDb9aE5afVkLbgUYjoHtSZTmcnGjXFbyXAd8
	 hZl9BiFD3p2x2j5HGXefnkNdnMVIzpl6ROL+R786EYkPInZKtKI/bNWIaVQpWOOUsGx1H
	 G2a/FrLS45csNvFcpvuNKSIv8ZZqTdgGweTq122FRNQ6XzZha9AVfsdhhxwJp0rjhpR7Y
	 ujzQJ68CpKSUwpt2hZ54HQMvpH53mmPUQst22E2zpZSRQku43ZKbisMCBeUPbG+Sv8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YdTTjAT3;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC957606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC957606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YdTTjAT3
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NrxdxQtGuMylkO0u8x1rer; Mon, 02 Nov 2026 22:53:28 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0u7xhngXsTgvO0u7xxiVu; Mon, 02 Nov 2026 22:53:27 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae91467
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=XPgFqt2qi6FeOqyXoTIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=zFf6OOCkLsKAQI/cxS1bFWTt/A4HGycOhzhFJEXXaRw=; b=YdTTjAT3BGR2
	lZA/exkaczdPxKcAabsrbkReIOOoMZY5GX7ifL/luHcyN1EzHS9YaLKYRGJFglAVEshdblbHYbpxL
	0DwBNXM8fVhNae1UD3prOnmtYLKmSsTDJFOQPmGvZD1H83KQGKGixXeGixC257nCAed/aKTfG+9PI
	V8DGCP+Jyu+w2I2tH/fW9HPRjY89gtztkx2xIgVdGG1hqO2HVYa+eKcgHJLb+RQimmKwK82nJeZGJ
	VbBOLXx8RC4oFSeQNw88Lj7XWMMTIeErdZfR6MjDMmtP1X0Vx7wpvg8i1cPw61ieiZyjasR5eg8L+
	1pwwvEgP20MVimmJvC1q5A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33454 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0u7-00000003kM4-18Bm;
	Tue, 03 Nov 2026 04:23:27 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 016/102] hwmon: (asb100) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:09 -0800
Message-ID: <20261102225235.334487-17-linux@roeck-us.net>
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
X-Exim-ID: 1xO0u7-00000003kM4-18Bm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33454
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 44
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIwL0xCeJfab9DWXXpkELtkLgnyeg89g1H7j92iUGOqrtzbCCjlJIeCaZo9dgPKU4JgOqCc4l/KcztcgC01Wa4s8Wx4fJ8DR7aDIr4SD9TV18Ok+/+U7
 erZsYwCM/NDXPlAxREP9pjZ8lIAkm9HElMWbDWR828WAzN8gb4bnYx3NHy1YHnBUckHqkbwQ+Hyj5amNmluNdjtnxdHTHxoivsj6aWfI5hkumBDIEFcKvoIh

asb100_update_device() uses 32-bit jiffies and time_after() to track its
1.5-second sensor cache. On 32-bit architectures, leaving the device
unpolled for about 24.8 days at HZ=1000 causes time_after() to wrap
around and stop refreshing sensor registers.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
under update_lock to prevent 32-bit jiffies wraparound.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asb100.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asb100.c b/drivers/hwmon/asb100.c
index 5f5c94505166..ec4c7e6e68fc 100644
--- a/drivers/hwmon/asb100.c
+++ b/drivers/hwmon/asb100.c
@@ -181,7 +181,7 @@ struct asb100_data {
 	struct mutex lock;
 
 	struct mutex update_lock;
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 
 	/* array of 2 pointers to subclients */
 	struct i2c_client *lm75[2];
@@ -940,8 +940,8 @@ static struct asb100_data *asb100_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-		|| !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 
 		dev_dbg(&client->dev, "starting device update...\n");
 
@@ -990,7 +990,7 @@ static struct asb100_data *asb100_update_device(struct device *dev)
 		data->alarms = asb100_read_value(client, ASB100_REG_ALARM1) +
 			(asb100_read_value(client, ASB100_REG_ALARM2) << 8);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 
 		dev_dbg(&client->dev, "... device update complete\n");
-- 
2.45.2

