Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465700;
	b=Z3flmDwJuETAeI4cYZ4BzCsC3vKI/wdn3NO8Jn3ZhyMsfWxICakpQJKwEsKN/Z42qQ5b
	 qjFQzqq1f8Ap3CpXGTjLsYvz02p8qr0o6BinFuiN0M7VaiMjWHZu3RVLHbQH+qD2sa/fe
	 dycQil7caXtP7o3wv9FLWEj0y9Cu9FypDxjOqyhAMTQw/wLsg0BvKK6YnqSgp+kHZNnMi
	 /uoEXpt8tondOJSIL/CCe8OMmVghMfto44mA6I2OjvqAy5zpE6YUtM7gOFEk3d7jnefEj
	 yTfxPIYLXbFIT22Y04BO2P1/dgLpuJD1BrxewYAJ6lJhpwxCiIgVkIB6OWau/SxoGgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465700;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=k9jWCA85MhmtLLSuDGiypFCkhxXfqXeyQX/TTt2UlWE=;
	b=Yxb6MVyKg2Qy83s/ajo9nQ/rZcsoYy9ZeXhZRUH9zaC4OHXagp1KcK5u2dC3BNmQQFiz
	 k/u9KHUOu4tATm5erNN5WShPNRnUcf34sp0hqfTIQQbg5LIDqPhNY9ImL/v/FiRFa6+TA
	 WMl8RkSpn0WckMN7A5udgQv2h8WwqYhLtOWE2pBG0H9TQ4Emwwo7/qVEmU53N/dOceXS9
	 ZL3yUf52mwjxC+r9mr2bnbGYBwsmhiqDzEaTFFU8cQH4nGcoKZacnBGW4JwFaigqauMhh
	 kpKkQt6zmp55Wldi3eNzS7nvD+WeEcUa/uQYbgW1YxzQH7oJ1UuPP/icH/LPDRurRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=qA6xWNdd;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D430E606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 16:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D430E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=qA6xWNdd
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id N8XFxQmGcLvgbNCM0xX6RY; Sat, 31 Oct 2026 16:54:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NCM0xxemzLr2uNCM0xxRYk; Sat, 31 Oct 2026 16:54:52 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae61d5c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=NBYwl7_TlWtQaAuGWt0A:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=k9jWCA85MhmtLLSuDGiypFCkhxXfqXeyQX/TTt2UlWE=; b=qA6xWNddfFYg
	GzCzY2Ani6JMATH8L8gIP6Ub6/KSTUl49CuH+yCdlCOdF18FRS0G5LAS4HANPh1OFICsE1buYPrhV
	R6rfUgBTxuqSP/ZoiZzPPz3UOgYI1OTYqzAuy6HVHIRycwAxoIITj6Z/EKZDleHIMPEMw/GaF4B9l
	yZfqLP8IppB7Vpyt4WUP5pzgohNGXNg74xjfyY33+N6jNgdsbcb8C8YkH+3s+AAdXZBnaVqVDyhOn
	Dv9oSHicLgSeZqPN0xdfhgiCadKwzUhgcdE2HrPuqvX2vRCUr+XMN2joNEoo4fRxOWxASZN/fTcSr
	ef1eHqC0lE/TynGt7ntRLw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53514 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNCLz-00000002i8M-3Vz1;
	Sat, 31 Oct 2026 22:24:51 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/3] hwmon: (acpi_power_meter) Fix missing locking in sysfs show callbacks and resume
Date: Sat, 31 Oct 2026 09:54:45 -0700
Message-ID: <20261031165447.1771473-2-linux@roeck-us.net>
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
X-Exim-ID: 1xNCLz-00000002i8M-3Vz1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53514
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKC9vMqF6zBVT/fPVodUQTdHxOPdoib4rKQP4H6xntddJ5c3Nt6asF6OE6HjODnwQgsR1e6g/CYBS8e5CLpl+r/wMkWKe4zoAv3Dx8O+IaQy8WihV/Vd
 uN8eguueTCKWSU7Tl/lv6DdKZ2ALuh85T5OsHL9WbyAX+b3PyL99kMoUSw+UGeLRYcBr8c1lnjrCO9LyK5Z8E4+1Xyken2A/SBgC1DE5tLjORzhtg/slDK3R

During system resume, acpi_power_meter_resume() calls free_capabilities()
and read_capabilities() without acquiring resource->lock. Because ACPI
notifications run on the non-freezable kacpi_notify_wq workqueue, a
concurrent METER_NOTIFY_CONFIG notification during resume can race with
acpi_power_meter_resume() and trigger a double-free or use-after-free on
the model_number, serial_number, and oem_info strings as well as
concurrently overwrite resource->caps. When CONFIG_SUSPEND_FREEZER is
disabled, concurrent sysfs readers can also dereference the freed
capability strings mid-update.

In addition, none of the extra sysfs attribute show callbacks acquire
res->lock:
- power1_average_min_show() and power1_average_max_show() read the 64-bit
  res->trip[] entries twice without locking while set_trip() modifies
  them under res->lock (including temporarily storing a candidate value
  before evaluating _PTP and rolling it back on failure). On 32-bit
  architectures this exposes torn 64-bit reads, and on all architectures
  it exposes uncommitted trip values and a TOCTOU race between the < 0
  check and multiplication (emitting "-1000" instead of "unknown" if
  set_trip() rolls back to -1).
- power1_model_number_show(), power1_oem_info_show(),
  power1_serial_number_show(), power1_cap_hyst_show(),
  power1_accuracy_show(), and power1_is_battery_show() read capability
  strings and 64-bit capability fields without synchronization against
  resume updates.

Acquire resource->lock using guard(mutex) in acpi_power_meter_resume()
and in all extra sysfs show callbacks. Also return -ENODATA in the
capability string show callbacks if a string pointer is NULL after a
failed capability re-read.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
Fixes: 16746ce8adfe ("hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/acpi_power_meter.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 3891962f03db..38d6a1e56ffc 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -584,6 +584,8 @@ static ssize_t power1_average_min_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
 	if (res->trip[POWER_METER_TRIP_AVERAGE_MIN_IDX] < 0)
 		return sysfs_emit(buf, "unknown\n");
 
@@ -596,6 +598,8 @@ static ssize_t power1_average_max_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
 	if (res->trip[POWER_METER_TRIP_AVERAGE_MAX_IDX] < 0)
 		return sysfs_emit(buf, "unknown\n");
 
@@ -608,6 +612,8 @@ static ssize_t power1_cap_hyst_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
 	if (res->caps.hysteresis == UNKNOWN_HYSTERESIS)
 		return sysfs_emit(buf, "unknown\n");
 
@@ -619,8 +625,11 @@ static ssize_t power1_accuracy_show(struct device *dev,
 				    char *buf)
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
-	unsigned int acc = res->caps.accuracy;
+	unsigned int acc;
 
+	guard(mutex)(&res->lock);
+
+	acc = res->caps.accuracy;
 	return sysfs_emit(buf, "%u.%u%%\n", acc / 1000, acc % 1000);
 }
 
@@ -630,6 +639,8 @@ static ssize_t power1_is_battery_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
 	return sysfs_emit(buf, "%u\n",
 			  res->caps.flags & POWER_METER_IS_BATTERY ? 1 : 0);
 }
@@ -640,6 +651,11 @@ static ssize_t power1_model_number_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
+	if (!res->model_number)
+		return -ENODATA;
+
 	return sysfs_emit(buf, "%s\n", res->model_number);
 }
 
@@ -649,6 +665,11 @@ static ssize_t power1_oem_info_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
+	if (!res->oem_info)
+		return -ENODATA;
+
 	return sysfs_emit(buf, "%s\n", res->oem_info);
 }
 
@@ -658,6 +679,11 @@ static ssize_t power1_serial_number_show(struct device *dev,
 {
 	struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
 
+	guard(mutex)(&res->lock);
+
+	if (!res->serial_number)
+		return -ENODATA;
+
 	return sysfs_emit(buf, "%s\n", res->serial_number);
 }
 
@@ -984,6 +1010,8 @@ static int acpi_power_meter_resume(struct device *dev)
 {
 	struct acpi_power_meter_resource *resource = dev_get_drvdata(dev);
 
+	guard(mutex)(&resource->lock);
+
 	free_capabilities(resource);
 	read_capabilities(resource);
 
-- 
2.45.2

