Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465695;
	b=jkHqaE+FYNCsH7jE4AYMvGM71cG1BkrWz4ifOQFbcM7tXGWfCnuqwzAjwQ42Z5nRftt4
	 1zUyRdll9/f2RkTfZ0Kk8frruBwjXz01JzBiBgXW58K6oDGaZs6JrkbS8IiIpjTyiCtGk
	 XOanUnEPBOo0N2I06M+6c9J/658IsKCkiqeRUkp8RpugfUo9PvDiZEK47w1FwQK+NZkkX
	 7bBIoPQYLpnNnSYX4D4qtKcrDM+Fb197fa3qCxheNvtygycaLMnF/b+kZOii2SOhYKY5A
	 n+4ZKflZBNBozRXPGPYyNjGuAjWxQzybfzyT+yTW6P3LSKNLpHIIby3iETPDqXXLlGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465695;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ydJSdjdw7H4TYF1MYfaKPqlq9T9Cl94Mgohl0lO5alU=;
	b=SKDtlxIv6EAS65+ASwF51hjRjNxTExwpJfrLFgoPPFPQ+a5RE8prfT+5yfC4ntU+aJeJ
	 wmrc7tzPhICX3O0iqbViylNEIPpyVoUP1W1QbAhSBWHDGdS3UpdOAab6COSmRuTc1spWM
	 m3Ja+1wwkoxfdCwTAfQmmJwEZWDS0aaWPgieYRuilPt/PBter/uF/RaRurvimBxHLjX+i
	 AT1LX66IleZGrU9FUaAEEkKOtxPBJgYP6idLX+epaDttFerVK0Z3M0cQddP3X2TCr08Wp
	 t4ZTiOTJZDBQs3fzcMuaNXdyIIRsivA4EieqGjCmk5s3taoQi+emEX4CYa6COZQmI3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PNkdMStg;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E75606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 16:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PNkdMStg
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id MxRzxEddBv0ndNCM2xx03r; Sat, 31 Oct 2026 16:54:54 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NCM2x7JfubxHHNCM2xTVe0; Sat, 31 Oct 2026 16:54:54 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae61d5e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=_fIloHDgRJCjPKhE0QwA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ydJSdjdw7H4TYF1MYfaKPqlq9T9Cl94Mgohl0lO5alU=; b=PNkdMStgmUvC
	3JQLGagRrbnqtN705fgUScaLdsnuO+F9n4SgQfJ22I/2Te7IgUucZcHsueTz/CG2KTwP58UhNz0UX
	7SzKqIgBM9VdnGMgTS47Rc38+c7zUzeBL9IK7RmgDo0KSNiAk3d9NNt/XxE43jIcNQuRciCraKm4v
	i325DG4RNW4+sf5XIIopUbI9Re4sit6x/tTb6vtQoQrVINkjlEi0LkLOPBjuflWcSoY0qMRLS01q0
	hFHPGN2xl5JI/rxg6MP14nzbZdfyVePZEr/pGvJgW4Hr9biuDeh19dUctD54dmJ+QwXEcEO/CQHFS
	yekqunbJRR9suB4NkGu7rA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53518 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNCM1-00000002i9R-3DrG;
	Sat, 31 Oct 2026 22:24:53 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/3] hwmon: (acpi_power_meter) Prevent spurious power alarm when power is unknown
Date: Sat, 31 Oct 2026 09:54:46 -0700
Message-ID: <20261031165447.1771473-3-linux@roeck-us.net>
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
X-Exim-ID: 1xNCM1-00000002i9R-3DrG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53518
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNfLO9ErJD4KRqGQKUCOu/UzMuKFuy7VLQnnHpk9ZXm/kAoRdz3eiVTgXfb5h+foq9pgWtHvNoajd6MWiO7qujwYxtYtyEzywxspiB3T29EF4HTV5qyv
 iQRC4pBgBSmYDOPEkq4TL09QVSe3LYfv1qni5nD1tObclM1Ii8d9UF6lOiN/BeK1L9Kbbop3s49eS/mSMOrDjHFivgaRkRrpLpNhCdc6+JcE8XQhXjv3OrIg

According to the ACPI specification (Section 10.4.3 _PMM), if an error
occurs while obtaining the power meter reading or if the value is not
available, _PMM returns an integer with all bits set (U32_MAX or
U64_MAX).

In get_power_alarm_state(), update_meter() stores this unknown sentinel
value in resource->power and returns 0. Unlike the hwmon_power_average
handler in power_meter_read(), get_power_alarm_state() does not check
resource->power against UNKNOWN_POWER_32 or UNKNOWN_POWER_64 before
comparing resource->power > resource->cap. Because the sentinel is a
large unsigned integer, the comparison evaluates to true for any valid
cap, falsely reporting an active power alarm to userspace and latching
resource->power_alarm = true.

In addition, alarm attributes should not return error codes when the
alarm status cannot be determined; an inconclusive alarm state should
report 0 (no alarm, no error).

Convert get_power_alarm_state() to return a boolean alarm state. Preserve
and clear any latched hardware capping notification when
POWER_METER_CAN_NOTIFY is set, and otherwise return false (0, no alarm)
when resource->power is unknown or when updating the meter or cap reading
fails.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/acpi_power_meter.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 38d6a1e56ffc..1f1d58995693 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -377,28 +377,30 @@ static int set_avg_interval(struct acpi_power_meter_resource *resource,
 	return 0;
 }
 
-static int get_power_alarm_state(struct acpi_power_meter_resource *resource,
-				 long *val)
+static bool get_power_alarm_state(struct acpi_power_meter_resource *resource)
 {
+	bool alarm = false;
 	int ret;
 
+	if (resource->caps.flags & POWER_METER_CAN_NOTIFY)
+		alarm = resource->power_alarm;
+	resource->power_alarm = false;
+
 	ret = update_meter(resource);
-	if (ret)
-		return ret;
+	if (ret ||
+	    resource->power == UNKNOWN_POWER_32 ||
+	    resource->power == UNKNOWN_POWER_64)
+		return alarm;
 
 	/* need to update cap if not to support the notification. */
 	if (!(resource->caps.flags & POWER_METER_CAN_NOTIFY)) {
 		ret = update_cap(resource);
 		if (ret)
-			return ret;
-		resource->power_alarm = resource->power > resource->cap;
-		*val = resource->power_alarm;
-	} else {
-		*val = resource->power_alarm || resource->power > resource->cap;
-		resource->power_alarm = resource->power > resource->cap;
+			return false;
 	}
 
-	return 0;
+	resource->power_alarm = resource->power > resource->cap;
+	return alarm || resource->power_alarm;
 }
 
 static umode_t power_meter_is_visible(const void *data,
@@ -481,9 +483,7 @@ static int power_meter_read(struct device *dev, enum hwmon_sensor_types type,
 		*val = res->caps.max_cap * 1000;
 		break;
 	case hwmon_power_alarm:
-		ret = get_power_alarm_state(res, val);
-		if (ret)
-			return ret;
+		*val = get_power_alarm_state(res);
 		break;
 	case hwmon_power_cap:
 		ret = update_cap(res);
-- 
2.45.2

