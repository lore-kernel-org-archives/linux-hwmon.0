Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231384;
	b=3fGzxdIt2xo70Dlu8xEVRrHwh3s4xuuxjRthSNDXKOyaazSfQ2JiiJ6tQJR4NLZxb0HK
	 ODAefrJ2gbOZGVCv0lVbLi/N7HjAiFqs2S1ccxE/xEIYBYcE6jLLfCpr2J2Y8thsCNj7I
	 1c+w1Xb56r1CYEPj/DGBkqPQ7oG37uKn6b6o/nGxHIItqURa8qbyenzlHPcTL3D02evfL
	 E7G/wwjMuglrxBrgHfTdIQCb8Qmx51vqafmZyhi6SrJK/jrOxc0zGsYwYdo/UPazpOk/f
	 8p1qmnPWSnCtEjELnGt5SpU3p7P1vxpTaN8TMx/AhjHT3A9Ep/0NFaosbK49d5N+kbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
	b=xEqcc9ONd64S7bgnelBESDgllEKmq52aaPbUBHNvwAKQz0DDftUcncA/63uA5KnF/U9h
	 QBiSb6Jzv5srdHArN4go2wjbVKHr8mE2dGAlbH1QX/TkQHh1r2MDH+shmqHzCzIQHxXqw
	 LqextA5K58qmEj8jzQOVSgaRBSuYH/8K1C/qP8rvSbGzAip5/cJs1dn/yozRiKWF+x5v2
	 xjqwtwuBTSBUiG8YRWKO1Ypm3pN/s4WOw+RoEMJ93S99AqyW8rIBgdZhUZTuXzu8XurwH
	 3obQIb2Vy8ZPVqgNX7hWRTuewPdZjlEh7dKPDp0fzMCvAsKyZe/FWHXq+HGhQZok9/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D571606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D571606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10612225e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231382; x=1794836182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=LddqbonzUr6K0romfGF6hlerJbpmIzHvEHhqyIWAmAqdmk/R/RLWOz57Zi/UW/CxWH
         znBTgbW4yHY5aYHkODU8j2wnYFi/mel9aRfgUbkIxM+mHIoNhu15PMhrj1e7+E8OhMcT
         j8x+KiRb1/La5Rooi5P6A6uu9lXmk7j+uByHVEjrnV3amn0x/sRYfmJ5edOQesRb+he/
         aJl4karHtl4ur9/hWKlLgGPSay0ISSarnokiHFKgoVCeOHF8kJOQloMP/OmlLTcszoGC
         qbp5tnbYmGXru/ffupw7/Y4LpMU41pEBoxKS8btbKzb8vYC9lIKPkwyKN05QV+Mi78XP
         mqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231382; x=1794836182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=qaAlI8Er72wEET9eo3aK76zP38ExjgeMd98QLslrFp3HG5+2i0oui1CzHu6X6SHIxe
         r2m+NTtmoGq3cSfzT5EEl6hN1d7toZGsxRbND6tjv580E1FZZzNIqU5QSUzciZ7BfMvn
         6Xydb550L1RtrGgGpw2L4UfxzfwVl0iGmoYkznCZo3oe/ZC7LoX0xPE/OSU8/azE89uq
         VbrxHv+mtEN4Wh7hdpzOhDDLQvlki8kTJacDDojaWhSxvflNSuZG+rfe8tOkjXCKcGUp
         dkvXHcNTMOecu0fqjdcep1V80KLF1c3VRw1zg+vRqZ8zK0OIzttZRDij+S01Ngp9Yhi4
         Kg/g==
X-Forwarded-Encrypted: i=1; AL+hErEAgIltsayaL1sRl2QJQ/R8lKBAt283zAg1SScrxBOeMMuagU9ELfXE9XYJrB7ZM/DCs+OQzqEk9LNPHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/92ULwAyrxOP7iJ9+KIeukMBiW2GsexDD0kiKWsm/A2UkjxBCx
	Fgf7DC6O9ITQXOySEKOBuDnS4Ftf0FBnSQUhvKZJGz0IjiX+JsHvgW0yxZ/1bQLyYUQ=
X-Gm-Gg: AYBFou10YpPeHttAc3lUTQ+ISxLQ0k5/OjOL2NjEC4a4DcGP0eE3sSAd2j7uier9xne
	EgV87160EqBzYybZ9OMCkTRU7wWWyiS1/9Pn0CD+WL07/pdsIgefV8a8vj4o/cL9MJ+F05Y6k/i
	10/R1e+L2MqGxJNiOhRkJRp3CtyJ0czw8rIAm1XfwiKe3B+O6ZkknvjRY8xoEogWXqei9j8ND5D
	0zv9euVckm527SFi6gmKku7U1jgnvWZuex6KNl7tl8Nnp2Jev4tHOVZLMl2/WfXOqWbuBM6IHn+
	KiTNoFFzEUuqEyV5I5DEBcMKs15Olsyy9I+kXMGDuVvr5GiYmg9xhGOXS8eZmZf5j0r8Dj0Ue+R
	KlE9fAUPNsR9ghX9mMoHbh0rPQ46nKZMs4y7n5CdIXJZaVb6S6gx3E8RA9aOh3x3nZv3Ygl0Fwa
	+Qt9uxoa603orNvvdlpVEAQnAk0X1PPdGuW7qe9WEvgPwruOV6gU4TdWoHTK2fZgDC5vEQrDEA8
	8GoZb6RW2YuAUS8qNlyCBspP+7VZ79/UldmL98YVEnMjtu6oKSvXoYFbZVokPqZ5V6Q1vOw4j5S
	CAE3irodvPDhpdZPvpqY3pzT0i0z9iJe+NoE3KuKUlBpnW8C0dhCJRUlCQ2FpBVUar8A/NQkADk
	v4k/smjG3TTk//WrcX78hEI23NYmE7f0ySg201rB8NN5FG2J/JnRl7OxDooYio6r38zGIbcIzOQ
	cICX36U2de1E9uR4naazqlttzd
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr71051325e9.35.1794231382337;
        Mon, 09 Nov 2026 05:36:22 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:20 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Mon,  9 Nov 2026 14:35:05 +0100
Message-ID: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LAN969x fan controller has a PWM output and tachometer input in a
register block separate from the Sparx5-compatible temperature sensor.
Describe it with its own compatible and binding.

The optional fan child specifies PWM period and polarity, tachometer
pulses per revolution, and thermal cooling levels.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..0b7d38a6d20ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Fan Controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  LAN969x fan controller with a PWM output and tachometer input. The fan
+  child's pwms property references this node to specify the PWM period and
+  polarity.
+
+properties:
+  compatible:
+    const: microchip,lan9691-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System reference clock
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        minimum: 1
+        maximum: 4
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+      cooling-levels:
+        - '#cooling-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    fanctrl: fan-controller@e2010348 {
+        compatible = "microchip,lan9691-fan";
+        reg = <0xe2010348 0xc>;
+        clocks = <&sys_clk>;
+        #pwm-cells = <2>;
+
+        fan {
+            pwms = <&fanctrl 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

