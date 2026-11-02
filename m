Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660023;
	b=xvVC7ddWhupq7v/IS2sgFK5YnEV9e8NC4vAt23dp5O2b3TOWDSuWwIqqyECuuw24f85V
	 2aY5MlMTMPu0CRBucmPyOpLIYsCXyWIjU6QzAk8ML/7VbJF0/yKc+jkLbErBRN+7+TEGc
	 QzlZzgyzLAkovRUjY5TT1xz013aKWjXWuGGBEKd1ASz/MZ+gtqbhyiAsWVFKoNsAiwL77
	 aDeZvS8eOmJg5ZnKfNGPOtEBnpjiZzOS7GDiFMvSQjKUFaG5n/MpAjvpr76KMYk7a4v2j
	 4GYG0Mxi1qYa6iBpi4FbS1T9pHRzaKSoI+of69W+JOnrdN2iHD1Mw96gmU+cjcE1fdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660023;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=BtPRldJFEZtcJl4iONdkFUpf8WeMq9Nk9JADj0WcDME=;
	b=ZC3EUMMgh8+35YjcpRI0FzIB5xM5wchCAMAZqBwkkNnmzoEaIDF8U+6zlH7O6z+CCZcg
	 Bi981FtM58EA1QS/a6pH9A7+v6uhCjg9jtS7ryLyzhc3MCW7ECjzgRexC4aM6mw9VBDsr
	 L/ZT1lWFrVZce03YM28q8nKXlK5sp2AnHxmcqek1HB6crPFrdZjiH2ooQusEZzE1uQtwA
	 D1N5IuH2IWt2fXfJFxpgGzyTcOucBoSHSWg/uVVVmLlZJ2GkBq3YrQnpPuAQMevkcyr0g
	 UxUBMxTMj1BwcaDiLi1um2VtOD2qr0G9wNyzBnCL31vB/ioViVtbRMJhz0vUC0ryhIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hZVD2XIb;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AB606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416AB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hZVD2XIb
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NxG6xYOXGLvgbO0uNxlYqR; Mon, 02 Nov 2026 22:53:43 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uMxPM8VLr2uO0uMxE7Ji; Mon, 02 Nov 2026 22:53:42 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae91476
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=1Ez6V3JJn854t96LNywA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BtPRldJFEZtcJl4iONdkFUpf8WeMq9Nk9JADj0WcDME=; b=hZVD2XIbuRxH
	xj+03300iklopm/CCXBYTG+p3Jxfh9+Bb9TV804n1a29k2EkEH+0PrJjE7bnI7lINc6Cr7aUtwMA7
	3cjeI5jQNHaFHKhLsx35HdXEwQeV+pj/YCvW+PBo0PfG4P0OXa+GhAdSqwd6VfbVvXe7f7dgIy3+z
	jZ1PmK3tQK7L0c/Ki6etbgLd9AQwNO1MzvZ63AO4IAlMGCI8lzgQwJXx2bN4WHQVqAaEj+0Be66e6
	F2H4D98mGd8XVU89bCtc+HojY8d8ojWMgeFiRnJIwjmS7vU/E9TCc8Q84AvdAQ22kVLHleDKlKGan
	jNpTHR/1s/HfK3OZGFwxrg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33190 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uM-00000003kW9-0GhV;
	Tue, 03 Nov 2026 04:23:42 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Juerg Haefliger <juergh@proton.me>
Subject: [PATCH 022/102] hwmon: (dme1737) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:15 -0800
Message-ID: <20261102225235.334487-23-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uM-00000003kW9-0GhV
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33190
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 56
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHNCcU+zeo5HjawoIzA00llzFGkZ+prI7wCaM6PgIr7snQ9OQb/6lNyUobmN5F1dgIrQq8b2pvIW2BR8zVVwj+X6nwNP193sBeLHVAkp6eiRQUKYYi2r
 9KnuI2/NfRSZiQEdBz9W81U/yftMANu0W1nTqrw/0kc/EeCFu6z562v2E7EIkThjl/YpOZTq14h9uXSug58ABeky/F8LPpA9rbxOaOGlCaLO7VKLGe8TuPmS

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
Vbat monitoring and cached register values from updating.

Convert last_update and last_vbat to u64 and use get_jiffies_64() and
time_after64() to avoid wraparound issues on 32-bit systems.

Fixes: 9431996f55f8 ("hwmon: New SMSC DME1737 driver")
Cc: Juerg Haefliger <juergh@proton.me>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/dme1737.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 7e839308e58f..b1bd3682c5fb 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -204,8 +204,8 @@ struct dme1737_data {
 
 	struct mutex update_lock;
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_update;	/* in jiffies */
-	unsigned long last_vbat;	/* in jiffies */
+	u64 last_update;		/* in jiffies */
+	u64 last_vbat;			/* in jiffies */
 	enum chips type;
 	const int *in_nominal;		/* pointer to IN_NOMINAL array */
 
@@ -600,14 +600,16 @@ static struct dme1737_data *dme1737_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* Enable a Vbat monitoring cycle every 10 mins */
-	if (time_after(jiffies, data->last_vbat + 600 * HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_vbat + 600 * HZ) ||
+	    !data->valid) {
 		dme1737_write(data, DME1737_REG_CONFIG, dme1737_read(data,
 						DME1737_REG_CONFIG) | 0x10);
-		data->last_vbat = jiffies;
+		data->last_vbat = get_jiffies_64();
 	}
 
 	/* Sample register contents every 1 sec */
-	if (time_after(jiffies, data->last_update + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_update + HZ) ||
+	    !data->valid) {
 		if (data->has_features & HAS_VID) {
 			data->vid = dme1737_read(data, DME1737_REG_VID) &
 				0x3f;
@@ -777,7 +779,7 @@ static struct dme1737_data *dme1737_update_device(struct device *dev)
 				dme1737_write(data, DME1737_REG_ALARM1, 0xff);
 		}
 
-		data->last_update = jiffies;
+		data->last_update = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

