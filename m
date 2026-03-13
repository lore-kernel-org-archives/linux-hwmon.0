Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D03331A56
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410570; cv=none; b=opMIQdy6It2NIdLE7JS8QKziYo08fDguIjqaD/egeP4NIFV0YYq0HsU5ED8+N6ao1nzSC/Kf7XKnK8s34gMt24Hwwer3H2A6YOkDVGKsiruwDTXy4IcIjBJWk3kXEkJOyU3dEtSoob+6FVN3m/gjZIwvW27yj2z7Vj+ijBRfHOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410570; c=relaxed/simple;
	bh=nVi4fnB21BQnsw3d7NxzTf6aE/i4SZDs5SPCB9HlxDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNW12+kvyrJGCpW7tvkX++yMZckeQ0Y/Z9GymCAWbWTKITa7eIE87IIi016QtxTMAVie4DNlX4zANfZosfkcUm+g6TxaYqsBOF8VQVXsrf3VRAlyU2PNO4zh34DwwHu4U3OfTNL+gzC4EMe733OHv7yMKYXg3Jc3uXvu4/22+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w135r-0007Jb-4b; Fri, 13 Mar 2026 15:02:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w135q-0005cp-2q;
	Fri, 13 Mar 2026 15:02:22 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w135q-000000055hH-3Px3;
	Fri, 13 Mar 2026 15:02:22 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v4 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
Date: Fri, 13 Mar 2026 15:02:12 +0100
Message-ID: <20260313140218.1213393-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313140218.1213393-1-o.rempel@pengutronix.de>
References: <20260313140218.1213393-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Add device tree binding documentation for the NXP MC33978 and MC34978
Multiple Switch Detection Interface (MSDI) devices.

These ICs monitor up to 22 mechanical switch contacts in automotive and
industrial environments. They provide configurable wetting currents to
break through contact oxidation and feature extensive hardware
protection against thermal overload and voltage transients (load
dumps/brown-outs).

The device interfaces via SPI. While it provides multiple functions, its
primary hardware purpose is pin/switch control. To accurately represent
the hardware as a single physical integrated circuit without unnecessary
DT overhead, all functions are flattened into a single pinctrl node:
- pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controller
  and managing their pin configurations.
- hwmon: Exposing critical hardware faults (OT, OV, UV) and static
  voltage/temperature thresholds.
- mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
  internal temperature, or battery voltage to an external SoC ADC.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v4:
- Drop the standalone mfd/nxp,mc33978.yaml schema entirely.
- Move the unified device binding to bindings/pinctrl/nxp,mc33978.yaml,
- Remove the dedicated child node compatible strings (nxp,mc33978-pinctrl).
- Flatten the pinctrl/gpio properties directly into the main SPI device
  node.
changes v3:
- Drop regular expression pattern from pinctrl child node and define
  it as a standard property
- Reorder required properties list in MFD binding
- Remove stray blank line from the MFD binding devicetree example
- Replace unevaluatedProperties with additionalProperties in the pinctrl
  binding
changes v2:
- Squashed MFD, pinctrl, hwmon, and mux bindings into a single patch
- Removed the empty hwmon child node
- Folded the mux-controller node into the parent MFD node
- Added vbatp-supply and vddq-supply to the required properties block
- Changed the example node name from mc33978@0 to gpio@0
- Removed unnecessary literal block scalars (|) from descriptions
- Documented SG, SP, and SB pin acronyms in the pinctrl description
- Added consumer polarity guidance (GPIO_ACTIVE_LOW/HIGH) for SG/SB
  inputs, with a note on output circuit dependency
- Updated commit message
---
 .../bindings/pinctrl/nxp,mc33978.yaml         | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
new file mode 100644
index 000000000000..58a641a7c615
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Multiple Switch Detection Interface
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSDI)
+  devices with 22 switch inputs, integrated fault detection, and analog
+  multiplexer (AMUX) for voltage/temperature monitoring.
+
+  Pin numbering:
+  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
+    contacts closed to ground and typically require GPIO_ACTIVE_LOW
+    flags when used as digital inputs.
+  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configured
+    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
+    inputs monitor contacts closed to the battery voltage and typically
+    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
+
+  Output Emulation:
+  The hardware lacks standard push-pull output drivers. Outputs are emulated
+  by toggling the programmable wetting current sources (acting as pull-ups
+  or pull-downs) and the hardware tri-state registers. Because of this
+  physical constraint:
+  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAIN or
+    GPIO_OPEN_SOURCE in the device tree.
+  - Push-pull configurations are physically unsupported.
+  - The active polarity depends entirely on the external circuit (e.g., how
+    an LED is wired) and must be flagged accordingly by the consumer.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978
+      - nxp,mc34978
+
+  reg:
+    maxItems: 1
+    description: SPI chip select number
+
+  spi-max-frequency:
+    maximum: 8000000
+    description: Maximum SPI clock frequency (up to 8 MHz)
+
+  interrupts:
+    maxItems: 1
+    description:
+      INT_B pin interrupt. Active-low, indicates pin state changes or
+      fault conditions.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      First cell is the IRQ number (0-21 for pins, 22 for faults).
+      Second cell is the trigger type (IRQ_TYPE_* from interrupt-controller.h).
+
+  '#mux-control-cells':
+    const: 0
+    description:
+      Present if the device AMUX selector is used as a mux provider.
+      Consumers (e.g. io-channel-mux) must provide settle-time-us for the
+      external ADC sampling path.
+
+  vddq-supply:
+    description: Digital supply voltage
+
+  vbatp-supply:
+    description: Battery/power supply
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  ngpios:
+    const: 22
+
+patternProperties:
+  '^.*-grp$':
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml#
+    additionalProperties: false
+    description: Pin configuration subnodes.
+    properties:
+      pins: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-high-impedance: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - vddq-supply
+  - vbatp-supply
+  - gpio-controller
+  - '#gpio-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        msdi: gpio@0 {
+            compatible = "nxp,mc33978";
+            reg = <0>;
+            spi-max-frequency = <4000000>;
+
+            interrupt-parent = <&gpiog>;
+            interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            vddq-supply = <&reg_3v3>;
+            vbatp-supply = <&reg_12v>;
+
+            #mux-control-cells = <0>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            ngpios = <22>;
+
+            door-grp {
+                pins = "sg0";
+                bias-high-impedance;
+            };
+        };
+    };
-- 
2.47.3

