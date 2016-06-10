Return-path: <>
From: "Andrew F. Davis" <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Laxman Dewangan <ldewangan@nvidia.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v5 0/1] Add support for INA3221 Triple Current/Voltage Monitors
Date: Fri, 10 Jun 2016 10:32:32 -0500
Message-ID: <20160610153233.6169-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Hello all,

This series adds support for the INA3221 Triple Current/Voltage Monitor.

Changes from v4:
 - Drop DT support, will be added by Laxman in followup patches

Changes from v3:
 - minor fixups from comments
 - rebased on v4.7-rc1

Changes from v2:
 - changed alarms to work on current
 - added of_match_table
 - other small fixups/typos

Changes from v1:
 - rearranged and renumbered sysfs enteries
 - added reading alert bits to sysfs
 - removed internal power calculation
 - added DT setting of shunt resistors
 - various other minor fixups

Thanks,
Andrew

Andrew F. Davis (1):
  hwmon: Add support for INA3221 Triple Current/Voltage Monitors

 Documentation/hwmon/ina3221 |  35 ++++
 drivers/hwmon/Kconfig       |  11 ++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/ina3221.c     | 446 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 493 insertions(+)
 create mode 100644 Documentation/hwmon/ina3221
 create mode 100644 drivers/hwmon/ina3221.c

-- 
2.8.3
