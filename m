Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663042;
	b=RK2bEd0trDlQKYgk6zkcjrnr9AyAO3qurfmoZdAFF1R1w59hP8Vac0dfvdiIGLj6eQSs
	 mWzlQEosY0QZ0qTXHXUWMd4duqeBL/vsE8TGZnS+WVDysyecbDnfurxHAtgF2c57tNy7N
	 DKY7OPtemIFxZqt3O2mi5+ilQVOoLwfsKGm7o3uwptj9iMWOwXoMhyG0Sy8e7dirp8A49
	 YTitzOhefCHUlVuxMt7kVdL9ouhi4Nb7l0cDBBE0dO2C/LIEumkAbpGa8ArfScmDacaTp
	 4lNsNIr1/HTLap+jm5vId1DysHA/wkgAp96mG3nC5OHSOtV2fhcIs30rOt1epdyJfXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663042;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=+7BSXIAXsd0l3rd3NR4oqNrHpSJaqJH3iXApBonDs18=;
	b=ig0Xqm42E+8pvEpoHSC5nna7x42QEuBJCYLczmziBK9mpu27++tFAbGVpYuwvTxMp4SB
	 LMmnG3AWn8Nmmv4JBV8XJpCxsH/7XX4r+/hiJJ6MZjLZIp0Y5dXyT2LvCXyajf4s2wIl1
	 HQl+54uPe4oX3o0ekxSP5MhO9Vws3eNwClYUwdTN17/vDQ+aK4O2KPJPTN3BPwrKlmg8Q
	 yRPSyDnpRGs8XfZz9cwAR7Smvaqr+k97LuR7OOEoHs5REPKZfjrVmASXmomFuizz21usm
	 b8sfRp/eoF7bQNgZBxjZgToCe/K59wy8/IkH3nA+pPr5rrdLP/UnqjTSD+aypC1zVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0FRyFcTS;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563F8606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0FRyFcTS
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NwkgxYHjbLvgbO1h3xlpGB; Mon, 02 Nov 2026 23:44:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1h2xbCYj1xnwO1h2xzIZi; Mon, 02 Nov 2026 23:44:01 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae92041
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=waW8e19iS6ayI8S0vaEA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=+7BSXIAXsd0l3rd3NR4oqNrHpSJaqJH3iXApBonDs18=; b=0FRyFcTSWZOg
	HNwmvKpIErIh3fJ/sZ956O469fYiLo8QsIMrx7wmrzhAwmtDWXQWAA0TDxlBzSOnEk9IYdmnJVX/g
	sfxJeaSQv4YXINYPjXpet0GrPkJ7YZV5JUBIAla2cA6LBNRI7ptLH/EaZRVSuY4XyKcbgtPwkYHgt
	JKSs7VgOlBY31jfY+XrZl4qIUqyZQ1xBRa5KnA6Gvb3JHaVtfjE1w14wHBpdJv/ZWq0XLVxy7sb7f
	yxlhc8CDqAsCtD7M6QCjRbyr17HwKSskc4qfEqyp61QQ8pHHZIbivHe7ypMSpFhSNPm5NAgrHu4Hm
	THx496/Ts9d1klUoxO9ktA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46956 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vv-00000003lbF-43S3;
	Tue, 03 Nov 2026 04:25:20 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 059/102] hwmon: (max31790) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:52 -0800
Message-ID: <20261102225235.334487-60-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vv-00000003lbF-43S3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46956
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLUldrhIGKb62IBFQCDogv0tjVRwZ+9Hr92jXWomW796EjysOJhlJeVosnlo5Vv6z6zYqwcy2l3NMJpiWQCZOkHGaEe23pSg979D62Ua81DoHGb7zjyC
 VntpJcBnYGGTha0rXJDx9YrktFFjlkfw0mNAcdT3vpIPdagXao/uC/p1BNIempbbJudi7kdLfQ6/TXmzqplzaR2woapHWBmyB/nNE/M2b6DhL357fSkdp3sr

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached fan readings from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 195a4b4298a7 ("hwmon: Driver for Maxim MAX31790")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31790.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index db8a0f6f1829..8551b8a26ff6 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -58,7 +58,7 @@
 struct max31790_data {
 	struct i2c_client *client;
 	bool valid; /* zero until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* register values */
 	u8 fan_config[NR_CHANNEL];
@@ -75,7 +75,8 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 	struct i2c_client *client = data->client;
 	int i, rv;
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		data->valid = false;
 		rv = i2c_smbus_read_byte_data(client,
 				MAX31790_REG_FAN_FAULT_STATUS1);
@@ -119,7 +120,7 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 			}
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 	return data;
-- 
2.45.2

