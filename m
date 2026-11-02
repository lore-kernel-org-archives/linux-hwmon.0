Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667493;
	b=sSvWl9nsvgDFfQa1oxlAXEEjaVtoGzlRLBr+QVBxgUcc3uR9cI7ONdBO+Nrt1GuLfzIu
	 AkhqK7OjLs9G2JTxKoV77wBL6p9RZQ6U/TDItfHkKvUw9am8N3vDV4+jQG1pTIXV1CPnk
	 SYKv5uZGW/nqydJ9t7XcoQhFF7ZF7BnB9hwwVFIp4IakjzGqvu1tqHhBUFntJg8zlXqNh
	 DAP7HCMVkwcSYtwuhxMA+dkGoTSucZgKQZqk0tyTNl8akhQHDEtGIg95Gn3rj+dTKxYVy
	 YcJvgCN7Pegik734aarXNv1JLC8/xJFlFYPUzfCL0kWUuWSR3baZgcwlHTNw+pUCMZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667493;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=/lTswKxbP/v+ZrpBTgN6nHxxuAzXfIbmOFmo49fi67U=;
	b=HECytaOiUR51A4Zsy2trSbomyGiPNgZFvAOWOV3ZnrwAk4+bKEDj3BLIQbLqsxJfcJTZ
	 S51iD9HgtJHvnPd2ZA0Ve1rcLzHG4ykLBh+Ruby7499XYECxX/VOjXlz0JRn6+oZzjrK+
	 xv2EFLD8i96JDcuqiiw8rNs65uEr6A9Bo40JXI0U7rjrN2nHrH9ODeHPfTshQikIiPWug
	 4DL39gxyWdu+CmyFtKUJWk4AdwRebRvr8ncHcGBBw/HGJPRTJFC38lWL6bT3HS8yY4Ofw
	 2Vktsffg3EOvf/rDk0bx1/kZGFbOCtekBQXza1OPeQCT71xbo4mUxk2jKP3ALuoygDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=124NOrWV;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F26606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F26606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=124NOrWV
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NsHdx1QcHJFmFO2qpxB8YX; Tue, 03 Nov 2026 00:58:11 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2qoxlENusTgvO2qox0YIa; Tue, 03 Nov 2026 00:58:11 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae931a3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=uIQ9F_dSYr64Mygn8EMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=/lTswKxbP/v+ZrpBTgN6nHxxuAzXfIbmOFmo49fi67U=; b=124NOrWVuHJb
	xEIcxnmJ5eDPPArP/CFLQBs1qqXbMP4RfN9fmkIjwPzR8MvHBlr+E3hJPLIedV9rsNqoYZ8PVEWXR
	gFTipPW4gzLH+2LZhgG+3b0DfkD5fOKZUdRJDxvsLP6iC7HH5iPXbTMprnZ+Z2jh6fcZgWqSQz5Hw
	XFk5A4pdbicgulj+2zwKwXcPAn5Qz468MZrcUmnDBsM877Tv5AT/fkcqykwY7E5s8QwfOLezamS1L
	oO3diBAC7i4CkoiiEsYASUnfdH4jFFt1Dvq8Ifu9c9GgheMWx0hElAQNP7QIphSMywMeJTuRcNDpm
	p1DqHspOWY6/yScYC2qLwA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52530 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vG-00000003lHg-1UnE;
	Tue, 03 Nov 2026 04:24:38 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 044/102] hwmon: (lineage-pem) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:37 -0800
Message-ID: <20261102225235.334487-45-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vG-00000003lHg-1UnE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52530
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfISLMIOPszDRMShI80so/Lty7M8fecLXo3fVlbgYo2/C5r9aBxLyvwBj4Avelx1/nZY6dw7Ai4cCpg8SFxxowMzJZNyQGM9d+DJGcmQz1Ilm753y/R4D
 igO0axamRtOu68nDS4w7vezNsW8f+T9ma+u611GcdI2mTlMxkFpUBLUaPeVVfXzwRsJgJotEhdF+eUpGHmIVfvgGXl7EyP7HgzoHj6wxgDAFInSNZyjPquCU

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 502b5a019920 ("hwmon: Add support for Lineage Compact Power Line PEM devices")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lineage-pem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index 75a44b0639dc..7487ab1657a8 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -119,7 +119,7 @@ struct pem_data {
 	bool valid;
 	bool fans_supported;
 	int input_length;
-	unsigned long last_updated;	/* in jiffies */
+	u64 last_updated;	/* in jiffies */
 
 	u8 firmware_rev[FIRMWARE_REV_LEN];
 	u8 data_string[DATA_STRING_LEN];
@@ -149,7 +149,8 @@ static struct pem_data *pem_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		int result;
 
 		/* Read data string */
@@ -185,7 +186,7 @@ static struct pem_data *pem_update_device(struct device *dev)
 
 		i2c_smbus_write_byte(client, PEM_CLEAR_INFO_FLAGS);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 abort:
-- 
2.45.2

