Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE3323417;
	Thu, 13 Nov 2025 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068954; cv=none; b=RCgWhwR6jKrBhTwlYxoBO0LeGjp9tkYkWOVoZGFNhYeUrhJvxqiq25y4zNd7cRcZhLFNeLNhwMGjCDkgjWoKqNz8aC3Oy7lwCghsv8I93QQIsfUg4N6inaVcu5rndQ2mZAqyLoGksOVYl+JLOhXnQbRuphKxhCV+3aA/ehsuy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068954; c=relaxed/simple;
	bh=FURlV6IypNB2wc2BmBZmwHj+YeWta42tdOgXsME4JTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lG7w9FbeXnVWuCyMmR6MM3GDhldyGAXCOBji5+nePbGlWIBGnJbXy9ULdIloUn5SgmxSkJ0+EmCsbyFlPEz/jXZCApeod90hmlpfIzLYBS0bcWnhMGgiNleFLMAKol4Mk3G2h0oTRUi5n6KHvsHxSnGravrgIu9ID1BWH7RCNpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=LWTrLYng; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="LWTrLYng"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 5A0A5C4C5C;
	Thu, 13 Nov 2025 23:22:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id A0C22C4C62;
	Thu, 13 Nov 2025 23:22:24 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C7EEF1FE5D5;
	Thu, 13 Nov 2025 23:22:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763068944;
	bh=y2FUnG7GMHiBitus+JX0YeNj7QxG6A/L3DWqCR2UY4M=; h=From:To:Subject;
	b=LWTrLYngslsUxm4mE2OyjzekDRxbFS5Lavmv1SbvlN3S1zfAHalgV4aLA1NLlCGcr
	 vYzfGGegHtiM5D6VxUpapVBh+a3xrxhk/8hdjwAwnGhgwFRsAgslK0QAC9+OcF3iJf
	 GRT92P/wujJ9BAl6th1dNJs2nLQr9csinbBh9Kk5dATKB7Nyh/PC2P7OT/hPf9uOpW
	 OR0YLZJE2/CVguC2AFsD1fynyHeTg+KInjZ4M2CViSWGQHB1fcFgytkyiKm59jShOx
	 l3axqygb9RMgak0RpK9T5ePRaMthYr2uYlJJANgipwceJiSGKtJe3ZM7FBtiICE2UR
	 ufDB2YzxeGQ+w==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v5 0/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
Date: Thu, 13 Nov 2025 22:22:15 +0100
Message-ID: <20251113212221.456875-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176306894432.663031.10101354850811258679@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

This series introduces a platform driver for Ayaneo devices, ayaneo-ec.
This driver provides hwmon support, power management, and module management
(for the new Ayaneo 3 device). Module management is done through the new
firmware attributes sysfs interface.

Luckily, all Ayaneo devices with an ACPI mapped EC use the same registers.
Older devices also use a memory mapped region for RGB[1], but that is
replaced by HID in the new Ayaneo 3. Therefore, this allows for a simple
driver design that provides robust future support. The memory mapped region
can be upstreamed as a different RGB driver in the future or remain
out-of-tree[1].

This change also allows cleaning up the oxpec driver, by removing Ayaneo
devices from it. In parallel, charge limiting is added for these devices.

[1] https://github.com/ShadowBlip/ayaneo-platform

---
V4: https://lore.kernel.org/all/20251110180846.1490726-1-lkml@antheas.dev/
V3: https://lore.kernel.org/all/20251031163651.1465981-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20251015084414.1391595-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250820160628.99678-1-lkml@antheas.dev/

Changes since v4:
  - Use mask for modules
  - add depends dmi to first patch

Changes since V3:
  - Move ABI date to November
  - Add mutex to suspend hook and cleanup
  - Fix data access from within hwmon in suspend hook

Changes since V2:
  - Fix various non-functional nits
  - On hibernation restore, use restore instead of thaw, switch to bools,
    and restore fan pwm mode, but only after the first pwm write after
    hibernation. Also, release pwm when entering hibernation.

Changes since V1:
  - Use plain sysfs attrs for magic module attributes
  - Combine quirk for power and modules, so attribute tree is simpler
  - Use switch statement in hwmon
  - Add hibernation hook for charge bypass in last patch
    - Restoring fan speed is a liability so it is omitted, see patch notes
      Note that for EC managed fan curves, it would be acceptable
    - Regmap comment: Using regmap is unprecedented for ACPI mapped ECs
      and overkill for one value (> 100 LOC)
  - fixp_linear_interpolate() comment: it requires importing an extra header,
    is not used for static parameters in other modules, and expands to the
    same equation for parameters used, so it is omitted

Antheas Kapenekakis (6):
  platform/x86: ayaneo-ec: Add Ayaneo Embedded Controller platform
    driver
  platform/x86: ayaneo-ec: Add hwmon support
  platform/x86: ayaneo-ec: Add charge control support
  platform/x86: ayaneo-ec: Add controller power and modules attributes
  platform/x86: ayaneo-ec: Move Ayaneo devices from oxpec to ayaneo-ec
  platform/x86: ayaneo-ec: Add suspend hook

 .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 +
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/Kconfig                  |  17 +-
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/ayaneo-ec.c              | 592 ++++++++++++++++++
 drivers/platform/x86/oxpec.c                  | 115 +---
 6 files changed, 636 insertions(+), 117 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
 create mode 100644 drivers/platform/x86/ayaneo-ec.c


base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.51.2


