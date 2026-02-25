Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCD3E9F66
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039772; cv=none; b=plVVNlW6ZL1zaexxFeGYxX+HXYKo1m49n0s2UtqRVwjIT5SM0ToGsYZ5CF0/zWGOmYdr0x02h4xVWFE1qCZWihcGCtxuSilzYoOpstr0q69KkC/cULa5NvbAFS0H+5AgYxXcioyZHKi9GFFDfkocJf+Bm+BlwxupGS30QQAoYCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039772; c=relaxed/simple;
	bh=Z4CSQJ9iua7F24rhgOgP3bHK4M7tJcg6iv9kF/O6Y34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTGyxZ3O9PVKRwfLt8G0hK8joz7ko3BkaLSCZ14VN1nJyF9XRBPyUu6Kz1ghjiOldBDwQkgGh/dHTqJjNiry3S/36sg6gMTiVi008xnm/YUdDkSbHAM5J5pQ/DEV5YgLlKIqAcBFj8rrGoQkK4bNcDnB2nsHMft5AqK8g8c7rwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-0003C8-S2; Wed, 25 Feb 2026 18:15:47 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUD-002b7x-2J;
	Wed, 25 Feb 2026 18:15:47 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUE-00000008JDu-489x;
	Wed, 25 Feb 2026 18:15:46 +0100
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
Subject: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
Date: Wed, 25 Feb 2026 18:15:36 +0100
Message-ID: <20260225171545.1980385-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225171545.1980385-1-o.rempel@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
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

Add device tree binding documentation for the pin control and GPIO block
of the NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).

This block manages 22 switch detection inputs (14 Switch-to-Ground,
8 Programmable) and acts as a GPIO controller.

Additionally, it supports pin configuration for hardware-specific features
required for long-term contact maintenance in harsh environments, such as
adjusting the continuous/pulsed wetting current to penetrate oxide layers
on mechanical switches.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 12 ++++
 .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml | 66 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
index 85720f389509..5e8ab2cff685 100644
--- a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
+++ b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
@@ -52,6 +52,12 @@ properties:
   vbatp-supply:
     description: Battery/power supply
 
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
+    description: |
+      Pinctrl and GPIO controller child node for the 22 switch inputs.
+
 required:
   - compatible
   - reg
@@ -82,5 +88,11 @@ examples:
 
             vddq-supply = <&reg_3v3>;
             vbatp-supply = <&reg_12v>;
+
+            pinctrl {
+                compatible = "nxp,mc33978-pinctrl";
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
new file mode 100644
index 000000000000..4eeb70da6752
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Pinctrl/GPIO Driver
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  Pin control and GPIO driver for the MC33978/MC34978 MSDI device.
+
+  Pin numbering:
+  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs)
+  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978-pinctrl
+      - nxp,mc34978-pinctrl
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
+  "-grp$":
+    type: object
+    $ref: pincfg-node.yaml#
+    additionalProperties: false
+    description: |
+      Pin configuration subnodes.
+    properties:
+      pins: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-high-impedance: true
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "nxp,mc33978-pinctrl";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <22>;
+
+        door-grp {
+            pins = "sg0";
+            bias-high-impedance;
+        };
+    };
-- 
2.47.3

