Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659982;
	b=xSimDNJUXBbTkpgYxmIjmzm+5UZuBtiPsPtIysZngpvC8s6zII1cgUa8WAx6uZFDDiEz
	 ow+AVv2Exbr9khUeow0DmLBRfjIqEcdOeaIRAnw3C2gf1XSdgFhY3U5THZ6su/FtzWmA5
	 B2PqR1MK8m5RP8k4QUaxhu3XgHJJjvLCeK+3z4JgybiRi3KLUV7WwAxVTmVviDyatL4Ja
	 1fPjQ7af/7KxaGwZdNSN5FXydkMKcI7Eft0vQYDhgTgFtnNtL8UGGSzs3j5mDLcfNpeKD
	 DGcx4kdKOYVKo5gWBN4hCoFgbpOPIEyK1oTXQf1h7q6brYLcr8syJVZCg0tCs5P3h7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659982;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=sp5yvvjdpBZub4FVKGlkqXS4msxPhFI9A1KTo9kuLEw=;
	b=nCJkTitADBq9chhnu8y1fEs39/wYEM8KEFIgZjKw/NaMxXpU8XD5acEN7gpW3fpGCL5H
	 nT21Lzj+rVIQ2wjDY3uRrZCQOmOGSvJk4H6CHRa9zJNLwA6UMWNpz8ptVAEfEDDltEW63
	 j8R0BqwNRUexBxHfzrlpyqsveTuZVhyQYoEz98SpCag1/cQnlYO6x/eAHe2S7iRJ4uzr+
	 bqpPGc6C+ZVWzGkuAbvNUV/CoT7zhr3mxvglRZ+hVU7EMCug/Dgj4tmnUQSC24GvhjpLU
	 5lNfFkz59WZ+1gBLJdbc2KAgmuLPGfh6AnKaRw1tuznjNTu3FvLzevyCi7iLikelp5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YI825oPI;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C71606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C71606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YI825oPI
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NwxfxgXujc3XsO0thxXlab; Mon, 02 Nov 2026 22:53:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0thxPL6VLr2uO0thxE6Qo; Mon, 02 Nov 2026 22:53:01 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae9144d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=pjy2svDfo1PaBdbgl_EA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=sp5yvvjdpBZub4FVKGlkqXS4msxPhFI9A1KTo9kuLEw=; b=YI825oPITxFf
	nE58s41OEWaCuBJ+c/YiYdWjXxot9v1EufqsXi0v5DNf2H8uws8JkYmwfr7kDrvcGgO0vvAlfinn3
	U249LT+fdFBt4rrQBhn7iF7eNn3Qk085rgtlCdHXJ9LJQwn2L37gh3X004A8L6U3lqBSWSzeYjrd3
	ae2VLUMAWKlNB3ggkOBh22OMpSoiR/ZmZE/UmmkxtXDrohJL3+CRvA9S1ldtaAJdRvDQ25I8TFcaH
	yO0fHOOFjtUbtooqaM99bQS/NpVvKagrk4PFE1ne8E7/QwQYmpjNwwYuWCnyfSGBNIKIHmWY0G3u2
	RlhRIdF1FuHwNhAiklFkog==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52700 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0th-00000003k8y-0lun;
	Tue, 03 Nov 2026 04:23:01 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 008/102] hwmon: (adm1026) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:01 -0800
Message-ID: <20261102225235.334487-9-linux@roeck-us.net>
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
X-Exim-ID: 1xO0th-00000003k8y-0lun
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52700
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 32
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOXYF/mW0Htgimp0UCrqGpr4oqnKCDyg082msuabL2foxtHCmL10/2W7blFMCNmuZRbxhDv1H8DqBRDU6KbazJP6x+zJ8iQi6ldHNcZ05u9d1S21Hp8k
 M61p5nqBQpUXPg5NFKe1+M6ixpOc8tqYs0lzvH4gYmtw/vdkRx+b9u112g8cIV55vBM5Q51Gzgp9ZqgsAHMb/qgByhgSCqSb4J8oBAyYpXesBbKrkubXwft+

adm1026_update_device() uses 32-bit jiffies and time_after() for both
last_reading and last_config cache intervals. On 32-bit architectures, if
the device is not polled for more than about 24.8 days at HZ=1000,
time_after() wraps around and cached sensor and configuration values stop
updating.

Convert last_reading and last_config to u64 and use get_jiffies_64() and
time_after64() under update_lock to avoid 32-bit jiffies wraparound.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1026.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index 3ad82c01f81d..7e10ace4b03a 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -268,8 +268,8 @@ struct adm1026_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_reading;	/* In jiffies */
-	unsigned long last_config;	/* In jiffies */
+	u64 last_reading;	/* In jiffies */
+	u64 last_config;	/* In jiffies */
 
 	u8 in[17];		/* Register value */
 	u8 in_max[17];		/* Register value */
@@ -332,9 +332,9 @@ static struct adm1026_data *adm1026_update_device(struct device *dev)
 	long value, alarms, gpio;
 
 	mutex_lock(&data->update_lock);
-	if (!data->valid
-	    || time_after(jiffies,
-			  data->last_reading + ADM1026_DATA_INTERVAL)) {
+	if (!data->valid ||
+	    time_after64(get_jiffies_64(),
+			 data->last_reading + ADM1026_DATA_INTERVAL)) {
 		/* Things that change quickly */
 		dev_dbg(&client->dev, "Reading sensor values\n");
 		for (i = 0; i <= 16; ++i) {
@@ -380,11 +380,12 @@ static struct adm1026_data *adm1026_update_device(struct device *dev)
 			ADM1026_REG_GPIO_STATUS_0_7);
 		data->gpio = gpio;
 
-		data->last_reading = jiffies;
+		data->last_reading = get_jiffies_64();
 	}	/* last_reading */
 
 	if (!data->valid ||
-	    time_after(jiffies, data->last_config + ADM1026_CONFIG_INTERVAL)) {
+	    time_after64(get_jiffies_64(),
+			 data->last_config + ADM1026_CONFIG_INTERVAL)) {
 		/* Things that don't change often */
 		dev_dbg(&client->dev, "Reading config values\n");
 		for (i = 0; i <= 16; ++i) {
@@ -464,7 +465,7 @@ static struct adm1026_data *adm1026_update_device(struct device *dev)
 			value >>= 2;
 		}
 
-		data->last_config = jiffies;
+		data->last_config = get_jiffies_64();
 	}	/* last_config */
 
 	data->valid = true;
-- 
2.45.2

