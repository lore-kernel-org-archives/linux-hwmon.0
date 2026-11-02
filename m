Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659997;
	b=vELMz0EhNlU/x8+9z5bzEBhxUtJoTZprn6qXv1R4vZLIQSNJi3ty/4zXE2/zdRpr3PFY
	 eSI/tMw/zVY3QPU0pj3urcxo/H7oYjJNBfkp+5FmgfR4M+QTgicXTF4n2QQgG8boLuDyG
	 cbhcq30HzqROk+HkjzuI5v8d2Wrb4butvp4s2R2TdbPqJ6yUb1XgDSBQeo0PklT6RiUc6
	 b7uFvxNStfw0uQ1KhJtl+F2wW4kmvQJR4WkRP5VKRBrOT0vrkMktJNb4LKdTU5Adtx8FL
	 LyAJXZbt1lQYrnBsLL8Fsmf7Wh3g7a39zrHOo7gNs525vjQZncwOdk6RiUutSxiHn7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659997;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=PPJEDp0pbuRB06gEH82YS0o8kBSQRsbJTEMkQVXX4gY=;
	b=leqB3ClpjJddPb5Dj2Jtof6NEm+Jlf1xIot3h5qPglmNrA0nYIMBACe7YXHMeYtEgd+Y
	 7GafClTmuDWE1sJSXhlaghzoA1sI3CcxeH5Gg0EVJ6EKbiiQP+eVBY/Z4AnGpydL59x76
	 DeF+VWXTcz3p6BVgIdflccyf50Bx2XTJKiRI5cetubqtutI7UvxLLQh+5kyOjEDaoRWWy
	 kjIwROJqY1JTbDnY1MoQsWS7jhOK1tSqBT7L332wqcVZkU6B0AENFk1gmWi1UwLqscE9+
	 IgkM2ynLbVcfelUz7wMLJrvvP/tCELaWMeGWQeuPwJfLnf9pDj7FICgBewhD7IqNctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="HRm+T5/K";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4D606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB4D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=HRm+T5/K
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id Nz8Mxh1rfc3XsO0twxXler; Mon, 02 Nov 2026 22:53:16 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0twxZsFF1xnwO0twxyCfD; Mon, 02 Nov 2026 22:53:16 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae9145c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=LmQz3euqTSeIaL7mLMAA:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=PPJEDp0pbuRB06gEH82YS0o8kBSQRsbJTEMkQVXX4gY=; b=HRm+T5/KwT03
	l25DOxDw5yBpWbOmSK3uZLqzteP9KdupeiNXFP8dwXcgLSrK5jVi/S1V57HAdX9pXv7CFJQmq/Ejn
	EYEUYh2wnyDlTDEansZv+MUeScFYETpXdEcpisaHYAQ00uc3yGwLYWAftZhaDD3F24Q1CUCNjXDz6
	0+IjoOaaKsYpLGeNqDPlaBFAAA/FkyNUc45bpOkvGN077Cszra6jJMz9C1YxBfVc5jJcRv03X00y7
	MQqPww0vNxQYBVPUMUoR28MDvvivaOWxfkZUCH27Mdlr2VxLG/ndgUnJzZ5BBIDIkAsvKGGyCLFcF
	TCHf8BOfTTIGjzJ2+2ItqQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52056 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tv-00000003kHa-3NdZ;
	Tue, 03 Nov 2026 04:23:15 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 014/102] hwmon: (adt7475) Use 64-bit jiffies for measurement timestamp
Date: Mon,  2 Nov 2026 14:51:07 -0800
Message-ID: <20261102225235.334487-15-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tv-00000003kHa-3NdZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52056
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 40
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLy+bViRmv97BDkRxd2eYZ7/ki+wOYi/bmTyehfSDyb76s25o+rRHYWnex4devDdHCURCnCTu15IeD3DP7mIOBU2IulIovECyvtPb6qQUobZrXk4lRWc
 fB9YqHJ1vXfYlZdjW0oexnqAowtuK8ety4Y0VTKhdpZ068dbokqTGZlkFe+9W4gQLKcpqquvKtZ4ymrfe1OZUkJiYR+dUt9X1809Wfsru9sMK/3Vgy5j/AD9

adt7475_update_device() uses 32-bit jiffies and time_after() to check
whether its 2-second measurement cache has expired. On 32-bit
architectures, leaving the chip unpolled for about 24.8 days at HZ=1000
causes time_after() to wrap around and stop updating measurements.

Convert measure_updated to u64 and use get_jiffies_64() and
time_after64() under data->lock to prevent 32-bit jiffies wraparound.

Fixes: 1c301fc5394f ("hwmon: Add a driver for the ADT7475 hardware monitoring chip")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7475.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index cd0b69ecb640..d505328a7670 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -199,7 +199,7 @@ struct adt7475_data {
 	struct i2c_client *client;
 	struct mutex lock;
 
-	unsigned long measure_updated;
+	u64 measure_updated;
 	bool valid;
 
 	u8 config2;
@@ -2193,7 +2193,7 @@ static struct adt7475_data *adt7475_update_device(struct device *dev)
 	mutex_lock(&data->lock);
 
 	/* Measurement values update every 2 seconds */
-	if (time_after(jiffies, data->measure_updated + HZ * 2) ||
+	if (time_after64(get_jiffies_64(), data->measure_updated + HZ * 2) ||
 	    !data->valid) {
 		ret = adt7475_update_measure(dev);
 		if (ret) {
@@ -2201,7 +2201,7 @@ static struct adt7475_data *adt7475_update_device(struct device *dev)
 			mutex_unlock(&data->lock);
 			return ERR_PTR(ret);
 		}
-		data->measure_updated = jiffies;
+		data->measure_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

