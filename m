Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335685;
	b=HY20Puqz6TdWc28N9nV/NAQfQtzAtfkPnKFaEEphu1tjF2RGQzjFa3XwuysbZKD7lo/Q
	 asoPM0YKsM1EDMHgBrkswGcVFqEYQlpbrZON+v24GiM/5sZOubju3TIq4RlvYAcyh3Ymu
	 /cij37cZqs3vQXsjabbBOvl66pe6PYBHaQ6hUzHyYIaelAh+FrZv2EtrBIqXnri8IxRb/
	 y5LK8lylSiXjTmBTYQ49Rzm1p7qH6hVotHiesQquhUrgWl6BkFLnmXOBxTL/yDi63dyum
	 GFAaWO7kEZrQy2Cb7s1sGzMrGmEcq9wYRPQvXjEzhNDYW3NUGBLoohxAkG8KtkajvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335685;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ogB/4Ie6c/mb7EJ2qqGE5NZ2cuANqix+gh1bCfWwIrI=;
	b=J7ciuKfS6zATMNtEQUVvZjQmVGu8t2AkWTKlL3mBUnZOgrl34sXnyBQE8IvEyf14oaGq
	 8bk4iTAnoruGoSE/prHo0ewOyTy5C/oD8vhIgq4olkBmblWi/B4FO+4EdXyEnfdGrZQaj
	 iZDwUWgZiYlNrKdUuMFMCm+/IotNVePN6nHQVNYFfzPHhMIe9emlYzN/SFZlWI5CKvwqg
	 HOhreaO+FbqjBdqQ5NcVOSjpG7jcqUP+KyNPVwPK5uFqYyYHgu1QCBBKNNE1ZRCf/2YlY
	 TG8o/nip0afm0j4rcZk9BYUcHuQdOMthwJ9QDQEBFSXjIqd1OMT7D++E+bjubXGjtcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="4r6L/dFY";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08F606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C08F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4r6L/dFY
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id QmCixwFa1VK9UQqg8x6toY; Tue, 10 Nov 2026 18:34:44 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qqg7xse3vdRrRQqg7xQXar; Tue, 10 Nov 2026 18:34:43 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af363c4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=dRNrYt_hAAAA:8
 a=_kA9PJ2qMrRk6JNiwz0A:9 a=nlm17XC03S6CtCLSeiRr:22 a=UH8RX7gv5XnRAaf1WCu2:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ogB/4Ie6c/mb7EJ2qqGE5NZ2cuANqix+gh1bCfWwIrI=; b=4r6L/dFY/udr
	GkgSHyMaN17PX2T7m0IviPvdEsHC9YlAkmd7kP3sG10PvPPe6fPK+0larjj4RDGEwQtUbJDEU7qBE
	1P46dk9H/mFiSNmFwM8aS7tc9pTSpx7ccvvdtGkOPZWgoXi1+SH87ELy732qBZxWdz4cL3vBJzTOf
	R0DSwPx5UU1t7JRt3Xioj0XBWlNqh4k4L/2xAf1KsBkSu6OosSIwAyfS8PadGpCrap8b5jzyYMYOH
	aH7PA97/WEzgquHuP3OkuK0e6BLrwwMt8PHdEjmOp7lWEvASa7+FfHrvt7KUR/QXrWv9H/YL+rCqf
	y8iVjEpOAsX5gstP/dtYFQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52530 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqg7-00000003PbL-0lTu;
	Wed, 11 Nov 2026 00:04:43 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/10] hwmon: (g762) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:26 -0800
Message-ID: <20261110183434.181711-4-linux@roeck-us.net>
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
X-Exim-ID: 1xQqg7-00000003PbL-0lTu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52530
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLV98EeN/HI0s5Xe9mzBMLsejk/YMnEypnxgiXynKQ1ffHSmC//cXENnABGrgMnx7OkS3422TWH4t12cDl//3GfRLjMaH8vdpSu9tW9EZ5dQEMHIdA2j
 DJBV2x+Ehm//vs7xOmu9YMxobZl2ZgfLakJdm8rDVdVZEQ5yQyRuF3lDAt/+pX3ZDuJ0czWsV9WZZV46xSd+UMbc3dGuDng0rgQgChU/my19i3OqTz1ndlsI

There are no in-tree users of g762_platform_data. All hardware
parameters configurable through platform data (input clock, fan gear
mode, PWM polarity, and fan startup voltage) are already configurable
via devicetree properties.

Drop platform data support and the now-unnecessary CONFIG_OF guards from
the driver, remove the unused platform_data header file, and update the
driver documentation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/g762.rst       |  4 +--
 drivers/hwmon/g762.c               | 50 ++----------------------------
 include/linux/platform_data/g762.h | 24 --------------
 3 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 include/linux/platform_data/g762.h

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index f224552a2d3c..6c95040870b6 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,9 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
-using a specific platform_data structure in board initialization
-file (see include/linux/platform_data/g762.h).
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml.
 
   fan1_target:
 	    set desired fan speed. This only makes sense in closed-loop
diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 1a4aeb6db7d4..26ab00f4d130 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -39,7 +39,6 @@
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/platform_data/g762.h>
 
 #define DRVNAME "g762"
 
@@ -568,7 +567,6 @@ static int do_set_fan_startv(struct device *dev, unsigned long val)
  * those to the chip.
  */
 
-#ifdef CONFIG_OF
 static const struct of_device_id g762_dt_match[] = {
 	{ .compatible = "gmt,g761" },
 	{ .compatible = "gmt,g762" },
@@ -695,46 +693,6 @@ static int g762_of_prop_import(struct i2c_client *client)
 				       do_set_fan_startv);
 }
 
-#else
-static int g762_of_prop_import(struct i2c_client *client)
-{
-	return 0;
-}
-
-static int g762_of_clock_enable(struct i2c_client *client)
-{
-	return 0;
-}
-#endif
-
-/*
- * Helper to import hardware characteristics from .dts file and push
- * those to the chip.
- */
-
-static int g762_pdata_prop_import(struct i2c_client *client)
-{
-	struct g762_platform_data *pdata = dev_get_platdata(&client->dev);
-	int ret;
-
-	if (!pdata)
-		return 0;
-
-	ret = do_set_fan_gear_mode(&client->dev, pdata->fan_gear_mode);
-	if (ret)
-		return ret;
-
-	ret = do_set_pwm_polarity(&client->dev, pdata->pwm_polarity);
-	if (ret)
-		return ret;
-
-	ret = do_set_fan_startv(&client->dev, pdata->fan_startv);
-	if (ret)
-		return ret;
-
-	return do_set_clk_freq(&client->dev, pdata->clk_freq);
-}
-
 /*
  * sysfs attributes
  */
@@ -1085,7 +1043,7 @@ static int g762_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->update_lock);
 
-	/* Get configuration via DT ... */
+	/* Get configuration via DT */
 	ret = g762_of_clock_enable(client);
 	if (ret)
 		return ret;
@@ -1096,10 +1054,6 @@ static int g762_probe(struct i2c_client *client)
 		return ret;
 
 	ret = g762_of_prop_import(client);
-	if (ret)
-		return ret;
-	/* ... or platform_data */
-	ret = g762_pdata_prop_import(client);
 	if (ret)
 		return ret;
 
@@ -1111,7 +1065,7 @@ static int g762_probe(struct i2c_client *client)
 static struct i2c_driver g762_driver = {
 	.driver = {
 		.name = DRVNAME,
-		.of_match_table = of_match_ptr(g762_dt_match),
+		.of_match_table = g762_dt_match,
 	},
 	.probe = g762_probe,
 	.id_table = g762_id,
diff --git a/include/linux/platform_data/g762.h b/include/linux/platform_data/g762.h
deleted file mode 100644
index 249257ee2132..000000000000
--- a/include/linux/platform_data/g762.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Platform data structure for g762 fan controller driver
- *
- * Copyright (C) 2013, Arnaud EBALARD <arno@natisbad.org>
- */
-#ifndef __LINUX_PLATFORM_DATA_G762_H__
-#define __LINUX_PLATFORM_DATA_G762_H__
-
-/*
- * Following structure can be used to set g762 driver platform specific data
- * during board init. Note that passing a sparse structure is possible but
- * will result in non-specified attributes to be set to default value, hence
- * overloading those installed during boot (e.g. by u-boot).
- */
-
-struct g762_platform_data {
-	u32 fan_startv;
-	u32 fan_gear_mode;
-	u32 pwm_polarity;
-	u32 clk_freq;
-};
-
-#endif /* __LINUX_PLATFORM_DATA_G762_H__ */
-- 
2.45.2

