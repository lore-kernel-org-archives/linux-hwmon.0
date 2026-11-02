Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661936;
	b=q71GJ3lsK0DM5wc5YfY1P1CgeWywli56+gekurTEXjH3CORqqNE07Zp+3hv/wmd3jAUj
	 dekyQHs2xWaFlgPLqly+D1t8O85FjT2NMJxlMr4cHE91NbaZuFunAfxOXtYD3hytHNCqP
	 jCgFSC+J1vnUNyvySUzMdKdEBvk9JR4J8EvSJZfrckJ8YhaGdypaKhpENtSseuRuaG00T
	 7JKSDGFVGI2MIxwZ9ieuq+xZVzJl6YJnwrNk8xqYyN4CJ890gmDVIjql6vkf7UeNDyl/T
	 yKK+RwC8iOaPrXbi2+VO+1v5nyHba2xSm1Gszke+99OK/w+Z5aXRHoEbQggtpe25xmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661936;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=p70EpFidjqcNq14QphttycWkTaSNuVlvIyN0A2pIvhE=;
	b=b59QlQbrUev52ev+PGtQJ81BkWMbq4Zh2Nf/VCrzKEthUmwU0It8OxFcbd4J/tdisXit
	 HRc3XOrgae4qJg7SaCbLpRvDTcCfNGYF9aFDamYLo9v7A7v3bE6vHFhGHYQdiE0TDqhbt
	 wD7Hi/VQjolHaN55nlPW4oEimCxob2XVLoWBmkxiwy8mXIXmBtmNi01kzrln3SyynCZ5k
	 SBRjv1M+KN58raNT0I18brSiz0H/mfCIAJVmzUnOYiwP7O9+O61tNFyazOVBFYJFAQOW1
	 lP0zMBSXYPTT4Ct8dKB5MH7Zz6gMM+whcCgHZRLtATyrTGEWA35YFk0mlMHvi/pB4zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=31QEw9Wr;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518DD606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518DD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=31QEw9Wr
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NwKBxGT2JaC0UO1PDxXBct; Mon, 02 Nov 2026 23:25:36 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1PDxkBRPmTkmO1PDxjLeh; Mon, 02 Nov 2026 23:25:35 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae91bef
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=KfZ-awuG1CK3CWSFkaMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=p70EpFidjqcNq14QphttycWkTaSNuVlvIyN0A2pIvhE=; b=31QEw9WrFS5Q
	s5I9pNI0q88v/bIxljF2v2EFNSBC7eEhvcdn9nWeH/ambxcE0xKZ80bKlt2dOxR8tcdl7vZXfmtR2
	Gc+2jzNqTKTpOdJ/GVFUhWnipInsit+s+hQNnyot4Sz3E7vcTJ3gdpoGMEwqm985goDDzBQFPNhb4
	kilNWK8VEp/vQ5wYAoPQEXUIfR+ola1Uw4jU+14R9wF0Bz+dqchTXvi1x+hvHujJE51sLHcrocCR2
	x+Ej6+VZibk1Avb4EUQcDcSGKb2bVr5HwsmII9puyDvXuFd3KJb2qsjA6UO/xNG36QJ5PNn/uBvIy
	ts3Bi9h7uapmX9RvolO8Fg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37842 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wM-00000003ln1-2GM9;
	Tue, 03 Nov 2026 04:25:46 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 068/102] hwmon: (occ) Use 64-bit jiffies for poll and safe-state timestamps
Date: Mon,  2 Nov 2026 14:52:01 -0800
Message-ID: <20261102225235.334487-69-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wM-00000003ln1-2GM9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37842
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCNgorpJE1pSS8Q7f3D0ZLXEAxe9LolAKX1w06nVErnVdNJnhXn2vTDovEmZT6gH9mLdsbOkUxYZRiU84qxX2CWSNBKI60ZNIWIp8rGoTSo342LcsxaP
 hu/JxgxlfXeI4WX71Y9FN88NzQptbys9bBkL5jhK5qMJfVAAe/k6uf6TcDSw4LODkr8ztfvMDvbCE9uFapArGU80p0j9mLZ+QtFXLERv11QpL6hYAUBK5Eyn

The OCC hwmon driver uses 32-bit jiffies and time_after() for both the
polling rate limit (next_update) and the 60-second safe-state timeout
(last_safe). On 32-bit architectures, if the device is not polled for
about 24.8 days at HZ=1000, time_after() wraps around and sensor polling
or safe-state timeout detection stops working.

Switch next_update and last_safe to u64 and use get_jiffies_64() with
time_after64() to avoid wrap-around issues on 32-bit systems.

Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/occ/common.c | 12 ++++++------
 drivers/hwmon/occ/common.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 175208d712b0..67e8dd1c77fa 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -164,11 +164,11 @@ static int occ_poll(struct occ *occ)
 	header = (struct occ_poll_response_header *)occ->resp.data;
 	if (header->occ_state == OCC_STATE_SAFE) {
 		if (occ->last_safe) {
-			if (time_after(jiffies,
-				       occ->last_safe + OCC_SAFE_TIMEOUT))
+			if (time_after64(get_jiffies_64(),
+					 occ->last_safe + OCC_SAFE_TIMEOUT))
 				occ->error = -EHOSTDOWN;
 		} else {
-			occ->last_safe = jiffies;
+			occ->last_safe = get_jiffies_64();
 		}
 	} else {
 		occ->last_safe = 0;
@@ -220,9 +220,9 @@ int occ_update_response(struct occ *occ)
 	}
 
 	/* limit the maximum rate of polling the OCC */
-	if (time_after(jiffies, occ->next_update)) {
+	if (time_after64(get_jiffies_64(), occ->next_update)) {
 		rc = occ_poll(occ);
-		occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
+		occ->next_update = get_jiffies_64() + OCC_UPDATE_FREQUENCY;
 	} else {
 		rc = occ->last_error;
 	}
@@ -1158,7 +1158,7 @@ int occ_active(struct occ *occ, bool active)
 			goto unlock;
 		}
 
-		occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
+		occ->next_update = get_jiffies_64() + OCC_UPDATE_FREQUENCY;
 		rc = occ_parse_poll_response(occ);
 		if (rc)
 			goto unlock;
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 82f600093c7f..d968c42cd122 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -99,7 +99,7 @@ struct occ {
 	int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len, void *resp,
 			size_t resp_len);
 
-	unsigned long next_update;
+	u64 next_update;
 	struct mutex lock;		/* lock OCC access */
 	struct mutex hwmon_lock;		/* serialize hwmon registration/removal */
 
@@ -112,7 +112,7 @@ struct occ {
 	int error;                      /* final transfer error after retry */
 	int last_error;			/* latest transfer error */
 	unsigned int error_count;       /* number of xfr errors observed */
-	unsigned long last_safe;        /* time OCC entered "safe" state */
+	u64 last_safe;                  /* time OCC entered "safe" state */
 
 	/*
 	 * Store the previous state data for comparison in order to notify
-- 
2.45.2

