Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34511 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752582AbcGYDHz (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 24 Jul 2016 23:07:55 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.8
Date: Sun, 24 Jul 2016 20:07:42 -0700
Message-Id: <1469416062-25032-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.8 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.8

Thanks,
Guenter
------

The following changes since commit 4c2e07c6a29e0129e975727b9f57eede813eea85:

  Linux 4.7-rc5 (2016-06-26 17:52:03 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.8

for you to fetch changes up to 1d3dd4ce210f347dd214913544e22fd9a8122901:

  Documentation: dtb: xgene: Add hwmon dts binding documentation (2016-07-21 14:58:57 -0700)

----------------------------------------------------------------
hwmon updates for v4.8

New drivers for FTS BMC "Teutates", TI INA3221, and Sensirion SHT3x.
Added support for Microchip MCP9808 and TI TMP461.
Cleanup and minor fixes in various drivers.

----------------------------------------------------------------
Alison Schofield (2):
      hwmon: (jc42) Add support for Microchip MCP9808 temperature sensor
      hwmon: (jc42) Add I2C_CLASS_HWMON to detection class

Andrea Gelmini (2):
      hwmon: (abituguru) Fix typos in documentation
      hwmon: (max1668) Fix typo in documentation

Andrew F. Davis (2):
      hwmon: (tmp401) Add support for TI TMP461
      hwmon: Add support for INA3221 Triple Current/Voltage Monitors

Axel Lin (3):
      hwmon: (ad7314) Convert to devm_hwmon_device_register_with_groups
      hwmon: (jz4740) Convert to devm_hwmon_device_register_with_groups
      hwmon: (ads7871) Convert to devm_hwmon_device_register_with_groups

Colin Ian King (1):
      hwmon: (emc6w201): trivial fix of spelling mistake "Unknwown" -> "Unknown"

David Frey (1):
      hwmon: add support for Sensirion SHT3x sensors

Guenter Roeck (19):
      hwmon: Update guildelines for submitting patches
      hwmon: (ina3221) Fix negative limits
      hwmon: (tmp102) Use devm_add_action to register cleanup function
      hwmon: (tmp102) Drop FSF address
      hwmon: (lm75) Handle cleanup with devm_add_action
      hwmon: (lm75) Drop lm75_read_value and lm75_write_value
      hwmon: (lm75) Add update_interval attribute
      hwmon: (lm75) Convert to use regmap
      hwmon: (lm90) Use devm_add_action for cleanup
      hwmon: (lm90) Use devm_hwmon_device_register_with_groups
      hwmon: (lm90) Simplify read functions
      hwmon: (lm90) Read limit registers only once
      hwmon: (lm90) Use bool for valid flag
      hwmon: (lm90) Drop unnecessary else statements
      hwmon: (tmp102) Improve handling of initial read delay
      hwmon: (tmp102) Rework chip configuration
      hwmon: (tmp102) Convert to use regmap, and drop local cache
      dt/bindings: Add bindings for JC-42.4 compatible temperature sensors
      hwmon: (jc42) Add support for generic JC-42.4 devicetree binding

Matt Ranostay (1):
      hwmon: (sht3x) add humidity heater element control

Michael Walle (1):
      hwmon: (adt7411) set bit 3 in CFG1 register

Pali Rohár (2):
      hwmon: (dell-smm) Detect fan with index=2
      hwmon: (dell-smm) In debug mode log duration of SMM calls

Thilo Cestonaro (1):
      hwmon: Add driver for FTS BMC chip "Teutates"

Wei Yongjun (1):
      hwmon: (ftsteutates) Remove unused including <linux/version.h>

hotran (1):
      Documentation: dtb: xgene: Add hwmon dts binding documentation

 .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt  |  14 +
 Documentation/devicetree/bindings/hwmon/jc42.txt   |  42 ++
 Documentation/hwmon/abituguru                      |   2 +-
 Documentation/hwmon/ftsteutates                    |  23 +
 Documentation/hwmon/ina3221                        |  35 +
 Documentation/hwmon/jc42                           |   3 +-
 Documentation/hwmon/max1668                        |   2 +-
 Documentation/hwmon/sht3x                          |  76 ++
 Documentation/hwmon/submitting-patches             |  40 +-
 Documentation/hwmon/tmp401                         |  14 +-
 drivers/hwmon/Kconfig                              |  42 +-
 drivers/hwmon/Makefile                             |   3 +
 drivers/hwmon/ad7314.c                             |  48 +-
 drivers/hwmon/ads7871.c                            |  65 +-
 drivers/hwmon/adt7411.c                            |   5 +-
 drivers/hwmon/dell-smm-hwmon.c                     |  41 +-
 drivers/hwmon/emc6w201.c                           |   2 +-
 drivers/hwmon/ftsteutates.c                        | 819 +++++++++++++++++++++
 drivers/hwmon/ina3221.c                            | 445 +++++++++++
 drivers/hwmon/jc42.c                               |  16 +-
 drivers/hwmon/jz4740-hwmon.c                       |  65 +-
 drivers/hwmon/lm75.c                               | 239 +++---
 drivers/hwmon/lm90.c                               | 447 ++++++-----
 drivers/hwmon/sht3x.c                              | 775 +++++++++++++++++++
 drivers/hwmon/tmp102.c                             | 247 +++----
 drivers/hwmon/tmp401.c                             |  35 +-
 include/linux/platform_data/sht3x.h                |  25 +
 27 files changed, 2964 insertions(+), 606 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/jc42.txt
 create mode 100644 Documentation/hwmon/ftsteutates
 create mode 100644 Documentation/hwmon/ina3221
 create mode 100644 Documentation/hwmon/sht3x
 create mode 100644 drivers/hwmon/ftsteutates.c
 create mode 100644 drivers/hwmon/ina3221.c
 create mode 100644 drivers/hwmon/sht3x.c
 create mode 100644 include/linux/platform_data/sht3x.h
