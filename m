Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	corbet@lwn.net
Cc: afd@ti.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2]  Add an initial DT binding doc for ina3221
Date: Fri, 21 Sep 2018 15:32:14 -0700
Message-Id: <20180921223216.634-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series adds a initial DT binding doc for ina3221. It defines
a child node to describe the input source of each ina3221 channel.
Then it changes the driver to handle the information properly.

Changelog
v2->v3:
 * Fixed two places in DT bindings (PATCH-1)
v1->v2:
 * Redefined DT bindings (detail in PATCH-1)
 * Changed the driver code accordingly (detail in PATCH-2)

Nicolin Chen (2):
  dt-bindings: hwmon: Add ina3221 documentation
  hwmon: ina3221: Read channel input source info from DT

 .../devicetree/bindings/hwmon/ina3221.txt     |  38 ++++++
 Documentation/hwmon/ina3221                   |   1 +
 drivers/hwmon/ina3221.c                       | 126 ++++++++++++++++--
 3 files changed, 155 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

-- 
2.17.1
