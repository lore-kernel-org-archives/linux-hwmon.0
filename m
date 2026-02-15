Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894229993F
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771173361; cv=none; b=G0ONZJYEfVGYFtlCZhg+Gd5Zahg55qf1cVz2TJo9jqUHVrrSlELVawPEuqopbFUARaLNJTnOv19ac4AodFA3CwPfq/91B/v9bXUq7Ek5H9CtfK6L3kR6HVGFOIjJeSeu6EG+pRsUgHy5chkAPvUcwsTGw/J3V7hwFL8yQtZLeeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771173361; c=relaxed/simple;
	bh=63mkXh8wdgGy/5WBuOlGOaPWGf204xoM9SEF76Pp984=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fcJeb8ULbk2+uz1DM1pn4tHHqOKhd2qIorHTCuMvdVdDp1v03fciku7rd+mNI86vuxsCcsn1USQUniIfss5kJ9JWZwykXZnVoeBnVAjspRT5oznr3p7wkjvhctdaVLIpkeDm/CejisUvkHKYkwqBoR0SGiBvR4NzP/EJwfoeVsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOfBZVXA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOfBZVXA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359a302794so1622134f8f.1
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 08:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771173358; x=1771778158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkgk08i2VDNmIlHOtwetmTzX3cu5OCSN90qqnNHKmCo=;
        b=OOfBZVXASsGoHvaHR1FjwJ2lvJOHoyotTVS4SwRmEeVtroWVmHJyQg3vTkN0O9Oy6S
         o0CjPH+DmpD55brSureqvtcmVlSR1oTNNKYsB1VqTpdKrYldrpvwtFzGDmHnvxOHMXer
         qlZP1FuKZlH4mku5wKPFuQDRzaGU5tBeIbY4p5ADSK3xp/1ZCGIsdOtqp7t4ZoBZDxB9
         pliAENpZsFkw0wiPeAiI8OyzY78J6VjVdAObgkyN7F5+woCJ+eT1+hbSwt7x50Qn/rN6
         bhl2jxmOdEsxqTHdOSPpVmJJXH3m2cl0qC8CvtmOLfM4ZF/gVbFWPDKOQFKkriMYKg4u
         DIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771173358; x=1771778158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkgk08i2VDNmIlHOtwetmTzX3cu5OCSN90qqnNHKmCo=;
        b=hXfXCjnkQQTP0+/eKx+pRjnCVGo0g3qB0B0jBqOsBaPbMaJFFf/7L8hRkZYcRvjN/I
         QlpSbktN6uHk6ey6fiQ1EZ7FZuwDwd9/A/aXzbso9KhL8jqTSZT6gpU7XmRaaWO/wDD4
         rU1ZbSdrJswa+IH6P8ckvff5l5GHWgWiWtx300Q5dENurE9p/0H0cv96csWFWlojKSlW
         Elq1eigz1yNuOTOFAkzMilrkOEleZ7AWqD1yGZKHhVEAtPkLCbJ99kFm0bbtHEkkazvf
         S2LzGyhL4rFQtPamurtbM1Uezy9oieTyfXNJVusEXNBkLoxejAVC6Om42YrC6OczAeR8
         mDrw==
X-Forwarded-Encrypted: i=1; AJvYcCVafRlZ/2+2rKaiepyom9GN/HPiz6CWufk8HBjwU+EiLZSsJ9JxLDBXA0RckCimqcEZHvLnDT7DMSYdVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGnUOFxfe8yFqiiCegtmAQkDPo2cDAb1MSe6KU7FJRyEnMruQ0
	LpRg4RBcfhzXTJRtW744nAJIG4j6k47275TsLZkdMhWVwWAJZM7DJ56E
X-Gm-Gg: AZuq6aI1I6E8/jEQAgcsGNZvLwedb7nCIHL9QcdxIpNzX74mIV2/muuXZgNeFdCNMQU
	SLeJNKi9H9xMA6MEkCtlFDQHVVAWO5fbNhawnr2WNiY0VvwDRHm3QBg7Gafie4wfd/gATh/eNX7
	XVw8nRB6wm+YXya7NWUwmjvTchFZ0bfewHcS6uU4HFOkTjDGpUOdCio+Aofs20/H3hptc6Pk+v9
	kfgxB2xcxwPeeF1cqwO/Bj+5qXVRYT3HiHf3FWPONoxSTv22wU6PmqWTO4RVKtETvH1b6AtnJtv
	PsryyqFQLzsPpViINY9teeoueygiO/50b4TwFj4ptmtiUNQUTNiRR3pgej3wtJPfN9kx8icXx+L
	tYwLCpnFYMLsP9kytVoa3Sl6WJ9n97aE8Ky3+8hxatXcKDQLB8nNoE+ORvtCPnG2BTPwctOy0Xk
	C+/FK1w2qtZnzZCLMeAtJJ5QyEx32mfyIgoA==
X-Received: by 2002:a05:6000:2901:b0:435:7154:2a7 with SMTP id ffacd0b85a97d-4379db3411emr7986116f8f.6.1771173357710;
        Sun, 15 Feb 2026 08:35:57 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm22085970f8f.30.2026.02.15.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 08:35:57 -0800 (PST)
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
Subject: [PATCH v2] dt-bindings: hwmon: convert npcm750-pwm-fan to DT schema
Date: Sun, 15 Feb 2026 18:35:53 +0200
Message-Id: <20260215163553.1334475-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---=0D
Addressed comments from:=0D
 - Rob Herring : https://www.spinics.net/lists/kernel/msg6047623.html=0D
=0D
Changes since version 1:=0D
 - Modify yaml file.=0D
 - Remove unnecessary symbols.=0D
 - Add items.=0D

 .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 -----------
 .../hwmon/nuvoton,npcm750-pwm-fan.yaml        | 139 ++++++++++++++++++
 2 files changed, 139 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan=
.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,npcm750=
-pwm-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/=
Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
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
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Under fan subnode can be upto 8 child nodes, each child node representing =
a fan.
-Each fan subnode must have one PWM channel and at least one Fan tach chann=
el.
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
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
-	compatible =3D "nuvoton,npcm750-pwm-fan";
-	reg =3D <0x103000 0x2000>,
-		<0x180000 0x8000>;
-	reg-names =3D "pwm", "fan";
-	clocks =3D <&clk NPCM7XX_CLK_APB3>,
-		<&clk NPCM7XX_CLK_APB4>;
-	clock-names =3D "pwm","fan";
-	interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pwm0_pins &pwm1_pins &pwm2_pins
-			&fanin0_pins &fanin1_pins &fanin2_pins
-			&fanin3_pins &fanin4_pins>;
-	fan@0 {
-		reg =3D <0x00>;
-		fan-tach-ch =3D /bits/ 8 <0x00 0x01>;
-		cooling-levels =3D <127 255>;
-	};
-	fan@1 {
-		reg =3D <0x01>;
-		fan-tach-ch =3D /bits/ 8 <0x02 0x03>;
-	};
-	fan@2 {
-		reg =3D <0x02>;
-		fan-tach-ch =3D /bits/ 8 <0x04>;
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fa=
n.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.ya=
ml
new file mode 100644
index 000000000000..73464af3078e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/nuvoton,npcm750-pwm-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx/NPCM8xx PWM and Fan Tach Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description:
+  The NPCM7xx/NPCM8xx family includes a PWM and Fan Tachometer controller.
+  The controller provides up to 8 (NPCM7xx) or 12 (NPCM8xx) PWM channels a=
nd up
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
+    description:
+      Contains the Fan interrupts with flags for falling edge.
+      For NPCM7XX, 8 interrupt lines are expected (one per PWM channel).
+      For NPCM8XX, 12 interrupt lines are expected (one per PWM channel).
+
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
+        description:
+          Specify the PWM output channel. Integer value in the range 0-7 f=
or
+          NPCM7XX or 0-11 for NPCM8XX, representing the PWM channel number.
+
+        maximum: 11
+
+      fan-tach-ch:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description:
+          The tach channel(s) used for the fan.
+          Integer values in the range 0-15.
+
+        items:
+          maximum: 15
+
+      cooling-levels:
+        description:
+          PWM duty cycle values in a range from 0 to 255 which
+          correspond to thermal cooling states. This property enables
+          thermal zone integration for automatic fan speed control
+          based on temperature.
+
+        items:
+          maximum: 255
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
+        compatible =3D "nuvoton,npcm750-pwm-fan";
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        reg =3D <0x103000 0x2000>, <0x180000 0x8000>;
+        reg-names =3D "pwm", "fan";
+
+        clocks =3D <&clk NPCM7XX_CLK_APB3>, <&clk NPCM7XX_CLK_APB4>;
+        clock-names =3D "pwm", "fan";
+
+        interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names =3D "default";
+        pinctrl-0 =3D <&pwm0_pins &fanin0_pins>;
+
+        fan@0 {
+            reg =3D <0>;
+            fan-tach-ch =3D <0 1>;
+            cooling-levels =3D <64 128 192 255>;
+        };
+
+        fan@1 {
+            reg =3D <1>;
+            fan-tach-ch =3D <2>;
+        };
+    };
--=20
2.34.1

