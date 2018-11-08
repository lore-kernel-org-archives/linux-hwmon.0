Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:44356 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbeKIIeB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Nov 2018 03:34:01 -0500
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net, robh+dt@kernel.org, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: add binding documentation for adt7475
Date: Fri,  9 Nov 2018 11:56:06 +1300
Message-Id: <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

With the addition of the invert-pwm property the adt7475 needs its own
binding documentation rather being captured under trivial-devices.txt.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- use pwm-polarity attiribute to indicate normal or inverted polarity.

=20.../devicetree/bindings/hwmon/adt7475.txt     | 24 +++++++++++++++++++=

=20.../devicetree/bindings/trivial-devices.txt   |  4 ----
=202 files changed, 24 insertions(+), 4 deletions(-)
=20create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt=


diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Docume=
ntation/devicetree/bindings/hwmon/adt7475.txt
new file mode 100644
index 000000000000..d9212b5e9036
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
@@ -0,0 +1,24 @@
+*ADT7475 hwmon sensor.
+
+Required properties:
+- compatible: One of
+	"adi,adt7473"
+	"adi,adt7475"
+	"adi,adt7476"
+	"adi,adt7490"
+
+- reg: I2C address
+
+optional properties:
+
+- pwm-polarity: This configures the polarity of the PWM. 0
+		(PWM_POLARITY_NORMAL) uses logic high for 100% duty cycle. 1
+                (PWM_POLARITY_INVERSED) uses logic low for 100% duty cyc=
le.
+
+Example:
+
+hwmon@2e {
+	compatible =3D ;
+	reg =3D <0x2e>;
+	pwm-polarity =3D <1>;
+};
diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Docu=
mentation/devicetree/bindings/trivial-devices.txt
index 69c934aec13b..4f29100d6bbf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -14,10 +14,6 @@ ad,ad7414		SMBus/I2C Digital Temperature Sensor in 6-P=
in SOT with SMBus Alert an
=20ad,adm9240		ADM9240:  Complete System Hardware Monitor for uProcessor-=
Based Systems
=20adi,adt7461		+/-1C TDM Extended Temp Range I.C
=20adt7461			+/-1C TDM Extended Temp Range I.C
-adi,adt7473		+/-1C TDM Extended Temp Range I.C
-adi,adt7475		+/-1C TDM Extended Temp Range I.C
-adi,adt7476		+/-1C TDM Extended Temp Range I.C
-adi,adt7490		+/-1C TDM Extended Temp Range I.C
=20adi,adxl345		Three-Axis Digital Accelerometer
=20adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility =
value "adi,adxl345" must be listed too)
=20ams,iaq-core		AMS iAQ-Core VOC Sensor
--=20
2.19.1
