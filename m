Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38033 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751738AbcEPNsj (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 16 May 2016 09:48:39 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.7
Date: Mon, 16 May 2016 06:48:30 -0700
Message-Id: <1463406510-19848-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.7 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.7

Thanks,
Guenter
------

The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.7

for you to fetch changes up to d6a442df63b2f0043c0b4fc05504ac4ded96ae80:

  hwmon: (sch5636) trivial fix of spelling mistake on revision (2016-04-25 07:26:29 -0700)

----------------------------------------------------------------
hwmon updates for v4.7

- Major rework of it87 driver
  cleanup, added support for additional attributes,
  added support for two chips in the system, added support for IT8728E
- fam17h_power driver now reports accumulated power consumption
- New driver for MAX31722/MAX31723 temperature sensors
- Minor fixes to sch5636 and ads7828 drivers

----------------------------------------------------------------
Akshay Bhat (1):
      hwmon: (ads7828) Enable internal reference

Colin Ian King (1):
      hwmon: (sch5636) trivial fix of spelling mistake on revision

Guenter Roeck (26):
      hwmon: (ltc2978) Add missing devicetree binding for LTM4675
      hwmon: (it87) Add feature flag for AVCC3 support
      hwmon: (it87) Add support for all pwm channels on IT8620E
      hwmon: (it87) Add support for second pwm frequency register
      hwmon: (it87) Simplify error return in it87_device_add
      hwmon: (it87) Don't use pdev as static driver variable
      hwmon: (it87) Pass SIO base address as parameter to superio functions
      hwmon: (it87) Add support for second Super-IO chip
      hwmon: (it87) Rearrange code to avoid forward declarations
      hwmon: (it87) Use is_visible for voltage sensors
      hwmon: (it87) Use is_visible for temperature sensors
      hwmon: (it87) Use is_visible for fan attributes
      hwmon: (it87) Use is_visible for pwm attributes
      hwmon: (it87) Use single group and is_visible for miscellaneous attributes
      hwmon: (it87) Convert to use new hwmon API
      hwmon: (it87) Support up to 6 temperature sensors on IT8620E
      hwmon: (it87) Simplify reading voltage registers
      hwmon: (it87) Add support for VIN7 to VIN10 on IT8620E
      hwmon: (it87) Use BIT macro
      hwmon: (it87) Use defines for array sizes and sensor counts
      hwmon: (it87) Formatting cleanup
      hwmon: (it87) Support disabling fan control for all pwm control and chips
      hwmon: (it87) Enhance validation for fan4 and fan5
      hwmon: (it87) Support automatic pwm control on newer chips
      hwmon: (it87) Fix pwm_temp_map for system with 6 pwm channels
      hwmon: (it87) Add support for IT8628E

Huang Rui (6):
      hwmon: (fam15h_power) Add CPU_SUP_AMD as the dependence
      hwmon: (fam15h_power) Add compute unit accumulated power
      hwmon: (fam15h_power) Add ptsc counter value for accumulated power
      hwmon: (fam15h_power) Introduce a cpu accumulated power reporting algorithm
      hwmon: (fam15h_power) Add documentation for TDP and accumulated power algorithm
      hwmon: (fam15h_power) Add platform check function

Tiberiu Breana (1):
      hwmon: (max31722) Add support for MAX31722/MAX31723 temperature sensors

 .../devicetree/bindings/hwmon/ltc2978.txt          |    1 +
 Documentation/hwmon/fam15h_power                   |   65 +-
 Documentation/hwmon/it87                           |   15 +-
 Documentation/hwmon/max31722                       |   34 +
 drivers/hwmon/Kconfig                              |   15 +-
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ads7828.c                            |   10 +
 drivers/hwmon/fam15h_power.c                       |  215 +-
 drivers/hwmon/it87.c                               | 2281 +++++++++++---------
 drivers/hwmon/max31722.c                           |  165 ++
 drivers/hwmon/sch5636.c                            |    2 +-
 11 files changed, 1794 insertions(+), 1010 deletions(-)
 create mode 100644 Documentation/hwmon/max31722
 create mode 100644 drivers/hwmon/max31722.c
