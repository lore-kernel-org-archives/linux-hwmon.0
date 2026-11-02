Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660036;
	b=pzlz7qAmUjEPHi5M6KX9pm7DapRflh5mEb8a6bOXdop1912MFKpHCwfCgYy5kYzYty0O
	 tCXiO9tKHGYQk8TffNsa745FdsWPNCfaLpWA59J+ALq2htgvWjOPXlf+DYqerQUoZhuiu
	 54TBX8dI1mvKMyoOt9cpFXlhGb+/k19awSA2mqw9ULuwNdvmUN+Kx/whCv+Se9iI42+fw
	 7f91hly4HOrkYdyVDdLOeEgM26Xekj9uunnTfne1INj7h6b4nkggP2/zDTxweV6MSM1yo
	 og/bBEhThsgB4OnRh5jTvJBk3ryz0EtIhxa4eBd0Fd/6ZFh6cVqQukUDplhKPzO1rRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660036;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=+17VHPAJ5/FxFMw/9ToXuwVn93/KLcLI5DN4WOL9eaY=;
	b=sAStUCDyaITB8jNPiLt3feX3VH2KNbn/MocR0YfGl7zRjWt5eczv36ABSDmbnw39dXLy
	 9D4bIXBsQo1zF7MUTP3RlUHXsLJawWxg6ogqnoIdhQ6P89crzUEhHzaYCC99r81Zh65NM
	 OD/VnzwvSg2vHgvDZwH1jGteMMOvs44ipFVd1yD1D17j0ODJTB6ky9QWFofiIeU++LTWA
	 /rofKOKCLUjIXv8W6shwLHmcSsh4JbPufKbVI0757EU7NERUGPOjlEg+Tx3jIyUtXxTpV
	 KEdLC8PwilBo7HlA37C63IOIVMB5tBXvIY+7qM/EVQj7SEmDGudEzhUbwdOc63L3dqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aAXFGGsE;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D78D606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D78D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aAXFGGsE
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id NzAKxESVyusRSO0uaxswPd; Mon, 02 Nov 2026 22:53:56 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uZxtDzS8LLeO0uZxe6UJ; Mon, 02 Nov 2026 22:53:55 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae91483
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=VyH4easSpwTGLEfK86wA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=+17VHPAJ5/FxFMw/9ToXuwVn93/KLcLI5DN4WOL9eaY=; b=aAXFGGsEgmqM
	l8AjcBQ62J8xRNI1S+yLPzPTWeNQO/cBbe03byxmzVcl5EHU7xF1cge/BHC4N2fSQkG+AXAcKpXoD
	ScYroT6wv1I066LKX/VXPoDScqp7shARD69NRe5+gvX0i8F4i7fg52zJmOd7xb9bAMcsB7UKL4oZS
	PYIwk/tt3jHgIBEqkm4olm2KbMhNa6M289gR5gjiVq/EKYck1bTq93PK9tSR/PxNa3zm5VAY/Gm5k
	lYUPA26VvTd/YiOlnfuAtE35K/CJDkX4bn+5XfDZ/2AvvjhHPMflRjXKSxGZqVp+yiA9ngDasxowo
	myKcu8cxj+P91O74COhdIw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42698 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uZ-00000003kmD-0kVg;
	Tue, 03 Nov 2026 04:23:55 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 026/102] hwmon: (emc6w201) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:19 -0800
Message-ID: <20261102225235.334487-27-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uZ-00000003kmD-0kVg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42698
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 61
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMG2nVzupVKS31KR2tr0jWxJJIZZVuHzSY4tp4w15dISsLzF/UrFBrrCwZWS+jIIwRtcGxpJXAdflkdZOB5+bQJJU8zJXakHNW3TF1VeyG+QgitK69ch
 sBa4tCPAJa7sMzv1qGrfCeeZIg94Vi+q29kmPZ+pX33lh0bp7JDxA90XOR+CFcpKUaap/7HptS26gwpMvv6EYtgp3klZJsdaXgMb1jHwJERbwAlRhVJGTbsA

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the sensor is not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: b0b349a85d3d ("hwmon: New driver for the SMSC EMC6W201")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc6w201.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
index c13ea8748683..b17688a9b55a 100644
--- a/drivers/hwmon/emc6w201.c
+++ b/drivers/hwmon/emc6w201.c
@@ -46,7 +46,7 @@ struct emc6w201_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* registers values */
 	u8 in[3][6];
@@ -127,7 +127,8 @@ static struct emc6w201_data *emc6w201_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		for (nr = 0; nr < 6; nr++) {
 			data->in[input][nr] =
 				emc6w201_read8(client,
@@ -161,7 +162,7 @@ static struct emc6w201_data *emc6w201_update_device(struct device *dev)
 						EMC6W201_REG_FAN_MIN(nr));
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

