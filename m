Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669824;
	b=10U7CzciTUqIpyVhfevmmf2sqp4zz+4U3tcCE1dAFOVhdhAcsgGeYBjwutMmZ+8uG7QN
	 xTgN7wMJ6mtxrSnSbFvSgYcbu9EDh5hd5FwV13ZXJ9lHRCLd0OFqLGfsCOBPlslGelr13
	 RvcON0zscF9kCKRfBaMWktnG2D240c9gEBkmVBpks1HPMRxVZCO+Bh17k7v38KbmnpFrh
	 3tTvgvTTCwOjTJ7hysNx/J2xl2Dj231IhamOP+92Q6dWx41o/ODRRzNjL99/CKjaU1lrf
	 ZeQb7lGdpLO1CIvJyEIRF8tJ4xwklO5HtPWEy8Jn7N0U8A8nRlB1KNT+Lc8y0Z6y7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669824;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=DNpvNUhjVhSwQcyDsBC24omUeX+bFrgAN0vFu7SLGD4=;
	b=wdCBuKfTlhB86XGJNQAX6DN63qmeLI9Bf0EOkDAGl9qToLp1v0GWFhNkCJ+UOanPlYqN
	 5RIpCXU0MVOEjMQ99ib3yTHQS4D2h+tqLJxlnXUB3mtMEJ8aiWVUupgDSY/mjM5nlbYKc
	 REeI1JGmLeoTuUFoUJjHz6pjXzY/Grx0IyEbap0mu5Q4elglaqeHDTnC1pLHUD0riElaQ
	 PGsymiFoyqPJiXkjGMIgVPS0zEppyC+vPdwYhizAEZNv+VgrIE0s3jxhULUX3hTkhTQQe
	 Z/2ByaEMhqmFS5ViVPMdcLqiIdSPvBXh6Rvmv8+uRaPIP7MwuH/B/uslrcH7UPkCigA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iWmEqiYh;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4970C606A326
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4970C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iWmEqiYh
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id NvOAxGEqGaC0UO3SMxXoNZ; Tue, 03 Nov 2026 01:36:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3SLxZegV0ULmO3SLxPEcY; Tue, 03 Nov 2026 01:36:58 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae93aba
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8
 a=0WwscR4uC4tNuQFZKTQA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=DNpvNUhjVhSwQcyDsBC24omUeX+bFrgAN0vFu7SLGD4=; b=iWmEqiYhb+pu
	j9hm9383r3pjSa9UQ93qC5d0iQbLzJ28piJ1RCZR/Gxaa5CaZrc31J28sfAR8BSKbE8ROxBwMkUil
	vzDNj9r/2NESVBfDxjBmDy8auzOi+ThE25oP/erNJOT9rJqOOlfRzOR5zovl6CHcwiQkUso4SkeCg
	6T2c6MUkvKhmt/hmDFjMeyOK+t271+Aipwev6/+lQZuP+ClXntmM4Pn+3GMwqySfgpIXShQ7Uly04
	SKqf8qnpkhJTgQXaXhADiwVtdP53R0ZWcf0DLMROyAs7XKLDwwGZJwRCDXjMO1rqKGfJyzHZ47oIm
	rMTzSlDjkgFGrm3LKo36hA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38170 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wY-00000003lvI-2fdg;
	Tue, 03 Nov 2026 04:25:58 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH 071/102] hwmon: (peci) Use 64-bit jiffies for sensor update timestamps
Date: Mon,  2 Nov 2026 14:52:04 -0800
Message-ID: <20261102225235.334487-72-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wY-00000003lvI-2fdg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38170
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKRNRzODelgUELisAOUR4LiPBeeoiVsXKlaLaXlNyxVzuKJmKpsQOy0zYFxaIVeAJWKTKycdGlHMEkXabCgS8ooE957RKEXf8OqXRBwsVoge8W1r13j7
 RlL8+4FmMHbQqK0G1YbBn/qeJLkl1xlyQ4O7jvtGfMsEQpq/AJRYuExEan/owELF6Dp3XHBcj4AvVHaVyk1/atht+2RLRcoZmcDsFUm1km+U2J4a60WjeJBK

The PECI hwmon drivers (cputemp and dimmtemp) use 32-bit jiffies and
time_after() in struct peci_sensor_state to determine when cached sensor
readings should be refreshed. On 32-bit architectures, if a sensor is
not polled for about 24.8 days at HZ=1000, time_after() wraps around and
cached values stop updating.

Switch last_updated in struct peci_sensor_state to u64 and use
get_jiffies_64() with time_after64() to avoid wrap-around issues on
32-bit systems.

Fixes: bf3608f338e9 ("hwmon: peci: Add cputemp driver")
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/peci/common.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
index 5eae9681e385..5495907ab46d 100644
--- a/drivers/hwmon/peci/common.h
+++ b/drivers/hwmon/peci/common.h
@@ -1,11 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2021 Intel Corporation */
 
-#include <linux/types.h>
-
 #ifndef __PECI_HWMON_COMMON_H
 #define __PECI_HWMON_COMMON_H
 
+#include <linux/jiffies.h>
+#include <linux/types.h>
+
 #define PECI_HWMON_UPDATE_INTERVAL	HZ
 
 /**
@@ -15,7 +16,7 @@
  */
 struct peci_sensor_state {
 	bool valid;
-	unsigned long last_updated;
+	u64 last_updated;
 };
 
 /**
@@ -39,7 +40,8 @@ struct peci_sensor_data {
 static inline bool peci_sensor_need_update(struct peci_sensor_state *state)
 {
 	return !state->valid ||
-	       time_after(jiffies, state->last_updated + PECI_HWMON_UPDATE_INTERVAL);
+	       time_after64(get_jiffies_64(),
+			    state->last_updated + PECI_HWMON_UPDATE_INTERVAL);
 }
 
 /**
@@ -49,7 +51,7 @@ static inline bool peci_sensor_need_update(struct peci_sensor_state *state)
 static inline void peci_sensor_mark_updated(struct peci_sensor_state *state)
 {
 	state->valid = true;
-	state->last_updated = jiffies;
+	state->last_updated = get_jiffies_64();
 }
 
 #endif /* __PECI_HWMON_COMMON_H */
-- 
2.45.2

