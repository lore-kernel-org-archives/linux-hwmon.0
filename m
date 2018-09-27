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
Subject: [PATCH v6 0/2] Add an initial DT binding doc for ina3221
Date: Thu, 27 Sep 2018 12:49:08 -0700
Message-Id: <20180927194910.18464-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series adds a initial DT binding doc for ina3221. It defines
a child node to describe the input source of each ina3221 channel.
Then it changes the driver to handle the information properly.

Changelog
v5->v6:
 * Removed status property and merged examples (PATCH-1)
 * Added in[123]_enable sysfs nodes (PATCH-2)
v4->v5:
 * Changed two property names of child node (PATCH-1)
 * Changed the driver accordingly and simplified is_visible (PATCH-2)
v3->v4:
 * Fixed one place in child DT node bindings (PATCH-1)
 * Changed the driver accordingly and added is_visible (PATCH-2)
v2->v3:
 * Fixed two places in DT bindings (PATCH-1)
v1->v2:
 * Redefined DT bindings (detail in PATCH-1)
 * Changed the driver code accordingly (detail in PATCH-2)

Nicolin Chen (2):
  dt-bindings: hwmon: Add ina3221 documentation
  hwmon: ina3221: Read channel input source info from DT

 .../devicetree/bindings/hwmon/ina3221.txt     |  40 +++
 Documentation/hwmon/ina3221                   |   2 +
 drivers/hwmon/ina3221.c                       | 237 ++++++++++++++++--
 3 files changed, 265 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

-- 
2.17.1
