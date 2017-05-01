Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42618 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166077AbdEAGAs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 May 2017 02:00:48 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.12
Date: Sun, 30 Apr 2017 23:00:45 -0700
Message-Id: <1493618445-31542-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.12 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.12

Thanks,
Guenter
------

The following changes since commit c02ed2e75ef4c74e41e421acb4ef1494671585e8:

  Linux 4.11-rc4 (2017-03-26 14:15:16 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.12

for you to fetch changes up to 09d9d82745801ca69c00f91f89c8f047b586e8cc:

  hwmon: (twl4030-madc) drop driver (2017-04-30 11:45:31 -0700)

----------------------------------------------------------------
hwmon updates for v4.12

Removed twl4030-madc driver
Various minor improvements and fixes in several drivers

----------------------------------------------------------------
Chris Packham (2):
      docs: hwmon: Fix typo "Microship" should be "Microchip"
      hwmon: (adt7475) set start bit in probe

Jaghathiswari Rankappagounder Natarajan (2):
      Documentation: dt-bindings: Document bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
      drivers: hwmon: Support for ASPEED PWM/Fan tach

Javier Martinez Canillas (21):
      hwmon: (ad7414) Add OF device ID table
      hwmon: (adc128d818) Add OF device ID table
      hwmon: (ads1015) Add OF device ID table
      hwmon: (ads7828) Add OF device ID table
      hwmon: (adt7475) Add OF device ID table
      hwmon: (ina209) Add OF device ID table
      hwmon: (ina2xx) Add OF device ID table
      hwmon: (lm63) Add OF device ID table
      hwmon: (lm75) Add OF device ID table
      hwmon: (lm85) Add OF device ID table
      hwmon: (lm90) Add OF device ID table
      hwmon: (lm95245) Add OF device ID table
      hwmon: (max6697) Add OF device ID table
      hwmon: (ucd9000) Add OF device ID table
      hwmon: (ucd9200) Add OF device ID table
      hwmon: (stts751) Add OF device ID table
      hwmon: (tmp102) Add OF device ID table
      hwmon: (tmp103) Add OF device ID table
      hwmon: (tmp421) Add OF device ID table
      hwmon: (lm87) Remove unused I2C devices driver_data
      hwmon: (lm87) Add OF device ID table

Jean Delvare (1):
      hwmon: Constify str parameter of hwmon_ops->read_string

Joe Schaack (1):
      hwmon: (ina209) Handled signed registers

Katsumi Sato (1):
      hwmon: (w83627ehf) Use request_muxed_region

Mahoda Ratnayaka (2):
      Documentation: dtb: lm87: Add hwmon binding documentation
      hwmon: (lm87) Allow channel data to be set from dts file

Marco Franchi (1):
      dt: Add vendor prefix for Sensirion

Pali Rohár (1):
      hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list

Rahul Bedarkar (1):
      hwmon: (tmp103) Use SIMPLE_DEV_PM_OPS helper macro

Sam Povilus (1):
      hwmon: (ads7828) Accept optional parameters from device tree

Sebastian Reichel (1):
      hwmon: (twl4030-madc) drop driver

Shikhar Dogra (1):
      driver: (adm1275) set the m,b and R coefficients correctly for power

 .../devicetree/bindings/hwmon/ads7828.txt          |  25 +
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  68 ++
 Documentation/devicetree/bindings/hwmon/lm87.txt   |  30 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 Documentation/hwmon/aspeed-pwm-tacho               |  22 +
 Documentation/hwmon/tc654                          |   2 +-
 drivers/hwmon/Kconfig                              |  19 +-
 drivers/hwmon/Makefile                             |   2 +-
 drivers/hwmon/ad7414.c                             |   7 +
 drivers/hwmon/adc128d818.c                         |   7 +
 drivers/hwmon/ads1015.c                            |  22 +-
 drivers/hwmon/ads7828.c                            |  39 +-
 drivers/hwmon/adt7475.c                            |  44 +-
 drivers/hwmon/aspeed-pwm-tacho.c                   | 835 +++++++++++++++++++++
 drivers/hwmon/dell-smm-hwmon.c                     |   7 +
 drivers/hwmon/hwmon.c                              |   2 +-
 drivers/hwmon/ina209.c                             |  11 +-
 drivers/hwmon/ina2xx.c                             |  35 +-
 drivers/hwmon/lm63.c                               |  23 +
 drivers/hwmon/lm75.c                               |  98 ++-
 drivers/hwmon/lm85.c                               |  56 +-
 drivers/hwmon/lm87.c                               |  37 +-
 drivers/hwmon/lm90.c                               | 100 ++-
 drivers/hwmon/lm95245.c                            |   8 +
 drivers/hwmon/max6697.c                            |  52 +-
 drivers/hwmon/pmbus/adm1275.c                      |   4 +-
 drivers/hwmon/pmbus/ucd9000.c                      |  39 +-
 drivers/hwmon/pmbus/ucd9200.c                      |  48 +-
 drivers/hwmon/stts751.c                            |   7 +
 drivers/hwmon/tmp102.c                             |   7 +
 drivers/hwmon/tmp103.c                             |  24 +-
 drivers/hwmon/tmp421.c                             |  35 +-
 drivers/hwmon/twl4030-madc-hwmon.c                 | 118 ---
 drivers/hwmon/w83627ehf.c                          |  35 +-
 include/linux/hwmon.h                              |   2 +-
 35 files changed, 1693 insertions(+), 178 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ads7828.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c
 delete mode 100644 drivers/hwmon/twl4030-madc-hwmon.c
