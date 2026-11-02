Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668348;
	b=c/CJ64DtC+DKltqulMHIM9q7OB9SbVDg4QgszlSNPrMu9/ddrDlnRCfOnuucW1fLd9zK
	 WW+i+idPXV2LU0lf0yAhNGg7I3Dn+CiYLc6tWQ0JKFy3BM9OlCBpiopPGDlL8J1DL601/
	 8WuEJoowLBT986MfbGr/Wg95AD1YzY9GSrEaf+sK6RqgovEh572aVClFZMgjrlwwtrKGb
	 cpVsj1vE2fiTv3DffsdvXuHkI6Rhn9+LOliTQpNWf8kG3j2Yn/d7fajoegFfsIyc+wc60
	 C/VPf41JgzBPX/rt5evcsmcYV5m14+UdpvA86Z8vn0N6KwOv72anZUwJ12pApWBIeWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668348;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=DI7nJZxmdxaO2F3RDJpNg0Kchr9U4gDBRpArlMKPcRc=;
	b=EpTyJa8wXsR+kXZtDbNZnH6U9koF1H3TCBTMqa9W5b+RXPb6fOQKPZk7DTIZpV3kFiQR
	 NcHftgsY3iaepsP/KZL/hXXFx7cktg6iOQ97T2N3qdIZQKLqPbgrf7yq1K54lXb3Nvjs1
	 bS30Na5wwXnnsk+/IszXYeALHvl48ppiupUQ63q8ELPm9smbNzPQxj+KcihwkXdwsax+C
	 DbnXYhwR/rOLNZmoqqNsu7pnGVOcPeT8Xx5hjq0MJDoyhXKY7GlyUp9VBdqbdXAT3uy4q
	 L9PlZOg62wvNY9p6dPwN/Un6rIwQRnThndEF7gAHCfOVnsSsAk6liaGy4tNmtWutG+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=RL5o9bY6;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED1606A329
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CED1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=RL5o9bY6
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id O2nHxZRgPLvgbO34cxmGYd; Tue, 03 Nov 2026 01:12:26 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O34cxZ3270ULmO34cxOiR2; Tue, 03 Nov 2026 01:12:26 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae934fa
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=EoX-w6R414KiAHPfIEoA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=DI7nJZxmdxaO2F3RDJpNg0Kchr9U4gDBRpArlMKPcRc=; b=RL5o9bY6YWx5
	mqFWMLOSkH0KUmUmeZtzpHSgVjl1K+fMjrTljzYkDa1pOtfM55ipcoLd+ba2bRrV1AhD43yKcsk1P
	T1PaJAGC6h+mTpOK6FLCO2cxMBC77b613d2aCmReu8gaffJ1fgpRBmlg4EUOctLIiXyvwsiV4uw3n
	HQQfmwlWdC8QEKorqRExdnkwEY25w5zKjh+62CHsywUCdlqs0pjYvwcI1lhp93Kn0zoyQlI2OlOvb
	3UcU02eYBDjpkAzOjUS8Pxec81k5eHyUffjYtxli27wQFPMML3ONhzQlyPyr2K1K7j8GyNRzTXar3
	cjkJqjrHCXPtVgxnzT9Veg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38188 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wZ-00000003lwn-3p3O;
	Tue, 03 Nov 2026 04:25:59 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 073/102] hwmon: (sch5627) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:52:06 -0800
Message-ID: <20261102225235.334487-74-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wZ-00000003lwn-3p3O
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38188
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGAVoG6Cl/mRRKuRhgsY791idMh7xjfva4FwZQ2TjUYGcnR3e5yPn1T83wwOjk+T5MImRXi+ABhPjhc261eh7vdhAcUDYN9VWz3bQ1UrmKhiPWJXuq0Z
 soE0ari936b57HoUDf5Pd+ODSVkqs30X0gOx1IZ8aXtZkedmEBqxEvrkiHifcpUOJgx8Bsiv1c7a7juX8GsIWdZemz388rgM1ijBFJaYea/FitC6xYpFQBfe

sch5627 uses 32-bit jiffies and time_after() for temperature, fan,
voltage, and 5-minute Vbat measurement timestamps. On 32-bit
architectures, if a sensor is not polled for about 24.8 days at HZ=1000,
time_after() wraps around and cached readings or periodic Vbat
measurements stop updating.

Switch last_battery, temp_last_updated, fan_last_updated, and
in_last_updated to u64 and use get_jiffies_64() with time_after64() to
avoid wrap-around issues on 32-bit systems.

Fixes: a98d506c08ff ("hwmon: New driver for SMSC SCH5627")
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sch5627.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 04e701ce2e74..5dfd34c469da 100644
--- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -79,13 +79,13 @@ struct sch5627_data {
 	u8 control;
 
 	struct mutex update_lock;
-	unsigned long last_battery;	/* In jiffies */
+	u64 last_battery;		/* In jiffies */
 	char temp_valid;		/* !=0 if following fields are valid */
 	char fan_valid;
 	char in_valid;
-	unsigned long temp_last_updated;	/* In jiffies */
-	unsigned long fan_last_updated;
-	unsigned long in_last_updated;
+	u64 temp_last_updated;		/* In jiffies */
+	u64 fan_last_updated;
+	u64 in_last_updated;
 	u16 temp[SCH5627_NO_TEMPS];
 	u16 fan[SCH5627_NO_FANS];
 	u16 in[SCH5627_NO_IN];
@@ -129,7 +129,7 @@ static int sch5627_update_temp(struct sch5627_data *data)
 	mutex_lock(&data->update_lock);
 
 	/* Cache the values for 1 second */
-	if (time_after(jiffies, data->temp_last_updated + HZ) || !data->temp_valid) {
+	if (time_after64(get_jiffies_64(), data->temp_last_updated + HZ) || !data->temp_valid) {
 		for (i = 0; i < SCH5627_NO_TEMPS; i++) {
 			val = sch56xx_read_virtual_reg12(data->addr, SCH5627_REG_TEMP_MSB[i],
 							 SCH5627_REG_TEMP_LSN[i],
@@ -140,7 +140,7 @@ static int sch5627_update_temp(struct sch5627_data *data)
 			}
 			data->temp[i] = val;
 		}
-		data->temp_last_updated = jiffies;
+		data->temp_last_updated = get_jiffies_64();
 		data->temp_valid = 1;
 	}
 abort:
@@ -156,7 +156,7 @@ static int sch5627_update_fan(struct sch5627_data *data)
 	mutex_lock(&data->update_lock);
 
 	/* Cache the values for 1 second */
-	if (time_after(jiffies, data->fan_last_updated + HZ) || !data->fan_valid) {
+	if (time_after64(get_jiffies_64(), data->fan_last_updated + HZ) || !data->fan_valid) {
 		for (i = 0; i < SCH5627_NO_FANS; i++) {
 			val = sch56xx_read_virtual_reg16(data->addr, SCH5627_REG_FAN[i]);
 			if (unlikely(val < 0)) {
@@ -165,7 +165,7 @@ static int sch5627_update_fan(struct sch5627_data *data)
 			}
 			data->fan[i] = val;
 		}
-		data->fan_last_updated = jiffies;
+		data->fan_last_updated = get_jiffies_64();
 		data->fan_valid = 1;
 	}
 abort:
@@ -181,14 +181,14 @@ static int sch5627_update_in(struct sch5627_data *data)
 	mutex_lock(&data->update_lock);
 
 	/* Trigger a Vbat voltage measurement every 5 minutes */
-	if (time_after(jiffies, data->last_battery + 300 * HZ)) {
+	if (time_after64(get_jiffies_64(), data->last_battery + 300 * HZ)) {
 		sch56xx_write_virtual_reg(data->addr, SCH5627_REG_CTRL,
 					  data->control | SCH5627_CTRL_VBAT);
-		data->last_battery = jiffies;
+		data->last_battery = get_jiffies_64();
 	}
 
 	/* Cache the values for 1 second */
-	if (time_after(jiffies, data->in_last_updated + HZ) || !data->in_valid) {
+	if (time_after64(get_jiffies_64(), data->in_last_updated + HZ) || !data->in_valid) {
 		for (i = 0; i < SCH5627_NO_IN; i++) {
 			val = sch56xx_read_virtual_reg12(data->addr, SCH5627_REG_IN_MSB[i],
 							 SCH5627_REG_IN_LSN[i],
@@ -199,7 +199,7 @@ static int sch5627_update_in(struct sch5627_data *data)
 			}
 			data->in[i] = val;
 		}
-		data->in_last_updated = jiffies;
+		data->in_last_updated = get_jiffies_64();
 		data->in_valid = 1;
 	}
 abort:
@@ -594,7 +594,7 @@ static int sch5627_probe(struct platform_device *pdev)
 	/* Trigger a Vbat voltage measurement, so that we get a valid reading
 	   the first time we read Vbat */
 	sch56xx_write_virtual_reg(data->addr, SCH5627_REG_CTRL, data->control | SCH5627_CTRL_VBAT);
-	data->last_battery = jiffies;
+	data->last_battery = get_jiffies_64();
 
 	pr_info("found %s chip at %#hx\n", DEVNAME, data->addr);
 	pr_info("firmware build: code 0x%02X, id 0x%04X, hwmon: rev 0x%02X\n",
-- 
2.45.2

