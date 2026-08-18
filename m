Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D673806AB
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023017; cv=none; b=n2nY2NGjadEVTWCv6Pmwoekz9McwoZWH8qjQjDTfUN2RTe5sL7g6k0ngxHlcextuJ0oeO6tUuLa/H0idXifZXdRqN8t3Q//9vDwpUXxFWWZSxxQOMdIIiH0ShMhETKCoTSAgFo/2OdB49vlF63ay0vafSENR88fr/sk3Pc8n9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023017; c=relaxed/simple;
	bh=mePaBqL+8Tnzm9Ca2gP1x0KYFsZkXcwishb8p0c0zuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dnvvUYnxWXQX5wZnZAfc5UjDuH+7lFU5pvizrbtAb2XTqc8xbfAbsNLHCA55447+rxhT2UyyRPF2uv5S/qMeKBSUpkhmnmQcZMKW9dkRnRkLCv/G8pyh06a53JraZONIwerhaQ81cOmhUII/io1hgzVPXLveTLoeAWijHF43hMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+GT+c8+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+GT+c8+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caf228a910so31305565ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787023010; x=1787627810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QEQdnQ6XG0W3KL067g8doTb9ro+CF7r8CAinVnvjpZY=;
        b=Z+GT+c8+y7llDOZqu+B+gcbwBsqRxqz0Hw3Q6p1zK8ZbAxW2CBwMZmhbTIt3/lySCW
         PtsnDlsx1UpTzZthYHBERAsAG9FN3ztA2bqgx1X5Zpar3uteLoaAg23JkiZg/KorbowX
         gjAzq7eLe6XwlCit9RxJ+d6upONhokmL3P35bx8BifJaen6BcAmlQb5sZUlCSCFSefn8
         djkT8AWyW0QGCqG9pmBiwfeU60clpvPTi9+1R2dNoSNnRDqmMYoBdNgP96lAOafJ/DDX
         +nIUeIe8hZwh29Rfa1hXj1O+2AC/xobrpJT6velxGyN9DtEaFCnMuBXeT/l3uvhzcV1P
         E16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023010; x=1787627810;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QEQdnQ6XG0W3KL067g8doTb9ro+CF7r8CAinVnvjpZY=;
        b=F987MT/8WnLagRT11oFRHSzMjwm1+AQ0FoKtRpC2mc2WXUP7kAxWYfUraqzfakoeo8
         WKOHnRMXS87JVv/WhiRl1e7e3QCy29Ot7rpBvTkKYhmGIjknc6uvsE1iKW4mG4nsae45
         bhDfvsGsm/NPL26nqeuIFFRESI0MmW/HdYBvpCDw7VJxeT1oeRt3+AozbmewiNIkydyZ
         UKBWxapw5X6sNd97fQ/XZcUoeGG3jPjLP7Rg7YYMyYSymsrJn71ggVZW0qLK4fbn9LWw
         qpR0qujcAccR3IlLw/aliJ/h+8/MYWS8ERBVxm0Gmlpzdefd7ksKP9mQbZRhUOx3DNFM
         Y1cw==
X-Gm-Message-State: AOJu0Yx0c87vLK9hDkl4zwtVQEuF2nqXiNJydOVaqsT0raiTb7M+Ib58
	m9BVR78RhLyHASVSQVR5uGgRJHofQLN9GOHabHArLY7+ssA8mMwSIwwJ
X-Gm-Gg: AR+sD12Q2WiuWDFC03w0HirRExX46/WsRaxrg2jGmvFf+kT4e9hzKL0ghSTxfJ/uHKl
	HPgHFAbvPWeT7sbRMZDNbJUKc+3zNS0uZmEguVMwMX3fS5HqjnQMm+3c4M0eVkQQrtvaPZXMVTX
	u/RWLRBhDV8BaTaANliOjULEsu3vNUqbYtYFdTcUAZc5bdTpz0R3Ph6Ri6l2Jnnvkj5VOMxTgIA
	qDALBcZInD/79neioqLIopK9wHm8yr3o3OHYB1LjZPU1KiAsbPArNdJgnRGGS6ZkdYwkr2y9NgF
	VppU0jIOWJKEhJvNbkrB4TLWJQNDYVDwZR+e1Tug6+1htQgPvZKhza0K6wSEOBpkL/k5pofdQib
	sUO88U7kcrwmwNmXFiQGMbu6fkjeJ7CFC/4duEiLBO6ffniUr4hN0gcePZ8nGm1mXzLrjRK9qHd
	jhDripr+lJ47CRqZs8eAbHC4oLtStyiI6oGCKQtAeBGCUUo2RMU5bJZuRpFeaSdnSKZpdRPESDx
	g==
X-Received: by 2002:a17:90b:1c01:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-3933b8c67camr27689919a91.14.1787023009535;
        Mon, 17 Aug 2026 20:16:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315e2c9sm11166188c88.9.2026.08.17.20.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:16:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v7.3
Date: Mon, 17 Aug 2026 20:16:46 -0700
Message-ID: <20260818031647.984209-1-linux@roeck-us.net>
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

Please pull hwmon updates for Linux v7.3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3

Thanks,
Guenter
------

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.3

for you to fetch changes up to 75f2c0b3690702c90863c2e138cb5520670845ea:

  hwmon: (emc1403) Drop hysteresis for low limit temperature (2026-08-16 14:40:33 -0700)

----------------------------------------------------------------
hwmon updates for v7.3

* New drivers

  - Driver for Kandou KB9002 retimer

  - Driver for the temp/voltage sensor on PolarFire SoC

  - Driver for Eswin EIC7700 PVT sensor

  - PMBus:

    - Driver for Analog Devices MAX16545/MAX16550 and Volterra VT7505

    - Drivers for Monolithic MPQ82D00 and MPQ8646

    - Driver for Silergy SQ24860

* Added support to existing drivers

  - asus-ec-sensors: Support for ROG STRIX Z390-E GAMING,
    ProArt Z690-CREATOR WIFI, ROG STRIX X870E-E GAMING WIFI7 R2,
    ROG CROSSHAIR X870E HERO, and ROG Maximus Z790 Hero

  - asus_rog_ryujin: Siupport for ROG Ryujin III

  - ina2xx: Support for INA232

  - k10temp: Per-CCD temperature monitoring for Zen5 Turin

  - nct6775: List NCT5585D as supported chip

  - nzxt-kraken3: Support for NZXT Kraken 2024 Elite

  - sht3x: Support for GXCAS GXHT30

  - tmp102: Add device IDs for TMP110 and TMP113

  - yogafan: Support for LOQ 15IAX9, XiaoXin Pro 13ARE 2020,
    IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, Yoga Pro 7 14IAH10,
    Yoga 7 16ARP8, and Lenovo LOQ 15IAX9

  - PMBus:

    - max20830: Support for max20830c and max20840c

    - max34440: Support for MAX34452, and support for newer version
      of max34451

    - adm1275: Support for ROHM BD12780 and BD12790

* Other notable changes

  - Constify various device attributes

  - Remove redundant dev_err() and dev_err_probe() from various drivers

  - applesmc: Convert to hwmon_device_register_with_info

  - adt7470: Add thermal zone sensor support

  - coretemp: Fix core_data leak on CPUs without PTS

  - emc1403: Drop hysteresis for low limit temperature

  - max6621: Fix various over- and underflow problems

  - PMBus:

    - Introduce pmbus_read_smbus_i2c_block_data() and use it in
      various drivers

    - Export and use pmbus_check_and_notify_faults()

    - Let PMBus drivers report the supported PMBus revision

* Various other minor fixes and improvements

----------------------------------------------------------------
Abdurrahman Hussain (1):
      hwmon: (pmbus/xdpe1a2g7b) Add regulator support

Alexis Czezar Torreno (5):
      hwmon: (pmbus/max34440): add support for newer version of max34451
      dt-bindings: hwmon: (pmbus/max20830): add VOUT feedback resistor properties and complete examples
      hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
      dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support
      hwmon: (pmbus/max20830): add support for max20830c and max20840c

Andy Chung (4):
      dt-bindings: Add vendor prefix for Kandou
      dt-bindings: trivial-devices: Add Kandou KB9002
      hwmon: (kb9002) Add driver for Kandou KB9002 retimer
      hwmon: (kb9002) Add documentation

Arie Miller (2):
      hwmon: (asus_rog_ryujin) Add per-device configuration
      hwmon: (asus_rog_ryujin) Add ROG Ryujin III support

Babanpreet Singh (1):
      hwmon: (peci) Fix kernel-doc parameter names in common.h

Carlos Jones Jr (1):
      hwmon: (pmbus/max34440): Add support for MAX34452

Cong Nguyen (2):
      hwmon: (max6621) fix temperature clamp range
      hwmon: (max6621) fix negative temperature offset and crit readings

Eugene Shalygin (1):
      hwmon: (asus-ec-sensors) detect unconnected physical sensors

Flaviu Nistor (3):
      dt-bindings: hwmon: chipcap2: Add label property
      hwmon: (chipcap2) Add support for label
      hwmon: (lm90) Switch channel parsing to fwnode APIs

Florian Schut (1):
      hwmon: (asus-ec-sensors) add ROG Maximus Z790 Hero

Gabriel Ford (1):
      hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin

Georgi Vlaev (1):
      hwmon: (pmbus/vt7505) Add driver for Analog Devices MAX16545/MAX16550 and Volterra VT7505

Guenter Roeck (7):
      hwmon: (pmbus/mp2975) Eliminate dead code
      hwmon: (pmbus) Let PMBus drivers report the supported PMBus revision
      hwmon: (pmbus/core) Introduce pmbus_read_smbus_i2c_block_data()
      hwmon: (pmbus/adm1275) Use pmbus_read_smbus_i2c_block_data for block commands
      hwmon: (pmbus/ltc2978) Use pmbus_read_smbus_i2c_block_data for block commands
      hwmon: (pmbus/max20830) Use pmbus_read_smbus_i2c_block_data for block commands
      hwmon: (pmbus/ir36021) Use pmbus_read_smbus_i2c_block_data for block commands

Huan He (2):
      dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
      hwmon: Add Eswin EIC7700 PVT sensor driver

Jiazhi Huang (2):
      Documentation: hwmon: (nct6775) Add missing NCT6797D and NCT6798D
      hwmon: (nct6775) Add NCT5585D to list of supported chips

Jonas Schwöbel (1):
      hwmon: (emc1403) Convert to use OF bindings

Lars Randers (1):
      hwmon: Driver for the temp/voltage sensor on PolarFire SoC

Laszlo Ersek (1):
      hwmon: remove tautological dependency expressions from Kconfig

Luiz Angelo Daros de Luca (4):
      dt-bindings: hwmon: add adi,adt7470
      hwmon: (adt7470) Add ADT7470_PWM_MAX macro
      hwmon: (adt7470) Expose fan control via PWM framework
      hwmon: (adt7470) Add thermal zone sensor support

Marek Vasut (2):
      hwmon: (tmp102) Add TMP110 device ID
      hwmon: (tmp102) Add TMP113 device ID

Marius Cristea (1):
      hwmon: (emc1403) Drop hysteresis for low limit temperature

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: (ina2xx) Add support for INA232

Matti Vaittinen (7):
      dt-bindings: adm1275: ROHM BD12780 hot-swap controller
      hwmon: (pmbus/adm1275) Support module auto-loading
      doc: hwmon: Add ROHM BD12780 and BD12780A
      hwmon: (pmbus/adm1275) Support ROHM BD12780
      doc: adm1275: Add ROHM BD12790
      dt-bindings: adm1275: ROHM BD12790 hot-swap controller
      hwmon: (pmbus/adm1275) Support ROHM BD12790

Maurice Mehlhaff (1):
      hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI

Miska Hämäläinen (1):
      hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO

Nick Hawkins (2):
      dt-bindings: hwmon: hpe,gxp-fan-ctrl: remove fn2 and pl registers
      hwmon: (gxp_fan_ctrl) Provide fan info via gpio

Pan Chuang (7):
      hwmon: (axi-fan-control) Remove redundant dev_err_probe()
      hwmon: (da9055) Remove redundant dev_err()
      hwmon: (lm90) Remove redundant dev_err()
      hwmon: (npcm750-pwm-fan) Remove redundant dev_err()
      hwmon: (pwm-fan) Remove redundant dev_err()
      hwmon: (sht15) Remove redundant dev_err()
      hwmon: (pmbus) Remove redundant dev_err()

Pengpeng Hou (1):
      hwmon: (acbel-fsg032) Add missing MODULE_DEVICE_TABLE()

Potin Lai (2):
      dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
      hwmon: (pmbus/lm25066) add current limit configuration support

Rafael J. Wysocki (1):
      hwmon: (acpi_power_meter) Stop setting acpi_device_name/class()

Rodrigo Araujo (1):
      hwmon: (asus-ec-sensors) add ROG STRIX Z390-E GAMING

Sanman Pradhan (1):
      dt-bindings: hwmon: pmbus: Add Analog Devices MAX16545/MAX16550 and Volterra VT7505

Sarbajit Sarkar (1):
      hwmon: (yogafan) Add support for Lenovo LOQ 15IAX9

Sean Lyon (1):
      hwmon: (nzxt-kraken3) Add support for NZXT Kraken 2024 Elite

Sergio Melas (1):
      hwmon: (yogafan) Add support for new Lenovo models

Shih-Yuan Lee (3):
      hwmon: (applesmc) Cache fan positions during register initialization
      hwmon: (applesmc) Fix lockless cache validation data race
      hwmon: (applesmc) Convert to hwmon_device_register_with_info

Sudeep Holla (1):
      hwmon: (xgene) Stop writing PCC shared memory signature

Svyatoslav Ryhel (2):
      dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
      hwmon: (emc1403) Add regulator support

Szymon Wilczek (1):
      hwmon: (coretemp) Fix core_data leak on CPUs without PTS

Thomas Weißschuh (8):
      hwmon: (cros_ec) Implement custom kelvin to celsius conversions
      hwmon: (cros_ec) Register the thermal devices after the hwmon ones
      hwmon: (cros_ec) Store the hwmon device in cros_ec_hwmon_priv
      hwmon: (cros_ec) Synchronize EC access from the thermal device callbacks
      hwmon: (cros_ec) Avoid threshold temperature conversion overflows
      hwmon: (core) Constify device attributes
      hwmon: (core) Use const APIs for the dynamically allocated sysfs attributes
      hwmon: (sysfs) Allow drivers to register const attributes

Vincent Jardin (5):
      hwmon: (tmp401) register with thermal subsystem
      hwmon: (pmbus/core) export pmbus_check_and_notify_faults()
      dt-bindings: hwmon: pmbus: add MPS MPQ8646
      hwmon: (pmbus) Add MPQ8646 driver
      hwmon: (pmbus/mpq8646) Gate the writes

Vishaal Saraiya (2):
      hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI7 R2
      hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX X870E-E GAMING WIFI

Wensheng Wang (2):
      dt-bindings: hwmon: Add MPS mpq82d00
      hwmon: (pmbus) Add MPQ82D00 driver

Wilken Gottwalt (1):
      hwmon: (corsair-psu) Update documentation

Will Smith (1):
      hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

Ximing Zhang (2):
      hwmon: coretemp: Fix documentation wording
      hwmon: (coretemp) Clarify attr_size comment

Zaixiang Xu (4):
      dt-bindings: vendor-prefixes: Add GXCAS Technology
      dt-bindings: hwmon: Add Sensirion SHT30 series
      hwmon: (sht3x) Add devicetree support
      hwmon: (sht3x) Document support for GXCAS GXHT30

Ziming Zhu (3):
      dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
      hwmon: (pmbus) Add support for Silergy SQ24860
      hwmon: Add documentation for SQ24860

shaikh.kamal (1):
      docs: hwmon: sg2042-mcu: fix spelling error

surendra (1):
      hwmon: (pmbus/ltc4283) Add missing MODULE_DEVICE_TABLE for OF match table

 .../devicetree/bindings/hwmon/adi,adm1275.yaml     |  43 +-
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  58 ++
 .../bindings/hwmon/amphenol,chipcap2.yaml          |   6 +
 .../bindings/hwmon/eswin,eic7700-pvt.yaml          |  72 ++
 .../bindings/hwmon/hpe,gxp-fan-ctrl.yaml           |  16 +-
 .../bindings/hwmon/pmbus/adi,max20830.yaml         |  30 +-
 .../bindings/hwmon/pmbus/adi,vt7505.yaml           |  85 ++
 .../bindings/hwmon/pmbus/mps,mpq8785.yaml          |   5 +-
 .../bindings/hwmon/pmbus/silergy,sq24860.yaml      |  74 ++
 .../bindings/hwmon/pmbus/ti,lm25066.yaml           |  20 +
 .../devicetree/bindings/hwmon/sensirion,sht30.yaml |  71 ++
 .../devicetree/bindings/hwmon/smsc,emc1403.yaml    | 203 +++++
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml       |   3 +
 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 Documentation/hwmon/adm1275.rst                    |  24 +
 Documentation/hwmon/asus_ec_sensors.rst            |   5 +
 Documentation/hwmon/asus_rog_ryujin.rst            |  25 +-
 Documentation/hwmon/chipcap2.rst                   |   2 +
 Documentation/hwmon/coretemp.rst                   |   4 +-
 Documentation/hwmon/corsair-psu.rst                |   6 +-
 Documentation/hwmon/emc1403.rst                    |   8 +-
 Documentation/hwmon/index.rst                      |   6 +
 Documentation/hwmon/kb9002.rst                     |  64 ++
 Documentation/hwmon/max20830.rst                   |  27 +-
 Documentation/hwmon/max34440.rst                   |  26 +-
 Documentation/hwmon/mpq82d00.rst                   |  73 ++
 Documentation/hwmon/mpq8646.rst                    | 300 +++++++
 Documentation/hwmon/nct6775.rst                    |  24 +
 Documentation/hwmon/nzxt-kraken3.rst               |   1 +
 Documentation/hwmon/sg2042-mcu.rst                 |   2 +-
 Documentation/hwmon/sht3x.rst                      |  17 +-
 Documentation/hwmon/sq24860.rst                    |  96 ++
 Documentation/hwmon/tvs-mpfs.rst                   |  53 ++
 Documentation/hwmon/vt7505.rst                     |  89 ++
 Documentation/hwmon/yogafan.rst                    |  27 +-
 MAINTAINERS                                        |  30 +
 drivers/hwmon/Kconfig                              |  59 +-
 drivers/hwmon/Makefile                             |   3 +
 drivers/hwmon/acpi_power_meter.c                   |   6 +-
 drivers/hwmon/adt7470.c                            | 203 ++++-
 drivers/hwmon/applesmc.c                           | 490 +++++++----
 drivers/hwmon/asus-ec-sensors.c                    |  88 +-
 drivers/hwmon/asus_rog_ryujin.c                    |  96 +-
 drivers/hwmon/axi-fan-control.c                    |   3 +-
 drivers/hwmon/chipcap2.c                           |  25 +-
 drivers/hwmon/coretemp.c                           |   3 +-
 drivers/hwmon/corsair-psu.c                        |   2 +-
 drivers/hwmon/cros_ec_hwmon.c                      |  36 +-
 drivers/hwmon/da9055-hwmon.c                       |   5 +-
 drivers/hwmon/eic7700-pvt.c                        | 509 +++++++++++
 drivers/hwmon/eic7700-pvt.h                        |  99 +++
 drivers/hwmon/emc1403.c                            |  48 +-
 drivers/hwmon/gxp-fan-ctrl.c                       | 106 +--
 drivers/hwmon/hwmon.c                              |  76 +-
 drivers/hwmon/ina2xx.c                             |  20 +
 drivers/hwmon/k10temp.c                            |  14 +-
 drivers/hwmon/kb9002.c                             | 460 ++++++++++
 drivers/hwmon/lm90.c                               |  58 +-
 drivers/hwmon/ltc4283.c                            |   1 +
 drivers/hwmon/max6621.c                            |   8 +-
 drivers/hwmon/nct6775-core.c                       |   1 +
 drivers/hwmon/nct6775-platform.c                   |   2 +-
 drivers/hwmon/npcm750-pwm-fan.c                    |   4 +-
 drivers/hwmon/nzxt-kraken3.c                       |   9 +-
 drivers/hwmon/peci/common.h                        |   4 +-
 drivers/hwmon/pmbus/Kconfig                        |  91 +-
 drivers/hwmon/pmbus/Makefile                       |   4 +
 drivers/hwmon/pmbus/acbel-fsg032.c                 |   1 +
 drivers/hwmon/pmbus/adm1275.c                      | 151 +++-
 drivers/hwmon/pmbus/ir36021.c                      |  22 +-
 drivers/hwmon/pmbus/lm25066.c                      |  37 +
 drivers/hwmon/pmbus/ltc2978.c                      |  21 +-
 drivers/hwmon/pmbus/max20830.c                     | 133 ++-
 drivers/hwmon/pmbus/max34440.c                     |  96 +-
 drivers/hwmon/pmbus/mp2975.c                       |   5 -
 drivers/hwmon/pmbus/mpq82d00.c                     | 249 ++++++
 drivers/hwmon/pmbus/mpq8646.c                      | 976 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  22 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 154 +++-
 drivers/hwmon/pmbus/sq24860.c                      | 430 +++++++++
 drivers/hwmon/pmbus/vt7505.c                       | 287 ++++++
 drivers/hwmon/pmbus/xdpe1a2g7b.c                   |  11 +
 drivers/hwmon/pwm-fan.c                            |   6 +-
 drivers/hwmon/sht15.c                              |   4 +-
 drivers/hwmon/sht3x.c                              |  15 +-
 drivers/hwmon/tmp102.c                             |   2 +
 drivers/hwmon/tmp401.c                             |   2 +-
 drivers/hwmon/tvs-mpfs.c                           | 390 ++++++++
 drivers/hwmon/xgene-hwmon.c                        |   4 -
 drivers/hwmon/yogafan.c                            |  67 ++
 include/linux/hwmon-sysfs.h                        |  14 +-
 92 files changed, 6578 insertions(+), 657 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
 create mode 100644 Documentation/hwmon/kb9002.rst
 create mode 100644 Documentation/hwmon/mpq82d00.rst
 create mode 100644 Documentation/hwmon/mpq8646.rst
 create mode 100644 Documentation/hwmon/sq24860.rst
 create mode 100644 Documentation/hwmon/tvs-mpfs.rst
 create mode 100644 Documentation/hwmon/vt7505.rst
 create mode 100644 drivers/hwmon/eic7700-pvt.c
 create mode 100644 drivers/hwmon/eic7700-pvt.h
 create mode 100644 drivers/hwmon/kb9002.c
 create mode 100644 drivers/hwmon/pmbus/mpq82d00.c
 create mode 100644 drivers/hwmon/pmbus/mpq8646.c
 create mode 100644 drivers/hwmon/pmbus/sq24860.c
 create mode 100644 drivers/hwmon/pmbus/vt7505.c
 create mode 100644 drivers/hwmon/tvs-mpfs.c
