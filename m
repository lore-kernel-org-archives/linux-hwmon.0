Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663737;
	b=C0m82S/imR8I9Se2kAIEPY+X4mQVggKiFCyxuqAscVpZAi7m5+6Dr/yuQb0oFlzpvawI
	 07ahz3NAmKP+EzvY9wD6K7eBBq5jgNqfA45JMYjAGcwQLXavf3+ZMKohVRcD3MtamUcgs
	 sqBYVorVQG7CAxeOBzKcTvywaThp5uXe2brgqs7IjU/n6nkZBcjxvWIGlnsUl8ERMU5Rm
	 TKCWCEq38IVa3xB4Rg3p4/z0ndzfZ1RwiRHGAepbnmm9+z+nn8kIz+4UwzfxNCOL8QuOT
	 0xaTiDG4BtDlm8K3oIKyR9HOwTC2un5ZrIqH480Tsk/hAOT4qUoYrm1aqFNsBZGTjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663737;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uiZvmKv47XRtSgvr/Al//7/4R5iXmB/46btnuy60e0c=;
	b=5AmpzUO4AaQq7n5s6fYtQYYadfn+mEaUhDmcPYPiEh+WkfpE59cu03/e6Xbi0JYs/wCA
	 ygWhF+HmFfLpvBfSeQ8/ekLrof3lsDYM9e0sKEiFU38mPdcIUfDfMHKri8uLUPAG/7NKi
	 K3eoz3M/Eh9t835BxvnSU+VgGtXzZo/VZfSBqUulsqf7P2QffjcyTGfhLDEJrEQiNsMyO
	 Vi4SXn9NB2yShF9k9YO0qO1leISzSSmAqXcOJleuo1rG+3M9eZ8HJpP2s3GBZVyhzzyqO
	 qFYVEejVYTIOb+bCLlLqtm1ZC6rF55L/6BuPXvmkDId2QooKNCeE0HEt/x4TJZ/tQpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TnkFra76;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837A606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8837A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TnkFra76
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NntbxWQEHLvgbO1sFxlsVZ; Mon, 02 Nov 2026 23:55:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1sExjSlnsTgvO1sExz64a; Mon, 02 Nov 2026 23:55:34 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae922f6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=F58LOIlpOzwXfb6XZE4A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=uiZvmKv47XRtSgvr/Al//7/4R5iXmB/46btnuy60e0c=; b=TnkFra76k3wE
	zznHeKVp6vKwtdU5uAvWP/ldJcUgTmRe9TjNRkE9RTv/rUN3RB9mVF0DiyxVV0dTVvm4VGm9ra/Os
	QUtvAbFpFT1qT2J/3igSZabd8L3XrQ3TgW+Y/l4npK6cGl2yTMlMlMAGsEnCP0EMs52pvM/36O935
	4BMOTJr15amduk19tmUTtYkBtv46aK0fqzwVdHJYX9sVbiK4AmbgT9IP3L33skj8KPaRjMlNVfh82
	aS8wAF76BVFrRU48FFoZNTaTXKRAN41Bk782RVGH/J97vx9b0tYK3I9UXBNISZyXBWTeDfkFsTlAe
	cr1V+tCSJY4gOOihR7qOdg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50866 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wm-00000003m2A-0ALt;
	Tue, 03 Nov 2026 04:26:12 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 076/102] hwmon: (sht21) Use ktime for measurement update timestamp
Date: Mon,  2 Nov 2026 14:52:09 -0800
Message-ID: <20261102225235.334487-77-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wm-00000003m2A-0ALt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50866
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO9UNNEtWkG7TltJnprDXBVcE48OgVpFlywggZKFtEK2FHXXU5mGPqW2+UJPWJJ8JJABNwWgXg+pErPdCT7yEPuDKJPy13RnYv+U7Cj3FWa0vFf1vJWp
 HHwLPu4v02XBs532yMOM5m5Wv/vCeuHV4MHlijVSg88uDVp6B3bzAB0qzBzIwlLi0sVSNH40sdJCPZF+VpVHbGzeYSeaKPhs0YamvwzIGTB6KiWX/eFdnjfg

sht21 uses 32-bit jiffies and time_after() with a 500 ms (HZ / 2)
interval to rate-limit sensor measurements. On 32-bit architectures, if
the sensor is not polled for about 24.8 days at HZ=1000, time_after()
wraps around and cached values stop updating.

Convert last_update to ktime_t with a 500 ms interval using ktime_get(),
ktime_add_ms(), and ktime_after().

Fixes: 430400b86304 ("hwmon: driver for Sensirion SHT21 humidity and temperature sensor")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht21.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 085492669eeb..d0864b5f219d 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -15,7 +15,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/device.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 
 /* I2C command bytes */
 #define SHT21_TRIG_T_MEASUREMENT_HM  0xe3
@@ -29,7 +29,7 @@
  * struct sht21 - SHT21 device specific data
  * @client: I2C client device
  * @lock: mutex to protect measurement values
- * @last_update: time of last update (jiffies)
+ * @last_update: time of last update
  * @temperature: cached temperature measurement value
  * @humidity: cached humidity measurement value
  * @valid: only 0 before first measurement is taken
@@ -38,7 +38,7 @@
 struct sht21 {
 	struct i2c_client *client;
 	struct mutex lock;
-	unsigned long last_update;
+	ktime_t last_update;
 	int temperature;
 	int humidity;
 	bool valid;
@@ -93,7 +93,8 @@ static int sht21_update_measurements(struct device *dev)
 	 * SHT2x should not be active for more than 10% of the time - e.g.
 	 * maximum two measurements per second at 12bit accuracy shall be made.
 	 */
-	if (time_after(jiffies, sht21->last_update + HZ / 2) || !sht21->valid) {
+	if (!sht21->valid ||
+	    ktime_after(ktime_get(), ktime_add_ms(sht21->last_update, 500))) {
 		ret = i2c_smbus_read_word_swapped(client,
 						  SHT21_TRIG_T_MEASUREMENT_HM);
 		if (ret < 0)
@@ -104,7 +105,7 @@ static int sht21_update_measurements(struct device *dev)
 		if (ret < 0)
 			goto out;
 		sht21->humidity = sht21_rh_ticks_to_per_cent_mille(ret);
-		sht21->last_update = jiffies;
+		sht21->last_update = ktime_get();
 		sht21->valid = true;
 	}
 out:
-- 
2.45.2

