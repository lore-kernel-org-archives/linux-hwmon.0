Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACF2EDD40
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737856; cv=none; b=Q09JJqxck0y4cWNmBA/7QB4yeqE+fjwyj7eJ6Q1aOkSUomIDk0H3EpPg2jxgSNdQvGddj/SbLjXozfJ7m9n+92KwWm7ClzquTvYZ5QmDi+AaT2DdacrutMZt1VFVZjrItNxooKFBll9iyViQThzbhogeUGTUn4OWk85YzQK75Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737856; c=relaxed/simple;
	bh=FCnhrAvE6GZr/XkTEmtO37z1aLo4j9sdAf1KFf6NX3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bi5isQlt4isI8tcPJXnX46IzxdH1D2aVktJFyXOEJfCHq7vmRc8EBpIwWMZ6C76c5uYBL+OalIGEObtozndq/w/Cu/7xJmqS4FgPQ7z8mNv6GqQA7H3RXJUWJ4VFZ7UOqbxABzh1C6rie9yZFkBaO0UIn7MKdUPcIZ3GS/OG88Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEBrtPs/; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEBrtPs/"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba94dbf739so358408eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770737853; x=1771342653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=up1C/Rgw4SQ2rhQeqXsMiwbPqkxhRbqgm6UC1Bxi8XM=;
        b=YEBrtPs/mwtfZSfMOUU+rx/aH3yurkZ3X2qggfN5+Ny9Xp/wrCM9XOMQxSX3gJr0LC
         Zodul+iynn7NWRP5gWd9vdGUG+56pwnlwZp2VTbwArcFgA4d2zUfRd8uEkFKfK4znrCp
         qfwEtJScYB6gOxhKJtO8xUjiPRIansfFqP6buzfhZ2g3wMSTsnvecuylVTkhtY9fVyWf
         tMxNJUJCWbOlk9kztAqjdT+bBTeXBke2MoT1I1ECcvyT9IA72nzvt4cDFo9owi5qJk9T
         3OA1F61OCAelDBnz68d5k1r7T+92Iy9VxYpZ3PyhVbt+epmhRP6EUDrKNu3hkjPXZsAm
         EWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737853; x=1771342653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up1C/Rgw4SQ2rhQeqXsMiwbPqkxhRbqgm6UC1Bxi8XM=;
        b=bz6rtdhDv4t+GAla9dTYhO7NIV+Ubkj552hpJ3EnJo3BBAr8G5xJQG4df92UGm42gB
         Vd27e6eS3Oe8uEQ+OK7Dj9BNyqWEhb2Nx3jV685ey3vbZaZsIEDVvYDZb16gqTHwEPvI
         dw2lFB1hCSoRnkkEkTHvLKognPmrvW6vkXeGR2B/OS8E3kiC6lKeFY5xFCjXrhfMzTbM
         tcqFQz00GDNqK3dGPfmYrE7CYF+ohvIhHuTjQcDZ/c1yCP7AgyG4wZm+6DbtJP3csbWt
         86aDP3pSzvjHooWNaYtazCMohQ/dh3Gx22U6y1PzpmQWQs6cg1gX6grPq+wsvSpnvoYs
         tblw==
X-Gm-Message-State: AOJu0Yw6igk5KMbkLGSD5w6QkUPQOy4zhHq8BIxuXgcbpiiA+xXiSPBW
	NMpG4+n1nL6AKtJGYHgd/xsngvgkcUgZtKXfEr7F8fhlY6jDzk6wOkAk
X-Gm-Gg: AZuq6aL6gtGHWpWeiNsbh/0LrWGUP93q8HVPhkIdUh6Y/BIWDaAtHZbfdtwpe9FeUqR
	+VbJzWegGvae/E3/i1uXsGvVbWyLN9BFS1lGiNk94PMKX9OngUSUS5R2Gxo9IjBsaMXkpp1Vo3l
	kiPlgF/Bpz2UwwkdvBfXtiwNaBSWy3IqXS2odzsulySIniMdya/gpwB0qNBFxAELBDUvhl0ABV/
	xyRa0jTjuC38mfWqmidCp7uW3NWKgAFRbDeqII6ksKLRpzn8BAlLsYU3NwMwuD9uSkXkNDW4vDi
	Y7UWxcuBVRXlKPMN73LksCNEKscF+yEnuFo8OXRZsi8WAOCLSkloYcZbPypLcjloXnv0t2FW8qe
	1lT6hKZ9X5b6unREfStdC9aqKUv0GajVKFbz1NND1DOMf6GxjCMO3YKAigX4buEQzdnRzGpMg0d
	wtopXCUrgqjAQziGQmBNNSHul0hG0CQMKb0Rug
X-Received: by 2002:a05:7301:3c0e:b0:2b8:1d16:9726 with SMTP id 5a478bee46e88-2b856830f07mr7152319eec.31.1770737853155;
        Tue, 10 Feb 2026 07:37:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba93de9c9dsm499267eec.11.2026.02.10.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:37:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updated for hwmon-for-v7.0-rc1
Date: Tue, 10 Feb 2026 07:37:30 -0800
Message-ID: <20260210153731.3719742-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon updated for Linux hwmon-for-v7.0-rc1 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc1

Thanks,
Guenter
------

The following changes since commit 615901b57b7ef8eb655f71358f7e956e42bcd16b:

  hwmon: (acpi_power_meter) Fix deadlocks related to acpi_power_meter_notify() (2026-01-31 07:36:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.0-rc1

for you to fetch changes up to 9e33c1dba22431bea9b2bf48adf56859e52fc7ec:

  hwmon: (pmbus/mpq8785) fix VOUT_MODE mismatch during identification (2026-02-10 07:14:45 -0800)

----------------------------------------------------------------
hwmon updates for v7.0

- New drivers

  * PMBus driver for HiTRON HAC300S power supply

  * PMBus Driver for Monolithic MP5926 Hot-Swap Controller

  * PMBus Driver for STEF48H28 hot-swap controller

- Support for new chips in existing drivers

  * asus-ec-sensors: Support for Pro WS TRX50-SAGE WIFI A and
    ROG MAXIMUS X HERO

  * dell-smm: Support for Dell OptiPlex 7080

  * f71882fg: Support for F81968

  * gpd-fan: Support for Micro PC 2

  * nct6683: New customer ID for ASRock Z590 Taichi

  * nct6775: Support for ASUS Pro WS WRX90E-SAGE SE

  * sht3x: Support for SHT85

  * tmp108: Support for P3T1035 and P3T2030

- Bug fixes

  * ibmpex: Revert "fix" for UAF which didn't fix a UAF but introduced a
    race condition resulting in a NULL pointer crash.

  * pmbus/mpq8785: Fix failure to instantiate driver if the chip is
    configured for VID mode

  * max16065: Use READ/WRITE_ONCE to avoid compiler optimization induced
    race

  * nct7363, emc2305: Resource leak fixes

- Other notable changes

  * cros_ec: Support for temperature limit thresholds

  * coretemp: Add TjMax for Silvermont through Tremont Atoms

Various other minor improvements.

----------------------------------------------------------------
Anj Duvnjak (1):
      hwmon: (nct6683) Add customer ID for ASRock Z590 Taichi

Antoni Pokusinski (1):
      hwmon: (sht3x) add support for SHT85

Armin Wolf (1):
      hwmon: (dell-smm) Add support for Dell OptiPlex 7080

Carl Lee (1):
      hwmon: (pmbus/mpq8785) fix VOUT_MODE mismatch during identification

Charles Hsu (2):
      dt-bindings: hwmon: add STEF48H28
      hwmon: pmbus: add support for STEF48H28

Cryolitia PukNgae (1):
      hwmon: (gpd-fan) add support for Micro PC 2

Denis Pauk (1):
      hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE

Felix Gu (2):
      hwmon: (emc2305) Fix a resource leak in emc2305_of_parse_pwm_child
      hwmon: (nct7363) Fix a resource leak in nct7363_present_pwm_fanin

Filippo Muscherà (1):
      hwmon: (nct6775) use sysfs_emit instead of sprintf

Guenter Roeck (1):
      Revert "hwmon: (ibmpex) fix use-after-free in high/low store"

Gui-Dong Han (2):
      hwmon: submitting-patches: Explain race conditions caused by calculations in macros
      hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race

Jai Kith (1):
      hwmon: (asus-ec-sensors) Add VRM temperature for Pro WS WRX90E-SAGE SE

Ji-Ze Hong (Peter Hong) (1):
      hwmon: (f71882fg) Add F81968 support

Kari Argillander (2):
      hwmon: Fix wrong return errno in *sanitize_name()
      hwmon: Use sysfs_emit in show function callbacks

Krzysztof Kozlowski (3):
      hwmon: (emc2305) Simplify with scoped for each OF child loop
      hwmon: (max6639) Simplify with scoped for each OF child loop
      hwmon: (nct7363) Simplify with scoped for each OF child loop

Laveesh Bansal (2):
      Documentation: hwmon: coretemp: Update supported CPUs and TjMax values
      hwmon: (coretemp) Add TjMax for Silvermont through Tremont Atoms

Mayank Mahajan (3):
      dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
      hwmon: (tmp108) Add support for P3T1035 and P3T2030
      hwmon: (tmp108) Add P3T1035 and P3T2030 support

Randy Dunlap (1):
      hwmon: pmbus: fix table in STEF48H28 documentation

Reis Holmes (1):
      hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO

Rob Herring (Arm) (1):
      dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema

Robert Marko (1):
      dt-bindings: hwmon: sparx5: add microchip,lan9691-temp

Robert McIntyre (1):
      hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A

Szymon Wilczek (1):
      hwmon: (acpi_power_meter) Replace deprecated strcpy() with strscpy()

Thomas Weißschuh (4):
      hwmon: (cros_ec) Split up supported features in the documentation
      hwmon: (cros_ec) Add support for fan target speed
      hwmon: (cros_ec) Move temperature channel params to a macro
      hwmon: (cros_ec) Add support for temperature thresholds

Vaibhav Gupta (1):
      hwmon: (fam15h_power) Use generic power management

Vasileios Amoiridis (2):
      dt-bindings: trivial-devices: Add hitron,hac300s
      hwmon: Add support for HiTRON HAC300S PSU

Wensheng Wang (1):
      hwmon: (mp2925) Add vid offset for vid mode

Yuxi Wang (2):
      dt-bindings: hwmon: Add mps mp5926 driver bindings
      hwmon: (pmbus) Add mp5926 driver

 .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------
 .../bindings/hwmon/microchip,sparx5-temp.yaml      |   8 +-
 .../devicetree/bindings/hwmon/ti,tmp108.yaml       |  21 ++-
 .../devicetree/bindings/trivial-devices.yaml       |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/asus_ec_sensors.rst            |   2 +
 Documentation/hwmon/coretemp.rst                   |  59 ++++--
 Documentation/hwmon/cros_ec_hwmon.rst              |  29 ++-
 Documentation/hwmon/gpd-fan.rst                    |   3 +
 Documentation/hwmon/hac300s.rst                    |  37 ++++
 Documentation/hwmon/index.rst                      |   3 +
 Documentation/hwmon/mp5926.rst                     |  92 ++++++++++
 Documentation/hwmon/nct6683.rst                    |   1 +
 Documentation/hwmon/sht3x.rst                      |  18 +-
 Documentation/hwmon/stef48h28.rst                  |  71 ++++++++
 Documentation/hwmon/submitting-patches.rst         |   5 +-
 Documentation/hwmon/tmp108.rst                     |  17 ++
 MAINTAINERS                                        |  21 +++
 drivers/hwmon/Kconfig                              |   6 +-
 drivers/hwmon/acpi_power_meter.c                   |   4 +-
 drivers/hwmon/asus-ec-sensors.c                    |  17 +-
 drivers/hwmon/coretemp.c                           |   9 +
 drivers/hwmon/cros_ec_hwmon.c                      | 130 +++++++++++---
 drivers/hwmon/dell-smm-hwmon.c                     |   7 +
 drivers/hwmon/emc2305.c                            |   8 +-
 drivers/hwmon/f71882fg.c                           |   6 +-
 drivers/hwmon/fam15h_power.c                       |  11 +-
 drivers/hwmon/gpd-fan.c                            |  27 ++-
 drivers/hwmon/hwmon.c                              |  11 +-
 drivers/hwmon/ibmpex.c                             |   9 +-
 drivers/hwmon/max16065.c                           |  26 +--
 drivers/hwmon/max6639.c                            |   7 +-
 drivers/hwmon/nct6683.c                            |   3 +
 drivers/hwmon/nct6775-core.c                       |  70 ++++----
 drivers/hwmon/nct6775-platform.c                   |   1 +
 drivers/hwmon/nct7363.c                            |   8 +-
 drivers/hwmon/pmbus/Kconfig                        |  27 +++
 drivers/hwmon/pmbus/Makefile                       |   3 +
 drivers/hwmon/pmbus/hac300s.c                      | 132 ++++++++++++++
 drivers/hwmon/pmbus/mp2925.c                       |  23 ++-
 drivers/hwmon/pmbus/mp5926.c                       | 184 +++++++++++++++++++
 drivers/hwmon/pmbus/mpq8785.c                      |  28 +++
 drivers/hwmon/pmbus/stef48h28.c                    |  75 ++++++++
 drivers/hwmon/sht3x.c                              |   1 +
 drivers/hwmon/tmp108.c                             | 197 +++++++++++++++++----
 46 files changed, 1345 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/hac300s.rst
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/hac300s.c
 create mode 100644 drivers/hwmon/pmbus/mp5926.c
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c
