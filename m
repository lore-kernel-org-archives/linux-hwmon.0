Return-path: <>
From: "Andrew F. Davis" <afd@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
        Mark
 Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>
CC: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F .
 Davis" <afd@ti.com>
Subject: [PATCH v4 0/2] Add support for INA3221 Triple Current/Voltage Monitors
Date: Tue, 31 May 2016 13:37:09 -0500
Message-ID: <20160531183711.9048-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Hello all,

This series adds support for the INA3221 Triple Current/Voltage Monitor.

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

Andrew F. Davis (2):
  hwmon: Define binding for the INA3221 hwmon driver
  hwmon: Add support for INA3221 Triple Current/Voltage Monitors

 .../devicetree/bindings/hwmon/ina3221.txt          |  19 +
 Documentation/hwmon/ina3221                        |  35 ++
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/ina3221.c                            | 451 +++++++++++++++++++++
 5 files changed, 517 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
 create mode 100644 Documentation/hwmon/ina3221
 create mode 100644 drivers/hwmon/ina3221.c

-- 
2.8.3
