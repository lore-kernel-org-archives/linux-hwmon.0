Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660222;
	b=0xhdptxtVEBw9clXvfcPg+5FrQSzUTrVUItnDeR8g4/FU81oqD2GcGdnj6e25fRBWMv3
	 2hm24C5nWUtm8pTlQPysMdbS5ZEeIXtHz53/UtlVZJyJg7ug/RvP/8phQz/dM/4vWOOxa
	 ak/Ve4D5FC2gaOVBSuzZsU9CnX5aqnL/RKgMWx8g6V/DHLepx6h8PrphaNQi66PAiNYy+
	 teDzJXYx35xwUl0cPYE1GCCILV6cQaUfFH8PpW0GzFOHTwZSlGG/tNrEJ35NdVEalVn35
	 hXE6y4hKvxYtdg/vIh+6KzKkIa/774oo6Wn1AVSVPkMyl9G0uU/R1g5+Btpp8DQ02fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660222;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=qWF908EzgXpk9g0Wl1cth3+pgbzqE+np/y2hU4OOvA0=;
	b=vNTGQbAqKCL5Snm2Wqs2SdHjOoQFHxtC93haV50tlpiehKxJj5/NC9vLScYaaqyRCyEY
	 xqn9oBoSleVFv5WVZ36L7ofQnDeI3+4VoPUYpjclcswmnvqKw0PC5VIkrU9wufpxJkg/O
	 Zo6uenMK+e0VzZ/KGbo6ajvIlaE/JjQBgZmurCIZ7MruqxuKPurjtXA1Z7nEaqP3uVRLR
	 nwCmZZZz6NoTDdYGha3ajnZxYCf0MLAagDe5xiHLo78866l7ivu8h9OFKhnLrrh0zzoVI
	 bQaXsVVicvIAL5xPZrD8LaWufPBNv2De/t5FjZtSNYc9JvjfmJIzLpte4asi9a/8j2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="c/F37vW0";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724B606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B724B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=c/F37vW0
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NxmQxOE2xv0ndO0xZxBSxJ; Mon, 02 Nov 2026 22:57:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xYxht5CsTgvO0xZxxn2L; Mon, 02 Nov 2026 22:57:01 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae9153d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=N4X_Y2vUnc59bwN8jIwA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=qWF908EzgXpk9g0Wl1cth3+pgbzqE+np/y2hU4OOvA0=; b=c/F37vW0oqE0
	LhjvyS9vHPc4rirum3nDGfXfaU41H+Zb6vo1DT0MTuGplsaD4Uj/TvIBoe+BUv7CmOfQisgGXoeL9
	o5AYSYDoPhKxr9E4I4BMssuQzaI6yR9ZgqknwHW/bubJTqf8ApZIg+cDl18Sy5Zh1ToHq8oIdUHS7
	/UuhR0enbRE9ROGH4dHmlu1frMXQjtMSZd3Y0eogGSiRl/TMO8KEU9Am8tnkSVs16YBQ8Ki8W5wGp
	bqIDIo4+BAaSWcCcLWJxbmwE1ZUSw+rEzsI7C3aF3Wi4lOapW6RhUsgFJVdp0BhfzYjifacobrRXl
	ry0WiDjzXJ6jVn8lGBQDRg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48712 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xT-00000003nHP-1rrW;
	Tue, 03 Nov 2026 04:26:55 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 094/102] hwmon: (w83627hf) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:27 -0800
Message-ID: <20261102225235.334487-95-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xT-00000003nHP-1rrW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48712
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 146
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKVqkzS9x0g0vSS/MD6AE9amyg+53T+Jz49ieF1rTc6mjoNm5UJ+TYrq3qJn2DAtlyTQc3r9PcpnmFTkFcxgu5GNiNEgukN3FcJa/ixqlnk9Cc1nR129
 67JfSTeI1YAdOfB167d0L1AwZW7/NAAQVxLUhU39neqHMKooyMMyEeEqGT31RawpSryB5GOmpCTZxDqE1Tuzw6mm+1Kgceu7jFIAqHCe6JwV/R5BqQ6rxPiD

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83627hf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index bb993bb09f40..d65d39c52538 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -356,7 +356,7 @@ struct w83627hf_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u8 in[9];		/* Register value */
 	u8 in_max[9];		/* Register value */
@@ -482,8 +482,8 @@ static struct w83627hf_data *w83627hf_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		for (i = 0; i <= 8; i++) {
 			/* skip missing sensors */
 			if (((data->type == w83697hf) && (i == 1)) ||
@@ -559,7 +559,7 @@ static struct w83627hf_data *w83627hf_update_device(struct device *dev)
 		data->beep_mask = (i << 8) |
 		    w83627hf_read_value(data, W83781D_REG_BEEP_INTS1) |
 		    w83627hf_read_value(data, W83781D_REG_BEEP_INTS3) << 16;
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

