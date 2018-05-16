Return-Path: <stefan.wahren@i2se.com>
Return-path: <stefan.wahren@i2se.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Phil Elwell <phil@raspberrypi.org>,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/6] hwmon: Add support for Raspberry Pi voltage sensor
Date: Wed, 16 May 2018 15:37:01 +0200
Message-Id: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

A common issue for the Raspberry Pi is an inadequate power supply. 
Noralf Trønnes started a discussion [1] about writting such under-voltage
conditions into the kernel log.

This series is a draft to upstream the resulting kernel patch and is not
intended for 4.18.

[1] - https://github.com/raspberrypi/linux/issues/2367

Stefan Wahren (6):
  ARM: bcm2835: Add GET_THROTTLED firmware property
  dt-bindings: hwmon: Add Raspberry Pi voltage sensor
  hwmon: Add support for RPi voltage sensor
  ARM: bcm2835_defconfig: Enable RPi voltage sensor
  ARM: multi_v7_defconfig: Enable RPi voltage sensor
  arm64: defconfig: Enable RPi voltage sensor

 .../bindings/hwmon/raspberrypi-hwmon.txt           |  19 ++
 arch/arm/configs/bcm2835_defconfig                 |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/raspberrypi-hwmon.c                  | 207 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
 8 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
 create mode 100644 drivers/hwmon/raspberrypi-hwmon.c

-- 
2.7.4
