Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v5 0/3] hwmon: (pmbus): Add IBM Common Form Factor (CFF) power supply driver
Date: Mon, 21 Aug 2017 14:46:10 -0500
Message-Id: <1503344773-7236-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for a POWER System power supply. The
core monitoring functionality is provided by pmbus.

Changes since v4:
 * Relocate dt bindings documentation under hwmon.

Changes since v3:
 * Change "fault" to "alarm" in the documentation.

Changes since v2:
 * Renamed the driver again...
 * Remove debugfs bool from pmbus_driver_info.
 * Add comment for returning rc when reading STATUS_MFR_SPECIFIC fails.

Since v1:
 * Renamed the driver.
 * Removed non-hwmon attributes.
 * Simplified word and byte data reads.

Edward A. James (3):
  dt-bindings: hwmon: Document the IBM CCF power supply version 1
  hwmon: (pmbus): Add IBM Common Form Factor (CFF) power supply driver
  Documentation: hwmon: Document the IBM CFF power supply

 .../devicetree/bindings/hwmon/ibm,cffps1.txt       |  21 +++
 Documentation/hwmon/ibm-cffps                      |  54 ++++++++
 drivers/hwmon/pmbus/Kconfig                        |  10 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/ibm-cffps.c                    | 151 +++++++++++++++++++++
 5 files changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
 create mode 100644 Documentation/hwmon/ibm-cffps
 create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c

-- 
1.8.3.1
