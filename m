Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660024;
	b=AiZyhtqjAIre/4tFwFdOOpodedU0BVwI9qs/G0/y9pwJMgwYarNPWJtDx01W74kwzb83
	 NqeBek2P0kfFMOX0Cs/pkoJnkR97eYwtyf+/CAEvdplD+vV8lZBHpV4urkuoNfra43TRY
	 vfhU/rShTnGfu2nletKb+wbS9YH8stk+N2dE38ll+Mk9gHKjlHURwImo5oiN18/pr1Pyt
	 a64N6TteeJSba5lCGmZoYpNh7S/M2U880dt/xJUvelvVSIQdK+cZygHMFxIKVQC2dgwcS
	 W6rkp1rW/zKZbG7dZygQnw4FTG7aoPvT7AoRVXVtE3qsVFe61SriykNgiehcPng4Y5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660024;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=hIX5bnVHHV4kBnCBt/pc3X9HlQe0W4E/pxOoWosU6ts=;
	b=gbdqkrmCUfJc9H+cTk5eMZUIH24vKwA7M9USPUr4c3lvemjd5qBfmwBOnaXhLKSRb6F6
	 b9Aphn8V+NiSSc7ShQu2MbNn3gfwk8ndl4/ar/K6lExt/5mJ7MelfFKlxmfdTjzOawb9z
	 bUMQHdzImq1G0ycnXMGNpMXhIM3JzPUQpl7R2wvLkqedzYh4dseafkxGH03GaMIpis4RL
	 wyAm1eNRZL69ck6V495sOjpuXaQw2DFt3+cjGAJJYajsn1k9fVpWpNPs9kkl6lDEtosQz
	 xPUPXi96vbg1Z03x0BqqJ7a7+af9vo/7fGqQXbKopksdf22OCdBVQOgkU8gVSEmA/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=HDoDEIqg;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7D606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B7D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=HDoDEIqg
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id NwKDxRzqDMylkO0uNx1riy; Mon, 02 Nov 2026 22:53:43 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uNxTiWz1fkWO0uNxurCo; Mon, 02 Nov 2026 22:53:43 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae91477
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=2x7NoFe9oRDcSR7h2iIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=hIX5bnVHHV4kBnCBt/pc3X9HlQe0W4E/pxOoWosU6ts=; b=HDoDEIqgi/wO
	srslNLwBeOA9upIkfybO/AU3UHCeplaAlyhBDOOJ/ELS0/a7p95eBwUoIgQOOzWayOvZm3QqwAcfq
	5+S43rPOZwVe41VwNKFmhOzyG7+qmr3eJWSGBQOfn+OPJnijXZu+vLNLiPz6hBYhuSjbFo9FqcXlV
	3AhnIMbb3T/KDKNThCG7yb1QNwZwXobkYB5zA7Ci4PKG1Wl20+0ifN5mI1AqJp+JOPwFU5RDL8HPJ
	h0L8Vkondw34H9JjfHUO2Jzv++gNjYB97VjuAWiztXSeyNBJPYBjFKCKkYVn6nkV9kbJOerNiYbug
	/M6rnbI2of2ZQg9vjN471g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33206 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uM-00000003kX8-3ekY;
	Tue, 03 Nov 2026 04:23:42 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 023/102] hwmon: (ds1621) Use ktime for update timestamp
Date: Mon,  2 Nov 2026 14:51:16 -0800
Message-ID: <20261102225235.334487-24-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uM-00000003kX8-3ekY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33206
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 57
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNrYsg/M1BjPhLfarZdjAH5SDsX2Kg1Ob3PjLAPUVf/XF9JlCd1ENVYvIxnDldnD0PXonm2hWH5pSk/vfFYAiiSxEoFphrVCa2rHxBNEEcZjF+mK5NKX
 6Qj7lZ9yEK99d9epDiNt6bom7zHyfXH65vA0JUCuKRY3FTcNZOcSRyUndC6OnJuWYJzAHFqrr+2Kiydaee37027gVSNt5AOfYRtpFicRi6BDpiCgMpeRbD0i

ds1621_update_client() checks cache expiration with
time_after(jiffies, data->last_updated + data->update_interval). On
32-bit architectures, 32-bit jiffies comparisons can overflow after
~24.8 days at HZ=1000 if the sensor is not polled, preventing further
updates. Furthermore, data->update_interval is stored in milliseconds
rather than jiffies, causing mismatched units whenever HZ != 1000.

Convert last_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() so millisecond conversion intervals are handled directly
without 32-bit jiffies wraparound or HZ scaling issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: cd6c8a4297ad ("hwmon: (ds1621) Add ds1721 chip support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ds1621.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index 0618f6de9679..fd4550b0ddd0 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -24,7 +24,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -110,7 +110,7 @@ struct ds1621_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	ktime_t last_updated;
 	enum chips kind;		/* device type */
 
 	u16 temp[3];			/* Register values, word */
@@ -190,7 +190,9 @@ static struct ds1621_data *ds1621_update_client(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + data->update_interval) ||
+	if (ktime_after(ktime_get(),
+			ktime_add_ms(data->last_updated,
+				     data->update_interval)) ||
 	    !data->valid) {
 		int i;
 
@@ -212,7 +214,7 @@ static struct ds1621_data *ds1621_update_client(struct device *dev)
 			i2c_smbus_write_byte_data(client, DS1621_REG_CONF,
 						  new_conf);
 
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

