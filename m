Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C835D385EC2
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739028; cv=none; b=XwD5hYZeKq9yagjpa63P2MC4/dhI1lquKxXAkha387Y4HzUaNzoS/DFA+zJmGr5s/FMO7SaynI3eaYnZwOW0qqmY/OQhWuWAbqO31G1L2vB7+5RKqKdf8KcJFvIXqEBTKDTt27TiMwc6qht1zamxbX2pMN0k4Q3Hv1em94A9M0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739028; c=relaxed/simple;
	bh=r03sluLS+oFdhKyCjrad+WXjQvkS4ewAU1a/LBepu20=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NX77mP5nHDMPd9jOFuPYzr2quSsccSfHFovRQxFsillOje372AAJItoeOBlXndwIgZtX5VeoRg1Py565ej/ZhOgRgeXTU96P7D/xEAmCfBLDC8CqgciTT2Cp+TulDG8VAYUMujK1EeiXaDB9gYTw9gcd13sqFYjiNTnGFesOAqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht2Q0OhU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht2Q0OhU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-436e8758b91so1572594f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 07:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770739025; x=1771343825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDxHw3Hq9zG9KAhSV/T4bFN5OhynGtCKzUgVN+dy8Fc=;
        b=Ht2Q0OhUBoHJb07sr8HzPGEVOYlN6B2lbzOuTiKCP7fx/YezgiwwucnsUB81RrPf6Y
         Nk9wNEXz2ozL4DXARI4imWxL1MgSnANemG0iWRUT68sZi/7eNxc6f1k+kQ2UaJ6tJYUr
         rkeFvcnbNq1+HskgJRJtg66S0PvFwDeff2goxXcqfP5tHiOSC8IF+kd8jpCZ0jpgb5j6
         inEu6RTpAuvZr6p2OQ8irW+d699A9oEiukmNVHxC7AXrthAeM8ssUU8XYIPycKJPqL5x
         tXc16LuHV3tisrgMKve9PqcYAVHo44xHrRoqS0+eSPRF1NwbeEpX7dhfdPKQr/67l3Ma
         LxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739025; x=1771343825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDxHw3Hq9zG9KAhSV/T4bFN5OhynGtCKzUgVN+dy8Fc=;
        b=e9CTXJKvIWj776Px/WnQEgqBA1HdKTMkXULKaxGCMJWZNpOYMvoKPXDwsLbmxBKGAo
         qKynN6A51Ew+Jpkj6VAeIvYZXlrPA4arJGq+JfR2IUC9JTMFFZshQk5JRKaNC38XOp70
         x/nLKDkkEg5sJnGQbiOi8CeB1ALG26+F4X+WTAh0zH0cx/iBcUoAvKsvmt1cGl/kLPYk
         tHEXiPQaHFw8Cx2Rl6qcQLetETluQqgBpDMeHivv5ArSIru5kAZQRDQ8EdMIcTa/G9gz
         4DWmQlWpSHOPGQK3LZihFpuEfGdooHECYw6YMxu1a8xuuy+otQ0IH//cCHp9SdWLFqHy
         rNng==
X-Forwarded-Encrypted: i=1; AJvYcCUeXTmOVeFBLm+LkmQsyOvjtgCBHgkOondG8bx8vGvdHd7VSeX3fzbJvZkXNqQkGRcGECVz7+SiL+M2kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA5U7Il69YaXgBBJdd8qlH3Msk8s+RJLQOZ+/6dVDxzuoNF5mV
	teeRDQZ+Drkw9Sc503lLIImeq7qoConoqz3Rm9JbwcxA6xHW4yuurwpE
X-Gm-Gg: AZuq6aLLI1RQE2HPtUoG54+AGHCFWkzGDgeJJRRSJAGPxA5F8YCQDu4AALlqxRiZ5RL
	fhHNb6Ha1SeDdk90YEClhs2dm26gdm9h0udxU/4xb5sSHao9zi54RD6ifuK7I7Sn5Vw4mZDpnoE
	H/pLqxx/dvry89ELnfKkeownx6aRgX8YfGEfsKqRZyiul3l6VFsfdR3v1cBOhrBdVmWvXNsAbvO
	4CFLap2aXxTXMjsMzgDZ2eh6KWcHt6LfDjjYeYIAf+tNi0W9O1VXeGUis/Be+V0deq241SWAXIW
	1LCfz9a2a6IgHJfHbbDnc28mMpv5zYqe0A22WQiaCbwwaQhor+EAKtN22STxIqCERB5SyJTXUKo
	Q87wLAb0ttLRS/FAG2/3V1WNgzjtqknBCHGawfVG3GKIdudzxiOvEIZoykk12zrfkDlwxuSLb3N
	iP274gi4NxnfWqWQm7bRnBjwdjSjImORbTwA==
X-Received: by 2002:a05:6000:2010:b0:437:71cc:a246 with SMTP id ffacd0b85a97d-43771cca558mr10374442f8f.10.1770739024825;
        Tue, 10 Feb 2026 07:57:04 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376806626fsm22051809f8f.37.2026.02.10.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:57:04 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] dt-bindings: hwmon: convert npcm750-pwm-fan to DT schema
Date: Tue, 10 Feb 2026 17:41:17 +0200
Message-Id: <20260210154117.1126857-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 ------------
 .../bindings/hwmon/npcm750-pwm-fan.yaml       | 132 ++++++++++++++++++
 2 files changed, 132 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
deleted file mode 100644
index 18095ba87a5a..000000000000
--- a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Nuvoton NPCM PWM and Fan Tacho controller device
-
-The Nuvoton BMC NPCM7XX supports 8 Pulse-width modulation (PWM)
-controller outputs and 16 Fan tachometer controller inputs.
-
-The Nuvoton BMC NPCM8XX supports 12 Pulse-width modulation (PWM)
-controller outputs and 16 Fan tachometer controller inputs.
-
-Required properties for pwm-fan node
-- #address-cells : should be 1.
-- #size-cells	: should be 0.
-- compatible	: "nuvoton,npcm750-pwm-fan" for Poleg NPCM7XX.
-				: "nuvoton,npcm845-pwm-fan" for Arbel NPCM8XX.
-- reg			: specifies physical base address and size of the registers.
-- reg-names	: must contain:
-					* "pwm" for the PWM registers.
-					* "fan" for the Fan registers.
-- clocks		: phandle of reference clocks.
-- clock-names	: must contain
-					* "pwm" for PWM controller operating clock.
-					* "fan" for Fan controller operating clock.
-- interrupts	: contain the Fan interrupts with flags for falling edge.
-- pinctrl-names	: a pinctrl state named "default" must be defined.
-- pinctrl-0	: phandle referencing pin configuration of the PWM and Fan
-					controller ports.
-
-fan subnode format:
-===================
-Under fan subnode can be upto 8 child nodes, each child node representing a fan.
-Each fan subnode must have one PWM channel and at least one Fan tach channel.
-
-For PWM channel can be configured cooling-levels to create cooling device.
-Cooling device could be bound to a thermal zone for the thermal control.
-
-Required properties for each child node:
-- reg : specify the PWM output channel.
-	integer value in the range 0 through 7, that represent
-	the PWM channel number that used.
-
-- fan-tach-ch : specify the Fan tach input channel.
-		integer value in the range 0 through 15, that represent
-		the fan tach channel number that used.
-
-		At least one Fan tach input channel is required
-
-Optional property for each child node:
-- cooling-levels: PWM duty cycle values in a range from 0 to 255
-                  which correspond to thermal cooling states.
-
-Examples:
-
-pwm_fan:pwm-fan-controller@103000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "nuvoton,npcm750-pwm-fan";
-	reg = <0x103000 0x2000>,
-		<0x180000 0x8000>;
-	reg-names = "pwm", "fan";
-	clocks = <&clk NPCM7XX_CLK_APB3>,
-		<&clk NPCM7XX_CLK_APB4>;
-	clock-names = "pwm","fan";
-	interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pwm0_pins &pwm1_pins &pwm2_pins
-			&fanin0_pins &fanin1_pins &fanin2_pins
-			&fanin3_pins &fanin4_pins>;
-	fan@0 {
-		reg = <0x00>;
-		fan-tach-ch = /bits/ 8 <0x00 0x01>;
-		cooling-levels = <127 255>;
-	};
-	fan@1 {
-		reg = <0x01>;
-		fan-tach-ch = /bits/ 8 <0x02 0x03>;
-	};
-	fan@2 {
-		reg = <0x02>;
-		fan-tach-ch = /bits/ 8 <0x04>;
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml
new file mode 100644
index 000000000000..954ba7d38b93
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx/NPCM8xx PWM and Fan Tach Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description: |
+  The NPCM7xx/NPCM8xx family includes a PWM and Fan Tachometer controller.
+  The controller provides up to 8 (NPCM7xx) or 12 (NPCM8xx) PWM channels and up
+  to 16 tachometer inputs. It is used for fan speed control and monitoring.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-pwm-fan
+      - nuvoton,npcm845-pwm-fan
+
+  reg:
+    maxItems: 2
+    description: Register addresses for PWM and Fan Tach units.
+
+  reg-names:
+    items:
+      - const: pwm
+      - const: fan
+
+  clocks:
+    maxItems: 2
+    description: Clocks for the PWM and Fan Tach modules.
+
+  clock-names:
+    items:
+      - const: pwm
+      - const: fan
+
+  interrupts:
+    description: |
+      Contains the Fan interrupts with flags for falling edge.
+      For NPCM7XX, 8 interrupt lines are expected (one per PWM channel).
+      For NPCM8XX, 12 interrupt lines are expected (one per PWM channel).
+    minItems: 8
+    maxItems: 12
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^fan@[0-9a-f]+$":
+    type: object
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+        description: |
+          Specify the PWM output channel. Integer value in the range 0-7 for
+          NPCM7XX or 0-11 for NPCM8XX, representing the PWM channel number.
+
+      fan-tach-ch:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          The tach channel(s) used for the fan.
+          Integer values in the range 0-15.
+
+      cooling-levels:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          PWM duty cycle values in a range from 0 to 255 which
+          correspond to thermal cooling states. This property enables
+          thermal zone integration for automatic fan speed control
+          based on temperature.
+
+    required:
+      - reg
+      - fan-tach-ch
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pwm_fan: pwm-fan@103000 {
+        compatible = "nuvoton,npcm750-pwm-fan";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        reg = <0x103000 0x2000>, <0x180000 0x8000>;
+        reg-names = "pwm", "fan";
+
+        clocks = <&clk NPCM7XX_CLK_APB3>, <&clk NPCM7XX_CLK_APB4>;
+        clock-names = "pwm", "fan";
+
+        interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pwm0_pins &fanin0_pins>;
+
+        fan@0 {
+            reg = <0>;
+            fan-tach-ch = <0 1>;
+            cooling-levels = <64 128 192 255>;
+        };
+
+        fan@1 {
+            reg = <1>;
+            fan-tach-ch = <2>;
+        };
+    };
-- 
2.34.1

