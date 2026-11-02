Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663735;
	b=2uHZyU+biMhQH4jGIW0j/u0w1BywoAD/S5YJ8Qb9QP6nUT9rPV+oYV1vpA57+G6HancN
	 nmo6fCF/Va2ZKjceKcTAKRWS+puQGuRxFIyeuxf26rKnAdUvx4gXtv8+FFA0KETBwgj8y
	 scLAZCaqtVvz0Ad8hR+4QUTc2rIpD8jRAIwed1EEaPpSl+tT4f/nUcJUsdUE2vIESDZe4
	 182jGSEK/oGSKgFcLWkPAlI9g2zBdlUWstSHe/CD1R+wmx4yODtnbUlinO1tPYNjEexSX
	 YHB8ud0Ns8Hu12xGYwLa9NPLCvpxNBqkjOL6F6YzFIuwODWykSUOLuMTkSl7Rfm2nsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663735;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=IbbvRAEvscfHnS0YlEqim7ZfC8xC1uGLKvTFwZ8zobQ=;
	b=Ui1XBaEe/I5HibppjyJ5fV9xQHsq3pAFHdPa1xkCD0/0xSpJ4M4qobGXyJY0Kz/4ryE4
	 Lfk71bKIacY71a8m+aD5RRWjuT6iJuu4udz7f9jHqyxX793A+EfJANdt1FuyEXanL9pzZ
	 tVOlbcFQm5JQgsdJUf7zr/QyhnztAvdpbAmoAhUmvVMDHefXWiG3SLjeM+qjZTm+e1spN
	 yLRAk/vo/UOd4ZZEJ6HNWDeSjXkwZAOtgPBq4QVotkdRqbWSfEtiVpCOPKaSN0CO266Lj
	 Uhg9C0mxFHghQ6z/g1MR0+c3El07QgOnJsL6cfi7d8U/GDx7vdTaw0iv0w91x9EerEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IV8BwdiT;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3E606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IV8BwdiT
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NyDWxSSJLMylkO1sEx2BBQ; Mon, 02 Nov 2026 23:55:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1sDxoq0PvtkxO1sExMtqV; Mon, 02 Nov 2026 23:55:34 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae922f6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=bPciYNGWXuzknC-1GY4A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IbbvRAEvscfHnS0YlEqim7ZfC8xC1uGLKvTFwZ8zobQ=; b=IV8BwdiTVPyb
	cbNLCP/zhwKrzZ2Ff/nKMILg9dbdTgljXjKBrSUMor5im4mLm9+I7xVwBM2IgKJHjlOVm9tr6ftQm
	qNdS9vyjSjH5rEjr8IHrnhSW0KD0+yOpcxFsobNmjviAOJLMtwx7a9IttfFRVtjxQYGBsxUedrLE3
	iRciss8jIOEC2T5oQvaPfNhJdnKJtRrQKNx4McsjNlkYjY/NoGboHYQ8u0JoGk/6CXU/mqeQB+UFv
	jbE/B17XTqAWuTMSiEvlD2YTNz7w7crDyIgKqOeG2/UkpN4H26wyD9quyWMXwQMDUtutUWCiVTFUV
	SCXYgiuHdtJ0J9mAQOJe6g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50872 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wm-00000003m3K-3ESH;
	Tue, 03 Nov 2026 04:26:12 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 077/102] hwmon: (sht3x) Use ktime for periodic mode update timestamp
Date: Mon,  2 Nov 2026 14:52:10 -0800
Message-ID: <20261102225235.334487-78-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wm-00000003m3K-3ESH
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50872
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ/Wm7HE4XFbCiRuHP4Y7tIjf7DJPIqjmLw34umQHsQpd0h2iH/+m1mdYRDXqhMxnKbfYa4XGqkR0/0oWGZ5oJIp+ubrzsj81YmIBZXDd1b1xJpjtgwn
 QO2Uj/pStu9HajelFAT1U339tci3EcFgW+QaPlO2eyBjYdLc7sMH5kq6/V7H1pFyea4B74szQY0kku51/WZoaxQ82G2NXnx56BjMQOeKOjeKpou1Pk1d5F13

sht3x uses 32-bit jiffies and time_after() with millisecond intervals
converted via msecs_to_jiffies() to rate-limit reads in periodic mode.
On 32-bit architectures, if the sensor is not polled for about 24.8 days
at HZ=1000, time_after() wraps around and cached values stop updating.

Since mode_to_update_interval[] already stores intervals in
milliseconds, convert last_update to ktime_t using ktime_get(),
ktime_add_ms(), and ktime_after().

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht3x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index a0f5ba5c888d..216f3a4e6ccf 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -18,9 +18,9 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/jiffies.h>
 #include <linux/unaligned.h>
 
 /* commands (high repeatability mode) */
@@ -170,7 +170,7 @@ struct sht3x_data {
 	u8 mode;
 	const unsigned char *command;
 	u32 wait_time;			/* in us*/
-	unsigned long last_update;	/* last update in periodic mode*/
+	ktime_t last_update;		/* last update in periodic mode */
 	enum sht3x_repeatability repeatability;
 	u32 serial_number;
 
@@ -257,7 +257,6 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
 	struct sht3x_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	u16 interval_ms = mode_to_update_interval[data->mode];
-	unsigned long interval_jiffies = msecs_to_jiffies(interval_ms);
 	unsigned char buf[SHT3X_RESPONSE_LENGTH];
 	u16 val;
 	int ret = 0;
@@ -271,7 +270,9 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
 	 * internally by the sensor and reading out sensor values only makes
 	 * sense if a new reading is available.
 	 */
-	if (time_after(jiffies, data->last_update + interval_jiffies)) {
+	if (interval_ms == 0 ||
+	    ktime_after(ktime_get(),
+			ktime_add_ms(data->last_update, interval_ms))) {
 		ret = sht3x_read_from_command(client, data, data->command, buf,
 					      sizeof(buf), data->wait_time);
 		if (ret)
@@ -281,7 +282,7 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
 		data->temperature = sht3x_extract_temperature(val);
 		val = get_unaligned_be16(buf + 3);
 		data->humidity = sht3x_extract_humidity(val);
-		data->last_update = jiffies;
+		data->last_update = ktime_get();
 	}
 
 out:
@@ -902,7 +903,7 @@ static int sht3x_probe(struct i2c_client *client)
 
 	data->repeatability = high_repeatability;
 	data->mode = 0;
-	data->last_update = jiffies - msecs_to_jiffies(3000);
+	data->last_update = ktime_sub_ms(ktime_get(), 3000);
 	data->client = client;
 	data->chip_id = (uintptr_t)i2c_get_match_data(client);
 	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
-- 
2.45.2

