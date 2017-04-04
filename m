Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33195 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755272AbdDDTVP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Apr 2017 15:21:15 -0400
Received: by mail-pg0-f67.google.com with SMTP id 79so39261662pgf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Apr 2017 12:21:15 -0700 (PDT)
From: John Muir <john@jmuir.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: John Muir <john@jmuir.com>, Anatol Pomazau <anatol@google.com>,
        Mark Segal <segal@google.com>
Subject: [PATCH 2/2] devicetree: Document the max31760 device binding.
Date: Tue,  4 Apr 2017 12:20:34 -0700
Message-Id: <20170404192034.158901-3-john@jmuir.com>
In-Reply-To: <20170404192034.158901-1-john@jmuir.com>
References: <20170404192034.158901-1-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: John Muir <john@jmuir.com>
---
 .../devicetree/bindings/hwmon/max31760.txt         | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max31760.txt b/Documentation/devicetree/bindings/hwmon/max31760.txt
new file mode 100644
index 000000000000..43787a77c322
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max31760.txt
@@ -0,0 +1,58 @@
+MAX31760 fan controller
+-----------------------
+
+This device supports I2C only. Many properties of this device are configurable
+thorugh the hwmon interface. See also Documentation/hwmon/max31760.
+
+Required node properties:
+- compatible : "maxim,max31760"
+- reg : The I2C address of the device. This is 0x50 - 0x57 depending on the
+	hardware configuration.
+
+Optional node properties:
+- maxim,fan1-enabled		- 1 to enable, 0 to disable. Default: 1.
+- maxim,fan2-enabled		- 1 to enable, 0 to disable. Default: 1.
+- maxim,fan1-label		- String: Hwmon fan1_label.
+- maxim,fan2-label		- String: Hwmon fan2_label.
+- maxim,fan-fail-full-only	- Set to 1 to assert a fan failure only when the
+				  PWM is at 100%. Default: 0.
+- maxim,fan-rd-signal		- Set to 1 if fan(s) provide a rotation
+				  detection (RD) signal, or 0 if the fan
+				  generates square-wave pulses. Default: 0.
+- maxim,fan-rd-polarity		- 0: RD is low when the fan is running.
+				  1: RD is high when the fan is running.
+				  Only relevant when fan-rd-signal is 1.
+				  Default: 0.
+- maxim,fan-signal-enabled	- Set to 1 if externally driving FF/FS low
+				  should force PWM output to 100%. Default: 0.
+- maxim,fan-spin-up-enabled     - For fan startup: Set to 1 to set the PWM to
+				  100% until tach is detected or two seconds
+				  have passed before reducing to the target
+				  value. Default: 0.
+- maxim,pwm-polarity		- 0: 100% PWM is when PWM is high.
+				  1: 100% PWM is when PWM is low.
+				  Default: 0.
+- maxim,pwm-pulse-stretch-enabled
+				- 1 to enable PWM pulse stretching, 0 to
+				  disable. Default: 0.
+- maxim,pwm-zero-fan-can-fail	- 0: Fan failure detection disabled when PWM is
+				     ramping to 0%.
+				  1: Fan failure detection enabled for all PWM
+				     values.
+				  Default: 0.
+- maxim,temp1-label		- String: Hwmon temp1_label.
+- maxim,temp2-label		- String: Hwmon temp2_label.
+- maxim,temp2-ideality		- Set ideality factor for the remote temperature
+				  sensor. Integer with range 0 to 63,
+				  representing a multiplication factor of 0.9844
+				  to 1.0489. Default: 24 (1.0080).
+
+Example:
+	max31760@50 {
+		compatible = "maxim,max31760";
+		reg = <0x50>;
+		maxim,fan1-label = "Left";
+		maxim,fan2-label = "Right";
+		maxim,fan-spin-up-enabled = <1>;
+		maxim,temp2-label = "CPU";
+	};
-- 
2.12.2.715.g7642488e1d-goog

