Return-path: <john@jmuir.com>
From: John Muir <john@jmuir.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: John Muir <john@jmuir.com>,
	Anatol Pomazau <anatol@google.com>,
	Mark Segal <segal@google.com>
Subject: [PATCH v2 2/2] devicetree: Document the max31760 device binding.
Date: Tue, 11 Apr 2017 14:32:18 -0700
Message-Id: <20170411213218.138718-3-john@jmuir.com>
In-Reply-To: <20170411213218.138718-1-john@jmuir.com>
References: <20170404192034.158901-1-john@jmuir.com>
 <20170411213218.138718-1-john@jmuir.com>
List-ID: <linux-hwmon@vger.kernel.org>

v2:
- Fixup based on comments.

Signed-off-by: John Muir <john@jmuir.com>
---
 .../devicetree/bindings/hwmon/max31760.txt         | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max31760.txt b/Documentation/devicetree/bindings/hwmon/max31760.txt
new file mode 100644
index 000000000000..760fdf0b55e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max31760.txt
@@ -0,0 +1,72 @@
+MAX31760 fan controller
+-----------------------
+
+This device supports I2C only. Fan sub-nodes must be defined in order to enable
+the fan tachometer input. See also the datasheet:
+https://datasheets.maximintegrated.com/en/ds/MAX31760.pdf
+
+Required node properties:
+ - compatible: "maxim,max31760"
+ - reg: The I2C address of the device. This is 0x50 - 0x57 depending on the
+   hardware configuration.
+ - #address-cells: Must be 1.
+ - #size-cells: Must be 0.
+
+Optional node properties:
+ - maxim,fan-fail-full-only: Boolean; Assert a fan failure only when the PWM is
+   at 100%.
+ - maxim,fan-rd-signal: Boolean; Fans provide a rotation detection (RD) signal
+   instead of generating square-wave pulses.
+ - maxim,fan-rd-polarity-high: Boolean; RD is high when the fan is running, not
+   low. Only relevant when fan-rd-signal is true.
+ - maxim,fan-signal-enabled: Boolean; Externally driving FF/FS low should force
+   PWM output to 100%.
+ - maxim,fan-spin-up-enabled: Boolean; For fan startup set the PWM to 100% until
+   tach is detected or two seconds have passed before reducing to the target
+   value.
+ - maxim,pwm-polarity-negative: Boolean; 100% PWM is when PWM is low, not high.
+ - maxim,pwm-pulse-stretch-enabled: Boolean; Enable PWM pulse stretching.
+ - maxim,pwm-zero-fan-can-fail: Boolean; Enable fan failure detection while
+   ramping to 0% PWM.
+
+Fan sub-nodes must be present in order to enable the fan.
+
+Required fan sub-node properties:
+ - reg: Fan address. Must be <0x00> or <0x01>.
+
+Optional fan sub-node properties:
+ - label: String; Assigned to the hwmon fanX_label property.
+
+Temperature sub-nodes are optional.
+
+Required temp sub-node properties:
+ - reg: Temperature sensor address. Must be <0x00> or <0x01>.
+
+Optional temp sub-node properties:
+ - label: String; Assigned to the hwmon tempX_label property.
+ - ideality: For temperature node with reg 1 only: Set ideality factor for the
+   remote temperature sensor. Integer with range 0 to 63, representing a
+   multiplication factor of 0.9844 to 1.0489. Default: 24 (1.0080).
+
+Example:
+	max31760@50 {
+		compatible = "maxim,max31760";
+		reg = <0x50>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		maxim,fan-spin-up-enabled;
+
+		fan@0 {
+			reg = <0x00>;
+			label = "Left";
+		};
+		fan@1 {
+			reg = <0x01>;
+			label = "Right";
+		};
+		temp@1 {
+			reg = <0x01>;
+			label = "CPU";
+		};
+	};
-- 
2.12.2.715.g7642488e1d-goog
