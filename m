Return-path: <chrisp@alliedtelesis.co.nz>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	jdelvare@suse.com
Subject: [RFC PATCH v2 0/3] hwmon: (adt7475) small enhancements
Date: Wed,  3 May 2017 12:40:06 +1200
Message-Id: <20170503004009.23769-1-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

This is a series of small enhancements to the adt7475 driver. We're using an
adt7476 chip in several network switches and generally speaking the
requirement for this type of equipment is to keep the fan moving so that we
know it is working when we need it.

Chris Packham (3):
      hwmon: (adt7475) replace find_nearest() with find_closest()
      hwmon: (adt7475) fan stall prevention
      hwmon: (adt7475) temperature smoothing

 Documentation/hwmon/adt7475 |   9 +++
 drivers/hwmon/adt7475.c     | 149 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)
