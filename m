Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 0/4] drivers/hwmon/pmbus: Add IBM power supply hwmon driver
Date: Wed,  2 Aug 2017 16:17:09 -0500
Message-Id: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for an IBM power supply. The core
monitoring functionality is provided by pmbus. The driver also exports some
sysfs entries for raw status register access and the ability to clear faults.

Edward A. James (4):
  drivers/hwmon/pmbus: Add IBM power supply hwmon driver
  drivers/hwmon/pmbus: ibmps: Add non-hwmon attributes
  Documentation: hwmon: Add IBM power supply documentation
  Documentation: ABI: Add IBM power supply sysfs documentation

 Documentation/ABI/testing/sysfs-driver-ibmps |  49 ++++++
 Documentation/hwmon/ibmps                    |  53 ++++++
 drivers/hwmon/pmbus/Kconfig                  |  10 ++
 drivers/hwmon/pmbus/Makefile                 |   1 +
 drivers/hwmon/pmbus/ibmps.c                  | 242 +++++++++++++++++++++++++++
 5 files changed, 355 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps
 create mode 100644 Documentation/hwmon/ibmps
 create mode 100644 drivers/hwmon/pmbus/ibmps.c

-- 
1.8.3.1
