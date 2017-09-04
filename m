Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35095 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753046AbdIDAWf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Sep 2017 20:22:35 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.14
Date: Sun,  3 Sep 2017 17:22:32 -0700
Message-Id: <1504484552-15399-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.14 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.14

Thanks,
Guenter
------

The following changes since commit aae4e7a8bc44722fe70d58920a36916b1043195e:

  Linux 4.13-rc4 (2017-08-06 18:44:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.14

for you to fetch changes up to 7074d0a92758603369655ef5d4f49e6caaae0b4e:

  hwmon: (ltq-cputemp) add cpu temp sensor driver (2017-09-01 07:24:14 -0700)

----------------------------------------------------------------
hwmon updates for v4.14

- New driver for Lantiq CPU temperature sensor
- New driver for IBM CFF power supply
- New PMBus driver for TPS53679
- Add support for LM5066I lm25066 PMBus driver
- Add support for Intel VID protocol VR13 to PMBus drivers
- Add support for CAT34TS02C, GT30TS00, GT34TS02, and CAT34TS04 to jc42 driver
- Cleanup and minor improvements in several drivers

----------------------------------------------------------------
Anton Vasilyev (1):
      hwmon: (stts751) buffer overrun on wrong chip configuration

Arnd Bergmann (1):
      hwmon: (aspeed-pwm) add THERMAL dependency

Arvind Yadav (6):
      hwmon: constify attribute_group structures.
      hwmon: (nct7802) constify attribute_group structures.
      hwmon: (adc128d818) constify attribute_group structures.
      hwmon: (adt7475) constify attribute_group structures.
      hwmon: (i5k_amb) constify pci_device_id
      hwmon: (ftsteutates) constify i2c_device_id

Colin Ian King (1):
      hwmon: (asc7621) make several arrays static const

Edward A. James (7):
      hwmon: (pmbus): Switch status registers to 16 bit
      hwmon: (pmbus): Access word data for STATUS_WORD
      hwmon: (pmbus): Add generic alarm bit for iin and pin
      hwmon: (pmbus) Add debugfs for status registers
      dt-bindings: hwmon: Document the IBM CCF power supply version 1
      hwmon: (pmbus) Add IBM Common Form Factor (CFF) power supply driver
      Documentation: hwmon: Document the IBM CFF power supply

Florian Eckert (2):
      hwmon: (ltq-cputemp) add devicetree bindings documentation
      hwmon: (ltq-cputemp) add cpu temp sensor driver

Guenter Roeck (3):
      hwmon: (jc42) Add support for GT30TS00, GT34TS02, and CAT34TS04
      hwmon: (jc42) Add support for CAT34TS02C
      Merge remote-tracking branch 'lee/ib-mfd-hwmon-4.14' into hwmon-next

Julia Lawall (2):
      hwmon: (core) constify thermal_zone_of_device_ops structures
      hwmon: (scpi) constify thermal_zone_of_device_ops structures

Maciej S. Szmigiero (2):
      hwmon: (it87) Split out chip registers setting code on probe path
      hwmon: (it87) Reapply probe path chip registers settings after resume

Mykola Kostenok (2):
      Documentation: dt-bindings: aspeed-pwm-tacho cooling device.
      hwmon: (aspeed-pwm-tacho) cooling device support.

Rob Herring (1):
      hwmon: (ads1015) Convert to using %pOF instead of full_name

Sebastian Reichel (4):
      mfd: da9052: Add register details for TSI
      hwmon: da9052: Replace S_IRUGO with 0444
      mfd: da9052: Make touchscreen registration optional
      hwmon: da9052: Add support for TSI channel

Thilo Cestonaro (1):
      hwmon: (ftsteutates) Fix clearing alarm sysfs entries

Vadim Pasternak (2):
      hwmon: (pmbus) Add support for Intel VID protocol VR13
      hwmon: (pmbus) Add support for Texas Instruments tps53679 device

Xo Wang (2):
      hwmon: (pmbus/lm25066) Offset coefficient depends on CL
      hwmon: (pmbus/lm25066) Add support for TI LM5066I

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |   9 +
 .../devicetree/bindings/hwmon/ibm,cffps1.txt       |  21 ++
 .../devicetree/bindings/hwmon/ltq-cputemp.txt      |  10 +
 Documentation/hwmon/ftsteutates                    |   4 +
 Documentation/hwmon/ibm-cffps                      |  54 ++++
 Documentation/hwmon/lm25066                        |   9 +-
 drivers/hwmon/Kconfig                              |   8 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/adc128d818.c                         |   2 +-
 drivers/hwmon/ads1015.c                            |  14 +-
 drivers/hwmon/adt7475.c                            |  16 +-
 drivers/hwmon/asc7621.c                            |   4 +-
 drivers/hwmon/aspeed-pwm-tacho.c                   | 116 +++++++-
 drivers/hwmon/da9052-hwmon.c                       | 285 ++++++++++++++++++--
 drivers/hwmon/ftsteutates.c                        |   4 +-
 drivers/hwmon/hwmon.c                              |   4 +-
 drivers/hwmon/i5k_amb.c                            |   2 +-
 drivers/hwmon/it87.c                               | 214 +++++++++++----
 drivers/hwmon/jc42.c                               |  19 ++
 drivers/hwmon/ltq-cputemp.c                        | 163 ++++++++++++
 drivers/hwmon/nct7802.c                            |  10 +-
 drivers/hwmon/pmbus/Kconfig                        |  18 ++
 drivers/hwmon/pmbus/Makefile                       |   2 +
 drivers/hwmon/pmbus/ibm-cffps.c                    | 151 +++++++++++
 drivers/hwmon/pmbus/lm25066.c                      |  47 +++-
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 292 +++++++++++++++++++--
 drivers/hwmon/pmbus/tps53679.c                     | 113 ++++++++
 drivers/hwmon/scpi-hwmon.c                         |   2 +-
 drivers/hwmon/stts751.c                            |   4 +
 drivers/mfd/da9052-core.c                          |  26 +-
 include/linux/mfd/da9052/da9052.h                  |   6 +
 include/linux/mfd/da9052/reg.h                     |  11 +-
 33 files changed, 1505 insertions(+), 138 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
 create mode 100644 Documentation/hwmon/ibm-cffps
 create mode 100644 drivers/hwmon/ltq-cputemp.c
 create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c
 create mode 100644 drivers/hwmon/pmbus/tps53679.c
