Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669109;
	b=phGqp7uMaP+zs8TkSPqRskLYEfPiczC2Si5Y+VjrVXYLudMqCdsuUOv1CJXG9abhr/jP
	 0yWzadrw6CsDqZ/LrRsT+iwW1JId+gIwXOt8HUaOmZzbPlbtrgPyQxoG2+z8CVRi/2uCr
	 qD0kqsVnvW5UyyvOBU95Vp6jgYkFnEYtc117I0R4IAZmQQGZucdahCsNUftFrBb2AkQjU
	 0x9DVeB9FWdMa8WRze0exT+sCUqgNYh9v2Nrq2BD3DwxGY00RRrrfE6b7LDrc7pL35BWT
	 exHN9da1CLRI5fWGEui0ju4/Sw3zAiyguk/U/BZl38+E7p0Y0swcoah62a3eGe7LU9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669109;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=M/df48BDDr7JszICirUzr6H3nHZcW35T4cCSopxhHrA=;
	b=bJcvSYFbmJabDqxsJJofb/gEwSBK7RAd/3uSMaTnk7h66YD27fvsPYxKSVidGPYDjTvd
	 niKFchAGcUbhrKWZ6HvIjMpVyZ4TerNVHoLLnv7pEVs+208t2XPDHNgrfOfgh4Ljv9WS6
	 Ic7qN+LrDdyWVYPSObCRi/sUBJONXClcuOSVDdktaSMo+HNhMAdy1cVNr4PSQYKWa53L1
	 Qwz9h7hbijzOV46Fpi+OpHoFqW13XQQxL46B+8ZJ6ft9wu+CRqm7zJTylwqHaC8Pr7PYE
	 +JzFXUDlVl6G2itbkfs0i5298RlVE1ql0toPS8joipOq/0MxEBLJGCJ37k9aJV6huxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oCNIwa0u;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD814606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD814606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oCNIwa0u
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id O2nHxZRgPLvgbO3GtxmJkr; Tue, 03 Nov 2026 01:25:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3GtxZMdm0ULmO3GtxOzGs; Tue, 03 Nov 2026 01:25:07 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae937f3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=4k9ZCFIcWufBpIsI3TMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=M/df48BDDr7JszICirUzr6H3nHZcW35T4cCSopxhHrA=; b=oCNIwa0uCnZ7
	g+Zp/Ha0zAg+OpjgUWuiQC+quTUlavfWcB2GTRUP9CcdtRS2MIWEUmj6mSEj8hf67wj3kmQNv2lJ3
	L55rBpGyhYlXngiTM6pf6uw6Efzf0vs7Tvfar3Pd3S3ETltNlntTmgLDTNLp6Hca9WBh9Bh2F8rpl
	Kd6j7sQ63pYl32zUW8rmgIRsxcH6DLVwFISoAZn8BgeYRE7+ozKP7egpoL+qH9QUeS6sxynmP98uQ
	NLHbf6vBRiPp3dEziyf/dN5KFZM+WmtHOlEuVO+Zqe1X1GTJ2beNZtwh3qu7xPIsXaDr1FP4GDsv7
	xnuo5MvrO0xBvRvWBpJVRA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52514 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vF-00000003lH1-2pID;
	Tue, 03 Nov 2026 04:24:37 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 043/102] hwmon: (kbatt) Use 64-bit jiffies for update deadline
Date: Mon,  2 Nov 2026 14:51:36 -0800
Message-ID: <20261102225235.334487-44-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vF-00000003lH1-2pID
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52514
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfELxL+f/ADTR9uke08yT0o0FQ27pmHm+QNcg0Id+uV62bb6EFxtcmDG10slm4MDSUbvoa8didEVwbPCe7Sby+9VZGpiQP+/nnzyj0Mvng2o9KnWyaeUE
 PL94QoDUIoRdZXQlj6lUHfZd5e9pp0owZa1Ff369ARcPQpM5IB5ifihkvVp1JdBgUzombYz1AiJYX5PBRfzF6ty7z6oypJTcmeXmaXAyHKgMLhP+I1OXTFjh

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the battery alarm is not polled for
longer than half the wrap period, time_after() can return false and
prevent the battery status from being re-tested.

Include <linux/jiffies.h> explicitly, convert next_update to u64, and
use get_jiffies_64() and time_after64() to avoid wraparound issues on
32-bit systems.

Fixes: 7e581c193bde ("hwmon: Add KEBA battery monitoring controller support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/kbatt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
index 501b8f4ded33..69bc9c2f14ee 100644
--- a/drivers/hwmon/kbatt.c
+++ b/drivers/hwmon/kbatt.c
@@ -8,6 +8,7 @@
 #include <linux/hwmon.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/auxiliary_bus.h>
@@ -30,7 +31,7 @@ struct kbatt {
 	struct mutex lock;
 	void __iomem *base;
 
-	unsigned long next_update; /* in jiffies */
+	u64 next_update; /* in jiffies */
 	bool alarm;
 };
 
@@ -38,7 +39,8 @@ static bool kbatt_alarm(struct kbatt *kbatt)
 {
 	mutex_lock(&kbatt->lock);
 
-	if (!kbatt->next_update || time_after(jiffies, kbatt->next_update)) {
+	if (!kbatt->next_update ||
+	    time_after64(get_jiffies_64(), kbatt->next_update)) {
 		/* switch load on */
 		iowrite8(KBATT_CONTROL_BAT_TEST,
 			 kbatt->base + KBATT_CONTROL_REG);
@@ -56,7 +58,7 @@ static bool kbatt_alarm(struct kbatt *kbatt)
 		/* switch load off */
 		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
 
-		kbatt->next_update = jiffies + KBATT_MAX_UPD_INTERVAL;
+		kbatt->next_update = get_jiffies_64() + KBATT_MAX_UPD_INTERVAL;
 	}
 
 	mutex_unlock(&kbatt->lock);
-- 
2.45.2

