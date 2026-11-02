Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659995;
	b=YkVE7yPiNmvSJK3jvZXmOF4zOUis+vORIYMfScDmgI9Li2asfXIk/YGAQnIJqe2iKVyk
	 d9IESoQBpMlvrZZF6ejObbAmB2bKwU/j5qx/IFasi5Qf43JtXOtOiFIYDF/SXh9zz3BSV
	 YOrWpLdASqsmoPdOUh66uHacL0dLOWEIBOIxfinf6Sz3bD86RVzTLUALAJepjeRIx1794
	 x3Y6BBKdhTZmZ5iPluirf13J3QNTl+pZXUuJyqOVT14FS2gpaH1rmtun3sp6eqULbHXPv
	 RePYeJPa72zPhJSPEDLMZ8ZkVTwc8aQhR4sE3+VYqriPltz0F4S9D2TNboNES1vGfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659995;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=+w0EZXpJ3xtmvDwnHtujIqtYDSwHjTp1QToGxopicEE=;
	b=3sUNdRLOjwcCB8ZG71mCfMtb4YY4TTGFFy4K2fePcgJSCGjRp6q86JYFoFSnUkme+QQI
	 2GcSQ5dak3Uob8lZx/+VkzcGicR/t+lxxQ2ASqKZZxeLVsxlX5C9dpCHMgr1cWgZ+boxm
	 kfhnohCEojj47FerSPI6Mg8UbgeiYsDPiYVsJKXO9zu3ZVE8AVJAQY/VK3prtJw2Le+xt
	 IFAaQD5qIkROzgMmXtx2Ge7paJ5sglS2zKLU4TC/YPBN8ToZXOPIK7pnERgdVWUER6ADA
	 I8Jn9jb3acrGRxAOvd3psdyIQpXk4v9/uuzpGQ1EJzv5QGYejZAOYkEPef0J2bv9lmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f9JiO7Q1;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B82606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B82606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f9JiO7Q1
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id NvT3xDd4HusRSO0tuxswDR; Mon, 02 Nov 2026 22:53:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0ttxZ3BHbxHHO0ttxkEPS; Mon, 02 Nov 2026 22:53:13 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae91459
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=wSWUAEoMOW1_HbrAamIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=+w0EZXpJ3xtmvDwnHtujIqtYDSwHjTp1QToGxopicEE=; b=f9JiO7Q1n2Gl
	tPMKPLn+po1aNEdCEgnEutjXTavR/VGR1fnjFxhbDx00MEygfsedxadGikQ/HcW1cYSpzWaIIA95T
	KJFjY9CrAG2/Osil2k6DY8hqGL2IKjqxVIUjSBkvYKADuaUqZK5lZGaIRZQuh2DKiH1sEdAdxQTfP
	svdBO5wFzSm2mYHEKQPlecvsZjEYc95y/Vi5wCQQkeHMoawMW/Ja4Oo2vIixgdXU7oz650n7OhGbP
	LMc9PrPi04+OS1poBBXMLQ8kXOOhmMc/P8+g6WhhRwZ+ckRhoa3kMjHCxQ/3SO+rVWrHq93dJ9XTn
	0aftAcmQEuw3pnnMDo8elQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52024 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tt-00000003kEi-0qF3;
	Tue, 03 Nov 2026 04:23:13 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 010/102] hwmon: (adm1031) Use ktime for sensor update interval
Date: Mon,  2 Nov 2026 14:51:03 -0800
Message-ID: <20261102225235.334487-11-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tt-00000003kEi-0qF3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52024
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 35
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE3jkrXoxSb9qP1Zi2DRgN6TrbhPlnBSjpmKEJTVLRi2ZvvSi9RBxI29RCiDGbDZ598SFsjmOdNM3pvudoD1XYKv9gXGScdBAATaXMYF+H6U/EeazE9a
 3kbNAsLJYXgtKAECOAeix31lIQRUbZokWzNtkhkZDsCpS9DeBpc85cTQLwHD3sp8RGh0UhFbjv1kKN7BlsvUmpCtspbPncIdXNKKyuliCf8UeeQAj/kxuTVT

adm1031_update_device() converts update_interval (125 ms to 16000 ms) to
jiffies and uses 32-bit time_after() to decide whether to refresh cached
registers. On 32-bit architectures, leaving the device unpolled for about
24.8 days at HZ=1000 causes time_after() to wrap around and stop updating
sensor values.

Since update_interval is stored in milliseconds down to 125 ms, convert
last_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() under update_lock. This avoids both 32-bit jiffies
wraparound and coarse tick quantization at low HZ values.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1031.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 24d0d4146c87..cd98871426be 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -66,7 +66,7 @@ struct adm1031_data {
 	struct mutex update_lock;
 	int chip_type;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	ktime_t last_updated;
 	unsigned int update_interval;	/* In milliseconds */
 	/*
 	 * The chan_select_table contains the possible configurations for
@@ -108,14 +108,14 @@ static struct adm1031_data *adm1031_update_device(struct device *dev)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long next_update;
 	int chan;
 
 	mutex_lock(&data->update_lock);
 
-	next_update = data->last_updated
-	  + msecs_to_jiffies(data->update_interval);
-	if (time_after(jiffies, next_update) || !data->valid) {
+	if (!data->valid ||
+	    ktime_after(ktime_get(),
+			ktime_add_ms(data->last_updated,
+				     data->update_interval))) {
 
 		dev_dbg(&client->dev, "Starting adm1031 update\n");
 		for (chan = 0;
@@ -186,7 +186,7 @@ static struct adm1031_data *adm1031_update_device(struct device *dev)
 			  (adm1031_read_value(client,
 					ADM1031_REG_PWM) >> (4 * chan)) & 0x0f;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

