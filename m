Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660023;
	b=HKcE3W7gr+S0fqhd61PdAUfkUTx6+TIutAkuCaTcKdUVzhy4mQXJOvyZe9q0EatgkJJT
	 cJROPAy3oLzSUu2yQ2o1IgqLPBb6X46nHwyTHSDMnHKhcQ0oRJF1oQ3SDBR2rPNbJA+RH
	 hwfbsW4EIT9clDMoZ1XFSBugPfkeRnQPZSmzya7zgN/QzT5boaKC2BYrW1ITj7m69OgnI
	 clUj7TedkyNrnuvKE+3rOgYK4A4R5cVwOrqk/dXGGJX6R+Aker4lN+Xka4FvvrHEQdiuf
	 Kr+tz4IY4Rao9QrUpGSnSKxFuTN8PxF1LANsbggcCPw0ryW4YmzjuxEMaISnIdNTZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660023;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=dtm0/GPAUsb4a74CUHitptKevv5lP1RBus9Q/KD6p3E=;
	b=WWAVB0N89IUHdJQNCdm8ob2PUzVbf17mKEAkIR8XSBKETtfYsvmLQguPT8N4xU1d2cgB
	 DOnfl29sAQTPydscooyNrBovHnhRV0byN9VGKvpy5Q6HmJ9W6lL2w9czr96LQ6kHulbRn
	 KRkoC0ajfBzAjnb3WQCvQbKJne73cUuPnlIYwjGKBfwOWbhlkV6/g7Hze0MuJyQ0th6n0
	 84RzfWxXonl1e/vEKBRgd81MXOSgNupg3KuAOcLfTy57rmv7pfMDNJ6eVTUWTku5CbkZJ
	 GD6dwYrkMovuxWvD5tgBQsoB8qaKt000kE/ES8wwmsFbjOOZjoWH/48pN5JUAHbzjAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=an+P51RE;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B458606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B458606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=an+P51RE
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id O0FlxSu17MylkO0uLx1riK; Mon, 02 Nov 2026 22:53:41 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uKxt9w8NSXiO0uLxBm6q; Mon, 02 Nov 2026 22:53:41 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae91475
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VeVZoRYdAAAA:8 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=f3ByIm2xJIOintMknUgA:9 a=TKXEY2ph7vCcqc0JNG1P:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=dtm0/GPAUsb4a74CUHitptKevv5lP1RBus9Q/KD6p3E=; b=an+P51RES93c
	wP49++jQnyPvXBsbqeduSgVl65bLTByzJ/Rb8sjB6Su0+N+22u5IqIKJtorH79Tkyg9BteVdPNSuk
	v+McBtyUFbutslTO5KlrnQ+C8YebSj3tK14EPn80MIN+WuZzceOzLlvbmdfC8iCJRIc+nQ2B1onFW
	IezYVcPLUsQhxpXqWEPgcoPIzdzwxQMfVH9HgrhLe7c0gmcEXZx2V2lLBv16xj2VofU9Rj9gAwnRL
	ocy/Q2Xnma7oVJCkWL41HyuI9GoEK06tOZvvsRzoI1l/BglkJ4mezuI7S+t+3el1FlbdCDueT3lcG
	njEFZXRzdBz9okh37u6jlg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33170 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uK-00000003kSm-2Gjf;
	Tue, 03 Nov 2026 04:23:40 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Ed Brindley <kernel@maidavale.org>,
	Denis Pauk <pauk.denis@gmail.com>
Subject: [PATCH 020/102] hwmon: (asus_wmi_sensors) Use 64-bit jiffies for source cache timestamps
Date: Mon,  2 Nov 2026 14:51:13 -0800
Message-ID: <20261102225235.334487-21-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uK-00000003kSm-2Gjf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33170
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 53
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJzOtT6hNUaUvfvYNjKQ3Ch8Q2Ddau+Eg36ykteV1zjX3hsJr7Kr0K4akNZaTI8n7BOHROUYNJYSk1rsTIxr/+ocX6li2lN2ildw59BzGkohfjlgkqwJ
 aNtAGJkpHH1vSBrHglc5l1W9xJGGHTCyeOy4KtzAjAO14PNvEMuyjjkk5Q7HOXvNqj+vP4mrJ0JjVO8wId7rT4Q0X/iMBiLe/RZQ2Qnkv7JeWyJVt1f7lPTj

asus_wmi_get_cached_value_or_update() uses 32-bit jiffies and
time_after() to cache sensor source readings for 1 second. On 32-bit
architectures, if a sensor source is not polled for about 24.8 days at
HZ=1000 (or during the first 5 minutes after boot before INITIAL_JIFFIES
wraps past zero), time_after() evaluates to false and sensor values are
not updated.

Convert source_last_updated[] to u64 and use get_jiffies_64() and
time_after64() under sensor_data->lock to prevent 32-bit jiffies
wraparound.

Fixes: 548820e21ce1 ("hwmon: (asus_wmi_sensors) Support X370 Asus WMI.")
Cc: Ed Brindley <kernel@maidavale.org>
Cc: Denis Pauk <pauk.denis@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_wmi_sensors.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/asus_wmi_sensors.c b/drivers/hwmon/asus_wmi_sensors.c
index 0feab3f62496..e2313a1286b5 100644
--- a/drivers/hwmon/asus_wmi_sensors.c
+++ b/drivers/hwmon/asus_wmi_sensors.c
@@ -155,7 +155,7 @@ struct asus_wmi_sensor_info {
 };
 
 struct asus_wmi_wmi_info {
-	unsigned long source_last_updated[3];	/* in jiffies */
+	u64 source_last_updated[3];	/* in jiffies */
 	int sensor_count;
 
 	const struct asus_wmi_sensor_info **info[hwmon_max];
@@ -423,7 +423,8 @@ static int asus_wmi_get_cached_value_or_update(const struct asus_wmi_sensor_info
 
 	mutex_lock(&sensor_data->lock);
 
-	if (time_after(jiffies, sensor_data->wmi.source_last_updated[sensor->source] + HZ)) {
+	if (time_after64(get_jiffies_64(),
+			 sensor_data->wmi.source_last_updated[sensor->source] + HZ)) {
 		ret = asus_wmi_update_buffer(sensor->source);
 		if (ret)
 			goto unlock;
@@ -432,7 +433,7 @@ static int asus_wmi_get_cached_value_or_update(const struct asus_wmi_sensor_info
 		if (ret)
 			goto unlock;
 
-		sensor_data->wmi.source_last_updated[sensor->source] = jiffies;
+		sensor_data->wmi.source_last_updated[sensor->source] = get_jiffies_64();
 	}
 
 	*value = sensor->cached_value;
-- 
2.45.2

