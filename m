Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: ina3221: Convert to using %pOFn instead of device_node.name
Date: Fri, 16 Nov 2018 16:05:38 -0600
Message-Id: <20181116220540.17222-2-robh@kernel.org>
In-Reply-To: <20181116220540.17222-1-robh@kernel.org>
References: <20181116220540.17222-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/hwmon/ina3221.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index d61688f04594..27abbc5b9d46 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -469,10 +469,10 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 
 	ret = of_property_read_u32(child, "reg", &val);
 	if (ret) {
-		dev_err(dev, "missing reg property of %s\n", child->name);
+		dev_err(dev, "missing reg property of %pOFn\n", child);
 		return ret;
 	} else if (val > INA3221_CHANNEL3) {
-		dev_err(dev, "invalid reg %d of %s\n", val, child->name);
+		dev_err(dev, "invalid reg %d of %pOFn\n", val, child);
 		return ret;
 	}
 
@@ -490,8 +490,8 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 	/* Overwrite default shunt resistor value optionally */
 	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
 		if (val < 1 || val > INT_MAX) {
-			dev_err(dev, "invalid shunt resistor value %u of %s\n",
-				val, child->name);
+			dev_err(dev, "invalid shunt resistor value %u of %pOFn\n",
+				val, child);
 			return -EINVAL;
 		}
 		input->shunt_resistor = val;
-- 
2.19.1
