Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664500;
	b=Y0pK9VSkYBAlR/lHqZeUUCCOXwR5+MZpVizNkWLsClyeVShQilup5/hukSCC9y0S2qQB
	 nAPHzFd6m3yy92eSISHgWqvhY98O+ILfYz8f/wUyv0y4TZwlZboSBuoxywwTwBTOk/sML
	 fhqbZvKnr+oszPHRdiQLs8Q+aqOlBz9nb52m6/EzLhwID1MO8bKRy5N7hYQcK8RMrbtTs
	 xkaL1LXcZiQ7NCFjZ1mBN6wRMr4f4FXgy+pNeZ3tQa0sNTFdztz8OUXc4pifLJKxywa/M
	 2Hx9mdA/ky9FA1eS6hMB1ktuVgoU+1qUhEWsYZehiKMf5DsZw1e0YIYVrSe3env0zCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664500;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Q+e3weTFGpDhXxooA/mCAuRBFG8OqC0rtg00f98RcS8=;
	b=r+cySr+uuYNd8HzG5KOBllX2oYeA8s5kz/+c2N3Z/Ikmgwtyl7AmSwsw7s7W70R5BNFZ
	 tU1lzjC68jf+DyP7D4tEB9zphAqKNoJ0ZoEL5pv1b/KOY3O8fymbGyPtTDpx0juTZOdZS
	 FqmvYniMPANbkCtEHrGZnMWn45Xy7lNGnCq7DazldhjgigYt3Y+N7UgEnLk/E8V8EmMF6
	 7ek5oAlIh0VbBbOXcgjdDZI/9XK1fhY/AuxMzX/FXa9YLFdEl1myMkERIoC/77EjBPfNK
	 HYmbDY7K5u7+0U2OgRFrS1c1Y7tH25BpuBE6Jbymdxw1hTRzSZ1d3DLcJEi9uvofoKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CbYuAD74;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C237606A327
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C237606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CbYuAD74
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id NwoLxO046v0ndO24ZxBqSW; Tue, 03 Nov 2026 00:08:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O24Zxj7ttkE4RO24ZxAmcz; Tue, 03 Nov 2026 00:08:19 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae925f3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=jWTqmzCf-azPdQBy17gA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Q+e3weTFGpDhXxooA/mCAuRBFG8OqC0rtg00f98RcS8=; b=CbYuAD74kdhF
	Xjy2Z2F+2zpsgC7VioGWOli9vrDTqVTnYFYSGihoP6IYwL38OTrx+csgvlhso6wB5lg0tgRy0/bRe
	aI1jnqmBMqowanZgJOlwupH2fcc+gA3tqtSUdE3EkEwb1hkCD4YIRalE+nDp5LdBf7HVRsOi/7XTI
	Nl+RQwZz+0qERLz6cXMI4Ps0/0NvAIZiFLDyKj9xCUOJtwHoWdTniLqHjwO1YvnrGGxWSirLuZTOc
	UlZB7HrVUB47S5tokz6tXU9hCGnw2bR+BRIa0iJkaqSndZOYYP76RuIjJhx60Z/gk+5mXuXnDC2/4
	dN09Gru9JRIHRucQiLD6Sw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53950 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0w8-00000003lfL-08n7;
	Tue, 03 Nov 2026 04:25:32 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 062/102] hwmon: (menf21bmc_hwmon) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:55 -0800
Message-ID: <20261102225235.334487-63-linux@roeck-us.net>
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
X-Exim-ID: 1xO0w8-00000003lfL-08n7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53950
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJmsCpkZNrlUXXbyeZXtiLmoKG55jDfKf0ho8SGB1n4iZ2V9ybg3K5X2DiVZkqYr8213XfLbZ5qLlX2n/sZXMmeqd3f5sMqp2PpY9UDBK5p7iPOz9mE7
 Ra9J7Qq62gle8kDyum77LSAYaMDP1RNW5O5KRr2WxT8NfeO6oTKMgrsZGSVhkHajLo1FRsmgWSh6kVV0q9fx7e8Ozqipy10QUWxDv5XvhaoQeeXSFRKFp2/v

menf21bmc_hwmon uses 32-bit jiffies and time_after() to determine when
cached voltage readings should be refreshed. On 32-bit architectures,
if the sensor is not polled for about 24.8 days at HZ=1000, time_after()
wraps around and cached values stop updating.

Switch last_update to u64, use get_jiffies_64() with time_after64(), and
serialize sensor updates and 64-bit timestamp accesses in
menf21bmc_hwmon_update() with hwmon_lock.

Fixes: 964356938fcd ("hwmon: (menf21bmc) Introduce MEN14F021P00 BMC HWMON driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/menf21bmc_hwmon.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/menf21bmc_hwmon.c b/drivers/hwmon/menf21bmc_hwmon.c
index adb50115c32b..9d0aaa773991 100644
--- a/drivers/hwmon/menf21bmc_hwmon.c
+++ b/drivers/hwmon/menf21bmc_hwmon.c
@@ -35,7 +35,7 @@
 struct menf21bmc_hwmon {
 	bool valid;
 	struct i2c_client *i2c_client;
-	unsigned long last_update;
+	u64 last_update;
 	int in_val[BMC_VOLT_COUNT];
 	int in_min[BMC_VOLT_COUNT];
 	int in_max[BMC_VOLT_COUNT];
@@ -54,24 +54,23 @@ static struct menf21bmc_hwmon *menf21bmc_hwmon_update(struct device *dev)
 	int i;
 	int val;
 	struct menf21bmc_hwmon *drv_data = dev_get_drvdata(dev);
-	struct menf21bmc_hwmon *data_ret = drv_data;
 
-	if (time_after(jiffies, drv_data->last_update + HZ)
+	guard(hwmon_lock)(dev);
+
+	if (time_after64(get_jiffies_64(), drv_data->last_update + HZ)
 	    || !drv_data->valid) {
 		for (i = 0; i < BMC_VOLT_COUNT; i++) {
 			val = i2c_smbus_read_word_data(drv_data->i2c_client,
 						       IDX_TO_VOLT_INP_CMD(i));
-			if (val < 0) {
-				data_ret = ERR_PTR(val);
-				goto abort;
-			}
+			if (val < 0)
+				return ERR_PTR(val);
 			drv_data->in_val[i] = val;
 		}
-		drv_data->last_update = jiffies;
+		drv_data->last_update = get_jiffies_64();
 		drv_data->valid = true;
 	}
-abort:
-	return data_ret;
+
+	return drv_data;
 }
 
 static int menf21bmc_hwmon_get_volt_limits(struct menf21bmc_hwmon *drv_data)
-- 
2.45.2

