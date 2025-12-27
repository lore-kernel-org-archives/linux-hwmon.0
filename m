Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEDC288A2;
	Sat, 27 Dec 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766830867; cv=none; b=iSPJrXWin2r3c3bXQHUbVwA4P+l3wyEBQaRHZ+qD0K7/RlTQjRyPD8y3sqOtDwSnZW6mRE/mFyHVxyF+wFyE+NRUBXEeua5odd5KvXJsIa+QmUEyaPT7RrGrknKjKiLFiPtuc1kL3XFApMixBHrdR5DcG/+MrxSFTdDGByenLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766830867; c=relaxed/simple;
	bh=5I0vjo2BsK56XM7YHTdj8SGfo4FfVZeb18FDKhljr1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfogQkxZaxtxv+14eQjg9MPlWKg/uXYd+Ycpo/gpOm3fptHgChrrQLZcF257G6kJVw5VhcOBnehQI+jt4rGtnNwYFPFZ+NWGmZS3QEHddh+f6Vm1ZputnX1y9mJjepIQWQVjZKXw1fmGiqijAnUMaAB7o0gBzlXqKDPIk1PKaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=VU8uOy1v; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="VU8uOy1v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qArqJo9Fr6bNnribATLnd+F3QB4YZ2rGBsDAJDzJXU0=; b=VU8uOy1v2R+obHQ29LD3EA7uMU
	RcW4HrcDr5ks7YtasQhCX+ZVqElf0GFnakvf8P5JOX4tQ/PG2r2JzPOyHe/6Z0YsgzWeCPC78nmmN
	2sPUn99GJoX4UObmPThv430TVjCVGJ094ofnDVQHEsoM8FCzS7tJPCfA5h6sqzxq4xxZN4cF6HTMV
	Kg3EV/A66UYFeCd9jG4eXcZ0lDgbfx0vaAeMjVTlEut8aZ98r1uDyWY3fRhryhlqTFPgA5T3vBeYu
	ZIRalN6+5mWbSyeEz7rThSV7dLLjzOUjL1DjYBFFJCvGZlKmhxL13CTBpdKR4qr0ESfrBFL+o1YV7
	23SvAOiw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Sat, 27 Dec 2025 11:20:36 +0100
Subject: [PATCH v2 1/2] dt-bindings: regulator: Document TI TPS65185
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-tps65185-submit-v2-1-1882024b8f33@kemnade.info>
References: <20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info>
In-Reply-To: <20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=5I0vjo2BsK56XM7YHTdj8SGfo4FfVZeb18FDKhljr1w=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJn+m9ny581s2GR86o/sjpZdez8trra7dPt8ReLUiQs65
 n89cnWvSUcpC4MYF4OsmCLLL2sFt08qz3KDp0bYw8xhZQIZwsDFKQATWVjH8D/7wxKehcuXuVoY
 H/G5MVuP54nZhmW+Ql/2husf6+2KiuFhZDjd8O48n7pqXi9zfZ9dNKuhoRJTYdix/VtktWw+fGp
 xZAMA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Document the TPS65185. GPIO names are same as in the datasheet except for
the PWRUP pad which is described as "enable". That pin is optional because
the rising edge corresponds to setting one register bit and falling edge
to another register bit.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/regulator/ti,tps65185.yaml | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
new file mode 100644
index 000000000000..7cc5a895c2fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
@@ -0,0 +1,99 @@
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
+  pwr-good-gpios:
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
+  - pwr-good-gpios
+  - vin-supply
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
+            pwr-good-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
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

