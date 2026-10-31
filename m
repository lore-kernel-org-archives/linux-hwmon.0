Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465696;
	b=p8rwI49t3AoJKV3gp3yygCvokuJOqB6zn7aSHl+YqyFP/ysWFVnKX+iXIyGpQZ0pXyHM
	 WG5cBjD0IpGJ3PTHd/zL2qbP5FcmsYSxNt99zjMsbfEuWnEoM3EzT5QR53zIVPAva4S/e
	 n3zTIbXuz80vnAxmEO2ldp5UyZD0VPDAN5YPV7K7NVSyz8EaJ0st7d+qlmNPTS0l+cY9k
	 Y+u+h9K+CbWf8S3Nly2QUFCMI4gWuSUYV9EhPDPT92xrBPm/20jxwIpfMK/rrJHj+os74
	 WTapYi34sm7bQ8EemZVW8Vav4sjFU8UCLn/uWnRr4iBCLqw++BZZctzHSsp12o8gA5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465696;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=g4vM4EN4j8A//YEMCG6K+WOzGvGoYlqZUo/wS/KmjXI=;
	b=o11A0w3L1zXYMkJ+iBeCflZj5MtxtQjHhQUtyBnQOJI0IAuOIw4LHft+PlquMNEb7wCK
	 pQ+mkgNfgzGTzqfmzKROiDBdGsMdqzBoIoYpy0iBCztO+MeuCTCT0ydfnhGiMg0XbsKqW
	 cL8x6W0+0PcxDRfeCRiHyZ0JpyRoBBblcdirwL1Ve7/7Uyre0DLQVAkS3k4KsNlffy/Y+
	 gjfwXJFcZ6ZEfaLxiHewBDKuA/QBpLj/W/4lSAZG5QS32m1oNQcvvTj7xuRQfF6vpbxgH
	 lsnDdzJqSsItiXiltQV42gTwwLfj+MYfuDWvxANY7mIy8rbQc9zPSf1r08LG7WV6JMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=BxYolzqW;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC3606A31C
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 16:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6BC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=BxYolzqW
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id MzK8x51gwusRSNCM3xeTnH; Sat, 31 Oct 2026 16:54:55 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NCM2xLS9NvtkxNCM3x4kbP; Sat, 31 Oct 2026 16:54:55 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae61d5f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=87PJh__p_OewbDqui_cA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=g4vM4EN4j8A//YEMCG6K+WOzGvGoYlqZUo/wS/KmjXI=; b=BxYolzqWATcS
	emovKwd5UKfOyv6gvFTRAb4G5zdkLlZgnxRlLenKWLd9Gm9NOLGoWQviVFGp4L9ICf/sfNiphWJja
	e1ZyXFd4tKD6wvWZgQ62iywQyNlA4he28kqB57M7tIJwRurlmfGN6qEiRti+w0cu1L8qZd3FkQqU5
	tiTSabCAdXRy1G/+vkzmluA42Uf13xSR0nTlehtNu3PAce48A6f1LlA7H5E9DRqtxE72pz8/7qwsE
	DSa7lFLGhEVb4hKA0e02umQVaWuECv+/0Q2VDKqYcbQADopR90GsO76/cwmdO95JoRnQi7mVE8RDA
	m3fimRYE7mzQluyRPbwUwQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47790 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNCM2-00000002iAc-20Hj;
	Sat, 31 Oct 2026 22:24:54 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/3] hwmon: (acpi_power_meter) Check for 32-bit and 64-bit unknown ACPI values
Date: Sat, 31 Oct 2026 09:54:47 -0700
Message-ID: <20261031165447.1771473-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261031165447.1771473-1-linux@roeck-us.net>
References: <20261031165447.1771473-1-linux@roeck-us.net>
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
X-Exim-ID: 1xNCM2-00000002iAc-20Hj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:47790
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPMBJEOBsrEqQ7DfE3CysfwINOsv8m5dVWKHTs/uxwSrrzFpa55Ryz00hdSJZSes6m+GgsDOD+gJhWU9CFRw7740jIsgV90QoiMcNcvPlUtTCCyGP++A
 Izxlu+oPHyOHcWguGk6dhGAb84+rHwpw2l/gRUvVoHmja2naUv4NHsfIm577J+gpq9a1E6yJRXuK05g+ixdld+6UvNDqBL2uhoAlEyh/O+a91cYZHxQSqkLa

According to the ACPI specification (Section 10.4), ACPI Power Meter
objects (_PMC capability fields, _PMM, _GHL, _PAI) report unknown or
unavailable integer values using an integer with all bits set, which can
be either U32_MAX (0xffffffff) or U64_MAX (0xffffffffffffffff) depending
on the DSDT revision.

Currently, only hwmon_power_average checks both 32-bit and 64-bit
unknown sentinels:
- power1_cap_hyst_show() only compares res->caps.hysteresis against the
  32-bit UNKNOWN_HYSTERESIS (0xffffffff), so a 64-bit U64_MAX sentinel
  bypasses the check, overflows when multiplied by 1000, and emits a
  bogus number instead of "unknown".
- power1_accuracy_show() does not check for unknown sentinels at all,
  formatting 0xffffffff as "4294967.295%".
- power_meter_read() does not check min_avg_interval, max_avg_interval,
  avg_interval, min_cap, max_cap, or cap for unknown sentinels, exposing
  scaled or overflowed values (or negative values when cast to signed
  long) to userspace instead of returning -ENODATA.
- get_power_alarm_state() does not check whether resource->cap is
  unknown before comparing resource->power > resource->cap.
- update_meter() passes an unknown caps.sampling_time directly to
  msecs_to_jiffies(), caching sensor readings for weeks on 64-bit builds.

Introduce acpi_power_meter_is_unknown() to check for both U32_MAX and
U64_MAX, and use it across sysfs attribute handlers and meter updates:
- Return -ENODATA in power_meter_read() when numeric power, interval, or
  cap attributes report an unknown value.
- Emit "unknown" in power1_cap_hyst_show() and power1_accuracy_show()
  when hysteresis or accuracy is unknown.
- Avoid comparing against an unknown cap in get_power_alarm_state(),
  returning 0 (no alarm, no error) unless a hardware capping
  notification was latched.
- Skip the sampling_time cache window in update_meter() when
  sampling_time is unknown.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/acpi_power_meter.c | 49 ++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 1f1d58995693..b28ca6acf630 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -30,13 +30,6 @@
 #define POWER_METER_CAN_CAP	(1 << 2)
 #define POWER_METER_CAN_NOTIFY	(1 << 3)
 #define POWER_METER_IS_BATTERY	(1 << 8)
-#define UNKNOWN_HYSTERESIS	0xFFFFFFFF
-/*
- * ACPI integers can either be 32-bit or 64-bit wide, so
- * we have to check for both values.
- */
-#define UNKNOWN_POWER_32	U32_MAX
-#define UNKNOWN_POWER_64	U64_MAX
 
 #define METER_NOTIFY_CONFIG	0x80
 #define METER_NOTIFY_TRIP	0x81
@@ -54,6 +47,15 @@ static bool force_cap_on;
 
 static DEFINE_MUTEX(acpi_notify_lock);
 
+/*
+ * ACPI integers can either be 32-bit or 64-bit wide, so
+ * we have to check for both values.
+ */
+static bool acpi_power_meter_is_unknown(u64 val)
+{
+	return val == U32_MAX || val == U64_MAX;
+}
+
 static int can_cap_in_hardware(void)
 {
 	return force_cap_on || cap_in_hardware;
@@ -179,9 +181,10 @@ static int update_meter(struct acpi_power_meter_resource *resource)
 	acpi_status status;
 	unsigned long local_jiffies = jiffies;
 
-	if (time_before(local_jiffies, resource->sensors_last_updated +
+	if (!acpi_power_meter_is_unknown(resource->caps.sampling_time) &&
+	    time_before(local_jiffies, resource->sensors_last_updated +
 			msecs_to_jiffies(resource->caps.sampling_time)) &&
-			resource->sensors_valid)
+	    resource->sensors_valid)
 		return 0;
 
 	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_PMM",
@@ -387,9 +390,7 @@ static bool get_power_alarm_state(struct acpi_power_meter_resource *resource)
 	resource->power_alarm = false;
 
 	ret = update_meter(resource);
-	if (ret ||
-	    resource->power == UNKNOWN_POWER_32 ||
-	    resource->power == UNKNOWN_POWER_64)
+	if (ret || acpi_power_meter_is_unknown(resource->power))
 		return alarm;
 
 	/* need to update cap if not to support the notification. */
@@ -399,6 +400,9 @@ static bool get_power_alarm_state(struct acpi_power_meter_resource *resource)
 			return false;
 	}
 
+	if (acpi_power_meter_is_unknown(resource->cap))
+		return alarm;
+
 	resource->power_alarm = resource->power > resource->cap;
 	return alarm || resource->power_alarm;
 }
@@ -460,26 +464,36 @@ static int power_meter_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = update_meter(res);
 		if (ret)
 			return ret;
-		if (res->power == UNKNOWN_POWER_32 || res->power == UNKNOWN_POWER_64)
+		if (acpi_power_meter_is_unknown(res->power))
 			return -ENODATA;
 		*val = res->power * 1000;
 		break;
 	case hwmon_power_average_interval_min:
+		if (acpi_power_meter_is_unknown(res->caps.min_avg_interval))
+			return -ENODATA;
 		*val = res->caps.min_avg_interval;
 		break;
 	case hwmon_power_average_interval_max:
+		if (acpi_power_meter_is_unknown(res->caps.max_avg_interval))
+			return -ENODATA;
 		*val = res->caps.max_avg_interval;
 		break;
 	case hwmon_power_average_interval:
 		ret = update_avg_interval(res);
 		if (ret)
 			return ret;
-		*val = (res)->avg_interval;
+		if (acpi_power_meter_is_unknown(res->avg_interval))
+			return -ENODATA;
+		*val = res->avg_interval;
 		break;
 	case hwmon_power_cap_min:
+		if (acpi_power_meter_is_unknown(res->caps.min_cap))
+			return -ENODATA;
 		*val = res->caps.min_cap * 1000;
 		break;
 	case hwmon_power_cap_max:
+		if (acpi_power_meter_is_unknown(res->caps.max_cap))
+			return -ENODATA;
 		*val = res->caps.max_cap * 1000;
 		break;
 	case hwmon_power_alarm:
@@ -489,6 +503,8 @@ static int power_meter_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = update_cap(res);
 		if (ret)
 			return ret;
+		if (acpi_power_meter_is_unknown(res->cap))
+			return -ENODATA;
 		*val = res->cap * 1000;
 		break;
 	default:
@@ -614,7 +630,7 @@ static ssize_t power1_cap_hyst_show(struct device *dev,
 
 	guard(mutex)(&res->lock);
 
-	if (res->caps.hysteresis == UNKNOWN_HYSTERESIS)
+	if (acpi_power_meter_is_unknown(res->caps.hysteresis))
 		return sysfs_emit(buf, "unknown\n");
 
 	return sysfs_emit(buf, "%llu\n", res->caps.hysteresis * 1000);
@@ -629,6 +645,9 @@ static ssize_t power1_accuracy_show(struct device *dev,
 
 	guard(mutex)(&res->lock);
 
+	if (acpi_power_meter_is_unknown(res->caps.accuracy))
+		return sysfs_emit(buf, "unknown\n");
+
 	acc = res->caps.accuracy;
 	return sysfs_emit(buf, "%u.%u%%\n", acc / 1000, acc % 1000);
 }
-- 
2.45.2

