Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675578;
	b=T/hSlskNwMmREIRNFbWlRpSu5Cut6ybOY4Lzbi/revMyFbisWCkQH0VlYZ5eyiUWw/jM
	 8AHndJxMk1cCaff8M4PabAeA/4ylGbjJ3B5HFjGN5OtGZw/Xd9VGG/mSxDcsudx2v9fDX
	 eCPiFDad95tr0swsS51z4OkbdpueaA+v2+Gu1daTbNpzGI6jIubGCPebHsrHcS4KHoHn+
	 InuiTYoNIRwctfz56zKECSq4APdr9+/CarEUuF7oPzWE+xY35c8DHYVPSUTJ5xHvpk65u
	 yVvOl8SMCR78LNkoJ0HuvGCoSFmWmKoLlYCz19ASyF1DYyrNjBYjj1h2GI0l6J1CaYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675578;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=mOcWh9+T9pT7E+r9mbBt2/c7H0j+qvFaiVLgF3ZYGIQ=;
	b=3qEi1UMLppwYIN8/PwWUBR7Y53ri43F100Ocly3qbU0pY4I8gsC62BQfNdrP26ZM2XYH
	 SfaaPfUy/bBqA8sAHwKRCsa49yxn1hlpEj+ZlFBjcOjEp6Y9v2nPXiIHZT9Mtd1equncu
	 6H9B9XzfgZrJ/qyX4RFalm4aIhkMkfMqmMT2MS5dxeABzy9/nB798jAZynAmpHlh8FXD1
	 4HC5wt3AzkSKDXg+UXQeXWM+/JKKVipFS+3nw/lqCs1veE0ai/VGiC5vMs3ROekBV/Sld
	 MOtT1Pi6Qjl9RmVFKzz/4mCYORGjt0rQoF21SSKIeSSTlgwQESejJtNwoVhXo7sRhpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MZPgkMdO;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEE606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 03:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FEE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MZPgkMdO
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id O4eCx4Bn8JFmFO4xExBjjb; Tue, 03 Nov 2026 03:12:56 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O4xDxEjtBPdvCO4xEx49lJ; Tue, 03 Nov 2026 03:12:56 +0000
X-Authority-Analysis: v=2.4 cv=ZYIdNtVA c=1 sm=1 tr=0 ts=6ae95138
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=HTRlMjjCjD-Hhe4TcwoA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=mOcWh9+T9pT7E+r9mbBt2/c7H0j+qvFaiVLgF3ZYGIQ=; b=MZPgkMdOK2Bs
	MBS6xbZN6muRvThDjVVFCP4+mLKMhV68KZz9Gw3b5VImVpTHSquhN+n+nlQ0G8AlIgX/uKAmRSKIK
	2qW8GuMVmx6gdBquzw506Hwcp907tDDJFyacDg4GvTGXRrQ9lAQSoDEdRhLKqRHaO7TjDyD+mZ+Qi
	AHSdR16wppzAhWomPvRmyvCCnbMk9XdS6llLNbjH9VYmiLqO24HBi7IiuD3t9AukFxu68hk33HxnM
	dgVr75QtxzOfsQD+rNDBF46DsRJwXv2qtHlUWfEg5tlcFzFmUcCH16136BR45GbZ6UUv9xwrRGq66
	z8arEmfedy7aKfM8q1nPOg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40878 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xD-00000003n7a-2eHu;
	Tue, 03 Nov 2026 04:26:39 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 086/102] hwmon: (tc74) Use ktime for temperature cache timestamp
Date: Mon,  2 Nov 2026 14:52:19 -0800
Message-ID: <20261102225235.334487-87-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xD-00000003n7a-2eHu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40878
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHchRJNUfPYwuMy97+/iAWDkzOarq1tQof774AniltkQLjS+EnCOSjjl1Hw2NbrgE1vprAKe3agHKEbIV6IemplKC5rx3DPznQ4aNngEmvBO/SILInU3
 0/LJhIq8UEBdMau4OYI9LFNGNIl9Ue/3i8IEej1CRZcuBq1qSpGbsiNroF9pcN7sVFVs9kb6Gkfcu8pIAjRqrHRpn94ifjjtYT2+f3uXLZ0BR47brOwL85kg

tc74 uses 32-bit jiffies and time_after() with a 250 ms (HZ / 4)
interval to cache temperature readings. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Convert next_update to ktime_t with a 250 ms interval using ktime_get(),
ktime_add_ms(), and ktime_after().

Fixes: 761c1770f2bf ("hwmon: add driver for Microchip TC74")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tc74.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tc74.c b/drivers/hwmon/tc74.c
index e9113519be53..d997dfa45269 100644
--- a/drivers/hwmon/tc74.c
+++ b/drivers/hwmon/tc74.c
@@ -15,7 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -29,7 +29,7 @@ struct tc74_data {
 	struct i2c_client	*client;
 	struct mutex		lock;	/* atomic read data updates */
 	bool			valid;	/* validity of fields below */
-	unsigned long		next_update;	/* In jiffies */
+	ktime_t			next_update;	/* Next update time */
 	s8			temp_input;	/* Temp value in dC */
 };
 
@@ -43,7 +43,7 @@ static int tc74_update_device(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (time_after(jiffies, data->next_update) || !data->valid) {
+	if (!data->valid || ktime_after(ktime_get(), data->next_update)) {
 		s32 value;
 
 		value = i2c_smbus_read_byte_data(client, TC74_REG_CONFIG);
@@ -72,7 +72,7 @@ static int tc74_update_device(struct device *dev)
 		}
 
 		data->temp_input = value;
-		data->next_update = jiffies + HZ / 4;
+		data->next_update = ktime_add_ms(ktime_get(), 250);
 		data->valid = true;
 	}
 
-- 
2.45.2

