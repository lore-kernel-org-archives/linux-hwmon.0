Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659969;
	b=uSkyW5hpQGWnM9G3cVI5L9vZCvdk25OCnAzAO95UhEVt/+XXcriZGPEUFR1bgD5LYAyb
	 rgdERpPbVSvwbv7xntNsZsX5Z4C/6Kedosal3giuG5PUZ01iRqDXv239wJ1u0TtfL1cp0
	 Vr6lbSiQhzD5XwEnKsqpGbExWY8k+sGEfScwot/heEdqmy6IW83b7LLsO9ATHUQ+XGFrz
	 R0FrrFJCFknD9+9EduOE8+UDJL3JEdudxXji58T+gveg4xTe1wzLzP0WgEgq8woZe5idQ
	 XzgRBECi3RIGvDSdnZl9erH48QC5lpwDkluB+Dpq6QlCs2/MU1gJVx2iCW+AS1fgdUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659969;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=8sGkagc8QdfAK3LpaXFlrnk32iBsKgfjBejDgm6pEtE=;
	b=HDcbsrmZJYz0t/6by5qAlm5CL0qnx28kjqTfrU76gQDgfn1txqNylXwGWbnCWUHvs+Q0
	 QHU24b/o+/pZ05FMOmLczzV6p9a571R6d5J+oGzZiY8mEl2WeDLGV53Wwt2OxYhmIM6UY
	 mgFDvUHKDOG+4ASJyZTHQG0L99c/mIaJVMn38ZGoERro50rAkWQloZ1NMaZLsJLF/p/J0
	 WUeCUusw30QMePKtcuI+OPVXRz+kN+LjgcSCb7pKlUT2IbK4WjP3K5jjXzwhMfUS5UHjV
	 /mJfJl4tLF7fIaLOJEb5K2fWzGq8nSHuUzCwUR2TMwAfnYDxHHv/W5VvlWx7vFKC7GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fye6eCBE;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B2606D80F
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 725B2606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fye6eCBE
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NwxfxgXuec3XsO0tUxXlWE; Mon, 02 Nov 2026 22:52:49 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tUxPKmALr2uO0tUxE69F; Mon, 02 Nov 2026 22:52:48 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae91440
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=IzYoClkb2r-ggB1aRwUA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8sGkagc8QdfAK3LpaXFlrnk32iBsKgfjBejDgm6pEtE=; b=fye6eCBE1/Kr
	oM8mK25Sdf1fL3X2f/vHuoIo2YUg6U9RerrshNRU80Zj7Kk7n1A1EDzxGTosrD4bcee/33YJasFcz
	oelMa1Pphxp3okyIeCAqgtNzsfr0MERU2/Cbm6PxpdAhIgFQ7GGRrslTovYlghi3QD30ubKwqRT2r
	nLed49cit1Osge5tfhY7ZbcMo4lwiqGWuMUINVIt774fC5ZkBrEpwOBvSfT40oBeOk882hr74vjij
	u+jOrJFFv5tsJpmfo6P2KbgkphPg97EIGYjzZJhW8ZK2M1fidZwJflRwA3+ux+1hKySYyAGR/IGoz
	ru4yrlWgVSFLktzwC30OjA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42272 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tT-00000003jni-3qaU;
	Tue, 03 Nov 2026 04:22:48 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 003/102] hwmon: (acpi_power_meter) Use ktime for sensor sampling interval
Date: Mon,  2 Nov 2026 14:50:56 -0800
Message-ID: <20261102225235.334487-4-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tT-00000003jni-3qaU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42272
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 26
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI013ryP13ahrwvPN1onlB3o/wUn4NIt/ApmNBsrJsr3HkiR0lwTH0Mul1wOdegcPtzxkIfCuEMK2xGNH5UYFbOw8N8jNQ96lnoJZx1spatxSWQfXxO9
 lNs/HGdXxqN9LEpV5POXl2hURl950dCd+J/8G9qMKeuG96F43pvgvtqubPUItHc+6V0R3ybgzewjCqfHYOSPGhQCvx/RkXlu6pnfHXCg3ivRRvg6Vr8Oqygn

update_meter() uses 32-bit jiffies, msecs_to_jiffies(), and time_before()
to cache power readings for caps.sampling_time milliseconds. On 32-bit
architectures, if the meter is not polled for about 24.8 days (at
HZ=1000), the 32-bit jiffies comparison wraps around and stops updating
power readings.

Because ACPI reports sampling_time natively in milliseconds, convert
sensors_last_updated to ktime_t and compare elapsed milliseconds using
ktime_ms_delta() and ktime_get(). This avoids 32-bit jiffies wraparound
as well as repeated millisecond-to-jiffies conversions.

Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/acpi_power_meter.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 300acf1998ce..aae0a627f847 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -9,7 +9,7 @@
 #include <linux/module.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/limits.h>
 #include <linux/mutex.h>
 #include <linux/dmi.h>
@@ -95,7 +95,7 @@ struct acpi_power_meter_resource {
 	u64		avg_interval;
 	bool		power_alarm;
 	int			sensors_valid;
-	unsigned long		sensors_last_updated;
+	ktime_t			sensors_last_updated;
 #define POWER_METER_TRIP_AVERAGE_MIN_IDX	0
 #define POWER_METER_TRIP_AVERAGE_MAX_IDX	1
 	s64			trip[2];
@@ -179,12 +179,11 @@ static int update_meter(struct acpi_power_meter_resource *resource)
 {
 	unsigned long long data;
 	acpi_status status;
-	unsigned long local_jiffies = jiffies;
 
-	if (!acpi_power_meter_is_unknown(resource->caps.sampling_time) &&
-	    time_before(local_jiffies, resource->sensors_last_updated +
-			msecs_to_jiffies(resource->caps.sampling_time)) &&
-	    resource->sensors_valid)
+	if (resource->sensors_valid &&
+	    !acpi_power_meter_is_unknown(resource->caps.sampling_time) &&
+	    ktime_ms_delta(ktime_get(), resource->sensors_last_updated) <
+	    resource->caps.sampling_time)
 		return 0;
 
 	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_PMM",
@@ -197,7 +196,7 @@ static int update_meter(struct acpi_power_meter_resource *resource)
 
 	resource->power = data;
 	resource->sensors_valid = 1;
-	resource->sensors_last_updated = jiffies;
+	resource->sensors_last_updated = ktime_get();
 	return 0;
 }
 
-- 
2.45.2

