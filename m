Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB81EDA2B;
	Mon, 22 Dec 2025 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405940; cv=none; b=HhrtwlMtHUJtSX+7eP2KXnyZOUUunUG8MJmFaQ9+L8iOCCoLM+o8cUiClgmr0DR3qjHOyFQPclpgRgPsGkcVejNnAmlrSVnWOy59ZKCd1mIgqlarY4EZKy634WWU5si7lDpyNvgXjJamQrSII6Uz8sr6SW8/ObTNkkLiZgZTmTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405940; c=relaxed/simple;
	bh=QC6v7Qwp46Hks4u57dUk2Ly/tz18W3NAkkaGcnfOd1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQkwmiN4e6y2ta//9GDr+TU4UC9O1XxDRBkYbgkzFkHbmtLopVLIvD8+nPhGZPa5kjC6hxJ4r3zlJG0EZeVDgF3edz8xGRlzKhFCnXfb5i3qMwb5nOz7B71hIhvb9YXbYRp2zrX2g3/UFaDrt6WXAN4iFbfddWN0T2t0Ykusm9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ntBi0hPe; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ntBi0hPe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OoSZBkR9OvZctZXQPqAhT7iRBrqcsBSmcQIeuTfvQtc=; b=ntBi0hPejiI22+q39MoQTJvFv7
	L1sxgV+p0FWjk9pMgTUCWDk4IYlD3q3zHX5wRpX/KynLGLY6BQKe/5gAFmpO7WCf4n71/L9EbyZ96
	hEOxvJTZbDIBsFjzRlipbqke1JzPn6I4n0ul/xw+PhYeZK7D1k90e42/e6H+L/xAP1jBDi7SyL3VR
	ONuzYHt1RAJsdi1mzgoF+aBIerKFqLC7FZliK/JMl7YO1pBjTebXMex9RlhSMQ9FpTtKWOfC2PxOV
	I/UVr7eJvvSqj5iJ6mfB7qJ2n4GLFeynErUHjs7QZs5UXhUaX0rveEr+fcwqhMYEgRdertAKNvrLv
	SlGfnhqA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 22 Dec 2025 13:18:30 +0100
Subject: [PATCH 1/2] dt-bindings: regulator: Add TI TPS65185
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-tps65185-submit-v1-1-34986b504d5f@kemnade.info>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
In-Reply-To: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=QC6v7Qwp46Hks4u57dUk2Ly/tz18W3NAkkaGcnfOd1Q=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJme5ppTXwjeybPXmSPQ02jMNl/YXezE+rtKR5/f+uieO
 Ulm0dUXHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAExEdg/D/wj7nmU6x/XE91fk
 Kz1gcyqW7JWznD7ng/jMgmZf9h9enxn+ma1XeLhkyqcZKovqwn1jVk7pemu/qF23KvXnj3S9vzP
 2cgIA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Document the TPS65185. GPIO names are same as in the datasheet except for
the PWRUP pad which is described as "enable". That pin is optional because
the rising edge corresponds to setting one register bit and falling edge
to another register bit.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/regulator/ti,tps65185.yaml | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
new file mode 100644
index 000000000000..91edd0d5f8c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps65185.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS65185 Power Management Integrated Circuit
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+description:
+  TPS65185 is a Power Management IC to provide Power for EPDs with one 3.3V
+  switch, 2 symmetric LDOs behind 2 DC/DC converters, and one unsymmetric
+  regulator for a compensation voltage.
+
+properties:
+  compatible:
+    const: ti,tps65185
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description:
+      PWRUP pin
+    maxItems: 1
+
+  pg-gpios:
+    maxItems: 1
+
+  vcom-ctrl-gpios:
+    maxItems: 1
+
+  wakeup-gpios:
+    maxItems: 1
+
+  vin-supply:
+    description:
+      Supply for the whole chip. Some vendor kernels and devicetrees
+      declare this as a non-existing GPIO named "pwrall".
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^(vcom|vposneg|v3p3)$":
+        unevaluatedProperties: false
+        type: object
+        $ref: /schemas/regulator/regulator.yaml
+
+required:
+  - compatible
+  - reg
+  - pg-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@18 {
+            compatible = "ti,tps65185";
+            reg = <0x18>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_tps65185_gpio>;
+            pg-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+            vcom-ctrl-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>;
+            enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+            wakeup-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&epdc_pmic_supply>;
+            interrupts-extended = <&gpio2 0 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                vcom {
+                    regulator-name = "vcom";
+                };
+
+                vposneg {
+                    regulator-name = "vposneg";
+                    regulator-min-microvolt = <15000000>;
+                    regulator-max-microvolt = <15000000>;
+                };
+
+                v3p3 {
+                    regulator-name = "v3p3";
+                };
+            };
+        };
+    };

-- 
2.47.3

