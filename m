Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	jdelvare@suse.com,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/6] pmbus: Expand fan support and add MAX31785 driver
Date: Fri,  3 Nov 2017 15:53:00 +1100
Message-Id: <20171103045306.26448-1-andrew@aj.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

Hello,

This series introduces support for the MAX31785 intelligent fan controller, a
PMBus device providing closed-loop fan control among a number of other
features. Along the way the series adds support to control fans and create
virtual pages to the PMBus core, the latter to support some of the more
annoying design decisions found in the 'A' variant of the chip.

This is the fourth spin of the series, v3 can be found here[1].

I've been running aground with the described devicetree bindings in the
previous iterations, so in order to get *some* support upstream I've gutted the
documentation and removed the corresponding support from the driver. I'll save
posting that for a later date once Guenter and I have some input from Rob about
what direction to take with respect to describing PMBus devices.

As mentioned, adding full support for the features of the MAX31785 requires
modifications to the PMBus core, so I've split the addition of features into
separate patches, in the hope that some can be incrementally applied while we
iterate on the details of any suboptimal parts.

Please review!

Andrew

[1] https://lkml.org/lkml/2017/9/8/4

Andrew Jeffery (6):
  dt-bindings: pmbus: Add Maxim MAX31785 documentation
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
  pmbus: core: Add fan control support
  pmbus: max31785: Add fan control
  pmbus: core: Add virtual page config bit
  pmbus: max31785: Add dual tachometer support

 .../devicetree/bindings/hwmon/max31785.txt         |  22 ++
 Documentation/hwmon/max31785                       |  57 ++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 375 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  31 ++
 drivers/hwmon/pmbus/pmbus_core.c                   | 236 +++++++++++--
 7 files changed, 713 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
 create mode 100644 Documentation/hwmon/max31785
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
