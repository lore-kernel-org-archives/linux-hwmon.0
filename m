Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660064;
	b=5sYHr281CQvu/ojIfejoffStUOxTilrhBVR+WJqCrUD0eBgt6o3gq3wwcRlEkUKhkidd
	 J71I3PMrIu7BnhUAN18NbDXUaJ/+xNl1WrXBFCjZRdeMDpRadvKK5VW378tCR2oIZxxLW
	 tzSVGfJe8YpJzdN0Jc4rthqrUmPFo6kuO+ZYpAoYXR+yL6tBfgOhuqPnnt62ueOCa3Xyf
	 RNKFg4IhjBqtcMYNWYu4EaTC8Amch0xfUYqiql7iJH9goC13+msK/aZSztCoQh4hkQfi7
	 MLs8kcUz2gjJCOckC8KUxYf2ujmJSiRRLtJGuTwA0NtA40nK6DRW5qzi0bYUgNOC5qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660064;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=gUX50HdAN0ZfqrjG+PI7s2I34K87SFOUtV2a50PyXOA=;
	b=n6uiCdleOGch8dSIsOaz6nzamTMryhvEaewO10KawDXo6yTL0JT0GD8sqxYpx6slQ1ve
	 NfYgAjtBIoLc6E56hvtDwU33wdvWA8xQzE+bXCIHNVECSPuK6pzPLDkZLg2D8wk6OOMAW
	 x1ZrhsRgzBRx+i5je5NstQabKTwyTUA4RB6EDEq51rd3DqoXlLJdb+no9w62Qdhrn7s59
	 aFzL/iXrM7PZiTCVWHSyCLeOfqFupY8AI5sKCak5m5W+hmrokUbPBr4p4gujmyOCjfbOm
	 y2QpKO8/4sh2nP5os+Fll4XYW24uLX8hXWN4YBuRTyUE2epIhx6lOeDKGuYcFgVliCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=S9YJgI6c;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F722606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F722606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=S9YJgI6c
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id O01FxYyKuLvgbO0v1xlZ2W; Mon, 02 Nov 2026 22:54:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0v1xtB0sNSXiO0v1xBn2H; Mon, 02 Nov 2026 22:54:23 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae9149f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=ilOIWS5R-OArs2VqGPgA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=gUX50HdAN0ZfqrjG+PI7s2I34K87SFOUtV2a50PyXOA=; b=S9YJgI6cPq1l
	ln3FI6K43GL2hZKndqfsyJaFdO25IpwXkyWM2f1eKwSFmMmGWNMjK4VqUgEzBi7PYcRKZRaDaeFjG
	2mGIVSuK0OsyyrNGyIDhN5gA3G8Vksxcq7LyX/jsvB+GslSfqyx/TIUwJI48zQPyuMGyadbOe0H2b
	3ZsHL2eg0CH4TXw+yJhx6TDugSVFWN89F/I+Gy8r5LiIbU04cGshr3NXSIhDgX2nk2gi+C49wxoRl
	yycZXBkUnYYjJpyW0HmCc3M0cWD2Knyv79OMsO8HQfe8Ti4Z7K1+mV3j1ZJBN0t7t3Grfg1GCFB+1
	dSoWNvjLMF3XqjEpObrn4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33560 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0v0-00000003l9A-3KCu;
	Tue, 03 Nov 2026 04:24:22 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 036/102] hwmon: (gl520sm) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:29 -0800
Message-ID: <20261102225235.334487-37-linux@roeck-us.net>
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
X-Exim-ID: 1xO0v0-00000003l9A-3KCu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33560
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 74
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfECC1QEEgWs0DrusYr6aVINwCo8r9Wa5uNOvQCuNNDcotGwppw1J9vV9UN+9PYRplibr/OrThcB0a38hw4tIbW2TD9esG5noCBQ8IzDzx4VniJVtsqVd
 pEnuU555vJHMYDFYpVIIGUD51Xn3mtAm6mvsZkkgdiW+7ZTjk47cROkXyhoboMagNHRjJKIObR5/54fQKffeP/0U3E3S1EKy6RDKXTNUuxTNTXtm/ZxlhdqP

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 0cacdf298211 ("[PATCH] I2C: use time_after in 3 chip drivers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gl520sm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
index f4fe39912ee2..330bae7c1a95 100644
--- a/drivers/hwmon/gl520sm.c
+++ b/drivers/hwmon/gl520sm.c
@@ -65,7 +65,7 @@ struct gl520_data {
 	const struct attribute_group *groups[3];
 	struct mutex update_lock;
 	bool valid;		/* false until the following fields are valid */
-	unsigned long last_updated;	/* in jiffies */
+	u64 last_updated;	/* in jiffies */
 
 	u8 vid;
 	u8 vrm;
@@ -114,7 +114,8 @@ static struct gl520_data *gl520_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + 2 * HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + 2 * HZ) ||
+	    !data->valid) {
 
 		dev_dbg(&client->dev, "Starting gl520sm update\n");
 
@@ -173,7 +174,7 @@ static struct gl520_data *gl520_update_device(struct device *dev)
 						GL520_REG_IN_MAX[4]);
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

