Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660025;
	b=VjJLuTpuOXk8bvjE9JBQO1BldFU7dss1QNEfHq210rPbB6b49QyMFZoUdRyb3m5pJWoI
	 dFFr/KGO4iOoysNHKPv8TdTwqqI4gpWyPotK/teuI54quXyOhK+TuV0xRl+U8O7KAbfBP
	 nmR7jnH/51GO2CCmY0pg47V4W9DAcA69BgD5rWolxB64kMjiKobnl87bWETD7sGQLJyOg
	 l38PwRtQsO5yt9WWJiMdinLVp0mY0nYx98Si8sg0RN3MHCGqf9n8uH1WLUAU8vStLpN6G
	 YrzdwmhWfP523Z52sxth75gI2vY5EtLga9tmrr/G2sAtDR9tEhIzMJWmd25fh6Gt+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660025;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=8MmNPPv2Y2dKsZLcdFFHniNckRZlTRRyUzr6S+ipUXo=;
	b=LZ2As77yqThCeQ3990xoI+6Lfq0UB3ZGUOxfAw0dPv74usMtR/swF/q2i2flp/YLVEP7
	 ISdzh3+1SpVVmau4AN+ok5UqdeLN42W+QTJuIqzzTLlEDwlMlsoj+Lgpeg/k94Os2XBKr
	 tEjfql0OIQAlV8yKwW+f2pMTqZP20YPw6gdNQjCEBy7E7rNuIRMHQ8wXc30lZ7i87cFp3
	 ZuqYF/uMf2ZO5hHjze2AdTfQ3pVKcQvJ4osnl4CwYKPziodFACU2wwG7kTEi2TPnQmAKQ
	 xhQ3MC1KH+FB7k6pZhlkHt1kbUeeryXr5wDLG+9bPoiSfRy4Y78OMERJLyZ4Ram62FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=B651Wbvr;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B4606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=B651Wbvr
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id NxXFxYSbmLvgbO0uOxlYqo; Mon, 02 Nov 2026 22:53:44 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uNxtA0BNSXiO0uOxBmAW; Mon, 02 Nov 2026 22:53:44 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae91478
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=rHq2C0JrDhui0MXU4BAA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8MmNPPv2Y2dKsZLcdFFHniNckRZlTRRyUzr6S+ipUXo=; b=B651WbvrpW9C
	AwSN9PnrnNsMFLp7V/zM5HY+0tB6lTyh7eZ6cNIsMwFbWVlj2VJNFH0DZtK8j2AC5+9pMXnySNUnP
	CEGQ+hNDQAPdMXmT4CW6P0seytCgTNTSAcHWZjPmqYz8wXV7zgXCRs+JEE08LRn4yvXbCoCPnDZqE
	bYbzYnWwAF1blqFCRZoJ4vCZbqZ0PkGLrFp5mR6NhmO0Bakee0BV25KvfihJMR0Ja/cNdvuURFCoe
	l3N4y+6BwmBWmD79R7gcnSERtFLHppKYkPmFBCzqvxMr/kvq8BeXZ4vK/DPhTRS9Mk1ugXgvdI+M9
	mc5peDUrDJSwjm3nu1vi8Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54126 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uN-00000003kXj-2cwi;
	Tue, 03 Nov 2026 04:23:43 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 024/102] hwmon: (ds620) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:17 -0800
Message-ID: <20261102225235.334487-25-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uN-00000003kXj-2cwi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54126
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 58
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLwAQhl2qSJe/Ogz7uHcRMwjHluQz6w5lPRoqnefdffZoH+6yImWDsWzSiXFLrkQMQy8C+h+Hm5A9800lYbBHE+iSFPDH6GsfyFyEUPLtNtwcpXJIEnM
 jfhExu4sKjTZRUMCfXEv/k41NASj4o2Ck9Dj6LkzpWjyvZpHWJPawlz93AD5zjrAZBdKi+IcYRZuE/7m7OI9fvstOawtJrrZCxogiUzG2bLU+RfYad6F05s2

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the sensor is not polled for longer
than half the wrap period, time_after() can return false and prevent
cached temperature values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 6099469805c2 ("hwmon: Support for Dallas Semiconductor DS620")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ds620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index 25287f0fa4c2..bb8534c5e2d2 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -57,7 +57,7 @@ struct ds620_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	s16 temp[3];		/* Register values, word */
 };
@@ -99,7 +99,7 @@ static struct ds620_data *ds620_update_client(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 		int i;
 		int res;
@@ -117,7 +117,7 @@ static struct ds620_data *ds620_update_client(struct device *dev)
 			data->temp[i] = res;
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 abort:
-- 
2.45.2

