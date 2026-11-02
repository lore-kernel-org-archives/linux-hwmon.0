Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660228;
	b=VWOkfEDwLGAvZYEiwSrEQkFjSaj4zT0BsECRmn1mrwq2VOPQI15+AX7Xerb8YevFJR89
	 3luONtzE1qvuJPmKGYhnRYgmj7ZQGndeHw11ntbJbiAyfWDBXc4JdMssxeTnOLg6pTfTN
	 6TrgWSDmnnkhXq3MgSOLqGwcllslZLziWJEJv6b/bw9Hy1d14KRScnE4cuKokk/WSVQDG
	 m+MzlvJbBry5kAxUWwIc7HwSaPfogK4/y2JeuX52VrY39wmt3Xt43AKp2cN18A5FKvKhu
	 ye1ud2vYr5zIqM9dUFOZHSmGyeiLdnVNktWGcvTfEZF8Fjy8kxm1yTOvO3YXKQN45Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660228;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=rGygfcLbo1C0aK4herewRCGhXAg6VcbpO8kqji753Ng=;
	b=yzQrl9Ye0Vqz1ytEFQD4U/5AqQT847rBfhv4Zn95RSKv4d8f163GCyRiaBkYmv0NXlCs
	 l6j3WjIgKBD+NO0cPdPLdUEsPbyveo2p6WcLbeRAjDC6tPoFa66a/GSCBUFNTYrEv/gDj
	 EoUAQiIGJ3pyI+RW+vWlePbgEXlCnLxIDZrNsokC+S795Cxvl/5/DY4BxFB8Ikh9/LesV
	 S9E6wkH6A/d8ZRQ9+qrSyDVqOipXL5A44ib+26vY3Q9fv2lwGEajD0FewsYjT1fi2ME6s
	 aO9aZOlz7UxA7SiOt8OISkOUKy02GY/l5AKkkpDOqTQ6b1R0FJlu6ZRPtTXDwUtVy4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1O4EYGbB;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD32606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1O4EYGbB
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NvI2xRjZjMylkO0xfx1sfq; Mon, 02 Nov 2026 22:57:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xfxjR2qmTkmO0xfxihPv; Mon, 02 Nov 2026 22:57:07 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae91543
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=8BzY99dkAAAA:8 a=_jlGtV7tAAAA:8
 a=N4X_Y2vUnc59bwN8jIwA:9 a=i9qZl794mjBmCNEFDYFV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=rGygfcLbo1C0aK4herewRCGhXAg6VcbpO8kqji753Ng=; b=1O4EYGbBs0t6
	WTIPAfI2Lhaoqo+2EOcD63EEl/Clgq4kaS7aNwT+jZ9R+ZUw9p25ky1FCZS5bPP613kvVNbNflTi7
	/q6pGu4r0YkaODO8+O+AZWMEUb05vUVTsKukcVxWoFD1VvQ3TNGnge2c4cnh8IAXn7oPOpfPRwWwS
	bZdE0VjCdfA1KTw7GydDZxO8O88JmtKRslWVCe3kjJ93TmrvkVNZvNYlHGflaSjQNwCQuN226tiLC
	qnX7IbM6mO/ooN52uaAb3W8Vo/rH4dxYQEGqRNsqMZ/6ud2lCnI5XCtVryZpmPaDr6JkiINH0yxGD
	Ylpl6G7R9QsLK1bxf3gGdA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44602 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xe-00000003nM3-3gRt;
	Tue, 03 Nov 2026 04:27:06 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Marc Hulsman <m.hulsman@tudelft.nl>
Subject: [PATCH 096/102] hwmon: (w83791d) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:29 -0800
Message-ID: <20261102225235.334487-97-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xe-00000003nM3-3gRt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44602
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 149
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFoHWHgW6pyLTXVGXW0zRp1puCZ5nqhG4h1f7qsnVUDLiKaom4h8BsYcfKvC+TiyQegtXHEH+Pcj7YQEGFXphOv8qY6lgwusDrF62A3e5y31mJz2J24S
 ePRpob0MlPYfpCZVngFpWG7SrFwGQNA4kPj8zKY9JV/+wDbGtX56zUIgB0ltwe1NSN2KL2P1Z2HkU48ejc2x9LL9JcWkVc1yKGayD1vPWIGZseq3f3rtK6v5

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring driver for the Winbond W83791D")
Cc: Marc Hulsman <m.hulsman@tudelft.nl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83791d.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 4b07a25ae59e..6858e2a0adb3 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -276,7 +276,7 @@ struct w83791d_data {
 	struct mutex update_lock;
 
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 
 	/* volts */
 	u8 in[NUMBER_OF_VIN];		/* Register value */
@@ -1488,8 +1488,8 @@ static struct w83791d_data *w83791d_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + (HZ * 3))
-			|| !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ * 3) ||
+	    !data->valid) {
 		dev_dbg(dev, "Starting w83791d device update\n");
 
 		/* Update the voltages measured value and limits */
@@ -1599,7 +1599,7 @@ static struct w83791d_data *w83791d_update_device(struct device *dev)
 		data->vid |= (w83791d_read(client, W83791D_REG_DID_VID4) & 0x01)
 				<< 4;
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

