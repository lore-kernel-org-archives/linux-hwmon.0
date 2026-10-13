Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E143A342C80
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896271; cv=none; b=u/uLh4NjrPKq1qa2IihvnqNak1LjGtgPsJvOrAU3k4sip34kj0RO7o2P1uHUc/da/DTHJDt2j9tJwTjEMS9wOeLWLlcf76nTZqJ/HKfU3FAbxvZI3tbEgB+CNJ6ifsplGpisfz6tP5ExP8FHYOQcAYiJaO50iIuzoH0H4iKmSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896271; c=relaxed/simple;
	bh=lkbzM8u6Ksurvv8STfByGe12+IIc/BqAKbB9v2Dn01E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTnpmag9gzvp+wWXEx9UJWREPDNw0EmHUu9pwlYYC27OCpwitp0EpUEGUrwROGW5j9bvMni+Xf5621MAIZbojiQWUSHySOPi6pNzogj2OIHDm7af+ah+p3Z9jTEFO93Chkxw/2dRF0RydOkI4KENSK/VnKIlaKOufE4q6I5FymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eikGID/a; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eikGID/a"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c263415982eso349188866b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896268; x=1792501068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=eikGID/a0PzhTKWjihDtoyGQCpXMB6PZTPzrpqyaMSwJKawTd0t3thc3ppO+PSwqyd
         bNOelHj0fO0PbISxFPQ2dPsGcOhUW8G7LwlLjnnBTzBCaGrV2e8xzVcAnmVu8urr2F10
         nGabXO/0Nr26GtQt0l7/MLhp3RBm7glj2UrsQZgeGXcSSxaHW6Sr+0pRD+UOJ54IQyJf
         vs2kIP56hqTpjMTzPikc2ETvpYLPoEW0ExEap978XaAzOzMRXpMB5xswSW33+1zwryW0
         ivMPkV5yUlvbaXSVfHgZiqfaV9id3l7ZCCbB0/92vJiQyCzHc4GHuVNDalykygPdp+rx
         IVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896268; x=1792501068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=feKe1ZaYgek2Li6pG+agN4SQAvUXWZGqUV63xtDAznb/CONcZxm379HqXKGXjNdyka
         0PD4HniJdUqX2syCyyimFCM/GD4W/pVuMq0L2YUpaaKnJflQHadUwWBUT09Zms5Q5Hly
         XWoFpa8oHc4uT3/0fMszFtyUbc77MT7VwjXNjk282LGcji1N7PDZsC5S2CVxFvGAwzcR
         KHsHnO6Ms838M53fYqMUgWbVDkajiGQOSQzhYLkUdrK2N5bPymQ+8bdbP4LS4FXEdsPX
         wQfmds1NTXMobLwnorgLQOr9qKvunjBMCbrGf+TpXMT1uhwV8H//NBZAh2TXVa1DiUFy
         NOdQ==
X-Forwarded-Encrypted: i=1; AKwUvByTo2gTez5e+TPpfbRxttYg9tDbnTLGprQPusGPmCDv3Qgse+7InApTJpc4Mj3hBc+SA83qFoQ6AKuJdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzPd+q9vtZA4GDGIUn8OgfJkVDq9Jq4CI5NDhzxXqj7ISmZCIl
	bIXXP3yJOZz2cZes/cAVF2nLpue7nLWsWHEhK8dPzuYB3AqR1KU9/i2T4ut4Z5UlVkM=
X-Gm-Gg: AYBFou33bezbj8I44xNY667+sepCnzh79EdixLUxNgdXTBYr5i7PMvw+FQvZSBiIMFc
	1AJhdIw27vX2Spq7etR0tvsOwzYFoxQ/E/vBp8l7o9ZfmJNX2+rEASmTpI2bGCEw67+9gUIs87s
	hSbxp9ynIDWtg6Gu0qUOjk/QP4On/LlzItgbyS0H/Ki3YDyF9d7SCEfNYnrqajWdlkAItz9FUZV
	kqE0lvsoUKEVJ21wmiTJEIXPF6bHVHVSitJemwwQNxiMQ4aqp0azKqbuWT6ANpirJOXLqz7rvtA
	T3OPslCfJtMaDJMkp5opAYsuaZ92ST15KEZ5rVe5Z+eMqoGgoh6aVBFlnOMuuRASivtn47t5XJ5
	YDiEA8Psyp8pnloZq35Ex0N4YVtAUf3TnHv/5W8CL19joOmxuoaA16QknbtsUMj/VhbYT6W1HDI
	3Qfzda8mUmXZX4EsMxFdxfcgYjgnyqH8NGBvgOkIjud2YVzLSAEmz6D06LGIqF+uoVzRDf1vzir
	f50ntIhtAfXqe1Tx8223fPz4Gi2URnAAicrocX8NaKCNelvxFR58Z7stq5tk65I+nEdTH8JRggk
	zNzD2B+5Osh9JDiOAGPm4B3tOIs8a7A=
X-Received: by 2002:a17:906:e114:20b0:c33:62c0:d8cf with SMTP id a640c23a62f3a-c3362c15642mr504101666b.13.1791896268023;
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
Date: Tue, 13 Oct 2026 14:56:25 +0200
Message-ID: <20261013125735.1542349-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x integrates a PWM fan controller with a tachometer input in
addition to the Sparx5-compatible temperature sensor. Add a LAN969x
hardware-monitor compatible and describe the second register region.

Describe the fan as a child node using a two-cell PWM specifier for the
period and standard polarity flags. The child also carries the optional
tachometer pulses-per-revolution and thermal cooling properties.

Keep the existing microchip,lan9691-temp compatible for device tree ABI
compatibility.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 611fcadb1e771..e91c2a3ccd3c9 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -4,13 +4,15 @@
 $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Microchip Sparx5 Temperature Monitor
+title: Microchip Sparx5 Hardware Monitor
 
 maintainers:
   - Lars Povlsen <lars.povlsen@microchip.com>
 
 description: |
-  Microchip Sparx5 embedded temperature monitor
+  Microchip Sparx5 temperature monitor with a fan controller on LAN969x.
+  The fan child's pwms property references this node to specify the
+  PWM period and polarity.
 
 properties:
   compatible:
@@ -18,11 +20,19 @@ properties:
       - const: microchip,sparx5-temp
       - items:
           - enum:
+              - microchip,lan9691-hwmon
               - microchip,lan9691-temp
           - const: microchip,sparx5-temp
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: temp
+      - const: fan
 
   clocks:
     items:
@@ -31,11 +41,67 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
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
 required:
   - compatible
   - reg
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,lan9691-hwmon
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - '#pwm-cells'
+        - reg-names
+    else:
+      properties:
+        '#pwm-cells': false
+        fan: false
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
@@ -46,3 +112,21 @@ examples:
         #thermal-sensor-cells = <0>;
         clocks = <&sys_clk>;
     };
+
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    hwmon: hwmon@e2020100 {
+        compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+        reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+        reg-names = "temp", "fan";
+        #pwm-cells = <2>;
+        #thermal-sensor-cells = <0>;
+        clocks = <&sys_clk>;
+
+        fan {
+            pwms = <&hwmon 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

