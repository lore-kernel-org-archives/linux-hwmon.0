Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665733;
	b=j37Z8jRD97ULbBaLp8Li9c4nIuSBOwWilBsgccEeR44TelxDeKG5rIpLWSj/88Ovn1Eh
	 keK2BxSlzJ9afsznrnd7ENUnJ+yyKHp4aArF7BLFSY01ZpaU4SinVqrCRNW+1duLQwC+/
	 t2kub2no0ibauDhOWbwnwjwW4EUorAKn5tlWzgJ7AFzbI2WDz28h0orBKASePmQiQYwLb
	 R3Qqtofm6tNTZy4qZ3v+BM4HxNn9OI62XnfEKrc7VdLUwE+Bc1EH1sU5EIJkA8xdTINtp
	 jsbyB6x5OdXq8BGxKJMi72MhiEN2bZTUrE97UKp0IkC6kr1VboDb1uyHys0mjMWjJqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665733;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uYvqukSCFiQz5plqRhrhMKWCMbg9ZyPFqUEAolGB4Zs=;
	b=m4VKOEJpiyjuNXzyJ3YO48oahPRKbkJ7kIep1ksgo2RTnV8y8q9DSCQK3dEt5fJbhlXF
	 +gSI8pwMCLOT2L9SFMVCtvKomqId4MJU4IdScolYvyV3SqHNEwmS7Q2qHXw/8PiKXNv2o
	 wmw5LYUKa/vOQ3Jd1Ns9r/mY/DPfzvhm3NFERjTuDHbDHRgr9JidY1LKXj5AnQHSn4+se
	 a4m92I1DW5cbGA2CmQsMgP2QLTv9S0F3o2Ifog6rZsHUXoNiNzt6Q00JTKCcYysl+pt8J
	 Mgxf6BbCsaH3e6AK9XSfw1x1gIDJKQIRwYOU5sn0mT/RxWYQbXRszPjqaEIkUCtLesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=etIpSZzW;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4006606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4006606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=etIpSZzW
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id NxGHx2iNhJFmFO2ORxB0J3; Tue, 03 Nov 2026 00:28:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2ORxWIpR1fkWO2ORxx0FU; Tue, 03 Nov 2026 00:28:51 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae92ac3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=edvktuduleVQ9f6P3rIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=uYvqukSCFiQz5plqRhrhMKWCMbg9ZyPFqUEAolGB4Zs=; b=etIpSZzW7rqc
	NoJgeEffWh3eypY/0M4vwbQKcEQeQl0IxUWz4S6zclaOmu5Y9X2FO4CmWtnE3EX9wI3Ig+82f8LAZ
	QPu2F1ueUWCAZrFWHViQRjna/x77YGybjKgGhVCbZGWa3LDosdG6qGw0RwnLRYxxyxAyh1vAxaEQM
	pcZ7fzm3n1qjO+xWDj2iYbwe/xNF5pDmJWcanZLATTcCXZtPuLeK0Zoo4Puak2NBgyxzeooh+tnkl
	O1YKrAIFaYDjwrq6rbLuwWWbvNm179r1hrWKuL6fZyoUjMaawMizxIEOSQHvuLna404i1GcJyWMDg
	gvoFZYktSiNUmFsFwc6d7A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40892 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xE-00000003n8w-3yHB;
	Tue, 03 Nov 2026 04:26:41 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 088/102] hwmon: (tmp421) Use ktime for temperature cache timestamp
Date: Mon,  2 Nov 2026 14:52:21 -0800
Message-ID: <20261102225235.334487-89-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xE-00000003n8w-3yHB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40892
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC5DkG7s8bh0B1m/gD3jby9UGFdmfT0e51JWedHoB0RzO4yEPKaXvET53UIosNNOlT2mv8k83+hLiapTAUnAeCnTbwktUxVecIHlOHai0DfrOC5G99Ln
 9hhy3ReUHgPIaGDijr07DQgAk59WsQgPJJtVjGS/bxHyDKiQQsZPM0EvZRRraMa1wAGxmIvRQiKsjEF53FGDiGqYVtHZWyqpnJJaZs8tC8jgkXQktvkxHgZ1

tmp421 uses 32-bit jiffies and time_after() with a 500 ms (HZ / 2)
interval to cache temperature readings. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Convert last_updated to ktime_t with a 500 ms interval using
ktime_get(), ktime_add_ms(), and ktime_after().

Fixes: 9410700b881f ("hwmon: Add driver for Texas Instruments TMP421/422/423 sensor chips")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp421.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index ed00ccfdd7b3..be36f4982c18 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -14,7 +14,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -103,7 +103,7 @@ struct tmp421_data {
 	const struct hwmon_channel_info *info[2];
 	struct hwmon_chip_info chip;
 	bool valid;
-	unsigned long last_updated;
+	ktime_t last_updated;
 	unsigned long channels;
 	u8 config;
 	struct tmp421_channel channel[MAX_CHANNELS];
@@ -128,8 +128,8 @@ static int tmp421_update_device(struct tmp421_data *data)
 	int ret = 0;
 	int i;
 
-	if (time_after(jiffies, data->last_updated + (HZ / 2)) ||
-	    !data->valid) {
+	if (!data->valid ||
+	    ktime_after(ktime_get(), ktime_add_ms(data->last_updated, 500))) {
 		data->valid = false;
 		ret = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_1);
 		if (ret < 0)
@@ -147,7 +147,7 @@ static int tmp421_update_device(struct tmp421_data *data)
 				return ret;
 			data->channel[i].temp |= ret;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 	return 0;
-- 
2.45.2

