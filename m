Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660017;
	b=R9kXRHXxhO7aokVmjdEvl+VwsUR83XBLzBZAZMXtFQBfNRd8jpYBpg5McaocCZeEzsXn
	 IKWmxiSiKspsO2V7wFadawwPfvbtsfX9OEf7Cs6Zm95E76j/fXOPQZoxgEVaaz5gDTfKz
	 TmTXO1tWPdPr/DzL1MQU4NtcOFKeBywCP7EtkQSURwITX9DRGf2wVq+/ktoFagPi1dRvc
	 GW7N7Uql4FufACrI/8te7rd/piGTOwbhXZAxmVMV59OGPE+26hTKAidnfktPg8lp+6c1U
	 BZBQZ8t0rX10RViuaM/nRAgTodnmGNkyzTAcPjDlU/4nvHHePp+2PpYYOLKPpJ+RMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660017;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=DD1OBDfwvKoI8IxjXLJfb4sKNzpoSKgDPgJCRtzfl8M=;
	b=qUsmT+Ek5PVCeEQcrZW2yXiwvOuWpBFptrwJfh+l7IGKddomQ7xm4ttloCE3yQGM4/+p
	 qf0Gf8aCd7eQhOZf7JXJSVkobiHAVa2PxX1mt/2N5iTJT4VBaMBAVnW6QH9a8VaQ602Vx
	 MfgaV4qPSjT+uwq9Hyb7r3zK3gfQDjhchj4EnzLmvCtyLjBRYbKXArOsArwcMza4oHwF7
	 bIIwaDy7GFGeOLCBAE3vnEmlib9tlWcHcB9RYG8wIngWhW4Fpst1NBW2ck69Qrx9Ixnz4
	 yyw7LZ1SKpUgvO02vrZdW9ET/xEmK99VIMP6bEpcfCh1C29xk04CDRZmRFb4l1w+/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MMLfVxNo;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF7606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FF7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MMLfVxNo
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NmxXxPtwVMylkO0uAx1rfV; Mon, 02 Nov 2026 22:53:30 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0u9xJXoR63hBO0uAxebIe; Mon, 02 Nov 2026 22:53:30 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae9146a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=zRTiuAYFmHhZGYPwX1QA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=DD1OBDfwvKoI8IxjXLJfb4sKNzpoSKgDPgJCRtzfl8M=; b=MMLfVxNoz7MU
	O9QceVzzgag3PRUNcGmYulZ7i479HVbNuaFNk3+bRYdY/IkJHg3HE0sX18bu6dmnRZhF0zrcZJxdt
	L4UvwqnaepKuz2ocCa0Fw4yh44ahSHFNBTlS7d+GCA2xIA3m4IFyNXTQoGU1VhmRini7sKi/hclKo
	naX3r7WWztil15oJNf4nzGRdBFcfnqrkttcR1FyXwrmJCK0K7ATvB/v9aKpTiu8Nbp5u+j1uQw9oI
	FM4pdYNIoJhAqHiiureSkx/CgRygCqiLiPwR2WX3AtG7MH/bc0vC+gbS35aLm278kUTrd0bT6Poaa
	TJG7O7hIUkYdIJqU1DwjdA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33482 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0u9-00000003kPE-3785;
	Tue, 03 Nov 2026 04:23:29 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH 019/102] hwmon: (asus_rog_ryujin) Use ktime for status validity timestamp
Date: Mon,  2 Nov 2026 14:51:12 -0800
Message-ID: <20261102225235.334487-20-linux@roeck-us.net>
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
X-Exim-ID: 1xO0u9-00000003kPE-3785
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33482
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 50
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKK1xq+6uZgARDpCV4JHdNYRu5oc1K+Zj7jUvUW4RPjW2xz9oOjl9RYkhh2xDWR6hLIUHPamJ5rqgzAfN4DHWHjCy63fIkwfl/k3ilXWjTlRfueJFUMk
 scv4uirbXJPrGP8nDsByG002iRO+D9EdjbNm7tAykC3eNUbDFL7YZH6J7zXqGvYNqAY5cxGoVL9bz2RHR2LLo7GHmXuJOeNb5CV3gcYa/FdJnnuvvRSAoMe8

rog_ryujin_get_status() converts STATUS_VALIDITY (1500 ms) to jiffies and
uses 32-bit time_after() to check whether cached cooler data is stale. On
32-bit architectures, leaving the sensor unpolled for about 24.8 days at
HZ=1000 causes time_after() to wrap around and return stale cached data.

Since STATUS_VALIDITY is defined in milliseconds, convert priv->updated
to ktime_t and use ktime_get(), ktime_add_ms(), and ktime_after() to
avoid 32-bit jiffies wraparound and repeated jiffies conversions.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_rog_ryujin.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 4cb18903e98a..34b1150520ca 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -10,6 +10,7 @@
 #include <linux/hid.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/unaligned.h>
@@ -136,7 +137,7 @@ struct rog_ryujin_data {
 	unsigned long source_changed;	/* jiffies */
 
 	u8 *buffer;
-	unsigned long updated;	/* jiffies */
+	ktime_t updated;
 };
 
 static int rog_ryujin_percent_to_pwm(u16 val)
@@ -237,7 +238,8 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 {
 	int ret;
 
-	if (!time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
+	if (!ktime_after(ktime_get(),
+			 ktime_add_ms(priv->updated, STATUS_VALIDITY))) {
 		/* Data is up to date */
 		return 0;
 	}
@@ -274,7 +276,7 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 			return ret;
 	}
 
-	priv->updated = jiffies;
+	priv->updated = ktime_get();
 	return 0;
 }
 
@@ -700,7 +702,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	 * the initial empty data invalid for rog_ryujin_read() without the need for
 	 * a special case there.
 	 */
-	priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
+	priv->updated = ktime_sub_ms(ktime_get(), STATUS_VALIDITY + 1);
 	priv->source_changed = jiffies - msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
 
 	ret = hid_parse(hdev);
-- 
2.45.2

