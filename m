Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
        benh@kernel.crashing.org, linux@roeck-us.net, jdelvare@suse.com,
        mark.rutland@arm.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
        joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v4 0/9] hwmon and fsi: Add On-Chip Controller (OCC) driver
Date: Wed, 11 Jul 2018 16:01:29 -0500
Message-Id: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series adds a hwmon driver to support the OCC on POWER8 and POWER9
processors. The OCC is an embedded processor that provides realtime power and
thermal monitoring and management.

The series also adds a "bus" driver to handle atomic communication between the
service processor and the OCC on a POWER9 chip. This communication takes place
over FSI bus to the SBE (Self-Boot engine) FIFO, which in turn communicates
with the OCC. The driver for the SBEFIFO is already in linux-next as an FSI
client driver.

For POWER8 OCCs, communication between the service processor and the OCC is
achieved over I2C bus.

Changes since v3:
 * Add the FSI OCC driver.
 * Pull the sysfs attribute code into it's own file for cleanliness.
 * Various fixes for attribute creation and integer overflow.

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

Eddie James (9):
  fsi: Add On-Chip Controller (OCC) driver
  Documentation: hwmon: Add OCC documentation
  dt-bindings: i2c: Add P8 OCC hwmon device documentation
  hwmon: Add On-Chip Controller (OCC) hwmon driver
  hwmon (occ): Add command transport method for P8 and P9
  hwmon (occ): Parse OCC poll response
  hwmon (occ): Add sensor types and versions
  hwmon (occ): Add sensor attributes and register hwmon device
  hwmon (occ): Add sysfs attributes for additional OCC data

 .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
 Documentation/hwmon/occ                            |   73 ++
 drivers/fsi/Kconfig                                |   10 +
 drivers/fsi/Makefile                               |    1 +
 drivers/fsi/fsi-occ.c                              |  609 ++++++++++
 drivers/hwmon/Kconfig                              |    2 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/occ/Kconfig                          |   28 +
 drivers/hwmon/occ/Makefile                         |   11 +
 drivers/hwmon/occ/common.c                         | 1250 ++++++++++++++++++++
 drivers/hwmon/occ/common.h                         |  136 +++
 drivers/hwmon/occ/p8_i2c.c                         |  264 +++++
 drivers/hwmon/occ/p9_sbe.c                         |  115 ++
 drivers/hwmon/occ/sysfs.c                          |  188 +++
 include/linux/fsi-occ.h                            |   34 +
 15 files changed, 2747 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/fsi/fsi-occ.c
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/common.c
 create mode 100644 drivers/hwmon/occ/common.h
 create mode 100644 drivers/hwmon/occ/p8_i2c.c
 create mode 100644 drivers/hwmon/occ/p9_sbe.c
 create mode 100644 drivers/hwmon/occ/sysfs.c
 create mode 100644 include/linux/fsi-occ.h

-- 
1.8.3.1
