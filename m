Return-path: <chrisp@alliedtelesis.co.nz>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org,
	linux@roeck-us.net
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 0/2] lm87 configuration from dts
Date: Fri, 31 Mar 2017 12:00:58 +1300
Message-Id: <20170330230100.989-1-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

I've picked these changes up from Mahoda to hopefully get them landed
upstream.

Technically this is v5 of the documentation patch and v3 of the driver
changes but I'm bundling them as v5 of the series.

Mahoda Ratnayaka (2):
  Documentation: dtb: lm87: Add hwmon binding documentation
  lm87: Allow channel data to be set from dts file

 Documentation/devicetree/bindings/hwmon/lm87.txt | 30 ++++++++++++++++++++++++
 drivers/hwmon/lm87.c                             | 23 ++++++++++++++++--
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

-- 
2.11.0.24.ge6920cf
