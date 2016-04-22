Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [PATCH 00/11] Addition of Altera Arria10 System Resource Chip
Date: Fri, 22 Apr 2016 10:33:28 -0500
Message-ID: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

This patch series adds the SPI MultiFunction Device for the Altera System
Resource Chip for the Arria10 Developement Kit. The MFD implements GPIO
expansion and power supply alarms on an Altera MAX5.

Thor Thayer (11):
  dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
  MAINTAINERS: Add Altera Arria10 System Resource Chip
  mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource Chip
  gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
  ARM: socfpga: dts: Add SPI Master1 for Arria10 System Resource chip
  ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
  ARM: socfpga: dts: Add LED framework to A10-SR GPIO
  dt-bindings: mfd: Add Altera A10-SR power supply alarm
  mfd: altr_a10sr: Add Altera A10-SR power supply alarms
  hwmon: Add Altera A10-SR power supply alarms
  ARM: socfpga: dts: Add A10-SR Devkit power supply alarms

 .../devicetree/bindings/mfd/altera-a10sr.txt       |   43 ++++
 MAINTAINERS                                        |    8 +
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   15 ++
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |   44 ++++
 drivers/gpio/Kconfig                               |    8 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-altera-a10sr.c                   |  140 +++++++++++++
 drivers/hwmon/Kconfig                              |    9 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/altera-a10sr-hwmon.c                 |  215 ++++++++++++++++++++
 drivers/mfd/Kconfig                                |   11 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/altera-a10sr.c                         |  183 +++++++++++++++++
 include/linux/mfd/altera-a10sr.h                   |  111 ++++++++++
 14 files changed, 791 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
 create mode 100644 drivers/gpio/gpio-altera-a10sr.c
 create mode 100644 drivers/hwmon/altera-a10sr-hwmon.c
 create mode 100644 drivers/mfd/altera-a10sr.c
 create mode 100644 include/linux/mfd/altera-a10sr.h

-- 
1.7.9.5
