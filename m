Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669334;
	b=u6Z6evErs6Oymv3lOPaLMZqcI4OWKCZlaZ2m9btK6tKoqNT/Yii9cbNtcHyMlWV/So31
	 kQ7+0oDozNusTzzlZqKnpwA2zWnAkXspzO8IQvRdYvXDECM4G+ChncExhoOYgAvbeycdM
	 Fi6tS4w9BK38pLV/WOOKG1OJnSeQZChR+xndStEG7MipvSPOF48ZfPbWanyxujYNKRfen
	 O0ZOAaDI8wxWfbjplVE9ZT6ciEFgqYZq93prwTRvXu5F/Nj/C/RK/mYrrMLjUqVdXazp2
	 HYjGzoCnIDqbD9pB/XveLpV+0LHYdZJ4gkBREY+2PkoLY7r90EL77KSFBpAHUYzug4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669334;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=16ftyVk78Z6bOZVI535SrX/tytvjMismaTMUtpMQeFQ=;
	b=nSgSEXkJywwAlBbs5lxdSwQopkTZ2iQ4snQ2X6TDOtWIGO5xgn19+yx8xOMBmVXsQz0x
	 CZW5BDkT0HJEBQRB/o4iAfQlFDp141tfEAWAeorxKR1zsr8QunfMy8Y1YHd7wHA/UKshY
	 s0QafO4hZ7q/8vCmbdL4hBJsqE+n/rVgC+Ssp8c1JII3owVzQcV3RaxnMcipScB7z9lHb
	 2Wjq2eZbK+LaiLqpHup19j07ivva4ptSiH7VW4gJvzYuuSHOOgqiMEv9QnhD/W7ZNT9zy
	 jbeCGhTLiCAhfs3CUSK1mr00lJ5sk5b2IcpTJ39pIpA7hrD7R8kz+Z3c1739ofGN+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=21w4Dghg;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54F606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F54F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=21w4Dghg
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NyCJx2wReJFmFO3KXxBHZH; Tue, 03 Nov 2026 01:28:53 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O3KWxNnBR63hBO3KWxi7DW; Tue, 03 Nov 2026 01:28:53 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae938d5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=lvl-vEzxDWXqN7mjxc8A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=16ftyVk78Z6bOZVI535SrX/tytvjMismaTMUtpMQeFQ=; b=21w4DghgKEaE
	WBccitakDOSmfJ9j1fxjf3XY7P1eKh6y1otaG4Zi/hZZlLqt7jdei9F4qkSjWhvFGWa6r5qjV3JUR
	6MJ2d2h8O9RVvvT1FdbMaHQfq5XEkzCW4mkLzO3rYIgR0TFtv7zsLBcgVGZIzuFFaTvEteGTaXcoM
	I4QFES6Enks+E40ueUhpjt7C1//DEviDFKTkY1fAScAp+RHGiS1O+woEavipdITZLGO0A0Z8PTyXe
	mLMO6/ePKPJ8hZYcnlzwdbtRpx/+66cNIzHdk7KLlQnDl5pYTzu4vdQ7T21U2sfnXVtpJnWqt5k9Q
	iHt4RiJqUDgJY6r8L9dGhw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50856 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wl-00000003m1P-1VSo;
	Tue, 03 Nov 2026 04:26:11 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 075/102] hwmon: (sht15) Use 64-bit jiffies for status and measurement timestamps
Date: Mon,  2 Nov 2026 14:52:08 -0800
Message-ID: <20261102225235.334487-76-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wl-00000003m1P-1VSo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50856
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFVwj09ap53yps2K4JN7tRDNVnJiUt3Cguh6xwi9nlzSlnnCcHWZDuqygVGMnO1XB8lYvHW8U+VtJ4iuRzCV3poDvTh31UimD5Ams9mrgYy+S/AC5ojK
 RCyDzIFaWx2GmEvfUNOfNkOriwaJkSOXk0mhZzqjKWgwteQHS0RJISY+SbNHYua/jEZCHPilyvsfKQ++WX8/Lv2/rfLmazBXCOe0z8XTZDfC+MGmleEwrKWQ

sht15 uses 32-bit jiffies and time_after() for both status register and
sensor measurement caching. On 32-bit architectures, if the sensor is
not polled for about 24.8 days at HZ=1000, time_after() wraps around and
cached values stop updating.

Switch last_measurement and last_status to u64 and use get_jiffies_64()
with time_after64() to avoid wrap-around issues on 32-bit systems.

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht15.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 48d93c61345c..395d8ab88c2e 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -160,8 +160,8 @@ struct sht15_data {
 	enum sht15_state		state;
 	bool				measurements_valid;
 	bool				status_valid;
-	unsigned long			last_measurement;
-	unsigned long			last_status;
+	u64				last_measurement;
+	u64				last_status;
 	struct mutex			read_lock;
 	struct device			*dev;
 	struct device			*hwmon_dev;
@@ -457,8 +457,8 @@ static int sht15_update_status(struct sht15_data *data)
 	int timeout = HZ;
 
 	mutex_lock(&data->read_lock);
-	if (time_after(jiffies, data->last_status + timeout)
-			|| !data->status_valid) {
+	if (time_after64(get_jiffies_64(), data->last_status + timeout) ||
+	    !data->status_valid) {
 		ret = sht15_send_cmd(data, SHT15_READ_STATUS);
 		if (ret)
 			goto unlock;
@@ -502,7 +502,7 @@ static int sht15_update_status(struct sht15_data *data)
 
 		data->val_status = status;
 		data->status_valid = true;
-		data->last_status = jiffies;
+		data->last_status = get_jiffies_64();
 	}
 
 unlock:
@@ -589,8 +589,8 @@ static int sht15_update_measurements(struct sht15_data *data)
 	int timeout = HZ;
 
 	mutex_lock(&data->read_lock);
-	if (time_after(jiffies, data->last_measurement + timeout)
-	    || !data->measurements_valid) {
+	if (time_after64(get_jiffies_64(), data->last_measurement + timeout) ||
+	    !data->measurements_valid) {
 		data->state = SHT15_READING_HUMID;
 		ret = sht15_measurement(data, SHT15_MEASURE_RH, 160);
 		if (ret)
@@ -600,7 +600,7 @@ static int sht15_update_measurements(struct sht15_data *data)
 		if (ret)
 			goto unlock;
 		data->measurements_valid = true;
-		data->last_measurement = jiffies;
+		data->last_measurement = get_jiffies_64();
 	}
 
 unlock:
-- 
2.45.2

