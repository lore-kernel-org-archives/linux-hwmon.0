Return-path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	Jean Delvare <jdelvare@suse.com>,
	Peter Rosin <peda@axentia.se>,
	Avirup Banerjee <abanerjee@juniper.net>,
	Georgi Vlaev <gvlaev@juniper.net>,
	Guenter Roeck <linux@roeck-us.net>,
	JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 08/10] leds: Add binding for Juniper's I2CS FPGA
Date: Fri,  7 Oct 2016 18:21:07 +0300
Message-Id: <1475853669-22480-9-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: Georgi Vlaev <gvlaev@juniper.net>

Document bindings for the I2CS FPGA leds.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/leds/leds-i2cs.txt         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-i2cs.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-i2cs.txt b/Documentation/devicetree/bindings/leds/leds-i2cs.txt
new file mode 100644
index 0000000..100e584
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-i2cs.txt
@@ -0,0 +1,34 @@
+Juniper I2CS LED driver.
+
+This is present in Juniper platforms that use a I2CS Slave FPGA.
+
+Required properties:
+  - compatible: must be "jnx,leds-i2cs"
+  - #address-cells : must be 1.
+  - #size-cells : must be 0.
+
+Each led is represented as a sub-node of the jnx,leds-i2cs device.
+
+LED sub-node properties:
+- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
+- reg : number of LED
+- linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+leds_fpc0: leds-jnx-i2cs {
+	compatible = "jnx,leds-i2cs";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	fpc0-fail {
+		reg = <1>;
+		linux,default-trigger = "fpc0-fail";
+	};
+
+	fpc0-ok {
+		reg = <2>;
+		linux,default-trigger = "fpc0-ok";
+	};
+};
-- 
1.9.1
