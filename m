Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:47456 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdKMAAX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Nov 2017 19:00:23 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.15
Date: Sun, 12 Nov 2017 16:00:21 -0800
Message-Id: <1510531221-4543-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.15 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.15

Thanks,
Guenter
------

The following changes since commit 0b07194bb55ed836c2cc7c22e866b87a14681984:

  Linux 4.14-rc7 (2017-10-29 13:58:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.15

for you to fetch changes up to ded0eb83449e8fcba22fd2736826336e101ffbcb:

  dt-bindings: pmbus: Add Maxim MAX31785 documentation (2017-11-06 17:26:42 -0800)

----------------------------------------------------------------
hwmon updates for v4.15

- Drivers for MAX31785 and MAX6621
- Support for AMD family 17h (Ryzen, Threadripper) temperature sensors
- Various driver cleanups and minor improvements

----------------------------------------------------------------
Alan Tull (2):
      dt-bindings: hwmon: add compatible for max1619
      hwmon: (max1619) Add dt binding

Andrew Jeffery (2):
      pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
      dt-bindings: pmbus: Add Maxim MAX31785 documentation

Colin Ian King (3):
      hwmon: (sht15) remove redundant check on status and send of status value
      hwmon: (w83793) make const array watchdog_minors static, reduces object code size
      hwmon: (asc7621) remove redundant assignment to newval

Dan Carpenter (1):
      hwmon: (max6621) Inverted if condition in max6621_read()

Edward A. James (1):
      hwmon: (pmbus/core) Prevent unintentional setting of page to 0xFF

Guenter Roeck (3):
      hwmon: (k10temp) Move chip specific code into probe function
      hwmon: (k10temp) Add support for family 17h
      hwmon: (k10temp) Add support for temperature offsets

Jean Delvare (1):
      hwmon: (stts751) Fix buffer size passed to snprintf

Joel (1):
      hwmon: (aspeed-pwm-tacho) Sort headers

Linus Walleij (10):
      hwmon: (sht15) Root out platform data
      hwmon: (gpio-fan) Move DT bindings to the right place
      hwmon: (gpio-fan) Use local variable pointers
      hwmon: (gpio-fan) Localize platform data
      hwmon: (gpio-fan) Send around device pointer
      hwmon: (gpio-fan) Mandate OF_GPIO and cut pdata path
      hwmon: (gpio-fan) Get rid of platform data struct
      hwmon: (gpio-fan) Get rid of the gpio alarm struct
      hwmon: (gpio-fan) Rename GPIO line state variables
      hwmon: (gpio-fan) Convert to use GPIO descriptors

Miquel Raynal (1):
      hwmon: (gpio-fan) Fix null pointer dereference at probe

Patrick Venture (1):
      hwmon: (aspeed-pwm-tacho) increase fan tach period

Vadim Pasternak (2):
      hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor
      Documentation: devicetree: add max6621 device

hotran (2):
      hwmon: (xgene) Support hwmon v2
      hwmon: (xgene) Minor clean up of ifdef and acpi_match_table reference

 .../bindings/{gpio => hwmon}/gpio-fan.txt          |   0
 .../devicetree/bindings/hwmon/max1619.txt          |  12 +
 .../devicetree/bindings/hwmon/max31785.txt         |  22 +
 .../devicetree/bindings/trivial-devices.txt        |   1 +
 Documentation/hwmon/max31785                       |  51 ++
 Documentation/hwmon/sht15                          |   3 +-
 arch/arm/mach-pxa/stargate2.c                      |  17 +-
 drivers/hwmon/Kconfig                              |  15 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/asc7621.c                            |   1 -
 drivers/hwmon/aspeed-pwm-tacho.c                   |   8 +-
 drivers/hwmon/gpio-fan.c                           | 224 +++-----
 drivers/hwmon/k10temp.c                            | 108 +++-
 drivers/hwmon/max1619.c                            |  10 +
 drivers/hwmon/max6621.c                            | 593 +++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 116 ++++
 drivers/hwmon/pmbus/pmbus.h                        |   6 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |  25 +-
 drivers/hwmon/sht15.c                              | 175 ++----
 drivers/hwmon/stts751.c                            |  18 +-
 drivers/hwmon/w83793.c                             |   4 +-
 drivers/hwmon/xgene-hwmon.c                        |  39 +-
 include/linux/gpio-fan.h                           |  36 --
 include/linux/platform_data/sht15.h                |  38 --
 26 files changed, 1131 insertions(+), 403 deletions(-)
 rename Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt (100%)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max1619.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
 create mode 100644 Documentation/hwmon/max31785
 create mode 100644 drivers/hwmon/max6621.c
 create mode 100644 drivers/hwmon/pmbus/max31785.c
 delete mode 100644 include/linux/gpio-fan.h
 delete mode 100644 include/linux/platform_data/sht15.h
