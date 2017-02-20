Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47903 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751851AbdBTDoi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Feb 2017 22:44:38 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.11
Date: Sun, 19 Feb 2017 19:43:09 -0800
Message-Id: <1487562189-14124-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.11 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.11

Thanks,
Guenter
------

The following changes since commit e9572fdd13e299cfba03abbfd2786c84ac055249:

  hwmon: (lm90) fix temp1_max_alarm attribute (2017-01-02 10:15:28 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.11

for you to fetch changes up to 2f1736ff0664937636f8c0a4994c4a5a23da2090:

  hwmon: (sht15) Add device tree support (2017-02-16 06:49:05 -0800)

----------------------------------------------------------------
hwmon updates for v4.11

- new driver for stts751
- it87: Added support for IT8622E and IT8792E; improved support for other chips
- lm70: Added support for TMP122/124
- use permission-specific DEVICE_ATTR variants where possible
- fixed overflows in various drivers
- minor improvements in various drivers

----------------------------------------------------------------
Alexander Koch (4):
      devicetree: hwmon: Add bindings for ADC128D818
      hwmon: (adc128d818) Implement mode selection via dt
      hwmon: (adc128d818) Support operation modes 1-3
      hwmon: (adc128d818) Preserve operation mode

Christian Lamparter (1):
      devicetree: add lm90 thermal_zone sensor support

Corentin LABBE (1):
      hwmon: (sch56xx) Remove unneeded linux/miscdevice.h include

Florian Fainelli (2):
      hwmon: (lm70) Utilize dev_warn instead of pr_warn
      hwmon: (lm70) Add support for TI TMP122/124

Guenter Roeck (14):
      hwmon: (dme1737) Fix overflows seen when writing into limit attributes
      hwmon: (gl518sm) Fix overflows seen when writing into limit attributes
      hwmon: (gl520sm) Fix overflows and crash seen when writing into limit attributes
      hwmon: Make name attribute mandatory for new APIs
      hwmon: Update documentation to clarify rules for the 'name' attribute
      hwmon: Relax name attribute validation for new APIs
      hwmon: Register thermal zone only if 'dev' parameter was provided
      hwmon: (it87) Add feature flag indicating that VIN3 is connected to 5V
      hwmon: (it87) Add support for IT8622E
      hwmon: (it87) Improve IT8622 support
      hwmon: (it87) Ensure that pwm control cache is current before updating values
      hwmon: (it87) Fix pwm4 detection for IT8620 and IT8628
      hwmon: (it87) Do not overwrite bit 2..6 of pwm control registers
      hwmon: (it87) Add support for IT8792E

Javier Martinez Canillas (1):
      hwmon: (ltc4151) Export OF device ID table as module aliases

Jeroen De Wachter (1):
      hwmon: (tmp401) use smb word operations instead of 2 smb byte operations

Julia Lawall (66):
      hwmon: (adm1021) use permission-specific DEVICE_ATTR variants
      hwmon: (adm1026) use permission-specific DEVICE_ATTR variants
      hwmon: (adm1031) use permission-specific DEVICE_ATTR variants
      hwmon: (adm9240) use permission-specific DEVICE_ATTR variants
      hwmon: (adt7470) use permission-specific DEVICE_ATTR variants
      hwmon: (adt7x10) use permission-specific DEVICE_ATTR variants
      hwmon: (asb100) use permission-specific DEVICE_ATTR variants
      hwmon: (atxp1) use permission-specific DEVICE_ATTR variants
      hwmon: (ds1621) use permission-specific DEVICE_ATTR variants
      hwmon: (f71882fg) use permission-specific DEVICE_ATTR variants
      hwmon: (fschmd) use permission-specific DEVICE_ATTR variants
      hwmon: (g760a) use permission-specific DEVICE_ATTR variants
      hwmon: (g762) use permission-specific DEVICE_ATTR variants
      hwmon: (gl520sm) use permission-specific DEVICE_ATTR variants
      hwmon: (gpio-fan) use permission-specific DEVICE_ATTR variants
      hwmon: (core) use permission-specific DEVICE_ATTR variants
      hwmon: (i5500_temp) use permission-specific DEVICE_ATTR variants
      hwmon: (i5k_amb) use permission-specific DEVICE_ATTR variants
      hwmon: (jz4740) use permission-specific DEVICE_ATTR variants
      hwmon: (lm63) use permission-specific DEVICE_ATTR variants
      hwmon: (lm70) use permission-specific DEVICE_ATTR variants
      hwmon: (lm80) use permission-specific DEVICE_ATTR variants
      hwmon: (lm85) use permission-specific DEVICE_ATTR variants
      hwmon: (lm87) use permission-specific DEVICE_ATTR variants
      hwmon: (lm92) use permission-specific DEVICE_ATTR variants
      hwmon: (lm93) use permission-specific DEVICE_ATTR variants
      hwmon: (max1111) use permission-specific DEVICE_ATTR variants
      hwmon: (max1619) use permission-specific DEVICE_ATTR variants
      hwmon: (max197) use permission-specific DEVICE_ATTR variants
      hwmon: (mc13783-adc) use permission-specific DEVICE_ATTR variants
      hwmon: (mcp3021) use permission-specific DEVICE_ATTR variants
      hwmon: (nct6683) use permission-specific DEVICE_ATTR variants
      hwmon: (nsa320) use permission-specific DEVICE_ATTR variants
      hwmon: (pcf8591) use permission-specific DEVICE_ATTR variants
      hwmon: (sht15) use permission-specific DEVICE_ATTR variants
      hwmon: (sis5595) use permission-specific DEVICE_ATTR variants
      hwmon: (smsc47m1) use permission-specific DEVICE_ATTR variants
      hwmon: (smsc47m192) use permission-specific DEVICE_ATTR variants
      hwmon: (via-cputemp) use permission-specific DEVICE_ATTR variants
      hwmon: (via686a) use permission-specific DEVICE_ATTR variants
      hwmon: (w83627ehf) use permission-specific DEVICE_ATTR variants
      hwmon: (w83627hf) use permission-specific DEVICE_ATTR variants
      hwmon: (w83781d) use permission-specific DEVICE_ATTR variants
      hwmon: (w83792d) use permission-specific DEVICE_ATTR variants
      hwmon: (w83791d) use permission-specific DEVICE_ATTR variants
      hwmon: (pc87427) use permission-specific DEVICE_ATTR variants
      hwmon: (f71805f) use permission-specific DEVICE_ATTR variants
      hwmon: (w83793) use permission-specific DEVICE_ATTR variants
      hwmon: (vt8231) use permission-specific DEVICE_ATTR variants
      hwmon: (k10temp) use permission-specific DEVICE_ATTR variants
      hwmon: (dme1737) use permission-specific DEVICE_ATTR variants
      hwmon: (it87) use permission-specific DEVICE_ATTR variants
      hwmon: (lm90) use permission-specific DEVICE_ATTR variants
      hwmon: (nct6775) use permission-specific DEVICE_ATTR variants
      hwmon: (pc87360) use permission-specific DEVICE_ATTR variants
      hwmon: (lm78) use permission-specific DEVICE_ATTR variants
      hwmon: (sch5627) use permission-specific DEVICE_ATTR variants
      hwmon: (k8temp) use permission-specific DEVICE_ATTR variants
      hwmon: (adm1025) use permission-specific DEVICE_ATTR variants
      hwmon: (lm83) use permission-specific DEVICE_ATTR variants
      hwmon: (emc2103) use permission-specific DEVICE_ATTR variants
      hwmon: (max6650) use permission-specific DEVICE_ATTR variants
      hwmon: (lm95234) use permission-specific DEVICE_ATTR variants
      hwmon: (adt7475) use permission-specific DEVICE_ATTR variants
      hwmon: (fam15h_power) use permission-specific DEVICE_ATTR variants
      hwmon: (tmp401) use permission-specific DEVICE_ATTR variants

Marco Franchi (1):
      hwmon: (sht15) Add device tree support

Michael Walle (1):
      hwmon: (adt7411) add min, max and alarm attributes

Peter A. Bigot (1):
      hwmon: (sht21) Add Electronic Identification Code retrieval

andrea.merello (2):
      hwmon: new driver for ST stts751 thermal sensor
      DT: add binding documentation for STTS751

 .../devicetree/bindings/hwmon/adc128d818.txt       |  38 +
 Documentation/devicetree/bindings/hwmon/lm70.txt   |   1 +
 Documentation/devicetree/bindings/hwmon/lm90.txt   |   6 +
 Documentation/devicetree/bindings/hwmon/sht15.txt  |  19 +
 .../devicetree/bindings/hwmon/stts751.txt          |  15 +
 Documentation/hwmon/hwmon-kernel-api.txt           |   4 +
 Documentation/hwmon/lm70                           |   8 +-
 Documentation/hwmon/sht21                          |   5 +-
 Documentation/hwmon/sysfs-interface                |   5 +-
 MAINTAINERS                                        |   1 +
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/adc128d818.c                         | 147 +++-
 drivers/hwmon/adm1021.c                            |  14 +-
 drivers/hwmon/adm1025.c                            |  16 +-
 drivers/hwmon/adm1026.c                            | 128 ++--
 drivers/hwmon/adm1031.c                            |  15 +-
 drivers/hwmon/adm9240.c                            |  28 +-
 drivers/hwmon/adt7411.c                            | 361 +++++++--
 drivers/hwmon/adt7470.c                            |  48 +-
 drivers/hwmon/adt7475.c                            |  28 +-
 drivers/hwmon/adt7x10.c                            |   7 +-
 drivers/hwmon/asb100.c                             |  36 +-
 drivers/hwmon/atxp1.c                              |  35 +-
 drivers/hwmon/dme1737.c                            |  46 +-
 drivers/hwmon/ds1621.c                             |  16 +-
 drivers/hwmon/emc2103.c                            |  36 +-
 drivers/hwmon/f71805f.c                            |  16 +-
 drivers/hwmon/f71882fg.c                           |   6 +-
 drivers/hwmon/fam15h_power.c                       |  34 +-
 drivers/hwmon/fschmd.c                             |   6 +-
 drivers/hwmon/g760a.c                              |  22 +-
 drivers/hwmon/g762.c                               |  86 ++-
 drivers/hwmon/gl518sm.c                            |  13 +-
 drivers/hwmon/gl520sm.c                            |  73 +-
 drivers/hwmon/gpio-fan.c                           |  54 +-
 drivers/hwmon/hwmon.c                              |  20 +-
 drivers/hwmon/i5500_temp.c                         |   6 +-
 drivers/hwmon/i5k_amb.c                            |   4 +-
 drivers/hwmon/it87.c                               | 164 +++-
 drivers/hwmon/jz4740-hwmon.c                       |   6 +-
 drivers/hwmon/k10temp.c                            |  12 +-
 drivers/hwmon/k8temp.c                             |   4 +-
 drivers/hwmon/lm63.c                               |  48 +-
 drivers/hwmon/lm70.c                               |  18 +-
 drivers/hwmon/lm78.c                               |  38 +-
 drivers/hwmon/lm80.c                               |   4 +-
 drivers/hwmon/lm83.c                               |   4 +-
 drivers/hwmon/lm85.c                               |  22 +-
 drivers/hwmon/lm87.c                               |  43 +-
 drivers/hwmon/lm90.c                               |   8 +-
 drivers/hwmon/lm92.c                               |  10 +-
 drivers/hwmon/lm93.c                               |  39 +-
 drivers/hwmon/lm95234.c                            |  12 +-
 drivers/hwmon/ltc4151.c                            |   1 +
 drivers/hwmon/max1111.c                            |   4 +-
 drivers/hwmon/max1619.c                            |   4 +-
 drivers/hwmon/max197.c                             |   6 +-
 drivers/hwmon/max6650.c                            |  44 +-
 drivers/hwmon/mc13783-adc.c                        |   6 +-
 drivers/hwmon/mcp3021.c                            |   6 +-
 drivers/hwmon/nct6683.c                            |  17 +-
 drivers/hwmon/nct6775.c                            |   4 +-
 drivers/hwmon/nsa320-hwmon.c                       |  12 +-
 drivers/hwmon/pc87360.c                            |  26 +-
 drivers/hwmon/pc87427.c                            |   4 +-
 drivers/hwmon/pcf8591.c                            |  24 +-
 drivers/hwmon/sch5627.c                            |   4 +-
 drivers/hwmon/sch56xx-common.c                     |   1 -
 drivers/hwmon/sht15.c                              |  68 +-
 drivers/hwmon/sht21.c                              |  92 ++-
 drivers/hwmon/sis5595.c                            |  36 +-
 drivers/hwmon/smsc47m1.c                           |  10 +-
 drivers/hwmon/smsc47m192.c                         |  14 +-
 drivers/hwmon/stts751.c                            | 834 +++++++++++++++++++++
 drivers/hwmon/tmp401.c                             |  60 +-
 drivers/hwmon/via-cputemp.c                        |   6 +-
 drivers/hwmon/via686a.c                            |   8 +-
 drivers/hwmon/vt8231.c                             |  59 +-
 drivers/hwmon/w83627ehf.c                          |   8 +-
 drivers/hwmon/w83627hf.c                           |  53 +-
 drivers/hwmon/w83781d.c                            |  34 +-
 drivers/hwmon/w83791d.c                            |  23 +-
 drivers/hwmon/w83792d.c                            |  15 +-
 drivers/hwmon/w83793.c                             |   6 +-
 include/dt-bindings/thermal/lm90.h                 |  12 +
 86 files changed, 2434 insertions(+), 913 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/sht15.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/stts751.txt
 create mode 100644 drivers/hwmon/stts751.c
 create mode 100644 include/dt-bindings/thermal/lm90.h
