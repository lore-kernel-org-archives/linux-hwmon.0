Return-path: <john@jmuir.com>
From: John Muir <john@jmuir.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: John Muir <john@jmuir.com>,
	Anatol Pomazau <anatol@google.com>,
	Mark Segal <segal@google.com>
Subject: [PATCH v2 0/2] Add Maxim Integrated MAX31760 fan controller driver.
Date: Tue, 11 Apr 2017 14:32:16 -0700
Message-Id: <20170411213218.138718-1-john@jmuir.com>
In-Reply-To: <20170404192034.158901-1-john@jmuir.com>
References: <20170404192034.158901-1-john@jmuir.com>
List-ID: <linux-hwmon@vger.kernel.org>

Add a device driver for the MAX31760 I2C device with a hwmon interface and
a few open firmware device properties.

v2:
- Fixup device tree binding documentation.
- max32760: Fix OF code and add some comments.

John Muir (2):
  hwmon: Add MAX31760 fan controller driver.
  devicetree: Document the max31760 device binding.

 .../devicetree/bindings/hwmon/max31760.txt         |   72 +
 Documentation/hwmon/max31760                       |   41 +
 drivers/hwmon/Kconfig                              |   10 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/max31760.c                           | 1461 ++++++++++++++++++++
 5 files changed, 1585 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt
 create mode 100644 Documentation/hwmon/max31760
 create mode 100644 drivers/hwmon/max31760.c

-- 
2.12.2.715.g7642488e1d-goog
