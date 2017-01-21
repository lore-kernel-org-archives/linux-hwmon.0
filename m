Return-path: <f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH 0/2] hwmon: (lm70) Couple patches
Date: Sat, 21 Jan 2017 11:20:08 -0800
Message-Id: <20170121192010.30681-1-f.fainelli@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

Here are a couple of patches against lm70. I plan on submitting
support for configurable thresholds on TI TMP122/124 once I have
resolved the lack SPI_3WIRE on the controller that connects to
this chip on my board.

Thanks!

Florian Fainelli (2):
  hwmon: (lm70) Utilize dev_warn instead of pr_warn
  hwmon: (lm70) Add support for TI TMP122/124

 Documentation/devicetree/bindings/hwmon/lm70.txt |  1 +
 Documentation/hwmon/lm70                         |  8 ++++++--
 drivers/hwmon/lm70.c                             | 12 ++++++++++--
 3 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.9.3
