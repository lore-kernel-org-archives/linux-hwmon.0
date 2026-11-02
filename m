Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662039;
	b=lc9t5RxEKHhS+vDfvxSWxDMMkxQFnc+3JLMuBnSHG0ji9eU+tn4mXREQzWj3LZ3b0QYx
	 NAPyv9RzmlrWVlHptLfAa6NLWUJ2s7wuKB9tXu8OgRYNfUmmuoOtVkwsPEUE4zkBpFpIt
	 jo3WF2/i2sSbkGA4An9FQ6CywBGCwAwhqO+Nzm1MG+SEKFOYDS+dogDQF71ynCXmcHb4Q
	 CA9YZsmO+m9Ub6SmNgantK3iBczPPMka/SS9hMlUvgzm9Uh5cdgeLwgTrHSY4hEbwCcsc
	 hoJAGHbQ7MsYqEQ4KXrlYtv8IxDvufeJtzwLAJAbyFywXsHxrgcBjf+0a8ecfqf+lhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662039;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=nxMZ0LmZt0uztkbUn6kS+FCCDrOUzP3ax03UQt0Wv/s=;
	b=ekeFOYt8cWupp/n7mvjz4pj5lDlWY85zo6YYCVNmYoOegXLUSgVzHkKdK4CtsiniGbiy
	 CjWw1ToD2nE2ymdg/AsrTXQdCF5/o2y5bZax2hmWCtt6Fs4V7t16VTnld3U+opjTW0ouY
	 WW8qMdxeDJPIB6j3pAtMIWhoX3Zoc1pNpzKCe4bJWGvInUsAgNmKkFHbALuVOdFTMaqik
	 OvJ9Z9sr30RRWiHMId7+sY5TRpq8MXIlCLXSJryciuUTrxvvLttRkj2MLZGFNeOdRWKMk
	 M4vDKUEUGUCLeQyGWnqAOu5IItzxUXArFs2ZZxSzjdpkgQJkUm/oWxUYJED8Q2D8s/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=V5z5cYpF;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56F606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E56F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=V5z5cYpF
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NrdtxfG9Ic3XsO1QsxXxCR; Mon, 02 Nov 2026 23:27:18 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1Qrxo5GAvtkxO1QrxMFQs; Mon, 02 Nov 2026 23:27:17 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae91c55
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Ea0D8k5LUWnWhWv78-oA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=nxMZ0LmZt0uztkbUn6kS+FCCDrOUzP3ax03UQt0Wv/s=; b=V5z5cYpFphTH
	v9Nj19s0vlU9W4SJZ4xWSwlqrr74oZRM6OPmNX6V7cKRre69kWXedLOKxWfgYa/keJZle8SzvF/Lq
	6XX7o+/jYl41w87Tct0VgNSRi+usw93t3C/PcCNHkrNDMZcMSix4ylgXOBZNW+sKdktW7PRnnguxh
	bZMvUpyb/qZIR1reBIjwkC7PyaUpl/CugfeqtQ+DzmoLcTnTTbI5dVeUOQeS7R7uRcCXtZ6VRua95
	Syl88l4/UvUWLtqOSWDMKPbYVXdW/YBl1vJvobT3Ap15NL10rJv6+G9cpZj25byphQMmJiw9VnAbR
	105H1u95OCeciUpxyRKsUA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49882 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vT-00000003lOG-3cxR;
	Tue, 03 Nov 2026 04:24:51 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 049/102] hwmon: (lm85) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:42 -0800
Message-ID: <20261102225235.334487-50-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vT-00000003lOG-3cxR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49882
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCqz7dStXVo+dcnNyHtZFJNQQhWfuotVRKauspqXjcdRKWYMSAKCSuJ/PFa/aJgKWL0PtCIpoceWasuQlx/H1AR62c69FqKUAZ8AcX5gdJnWlEMkEMbC
 oPB25m0CweB/MwlrZ2FSl6lj0QhXrjKTD7RZqVtK+D/XcScUy3VAxiZI6RVwRzgYj6zhcw5tr+ebvuXnufGcPJzsyGwKTK/VyEKcTrJsBU9VZic+flMjBCe5

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor and configuration values from updating.

Convert last_reading and last_config to u64 and use get_jiffies_64() and
time_after64() to avoid wraparound issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm85.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 27ef127ccc2c..de223db48b59 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -295,8 +295,8 @@ struct lm85_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_reading;	/* In jiffies */
-	unsigned long last_config;	/* In jiffies */
+	u64 last_reading;	/* In jiffies */
+	u64 last_config;	/* In jiffies */
 
 	u8 in[8];		/* Register value */
 	u8 in_max[8];		/* Register value */
@@ -374,7 +374,8 @@ static struct lm85_data *lm85_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	if (!data->valid ||
-	     time_after(jiffies, data->last_reading + LM85_DATA_INTERVAL)) {
+	    time_after64(get_jiffies_64(),
+			 data->last_reading + LM85_DATA_INTERVAL)) {
 		/* Things that change quickly */
 		dev_dbg(&client->dev, "Reading sensor values\n");
 
@@ -463,11 +464,12 @@ static struct lm85_data *lm85_update_device(struct device *dev)
 			data->temp_ext[2] = ext1 >> 4;
 		}
 
-		data->last_reading = jiffies;
+		data->last_reading = get_jiffies_64();
 	}  /* last_reading */
 
 	if (!data->valid ||
-	     time_after(jiffies, data->last_config + LM85_CONFIG_INTERVAL)) {
+	    time_after64(get_jiffies_64(),
+			 data->last_config + LM85_CONFIG_INTERVAL)) {
 		/* Things that don't change often */
 		dev_dbg(&client->dev, "Reading config values\n");
 
@@ -538,7 +540,7 @@ static struct lm85_data *lm85_update_device(struct device *dev)
 			data->zone[2].hyst = i >> 4;
 		}
 
-		data->last_config = jiffies;
+		data->last_config = get_jiffies_64();
 	}  /* last_config */
 
 	data->valid = true;
-- 
2.45.2

