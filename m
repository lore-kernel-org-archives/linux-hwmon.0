Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660063;
	b=479t2l6vdFfjNR7ilKlXpmbaQztezGVo8nNAR7yh6M0Lxm+Ku3AgxtMpvVcOpycYQtzy
	 eWeTU7nspSsa0ZDWalokGopLXOixNVDbPzxGNgCyfrf2kqNQB9u4SV2zDeWd9jbsxA6jb
	 RPjMz+/jGak2WOeAKO7RvFhkoaPcYuDRJkSENjRYzUkK6q0NTB2JRBx35Z6ARMf8uz61V
	 RavnhUcRd62GMMIUsrHrdnCPEe+cKG7QszFFUOliItgabatmd/QkVmnvJTGBf6o+IW9a6
	 ZbFgXLzEjSB3ipvK7nxOq3WIG7fMIg4+QRF4babIs7uh9evCfLU/m/70HQYRVrJ5FNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660063;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=7hvbpTU6B6G8vksJy5iu323Yx4GK13tTXHVAw17cu5Q=;
	b=Fbgu8MUtNBuNgaZek4ozvM3fAcKMZMH2Ed8F+Vb1H9vQWwWDm4EL61PCFxHvJCuQAAjw
	 +GmROhPCqCyTx7P8KXcQSku+er/iV39ywGPZ8w4ucWWpRuhe5UWidnWYofXB3lfsfh3z7
	 nabc7e9SdwcUsP/7qwozHwtb9br8NMCE3fD+vs6SOdIjllQwyhs19IWzvYIZ/SBJJ7F4t
	 jas96E4USbQ7YLIT8OrAiwC1MYSF+gKi1FCNuOzzbZSvzxnm4z6HVoakvg4QcJnOOVc+c
	 SVy+DqCrhou9HMYhU+KODqKtuk8ZxMK8zRcEncdf78KUBXtpMq8H+awN3kbbL1K3qyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LDVDeg7X;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D052606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D052606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LDVDeg7X
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NsHux1QgdJFmFO0v0xAWJB; Mon, 02 Nov 2026 22:54:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0v0xhp6dsTgvO0v0xxjgx; Mon, 02 Nov 2026 22:54:22 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae9149e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=3xukm9jh-s4nZpa_EEIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=7hvbpTU6B6G8vksJy5iu323Yx4GK13tTXHVAw17cu5Q=; b=LDVDeg7XCT7A
	jqmtN95ebJG4aUwbnXbveDPqPwyManI3+SfAg82HLnht3DfA3ClizzlhtKE2mjltFKahc/VWC66/B
	a8foFY7jrlZqdm/jFrSFw08HGbiaG3gGw2GMBR9wCz6itow+4K+7Xj29FWu6fIFUzV5lrBgbCndji
	cGaT9JSjtY4aYHi7sWLCA76wC5E7YItT/CLL9sl3UOL+MLAFQfxjCmy6/9dec3gtZKjKcZFNdAUkP
	/CBEbAogkdL9CZ45lEU2P5oTYNjdNsNN7hLttKfnvv9TaAhdHwajME9g8C8WJH1Pt/eb3UZ45Sj6d
	BCC5UOS8oSAnaNwxWpz3dQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33550 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0v0-00000003l8X-024b;
	Tue, 03 Nov 2026 04:24:22 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 035/102] hwmon: (gl518sm) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:28 -0800
Message-ID: <20261102225235.334487-36-linux@roeck-us.net>
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
X-Exim-ID: 1xO0v0-00000003l8X-024b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33550
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 73
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfATldPKjWW3JeLkDSY+sXRbl6btmJr64dzbELy5rQMnhV+Z7u7d0JQU+Y3+l0waNMv5bTRWVCbAgkRzBEl813rlCSWRwVbBZC2BTDI9X99VVRMFG1wGu
 UkL8OhvYafNZhtSQOf5Bm6N4iU2h35ovP2BXycfBa1At9/HGtX0HFP+iJk5DqBGegkBqThcU8Qz1as0G//4SkIh/zlFNb1Oz9ZKc6NZk+LJcQcVyUIGS3aAZ

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gl518sm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gl518sm.c b/drivers/hwmon/gl518sm.c
index 742c130cec7f..8cf1d6cbf2c0 100644
--- a/drivers/hwmon/gl518sm.c
+++ b/drivers/hwmon/gl518sm.c
@@ -108,7 +108,7 @@ struct gl518_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 voltage_in[4];	/* Register values; [0] = VDD */
 	u8 voltage_min[4];	/* Register values; [0] = VDD */
@@ -155,7 +155,7 @@ static struct gl518_data *gl518_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 		dev_dbg(&client->dev, "Starting gl518 update\n");
 
@@ -210,7 +210,7 @@ static struct gl518_data *gl518_update_device(struct device *dev)
 		data->voltage_in[3] =
 		    gl518_read_value(client, GL518_REG_VIN3);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

