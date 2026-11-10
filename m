Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335687;
	b=vUbb3Vls0ovAmwP8K6azb/fP+W56cBmqHnrZJO4WXuzsVkkJL4J3Y3tY/mp1qAiJdxX7
	 sMHkJkTyiW8wOr+RQ9liawlAACN5qmHaOltHmLE1wvVjGJQKI5JUNHDuEPNcpf/PT5hmA
	 YT8AxLse9+bJoHNPZK/GTsg5RF0SFMeYlTAdt17Z+mWp1T+i3incS54+wojmi7a5GsigW
	 1e8RbxKyjm4IpPS7lfLdV4YcDpRgX/JiO1vdDa8wOpmRv0SyNJSmiAQ8lNgaOGsaQpPYN
	 WCnaJxg/ax8mZPFQsq8ACqkCU7wg2QQhljiKFuwyqlSVcaw/E0WjJXSszOvQuxgqXjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335687;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=NW8bt1FmEXrP5neyKAXi9zyzQsOZLoEJnRVUfzLGEJ0=;
	b=QC+XZxllMzCEOk9WNjgPIVH6nFZAFkWqW+Fp4GU4YVNJlCpWnD/G6yaRFsFF1+yigYib
	 j6AGYD3U1tfouHbZo8JJNUn6W4TxLPQ5Qi7bczend+x7Gs3bxoXGfjuzlMKOAPeAeOsbY
	 zGE/hEAH/ra3OgpCX/pLkD54qpiB8Zgi3MhdNrzdVZU5BmHf8naXzfZg9QatZcaOSE18X
	 AKoikTdig2+F+0XqNp9i9U6JH3KNrZDtqOl1ycbe6qOEMuU1ZL1fJ8U1UOGKll2ffNNtT
	 78l2MQerXRXYBtLa+BzC0VWHqnKbEAy5+837WlLQg0E+KLu/ELcSUvCWeY4+Eiyt+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yL7xVkCI;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D98606A320
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yL7xVkCI
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id QmPnxb6R3JFmFQqg4xJBEm; Tue, 10 Nov 2026 18:34:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qqg3xIIkEYskhQqg3xBotR; Tue, 10 Nov 2026 18:34:39 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af363c0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=aRxQL1JOAAAA:8
 a=zJWBItJmGMB6rj6yPcIA:9 a=nlm17XC03S6CtCLSeiRr:22 a=lBRdisTmIr2YKkuu8atg:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=NW8bt1FmEXrP5neyKAXi9zyzQsOZLoEJnRVUfzLGEJ0=; b=yL7xVkCIZKBS
	juEc/W3dFl+4aqY4/1FY00cf7Gff0eoXcoYl2RK6eH5E3pRrSfG8IYUv/BhQiQ9JT7R4DC/zsvY+n
	mtpYfz6/lxgb7I7V/dcdt8ifL1y530BqW3Y0EujUnvkdpQ5aFC5RAwTgmlAIlpuwZsdekMSumpbHJ
	iDFxxyObXMP7sqqZUSqH9RX5ZFwW67quM3D+0OB82pz+68IQ3nGQQV7XdmPrzAV5btCsboKE4DK7P
	GypAaEDzRj8GpHovNOj7SqXMYaIKeUOJjwew5iC9PzsKjHYpJ0ZNfzo+4e7oZNqqBUx7zKiu8+QdS
	HLPRvsjZ7YsJGCOqbBHC6g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52524 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqg3-00000003PYI-0rlQ;
	Wed, 11 Nov 2026 00:04:39 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/10] hwmon: (ads7828) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:24 -0800
Message-ID: <20261110183434.181711-2-linux@roeck-us.net>
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
X-Exim-ID: 1xQqg3-00000003PYI-0rlQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52524
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHJbztDGc3g6Ghg0i5PdDm6curqQFA+u7ERjBMu9n73hS8cCZQjqzuaTTpSEJi1UEb9lHPcJeV5MO1cTbrQnmFeP+BviOdVVcgu0QwxdejIQUXEgQrlb
 qyDdgHs+frMsxGqjOHcAiAknd3+bQv9KkO356YBAA54l4trMCDOrgR338FKxYw2VpMIVVBrjNU/uaq+9thnQ260iB1XVoNXzWcWxOvx4a+2YHierczutsBy7

There are no in-tree users of ads7828_platform_data. The driver already
supports configuring differential input mode and external reference
voltage via devicetree properties ("ti,differential-input" and the
"vref" regulator supply).

Drop platform data support from the driver, remove the unused
platform_data header file, and update the driver documentation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ads7828.rst       | 21 ---------------------
 drivers/hwmon/ads7828.c               | 13 +------------
 include/linux/platform_data/ads7828.h | 26 --------------------------
 3 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 include/linux/platform_data/ads7828.h

diff --git a/Documentation/hwmon/ads7828.rst b/Documentation/hwmon/ads7828.rst
index b830b490cfe4..7aaafa489e4f 100644
--- a/Documentation/hwmon/ads7828.rst
+++ b/Documentation/hwmon/ads7828.rst
@@ -24,27 +24,6 @@ Authors:
 	- Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 	- Guillaume Roguez <guillaume.roguez@savoirfairelinux.com>
 
-Platform data
--------------
-
-The ads7828 driver accepts an optional ads7828_platform_data structure (defined
-in include/linux/platform_data/ads7828.h). The structure fields are:
-
-* diff_input: (bool) Differential operation
-    set to true for differential mode, false for default single ended mode.
-
-* ext_vref: (bool) External reference
-    set to true if it operates with an external reference, false for default
-    internal reference.
-
-* vref_mv: (unsigned int) Voltage reference
-    if using an external reference, set this to the reference voltage in mV,
-    otherwise it will default to the internal value (2500mV). This value will be
-    bounded with limits accepted by the chip, described in the datasheet.
-
- If no structure is provided, the configuration defaults to single ended
- operation and internal voltage reference (2.5V).
-
 Description
 -----------
 
diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 261978af17c5..7cc379192375 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -19,7 +19,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_data/ads7828.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
@@ -102,7 +101,6 @@ static const struct regmap_config ads2830_regmap_config = {
 static int ads7828_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct ads7828_platform_data *pdata = dev_get_platdata(dev);
 	struct ads7828_data *data;
 	struct device *hwmon_dev;
 	unsigned int vref_mv = ADS7828_INT_VREF_MV;
@@ -116,12 +114,7 @@ static int ads7828_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	if (pdata) {
-		diff_input = pdata->diff_input;
-		ext_vref = pdata->ext_vref;
-		if (ext_vref && pdata->vref_mv)
-			vref_mv = pdata->vref_mv;
-	} else if (dev->of_node) {
+	if (dev->of_node) {
 		diff_input = of_property_read_bool(dev->of_node,
 						   "ti,differential-input");
 		vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
@@ -139,10 +132,6 @@ static int ads7828_probe(struct i2c_client *client)
 
 	chip = (uintptr_t)i2c_get_match_data(client);
 
-	/* Bound Vref with min/max values */
-	vref_mv = clamp_val(vref_mv, ADS7828_EXT_VREF_MV_MIN,
-			    ADS7828_EXT_VREF_MV_MAX);
-
 	/* ADS7828 uses 12-bit samples, while ADS7830 is 8-bit */
 	if (chip == ads7828) {
 		data->lsb_resol = DIV_ROUND_CLOSEST(vref_mv * 1000, 4096);
diff --git a/include/linux/platform_data/ads7828.h b/include/linux/platform_data/ads7828.h
deleted file mode 100644
index 0fa4186c6171..000000000000
--- a/include/linux/platform_data/ads7828.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * TI ADS7828 A/D Converter platform data definition
- *
- * Copyright (c) 2012 Savoir-faire Linux Inc.
- *          Vivien Didelot <vivien.didelot@savoirfairelinux.com>
- *
- * For further information, see the Documentation/hwmon/ads7828.rst file.
- */
-
-#ifndef _PDATA_ADS7828_H
-#define _PDATA_ADS7828_H
-
-/**
- * struct ads7828_platform_data - optional ADS7828 connectivity info
- * @diff_input:		Differential input mode.
- * @ext_vref:		Use an external voltage reference.
- * @vref_mv:		Voltage reference value, if external.
- */
-struct ads7828_platform_data {
-	bool diff_input;
-	bool ext_vref;
-	unsigned int vref_mv;
-};
-
-#endif /* _PDATA_ADS7828_H */
-- 
2.45.2

