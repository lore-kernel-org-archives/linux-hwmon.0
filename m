Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D546233722
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776030323; cv=none; b=QyQDl9V/Qo35lX3c7T3soHlpFXgdPDl9dQ7hvNVp3wUdhXPTEo9sdpUwHcXfIIzMJ8o6IEWc1ifoa1s59KiKQwhiq5dRFO3mbj8gxO17uBatBarFvTZKcqZGPhrJM8yKyGnVJqJNKqs1kUsfiCb3uXuwBSsDuoGeKZFBoFRcuxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776030323; c=relaxed/simple;
	bh=cea4DYu/G0Dp7q8HONrPy6MLFeTzj7K2QW6sjh3gZiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IM+jog/QmgMSdV/9dHJ/Zo7N0LMHh/LQg4gZ9ve73GIhqxiJFty5M/wsWeScSEYZW88Acm5nv/5ppYddr0682OhKBXQWFwJqfYlnPVJ/8nSpNMQVQfc7ZTpe1a8F4pd/R9tsm1gY/FA/OQREeUh5qnYfDgSNZNnwS7rnXXbGFi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8MDtdU2; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8MDtdU2"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so3121588eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 14:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776030320; x=1776635120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JPV4uBRj3iW56lgB2aH02ciVtcfCUdv8Gfzr8q4Us5A=;
        b=B8MDtdU2vQ18KP66G9j9+8ZTpdNoR6DhMnOJZhJWusBgb6CZI5i+6g06RbyVaEsH3A
         gwseey+LebAL3afRWfabopn28xQ8NXABhYt6hIFleBvgxdn2lU4/rgZJYnB1WKAmuNBR
         kilX60ujsp6Fzxj6YXglEpfWphKzQv0GjxPJAynhiAjJMbZFchQuO5fSocbEfAPEASgx
         Amsq/Q+Qi2XrEWUIhlhyQI23Svjd1HmSsdF/8ynwJjh40ze50Z41x5niJj7hmacbmsIa
         6T/0xfFHoY6rxzi9aA4yTI3z2jwPVUKNAY+O19qrcR6zg+ONPPES91KJ/QCufd0J+YVp
         3sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776030320; x=1776635120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPV4uBRj3iW56lgB2aH02ciVtcfCUdv8Gfzr8q4Us5A=;
        b=tCu/OBHQnWe8fA/GCsE8pf+rXwCn6CMaIl18F+UauQAtBheWatpRGr7OLWZVY8dj3Y
         334YLXzCBqubdDfugEZoUdGxiJ6zHSBx7CItR0a0p0QJtX9CZLB4BKM2NWlXx+yofvj5
         d5WyaoHTWb5VQtd5ERxQK/SaHyVFEkjsXWY6KvwH7Lsshrim0dqeFahq9GG/V4QV6Jge
         kHI43Bm13olkA6VAV6542ZEHRlciIAbVJ83ENRU0lVm/wOZo+B+ex8u9LJ2Ex6J47EWy
         ysDcZyhs8oSWoiThpRu4j75iyL4+ta5xHgDbt3f6WLJs9fqUW9eIwbWYVi9yoQTX902U
         GE0w==
X-Gm-Message-State: AOJu0YwVmn1muZOgoY0wZYEKyyqroYjumyerm0H7NdV3AIITodPKM9B5
	cWokDxY/pHdTIwdhVXKPhG5/3/BNFq51j4YKcwCUoCXKxA/15D93OVjW
X-Gm-Gg: AeBDieuCzySLN96VsE2hse/BY1n0J20vqs31QHSqGLUn/FSGmzu1GvJ9YiTHAhaUxO8
	PYAUBkSof2QbH9rHaT7pXTZr6TjDM4gS+bbKm7F20GRnxHBUompXHK6AONCdgb7Z/uopbMi1FLX
	/hQO9eT8c4++obL2R0oeXbl6F2ocIOpZnuiiYMdHxovcnSqZMGqg0/Fytjf7lfG+uWsUfdz98vq
	+3R17cPt47awkP1BhAjtT9nJ8l8OSv0TmL6XkiaUdfkz4ss9Zz8xtyvRSf5A/Otpiv3gszz6qET
	Ae+SMQmcR5qgxN33A0fXGT+oHVQ5GkNN738a79Fax/L3M8G0CqMKoADW9h+tBc3b+AeTcW1KKMz
	JdmNiflwIS9zhbzbmSLO4pkHFOGOko5mb3x0YZvXn9LD5I2/B1a4xS7Twn4bUR49jtuZuFqNMCW
	r9OJYnp2QbsQoZLGaRS0aUuweivikN4jzlo4cw
X-Received: by 2002:a05:7300:220d:b0:2be:1f56:ed21 with SMTP id 5a478bee46e88-2d5876a0820mr5821162eec.7.1776030319905;
        Sun, 12 Apr 2026 14:45:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69d5sm16259853eec.3.2026.04.12.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:45:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v7.1-rc1
Date: Sun, 12 Apr 2026 14:45:16 -0700
Message-ID: <20260412214518.254887-1-linux@roeck-us.net>
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

Please pull hwmon updates for v7.1-rc1 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1

Thanks,
Guenter
------

The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:

  Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.1

for you to fetch changes up to fb447217c59a13b2fff22d94de2498c185cd9032:

  hwmon: (ina233) Don't check for specific errors when parsing properties (2026-04-12 07:25:56 -0700)

----------------------------------------------------------------
hwmon updates for 7.1

* New drivers:

  - Add support for Lenovo Yoga/Legion fan monitoring (yogafan)

  - Add support for LattePanda Sigma EC

  - Add support for Infineon XDP720 eFuse

  - Add support for Microchip MCP998X

* New device support:

  - Add support for TI INA234

  - Add support for Infineon XDPE1A2G5B/7B

  - Add support for Renesas RAA228942 and RAA228943 (isl68137)

  - Add support for Delta Q54SN120A1 and Q54SW120A7 (pmbus)

  - Add support for TI TMP110 and TMP113 (tmp102)

  - Add support for Sony APS-379 (pmbus)

  - Add support for ITE IT8689E (it87)

  - Add support for ASUS ROG STRIX Z790-H, X470-F, and CROSSHAIR X670E (asus-ec-sensors)

  - Add support for GPD Win 5 (gpd-fan)

* Modernization and Cleanups:

  - Convert asus_atk0110 and acpi_power_meter ACPI drivers to platform drivers

  - Remove i2c_match_id() usage in many PMBus drivers

  - Use guard() for mutex protection in pmbus_core

  - Replace sprintf() with sysfs_emit() in ads7871, emc1403, max6650,
    ads7828, max31722, and tc74

  - Various markup and documentation improvements for yogafan and ltc4282

* Bug fixes:

  - Fix use-after-free and missing usb_kill_urb on disconnect in powerz driver

  - Avoid cacheline sharing for DMA buffer in powerz driver

  - Fix integer overflow in power calculation on 32-bit in isl28022 driver

  - Fix bugs in pt5161l_read_block_data()

  - Propagate SPI errors and fix incorrect error codes in ads7871 driver

  - Fix i2c_smbus_write_byte_data wrapper argument type in max31785 driver

* Device tree bindings:

  - Convert npcm750-pwm-fan to DT schema

  - Add bindings for Infineon XDP720, Microchip MCP998X, Sony APS-379,
    Renesas RAA228942/3, Delta Q54SN120A1/7, XDPE1A2G5B/7B,
    Aosong AHT10/20, DHT20, and TI INA234

  - Adapt moortec,mr75203 bindings for T-Head TH1520

----------------------------------------------------------------
(Commits list will be generated by git request-pull or similar tool)

----------------------------------------------------------------
Amay Agarwal (5):
      hwmon: (tc74) Replace sprintf() with sysfs_emit()
      hwmon: (max31722) Replace sprintf() with sysfs_emit()
      hwmon: (ads7828) Replace sprintf() with sysfs_emit()
      hwmon: (max6650) Replace sprintf() with sysfs_emit()
      hwmon: (emc1403) Replace sprintf() with sysfs_emit()

Andrew Davis (11):
      hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
      hwmon: (pmbus/ibm-cffps) Remove use of i2c_match_id()
      hwmon: (pmbus/isl68137) Remove use of i2c_match_id()
      hwmon: (pmbus/max20730) Remove use of i2c_match_id()
      hwmon: (pmbus/max34440) Remove use of i2c_match_id()
      hwmon: (pmbus) Remove use of i2c_match_id()
      hwmon: (pmbus/q54sj108a2) Remove use of i2c_match_id()
      hwmon: (pmbus/tps53679) Remove use of i2c_match_id()
      hwmon: (pmbus/fsp-3y) Remove use of i2c_match_id()
      hwmon: (pmbus/ltc2978) Remove use of i2c_match_id()
      hwmon: (pmbus/max16601) Remove use of i2c_match_id()

Andy Shevchenko (4):
      hwmon: (bt1-pvt) Remove not-going-to-be-supported code for Baikal SoC
      hwmon: (pmbus/tps25990) Don't check for specific errors when parsing properties
      hwmon: (isl28022) Don't check for specific errors when parsing properties
      hwmon: (ina233) Don't check for specific errors when parsing properties

Antheas Kapenekakis (1):
      hwmon: (gpd-fan) Add GPD Win 5

Ashish Yadav (5):
      dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
      hwmon: (pmbus/core) Add support for NVIDIA nvidia195mv mode
      hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers
      dt-bindings: hwmon/pmbus: Add Infineon XDP720
      hwmon:(pmbus/xdp720) Add support for efuse xdp720

Bartosz Golaszewski (2):
      hwmon: (gpio-fan) Drop unneeded dependency on OF_GPIO
      hwmon: (ina2xx) drop unused platform data

Billy Tsai (1):
      hwmon: (aspeed-g6-pwm-tach): remove redundant driver remove callback

Chris Packham (2):
      dt-bindings: trivial-devices: Add sony,aps-379
      hwmon: pmbus: Add support for Sony APS-379

Colin Huang (2):
      dt-bindings: trivial-devices: Add Delta Q54SN120A1 and Q54SW120A7
      hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 chip

Dawei Liu (3):
      hwmon: (pmbus/isl68137) Remove unused enum chips
      dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
      hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943

Denis Pauk (1):
      hwmon: (nct6775) Add ASUS X870/W480 to WMI monitoring list

Flaviu Nistor (3):
      hwmon: tmp102: Add support for TMP110 and TMP113 devices
      hwmon: lm75: Add support for label
      hwmon: (tmp102) add support for update interval

Guenter Roeck (2):
      hwmon: (pmbus) Add support for guarded PMBus lock
      hwmon: (pmbus_core) Use guard() for mutex protection

Hao Yu (2):
      dt-bindings: hwmon: add Aosong AHT10/AHT20/DHT20 to trivial devices
      hwmon: (aht10) add device tree ID matching

Ian Ray (3):
      dt-bindings: hwmon: ti,ina2xx: Add INA234 device
      hwmon: (ina2xx) Make it easier to add more devices
      hwmon: (ina2xx) Add support for INA234

Icenowy Zheng (1):
      dt-bindings: hwmon: moortec,mr75203: adapt multipleOf for T-Head TH1520

Jonas Rebmann (2):
      hwmon: (ina2xx) clean up unused define and outdated comment
      hwmon: (ina2xx) Shift INA234 shunt and current registers

Mariano Abad (1):
      hwmon: Add LattePanda Sigma EC driver

Markus Hoffmann (1):
      hwmon: (it87) Add support for IT8689E

Nuno Sá (2):
      docs: hwmon: ltc4282: Fix scanned addresses
      hwmon: (ltc4282) Add default rsense value

Petr Klotz (1):
      hwmon: (nct6683) Add customer ID for ASRock B650I Lightning WiFi

Rafael J. Wysocki (4):
      hwmon: (acpi_power_meter) Drop redundant checks from three functions
      hwmon: (acpi_power_meter) Register ACPI notify handler directly
      hwmon: (acpi_power_meter) Convert ACPI driver to a platform one
      hwmon: (asus_atk0110) Convert ACPI driver to a platform one

Randy Dunlap (2):
      hwmon: (yogafan) fix markup warning
      hwmon: (yogafan) various markup improvements

Robert Marko (1):
      hwmon: (sparx5) Make it selectable for ARCH_LAN969X

Rong Zhang (1):
      hwmon: Add label support for 64-bit energy attributes

Sanman Pradhan (8):
      hwmon: (pmbus/max31785) fix argument type for i2c_smbus_write_byte_data wrapper
      hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
      hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses
      hwmon: (pmbus/max31785) check for partial i2c_transfer in read_long_data
      hwmon: (powerz) Fix use-after-free on USB disconnect
      hwmon: (powerz) Fix missing usb_kill_urb() on signal interrupt
      hwmon: (pt5161l) Fix bugs in pt5161l_read_block_data()
      hwmon: (isl28022) Fix integer overflow in power calculation on 32-bit

Sergio Melas (1):
      hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring

Tabrez Ahmed (3):
      hwmon: (ads7871) Replace sprintf() with sysfs_emit()
      hwmon: (ads7871) Fix incorrect error code in voltage_show
      hwmon: (ads7871) Propagate SPI errors in voltage_show

Thomas Weißschuh (1):
      hwmon: (powerz) Avoid cacheline sharing for DMA buffer

Timothy C. Sweeney-Fanelli (1):
      hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E EXTREME

Tomer Maimon (1):
      dt-bindings: hwmon: convert npcm750-pwm-fan to DT schema

Varasina Farmadani (1):
      hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING

Victor Duicu (2):
      dt-bindings: hwmon: add support for MCP998X
      hwmon: add support for MCP998X

Volodimir Buchakchiyskiy (1):
      hwmon: (asus-ec-sensors) add ROG STRIX Z790-H GAMING WIFI

 .../devicetree/bindings/hwmon/baikal,bt1-pvt.yaml  |  105 --
 .../bindings/hwmon/microchip,mcp9982.yaml          |  237 ++++
 .../devicetree/bindings/hwmon/moortec,mr75203.yaml |    4 +-
 .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  |   88 --
 .../bindings/hwmon/nuvoton,npcm750-pwm-fan.yaml    |  139 +++
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml      |   59 +
 .../bindings/hwmon/pmbus/isil,isl68137.yaml        |   93 +-
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml       |    3 +
 .../devicetree/bindings/trivial-devices.yaml       |   13 +
 Documentation/hwmon/aps-379.rst                    |   57 +
 Documentation/hwmon/asus_ec_sensors.rst            |    3 +
 Documentation/hwmon/bt1-pvt.rst                    |  117 --
 Documentation/hwmon/ina2xx.rst                     |   25 +-
 Documentation/hwmon/index.rst                      |    5 +-
 Documentation/hwmon/isl68137.rst                   |   20 +
 Documentation/hwmon/it87.rst                       |   26 +-
 Documentation/hwmon/lattepanda-sigma-ec.rst        |   61 +
 Documentation/hwmon/ltc4282.rst                    |    3 +-
 Documentation/hwmon/mcp9982.rst                    |  111 ++
 Documentation/hwmon/tmp102.rst                     |   40 +-
 Documentation/hwmon/yogafan.rst                    |  138 +++
 MAINTAINERS                                        |   23 +
 drivers/hwmon/Kconfig                              |   79 +-
 drivers/hwmon/Makefile                             |    4 +-
 drivers/hwmon/acpi_power_meter.c                   |   96 +-
 drivers/hwmon/ads7828.c                            |    4 +-
 drivers/hwmon/ads7871.c                            |   18 +-
 drivers/hwmon/aht10.c                              |   10 +
 drivers/hwmon/aspeed-g6-pwm-tach.c                 |    8 -
 drivers/hwmon/asus-ec-sensors.c                    |   29 +
 drivers/hwmon/asus_atk0110.c                       |   92 +-
 drivers/hwmon/bt1-pvt.c                            | 1171 --------------------
 drivers/hwmon/bt1-pvt.h                            |  247 -----
 drivers/hwmon/emc1403.c                            |    2 +-
 drivers/hwmon/gpd-fan.c                            |    8 +
 drivers/hwmon/hwmon.c                              |    1 +
 drivers/hwmon/ina209.c                             |   11 +-
 drivers/hwmon/ina2xx.c                             |   76 +-
 drivers/hwmon/isl28022.c                           |   47 +-
 drivers/hwmon/it87.c                               |   61 +-
 drivers/hwmon/lattepanda-sigma-ec.c                |  359 ++++++
 drivers/hwmon/lm75.c                               |   20 +-
 drivers/hwmon/ltc4282.c                            |   15 +-
 drivers/hwmon/max31722.c                           |    3 +-
 drivers/hwmon/max6650.c                            |    3 +-
 drivers/hwmon/mcp9982.c                            |  998 +++++++++++++++++
 drivers/hwmon/nct6683.c                            |    3 +
 drivers/hwmon/nct6775-platform.c                   |   23 +
 drivers/hwmon/pmbus/Kconfig                        |   27 +
 drivers/hwmon/pmbus/Makefile                       |    3 +
 drivers/hwmon/pmbus/aps-379.c                      |  155 +++
 drivers/hwmon/pmbus/bel-pfe.c                      |    5 +-
 drivers/hwmon/pmbus/fsp-3y.c                       |   13 +-
 drivers/hwmon/pmbus/ibm-cffps.c                    |   16 +-
 drivers/hwmon/pmbus/ina233.c                       |   28 +-
 drivers/hwmon/pmbus/isl68137.c                     |   52 +-
 drivers/hwmon/pmbus/ltc2978.c                      |    2 +-
 drivers/hwmon/pmbus/max16601.c                     |    2 +-
 drivers/hwmon/pmbus/max20730.c                     |    5 +-
 drivers/hwmon/pmbus/max31785.c                     |  197 ++--
 drivers/hwmon/pmbus/max34440.c                     |    4 +-
 drivers/hwmon/pmbus/pmbus.c                        |    4 +-
 drivers/hwmon/pmbus/pmbus.h                        |   13 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |  300 +++--
 drivers/hwmon/pmbus/q54sj108a2.c                   |   23 +-
 drivers/hwmon/pmbus/tps25990.c                     |   14 +-
 drivers/hwmon/pmbus/tps53679.c                     |    5 +-
 drivers/hwmon/pmbus/xdp720.c                       |  128 +++
 drivers/hwmon/pmbus/xdpe1a2g7b.c                   |  119 ++
 drivers/hwmon/powerz.c                             |   24 +-
 drivers/hwmon/pt5161l.c                            |    4 +-
 drivers/hwmon/tc74.c                               |    2 +-
 drivers/hwmon/tmp102.c                             |  128 ++-
 drivers/hwmon/yogafan.c                            |  275 +++++
 drivers/iio/adc/ina2xx-adc.c                       |   14 +-
 include/linux/platform_data/ina2xx.h               |   16 -
 76 files changed, 3857 insertions(+), 2479 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 Documentation/hwmon/aps-379.rst
 delete mode 100644 Documentation/hwmon/bt1-pvt.rst
 create mode 100644 Documentation/hwmon/lattepanda-sigma-ec.rst
 create mode 100644 Documentation/hwmon/mcp9982.rst
 create mode 100644 Documentation/hwmon/yogafan.rst
 delete mode 100644 drivers/hwmon/bt1-pvt.c
 delete mode 100644 drivers/hwmon/bt1-pvt.h
 create mode 100644 drivers/hwmon/lattepanda-sigma-ec.c
 create mode 100644 drivers/hwmon/mcp9982.c
 create mode 100644 drivers/hwmon/pmbus/aps-379.c
 create mode 100644 drivers/hwmon/pmbus/xdp720.c
 create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
 create mode 100644 drivers/hwmon/yogafan.c
 delete mode 100644 include/linux/platform_data/ina2xx.h
