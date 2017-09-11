Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jiri@resnulli.us,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 2/2] dt-bindings: hwmon: add binding documentation for max6621 device
Date: Mon, 11 Sep 2017 10:45:25 +0000
Message-Id: <1505126725-4336-3-git-send-email-vadimp@mellanox.com>
In-Reply-To: <1505126725-4336-1-git-send-email-vadimp@mellanox.com>
References: <1505126725-4336-1-git-send-email-vadimp@mellanox.com>
List-ID: <linux-hwmon@vger.kernel.org>

Add binding document for Maxim MAX6621 temperature sensor device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/devicetree/bindings/hwmon/max6621.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max6621.txt b/Documentation/devicetree/bindings/hwmon/max6621.txt
new file mode 100644
index 0000000..c1f7e95
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max6621.txt
@@ -0,0 +1,14 @@
+MAX6621 temperature sensor
+-------------------------
+
+This device supports I2C only.
+
+Requires node properties:
+- compatible : "maxim,max6621"
+- reg : the I2C address of the device.
+
+Example:
+	max6621@2b {
+		compatible = "maxim,max6621";
+		reg = <0x2b>;
+	};
-- 
2.1.4
