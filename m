Return-path: <chrisp@alliedtelesis.co.nz>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org,
	linux@roeck-us.net
Cc: Tobi Wulff <tobi.wulff@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/4] hwmon: (adt7475) small enhancements
Date: Thu, 11 May 2017 15:45:20 +1200
Message-Id: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

This is a series of small enhancements to the adt7475 driver. We're using an
adt7476 chip in several network switches and generally speaking the
requirement for this type of equipment is to keep the fan moving so that we
know it is working when we need it.

I think the only contentious one is 2/4. The desire to keep the fans running is
understood but the attribute/implementation are being debated.

I think the others stand on their own merits.

Chris Packham (4):
  hwmon: (adt7475) replace find_nearest() with find_closest()
  hwmon: (adt7475) fan stall prevention
  hwmon: (adt7475) temperature smoothing
  hwmon: (adt7475) add high frequency support

 Documentation/hwmon/adt7475 |   9 +++
 drivers/hwmon/adt7475.c     | 186 +++++++++++++++++++++++++++++++++++---------
 2 files changed, 160 insertions(+), 35 deletions(-)

-- 
2.11.0.24.ge6920cf
