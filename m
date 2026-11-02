Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664965;
	b=bXkp8tM4pMtKAFhXj9eaw1ndhw38D+UKT54Qynar2uysIILbKEz+umfZB9YeZ1oYJPqU
	 0XD9EendtMziCJum95Y0raz7u+vxRtlwq7xqSEUgGsRaa4TbeoF5PCh5S9K49GR1ddq5b
	 4jZWqJSCiVV71rmhPaThkDDrYaXFK6PFWAB0/uxjO3JzDr4Gn68TFc9wzPvZUsXd8Qv6J
	 bttDnRY7clcBFiomw85PL2ILKoU9G1oIHViCUiDPqy7YdtL32ZgdXyA+cf+gxAMniKJ2L
	 plzc1XweZbkJeoBESGzYP43izdQ/erreeujkjULWCam1rjxhAJcVNm8rsKgSuxbUe6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664965;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=djnNpS9t+T7ztEOEA27V0OS5gqzi00yPZDbB1uCG1es=;
	b=InD0PZSoSA7E416iEpXxokd2no//POKbEkDLBVwd6WCkhhC55J4pGvY5IDtBFMRDM04z
	 pp5OtBwqyLZ7wO6K1OTP9gj/Il5BqFcd9G4FpxKZIMe9/6FoiJuQAR4r1Whh/mqCAOhGa
	 mwMBYIPTzVM3feDbLWduJQb25Xb+TrCwLDRNChPv225BA+bPhWCf4AlY4nJHrDzpIZTIv
	 syrDjxEDEjv5VwcLLOunJUaHI9n9syEVUxFjkiBc7Xu20GC3YiLpRCRkDExZZTOWyve2a
	 A5aZTldvZSdQ8OB/iqafRyKbyyC/H1rNLBN1i19/5sA/lQtg8FWMthh/xObTwyDzazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=WhKbUoGQ;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA5606A326
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDA5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=WhKbUoGQ
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id NyMRxGwWwaC0UO2C5xXRNk; Tue, 03 Nov 2026 00:16:05 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2C4xVxbn1fkWO2C4xwilI; Tue, 03 Nov 2026 00:16:04 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae927c4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Kq6Cz0lc4pflhoogJA4A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=djnNpS9t+T7ztEOEA27V0OS5gqzi00yPZDbB1uCG1es=; b=WhKbUoGQSKt2
	5ZfSHySo2RMW2B7aYUyqgTWChKR0MuxAwEg1SaRm2KSk3rTgquvC2qxCKslxvP+IxhuienSdbDNtg
	KV1vkrqpnGzMRrRX5pU+pqygUhqIItgkoJg4S4rrMOe2m7KekAWnHYUivp2liG4WvODapsH2kX6ZX
	a+8YjKOuCVDBqlInNZVTzohWpeqki0RhR+WPBHf9RLyCY5nEJ0VkOePERYaIDP7E88GG7Xmnt5dWn
	jhveap9T7i1qgsgFLenUuI5TbT0lCwSf+S/3mCbA3ov+hU2uAIGdeVSzUjWCkGmLLEtBUvtwu3n6T
	U/sqiZDd75vGhG/2mtNjCg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60138 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wn-00000003m6a-1kJF;
	Tue, 03 Nov 2026 04:26:13 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 078/102] hwmon: (sht4x) Use 64-bit jiffies for poll timestamp
Date: Mon,  2 Nov 2026 14:52:11 -0800
Message-ID: <20261102225235.334487-79-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wn-00000003m6a-1kJF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60138
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFyFezJLTQGEn8IkisiFpa/6MmagsZDSs0O3+kV44tV9DsOJo3pKDJK+qRYsjTNCCHjKMaDl55bqaTib9psjdoVXIUeuSdhHumqzAkfYNwhqz9Hj+oFy
 gRqlYXY02s/f4W3PGdbCZNv3ljhag9cdrACg+LSYBGj6h4j09h8jOvZcM9YyTFXm+lS+xdZTcyZ3lYTsRGgkboHxG6AWAMCCW+wVFBpdcTE1QAHDoRRhCLB7

sht4x already uses u64 jiffies and time_before64() for heating_complete,
but stores last_updated as signed long and compares next_update using
32-bit time_before_eq(jiffies, ...). On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_before_eq()
wraps around and cached values stop updating.

Switch last_updated and next_update to u64 and use get_jiffies_64() with
time_before_eq64() to match heating_complete and avoid 32-bit wrap-around.

Fixes: 505c2549373f ("hwmon: Add sht4x Temperature and Humidity Sensor Driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht4x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 020a523bf863..009c4c2a63a5 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -81,7 +81,7 @@ struct sht4x_data {
 	u32			heater_time;	/* in milli-seconds */
 	bool			valid;	/* validity of fields below */
 	long			update_interval;	/* in milli-seconds */
-	long			last_updated;	/* in jiffies */
+	u64			last_updated;	/* in jiffies */
 	s32			temperature;
 	s32			humidity;
 };
@@ -95,7 +95,7 @@ static int sht4x_read_values(struct sht4x_data *data)
 {
 	int ret;
 	u16 t_ticks, rh_ticks;
-	unsigned long next_update;
+	u64 next_update;
 	struct i2c_client *client = data->client;
 	u8 crc;
 	u8 cmd[SHT4X_CMD_LEN] = {SHT4X_CMD_MEASURE_HPM};
@@ -119,7 +119,7 @@ static int sht4x_read_values(struct sht4x_data *data)
 		next_update = data->last_updated +
 			msecs_to_jiffies(data->update_interval);
 
-		if (data->valid && time_before_eq(jiffies, next_update))
+		if (data->valid && time_before_eq64(get_jiffies_64(), next_update))
 			return 0;
 
 		ret = i2c_master_send(client, cmd, SHT4X_CMD_LEN);
@@ -157,7 +157,7 @@ static int sht4x_read_values(struct sht4x_data *data)
 		data->humidity = ((15625 * (int32_t)rh_ticks) >> 13) - 6000;
 	}
 
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	data->valid = true;
 	return 0;
 }
-- 
2.45.2

