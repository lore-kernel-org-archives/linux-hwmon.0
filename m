Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1F149C6F;
	Fri,  2 Jan 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348972; cv=none; b=WvvCL9vRNe6cIYTHWA1asVU2NJV6650a/wdTgy6Iu5EuASYUJRUAUQQaoqcAUn4/LJipQA2G5szwxSclj//mq/ClT+v4sLbv8SXjksjOoPnptcuiJb/HnefS5K3sK5r9H4639ZJ8MjKIor8R4jHNDXdBMWki4xxhDXCEJAodHZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348972; c=relaxed/simple;
	bh=LVcGh/6SNJstE5IufFNTQ//Nfrp5aD/qOQSUQBUrNuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dozr7cSv5gnqD6CuXDTlyvgzH5viiaT/78yaqWvYvGcUSRbLVp/5/WZDaavz81wa0ZMfNtOAQxe33fVT6XtwwXMUF6ZnWyPaLfxKc5XkG38/ut6dsXkFjYMOW+hRG9ksT3p7g0jxRN22jkvA+gzGGC+/+ikNv+cGHC/Q8GhcbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=67CcigvT; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="67CcigvT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=noCo3TWyz/2Co4e4aZ+iblmN+RDw5lq2fxKmTHRklOU=; b=67CcigvTDoMIzH59A+zoOOrvUu
	ifUOctskrnNbsBjOVK0BP4CH88DbmaDLwhtDkQL6BXiYvWes0Kh4ne05822o8aenYghmLRPnFo15t
	QQXHZcUCsoJCriwCpU783SZ0j1TUld6AyKwYTaAZ28xnseFRt2L16PhBBDz8c7S3sfWis4y41e1Vv
	APRtD1QCSpYnXhLTD6WdOSLyuecRDCUVawXIKiZt+ssG6+JpyZQEo+r1SSBnqQI88DEdcrD89ldI6
	mudPefVXLEuNfuFNEL5XbyDItzC/6DVBz1/fA5oEFGAvxE/AG7YY9uB58W9CZCpPYHVjgFgBLes8F
	uGw6m/Yg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 02 Jan 2026 11:13:56 +0100
Subject: [PATCH v3 1/2] regulator: dt-bindings: Document TI TPS65185
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-tps65185-submit-v3-1-23bda35772f2@kemnade.info>
References: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
In-Reply-To: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=LVcGh/6SNJstE5IufFNTQ//Nfrp5aD/qOQSUQBUrNuU=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnhs+7YnW1VV38/O9mlaBbzrMLAUJ/cv8bfWad93fSD6
 U3LO37BjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACYSepfhn9GNo84b6/9yBb3V
 FVH+9GPT+2aNxKfTfrAe2Xd/RZqECjPDH86afyfZ4gtP6SoFKn/R/qRcFXnR4dFJWbWDz5enCSu
 pMgEA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Document the TPS65185. GPIO names are same as in the datasheet except for
the PWRUP pad which is described as "enable". That pin is optional because
the rising edge corresponds to setting one register bit and falling edge
to another register bit.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/regulator/ti,tps65185.yaml | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
new file mode 100644
index 000000000000..af0f638b80bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
@@ -0,0 +1,96 @@
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
+  vin-supply: true
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

