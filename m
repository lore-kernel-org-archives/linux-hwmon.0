Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F2D1E1C32;
	Mon, 20 Jan 2025 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384011; cv=none; b=Yhr0faSDCBs86kpeOM13m+4ilEQCAgo4AfDYwNPLW3r/M/EjFrUSPwKza33yJVeTJSbRnI7DnLHDgqMtHmVbVhmxT6gIrJ2AEiWaiC2XsVCOxqjLsKXV/PYM9YORbDOBbVkXQugEs6/OtBbxuSTuB4/n3jUSQD8wogJAEyet4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384011; c=relaxed/simple;
	bh=rHTRv6nHlmeU6X9KWo/WcH8zTqrD7PpXhzmlDHzL178=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rcO0OZ7J9AI710aRvdmTMFEWO6zu6rl1Y5uHuKyC4DMYhaYN1rv7doBaT+3K7aClcHKxn//z2dewS0ZZ7+BoF4pyl/nztVUKTePAKS4VzcNPkJtsoHPD0JwFbV2eL8b9yfZnThea5Aa3ZC79VPBUESya2Rnkn1CcSOg+NS95RVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrWuSn+6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrWuSn+6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so7774943a91.3;
        Mon, 20 Jan 2025 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737384009; x=1737988809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GZV6E/rMXEhiC5UlzfHiD9+49W0UMt85k9M5s8o18lM=;
        b=TrWuSn+67DQSRoDC037ChyyE74Pb4q8e7+tQUI9s2bNpG41z5msINMF+enL6J03noq
         guoZzcea+x4TfOELvmrX6q9ryz3s6FPKAwk+SNMqT1eX2Lz+q5q2DLgqLWkcMIF57FlM
         /+SwHm2yEOXLmhr2B4gRB9YuZ1B1IHCJfZjAERlu+aG24bpQmcxY9ZZ7MrhpYNcz+IqP
         euHs6eR0RfNkpXKgTzcXG0dgDXW5MuZyd+OJKPTcrAhkuUnX8FMoUo5ztwG2No/7yg6J
         WLDk7cK4LBJlYpbqjM5UpvEaREdVLPe1sk/3/h0vv2FX/fnMudX0SrMRkkR/+GVROaEe
         ixQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737384009; x=1737988809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZV6E/rMXEhiC5UlzfHiD9+49W0UMt85k9M5s8o18lM=;
        b=X21ZF82icnA+a+agDoo0WKolKcb0FgUjnEBUEEy7qZiHwy29OJ944f67I0N2bvP2OD
         UloKUZ/bgTtQu2KlrJn+TpaXwLIWabi1KBlBkcX/HQPeQifV9C5HDZpBoS+wDLtsxV6m
         8zrqjP1s4OmHxQGg4tnJtNYwxFKnW7N8fwJbhjyuVgGeq42/DLYNR+HLHbu+LGwJcn6u
         TPM3i5CsKCaAjFvedcYIiRQFEp1R4PTXYZI7JDHxzM1Q1WuUxoWBPVmhmcKblAudcKfE
         vjP7VWctOQ5DMU2UxBAyNmeGV91czKrRbK2sUVZWACJATBcFh23orMouyKWdR5gOi7iY
         cQyw==
X-Forwarded-Encrypted: i=1; AJvYcCVKExnDr2+30txqiUa6Lm3qziYxAyyGoDzR5C0dDszYcviFXfvKQwTJceFFTxVuZwnecTUGsiKBaDPpx9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPwoEu45XqHYY/NFOwTRM4UKixom/xXa7z7E0eB6tIz6EvmNeM
	yL9MBDrRMYs9fpbfkRiVtTmU/W++/5/o8n+CwEWpUhoTbWPU7u0UIuYj5Q==
X-Gm-Gg: ASbGncusS6SVzRzgNFCI3McT8xmF/D3nmx4S3n7g+UTM9BPJsJiZfpd5V6B7XQHhnC+
	s2FnSI2oTdNJfAzolbUmEQMYr7aQFf9xDaSyPwRcbg/sdW/KkJ9OWlgi/fgZfJZikmzq1dnR0uF
	cWHhoEqMKEMvBkQBUgSFziNRtZi+hB3PK/kBuHe9e8a7huwXD5uIvN8JgfTh4Fq83uaCMMTpVSr
	xP4phyDrpBJF2oLO/rSkopc/APbK520avdV8s/M1GuD6m4Dh0pcjKB0lc29p3Gsc+OaZZmtrlay
	iK6Gr5Q=
X-Google-Smtp-Source: AGHT+IGQDLy55Xs8LUgQLmOAdICAdMbK6ZWf9pw5xCoi31IzNrSVnwfYLwLiYtQhIc7LHrqXD/r7iw==
X-Received: by 2002:a17:90b:2c84:b0:2ee:6736:8512 with SMTP id 98e67ed59e1d1-2f782c92705mr23164632a91.12.1737384009004;
        Mon, 20 Jan 2025 06:40:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f70bd40b8csm4663865a91.1.2025.01.20.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:40:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v6.14-rc1
Date: Mon, 20 Jan 2025 06:40:05 -0800
Message-ID: <20250120144007.2576007-1-linux@roeck-us.net>
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

Please pull hwmon updates for Linux v6.14-rc1 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.14-rc1

Thanks,
Guenter
------

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.14-rc1

for you to fetch changes up to a76539b293677c5c163b9285b0cd8dd420d33989:

  hwmon: pmbus: dps920ab: Add ability to instantiate through i2c (2025-01-13 08:57:06 -0800)

----------------------------------------------------------------
hwmon updates for v6.14-rc1

* New drivers

  - PMBus client driver for Intel CRPS185 power supply

  - PMBus client driver for Texas Instruments TPS25990

* Chip support added to existing drivers

  - pmbus/max15301: Add support for MAX15303

  - pmbus/adm1275: Add adm1273 support

  - lm75: Add NXP P3T1755 support; with it, add I3C support to the driver

  - asus-ec-sensors: Add TUF GAMING X670E PLUS

* Other notable changes

   - nct6683: Add customer IDs for several MSI and ASRock boards

   - tmp108: Add regulator support

   - Improve write protect support in PMBus core

   - pmbus/dps920ab: Add ability to instantiate through i2c

   - The hwmon core now accepts NULL as device name parameter to
     [devm_]hwmon_device_register_with_info ans uses the parent device
     name as fallback in that case

   - The PMBus core now provides the PMBUs revision in a debugfs file

   - asus-ec-sensors: Support for optional CPU fan on AMD 600 motherboards

   - raspberrypi: Add PM suspend/resume support

   - dell-smm: Enable manual fan control support on Dell XPS 9370

   - pwm-fan: Default to maximum cooling level if provided

* Various other minor fixes and improvements

----------------------------------------------------------------
Denis Kirjanov (1):
      hwmon: pmbus: dps920ab: Add ability to instantiate through i2c

Guenter Roeck (2):
      hwmon: (tmp108) Drop of_match_ptr() protection
      hwmon: (lm75) Hide register size differences in regmap access functions

Heiner Kallweit (1):
      hwmon: (core) Use device name as a fallback in devm_hwmon_device_register_with_info

Huisong Li (2):
      hwmon: (acpi_power_meter) Fix uninitialized variables
      hwmon: (acpi_power_meter) Fix update the power trip points on failure

Javier Carrasco (2):
      MAINTAINERS: Drop IIO from the title of the Chipcap 2 hwmon driver
      hwmon: (chipcap2) Switch to guard() for mutext handling

Jerome Brunet (3):
      hwmon: (pmbus/core) improve handling of write protected regulators
      hwmon: (pmbus/core) add wp module param
      hwmon: (pmbus/tps25990) Add initial support

Joel Stanley (1):
      hwmon: Fix help text for aspeed-g6-pwm-tach

John Audia (1):
      hwmon: (nct6683) Add another customer ID for MSI

John Erasmus Mari Geronimo (2):
      dt-bindings: hwmon: adm1275: add adm1273
      hwmon: (pmbus/adm1275) add adm1273 support

Li XingYang (2):
      hwmon: (asus-ec-sensors) Add support for fan cpu opt on AMD 600 motherboards
      hwmon: (asus-ec-sensors) Add TUF GAMING X670E PLUS

Max Ammann (1):
      hwmon: (nct6683) Add customer ID for ASRock B650 Steel Legend WiFi

Ninad Palsule (3):
      hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
      dt-bindings: hwmon: intel,crps185: Add to trivial
      hwmon: (pmbus/crps) Add Intel CRPS185 power supply

Nuno Sa (1):
      hwmon: (pmbus/max15301) Add support for MAX15303

Peter Korsgaard (2):
      hwmon: (pwm-fan): Make use of device properties everywhere
      hwmon: (pwm-fan) Default to the Maximum cooling level if provided

Povilas Kanapickas (1):
      hwmon: (dell-smm) Add Dell XPS 9370 to fan control whitelist

Stanislav Jakubek (1):
      hwmon: (tmp108) Add basic regulator support

Stefan Wahren (1):
      hwmon: (raspberrypi) Add PM suspend/resume support

Thomas Weißschuh (3):
      thermal: core: Add stub for thermal_zone_device_update()
      hwmon: (core) Avoid ifdef CONFIG_THERMAL in C source file
      hwmon: (occ/p9_sbe) Constify 'struct bin_attribute'

Thorsten Blum (1):
      hwmon: (asus_atk0110) Use str_enabled_disabled() and str_enable_disable() helpers

Uwe Kleine-König (2):
      hwmon: (nct6775): Actually make use of the HWMON_NCT6775 symbol namespace
      hwmon: (isl28022) Drop explicit initialization of struct i2c_device_id::driver_data to 0

Wolfram Sang (11):
      hwmon: (isl28022) use proper path for DT bindings
      hwmon: (isl28022) document shunt voltage channel
      hwmon: (isl28022) apply coding style to module init/exit
      dt-bindings: hwmon: lm75: Add NXP P3T1755
      hwmon: (lm75) Add NXP P3T1755 support
      hwmon: (lm75) Fix LM75B document link
      hwmon: (lm75) simplify lm75_write_config()
      hwmon: (lm75) simplify regulator handling
      hwmon: (lm75) Remove superfluous 'client' member from private struct
      hwmon: (lm75) separate probe into common and I2C parts
      hwmon: (lm75) add I3C support for P3T1755

 .../devicetree/bindings/hwmon/adi,adm1275.yaml     |   2 +
 Documentation/devicetree/bindings/hwmon/lm75.yaml  |   1 +
 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/adm1275.rst                    |  28 +-
 Documentation/hwmon/asus_ec_sensors.rst            |   1 +
 Documentation/hwmon/crps.rst                       |  97 +++++
 Documentation/hwmon/hwmon-kernel-api.rst           |   3 +-
 Documentation/hwmon/index.rst                      |   2 +
 Documentation/hwmon/isl28022.rst                   |   3 +-
 Documentation/hwmon/lm75.rst                       |   8 +-
 Documentation/hwmon/max15301.rst                   |   8 +
 Documentation/hwmon/nct6683.rst                    |  24 +-
 Documentation/hwmon/pmbus-core.rst                 |  35 ++
 Documentation/hwmon/tps25990.rst                   | 147 +++++++
 MAINTAINERS                                        |  11 +-
 drivers/hwmon/Kconfig                              |   6 +-
 drivers/hwmon/acpi_power_meter.c                   |  39 +-
 drivers/hwmon/asus-ec-sensors.c                    |  13 +
 drivers/hwmon/asus_atk0110.c                       |  15 +-
 drivers/hwmon/chipcap2.c                           |  63 +--
 drivers/hwmon/dell-smm-hwmon.c                     |   8 +
 drivers/hwmon/hwmon.c                              |  27 +-
 drivers/hwmon/isl28022.c                           |  11 +-
 drivers/hwmon/lm75.c                               | 339 ++++++++++------
 drivers/hwmon/nct6683.c                            |   6 +
 drivers/hwmon/nct6775-core.c                       |   6 +-
 drivers/hwmon/occ/p9_sbe.c                         |   4 +-
 drivers/hwmon/pmbus/Kconfig                        |  30 +-
 drivers/hwmon/pmbus/Makefile                       |   2 +
 drivers/hwmon/pmbus/adm1275.c                      |  10 +-
 drivers/hwmon/pmbus/crps.c                         |  74 ++++
 drivers/hwmon/pmbus/dps920ab.c                     |   7 +
 drivers/hwmon/pmbus/max15301.c                     |   1 +
 drivers/hwmon/pmbus/pmbus.h                        |   4 +
 drivers/hwmon/pmbus/pmbus_core.c                   |  94 ++++-
 drivers/hwmon/pmbus/tps25990.c                     | 436 +++++++++++++++++++++
 drivers/hwmon/pwm-fan.c                            |  26 +-
 drivers/hwmon/raspberrypi-hwmon.c                  |  22 ++
 drivers/hwmon/tmp108.c                             |  13 +-
 include/linux/pmbus.h                              |  14 +
 include/linux/thermal.h                            |   4 +
 41 files changed, 1378 insertions(+), 268 deletions(-)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 Documentation/hwmon/tps25990.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c
 create mode 100644 drivers/hwmon/pmbus/tps25990.c
