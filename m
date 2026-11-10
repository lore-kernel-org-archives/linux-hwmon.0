Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335699;
	b=LcwXBNFNeZo17aeVt4l/E8NGyar0YVNX2ktiqjjx5kkB5Xi6fBOA4hyleS8+6PCnNPWh
	 eT1M1q382FmzkxSBTq4QU7I3BSZCjK0vTA3pYvZyG6K4Opm43o61nWxFcoWwoTLQ3Zcnj
	 plWMwzlJ+t9TFKO/7Sc9etihxS0XKgg15Zk7A2PW+xlwhUDDSfkHtyxu1/OkCAPXH/AFb
	 /WRQW1fX4idGPNIFzhy9dJ+XS8cF9aOugoFmATbeOb5UmAqJWWJ5RyE98H0aQiofZvgIt
	 HUQZNvJZznoocu2I0XE58A5bkTTdSB8y+czk98LQC9WmDOoks+HT8jsGBwdKPitps+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335699;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:
	 X-Source-Dir:X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:
	 X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=FPfKB8qzfwxemMTAgJjbjF3Xp5PedAXY0t/Kt0GpQq8=;
	b=hMDH8gDuKbS2gcbM2DnIWoBTr/GxMalRKvFKZh0vQNGnTVq07HZrq3TU388QakhTgUJ5
	 idAUPTLEatjG2Q8e4QXGhbZE0XwLxWXeTg6yiOf3rLuwk62wU6fGOj9qZjntxFaRk+tnZ
	 9pAwZOQRktvhWCipx9t94m3/AFeomkM7KPThmahJk0EDT9d66TqV7/mbIGjX1r1Q3RMuH
	 UGkj0YBkjMOPaXEcNdC6PQrOM0M8GhjB5RdDtZhmRq8N+0HVMA2jjcFJ+5X1ZjCIuLGxs
	 xCKUZAuQy3E/XIyYPxlzribPyoF1SQxSduMSGAHsVnFUADXj3YYFPwPdNsmmP8Sivhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nqXENxzo;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52D606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB52D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nqXENxzo
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id QoHtxxB3YVK9UQqgMx6u8F; Tue, 10 Nov 2026 18:34:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QqgLxs0gVlaNKQqgMxUnKO; Tue, 10 Nov 2026 18:34:58 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af363d2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=_jlGtV7tAAAA:8 a=nBbOBuCdSduJMU2T_2UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=FPfKB8qzfwxemMTAgJjbjF3Xp5PedAXY0t/Kt0GpQq8=; b=nqXENxzo+FIu
	3x2PXi7O5OgNcXX6NroD2OPOb6/9rxDEp7kmBv/P72bkyEIguoBHSVMgfoLpTvOKGfTRe07//NtEF
	YfrAhimJXIxNbQ4xx83ZlXU2Og7PMxdlbv4o1X5BzuiORnzd4S/pX7DPMtipzBdivag7pW6+6VW9c
	CqXmBJeehYo7lr8b5bFfzibGm8NKvkGxzCnoJXtPl+pMpuwT2nZqH6kpXoqvbwubLPEFKU13eeB33
	17/kXEVk+SOkqiQx54A5GMAztWd7gfJ8zekEEe410i5unqoBw91X83tKLh2XK6GbSaYqnV8TTUyNS
	adNztpQ5xLrYlcTW9Sa4Mw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40286 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqgL-00000003Pgw-2jel;
	Wed, 11 Nov 2026 00:04:57 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 05/10] hwmon: (ltc4245) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:28 -0800
Message-ID: <20261110183434.181711-6-linux@roeck-us.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQqgL-00000003Pgw-2jel
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40286
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 17
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJRqwnDcHPtUkxDWGt8eVtwbWjakypIdfmctVF0ZdACT4pTb52+0FBczty7jBBIYs9YhkA6/C1e/ow8viwtjL6zhBsRApIaArpTTm89jF8J58BzQaYPl
 NARAVTmrV8DLaKMWKuk1POEYp5NGudpJvWH+shj/2o+nlYCqLxTW8GVp+W4rdkwmsKlAl7EnU0YFOtEz6l/YN0I5Qjm2nnQjI7ckmkm32X7Sfek4wnQpg/Q3

There are no in-tree users of ltc4245_platform_data. Sampling all GPIO
pins as analog voltages is already configurable via the
"ltc4245,use-extra-gpios" devicetree property.

Drop platform data support from the driver, remove the unused
platform_data header file, and update the driver documentation.

Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ltc4245.rst       |  6 ++----
 drivers/hwmon/ltc4245.c               | 21 +++------------------
 include/linux/platform_data/ltc4245.h | 17 -----------------
 3 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 include/linux/platform_data/ltc4245.h

diff --git a/Documentation/hwmon/ltc4245.rst b/Documentation/hwmon/ltc4245.rst
index 3dafd08a4e87..0c3b823169b9 100644
--- a/Documentation/hwmon/ltc4245.rst
+++ b/Documentation/hwmon/ltc4245.rst
@@ -103,9 +103,7 @@ then they will be sampled in round-robin fashion. If userspace reads too
 slowly, -EAGAIN will be returned when you read the sysfs attribute containing
 the sensor reading.
 
-The LTC4245 chip can be configured to sample all GPIO pins with two methods:
-
-1) platform data -- see include/linux/platform_data/ltc4245.h
-2) OF device tree -- add the "ltc4245,use-extra-gpios" property to each chip
+The LTC4245 chip can be configured to sample all GPIO pins by adding the
+"ltc4245,use-extra-gpios" OF device tree property to each chip.
 
 The default mode of operation is to sample a single GPIO pin.
diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index e7fcf607a05e..7425c801cfe5 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -19,7 +19,7 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
-#include <linux/platform_data/ltc4245.h>
+#include <linux/of.h>
 
 /* Here are names of the chip's registers (a.k.a. commands) */
 enum ltc4245_cmd {
@@ -418,22 +418,6 @@ static const struct hwmon_chip_info ltc4245_chip_info = {
 	.info = ltc4245_info,
 };
 
-static bool ltc4245_use_extra_gpios(struct i2c_client *client)
-{
-	struct ltc4245_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = client->dev.of_node;
-
-	/* prefer platform data */
-	if (pdata)
-		return pdata->use_extra_gpios;
-
-	/* fallback on OF */
-	if (of_property_read_bool(np, "ltc4245,use-extra-gpios"))
-		return true;
-
-	return false;
-}
-
 static int ltc4245_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
@@ -448,7 +432,8 @@ static int ltc4245_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	data->use_extra_gpios = ltc4245_use_extra_gpios(client);
+	data->use_extra_gpios = of_property_read_bool(client->dev.of_node,
+						      "ltc4245,use-extra-gpios");
 
 	/* Initialize the LTC4245 chip */
 	i2c_smbus_write_byte_data(client, LTC4245_FAULT1, 0x00);
diff --git a/include/linux/platform_data/ltc4245.h b/include/linux/platform_data/ltc4245.h
deleted file mode 100644
index f07fa05ea6c4..000000000000
--- a/include/linux/platform_data/ltc4245.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Platform Data for LTC4245 hardware monitor chip
- *
- * Copyright (c) 2010 Ira W. Snyder <iws@ovro.caltech.edu>
- */
-
-#ifndef LINUX_LTC4245_H
-#define LINUX_LTC4245_H
-
-#include <linux/types.h>
-
-struct ltc4245_platform_data {
-	bool use_extra_gpios;
-};
-
-#endif /* LINUX_LTC4245_H */
-- 
2.45.2

