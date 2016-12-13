Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56958 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936053AbcLMSLt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Dec 2016 13:11:49 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.10
Date: Tue, 13 Dec 2016 10:11:47 -0800
Message-Id: <1481652707-31273-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.10 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.10

Thanks,
Guenter
------

The following changes since commit e5517c2a5a49ed5e99047008629f1cd60246ea0e:

  Linux 4.9-rc7 (2016-11-27 13:08:04 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.10

for you to fetch changes up to 4fccd4a1e8944033bcd7693ea4e8fb478cd2059a:

  hwmon: (g762) Fix overflows and crash seen when writing limit attributes (2016-12-12 11:33:44 -0800)

----------------------------------------------------------------
hwmon updates for v4.10

- new drivers for TMP108 and TC654
- hwmon core code cleanup
- coretemp driver cleanup
- fix overflow issues in several drivers
- minor fixes, cleanups and enhancements in various drivers

----------------------------------------------------------------
Chris Packham (1):
      hwmon: Add tc654 driver

Clemens Gruber (3):
      hwmon: (mcp3021) add devicetree bindings documentation
      hwmon: (mcp3021) replace S_IRUGO with 0444
      hwmon: (mcp3021) add devicetree support

Guenter Roeck (21):
      hwmon: (adm9240) Fix overflows seen when writing into limit attributes
      hwmon: (ds620) Fix overflows seen when writing temperature limits
      hwmon: (smsc47m192) Fix overflows seen when writing into limit attributes
      hwmon: (core) Clarify when read and write callbacks are mandatory
      hwmon: (core) Add support for string attributes to new API
      hwmon: (core) Clarify use of chip attributes
      hwmon: (core) Deprecate hwmon_device_register()
      hwmon: (core) Make is_visible callback truly mandatory
      hwmon: (core) Explain why at least two attribute groups are allocated
      hwmon: (core) Rename groups parameter in API to extra_groups
      hwmon: (core) Simplify sysfs attribute name allocation
      hwmon: (adm1025) Fix overflows seen when writing voltage limits
      hwmon: (adm1026) Fix overflows seen when writing into limit attributes
      hwmon: (adt7462) Fix overflows seen when writing into limit attributes
      hwmon: (adt7470) Fix overflows seen when writing into limit attributes
      hwmon: (nct7802) Fix overflows seen when writing into limit attributes
      hwmon: (lm87) Fix overflow seen when writing voltage limit attributes
      hwmon: (lm85) Fix overflows seen when writing voltage limit attributes
      hwmon: (emc2103) Fix overflows seen when temperature limit attributes
      hwmon: (emcw201) Fix overflows seen when writing into limit attributes
      hwmon: (g762) Fix overflows and crash seen when writing limit attributes

Jared Bents (1):
      hwmon: (amc6821) sign extension temperature

Jason Gunthorpe (1):
      hwmon: (lm87) Use hwmon to create the sysfs groups

Javier Martinez Canillas (1):
      hwmon: (scpi) Fix module autoload

John Muir (2):
      hwmon: Add Texas Instruments TMP108 temperature sensor driver.
      devicetree: hwmon: Add documentation for TMP108 driver.

Michael Walle (1):
      hwmon: (adt7411) update to new hwmon registration API

Sebastian Andrzej Siewior (1):
      hwmon: (via-cputemp) Convert to hotplug state machine

Thomas Gleixner (7):
      hwmon: (via-cputemp) Remove pointless CPU check on each CPU
      hwmon: (coretemp) Fixup target cpu for package when cpu is offlined
      hwmon: (coretemp) Simplify sibling management
      hwmon: (coretemp) Avoid redundant lookups
      hwmon: (coretemp) Convert to hotplug state machine
      hwmon: (coretemp) Use proper error codes in cpu online callback
      hwmon: (coretemp) Simplify package management

Tobias Klauser (1):
      hwmon: (lm90) Mention support for TI TMP451 in Kconfig description

Yi Li (1):
      hwmon: (adm1275) Enable adm1278 VOUT sampling

 .../devicetree/bindings/hwmon/mcp3021.txt          |  21 +
 Documentation/devicetree/bindings/hwmon/tmp108.txt |  14 +
 .../devicetree/bindings/i2c/trivial-devices.txt    |   2 +
 Documentation/hwmon/hwmon-kernel-api.txt           |  58 ++-
 Documentation/hwmon/tc654                          |  31 ++
 Documentation/hwmon/tmp108                         |  36 ++
 drivers/hwmon/Kconfig                              |  26 +-
 drivers/hwmon/Makefile                             |   2 +
 drivers/hwmon/adm1025.c                            |   2 +-
 drivers/hwmon/adm1026.c                            |  26 +-
 drivers/hwmon/adm9240.c                            |   9 +-
 drivers/hwmon/adt7411.c                            | 301 +++++++-----
 drivers/hwmon/adt7462.c                            |  12 +-
 drivers/hwmon/adt7470.c                            |   6 +-
 drivers/hwmon/amc6821.c                            |   4 +-
 drivers/hwmon/coretemp.c                           | 321 +++++--------
 drivers/hwmon/ds620.c                              |   2 +-
 drivers/hwmon/emc2103.c                            |   4 +-
 drivers/hwmon/emc6w201.c                           |   8 +-
 drivers/hwmon/g762.c                               |  11 +-
 drivers/hwmon/hwmon.c                              |  79 +++-
 drivers/hwmon/lm85.c                               |   3 +-
 drivers/hwmon/lm87.c                               | 136 ++----
 drivers/hwmon/mcp3021.c                            |  50 +-
 drivers/hwmon/nct7802.c                            |   8 +-
 drivers/hwmon/pmbus/adm1275.c                      |  20 +-
 drivers/hwmon/scpi-hwmon.c                         |   1 +
 drivers/hwmon/smsc47m192.c                         |   5 +-
 drivers/hwmon/tc654.c                              | 514 +++++++++++++++++++++
 drivers/hwmon/tmp108.c                             | 469 +++++++++++++++++++
 drivers/hwmon/via-cputemp.c                        |  77 +--
 include/linux/hwmon.h                              |  31 +-
 32 files changed, 1695 insertions(+), 594 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
 create mode 100644 Documentation/hwmon/tc654
 create mode 100644 Documentation/hwmon/tmp108
 create mode 100644 drivers/hwmon/tc654.c
 create mode 100644 drivers/hwmon/tmp108.c
