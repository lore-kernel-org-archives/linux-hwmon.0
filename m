Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660010;
	b=pNo9HjmSNp9kF66tGOD5RzDQjTiwNH7egY/hjE9dXG/hxONLYyEJbQHBUnlHMA0xVVpX
	 lIWefyD+JBssxPvJnqcqDWhaSjh6nvkt8eVzcYSubOIPrffNfX5hZIFwr0UnbB7vfK1Yg
	 V4PBA8ostV9AYIPtB12q1fKSlBp/psspLVp7akhvXHdvy4jttfidrzmw0c+rCvPn+Qv4u
	 dL9lbqr0vW+mn+4J5DfT9ZpYnSiGKoXiGYepDO0UFF/UZkMaeWRdaeQ0c82mIradlhwia
	 qruQIpIya7iqzGOUrp36P+Ly3JqnYe490rUXoaawlrBnIA4oU3iyPP5WqGVJEIuZkuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660010;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=yHXtJrXr5lm4zId2QI0Ltlen5ZLO91J+XxDZrBAm3ts=;
	b=Q1m7iKvuCVOZXChQFwf1spJ24kKfB4dOhMcKGrUn4xTNfb7CSYpiGKE+FZWbWGR751Sr
	 Qr3nFjMICHMXqOu4IoNuWy7RNUUW034wkmRSsOFfmFob+zPv02bxCmwviykR29pgU+tys
	 LrT2qEPNlAGeByvGyLmzQnYtScCTPMfvrffkYX+JRH3404sayfCN1hT7EwwFHaMsyYYUh
	 GLam2W+Zrs8OseiCQD3P8DiURYnQ03O1p4MaccoUz8ytsifQ6gTGFNjpjx0edCrOKSlEV
	 /IIbgZmM0/PJ1SaF2+XLLan8xpo9hOWxNLcGQmnmSikdTlil9+SDPSsyBNgH6CYaWZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=N2l6SaaR;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3EC606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=N2l6SaaR
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NtVyxfhEkc3XsO0uAxXliL; Mon, 02 Nov 2026 22:53:30 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0u9xjLOomTkmO0u9xiccC; Mon, 02 Nov 2026 22:53:29 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae91469
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=ck1_09JoL6EqAymGxmkA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=yHXtJrXr5lm4zId2QI0Ltlen5ZLO91J+XxDZrBAm3ts=; b=N2l6SaaRYF4b
	YjQzeNYNe+XFLjYkJ/CS6I2aWHJSndgyb19f7Ue2CaIMazvmGciDyv/yTHiEK2TyesakBCRfNpuZg
	IogOcwsT0TKbr8f07ri22mCHkXK0k5rmqnecwDY5kjajjNXYOVvaxD075hO2s8s2R4cVKqEJ09l6m
	32uHtsMeyx1cj5Nt1GlBnt9Ix4sBjnKKLHD3dyVmOkzvwkC89IQbb/WeHXKUIe4XL5hm8gnixohei
	L7wZJNUZZBVJBWD/6M6X++mZ/BVUug68o7R2dwjg2QGrY6//aSKJSzD3T6vnSuOTLPuk3x/mYHnKd
	wZ8enHdI9TM03hGHHZaXuQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33480 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0u9-00000003kOB-03JA;
	Tue, 03 Nov 2026 04:23:29 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Luca Tettamanti <kronos.it@gmail.com>
Subject: [PATCH 018/102] hwmon: (asus_atk0110) Use 64-bit jiffies for sensor cache timestamp
Date: Mon,  2 Nov 2026 14:51:11 -0800
Message-ID: <20261102225235.334487-19-linux@roeck-us.net>
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
X-Exim-ID: 1xO0u9-00000003kOB-03JA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33480
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 48
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPYm/UJzl6/9G/ZLyIs0CxYlcf6GWmoSqlf+cWUfAjL1I4WnKLbZgE+EMsRaF+M1wk38NjT0Ul2GyO25YO0f4Tdqi9ikIohlwImlaiQcGDgvjkv6O56T
 y8KmICaOSs9qZ8yj5fFD0yWXWr9TzxEDPRszC4tYVRzP6TKfZc+8ogKZ2me/vHe2XJeSvkJXtWJFjzaC1xexelh6ytFLLO+XkpK7qIAwn8mcImg0zcry9VZL

atk_read_value() uses 32-bit jiffies and time_after() to cache sensor
readings for CACHE_TIME (1 second). On 32-bit architectures, if a sensor
is not polled for about 24.8 days at HZ=1000, time_after() wraps around
and prevents new ACPI readings from being taken.

Convert last_updated to u64, use get_jiffies_64() and time_after64(), and
serialize sensor reads in atk_input_show() with hwmon_lock so 64-bit
timestamp and cached_value accesses cannot race or tear on 32-bit
systems.

Fixes: 2c03d07ad54d ("hwmon: Add Asus ATK0110 support")
Cc: Luca Tettamanti <kronos.it@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_atk0110.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index 868c4e14d26a..3cc8e8d287e4 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -164,7 +164,7 @@ struct atk_sensor_data {
 	u64 limit1;
 	u64 limit2;
 	u64 cached_value;
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 	bool is_valid;
 	char const *acpi_name;
 };
@@ -221,7 +221,8 @@ static ssize_t atk_input_show(struct device *dev,
 	u64 value;
 	int err;
 
-	err = atk_read_value(s, &value);
+	scoped_guard(hwmon_lock, dev)
+		err = atk_read_value(s, &value);
 	if (err)
 		return err;
 
@@ -634,7 +635,7 @@ static int atk_read_value(struct atk_sensor_data *sensor, u64 *value)
 	int err;
 
 	if (!sensor->is_valid ||
-	    time_after(jiffies, sensor->last_updated + CACHE_TIME)) {
+	    time_after64(get_jiffies_64(), sensor->last_updated + CACHE_TIME)) {
 		if (sensor->data->old_interface)
 			err = atk_read_value_old(sensor, value);
 		else
@@ -644,7 +645,7 @@ static int atk_read_value(struct atk_sensor_data *sensor, u64 *value)
 			return err;
 
 		sensor->is_valid = true;
-		sensor->last_updated = jiffies;
+		sensor->last_updated = get_jiffies_64();
 		sensor->cached_value = *value;
 	} else {
 		*value = sensor->cached_value;
-- 
2.45.2

