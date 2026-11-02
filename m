Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666153;
	b=PO/xc4ipS19xh8Eb97K3xTurSgXSJYfhgh5YcYvk6DztJQJXvbW+zpj8UrEGY4fWz6HF
	 o8NbBBpkXnV/aVN21T+iaOz7JV3LGE6DKMnMcq8R476d4JbTYt571znBhP5NgmqXTLTPm
	 sIJSRSuABciEx+B/fxSwA07SL5K8VZRI/AgA/C/IgYbFkZatn7f6bHFSRlFHxF2+N78Ct
	 0GwKqJdH7M2BQU52VH1CQHcosnDUwMx4H/xCnN4hUjOrEE+/sNzHUuB8nEjwI9MTgIt06
	 eqisypqFuqjrDZLPZ4XBX03OL1O2so14+CLtm1qpyAz+6BrRmIfsdrBgIkJdX9vsN5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666153;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JK767NRYXr0OvR2WCM3lR7URM6jNfOrPuq4PYnHpG4g=;
	b=2la3T+ZQIeI1q8DHHTLcbqC4+xnF5/5ZTfXJ+dUeLlc1jvc/yxlyk9ufqum8SQvQsYFk
	 PFYPvjJcBtPQyIUNUJMDHbCi0AejsSlUslv0yTQlwfeDC7LBEHxrdktqTMZCRTySe3lWx
	 0t4a0PQI0nyrBJbUke52J7iyAbjaqWam0RLGgRR8ErPRh8z3Hy/tCcy6LQ6qzBVXLHqud
	 XQGmBJPCOORvVqWryk3cfJR3zQ6eucJm4220uroZ4jPQom5m80/Z0BeQddcNr8zx3SIKO
	 +Ppf0A95VIIEI48QAGJXpSKEdz6fXl0LmYz5ml7e9QnV60YY2X1MoudHrpuajYuz4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="Nv/Di7yv";
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DDE606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04DDE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Nv/Di7yv
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id O1o4xTC13MylkO2VEx2OD7; Tue, 03 Nov 2026 00:35:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2VDxbmx7bxHHO2VDxmatl; Tue, 03 Nov 2026 00:35:51 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae92c67
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=uIQ9F_dSYr64Mygn8EMA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=JK767NRYXr0OvR2WCM3lR7URM6jNfOrPuq4PYnHpG4g=; b=Nv/Di7yv0uAd
	AI2lMyqDUfltpu0QMZTz5Ebj+3q6ky9h8CWJlumjQHq1LjXmZQxytO0lKWxCXypHT+UQ691Y/vYd4
	6Ge3shAKBnsMjxJsCP6Vk7urd/RnCJkjp1m/K4+iZCaN/XGaQYF6BMei3XxbjD+qXtM1Mku7CQ+Y/
	P1QFqW02eMlUsTGI58tGXHSCS9784g1RoAS9CRhsUe7VK66Bu72R5O8WDSRvioksfMkU5I1JHo+bP
	zmbfezj2gE+p43Wa15d/w+EB2yfdaDuEe3FXC82nbTv5B82ChKi6IUjaMfQHazYdf/OFSF5ERJNne
	iER79rnefdmQ4+FBOcbCEA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46946 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vu-00000003la4-0xmG;
	Tue, 03 Nov 2026 04:25:18 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 057/102] hwmon: (ltc4261) Use ktime for update timestamp
Date: Mon,  2 Nov 2026 14:51:50 -0800
Message-ID: <20261102225235.334487-58-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vu-00000003la4-0xmG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46946
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLzPiAhXUFJ/6HK0FB19zIVWbYqB23dGB/tKttoeT83bL12oerY6mUKK7OWSwO7dC5yScE0SaSWM821APkHpbqsgVaRCBwbYcM/3AeJF0j1tI5swFmoR
 po3iT/yEfNHEaMzUmc4ekZSjKxHmoKdTpHywjsitXveu3JCVIT4zIbHr5+am7U+kdoUQgWGeYlOVp6WWq3yWhtMj/eXWqF8jwHi4UessIX4gY7hxX88MdV/y

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached ADC readings from updating.

Convert last_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() for the 250 ms update interval to avoid 32-bit jiffies
wraparound issues.

Fixes: e5f5c99a3937 ("hwmon: LTC4261 Hardware monitoring driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4261.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ltc4261.c b/drivers/hwmon/ltc4261.c
index a2e52ca0b06e..7c2e08b850d5 100644
--- a/drivers/hwmon/ltc4261.c
+++ b/drivers/hwmon/ltc4261.c
@@ -20,7 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 
 /* chip registers */
 #define LTC4261_STATUS	0x00	/* readonly */
@@ -46,7 +46,7 @@ struct ltc4261_data {
 
 	struct mutex update_lock;
 	bool valid;
-	unsigned long last_updated;	/* in jiffies */
+	ktime_t last_updated;
 
 	/* Registers */
 	u8 regs[10];
@@ -60,7 +60,8 @@ static struct ltc4261_data *ltc4261_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ / 4) || !data->valid) {
+	if (ktime_after(ktime_get(), ktime_add_ms(data->last_updated, 250)) ||
+	    !data->valid) {
 		int i;
 
 		/* Read registers -- 0x00 to 0x09 */
@@ -78,7 +79,7 @@ static struct ltc4261_data *ltc4261_update_device(struct device *dev)
 			}
 			data->regs[i] = val;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 abort:
-- 
2.45.2

