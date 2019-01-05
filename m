From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 16:50:27 -0800
Subject: [PATCH 0/2] hwmon (ina3221) Add single-shot mode support
Message-ID: <20190105004904.17947-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

By default, ina3221, as a hardware monitor, continuously measures
the inputs and generates corresponding data. However, for battery
powered devices, this mode might be power consuming.

This series of patches add a feature of changing default operating
mode to its single-shot mode via DT.

Nicolin Chen (2):
  dt-bindings: hwmon: ina3221: Add ti,single-shot property
  hwmon: (ina3221) Implement ti,single-shot DT property

 .../devicetree/bindings/hwmon/ina3221.txt     | 10 +++++++
 drivers/hwmon/ina3221.c                       | 28 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.17.1
