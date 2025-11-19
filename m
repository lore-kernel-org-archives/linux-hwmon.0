Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1730FC08;
	Wed, 19 Nov 2025 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574328; cv=none; b=gi4E8jJWUzAwyjTGGlry1mKQBaXhmmv5h1O4XQxFjK4/INI+xmoNUVmKYzZ5rPsXszb3tlMUZ+Q1TDpwOC4t5E+EVtPUU/drPUIBqkvEigNmPsX3riBLSetxftMZDAGgbWaWE6iqQB6nj+p1qJSLecvPKy6+uW/GvnPX3zKw3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574328; c=relaxed/simple;
	bh=F20OvdyObVpqUsUGM81gqwxyncH+OUamnakck3OkA+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dlyzeFtSTevtRQbF2gcK/UIT1aPjURX/rAitDwqTPgkJ4I8UT7Ui7wtEB3zwQX36WhCSZ4WrvjI/pTZi8+wlcQ2DvEdsQmIhKaKtbbjzOHK2MkSGRY52bsLbJc26Jvf1j8k8G5yBz2qW5sD5iQtI3egvGxhOuWFEcHHQ05AfKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Skymt+XT; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Skymt+XT"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id D0783C4A23;
	Wed, 19 Nov 2025 19:45:16 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 0C3F0C4C67;
	Wed, 19 Nov 2025 19:45:16 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C3D8F200E75;
	Wed, 19 Nov 2025 19:45:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763574315;
	bh=kF3CCvroJmzTQX0x0v0Sy3nWBGjQxNwd6Y9hjcCBX3M=; h=From:To:Subject;
	b=Skymt+XTLasF90NHHb2Q03XiK/Sss1h9Sq6VjnKd6wZosAoX2hIWH45O1w9VFWKn1
	 3NwImi5z9lWHqWwLLp9KJeBfb3SIUTHRioS1TqErRjFGKjjPToFdN7EBxs5iLBaj/9
	 mJftb2Vr8dwW4wPoLf5PfPoQWDdhFbKjNq+/cASRZfk16nSMXCnR+cQsX5q70nJsoe
	 z2uE6ySP3bIJqrRj1ln2NrLJukP3jAjrLpTiMDQQ42VjCeRVn9qKqpZcPNiFi8WHc9
	 FI7f13dmVVckI63mbjk0Q9I1V35MZDzpv8ihZtDLTTGiFQCZ+GbVsH71b4TwaNK0CC
	 NbXMKPMv5GewQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
Subject: [PATCH v6 0/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
Date: Wed, 19 Nov 2025 18:44:59 +0100
Message-ID: <20251119174505.597218-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176357431548.2086283.14103999225682109838@linux3247.grserver.gr>
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
V5: https://lore.kernel.org/all/20251113212221.456875-1-lkml@antheas.dev/
V4: https://lore.kernel.org/all/20251110180846.1490726-1-lkml@antheas.dev/
V3: https://lore.kernel.org/all/20251031163651.1465981-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20251015084414.1391595-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250820160628.99678-1-lkml@antheas.dev/

Changes since v5:
  - Add pm include, add pm_sleep_ptr() on suspend hooks
  - Change += to |= in hwmon patch (technically the same)

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
 drivers/platform/x86/ayaneo-ec.c              | 593 ++++++++++++++++++
 drivers/platform/x86/oxpec.c                  | 115 +---
 6 files changed, 637 insertions(+), 117 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
 create mode 100644 drivers/platform/x86/ayaneo-ec.c


base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
-- 
2.52.0


