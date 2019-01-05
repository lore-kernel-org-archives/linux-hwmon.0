From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 16:50:38 -0800
Subject: [PATCH 1/2] dt-bindings: hwmon: ina3221: Add ti,single-shot property
In-Reply-To: <20190105004904.17947-1-nicoleotsuka@gmail.com>
Message-ID: <20190105004904.17947-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

By default, ina3221, as a hardware monitor, continuously measures
the inputs and generates corresponding data. However, for battery
powered devices, this mode might be power consuming.

This patch adds a "ti,single-shot" property to allow changing the
default continuous mode to single-shot operating mode.

Signed-off-by: Nicolin Chen <nicoleots...@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/ina3221.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt 
b/Documentation/devicetree/bindings/hwmon/ina3221.txt
index a7b25caa2b8e..fa63b6171407 100644
--- a/Documentation/devicetree/bindings/hwmon/ina3221.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
@@ -6,6 +6,16 @@ Texas Instruments INA3221 Device Tree Bindings
   - reg: I2C address
 
   Optional properties:
+  - ti,single-shot: This chip has two power modes: single-shot (chip takes one
+                    measurement and then shuts itself down) and continuous (
+                    chip takes continuous measurements). The continuous mode is
+                    more reliable and suitable for hardware monitor type 
device,
+                    but the single-shot mode is more power-friendly and useful
+                    for battery-powered device which cares power consumptions
+                    while still needs some measurements occasionally.
+                    If this property is present, the single-shot mode will be
+                    used, instead of the default continuous one for monitoring.
+
   = The node contains optional child nodes for three channels =
   = Each child node describes the information of input source =
 
-- 
2.17.1
