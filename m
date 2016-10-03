Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59246 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751260AbcJCRPN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2016 13:15:13 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.9
Date: Mon,  3 Oct 2016 07:26:49 -0700
Message-Id: <1475504809-28651-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.9 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.9

Thanks,
Guenter
------

The following changes since commit c6935931c1894ff857616ff8549b61236a19148f:

  Linux 4.8-rc5 (2016-09-04 14:31:46 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.9

for you to fetch changes up to 7ce4190c4ca466ccd609845b97dce665317aee2a:

  hwmon: (nct6775) Add support for multiple virtual temperature sources (2016-09-18 15:32:35 -0700)

----------------------------------------------------------------
hwmon updates for v4.9

- New hwmon registration API, including ports of several drivers
  to the new API
- New hwmon driver for APM X-Gene SoC
- Added support for UCD90160, DPS-460, DPS-800, and SGD009 PMBUs chips
- Various cleanups, minor improvements, and fixes in several drivers

----------------------------------------------------------------
Arnd Bergmann (1):
      hwmon: (xgene) access mailbox as RAM

Axel Lin (2):
      hwmon: (lm95245) Select REGMAP_I2C
      hwmon: (lm95241) Update module description to include LM95231

Daniel Golle (2):
      hwmon: (ltc4151) Add devicetree binding for ltc4151
      hwmon: (ltc4151) Make shunt-resistor configurable

Daniel Wagner (1):
      hwmon: (adt7470) No need for additional synchronization on kthread_stop()

Guenter Roeck (31):
      hwmon: (lm95241) Fix overflow problems, write conversion rate to chip
      hwmon: (lm95241) Add support for fault attributes
      hwmon: (lm95241) Order include files alphabetically
      hwmon: (lm95241) Drop FSF address
      hwmon: (lm95241) Use BIT macro where appropriate
      hwmon: (lm95241) Use more accurate limits
      hwmon: (ntc_thermistor) Use devm_iio_channel_get
      hwmon: (ntc_thermistor) Use dev instead of &pdev->dev where possible
      hwmon: (ntc_thermistor) Use devm_hwmon_device_register_with_groups
      hwmon: (core) Order include files alphabetically
      hwmon: (core) New hwmon registration API
      hwmon: (core) Add voltage attribute support to new API
      hwmon: (core) Add current attribute support to new API
      hwmon: (core) Add power attribute support to new API
      hwmon: (core) Add energy and humidity attribute support to new API
      hwmon: (core) Add fan attribute support to new API
      hwmon: (core) Document new kernel API
      hwmon: (core) Add basic pwm attribute support to new API
      hwmon: (nct6775) Do not accept force_id unless chip is found
      hwmon: (core) Avoid cyclic dependency between hwmon and thermal_sys
      hwmon: (lm75) Convert to use new hwmon registration API
      hwmon: (lm90) Convert to use new hwmon registration API
      hwmon: (tmp102) Convert to use new hwmon registration API
      hwmon: (tmp421) Convert to use new hwmon registration API
      hwmon: (ltc4245) Convert to use new hwmon registration API
      hwmon: (nct7904) Convert to use new hwmon registration API
      hwmon: (max31790) Convert to use new hwmon registration API
      hwmon: (jc42) Convert to use new hwmon registration API
      hwmon: (lm95241) Convert to use new hwmon registration API
      hwmon: (lm95245) Use new hwmon registration API
      hwmon: (nct6775) Add support for multiple virtual temperature sources

Jean Delvare (1):
      hwmon: (it87) Drop useless comments

Joshua Scott (3):
      hwmon: (adt7470) Expose PWM frequency to sysfs
      hwmon: (adt7470) Add write support to alarm_mask
      hwmon: (adt7470) Allow faster removal

Markus Elfring (1):
      hwmon: (scpi) Delete unnecessary assignment for the field "owner"

Matt Weber (1):
      hwmon: (ucd9000) Add support for UCD90160 Power Supply Sequencer

Michael Neuling (1):
      hwmon: (ibmpowernv) Fix label for cores numbers not threads

Michael Walle (1):
      hwmon: (adt7411) add external thermal diode support

Mike Looijmans (4):
      hwmon: (max6650) Add devicetree support documentation
      hwmon: (max6650) Add devicetree support
      hwmon: (max6650) Allow fan shutdown and initial rpm target
      hwmon: (max6650) Add initial rpm target devicetree documentation

Quentin Schulz (1):
      hwmon: (iio_hwmon) defer probe when no channel is found

Thilo Cestonaro (1):
      hwmon: (ftsteutates) Add i2c detect functionality

Vadim Pasternak (1):
      hwmon: (pmbus) Add explicit support for DPS-460, DPS-800, and SGD009

hotran (2):
      hwmon: Add xgene hwmon driver
      hwmon: (xgene) Fix crash when alarm occurs before driver probe

 .../devicetree/bindings/hwmon/ltc4151.txt          |  18 +
 .../devicetree/bindings/hwmon/max6650.txt          |  28 +
 Documentation/hwmon/adt7470                        |  17 +
 Documentation/hwmon/hwmon-kernel-api.txt           | 231 +++++-
 Documentation/hwmon/max6650                        |   1 +
 Documentation/hwmon/ucd9000                        |  12 +-
 Documentation/hwmon/xgene-hwmon                    |  30 +
 drivers/hwmon/Kconfig                              |  10 +-
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/adt7411.c                            |  51 +-
 drivers/hwmon/adt7470.c                            | 108 ++-
 drivers/hwmon/ftsteutates.c                        |  45 ++
 drivers/hwmon/hwmon.c                              | 616 +++++++++++++++-
 drivers/hwmon/ibmpowernv.c                         |   8 +-
 drivers/hwmon/iio_hwmon.c                          |   5 +-
 drivers/hwmon/it87.c                               |   8 +-
 drivers/hwmon/jc42.c                               | 293 ++++----
 drivers/hwmon/lm75.c                               | 185 +++--
 drivers/hwmon/lm90.c                               | 811 +++++++++++----------
 drivers/hwmon/lm95241.c                            | 469 +++++++-----
 drivers/hwmon/lm95245.c                            | 638 +++++++++-------
 drivers/hwmon/ltc4151.c                            |  22 +-
 drivers/hwmon/ltc4245.c                            | 362 +++++----
 drivers/hwmon/max31790.c                           | 521 ++++++-------
 drivers/hwmon/max6650.c                            | 155 ++--
 drivers/hwmon/nct6775.c                            |  23 +-
 drivers/hwmon/nct7904.c                            | 555 +++++++-------
 drivers/hwmon/ntc_thermistor.c                     | 107 +--
 drivers/hwmon/pmbus/Kconfig                        |   6 +-
 drivers/hwmon/pmbus/pmbus.c                        |  20 +-
 drivers/hwmon/pmbus/ucd9000.c                      |   3 +-
 drivers/hwmon/scpi-hwmon.c                         |   1 -
 drivers/hwmon/tmp102.c                             | 154 ++--
 drivers/hwmon/tmp421.c                             | 133 ++--
 drivers/hwmon/xgene-hwmon.c                        | 787 ++++++++++++++++++++
 include/linux/hwmon.h                              | 342 +++++++++
 36 files changed, 4620 insertions(+), 2156 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc4151.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6650.txt
 create mode 100644 Documentation/hwmon/xgene-hwmon
 create mode 100644 drivers/hwmon/xgene-hwmon.c
