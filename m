Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663747;
	b=DFr9Tt/HYEXQtSUGnd7nLaWN/fpm9/hIXDfMeo2j8+IAUL6njfs+hWRPDWwbTaAZt4bW
	 sp2a5HPIbmMBdtdYowFRkWx3/G4h3aroBV9g4kfgB3thtUAXBzgFRjo5QlABGYcMX/PzX
	 UTMb96NDdFkl8OjYoGl9jSKwp/g/Q6Uii343RRDf5LagG1Pa3mMARP4ds3RZv0jWW44qd
	 oR9cbHlhwJ+tYACnYK6TTMAlbwEv+Y9YsUCsbsP285DTr5oCxN3oyb4NnuFYYbz++XtAW
	 jApuspvxGufjQZI5cyDLZcsb5ygaozTU4UU5N1RAWXw1AtSqf0wSlPUqzXcWmA5/RKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663747;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=5BXjyRRKwGlNk8AzVH1sQj0NrWF9Xh/+pA0OZyKzW5M=;
	b=Pwq0CfnR7SOMjrAFlDKTinLHY85pcCKSHDhYBq2m/PkPUe7xdxpmuNl/O1QT2EAG9BH/
	 3zS+UPPizM3gKVg/NsYoD1b5On097s3tiy6w+pWach6UQfZ6p0GjfmYjxNIoKEF9pEySL
	 mdivJ8EGkzcEK7+/QyB85tQAzQ44Vwh+toRv1xJc6PjuTku5fscIhGrCBFD+Bs7I653Vc
	 wJqPjOg5MSvu3OTHhF8Ilk41XT3v0JBdBNx+cqNzQUph7S/R7Vruib3sZwXjdJ/uzFHFW
	 Y82UZoHhdNzBBC4mtIisGjvhvZPvHrukY4oENgVe7fY1CQqYzGgmz1BSmnRMG1JG63w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aZ2St05l;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F7606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0F7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aZ2St05l
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id Nzv8xEbnLusRSO1sQxtFwN; Mon, 02 Nov 2026 23:55:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1sQxusl88LLeO1sQxfTmd; Mon, 02 Nov 2026 23:55:46 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae92302
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=edvktuduleVQ9f6P3rIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=5BXjyRRKwGlNk8AzVH1sQj0NrWF9Xh/+pA0OZyKzW5M=; b=aZ2St05lowXd
	+3TxiJj2UhJ7Np070sqG73UqJWy5p5OBrfnjbMydJZWDqCJPTSagNCWiZA/Z4yriJpcqNfYm+nokU
	ZBr4uoFBHtTBVFC4VaE/J5S0sK/SJL15AYz+i612aH0022GzFSyr2RwEpHFXwAb+ME/SOTU7j2/fa
	pcMO6R8G8aoYIhKzzG9zwBBSOB6o6zNHDcyf+HGPu0iFK77qPTAH3ruT27u+4S6NZy6VOkQqaKr3E
	ZBKeUDtk5c7vHAQNNJYro+aCPEmwNH+mT7hqFtSp+CBxchn3iBpMxFpZpNwOfnyfoiVa2XXFzkgTN
	uxrx1DBgYwNgO2U2bzkyCg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40708 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wy-00000003mz9-3H73;
	Tue, 03 Nov 2026 04:26:24 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 080/102] hwmon: (sis5595) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:13 -0800
Message-ID: <20261102225235.334487-81-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wy-00000003mz9-3H73
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40708
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGo3VkmGtkFu+97oqFobby39ORYtGF0KLDk3CRnZqweehnU0rTWN5kFg6/4rUC1TqILqdFti54FXa69cUkb+p1k/ryAJLcHQ4XpVWqNSJ445hLq8fkFE
 x4EvjANkLYhEKQvsxPYLk/3rSR/iOHIU5nCbcElBqhSzdQ1FpaHis/OoTGWrhBbEeEFy/Qx6O4EqNlGpbVH5aLc2ekp8H8BC60VwCnnUiGmZO0+/toc+biDp

sis5595 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sis5595.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index b7a7bcd6d3af..b66e8f47df90 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -170,7 +170,7 @@ struct sis5595_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 	char maxins;		/* == 3 if temp enabled, otherwise == 4 */
 	u8 revision;		/* Reg. value */
 
@@ -215,7 +215,7 @@ static struct sis5595_data *sis5595_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 
 		for (i = 0; i <= data->maxins; i++) {
@@ -249,7 +249,7 @@ static struct sis5595_data *sis5595_update_device(struct device *dev)
 		data->alarms =
 		    sis5595_read_value(data, SIS5595_REG_ALARM1) |
 		    (sis5595_read_value(data, SIS5595_REG_ALARM2) << 8);
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

