Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86827FB2A;
	Fri,  9 Jan 2026 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939052; cv=none; b=BFtv6ob3VB0OQmxgjmHeZh5HObr4qQiYCrIZw9Mr0NJmLKchTETfERm0cFMrq2UYHAgU0LO5jS2neI7zTZdVOE1nuzxpIMAXdEG1DLPZh5l0fawI/6+pM9/XYUpC+4e5GUMBBBGs1UUXm+bKEMZQkNgYrxhdKBwnFn+Y4BApKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939052; c=relaxed/simple;
	bh=Q1Fl3N8dJcxufJu1kVG0sDeEqjJkCSbOjEEL2e2kYX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pD2jOLgJVKwYKmDNm6WfejQqAEl1BXm18Yb7xzd+nCN6hlwyU3cvvhHpEVxza7WhsaKRThdeuDHRiWrA46Bn0N0AGFPhhSAxfBL1QTY+n38fH0ao417fOgSnKux+d/lytHMe/RESr/3oGXqS95poR+BCwIdTmigTKsocX3ofJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=fBNOnwS6; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="fBNOnwS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767939047;
	bh=vRFQQUj7n/i2ZiWtqXly1x4ZWNMsf/8vSdo3mxivNNk=;
	h=From:Date:Subject:To:Cc;
	b=fBNOnwS6DvYHhp8uGDM5eJ3t7NS2jPjupsbF96O4/++BbjOYqovpIOqhHrTLJxRwL
	 7q0Dnu0XYjGttwIA4f50USyYylBe8SgAnBglGAtDSpFz7VIjcRKhmOuyCO22Kh74Pg
	 qHFDjQa1LsmwjMV7eDduiiW7Wj0LRWMANSkck5pmik/1dXlaqhz08VTVJuulF1/YSJ
	 ITy1VDbE4r97CCOvfcvKQKHlSIgr+z+h1Y154GUqqoFqj5Hlzhl0pcLj1VW0o6xx9S
	 X5O9BjHf8IKe18UwvNkU0s1QPlUP6JnzTnE9vELDlJMt6GmrR2Uyo7l54Q5rV4KnPR
	 dAJtRY4Ez/7GA==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8A9037E142;
	Fri,  9 Jan 2026 14:10:45 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 09 Jan 2026 16:40:28 +1030
Subject: [PATCH] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT
 schema
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-dev-dt-warnings-hwmon-v1-1-f2a84cdb0e1b@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIANObYGkC/x3MQQqAIBBA0avErBtQo6KuEi0kx5pFU2hkIN09a
 fkW/2eIFJgijFWGQDdHPqRA1xUsm5WVkF0xGGU6pdWAjm50FyYbhGWNuKX9EPSqteRM0y69htK
 egTw//3ea3/cDy3wDc2cAAAA=
X-Change-ID: 20260109-dev-dt-warnings-hwmon-f05aed235c71
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3

From: "Rob Herring (Arm)" <robh@kernel.org>

Convert the ASpeed fan controller binding to DT schema format.

The '#size-cells' value is 0 rather 1.

Some users define more that 8 fan nodes where 2 fans share a PWM. The
driver seems to let the 2nd fan just overwrite the 1st one. That also
creates some addressing errors in the DT (duplicate addresses and wrong
unit-addresses).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello,

This change has been on a bit of a journey[1][2] and was eventually
integrated into my RFC series tidying up the AST2600 EVB at [3]. Rob
did some further digging at [4] and I've now addressed his finding
there.

Much of the series at [3] was merged so I'm splitting out what remains
and peeling off the RFC label after making necessary fixes.

Guenter - I've included your A-b tag from [3], but as I'm sending this
to be applied through the hwmon tree, do with that as you please.

Changes since the series at [3]:
- Update #cooling-cells to 2 based on Rob's observation at [4]

Cheers,

Andrew

Link: https://lore.kernel.org/all/20251029185448.2121857-1-robh@kernel.org/ [1]
Link: https://lore.kernel.org/all/20251205144929.GA76422-robh@kernel.org/ [2]
Link: https://lore.kernel.org/all/20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au/ [3]
Link: https://lore.kernel.org/all/CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com/ [4]
---
 .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++++++++
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
 2 files changed, 106 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
new file mode 100644
index 000000000000..ca6e2d67ddbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2400/AST2500 PWM and Fan Tacho controller
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+description: >
+  The ASPEED PWM controller can support up to 8 PWM outputs. The ASPEED Fan
+  Tacho controller can support up to 16 Fan tachometer inputs.
+
+  There can be up to 8 fans supported. Each fan can have 1 PWM output and
+  1-2 Fan tach inputs.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-pwm-tacho
+      - aspeed,ast2500-pwm-tacho
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#cooling-cells':
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '^fan@[0-7]$':
+    description: Fan subnode
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        description: PWM source port index (0 = PWM A, ..., 7 = PWM H)
+        maximum: 7
+
+      cooling-levels:
+        description: PWM duty cycle values for cooling states
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        minItems: 1
+        maxItems: 16  # Should be enough
+
+      aspeed,fan-tach-ch:
+        description: Fan tachometer input channel
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 15
+
+    required:
+      - reg
+      - aspeed,fan-tach-ch
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+
+    fan-controller@1e786000 {
+        compatible = "aspeed,ast2500-pwm-tacho";
+        reg = <0x1e786000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #cooling-cells = <2>;
+        clocks = <&syscon ASPEED_CLK_APB>;
+        resets = <&syscon ASPEED_RESET_PWM>;
+
+        fan@0 {
+            reg = <0x00>;
+            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+            aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+        };
+
+        fan@1 {
+            reg = <0x01>;
+            aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
deleted file mode 100644
index 8645cd3b867a..000000000000
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
-
-The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
-controller can support upto 16 Fan tachometer inputs.
-
-There can be upto 8 fans supported. Each fan can have one PWM output and
-one/two Fan tach inputs.
-
-Required properties for pwm-tacho node:
-- #address-cells : should be 1.
-
-- #size-cells : should be 1.
-
-- #cooling-cells: should be 2.
-
-- reg : address and length of the register set for the device.
-
-- pinctrl-names : a pinctrl state named "default" must be defined.
-
-- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
-
-- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
-	       "aspeed,ast2500-pwm-tacho" for AST2500.
-
-- clocks : phandle to clock provider with the clock number in the second cell
-
-- resets : phandle to reset controller with the reset number in the second cell
-
-fan subnode format:
-===================
-Under fan subnode there can upto 8 child nodes, with each child node
-representing a fan. If there are 8 fans each fan can have one PWM port and
-one/two Fan tach inputs.
-For PWM port can be configured cooling-levels to create cooling device.
-Cooling device could be bound to a thermal zone for the thermal control.
-
-Required properties for each child node:
-- reg : should specify PWM source port.
-	integer value in the range 0 to 7 with 0 indicating PWM port A and
-	7 indicating PWM port H.
-
-- cooling-levels: PWM duty cycle values in a range from 0 to 255
-                  which correspond to thermal cooling states.
-
-- aspeed,fan-tach-ch : should specify the Fan tach input channel.
-                integer value in the range 0 through 15, with 0 indicating
-		Fan tach channel 0 and 15 indicating Fan tach channel 15.
-		At least one Fan tach input channel is required.
-
-Examples:
-
-pwm_tacho: pwmtachocontroller@1e786000 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#cooling-cells = <2>;
-	reg = <0x1E786000 0x1000>;
-	compatible = "aspeed,ast2500-pwm-tacho";
-	clocks = <&syscon ASPEED_CLK_APB>;
-	resets = <&syscon ASPEED_RESET_PWM>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
-
-	fan@0 {
-		reg = <0x00>;
-		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
-	};
-
-	fan@1 {
-		reg = <0x01>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
-	};
-};

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-dev-dt-warnings-hwmon-f05aed235c71

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

