Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465689;
	b=uaFqR1u7XEYnYIGizU9UE977iQar+Rq9QK0chumcKOVk57Yznnvl47NMW56Rk8cQ1QVm
	 g+vCDq6ztOSU1J6C2RSHhO/W20pdazC7i1Q/AYeRlRwDaetqc4NbKoQVI8ym4tPCX5sng
	 FLkb6YOTrIx5MbRaiSHRoWC3C5Y/bQ1IVMVeHkyqoE6VfGGrI1/UBLIbEdUYlJJdKnTWG
	 /2bc9RnEYCj1QSIkJOgXfug4JdR8TTPQ7ONIRThR5j9dEa/we5Et5/ktpl6JucoDJr6lC
	 iLoM6PIP/YPzwuYvm3UfPTnK3GC4kEWPiwFq1qzly1z/zDaR07wyGtRLmk5faRCyjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465689;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=ebjE39lSUCJpfX4SB/Ok76gA+bY8rTH7Ddf7SrcEqac=;
	b=mYYRIt4wUXK2Sa22WnopGwbJNlucsMXX3sd+8yhmtDQt6j3rcCGpecTQbY4pHTuthzqT
	 NcPtcwdRjTMdoXPbw3CovGmbXipqFCDArv7KHXCuEPwzpHpveqCttyCr9vCS3LtOR00cS
	 rDx62+NYcpGWDvrAsmtzG+dbWGTdr16k3WjH3EHTu6vJwq8QHbS4DOQoVhxoXQfVl6chL
	 86H7loet0o1wWSHTe+yWtB6mkOyPcipzlbEmvbizt6Cv7ZrpDees5t/pMRoJHllduLath
	 SbpaQhYcJPtqiQcoAU+bhFVmNQjfpr4qPoNzSIE/s4XivjOamrOQ8Pj6Wxk4Afip1xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NlLjJWav;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B23606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 16:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NlLjJWav
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NBGfx9JewaC0UNCLwxIYNJ; Sat, 31 Oct 2026 16:54:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NCLwx9SH81xnwNCLwxipu8; Sat, 31 Oct 2026 16:54:48 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae61d58
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=r096hmOktIMH77s-Y5AA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ebjE39lSUCJpfX4SB/Ok76gA+bY8rTH7Ddf7SrcEqac=; b=NlLjJWavbgE+ttGsh2mxQ7RjR/
	7ybqBrf9k6ldb1ZFgx1rCNcq+FmR+ojsnbO1MgNNru9yaDLaRm+wtc2v4+z6ORlG42kwpJLH5+hD/
	klKUaTklUYYNLG5PRnlQSYElwd7jN4YerqxKgJNcai5VrG+jzBjsRTglgbwyU996242rmCM7SVsGc
	UqH5asd1M+sfACrO2H63Erlnwwa7IithIkY7HWuMTAT1JpefwmoEwvlg2onRCR0ywkNL/OYY4XptG
	ht4A06n3VCtQxITgUHfBkR9lcqbW4sTDO5Qy88VLvvIcp9JSb6Nar46DbTIT+K0BwFAQqCa032+ik
	oNNA9frw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53498 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNCLw-00000002i65-05QS
	for linux-hwmon@vger.kernel.org;
	Sat, 31 Oct 2026 22:24:48 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH 0/3] hwmon: (acpi_power_meter) Fix locking and unknown value handling
Date: Sat, 31 Oct 2026 09:54:44 -0700
Message-ID: <20261031165447.1771473-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-Exim-ID: 1xNCLw-00000002i65-05QS
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53498
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO0TnDToNB0Iqjq3j4fOb540KUd3vIO42Ru3MUOFqTIMn4uT66RAkLpshYXEBvelXJNBWOZQiTzvsnHUifLXkRa0Mvzy4g2T0ruLsvUnTt3S7SopjYhN
 wMmDUoxqjHBqGmB+LPNesRBRnOOw3XXg8kp3NkGoz8RqyHanPGaka/FuI1U3RE2HAjg5Jo5LZpWC7vGm884W+Vv/NLiq/kQYVJicxivU016yXkdjwHpSsoZZ

Sashiko identified a number of issues in the acpi_power_meter driver.
I used gemini-3-carbon to analyze the bug reports and to implement fixes.
Subsequently, I used Sashiko again to review the fixes. This series is the
result of this effort.

This series fixes locking races and incomplete handling of ACPI unknown
sentinel values in the acpi_power_meter hwmon driver:

1. Fix missing locking in sysfs show callbacks and system resume.
   acpi_power_meter_resume() frees and reallocates capability strings
   without holding resource->lock, racing with concurrent
   METER_NOTIFY_CONFIG notifications (and sysfs readers when the freezer
   is disabled). In addition, the extra sysfs show callbacks read
   capability strings, capability integers, and 64-bit trip points
   without acquiring res->lock, exposing torn or uncommitted trip values
   when racing with set_trip(). Acquire resource->lock in resume and in
   all extra sysfs show callbacks, and return -ENODATA if a capability
   string pointer is NULL.

2. Prevent spurious power alarms when power is unknown.
   When _PMM returns an unknown sentinel (U32_MAX or U64_MAX),
   update_meter() stores it in resource->power and returns 0, causing
   get_power_alarm_state() to evaluate resource->power > resource->cap
   as true and report a false alarm. Convert get_power_alarm_state() to
   return a boolean alarm state so reading power1_alarm never returns an
   error code, preserve and clear any latched METER_NOTIFY_CAPPING
   notification when notifications are supported, and otherwise report 0
   (no alarm) when readings fail or power is unknown.

3. Check for both 32-bit and 64-bit unknown ACPI values across attributes.
   ACPI Power Meter objects report unknown or unavailable integer values
   as all-ones (U32_MAX or U64_MAX depending on DSDT revision), but most
   attributes in the driver either only checked 32-bit 0xffffffff or did
   not check for unknown sentinels at all. Introduce
   acpi_power_meter_is_unknown() and use it to return -ENODATA for
   unknown non-alarm numeric hwmon attributes, emit "unknown" in
   power1_cap_hyst_show() and power1_accuracy_show(), avoid comparing
   against an unknown cap in get_power_alarm_state(), and skip jiffies
   caching in update_meter() when sampling_time is unknown.

----------------------------------------------------------------
Guenter Roeck (3):
      hwmon: (acpi_power_meter) Fix missing locking in sysfs show callbacks and resume
      hwmon: (acpi_power_meter) Prevent spurious power alarm when power is unknown
      hwmon: (acpi_power_meter) Check for 32-bit and 64-bit unknown ACPI values

 drivers/hwmon/acpi_power_meter.c | 101 ++++++++++++++++++++++++++++-----------
 1 file changed, 74 insertions(+), 27 deletions(-)
