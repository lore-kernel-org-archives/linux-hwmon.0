Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664215;
	b=bMELbHOLamgmBYXM/CubBwAXOmihog3z6du6GwAHJ26p2UUbpEi6aGu7V54OrMh+QaaM
	 m6iSOhxcsaiXErAMEFW6SE6WgUDLyrk0vFA7KGP2kHvbL5NMouIw0cEpgKqc/0LYcFzLF
	 li+/R+NPx4nowj7POt6c77BPsFOx7Lc/b0kYDaCfMFwjEB3xrDy621KG0YUj+uQ75o4B2
	 /WrgiInjKeNsAGj0zDykFsYAhRnqfUjBLP5xq7B4d77EVJuQSlNS7CXI0IvANWtlA1lV2
	 0OrpX/bUNiQsgqnEjldlhdwjIwYN7rCJLzTslBu/IWBZaztoMIGfxiHSUs9MjitZXbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664215;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=J4lgjquzVH2i2BDt8Wzw9XS9LTjHnM8PziqZawBThys=;
	b=r3c2h7THFcQ6K3hVkcdwJTNrkO2SqO1RJr6otFR6GTMisoQXVYgMOJzteK++RYlgUf4w
	 sSKL+zjCpADWM7X5sW9tCL/kNoAFo07Xt5fIUT6w7IDrpzDW1e8pYf5O5by6Plauky06X
	 e6ZIbjfKGaUl4cmTBZ3GWm7InjEPf5SUCuDenmDt+vCZwMiZrXyEEY14q1i2ja3u3kOJl
	 3a9XeSyUV/0wgxIW7aqqRxhwagk3bSTLghv8i8sCXmi8Iu4lW+d71//Ye9zEUmMWWeOUj
	 /g1FofEAigKlwtAARJ2/oAx5GCz4RVw3SiSpwNt47hnDX0TCraMJBaNkY7ZjiMQzgag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lcg9ObCN;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F00606D808
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F00606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lcg9ObCN
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NzA5xYnkrLvgbO1zyxlvff; Tue, 03 Nov 2026 00:03:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1zxxlDEXmTkmO1zxxkEuF; Tue, 03 Nov 2026 00:03:33 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae924d5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=cS1IJI1iOVyJRYME8-0A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=J4lgjquzVH2i2BDt8Wzw9XS9LTjHnM8PziqZawBThys=; b=lcg9ObCNmtzS
	oWe4TRWgw2j8g2aLGOmL93/HMwQVVnhR2Rn6PI+T+TC7R5QmBS+9lnx9rtdM4dFt4xhJyVa6lWPR8
	1g1oeSh+8pF0zmXZL9fcRJADv9rWx8vUdI4XVDbs2ght9VQ8TKBb0L6NYw4J/1vHD9I/DIexvTL/q
	giPcmUGJv7anUAa6jo5h5oq5v7KuaIymdg+C06wkpfhCRUCnCWlIMKL4WQiTvpWsXrze7kcnx3SA4
	dqXtDM2LMpG+zpcjcMn79uRIQX1IXbmQFnw9zQVhESX733DzMTbQkVGBrnUbgrh+cB+JqI0ZMxpYu
	1dQlEZQFeHy9012v+SeGxw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58328 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vh-00000003lVK-1Cik;
	Tue, 03 Nov 2026 04:25:05 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 054/102] hwmon: (ltc4151) Use ktime for update timestamp
Date: Mon,  2 Nov 2026 14:51:47 -0800
Message-ID: <20261102225235.334487-55-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vh-00000003lVK-1Cik
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58328
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGqfkaPRYDl+f/gL6LyYHddAe3yN+Z7M8Y/IDizPisXUQK3r8x4sNWsXzXFx0D2OEUaSEqJF7w379dq0JRx0ObwL8lcJFqW231UIGrIGFXX9zV5d7B6Z
 muXXe+bgnx2UDYLpNsOOhdx1/7ElU4FVS3rb+QSG2cj9xMs1zAeog2njPvp7hiUPLPRAdlsrcVJdSZdxSUok/H2By3OWfLyg4fJgVjoJetlK57vX48uKA4LX

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached ADC readings from updating.

Convert last_updated to ktime_t and use ktime_get(), ktime_add_ns() with
NSEC_PER_SEC / 6, and ktime_after() to avoid 32-bit jiffies wraparound
and coarse HZ rounding issues.

Fixes: de7790155f74 ("hwmon: Add support for LTC4151")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4151.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index fa7c57aae5f5..8115b2a34a47 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -23,7 +23,7 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 
 /* chip registers */
 #define LTC4151_SENSE_H	0x00
@@ -38,7 +38,7 @@ struct ltc4151_data {
 
 	struct mutex update_lock;
 	bool valid;
-	unsigned long last_updated; /* in jiffies */
+	ktime_t last_updated;
 	unsigned int shunt; /* in micro ohms */
 
 	/* Registers */
@@ -57,7 +57,9 @@ static struct ltc4151_data *ltc4151_update_device(struct device *dev)
 	 * The chip's A/D updates 6 times per second
 	 * (Conversion Rate 6 - 9 Hz)
 	 */
-	if (time_after(jiffies, data->last_updated + HZ / 6) || !data->valid) {
+	if (ktime_after(ktime_get(),
+			ktime_add_ns(data->last_updated, NSEC_PER_SEC / 6)) ||
+	    !data->valid) {
 		int i;
 
 		dev_dbg(&client->dev, "Starting ltc4151 update\n");
@@ -76,7 +78,7 @@ static struct ltc4151_data *ltc4151_update_device(struct device *dev)
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

