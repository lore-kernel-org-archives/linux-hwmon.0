Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386402;
	b=iH69TDKCtL1RtgRJ4yaRV/u4ztU0Id5bjFZCiDgEvDTMaRdnxQoVaj+vnLicHLjRO5oH
	 h8DB5ugwcuMXgBCUOjRf35VDklG8xJeRiAG3Ou0pDrJWW5+f/gcBmWnYnl8J0LJXzOJ/A
	 vSqjNXJR+UFtIed89NvR0LyR+US2pYlIyShx7c+oiCoqb+PUhRxfgswKtwVCdIDlkUeW6
	 YJAK8Ce8RhokfDdTrnbDqTjCofsjb447hZtPjji5yusOeTvoyZU7ODa6a9oJp0v/rF2bY
	 BNNTxYoftUG/3ERVQ8BoQsaC/tjuxoPJEXWzxwUzw5wyWXVnBCOAPKIPdj3nHh/CuGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386402;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zeWS8IIKiInhGMztWx1JjpIHSaNL0B7jfo3j7VMc7z0=;
	b=uGVrhd4SxM3WTwHuCtSKHP8NTZsgycm/RTGdN8T4bzZi/uuuJ2+z9GtHNkkbt589EHbG
	 McGzLNfXtW6vjYwoNLyZDwpWsSvvH1QdGlnpttACV7prECFMn9e887v/ktvxTJqji2QDC
	 Z1ppu9s3C3uJS2OBi8FVeztC1TkIoEhXuefGAzqXG+HfXv0xEBonkEnJkU7z8/CU/0WNK
	 snJ+3f9e8pgKktNPgrFVyKNjZ41DuDzkCOe/39oiijz3SQVOALjUyhT8goYgiMEhcX/Hb
	 YjMvHNroPmOEH9Wr3eik30RrFBvzsvadMWs3yao4M8ToAkEZE1pE/BdRPnd7ari44JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VnBIPJ5X;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DBC606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VnBIPJ5X
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id Mo9RxVEYmc3XsMrj8xDgzi; Fri, 30 Oct 2026 18:53:22 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Mrj7xkhDPkE4RMrj7xRoxX; Fri, 30 Oct 2026 18:53:21 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae4e7a1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=H_C1Gzwa0vedc-AEwUUA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=zeWS8IIKiInhGMztWx1JjpIHSaNL0B7jfo3j7VMc7z0=; b=VnBIPJ5XG7PE
	fnvSpK0SAK7loMCwaoMn7rPdZQ39pG553juV1kIOTsOu/LGjx9F6vrm/yUULKNPGXDQrM4yn52yuF
	Giqdif/DEHkCapsU/8twTTwt0CMvV6GHw/kThC/TR/7vzwCNkVkm3OABSPOzLgOOQLtc/1zbiyY6Q
	QZNUDgfJtVC8BblgMDk5x/25alpPCRTTpXmPfKfeKpTkZKQhN7aSsWUJHsO7qTyTu1277yL3h4B4P
	CJnEHWTW9v7C2ejPXVDY4h2kIiPHMgrz2rPmdjf+hdfGvQx7lWimCvnMuOBlobCzyz7YALnq6cIVd
	oxvOZQYpq1MICDcQiYaWKQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43066 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrj7-00000003RQY-0ZpE;
	Sat, 31 Oct 2026 00:23:21 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/11] hwmon: (lm87) Fix drvdata type confusion in vrm_show() and vrm_store()
Date: Fri, 30 Oct 2026 11:52:50 -0700
Message-ID: <20261030185256.976255-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030185256.976255-1-linux@roeck-us.net>
References: <20261030185256.976255-1-linux@roeck-us.net>
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
X-Exim-ID: 1xMrj7-00000003RQY-0ZpE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43066
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIwBsfGKFRE9NzVpL7za0n5gibC/GKbpxYQrC6vqO2GoCfcnmwpMfVfoksKMRhqbgaKwQvYXfJKukjQSro+wm88m6DHKzL06FM/Vo7v7hPfgvF3k6W3F
 pomjcTEwfwgeLGMtd3+eUTLECcsWHR1yDB8xQq1obv3WK/HFOKIRcvWxmMDzOwVJRcWB2eHJwx1YqO0yF6IS25xh4H9mGHua7qkk8g0XpZ/kJVVHTTxiCvGO

When an LM87 or ADM1024 device is probed with VID support enabled, reading
from or writing to the vrm sysfs attribute triggers a driver data type
confusion in vrm_show() and vrm_store() in drivers/hwmon/lm87.c.

In lm87_probe(), the driver stores the struct lm87_data pointer on the I2C
client via i2c_set_clientdata() and passes the struct i2c_client pointer as
the drvdata argument to devm_hwmon_device_register_with_groups(), which
attaches the attribute groups to the registered hwmon device with client as
its driver_data. Unlike the other sysfs callbacks that retrieve client via
dev_get_drvdata() and then obtain data via i2c_get_clientdata(), vrm_show()
and vrm_store() assign dev_get_drvdata(dev) directly to struct lm87_data *.
Dereferencing data->vrm therefore accesses the struct i2c_client instance
at offsetof(struct lm87_data, vrm), causing vrm_show() to leak an unrelated
byte from struct i2c_client to userspace and vrm_store() to corrupt a byte
within struct i2c_client while failing to update the actual VRM value.

Fix the problem by assigning the return value from dev_get_drvdata(dev) to
struct i2c_client *client and using i2c_get_clientdata() to get the actual
client data.

Fixes: 00a0c905ab4b ("hwmon: (lm87) Use hwmon to create the sysfs groups")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm87.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index c09074f44708..bb4e15b66355 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -606,13 +606,16 @@ static DEVICE_ATTR_RO(cpu0_vid);
 static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	struct lm87_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
+	struct lm87_data *data = i2c_get_clientdata(client);
+
 	return sprintf(buf, "%d\n", data->vrm);
 }
 static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
-	struct lm87_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
+	struct lm87_data *data = i2c_get_clientdata(client);
 	unsigned long val;
 	int err;
 
-- 
2.45.2

