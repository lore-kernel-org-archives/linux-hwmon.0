Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335792;
	b=CcTnfGZMFjRulVWGnzcl/DhnW4aLjONkXoZPtF4FJTgMdvf2m1tr7a/vz+qK5lpWlnoF
	 G535g/qJfOix5O4tvaDTcSkf7z+p5JKEV78WgwFmH0vXc0+jLY6VKsiqmUaqR026vQa4Z
	 Ue6jFLxyER8p/OfczdKQUWypC1875kV1jd7yGwyT63JVLeqTu5fHJRuZIi/+1YI4l585A
	 OjHzHewYGrQ8IpUnwkXZU1wftM5JEHyqLl+Wuc/F9yLCKXeIePTkiAHJ8xaw2EsWRH4bt
	 hoKtnTbD0eYoiipvvusTDCJd8JCOweezEnTBvOORJhxXD8a7rnD9IljaVCQi3LDVFsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335792;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=h+xGCVE5Pt3hLzO1QDQp0AGC4g3jSj3OJ3fO3O3bQVg=;
	b=SdKKVyFOAGNkLre7EcCFkwoY6k5vu9zGni56cGgk7tLXqOPqWjtjU8pgSwLohKKW4DN+
	 pauv0XQZoKd/tW0pQd3WXr0/A0BJehH5ZMHBuEdUGutOGmpgp6Dfr+vOvoCSviImi6f43
	 cvLU5wfFhJvdYRJzg71noUZdbAvaVMiJDHeE62WHRpiXf0qu2C0EbqdqxoImKGw3LgcB/
	 fLXk9wBIrCil9+hQgcu4y1VWT8MnwazDrBvFXSLav6BGxu7c4CAAHymWJIg6Oc1dzUjSr
	 HkBU/MxUBIpp2xa/2+TcljZpaej0mBtJb+T3c8YPjXmtLmg6NKcS2YTlxDxcYwsSUEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="5lK/V/O5";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAE606A336
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EAE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=5lK/V/O5
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id QpDzxHTpFyb4YQqhsx0vg6; Tue, 10 Nov 2026 18:36:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QqgQxUu07xqjjQqgQxi6gX; Tue, 10 Nov 2026 18:35:02 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6af363d6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8
 a=NUIU4UfIAAAA:8 a=lnrq2cXjH9mfmETKMBcA:9 a=nlm17XC03S6CtCLSeiRr:22
 a=aWLMKx6b989H91KlDTYO:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=h+xGCVE5Pt3hLzO1QDQp0AGC4g3jSj3OJ3fO3O3bQVg=; b=5lK/V/O5wwab
	Plkgc96j+2RIkP+fUwb0+Jp1bKQsj5CmYswABhILFm6E49mX/u3xUiAGH6thoKsidAUXlKSfUM+HW
	m/9yTR3d5xekU6k17vfRa08HgDpHB7x5t9F+usTVOuUlWGe56YxcO2UNZ6bLCYO6+3GxwaTmrqC8J
	8PZKJCMoszXJGhKG9iAX71aBh4pWZag6vVfaK8aXghqRCPIU5QjtMh42aDZHvZJ9T4mrVOeYLDmkI
	DBVgEt3K1CZH1OnMX8W8PcsyJw2SPG6CvjPZ4twdYcQnqLjeJZqZsXsSph1aARi09YELpmo1cDVMX
	2wj5BOoSA+wLE1u+eE2m8g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40316 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqgP-00000003Pnj-3Y2u;
	Wed, 11 Nov 2026 00:05:01 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 09/10] hwmon: (f75375s) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:32 -0800
Message-ID: <20261110183434.181711-10-linux@roeck-us.net>
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
X-Exim-ID: 1xQqgP-00000003Pnj-3Y2u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40316
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 27
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKOqQC8uRlsP1jan5oN0WDh7INDMsrv/9nix5aUQEsj3kf49QGH5KKvywF44h26tL+sXtAJ3TW/k188KHSxWt3XBrHmG09tkhXY56sgzKGZFBhIPs8eV
 y5v/awCAKdEWNHJ2rznh97MU9CzJe+gWA0WZZVfsMXjaUJatoz75MJifaMWf0QR/ElanHInG4IM+wei4uN84hYavuMHNTMTLJVLjdF5IJVoB8ZB5fzTfy5Vm

There are no in-tree users of f75375s_platform_data. Initial PWM mode
and enable settings are read from the chip registers during probe, and
both pwm and pwm_enable are configurable through standard hwmon sysfs
attributes.

Drop platform data support from the driver and remove
include/linux/f75375s.h.

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS             |  1 -
 drivers/hwmon/f75375s.c | 94 ++++++++++++++++-------------------------
 include/linux/f75375s.h | 21 ---------
 3 files changed, 37 insertions(+), 79 deletions(-)
 delete mode 100644 include/linux/f75375s.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 15d70b72d9a2..8d103c0b86b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10415,7 +10415,6 @@ M:	Riku Voipio <riku.voipio@iki.fi>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/f75375s.c
-F:	include/linux/f75375s.h
 
 FINTEK F81604 USB to 2xCANBUS DEVICE DRIVER
 M:	Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
index b67a0db680ee..a0c778c5e0a5 100644
--- a/drivers/hwmon/f75375s.c
+++ b/drivers/hwmon/f75375s.c
@@ -23,7 +23,6 @@
 #include <linux/i2c.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/f75375s.h>
 #include <linux/slab.h>
 
 /* Addresses to scan */
@@ -724,75 +723,56 @@ static const struct attribute_group f75375_group = {
 	.attrs = f75375_attributes,
 };
 
-static void f75375_init(struct i2c_client *client, struct f75375_data *data,
-		struct f75375s_platform_data *f75375s_pdata)
+static void f75375_init(struct i2c_client *client, struct f75375_data *data)
 {
+	u8 conf, mode;
 	int nr;
 
-	if (!f75375s_pdata) {
-		u8 conf, mode;
-		int nr;
+	conf = f75375_read8(client, F75375_REG_CONFIG1);
+	mode = f75375_read8(client, F75375_REG_FAN_TIMER);
+	for (nr = 0; nr < 2; nr++) {
+		if (data->kind == f75387) {
+			bool manu, duty;
 
-		conf = f75375_read8(client, F75375_REG_CONFIG1);
-		mode = f75375_read8(client, F75375_REG_FAN_TIMER);
-		for (nr = 0; nr < 2; nr++) {
-			if (data->kind == f75387) {
-				bool manu, duty;
+			if (!(mode & (1 << F75387_FAN_CTRL_LINEAR(nr))))
+				data->pwm_mode[nr] = 1;
 
-				if (!(mode & (1 << F75387_FAN_CTRL_LINEAR(nr))))
-					data->pwm_mode[nr] = 1;
+			manu = ((mode >> F75387_FAN_MANU_MODE(nr)) & 1);
+			duty = ((mode >> F75387_FAN_DUTY_MODE(nr)) & 1);
+			if (!manu && duty)
+				/* auto, pwm */
+				data->pwm_enable[nr] = 4;
+			else if (manu && !duty)
+				/* manual, speed */
+				data->pwm_enable[nr] = 3;
+			else if (!manu && !duty)
+				/* automatic, speed */
+				data->pwm_enable[nr] = 2;
+			else
+				/* manual, pwm */
+				data->pwm_enable[nr] = 1;
+		} else {
+			if (!(conf & (1 << F75375_FAN_CTRL_LINEAR(nr))))
+				data->pwm_mode[nr] = 1;
 
-				manu = ((mode >> F75387_FAN_MANU_MODE(nr)) & 1);
-				duty = ((mode >> F75387_FAN_DUTY_MODE(nr)) & 1);
-				if (!manu && duty)
-					/* auto, pwm */
-					data->pwm_enable[nr] = 4;
-				else if (manu && !duty)
-					/* manual, speed */
-					data->pwm_enable[nr] = 3;
-				else if (!manu && !duty)
-					/* automatic, speed */
-					data->pwm_enable[nr] = 2;
-				else
-					/* manual, pwm */
-					data->pwm_enable[nr] = 1;
-			} else {
-				if (!(conf & (1 << F75375_FAN_CTRL_LINEAR(nr))))
-					data->pwm_mode[nr] = 1;
-
-				switch ((mode >> FAN_CTRL_MODE(nr)) & 3) {
-				case 0:		/* speed */
-					data->pwm_enable[nr] = 3;
-					break;
-				case 1:		/* automatic */
-					data->pwm_enable[nr] = 2;
-					break;
-				default:	/* manual */
-					data->pwm_enable[nr] = 1;
-					break;
-				}
+			switch ((mode >> FAN_CTRL_MODE(nr)) & 3) {
+			case 0:		/* speed */
+				data->pwm_enable[nr] = 3;
+				break;
+			case 1:		/* automatic */
+				data->pwm_enable[nr] = 2;
+				break;
+			default:	/* manual */
+				data->pwm_enable[nr] = 1;
+				break;
 			}
 		}
-		return;
 	}
-
-	set_pwm_enable_direct(client, 0, f75375s_pdata->pwm_enable[0]);
-	set_pwm_enable_direct(client, 1, f75375s_pdata->pwm_enable[1]);
-	for (nr = 0; nr < 2; nr++) {
-		if (auto_mode_enabled(f75375s_pdata->pwm_enable[nr]) ||
-		    !duty_mode_enabled(f75375s_pdata->pwm_enable[nr]))
-			continue;
-		data->pwm[nr] = clamp_val(f75375s_pdata->pwm[nr], 0, 255);
-		f75375_write_pwm(client, nr);
-	}
-
 }
 
 static int f75375_probe(struct i2c_client *client)
 {
 	struct f75375_data *data;
-	struct f75375s_platform_data *f75375s_pdata =
-			dev_get_platdata(&client->dev);
 	int err;
 
 	if (!i2c_check_functionality(client->adapter,
@@ -829,7 +809,7 @@ static int f75375_probe(struct i2c_client *client)
 		goto exit_remove;
 	}
 
-	f75375_init(client, data, f75375s_pdata);
+	f75375_init(client, data);
 
 	return 0;
 
diff --git a/include/linux/f75375s.h b/include/linux/f75375s.h
deleted file mode 100644
index e99e22500668..000000000000
--- a/include/linux/f75375s.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * f75375s.h - platform data structure for f75375s sensor
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2007, Riku Voipio <riku.voipio@iki.fi>
- */
-
-#ifndef __LINUX_F75375S_H
-#define __LINUX_F75375S_H
-
-/* We want to set fans spinning on systems where there is no
- * BIOS to do that for us */
-struct f75375s_platform_data {
-	u8 pwm[2];
-	u8 pwm_enable[2];
-};
-
-#endif /* __LINUX_F75375S_H */
-- 
2.45.2

