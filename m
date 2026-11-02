Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659968;
	b=e2wT0AB6hogVU0LNbiaZRTkJfd8ndj0olkbiYwR3+//MUNjGLt9jwQSA3nY821LH2Foz
	 U29MVldo5XDA9/AJ6f0NYoI5+/tsdWs6qi7CMt4/dMQhMcWbMPIilZTLGaUBBqhCzSRKJ
	 rg1KXwys2xp3P1MHHaAcsHWAfinHMe1bxIlPrmidyCiXNmnWvy7SeEERDjxoOvxLvU2jV
	 dRzFabDhme6WtO12n52LCW1Q49dubhByNp3pXKk+oA/GjNgTf8sTPFtkXhjXw3F8OBGum
	 SQZ0eqRVUbrM3LuL+32cVBc2JY1dhcKsZpLR3eWZnvNyuYFB64lwF06XAcfmFNwlU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659968;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=VJ+5KhcgXSHm1FPG3PAcdHWAm1SpBdji6PGDqbrN7fg=;
	b=XBShU8ACGmCuYyuXkbCpQOE16wguGQ3IZwGKuNvuF0S/ESIti8M4cySFFATw4FmAHg6L
	 C9F4N2KyJCZc6MBMR45hkirQvypfd8dc1qJa9TaPnsZEObd8bY02dNMj7QOb2RymGqdog
	 lEwKHRjF63mD5ULi7ySA6haJm6W6vZdgrvKF09QXQQdfJOm2k2/4SCM8aYO99oY3hF1gT
	 EsNzlvCYr974bnb/F8P5anutQHpdX/f+g/JKi/ACjRMxJRKDj4vMZaRX+rsQZEmLMtVqS
	 PoOgT9x3IN7ADQusXbzB6SQSc+uQWy+tY2qrB0uH9YFsrEfuvXYZ4RbttQk/ad5fLFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3pG+neJO;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB95606D836
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB95606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3pG+neJO
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NzUrxHB3xaC0UO0tUxX0J9; Mon, 02 Nov 2026 22:52:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tTxZrUh1xnwO0tTxyC2W; Mon, 02 Nov 2026 22:52:47 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae9143f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=3W0-DxZhAAAA:8 a=_jlGtV7tAAAA:8
 a=nJ88rjYAXKE6TkDYSd8A:9 a=-pq1DBQL-ILSQNPjOI6a:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=VJ+5KhcgXSHm1FPG3PAcdHWAm1SpBdji6PGDqbrN7fg=; b=3pG+neJOd1sg
	MvKDTHHMhTjBZ0HHPqglsiB1INz7vCZYZK0zDc9/mD5jdhe6J9As/ASn1syCKJOZzfsGFKysiyv5x
	Rff2qPruZrvXo+XwRHya82lRBb28CMtwAXZDzTXrS9FpRbTup4wOY7QMi4SGrw71Xvz3In3Uz6ekg
	wf0pwm2V3od9FUkBU1j2pQ7Bpr7OqggRDEGJNfdS2h99doOrzsauWmmjTLaRlh6Crjvgm2TBNflxJ
	5Z+0amKvWRp0ckxKWwtChwzR+Fth7rH8R8r9ADk4HKmAv0C8r0uXxrJpkHg5uiVnTvRWkm6sz2pRY
	ciFU0jPQjq2ajJyx9EXNOg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42266 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tT-00000003jmh-114q;
	Tue, 03 Nov 2026 04:22:47 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alistair John Strachan <alistair@devzero.co.uk>
Subject: [PATCH 002/102] hwmon: (abituguru3) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:50:55 -0800
Message-ID: <20261102225235.334487-3-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tT-00000003jmh-114q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42266
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBp9b5W0mryQ7tksqBXAebvAyZHaSbPZkYtuomFdIvI6zrzBAN/JvH8Z3kU1QNPELZffN+/p9KE82kUWbg9aiyjKHYrAMpy81VFfO3fz1KBkDWNMLtgU
 ARPB5NX/YBeKckFzpYUytoCFiw20xcLNZ5CQXR6tNN/U4ZG/74dwsA9wgKJU8j+KRQqiQZbjm5BEk6kHwsNRN3VIthVdP1Av30f8pXc46SA2gq3UkP8/2NLP

abituguru3_update_device() uses 32-bit jiffies and time_after() to track
the 1-second sensor cache expiration. On 32-bit architectures, if the
device is not polled for more than MAX_JIFFY_OFFSET ticks (about 24.8
days at HZ=1000), time_after() wraps around and evaluates to false,
causing stale cached sensor values to be returned.

Switch last_updated to u64 and use get_jiffies_64() and time_after64()
under update_lock to avoid 32-bit jiffies wraparound.

Fixes: 3faa1ffb4f4b ("hwmon: Add support for newer uGuru's")
Cc: Alistair John Strachan <alistair@devzero.co.uk>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/abituguru3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/abituguru3.c b/drivers/hwmon/abituguru3.c
index b70330dc2198..c38dc986f631 100644
--- a/drivers/hwmon/abituguru3.c
+++ b/drivers/hwmon/abituguru3.c
@@ -146,7 +146,7 @@ struct abituguru3_data {
 	struct mutex update_lock;	/* protect access to data and uGuru */
 	unsigned short addr;		/* uguru base address */
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 
 	/*
 	 * For convenience the sysfs attr and their names are generated
@@ -1080,7 +1080,8 @@ static struct abituguru3_data *abituguru3_update_device(struct device *dev)
 	struct abituguru3_data *data = dev_get_drvdata(dev);
 
 	mutex_lock(&data->update_lock);
-	if (!data->valid || time_after(jiffies, data->last_updated + HZ)) {
+	if (!data->valid ||
+	    time_after64(get_jiffies_64(), data->last_updated + HZ)) {
 		/* Clear data->valid while updating */
 		data->valid = false;
 		/* Read alarms */
@@ -1115,7 +1116,7 @@ static struct abituguru3_data *abituguru3_update_device(struct device *dev)
 					data->settings[32 + i], 2) != 2)
 				goto LEAVE_UPDATE;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 LEAVE_UPDATE:
-- 
2.45.2

