Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:43622 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752993AbeA1WCF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Jan 2018 17:02:05 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.16
Date: Sun, 28 Jan 2018 14:02:03 -0800
Message-Id: <1517176923-30613-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.16 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.16

Thanks,
Guenter
------

The following changes since commit 30a7acd573899fd8b8ac39236eff6468b195ac7d:

  Linux 4.15-rc6 (2017-12-31 14:47:43 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.16

for you to fetch changes up to 6fbc4232a5ac944531bda397f3644d1cf66bdd13:

  hwmon: (dell-smm) Disable fan support for Dell Vostro 3360 (2018-01-27 09:34:22 -0800)

----------------------------------------------------------------
hwmon updates for v4.16

New driver for W83773G
Fan control support for PMBus drivers
Improvements and minor fixes in several drivers

----------------------------------------------------------------
Andrew Jeffery (4):
      hwmon: (pmbus) Add fan control support
      hwmon: (pmbus/max31785) Add fan control
      hwmon: (pmbus) Add virtual page config bit
      hwmon: (pmbus/max31785) Add dual tachometer support

Arnd Bergmann (1):
      hwmon: (pmbus/ibm-cffps) Add dependency on LEDS_CLASS

Eddie James (1):
      hwmon: (pmbus) cffps: Add PMBUS_SKIP_STATUS_CHECK

Edward A. James (2):
      hwmon: (pmbus) Export pmbus device debugfs directory entry
      hwmon: (pmbus) cffps: Add debugfs entries

Emiliano Ingrassia (1):
      hwmon: (sht3x) wait predefined limits loading complete before access

Guenter Roeck (9):
      hwmon: Drop unnecessary 'default n' from Kconfig
      hwmon: (pmbus/lm25066) Drop support for LM25063
      hwmon: Fix parameter documentation
      hwmon: (sht21) Fix documentation of struct sht21
      hwmon: (sht15) Fix parameter documentation of sht15_crc8()
      hwmon: (iio_hwmon) Fix documentation of struct iio_hwmon_state
      hwmon: (hih6130) Fix documentation of struct hih6130
      hwmon: (w83773g) Fix fault detection and reporting
      hwmon: (k10temp) Add temperature offset for Ryzen 1900X

Javier Martinez Canillas (1):
      hwmon: (max31785) Add OF device ID table

Joel (2):
      dt-bindings: hwmon: aspeed-pwm-tacho: Add reset node
      hwmon: (aspeed-pwm-tacho) Deassert reset in probe

Lei YU (2):
      hwmon: Add W83773G driver
      hwmon: (w83773g) Add documentation

Luis de Bethencourt (1):
      hwmon: (lm75) Fix trailing semicolon

Maciej Purski (1):
      hwmon: (ina2xx) Make calibration register value fixed

Marek Szyprowski (1):
      hwmon: (ina2xx) Fix access to uninitialized mutex

Oleksandr Natalenko (1):
      hwmon: (dell-smm) Disable fan support for Dell Vostro 3360

Pali Rohár (2):
      hwmon: (dell-smm) Enable broken functionality via "force" module param
      hwmon: (dell-smm) Disable fan support for Dell Inspiron 7720

Samuel Mendoza-Jonas (1):
      hwmon: (pmbus/ir35221) Remove unnecessary scaling

Sinan Kaya (1):
      hwmon: (coretemp) deprecate pci_get_bus_and_slot()

eajames@linux.vnet.ibm.com (1):
      hwmon: (pmbus/cffps) Add led class device for power supply fault led

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  14 +-
 Documentation/hwmon/lm25066                        |  20 +-
 Documentation/hwmon/max31785                       |  15 +-
 Documentation/hwmon/w83773g                        |  33 +++
 drivers/hwmon/Kconfig                              |  26 +-
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   |  22 ++
 drivers/hwmon/coretemp.c                           |   3 +-
 drivers/hwmon/dell-smm-hwmon.c                     |  54 +++-
 drivers/hwmon/hih6130.c                            |   2 +-
 drivers/hwmon/hwmon.c                              |  12 +-
 drivers/hwmon/iio_hwmon.c                          |   3 +-
 drivers/hwmon/ina2xx.c                             |  90 +++---
 drivers/hwmon/k10temp.c                            |   1 +
 drivers/hwmon/lm75.c                               |   2 +-
 drivers/hwmon/pmbus/Kconfig                        |   1 +
 drivers/hwmon/pmbus/ibm-cffps.c                    | 288 +++++++++++++++++-
 drivers/hwmon/pmbus/ir35221.c                      | 189 ------------
 drivers/hwmon/pmbus/lm25066.c                      |  67 +----
 drivers/hwmon/pmbus/max31785.c                     | 294 +++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h                        |  41 +++
 drivers/hwmon/pmbus/pmbus_core.c                   | 273 +++++++++++++++--
 drivers/hwmon/sht15.c                              |   1 +
 drivers/hwmon/sht21.c                              |   2 +-
 drivers/hwmon/sht3x.c                              |   7 +
 drivers/hwmon/w83773g.c                            | 329 +++++++++++++++++++++
 26 files changed, 1408 insertions(+), 382 deletions(-)
 create mode 100644 Documentation/hwmon/w83773g
 create mode 100644 drivers/hwmon/w83773g.c
