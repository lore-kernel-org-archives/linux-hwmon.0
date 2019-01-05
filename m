From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 19:07:47 -0800
Subject: [PATCH v2 0/2] hwmon (ina3221) Add single-shot mode support
Message-ID: <20190105030636.533-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

By default, ina3221, as a hardware monitor, continuously measures
the inputs and generates corresponding data. However, for battery
powered devices, this mode might be power consuming.

This series of patches add a feature of changing default operating
mode to its single-shot mode via DT.

Changelog
v1->v2:
 * Cleaned-up PATCH-2

Nicolin Chen (2):
  dt-bindings: hwmon: ina3221: Add ti,single-shot property
  hwmon: (ina3221) Implement ti,single-shot DT property

 .../devicetree/bindings/hwmon/ina3221.txt     | 10 ++++++++++
 drivers/hwmon/ina3221.c                       | 20 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.17.1
