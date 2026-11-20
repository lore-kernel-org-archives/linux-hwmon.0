Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208391;
	b=dtrV7b4G35Pzw6mG5EmBceJKhqrZs2YGHQoTDefCJUY7srB7rNTrwCnk6an4z49rJ8rF
	 a1JzfoV5uR9NECQbcEJ3ykRfZnmVwhGj+faZBwhmFNojKZ9UFKji1a/RSTDdXT+UC6nMq
	 +AnMDBrEw3LWYvXDqo9+CMYbG276ZWzAgoO5A2aAFPneK++IhNDEQrtPkcscbwm2npWvy
	 uxVMfxgiPAS7ZTvKW5RXG+BM8U/taOQyKLMKrKlJ7JyB17ess+9+ikudPSFH4+fbmmu7D
	 tNnOycjShf1EjaISJFCVP0s1b1+UkKvQ+NWrlKgDZYExNyAOH4rWrkQy4oJgxeZdPIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208391;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Icyh0e2Mm8AUBYKEdhB5OYsUp0Bl5CdshODguFNod34=;
	b=UTdfzwaxiLk0ScarzDs0SG7TVMeyniy4zXKHCIwn9fDQzphbaUIQUSy7z/80lw1Gk0fB
	 jBW8chwuZA91JvVsbcp7+REWdrGLJQ6fpcw9/lhkiHhe5LukcKwtBWHtskWipGZ8ct0/H
	 Oa5Y4vR11b+LCPurWaMHFDtlvkEthbfSjQthNlmau0WZg9E82k9zJX9bVwg1sGk4K/B3L
	 BudtqkTZW+zeepBMSNm10+KwKAwMFq05FZQRWzRI6QWgn7VNxAV4lEdYbxPqx4g4oMceK
	 1afLrX64RdbXVxuS2fSzntvgZ1VWMWnPoUVL50BEKMLn1OJ6waoXT8bZ4/d/xY8knpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yz0ceOad;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06F606A6BC
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 20:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A06F606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yz0ceOad
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id URyxxk7oi4vCDUVhzxu6n8; Fri, 20 Nov 2026 20:59:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UVhyxJXqyxmi7UVhzx8asI; Fri, 20 Nov 2026 20:59:47 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6b00b4c3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=4uo6Mt23h18qz7fEtTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Icyh0e2Mm8AUBYKEdhB5OYsUp0Bl5CdshODguFNod34=; b=yz0ceOadJNe2qvhf7oZDn5hdaw
	ovtl5CmEo/iREoSdIR9KYcYL+P8Jyw0h+x1VO4HHnth1YiuCB3Erb5dO5qy0JoCvgTtQukDzI143d
	awiGsrrPmwHrMXiQwC5bspwx5nunBUNl3BDvoazeijmEGyGO2mXtD5/medwSt0ZIO2Pb5I1rmNAp+
	GerbMy3f93E93B4964lLapduRl2ZPTixKggBXHVh91wqHIVgbHdhHHFEsvutlLRL3jtS9uN2eN7SS
	GRvUELIFcYjJ0Bvy0QzVsAjtPYz9MwBOB7SivS66V4bxC5nlDPDvZVYT9EKn9EvVKPYPo8j4vi+SX
	EX5YXLOw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42518 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUVhy-000000029Fq-2Xcz;
	Sat, 21 Nov 2026 02:29:46 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 12:59:44 -0800
Message-ID: <20261120205946.799247-1-linux@roeck-us.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUVhy-000000029Fq-2Xcz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42518
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOnWRSFbwtsisDOdsjWepVGd/iFHy0Mx32GoboDWphf0dMsLum9ZniHo1zG0c5BqV3+NtN7o0hgxNBboxEmyEWaWFjKkMcbHkynIPA6fA7tQvsNCkFyf
 t+VrqfX6WG0rj9rD5kxPNh8/5YbX/fhZMYoD4f56izgLyeNqCujDRa0AJqEfvYfiLedOD4nUX0jNeIV1Gu8M2tjV3eC00Qco2d6taXhjGTA2vFKilt9pjvHe

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc4

Thanks,
Guenter
------

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc4

for you to fetch changes up to 449cdc5e29c63aa66b41ce8c2783f6b0d84c62b0:

  hwmon: (ads7871) Add error handle from spi_setup() (2026-11-19 08:50:01 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc4

* Use per-device lockdep keys in the hwmon core to avoid false-positive
  recursive locking warnings when one hwmon device accesses another.

* Fix sysfs attribute struct downcast mismatches on big-endian systems
  that caused out-of-bounds temp1 array accesses in w83791d/w83792d and
  directed all beep writes to channel 0 in nct6775.

* Fix nct6775 fan control: initialize target temperature and tolerance
  masks/limits on NCT6106/6116/6126, fix swapped normal and critical
  temperature tolerance writes, and use tolerance_mask on REG_FAN_MODE.

* Reject dell-smm fan_max values above 255 to avoid allocation count
  wraparound and invalid SMM calls, and reject PWM writes outside 0..255
  to prevent integer overflow from turning fans off.

* Fix 32-bit overflow and bitfield wrap when encoding sht3x alert
  limits, and propagate spi_setup() errors in ads7871 probe before
  accessing registers.

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: Use per-device lockdep keys
      hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126
      hwmon: (nct6775) Fix swapped temperature tolerance register writes
      hwmon: (nct6775) Fix tolerance bitmask when reading REG_FAN_MODE

Rosen Penev (2):
      hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take
      hwmon: (dell-smm) Reject out-of-range pwm values

Vítor Hugo Silva (1):
      hwmon: (ads7871) Add error handle from spi_setup()

Wayne Ho (1):
      hwmon: (sht3x) Fix overflow when writing alert limits

Ziheng Wei (3):
      hwmon: (nct6775) Fix incorrect struct cast in beep callbacks
      hwmon: (w83791d) Fix incorrect struct cast in show_temp1() and store_temp1()
      hwmon: (w83792d) Fix incorrect struct cast in show_temp1() and store_temp1()

 drivers/hwmon/ads7871.c        |  4 +++-
 drivers/hwmon/dell-smm-hwmon.c |  9 +++++++++
 drivers/hwmon/hwmon.c          |  7 ++++++-
 drivers/hwmon/nct6775-core.c   | 19 ++++++++++++++-----
 drivers/hwmon/sht3x.c          |  4 ++--
 drivers/hwmon/w83791d.c        |  4 ++--
 drivers/hwmon/w83792d.c        |  4 ++--
 7 files changed, 38 insertions(+), 13 deletions(-)
