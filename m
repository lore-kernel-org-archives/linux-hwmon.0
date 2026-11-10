Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335789;
	b=FMhwR9A2ZMvODpfJ0oEeCuwyComdStdkKvzwBZ11HAZDprC7HtOFvj5mt3JlodrmsCzY
	 4oZuOxEn7nqKwtjoDVrf7kV6eevpqsQpM81kXHcEliYp2h3JJb5K+H58mC3Gimdu9p89I
	 Gu5R6fJO2Czh0eZFaOZyj+niytgDihIdnv/H2qCLaT+eMJ8Yb5OV0S2zlN7baqgf2hOAg
	 Np6t6SwU2PhDCn114tUXHTcEwZkmrrN2ylrAl+wkbjUbYALOapTWK5X+cEXkowOuadOjP
	 6rigFboSJyQSL66oLcqusH995AOgTmbkPBAK/Ja4mf2M+A1tGxG+dJfef5syThbKzGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335789;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zi24ymS86KZJJV2BpVErFOsC/ir0LqXbftDkH/cpDNo=;
	b=YxZy1Mqlf+VUCAJGAiG8J8s+t0J8b4PQvYHSZkBaOOqltnUQP6pGbAE27Clu6d2TO37r
	 K3BrR6OpNUFaTgQEsKNfovNixvfNi7f4jydHFrEVUPM1qZEuNMoLvRMGrMDUfP80pYO5n
	 QoM5MW99Xst4WxrYq7KQhkizOvjtydaZTS0XsrVBtQJMvEoI07VqF/pw5vSnnIpvnQBmG
	 WZX2PQkCWCnKZWWCadLJzBwA0EsdJ2WQSnK3jzgZnw68bQst3vzQBap7bYt/qsupthV7P
	 uchQNUdeGvgoX+cE9OFpUyTXkyh6sZCeSLi3RiK7KllnhEsNRBdRtbkBvtiodtyZ6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CYhqvcQn;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31E606A334
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B31E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CYhqvcQn
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id QpDyxHToCyb4YQqhpx0vbD; Tue, 10 Nov 2026 18:36:29 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QqgMxw6zC0288QqgMxFMii; Tue, 10 Nov 2026 18:34:59 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af363d3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=oEyNEHdnBLwiXqxlL4sA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=zi24ymS86KZJJV2BpVErFOsC/ir0LqXbftDkH/cpDNo=; b=CYhqvcQnb1Sw
	Oj15IldefEsyBWBnNGJRUnHl25N2ueOdvQyqtsNDabjaQTzp22BOThdPnVWhWXp/nN3RL6B3/i2VB
	hcmFm0LQrZ+jEkzw4cDlXIWnPtagqDKMFNFrroz7v3ypnMohAn3F2yBhpLEh4ZKKogl84RgdHcQrh
	B210YGT5AG6KWYiQDjUXHSg1wDfCxC0G3Jv7AWQmGnhbU/p9tItn6cDohIHPPmzCdYAnejwjosSjE
	w7ZlKatnB2Yg41nyXSa1y1zDO/4or6sQOeQK/s6dZbCDIbstcl27kp0NM4y1gZq8Ywb6Zqn4xuFW8
	zahXt3BMBAbGCY0cFQivjg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40292 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqgM-00000003Pjm-1cO9;
	Wed, 11 Nov 2026 00:04:58 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/10] hwmon: (mcp3021) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:29 -0800
Message-ID: <20261110183434.181711-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110183434.181711-1-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
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
X-Exim-ID: 1xQqgM-00000003Pjm-1cO9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40292
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 19
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMoAW3jqtz5hQYgEIHGI0dJl0JST3thJ6+ZE7/sSROkG0B+JWlADR1U+WPWgmljsMBHEeP1uB1mbfCkFUGFNN3UhSXG1mJ0TcdYbEtFnkgyOGyHzadj8
 aDrdSI96KXLrt7IGxNduk1OdO9pfqgynin6CSn4YK3deMje7zUXTFfUemXmz+E1RHJVBLhXT5vJTqXuHi7jAYHVZvjkVS6amI2JDFVu7MBceVXCszeSyPwg/

No in-tree boards supply platform data to the mcp3021 driver. Reference
voltage is already configurable via the "reference-voltage-microvolt"
devicetree property, defaulting to 3300 mV otherwise.

Drop platform data handling from mcp3021_probe().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/mcp3021.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index 087b595bf5ad..82b1363ab1c6 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -132,20 +132,10 @@ static int mcp3021_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, data);
 
-	if (np) {
-		if (!of_property_read_u32(np, "reference-voltage-microvolt",
-					  &data->vdd))
-			data->vdd /= 1000;
-		else
-			data->vdd = MCP3021_VDD_REF_DEFAULT;
-	} else {
-		u32 *pdata = dev_get_platdata(&client->dev);
-
-		if (pdata)
-			data->vdd = *pdata;
-		else
-			data->vdd = MCP3021_VDD_REF_DEFAULT;
-	}
+	if (!of_property_read_u32(np, "reference-voltage-microvolt", &data->vdd))
+		data->vdd /= 1000;
+	else
+		data->vdd = MCP3021_VDD_REF_DEFAULT;
 
 	type = (uintptr_t)i2c_get_match_data(client);
 	switch (type) {
-- 
2.45.2

