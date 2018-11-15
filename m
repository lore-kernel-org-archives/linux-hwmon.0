Return-Path: <fe@dev.tdt.de>
Return-path: <fe@dev.tdt.de>
From: Florian Eckert <fe@dev.tdt.de>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH v3 0/2] hwmon: Add device tree support for adcxx
Date: Thu, 15 Nov 2018 14:50:11 +0100
Message-Id: <20181115135013.30723-1-fe@dev.tdt.de>
List-ID: <linux-hwmon@vger.kernel.org>

Changes v2:
- Use regular voltag binding

Changes v3:
--nothing--

No progress or feed back so try to get this upstream again.

Florian Eckert (2):
  hwmon: (adcxx) add devictree bindings documentation
  hwmon: (adcxx) Add device tree support

 Documentation/devicetree/bindings/hwmon/adcxx.txt | 24 +++++++++
 drivers/hwmon/adcxx.c                             | 62 ++++++++++++++++++++---
 2 files changed, 79 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt

-- 
2.11.0
