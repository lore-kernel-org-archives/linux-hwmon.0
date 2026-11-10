Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335714;
	b=haUJdWOWoS6TzNWAETPoUiO6w8muI1cs5fx5QmYHD7dDVAufuBgXHBPuEcjVFgfTegF0
	 fw9jAe+BqLtVEoLgTYe1qPZ7SX9PqPbm5C1HxP0SCbgFhfWvpcVblhGP2kV/mK9PtFkWj
	 nRtkRwHcNYGT+FGYoGaPdyhaLWbGNzrIEFjoeF9sEsPGddfetbJ0yA7/JJcJVnNGVUoHH
	 A6l8wIsXHybRIC15LNQMUb3oECvHaN95Kb/K7z/jEppESzfXfxRm/Ticvf9dOZE7WAJLc
	 /TNEHTjDKCFGpMaYfa7YCiwkjRucet2qRottqd/ooqiQEXDD2z4HRDF0ztk4TO61tdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335714;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:
	 X-Source-Dir:X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:
	 X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=/fz2XHV3x/JuaPm9QpVF667qT2HxlcYlHf1VODn9jtg=;
	b=TkMywkprE1aL0WvTOfvfy8GBrjVuZAOQo0P2Ja29Ds4l3oabqTJotQS7qzMWWpeDozM8
	 4ntlonNFRWZRJisUaJFvJuaFXmeHuwFUZPSGByO0y10SRsGFIZ+4vj15qud72drhtXYa+
	 Kbpb+Ke6INYuB9024zzmAhV8NCGgw6kKWjE/1OIJqznT0oIGTtiEHkZAEweQ/QDnpnpWG
	 4b4rnTj3w1bdlbJDQOyDO2fDfuHAeHDvpSLOwfEFel8AZO0DdWpjG6MxFqnzs43s/Vyfg
	 gzO/fUDpFzlGVjEPCtUG4RTTS/8s/fzt/yAes/tA/uqp4tczYtSdvRwEE8Np55z5jwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JJSBRgWB;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D7606A32D
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 441D7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JJSBRgWB
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id QmsbxwWRJVK9UQqgbx6uTA; Tue, 10 Nov 2026 18:35:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QqgbxGl6Oxmi7QqgbxlPAB; Tue, 10 Nov 2026 18:35:13 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af363e1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=_jlGtV7tAAAA:8 a=RzG1EKh0fK6INuvh2KUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=/fz2XHV3x/JuaPm9QpVF667qT2HxlcYlHf1VODn9jtg=; b=JJSBRgWBOUje
	/FY938vT1V+cn2SEYwh0Utk/3KFoV/2J4GvEyXNswMaApJcBubG6AAqa2kVyw4SeA/I2XMoDv/ROf
	dSmocZ4Wxweb6qPaCe+z6Wfvkk8+RtBLOhTYF0QvsxlOLGgSyeyTDREBQ+9ggi2UbGhu83u7XOfcW
	McTxAap6KoeAzCVdr66E07KjyTOdZMXCDYYZbTj8PJ4bpeX3yxPfJFBP/nTaVgKT04VqRlXPV3P5o
	l+brRIkkxIhPBgczH194S/uPDIe+OkvP84CGSvYvktqP3aMcuWmfNVp2xX9lXUjGpbDDGqL4OvXE0
	hkpG4ycWdpskCENeqTSBSg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45290 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqga-00000003Psw-44BV;
	Wed, 11 Nov 2026 00:05:13 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 10/10] hwmon: (ds620) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:33 -0800
Message-ID: <20261110183434.181711-11-linux@roeck-us.net>
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
X-Exim-ID: 1xQqga-00000003Psw-44BV
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45290
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 30
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJqscm0ugQPSQ8+Q2x7mfkaUmTidtDp+f04JZ64l5eBjwLb1GZwiSB2JsDtWE8sM5K9j5UBWC5auTNQ0XchjHrtcNdeD/Ga59jcLyHDNslJCPo39tc6i
 zxQ6QRsGaa0/9ssLGdm1BYPih6Cpf1gx9tOR+PMSx+uB3cgG+dSusTNGW3a6B0+3dQnMctbn9B4yxaFlBqjfxUW19JkZb6P5rjwvSn90qp792/IJ7ziuUQoW

There are no in-tree users of ds620_platform_data. Without platform
data, the driver clears PO2 to keep the thermostat output pin low,
which is the default valid configuration.

Drop platform data support from the driver, remove the unused
platform_data header file, and update the driver documentation.

Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ds620.rst       | 12 +-----------
 drivers/hwmon/ds620.c               | 13 ++-----------
 include/linux/platform_data/ds620.h | 22 ----------------------
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 include/linux/platform_data/ds620.h

diff --git a/Documentation/hwmon/ds620.rst b/Documentation/hwmon/ds620.rst
index e2d915a988a2..6a18ecea5c4f 100644
--- a/Documentation/hwmon/ds620.rst
+++ b/Documentation/hwmon/ds620.rst
@@ -25,14 +25,4 @@ into non-volatile on-chip registers). Temperature range is -55 degree Celsius
 to +125. Between 0 and 70 degree Celsius, accuracy is 0.5 Kelvin. The value
 returned via sysfs displays post decimal positions.
 
-The thermostat function works as follows: When configured via platform_data
-(struct ds620_platform_data) .pomode == 0 (default), the thermostat output pin
-PO is always low. If .pomode == 1, the thermostat is in PO_LOW mode. I.e., the
-output pin PO becomes active when the temperature falls below temp1_min and
-stays active until the temperature goes above temp1_max.
-
-Likewise, with .pomode == 2, the thermostat is in PO_HIGH mode. I.e., the PO
-output pin becomes active when the temperature goes above temp1_max and stays
-active until the temperature falls below temp1_min.
-
-The PO output pin of the DS620 operates active-low.
+The thermostat output pin PO is configured to be always low.
diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index efb005bedabb..17ae9cc72761 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -17,7 +17,6 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/sysfs.h>
-#include <linux/platform_data/ds620.h>
 
 /*
  * Many DS620 constants specified below
@@ -64,7 +63,6 @@ struct ds620_data {
 
 static void ds620_init_client(struct i2c_client *client)
 {
-	struct ds620_platform_data *ds620_info = dev_get_platdata(&client->dev);
 	u16 conf, new_conf;
 
 	new_conf = conf =
@@ -72,15 +70,8 @@ static void ds620_init_client(struct i2c_client *client)
 
 	/* switch to continuous conversion mode */
 	new_conf &= ~DS620_REG_CONFIG_1SHOT;
-	/* already high at power-on, but don't trust the BIOS! */
-	new_conf |= DS620_REG_CONFIG_PO2;
-	/* thermostat mode according to platform data */
-	if (ds620_info && ds620_info->pomode == 1)
-		new_conf &= ~DS620_REG_CONFIG_PO1; /* PO_LOW */
-	else if (ds620_info && ds620_info->pomode == 2)
-		new_conf |= DS620_REG_CONFIG_PO1; /* PO_HIGH */
-	else
-		new_conf &= ~DS620_REG_CONFIG_PO2; /* always low */
+	/* thermostat output pin always low */
+	new_conf &= ~DS620_REG_CONFIG_PO2;
 	/* with highest precision */
 	new_conf |= DS620_REG_CONFIG_R1 | DS620_REG_CONFIG_R0;
 
diff --git a/include/linux/platform_data/ds620.h b/include/linux/platform_data/ds620.h
deleted file mode 100644
index f0ce22a78bb8..000000000000
--- a/include/linux/platform_data/ds620.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _LINUX_DS620_H
-#define _LINUX_DS620_H
-
-#include <linux/types.h>
-#include <linux/i2c.h>
-
-/* platform data for the DS620 temperature sensor and thermostat */
-
-struct ds620_platform_data {
-	/*
-	 *  Thermostat output pin PO mode:
-	 *  0 = always low (default)
-	 *  1 = PO_LOW
-	 *  2 = PO_HIGH
-	 *
-	 * (see Documentation/hwmon/ds620.rst)
-	 */
-	int pomode;
-};
-
-#endif /* _LINUX_DS620_H */
-- 
2.45.2

