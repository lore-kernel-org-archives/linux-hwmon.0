Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660050;
	b=ZBBMxV2UdqMYsuho9mYq6ozvNAZAHaCWOUoAgoV26ojIUve/hu/qHEylVRzJ8Izm240V
	 kaVH43aiHWF5QjEmPV/0BeRK86mhvGMdOwF98KCC5wRVAyySJtH4KOoElDoCQR5WVJA+B
	 fq7czylsQa3jgD5U+RJ8idlVgqCTjH53iRwq4hsWIQlkIHrF++5ssFef3fsK0zP+j5flp
	 RstMeKvH+3Gw46uqd/bUVKh8/m+T1JAV0u5sQyF6q1CZfJfmTmCGnM7Sa+x5oVfE6d6zK
	 TX1nEff7GtaBQokNZNu06NNJWeIttENVq+FQ8LtEkkGwJ9aMbrs78A/jJ3bhIgbz+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660050;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=5guktuoBduGT9M9UdM9rr6ffleF0Gyu0KZ6DoLCNopk=;
	b=00OjFcqKiUoJ9ALuO8M4vSoqR4UO38GEpV7NHlAwJXbuyv4DyTT9hUSkkXVw6U5qfOPf
	 rj59/VbzttSBAcerJGNuixWVHPnIRud3MamYnzInucS7LEuArSjg2q4hWxgKGDRYFKd0U
	 QndDQatCt23oFZ8hOzI6UGMN/M3DZibDo5LjwWqtu8TcbmoIhywJvAuZodnb7d5WRNX4r
	 zDzOT210AeOGyh0GimMSvdLKuUYkjaBP5AaZnggcsWjiezY2RzdXQJnEfsbOi2mCAlwYx
	 v16/mEFQ4cU+a20CRVp3+cQ1L3u5iLLBeyXBYo+NJssX9g6lD33h7ea0wyt+LLxUp2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=R7SgZouf;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58A606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F58A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=R7SgZouf
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id O08NxhFBGc3XsO0uoxXluB; Mon, 02 Nov 2026 22:54:10 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0unxh6cJkE4RO0unx96eW; Mon, 02 Nov 2026 22:54:09 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae91491
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Q5X0AShiIfCyuNSp7wIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=5guktuoBduGT9M9UdM9rr6ffleF0Gyu0KZ6DoLCNopk=; b=R7SgZouf5kE0
	6LEj+3bHNt8+X+39gpAWsgl/mKXtIT13LEBhz2OOl9oIZkp/ylnQHc69qQtWWmu4X92vm3Mc7O52i
	S8ns86LCY4ZhxpBu5KFPYcljhS28H6eFzisDdJjSlJtBcb7/hyn1+IzjZ1HFbfJ8xI7IwuDyrxPVC
	7RpTRk75HPbjnXkgPr1+MwaMvOuEqTw2ce/kakrO9YOrzng3AzPbu0/K7VX7sZ74sLuX9O4UVijxE
	1x2zvl6V/I1hOfNIMrr1jkvWDJD3XgDeGR8zTB0Y8Mt6hWHWZmj3CRPFFpwpkf+YvyQY5+P0nA63s
	uxdMwksEynFzZKhGMqiKXA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50190 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0un-00000003l1l-0DGS;
	Tue, 03 Nov 2026 04:24:09 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 031/102] hwmon: (ftsteutates) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:24 -0800
Message-ID: <20261102225235.334487-32-linux@roeck-us.net>
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
X-Exim-ID: 1xO0un-00000003l1l-0DGS
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50190
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 68
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB4KDhhGgsBP1j2XFEo5OxLR3fv7Rx3uZyPDmTiwcFcvXeG97yBaw7g2duZRXaawm8QKUnbs4eg6iyWpbq9+sweNoRyxsm7/DOtskltuQOAnNjF5Deas
 YGk4kfQHSLymSvWrPYKFOKgmke+/H+MkMmrUwjVRBrXLYRaXvvUgMCVjwjNGKZsBzqDeB4ZzvSW/JBFnrSmhigEVgEFlyK15EbVXSOAouIxaspktq6uWJT0k

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 08426eda58e0 ("hwmon: Add driver for FTS BMC chip "Teutates"")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ftsteutates.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 10d786960ed6..e9cd7c672733 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -62,7 +62,7 @@ enum WATCHDOG_RESOLUTION {
 struct fts_data {
 	struct i2c_client *client;
 	struct device *hwmon_dev;
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 	struct watchdog_device wdd;
 	enum WATCHDOG_RESOLUTION resolution;
 	bool valid; /* false until following fields are valid */
@@ -131,7 +131,8 @@ static int fts_update_device(struct fts_data *data)
 {
 	int i, err;
 
-	if (!time_after(jiffies, data->last_updated + 2 * HZ) && data->valid)
+	if (!time_after64(get_jiffies_64(), data->last_updated + 2 * HZ) &&
+	    data->valid)
 		return 0;
 
 	err = fts_read_byte(data->client, FTS_DEVICE_STATUS_REG);
@@ -188,7 +189,7 @@ static int fts_update_device(struct fts_data *data)
 			return err;
 		data->volt[i] = err;
 	}
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	return 0;
 }
 
-- 
2.45.2

