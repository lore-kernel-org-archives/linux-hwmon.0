Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	jdelvare@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	mspinler@linux.vnet.ibm.com,
	msbarth@linux.vnet.ibm.com,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] pmbus: Expand fan support and add MAX31785 driver
Date: Thu, 27 Jul 2017 18:15:51 +0930
Message-Id: <20170727084554.8794-1-andrew@aj.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

Hello,

Previously I'd posted a second RFC series implementing fan control support in
PMBus core and adding a driver for the MAX31785 fan controller:

  https://www.spinics.net/lists/kernel/msg2558128.html

I think the core changes have settled enough to move the effort out of RFC-land.

This series is some modest refinements on the core based on previous feedback,
and polishes the driver implementation by defining and implementing devicetree
bindings for the controller.

The series has been tested on a number of IBM Witherspoon systems, which
contain the fan controller of interest.

Please review!

Andrew

Changes between RFC v2 to (non-RFC) v1

* Clean up issues identified in comments on the pmbus core changes 
* Define and implement bindings for the MAX31785
* Clean up issues identified in comments on the max31785 driver

Andrew Jeffery (3):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 117 ++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 670 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 222 ++++++-
 6 files changed, 1034 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
