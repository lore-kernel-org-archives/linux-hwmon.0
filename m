Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36703 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754307AbdGCQAH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Jul 2017 12:00:07 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.13
Date: Mon,  3 Jul 2017 09:00:04 -0700
Message-Id: <1499097604-4316-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.13 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.13-rc1

Thanks,
Guenter
------

The following changes since commit 32c1431eea4881a6b17bd7c639315010aeefa452:

  Linux 4.12-rc5 (2017-06-11 16:48:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.13-rc1

for you to fetch changes up to 44b413661b57cbbb7e4c3adf7b087fada42a443e:

  hwmon: (aspeed-pwm-tacho) Poll with short sleeps. (2017-06-24 08:58:06 -0700)

----------------------------------------------------------------
hwmon updates for v4.13:

- Add PMBus client driver for IR35221
- Add support for NCT6795D to nct6775 driver
- Functional improvements to adt7475, aspeed-pwm-tacho, and ibmpowernv drivers
- Minor fixes and cleanups in various drivers

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      hwmon: (pwm-fan) Switch to new atomic PWM API

Carlo Caione (1):
      hwmon: (scpi) Fix the scale of SCP sensor readings

Chris Packham (4):
      hwmon: (adt7475) replace find_nearest() with find_closest()
      hwmon: (adt7475) fan stall prevention
      hwmon: (adt7475) add high frequency support
      hwmon: (adt7475) temperature smoothing

Cédric Le Goater (1):
      hwmon: (ibmpowernv) introduce a legacy_compatibles array

Guenter Roeck (4):
      hwmon: (nct6775) Use bitops
      hwmon: (nct6775) Rework temperature source and label handling
      hwmon: (nct6775) Improve fan detection
      hwmon: (nct6775) Add support for NCT6795D

Patrick Venture (3):
      hwmon: (aspeed-pwm-tacho) Enable both edge measurement.
      hwmon: (aspeed-pwm-tacho) reduce fan_tach period
      hwmon: (aspeed-pwm-tacho) Poll with short sleeps.

Samuel Mendoza-Jonas (1):
      hwmon: (pmbus) Add client driver for IR35221

Shilpasri G Bhat (2):
      hwmon: (ibmpowernv) Add highest/lowest attributes to sensors
      hwmon: (ibmpowernv) Add current(A) sensor

Wolfram Sang (5):
      hwmon: (ads1015) move header file out of I2C realm
      hwmon: (ds620) move header file out of I2C realm
      hwmon: (ltc4245) move header file out of I2C realm
      hwmon: (max6639) move header file out of I2C realm
      hwmon: (pmbus) move header file out of I2C realm

 Documentation/hwmon/ads1015                    |   2 +-
 Documentation/hwmon/adt7475                    |   9 +
 Documentation/hwmon/ir35221                    |  87 +++++++
 Documentation/hwmon/ltc4245                    |   2 +-
 Documentation/hwmon/pmbus-core                 |   2 +-
 MAINTAINERS                                    |   4 +-
 drivers/hwmon/ads1015.c                        |   2 +-
 drivers/hwmon/adt7475.c                        | 184 +++++++++++---
 drivers/hwmon/aspeed-pwm-tacho.c               |  50 +++-
 drivers/hwmon/ds620.c                          |   2 +-
 drivers/hwmon/ibmpowernv.c                     |  96 +++++--
 drivers/hwmon/ltc4245.c                        |   2 +-
 drivers/hwmon/max6639.c                        |   2 +-
 drivers/hwmon/nct6775.c                        | 325 ++++++++++++++++--------
 drivers/hwmon/pmbus/Kconfig                    |  10 +
 drivers/hwmon/pmbus/Makefile                   |   1 +
 drivers/hwmon/pmbus/ir35221.c                  | 337 +++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.c                    |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c               |   2 +-
 drivers/hwmon/pmbus/ucd9000.c                  |   2 +-
 drivers/hwmon/pmbus/ucd9200.c                  |   2 +-
 drivers/hwmon/pwm-fan.c                        |  68 ++---
 drivers/hwmon/scpi-hwmon.c                     |  54 +++-
 drivers/iio/adc/ti-ads1015.c                   |   2 +-
 include/linux/{i2c => platform_data}/ads1015.h |   0
 include/linux/{i2c => platform_data}/ds620.h   |   0
 include/linux/{i2c => platform_data}/ltc4245.h |   0
 include/linux/{i2c => platform_data}/max6639.h |   0
 include/linux/{i2c => }/pmbus.h                |   0
 29 files changed, 1025 insertions(+), 224 deletions(-)
 create mode 100644 Documentation/hwmon/ir35221
 create mode 100644 drivers/hwmon/pmbus/ir35221.c
 rename include/linux/{i2c => platform_data}/ads1015.h (100%)
 rename include/linux/{i2c => platform_data}/ds620.h (100%)
 rename include/linux/{i2c => platform_data}/ltc4245.h (100%)
 rename include/linux/{i2c => platform_data}/max6639.h (100%)
 rename include/linux/{i2c => }/pmbus.h (100%)
