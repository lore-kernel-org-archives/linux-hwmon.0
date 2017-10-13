Return-Path: <peda@axentia.se>
Return-path: <peda@axentia.se>
From: Peter Rosin <peda@axentia.se>
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Russell King <linux@armlinux.org.uk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] Sluggish AT91 I2C driver causes SMBus timeouts
Date: Fri, 13 Oct 2017 11:27:03 +0200
Message-Id: <20171013092705.7038-1-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Hi!

This is a workaround for a problem in the AT91 I2C adapter driver
(or perhaps the hardware?) when it drives the TWI peripheral on an
Atmel sama5d3 chip as I2C.

Apparently, that driver can delay in excess of 100 ms just after
the transfer of the 7th bit of the last byte. When it does this
the I2C bus, when viewed from SMBUS client devices, appears
stuck with SCL low. Some SMBUS devices times out under these
conditions, in particular temperature sensors. The I2C adapter
driver does however not notice the timeout, and thinks the transfer
completed successfully when it finally desides to finish the
transaction. When this happens, the 8th bit of the last byte is
always set, and thus quite possibly corrupted.

The chip this was observed with (an nxp SE97) has a means to disable
the SMBUS timeout detector, which "fixes" things. Do that.

This should probably go to stable?

Previous discussion: https://lkml.org/lkml/2017/10/12/227

Cheers,
Peter

Peter Rosin (2):
  hwmon: (jc42) optionally try to disable the SMBUS timeout
  ARM: dts: at91: disable the nxp,se97b SMBUS timeout on the TSE-850

 Documentation/devicetree/bindings/hwmon/jc42.txt |  4 ++++
 arch/arm/boot/dts/at91-tse850-3.dts              |  1 +
 drivers/hwmon/jc42.c                             | 20 ++++++++++++++++++++
 3 files changed, 25 insertions(+)

-- 
2.11.0
