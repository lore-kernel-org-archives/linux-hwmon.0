Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 00/12] hwmon: Add On-Chip Controller hwmon driver
Date: Mon, 20 Nov 2017 17:53:29 -0600
Message-Id: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon driver to support the OCC on POWER8 and POWER9
processors. The OCC is an embedded processor that provides realtime power and
thermal monitoring and management.

This driver has two different platform drivers as a "base" for the
hwmon interface, as the means of communicating with the OCC on P8 and P9 is
completely different. For P8, the driver is an I2C client driver. For P9 the
driver is an FSI-based OCC client driver, and uses the OCC driver in-kernel
API. The OCC driver is on the LKML (latest https://lkml.org/lkml/2017/11/20/631).

Changes since v2:
 * Add sysfs_notify for the error and throttling attributes when change is
   detected.
 * Removed occs_present counting of devices bound.
 * Improved remove() of P9 driver to avoid bad behavior with relation to OCC
   driver when unbound.
 * Added default cases (return EINVAL) for all sensor show functions.
 * Added temperature fault sensor.
 * Added back dt binding documentation for P9 to address checkpatch warning.
 * Added occs_present attribute from the poll response.

Changes since v1:
 * Remove wait loop in P9 code, as that is now handled by FSI OCC driver.
 * Removed dt binding documentation for P9, FSI OCC driver will probe OCC hwmon
   driver automatically.
 * Moved OCC response code definitions to the OCC include file.
 * Fixed includes.
 * Changed some structure fields to __beXX as that is what they are.
 * Changed some errnos.
 * Removed some dev_err().
 * Refactored P8 code a bit to use #defined addresses and magic values, and
   changed "goto retry" to a loop.
 * Refactored error handling a bit.

Edward A. James (12):
  Documentation: hwmon: Add OCC documentation
  Documentation: ABI: Add occ-hwmon driver sysfs documentation
  dt-bindings: i2c: Add P8 OCC hwmon device documentation
  dt-bindings: fsi: Add P9 OCC hwmon device documentation
  hwmon (occ): Add On-Chip Controller (OCC) hwmon driver
  hwmon (occ): Add command transport method for P8 and P9
  hwmon (occ): Parse OCC poll response
  hwmon (occ): Add sensor types and versions
  hwmon (occ): Add sensor attributes and register hwmon device
  hwmon (occ): Add non-hwmon attributes
  hwmon (occ): Add error handling
  hwmon (occ): Add sysfs notification for errors and throttling

 Documentation/ABI/testing/sysfs-driver-occ-hwmon   |   85 ++
 .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt   |   16 +
 .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
 Documentation/hwmon/occ                            |   75 ++
 drivers/hwmon/Kconfig                              |    2 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/occ/Kconfig                          |   28 +
 drivers/hwmon/occ/Makefile                         |   11 +
 drivers/hwmon/occ/common.c                         | 1387 ++++++++++++++++++++
 drivers/hwmon/occ/common.h                         |  124 ++
 drivers/hwmon/occ/p8_i2c.c                         |  262 ++++
 drivers/hwmon/occ/p9_sbe.c                         |  161 +++
 12 files changed, 2177 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/common.c
 create mode 100644 drivers/hwmon/occ/common.h
 create mode 100644 drivers/hwmon/occ/p8_i2c.c
 create mode 100644 drivers/hwmon/occ/p9_sbe.c

-- 
1.8.3.1
