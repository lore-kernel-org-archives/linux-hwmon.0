Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335701;
	b=U0Qxsh5yq2t2Kje4att83prnntjy5s5m5dpMjcvCYIF80F+1qunagkuMNIK1JheUQlIq
	 9JJbBNnR/dAWMkIpKf2/SN9w0LE/chJSw+lhOzDSwZ4+emLcUnHHrPTo7LR41U0y2YJ0F
	 3UwKeWEB4g4N61Tx4WamWIMick+xWp2IdJ4LWYvK17RklY29a00kO3oNWkaX8fJtB/6mq
	 r9pB86pgZl+9DreyZNq7912pNCDFbvmMbpoJ8Mx14WhaWiQNNX5G83migrnB/gDgV9PFK
	 e5gA6Q1rSH1uo14DJ7hF8ui6sWqFgRMGI6CNtBHfagX2boyIM38XKaKtkstCVWC+u7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335701;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=R9CzSSsQP2AkGyjCXS8iICpOqMKzPtlVjQfsIWOY6zQ=;
	b=kofmoiamYuUzr+xia0LfEXMVQ+5vPaOPbYdvHHzQZevPamQ+c5575Wk/sFi8a2wyXgs+
	 uB30ADtihGD7hLuYwTX9rXqppG44ei0EjLOAmlRoPfXZ8Id0vDjLiKTICWEX4OrGwyyoM
	 1DbYNJAR/neRYG9oVELwkuHkyPPEXtKS4Tmg7M0vs9TTZkLghmqo3GOEC7ootPxG/OYUj
	 I5K2BOB1ZppB/Xb8+x+K56LFDsQvAZanDO4+tkb6sPaxG0Q/eAdL/HC5e5E8wc+X3Uueu
	 0ALfMGsth62yGhKeNUfHHFMof7y6qB1khBWIDw/9nIw2/UVvSbBAtBnMxZbn8Y4Kisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Cfh5eQEH;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A951606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A951606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Cfh5eQEH
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id QlWoxw5VOVK9UQqgPx6uBS; Tue, 10 Nov 2026 18:35:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QqgOxIJJZYskhQqgOxBpOj; Tue, 10 Nov 2026 18:35:00 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af363d5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=NcCfH-bgAAAA:8
 a=UEHLol0CrOqd3uxM8F0A:9 a=nlm17XC03S6CtCLSeiRr:22 a=nZLUJm6UEJn402BoZzOq:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=R9CzSSsQP2AkGyjCXS8iICpOqMKzPtlVjQfsIWOY6zQ=; b=Cfh5eQEHowku
	hTEbqosnf0gYiNBjuLGH5bfdawyRr2zb0daLPoH9tpAR9whRvYF1vrSWGb3ihjV8u5mF6lYn7zPFI
	VjxF56AubNL44EBBp0C1KMzb1B82d2BGjSc1gUslPRK+MsZjqWd8ET+RctGsytLHBPwEtvQsJIjCM
	LtGyFm3w2Z1cEMdpVfAyM6SLyOOuEP63epIjqGhCFQNYcOLDrbzAHo/BbQ6ImEd2dLACdun0IKilW
	aN0YoY2wIlhOIdcmzPNt88Lj3Sq4/2bBP79vl4TUxWIVXpwDU9UQ0/kBNbe30LzrXmqMdxwnSEECu
	pVxuKnOn+0prZSNtDHkvCg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40296 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqgO-00000003Pkn-0nFM;
	Wed, 11 Nov 2026 00:05:00 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/10] hwmon: (shtc1) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:30 -0800
Message-ID: <20261110183434.181711-8-linux@roeck-us.net>
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
X-Exim-ID: 1xQqgO-00000003Pkn-0nFM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40296
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPzGpKr6g5SUOqhxSnGa379PMB6FtMs0i8dLURBTAbJICQMMZ0CH12BkFUcxYg7dvn+vH152nU7454D2DRYhyibC0wabOKN5jzcRRp+Wyt4BorGJrife
 5yjxsCeI0GEezo85HpaKG0MYRYvg9hOg29SKlNkKgSnNl2VZxXZDP4yfILXJr0ypXJX2FpMPQA5EQflR+VnVQtSBIzKMHs7Nv7fZLGI21Y884SX2/lqkL6KY

There are no in-tree users of shtc1_platform_data. Blocking I/O and
measurement precision modes are already configurable via the
"sensirion,blocking-io" and "sensirion,low-precision" devicetree
properties.

Move blocking_io and high_precision directly into struct shtc1_data,
drop platform data support, remove the unused platform_data header file,
and update the driver documentation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/shtc1.rst       |  3 ++-
 drivers/hwmon/shtc1.c               | 23 ++++++++++-------------
 include/linux/platform_data/shtc1.h | 14 --------------
 3 files changed, 12 insertions(+), 28 deletions(-)
 delete mode 100644 include/linux/platform_data/shtc1.h

diff --git a/Documentation/hwmon/shtc1.rst b/Documentation/hwmon/shtc1.rst
index f38c4c9d2f74..d2c6d9b8f0e0 100644
--- a/Documentation/hwmon/shtc1.rst
+++ b/Documentation/hwmon/shtc1.rst
@@ -48,7 +48,8 @@ The device communicates with the I2C protocol. All sensors are set to I2C
 address 0x70. See Documentation/i2c/instantiating-devices.rst for methods to
 instantiate the device.
 
-There are two options configurable by means of shtc1_platform_data:
+There are two options configurable via devicetree properties (see
+Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml):
 
 1. blocking (pull the I2C clock line down while performing the measurement) or
    non-blocking mode. Blocking mode will guarantee the fastest result but
diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 54c240ca66f7..73613c882933 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/ktime.h>
-#include <linux/platform_data/shtc1.h>
 #include <linux/of.h>
 
 /* commands (high precision mode) */
@@ -62,7 +61,8 @@ struct shtc1_data {
 	const unsigned char *command;
 	unsigned int nonblocking_wait_time; /* in us */
 
-	struct shtc1_platform_data setup;
+	bool blocking_io;
+	bool high_precision;
 	enum shtcx_chips chip;
 
 	int temperature; /* 1000 * temperature in dgr C */
@@ -85,7 +85,7 @@ static int shtc1_update_values(struct i2c_client *client,
 	 * will wait until the data is ready. For non blocking mode, we
 	 * have to wait ourselves.
 	 */
-	if (!data->setup.blocking_io)
+	if (!data->blocking_io)
 		usleep_range(data->nonblocking_wait_time,
 			     data->nonblocking_wait_time + 1000);
 
@@ -171,15 +171,15 @@ ATTRIBUTE_GROUPS(shtc1);
 
 static void shtc1_select_command(struct shtc1_data *data)
 {
-	if (data->setup.high_precision) {
-		data->command = data->setup.blocking_io ?
+	if (data->high_precision) {
+		data->command = data->blocking_io ?
 				shtc1_cmd_measure_blocking_hpm :
 				shtc1_cmd_measure_nonblocking_hpm;
 		data->nonblocking_wait_time = (data->chip == shtc1) ?
 				SHTC1_NONBLOCKING_WAIT_TIME_HPM :
 				SHTC3_NONBLOCKING_WAIT_TIME_HPM;
 	} else {
-		data->command = data->setup.blocking_io ?
+		data->command = data->blocking_io ?
 				shtc1_cmd_measure_blocking_lpm :
 				shtc1_cmd_measure_nonblocking_lpm;
 		data->nonblocking_wait_time = (data->chip == shtc1) ?
@@ -231,17 +231,14 @@ static int shtc1_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	data->setup.blocking_io = false;
-	data->setup.high_precision = true;
+	data->blocking_io = false;
+	data->high_precision = true;
 	data->client = client;
 	data->chip = chip;
 
 	if (np) {
-		data->setup.blocking_io = of_property_read_bool(np, "sensirion,blocking-io");
-		data->setup.high_precision = !of_property_read_bool(np, "sensirion,low-precision");
-	} else {
-		if (client->dev.platform_data)
-			data->setup = *(struct shtc1_platform_data *)dev->platform_data;
+		data->blocking_io = of_property_read_bool(np, "sensirion,blocking-io");
+		data->high_precision = !of_property_read_bool(np, "sensirion,low-precision");
 	}
 
 	shtc1_select_command(data);
diff --git a/include/linux/platform_data/shtc1.h b/include/linux/platform_data/shtc1.h
deleted file mode 100644
index 5ba6f8f9a9a1..000000000000
--- a/include/linux/platform_data/shtc1.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2014 Sensirion AG, Switzerland
- * Author: Johannes Winkelmann <johannes.winkelmann@sensirion.com>
- */
-
-#ifndef __SHTC1_H_
-#define __SHTC1_H_
-
-struct shtc1_platform_data {
-	bool blocking_io;
-	bool high_precision;
-};
-#endif /* __SHTC1_H_ */
-- 
2.45.2

