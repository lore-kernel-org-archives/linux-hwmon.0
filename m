Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660230;
	b=gRgqb44cMx5V0uBw+chrdZX1Iq3nW5R7mqVIKqtmEAu4NKCy857ZxMS1rmt70dunLs58
	 dJ9KbuVQvetVenOLKBjtbmZnffJnxEDn0ScCfWvpVfRL0nCuF59JbBiSEuXJ7hfowFNOl
	 zPM7ygxWpM7oJGs4zmVbi755xCWjFZV6eyPfdD4SggX9U0ofLqIT+46DotHfYFhxL7/2P
	 tw5cayvBuerfG9qkHsb9vpY8VpMFLVqQ62Pj0FoK006mdGprHvrsYwmZN6O7VBt0l4tm7
	 GcsyhKtpfWv9mN4Winc9nNdFICUp2xCu9Bj0DvkvFDwnHmF3fPSpRextrbVygR/UWLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660230;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=t8he7DOlCK6NE/KWk5iyjzW3LPa6QxkxpZaZ/vW+NoM=;
	b=hfKpaKuAhSMQMTp7x+LXmWlKTayfEENjcs7EPwlUXiEgV0U+ivNMqDovF68vUjvu3S6b
	 kLmlf2XTqCjG/AvsE1QyP+a2zAUx3tcMyq6Vzj2JsfIYNlsPFp0rSEvj4RgIqAtgf/gqS
	 5GOu0b3GCMJ1hluY3ItteM+CcY9UfTFWANEAfxjYuBv340BzVgbj1Z0qJ+tSl0msYei6e
	 Xe/aG1ug9IYklUTvC9ed3RY5YQE7AwTKkeVVqLT4O7vziGdg9Me+jjj/y+QOuUItIZYrk
	 147gKM5r04/dJ1bfWfkCAIUOzPglCgl7ATkrKpmdlVdVNFW+bYCLzTySqsYNjNL3Szg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pGEZy1Y5;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB33606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB33606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pGEZy1Y5
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NtW0x1jtPJFmFO0xhxAX71; Mon, 02 Nov 2026 22:57:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xgxhtHSsTgvO0xhxxnDF; Mon, 02 Nov 2026 22:57:09 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae91545
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=d6R6-K0Rm11Q-o8uORkA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=t8he7DOlCK6NE/KWk5iyjzW3LPa6QxkxpZaZ/vW+NoM=; b=pGEZy1Y5GFJi
	SFeqx8AKpQIVbPwVCk/1/Eo2gkeABxIpsm2AaHVSAC/k4gKiSc22U0vetiqbAp+l4jOuwu+cM69WX
	cHorjRr3fAS23zEmLens5UFFO703Fx3wETaXUPUid0tYUB0zdnHa/eq+/Ryxju6d3b8npIPDkp44K
	gaRuFap0UPV5zg4sqim9NYkfD0Avhq3jzcAoWNXEnr3jPvqWFH+h6oosVpOPDHZfesyKxXhEeVDIx
	fknaf0ncdiaIesV6F3+8VMUpWs4/6YDIUcJiJGYmSDv7p0qpWOtmdLUr/U4iOCP2aHOvszEjMMspp
	19eee+yvLo2esZcgaXxBNA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44628 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xg-00000003nNs-37Wh;
	Tue, 03 Nov 2026 04:27:08 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rudolf Marek <r.marek@assembler.cz>
Subject: [PATCH 098/102] hwmon: (w83793) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:52:31 -0800
Message-ID: <20261102225235.334487-99-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xg-00000003nNs-37Wh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44628
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 152
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfChWwx5jwvIm5YtLwlKlePCC9nZpYv7cOj/E6KLUfEhKfywn706eG9AKicYLQ0zqeFmGS+wiX43taAaDqpybEJfMWsEc1fIbHHvBW22BHnySExBZrOvn
 z+6jPQH6P3HfTPQCKTkiUiryIvUKxzYC3NACHxc5zSAPsuSdxQsY4hhOeA7Og8riyxBZMqcrS+/A8ebiaTI5ORUGGEgeaMsy+4vC/O0MKqm1EKVt0Rw9Y5lm

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor and
nonvolatile register values to stop updating.

Switch last_updated and last_nonvolatile to u64 and use get_jiffies_64()
with time_after64() to avoid 32-bit jiffies wrap-around issues.

Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring driver")
Cc: Rudolf Marek <r.marek@assembler.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83793.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index e1f2708b5db6..55ac2907fd2b 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -206,8 +206,8 @@ struct w83793_data {
 	struct device *hwmon_dev;
 	struct mutex update_lock;
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
-	unsigned long last_nonvolatile;	/* In jiffies, last time we update the
+	u64 last_updated;		/* In jiffies */
+	u64 last_nonvolatile;		/* In jiffies, last time we update the
 					 * nonvolatile registers
 					 */
 
@@ -1946,8 +1946,9 @@ static void w83793_update_nonvolatile(struct device *dev)
 	 * takes so much time, it's just not worthy. Update them in a long
 	 * interval to avoid exception.
 	 */
-	if (!(time_after(jiffies, data->last_nonvolatile + HZ * 300)
-	      || !data->valid))
+	if (!(time_after64(get_jiffies_64(),
+			   data->last_nonvolatile + HZ * 300) ||
+	      !data->valid))
 		return;
 	/* update voltage limits */
 	for (i = 1; i < 3; i++) {
@@ -2020,7 +2021,7 @@ static void w83793_update_nonvolatile(struct device *dev)
 	for (i = 0; i < ARRAY_SIZE(data->beeps); i++)
 		data->beeps[i] = w83793_read_value(client, W83793_REG_BEEP(i));
 
-	data->last_nonvolatile = jiffies;
+	data->last_nonvolatile = get_jiffies_64();
 }
 
 static struct w83793_data *w83793_update_device(struct device *dev)
@@ -2031,8 +2032,8 @@ static struct w83793_data *w83793_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (!(time_after(jiffies, data->last_updated + HZ * 2)
-	      || !data->valid))
+	if (!(time_after64(get_jiffies_64(), data->last_updated + HZ * 2) ||
+	      !data->valid))
 		goto END;
 
 	/* Update the voltages measured value and limits */
@@ -2077,7 +2078,7 @@ static struct w83793_data *w83793_update_device(struct device *dev)
 	if (data->has_vid & 0x02)
 		data->vid[1] = w83793_read_value(client, W83793_REG_VID_INB);
 	w83793_update_nonvolatile(dev);
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	data->valid = true;
 
 END:
-- 
2.45.2

