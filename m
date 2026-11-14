Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638672;
	b=W4hcv5iNCAF54azmXsAb0l5j+LgmMA3UBrAEoeg7FhaqUTAgXE1wWAJbv2FQPK5id2L3
	 9VwgGjhsiG0upAm5okzFU+1wJGXRs4fKAm227mpaMJzW5tcsP0YqvjmLunqhjYxoKtbQ7
	 3NZO8MpuFISsyyHwLhdfu6ynePX2+at3juVH3Nsp5/TlklxZ8PnbDSuBr3EmH0zQgWOXm
	 lFjsahZ83X2gWyuJ5If0cBYK6i5vuEkc+t/TaQii4JeIkVjEnxSKym86fxE15S4rkg8ef
	 9HOe/Hnl0rE9i3+CnVfCjdsKLUqn0KYwWIuhDLEFqp3x5kqi7S8pbWhdMRGjaXK0ZPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638672;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=aL543kydGu3Z9WJl9D/pxWL683tGWWiFwX80/nLuatE=;
	b=S105gj4eF9d7dRadiQN4O+2CIYRAtJ/w+tCeDe5IWURDGP8YqqquTIs6IuKUV8KrBYaL
	 Z5NeVQLiCelaISIJefdU8w+Yf2I4vo6rIiQDz8ksLur1zr8m5Wp01rokMevCPE5tcnRjk
	 LUkTh7lyYq55mooweZoYnPtzSHEPAyXyQJmQiBB7NgK0mUVxDIds8W/rdL+LZLDIqFRx1
	 jiKVeuHpURnYWTHur+0Js8ZX8jvBhXhreNtVRpO6nJimJWwkMhkyJvSbNLVgfxZPlCAjh
	 ROXQprCmgU/R9uhaknhtHtRm0LLZ3IvcDu5LDcHYRFe3AlPMGnM06SZJxB98e+zRTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YIjZpVUk;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26C606A337
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 06:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB26C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YIjZpVUk
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id RzKRxcyCtyb4YS7V1xdzOF; Sat, 14 Nov 2026 06:44:31 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id S7V0xHT8gFhzrS7V1x6vkn; Sat, 14 Nov 2026 06:44:31 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af8034f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=BDRlbv-OHeEz9Lyx7CoA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aL543kydGu3Z9WJl9D/pxWL683tGWWiFwX80/nLuatE=; b=YIjZpVUke8MslLUsS1TpjXa7KE
	olL0ba4Yh7r1QIXKf6Qq96ygKVX/d2bmJ9/XjtBKLIxkaPKt+7C0aDKzQbG+FUgAmE3MC9EJ++qOa
	JoH+Uls/t9V3qBBIaT0F1tbfDzEO9Vpll+KLeeV6y0W10rAGoYkJP17W6OEwxFcsmHn/XZKnWWLN3
	oycJzNjZnn8QAqoGClUV+rMmhsLYNbd0BviwAKSwn03GVm7sOx86L65eAj0dOvOfcAoK1fwRO00SW
	lzHn2wCMUYjDZ0uCT+OkkV+3ab/XLs+9914k9BlDpb8LEHhjQmwUE319CC2FbMhh2ZTHgTWNIxVvW
	WiB1OMHw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38024 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xS7V0-000000000he-2pAy;
	Sat, 14 Nov 2026 12:14:30 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc3
Date: Fri, 13 Nov 2026 22:44:29 -0800
Message-ID: <20261114064430.2779677-1-linux@roeck-us.net>
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
X-Exim-ID: 1xS7V0-000000000he-2pAy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38024
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 33
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDo1qyib5idqn1mjkbmVUR1Z2f0siPWNgf074xmNjD660MpXNdzhGPLXUmMN8i+WG4oyaTew+BQzshc9V8CQ+c/9Lq/nmgWRASg8SHJAkCvXFKgFc4q5
 QkOIDwih8mL/WFUiTbilWcgfiOLHN8o0LlFTGsyL1b2VS9JlzvBZtBfZaS0f0Vg78CQIP0ASNgWx+tZw3ZX7tmUolYHdsRrxR/R5tJvoBEeLU+XtRVRiG5r7

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc3

Thanks,
Guenter
------

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc3

for you to fetch changes up to b5c5b67e02406fb48acf57cf2c30a570230fd6aa:

  hwmon: (aht10) Fix update_interval overflow on 64-bit (2026-11-13 12:08:12 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc3

* Read tracking-mode voltage fault limits dynamically in the mp2975
  PMBus driver instead of caching probe-time snapshots, avoiding false
  over-voltage alarms when CPU voltage changes at runtime.

* Fix SCMI sensor probe by enabling supported sensors via firmware IDs
  before exposing channels and checking channel config allocations.

* Fix runtime PM enable and reference count imbalances during probe and
  teardown in the gpio-fan driver.

* Fix max31760 fan controller initialization and reporting, including
  leaving standby at probe, initial 0 RPM reporting, and swapped
  temperature limit registers.

* Assorted minor sensor reading, interval clamping, and register
  handling fixes in other drivers.

----------------------------------------------------------------
Anton Lundin (1):
      hwmon: (nct6775) Handle dual use registers

Felix Radensky (1):
      hwmon: (pmbus/mp2975) Get vout fault limits dynamically

Guenter Roeck (1):
      hwmon: (gpio-fan) Fix runtime PM imbalance in probe and teardown

Pablo Mazzini (1):
      hwmon: (sy7636a) fix negative temperatures

Rupesh Majhi (1):
      hwmon: (aht10) Fix update_interval overflow on 64-bit

Stanislav Aleksandrov (3):
      hwmon: (max31760) Fix the local temperature limit registers
      hwmon: (max31760) Leave standby mode at probe
      hwmon: (max31760) Report 0 RPM before the first fan speed measurement

Sudeep Holla (2):
      hwmon: (scmi) Check channel config allocation
      hwmon: (scmi) Configure sensors before exposing channels

Xu Rao (1):
      hwmon: (scmi) Enable temperature sensors using their sensor IDs

 drivers/hwmon/aht10.c         |   2 +-
 drivers/hwmon/gpio-fan.c      |  24 +++--
 drivers/hwmon/max31760.c      |  12 ++-
 drivers/hwmon/nct6775-core.c  |   6 +-
 drivers/hwmon/pmbus/mp2975.c  | 207 +++++++++++++++++++++++-------------------
 drivers/hwmon/scmi-hwmon.c    |  25 ++---
 drivers/hwmon/sy7636a-hwmon.c |   2 +-
 7 files changed, 150 insertions(+), 128 deletions(-)
