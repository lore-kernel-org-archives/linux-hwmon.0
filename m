Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43023 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754141AbdKCExv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 3 Nov 2017 00:53:51 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net,
        robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        corbet@lwn.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v4 1/6] dt-bindings: pmbus: Add Maxim MAX31785 documentation
Date: Fri,  3 Nov 2017 15:53:01 +1100
Message-Id: <20171103045306.26448-2-andrew@aj.id.au>
In-Reply-To: <20171103045306.26448-1-andrew@aj.id.au>
References: <20171103045306.26448-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/hwmon/max31785.txt         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
new file mode 100644
index 000000000000..106e08c56aaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max31785.txt
@@ -0,0 +1,22 @@
+Bindings for the Maxim MAX31785 Intelligent Fan Controller
+==========================================================
+
+Reference:
+
+https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+
+The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
+management with temperature and remote voltage sensing. Various fan control
+features are provided, including PWM frequency control, temperature hysteresis,
+dual tachometer measurements, and fan health monitoring.
+
+Required properties:
+- compatible     : One of "maxim,max31785" or "maxim,max31785a"
+- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
+
+Example:
+
+        fans@52 {
+                compatible = "maxim,max31785";
+                reg = <0x52>;
+        };
-- 
2.11.0

