Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40157 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbeHMAGy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Aug 2018 20:06:54 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.19-rc1
Date: Sun, 12 Aug 2018 14:27:33 -0700
Message-Id: <1534109253-19294-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.19-rc1 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.19-rc1

Thanks,
Guenter
------

The following changes since commit 1e4b044d22517cae7047c99038abb444423243ca:

  Linux 4.18-rc4 (2018-07-08 16:34:02 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.19-rc1

for you to fetch changes up to 4afec79f652b11189c07ce49498c4477adda887c:

  hwmon: (adt7475) Change show functions to return error data correctly (2018-08-10 09:13:01 -0700)

----------------------------------------------------------------
hwmon updates for v4.19-rc1

New driver for NPCM7xx PWM and Fan controller
New driver for Mellanox FAN controller
Add support for MAX34451 to max34440 driver
Add support for new Threadripper variants to k10temp driver
Add error handling to adt7475 driver
Cleanup nct6775 and nct7904 drivers
Document sensor enable ABI attributes

----------------------------------------------------------------
Guenter Roeck (2):
      hwmon: (nct6775) Fix comment in the description of pwm_mode
      hwmon: k10temp: Support Threadripper 2920X, 2970WX; simplify offset table

Gustavo A. R. Silva (1):
      hwmon: Mark expected switch fall-throughs

Jakob Albert (3):
      hwmon: (nct7904) Fix SPACING errors
      hwmon: (nct7904) Fix CODE_INDENT error
      hwmon: (nct7904) Fix UNSPECIFIED_INT warning

Kun Yi (1):
      hwmon: (pmbus/max34440) Add support for MAX34451.

Maxime Roussin-Bélanger (1):
      hwmon: (iio_hwmon) Use devm functions

Michael Larabel (1):
      hwmon: (k10temp) 27C Offset needed for Threadripper2

Shilpasri G Bhat (1):
      hwmon: Document the sensor enable attribute

Tokunori Ikegami (4):
      hwmon: (adt7475) Split device update function to measure and limits
      hwmon: (adt7475) Change valid parameter to bool type
      hwmon: (adt7475) Change update functions to add error handling
      hwmon: (adt7475) Change show functions to return error data correctly

Tomer Maimon (2):
      dt-binding: hwmon: Add NPCM7xx PWM and Fan controller documentation
      hwmon: Add NPCM7xx PWM and Fan driver

Vadim Pasternak (1):
      hwmon: (mlxreg-fan) Add support for Mellanox FAN driver

 .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  |   84 ++
 Documentation/hwmon/max34440                       |   16 +-
 Documentation/hwmon/mlxreg-fan                     |   60 ++
 Documentation/hwmon/npcm750-pwm-fan                |   22 +
 Documentation/hwmon/sysfs-interface                |   48 +
 drivers/hwmon/Kconfig                              |   22 +
 drivers/hwmon/Makefile                             |    2 +
 drivers/hwmon/adt7475.c                            |  340 +++++--
 drivers/hwmon/emc1403.c                            |    2 +
 drivers/hwmon/iio_hwmon.c                          |   67 +-
 drivers/hwmon/k10temp.c                            |    8 +-
 drivers/hwmon/mlxreg-fan.c                         |  489 +++++++++
 drivers/hwmon/nct6775.c                            |    6 +-
 drivers/hwmon/nct7904.c                            |   68 +-
 drivers/hwmon/npcm750-pwm-fan.c                    | 1057 ++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |    2 +-
 drivers/hwmon/pmbus/max34440.c                     |   93 +-
 17 files changed, 2190 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
 create mode 100644 Documentation/hwmon/mlxreg-fan
 create mode 100644 Documentation/hwmon/npcm750-pwm-fan
 create mode 100644 drivers/hwmon/mlxreg-fan.c
 create mode 100644 drivers/hwmon/npcm750-pwm-fan.c
