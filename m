Return-Path: <mfe@pengutronix.de>
Return-path: <mfe@pengutronix.de>
From: Marco Felsch <m.felsch@pengutronix.de>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	tpiepho@impinj.com,
	dmitry.torokhov@gmail.com,
	kernel@pengutronix.de
Subject: [PATCH v2 0/2] Add GPIO brownout detection support
Date: Mon, 29 Oct 2018 15:35:19 +0100
Message-Id: <20181029143521.22122-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi,

this is my v2 of my v1 [1]. I converted the driver from the input to the
hwmon framework, as proposed by Trent [2]. Futhermore I droped the OF
dependency for the core functionality (sensing the gpio) and moved the
addtional feature (unbinding devices) to a additional config. So the
dependencies are much cleaner.

The spi patches are already applied by Mark so I dropped them in my v2.
You have to apply the patche from Marks Git:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-find-by-node

to get the patch stack compiled.

I rebased the series on top of Guenter's hwmon-next branch and checked
it by checkpatch. Unfortunately it complains about a missing help
paragraph for SENSORS_GPIO_BROWNOUT_UNBIND, but the help exists.

Regards,
Marco

[1] https://patchwork.kernel.org/cover/10613821/
[2] https://patchwork.kernel.org/patch/10613825/

Marco Felsch (2):
  dt-binding: hwmon: add gpio-brownout bindings
  hwmon: add generic GPIO brownout support

 .../bindings/hwmon/gpio-brownout.txt          |  32 +++
 Documentation/hwmon/gpio-brownout             |  14 ++
 drivers/hwmon/Kconfig                         |  23 +++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/gpio-brownout.c                 | 195 ++++++++++++++++++
 5 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/gpio-brownout.txt
 create mode 100644 Documentation/hwmon/gpio-brownout
 create mode 100644 drivers/hwmon/gpio-brownout.c

-- 
2.19.1
