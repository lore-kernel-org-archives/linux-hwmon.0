Return-path: <john@jmuir.com>
From: John Muir <john@jmuir.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	John Muir <john@jmuir.com>,
	John Muir <muirj@google.com>,
	Anatol Pomazau <anatol@google.com>
Subject: [PATCH v2 0/2] Texas Instruments TMP108 temperature sensor driver.
Date: Wed, 30 Nov 2016 12:36:17 -0800
Message-Id: <1480538179-75901-1-git-send-email-john@jmuir.com>
In-Reply-To: <1480209983-65915-1-git-send-email-john@jmuir.com>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
List-ID: <linux-hwmon@vger.kernel.org>

This adds a device driver for the Texas Instruments TMP108 temperature
sensor. The driver provides support to read the temperature, read or modify
the update interval, min and max temperature and hysteresis values, as well
as read current alarm status. Support for alarm interrupts will come in a
future patch.

John Muir (2):
  hwmon: Add Texas Instruments TMP108 temperature sensor driver.
  devicetree: hwmon: Add documentation for TMP108 driver.

 Documentation/devicetree/bindings/hwmon/tmp108.txt |  24 +
 Documentation/hwmon/tmp108                         |  38 ++
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/tmp108.c                             | 495 +++++++++++++++++++++
 5 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
 create mode 100644 Documentation/hwmon/tmp108
 create mode 100644 drivers/hwmon/tmp108.c

-- 
2.8.0.rc3.226.g39d4020
