Return-Path: <mine260309@gmail.com>
Return-path: <mine260309@gmail.com>
From: Lei YU <mine260309@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Lei YU <mine260309@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] Add W83773G hwmon sensor driver and doc
Date: Thu,  2 Nov 2017 14:33:56 +0800
Message-Id: <1509604438-19959-1-git-send-email-mine260309@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Nuvoton W83773G is a hardware monitoring chip, which integrates two remote
and one local temperature sensors.

Lei YU (2):
  drivers: hwmon: Add W83773G driver
  hwmon: (w83773g) Add documentation

 Documentation/hwmon/w83773g |  28 +++++
 drivers/hwmon/Kconfig       |  11 ++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/w83773g.c     | 276 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 316 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g
 create mode 100644 drivers/hwmon/w83773g.c

-- 
1.9.1
