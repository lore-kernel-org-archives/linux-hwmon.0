Return-Path: <mine260309@gmail.com>
Return-path: <mine260309@gmail.com>
From: Lei YU <mine260309@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jiri Kosina <trivial@kernel.org>
Cc: Lei YU <mine260309@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/3] Add W83773G hwmon sensor driver and doc
Date: Thu,  9 Nov 2017 15:08:58 +0800
Message-Id: <1510211341-17415-1-git-send-email-mine260309@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Nuvoton W83773G is a hardware monitoring chip, which integrates two remote
and one local temperature sensors.
---
v2:
 - The driver is re-written as v1's comment, so the author is changed to me.
 - Added the device to trivial-devices.txt
v3:
 - Update the driver to use new API devm_hwmon_device_register_with_info()

Lei YU (3):
  DT: i2c: W83773G is a trivial device
  drivers: hwmon: Add W83773G driver
  hwmon: (w83773g) Add documentation

 .../devicetree/bindings/trivial-devices.txt        |   1 +
 Documentation/hwmon/w83773g                        |  33 ++
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/w83773g.c                            | 348 +++++++++++++++++++++
 5 files changed, 393 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g
 create mode 100644 drivers/hwmon/w83773g.c

-- 
1.9.1
