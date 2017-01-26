Return-path: <eajames.ibm@gmail.com>
From: eajames.ibm@gmail.com
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jdelvare@suse.com,
	corbet@lwn.net,
	mark.rutland@arm.com,
	robh+dt@kernel.org,
	=wsa@the-dreams.de,
	andrew@aj.id.au,
	joel@jms.id.au,
	benh@kernel.crashing.org,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v4 0/6] drivers: hwmon: Add On-Chip Controller drive
Date: Thu, 26 Jan 2017 17:19:12 -0600
Message-Id: <1485472758-11003-1-git-send-email-eajames.ibm@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
Controller). The OCC is an embedded processor that provides real time
power and thermal monitoring.

The driver provides an interface on a BMC to poll OCC sensor data, set
user power caps, and perform some basic OCC error handling. It interfaces
with userspace through hwmon.

The driver is currently functional only for the OCC on POWER8 chips.
Communicating with the POWER9 OCC requries FSI support.

Edward A. James (6):
  hwmon: Add core On-Chip Controller support for POWER CPUs
  hwmon: occ: Add sysfs interface
  hwmon: occ: Add I2C transport implementation for SCOM operations
  hwmon: occ: Add callbacks for parsing P8 OCC datastructures
  hwmon: occ: Add hwmon implementation for the P8 OCC
  hwmon: occ: Add callbacks for parsing P9 OCC datastructures

 Documentation/devicetree/bindings/hwmon/occ.txt |  13 +
 Documentation/hwmon/occ                         | 114 ++++++
 MAINTAINERS                                     |   7 +
 drivers/hwmon/Kconfig                           |   2 +
 drivers/hwmon/Makefile                          |   1 +
 drivers/hwmon/occ/Kconfig                       |  29 ++
 drivers/hwmon/occ/Makefile                      |   2 +
 drivers/hwmon/occ/occ.c                         | 479 ++++++++++++++++++++++++
 drivers/hwmon/occ/occ.h                         |  80 ++++
 drivers/hwmon/occ/occ_p8.c                      | 247 ++++++++++++
 drivers/hwmon/occ/occ_p8.h                      |  30 ++
 drivers/hwmon/occ/occ_p9.c                      | 308 +++++++++++++++
 drivers/hwmon/occ/occ_p9.h                      |  30 ++
 drivers/hwmon/occ/occ_scom_i2c.c                |  77 ++++
 drivers/hwmon/occ/occ_scom_i2c.h                |  26 ++
 drivers/hwmon/occ/occ_sysfs.c                   | 259 +++++++++++++
 drivers/hwmon/occ/occ_sysfs.h                   |  30 ++
 drivers/hwmon/occ/p8_occ_i2c.c                  | 104 +++++
 drivers/hwmon/occ/scom.h                        |  47 +++
 19 files changed, 1885 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
 create mode 100644 drivers/hwmon/occ/occ_sysfs.c
 create mode 100644 drivers/hwmon/occ/occ_sysfs.h
 create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c
 create mode 100644 drivers/hwmon/occ/scom.h

-- 
1.9.1
