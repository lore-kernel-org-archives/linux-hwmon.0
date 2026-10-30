Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386392;
	b=k6MMGuBqzlPQIkznEwYy45OhFZL+V+TGeZcaUrqnBoouf//JQm3609Qq4ssyzuXJy6YT
	 QdBoFNabSEGNlrm5cQOiUjd0qia+P1/KKnGNONPuJUBnVhKRVI80gAAjTcdmI1Q/ErIBE
	 VJZe/DywlqycpYTPN6US4VYN1miMvZ+++ZwNR1293G0Wkv+6kZ50VweRiKfx13opGrvGO
	 knzFDH4QihTo0BZM7aCd3v2tSiPf0hHgrgmFG+WUwvfyzXacdQfn95fSzfJXJA0FNd2U7
	 YJs41Frx0VPJJRf2948w5TXim27yUOOvMl+2TuhDzKUMhKWshx7Jr1BJXbl6yaplkmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386392;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=1lRbKW7Hb4zQFIIRqWU0DxNkXDMLKH5n2wYcgKDbDV0=;
	b=TtTPVIRlavo8/n5/vgOBykgfIRLg5BTyL1EdJycQrXT4u73F+hUL20P1fK9dKAHGbPFn
	 wxvyBTY0QBLdVd9XdEtwttA0owbyTzXYnDgs80nqaiB3KYQR/Yi6YYSeufcHCzYWH2bSy
	 D8wZrzDR62wA4QQIlVy01Glr9Z/Ea8dOyAtCQAYoS6LhskUDXSjx2eYWCUIRgaSZk1LBI
	 izEJH0G5W2Q+I3Vgy6ro9AIlbomQuSIQSacPeGScIRAvexrbZGba62ZLM7oU99CUNXZVI
	 ACTg41Rhr/5ecoiRomMh/C2cC4gIIbpV2mLoFHp6SnPvSZHLciGI/EsX8/bdulWapQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oYEz60TS;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DEB606A31D
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oYEz60TS
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id MjP2xobHrJFmFMrixxqRML; Fri, 30 Oct 2026 18:53:11 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MriwxN9pN63hBMriwxxL2k; Fri, 30 Oct 2026 18:53:11 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae4e797
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=z2vfn2ni6Ux5mstj45EA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=1lRbKW7Hb4zQFIIRqWU0DxNkXDMLKH5n2wYcgKDbDV0=; b=oYEz60TSyYlv
	3jiabRsSIlLMRJvNZU6UKq5vGbh3fewqajMIl9JyIjUlphG4YREtxJdmNZ0KwKIpIfMoq92Jfydp+
	J8CB9NC2VJcf/FKobYXw/nIpd2ZA705K6H8TIcKustK1TWuD9+7l3efzmsPZ/lMno2+8z346K4qHJ
	DdTPRCQnuR7PP/duyDZMTS8MoP1fWtYwOY84DUAgf7Y+dfUODiuySETgyo/uw6KSjFJQi1Xoy0DEP
	KkqXWilZDqZKsZ1hP8UTh92ykiBE296msjvf8uwuXnDkmnkbMMB6ylGDZzeb7A2WiKcylEoxFSxQu
	YFpHNfLN235fyBE85Q015g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54958 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMriw-00000003RLd-232i;
	Sat, 31 Oct 2026 00:23:10 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	James Seo <james@equiv.tech>
Subject: [PATCH 04/11] hwmon: (hp-wmi-sensors) Fix unbounded loops in scale_numeric_sensor()
Date: Fri, 30 Oct 2026 11:52:49 -0700
Message-ID: <20261030185256.976255-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030185256.976255-1-linux@roeck-us.net>
References: <20261030185256.976255-1-linux@roeck-us.net>
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
X-Exim-ID: 1xMriw-00000003RLd-232i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54958
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 20
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG0lSLbw2EtrXnCKofNLpIMvKto8arHr5rjxdGaWgTMyGZz2f0e6PS64M5u+IidnqZ/KBWMP4YKq6e+0LVI5uD0rlx/T0ZreSSiFYAAPXjQoxVJPXdCJ
 VWGGSaWf5rF7spqFajjpCFljKj703E+ut3S/QXPNem4T3fYVB2rFHp4vOWt37im0GzkP5bGpete7gqs0i8oMqLsPLxVKwwt9lf3vOO9NPYUGntaK9brlDNJc

In scale_numeric_sensor() in the hp-wmi-sensors hwmon driver, an unbounded
loop occurs if the ACPI WMI implementation provides a highly anomalous or
malformed UnitModifier value for a numeric sensor.
The UnitModifier property is extracted from a WMI ACPI object without
bounds checking and cast to a signed 32-bit integer. This value directly
controls the iteration count of two scaling loops. If the provided
unit_modifier is extremely negative (e.g., INT_MIN), the first loop
executes billions of times before reaching target_modifier. Conversely,
if unit_modifier is extremely large (e.g., INT_MAX) and the current
sensor reading (val) is exactly 0, the second loop's overflow safeguard
(val > LONG_MAX / 10) never evaluates to true, resulting in billions of
unnecessary iterations. This prolonged execution causes severe CPU stalls
and thread soft lockups during driver initialization or whenever a
user-space process reads the sensor attribute via sysfs, resulting in a
denial of service on the affected CPU core.

Fix the problem in the first loop by exiting it as soon as val is zero.
Fix the problem with the second loop by only entering it if val is not
zero. Also add a check for val < LONG_MIN / 10 and exit the loop if that
is the case.

Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
Cc: James Seo <james@equiv.tech>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hp-wmi-sensors.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index a859752c8387..1953d672edaf 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -739,15 +739,21 @@ static long scale_numeric_sensor(const struct hp_wmi_numeric_sensor *nsensor)
 
 	val = current_reading;
 
-	for (; unit_modifier < target_modifier; unit_modifier++)
+	for (; val && unit_modifier < target_modifier; unit_modifier++)
 		val = DIV_ROUND_CLOSEST(val, 10);
 
-	for (; unit_modifier > target_modifier; unit_modifier--) {
-		if (val > LONG_MAX / 10) {
-			val = LONG_MAX;
-			break;
+	if (val) {
+		for (; unit_modifier > target_modifier; unit_modifier--) {
+			if (val > LONG_MAX / 10) {
+				val = LONG_MAX;
+				break;
+			}
+			if (val < LONG_MIN / 10) {
+				val = LONG_MIN;
+				break;
+			}
+			val *= 10;
 		}
-		val *= 10;
 	}
 
 	if (sensor_type == HP_WMI_TYPE_TEMPERATURE) {
-- 
2.45.2

