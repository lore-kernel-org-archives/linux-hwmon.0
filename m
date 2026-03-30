Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4061333D51F
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883678; cv=none; b=l2sDkCTlI3xP/yyfLo0E4+RECrr876dgkHjisPp7PTzJ+8Og7fSuxHPfZ7t13BfxtBXv8+1AZzoBzHFCjwrTCXFUUzgnSq4ZOySW/0pPjatS2Ib4sL7KsTRLCd+IVoERU7Ky84sJZNUYiFw6AHo/wnKbrOPqmPFSKoDitjMHRYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883678; c=relaxed/simple;
	bh=aBqMH+pXtx2lPFe+U3MCl6hGT84m6NVw6corT3ozweg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3ngA5AcRqJv2RuPXD/m7Q+q3drBICKQfEP5825l6DF331n7ITJgSKSga0eO2zcQEWZRfi4PJ2mrsmL3zUthvDJGKiLCmM0q7Y7tsgqQQrQ5U4ayvR4d9mxaasG7F3UziSH7BSDo7FWRB7A2F5tuNKQLU7g3qGFjTwHpeI9O5zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=SKs/5G3q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="SKs/5G3q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so39091595e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774883676; x=1775488476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRfYFHiWZcB1WpZ4DmzZn/i3PV8a6Lb6kC4Y3gRyJo0=;
        b=SKs/5G3qolHkoawLrD0hx/bA3QPJ2CCPAjI8AcfynXOiCSOQyll92DMvipwW6eAJdj
         au+qysUQOdJPPYi8oOWLwzN6SQ2WN0UrvSpYEGOp5SDfHanHw0czeAgcgaxrioTxkNG/
         FhqH4GcA3DfnLuRzZiZLmbB2lpoGfStuKkV/MygnmcPnBy2ekG8eS49d71l6An5uyx+l
         Ai2Lm/N9A4dMfe6VKWEdBrYVXCEmFzYf16PF6DAAOA2xWfGoK79O+kQ3bh0QorX1iA0g
         4oICdNURk5dI+uaH8+JWpWUxaGqLTGXvbDQ/qNpePgdvhS5Adqes/0Udhq0bKyivAjtP
         8rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883676; x=1775488476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IRfYFHiWZcB1WpZ4DmzZn/i3PV8a6Lb6kC4Y3gRyJo0=;
        b=VoHwrNkfkZpXkJVDKOxILzqJiBlERln2IdRdloGk5qpZlBzxm0/jRWOyMw4S0N47k+
         VomqQcEMVBcSIP5qNXlMtP6PCd0N8CJYMoQYmBf39JQNyNbnwluQeieAMdT1WlFMjtZ5
         aoHGAvU4oPnlcJvIY09BkGosC+LBW/VFnwdPVHetpUGK0o/29gdwxS/Gc32wDlDcgNtf
         IOv+L6PEiBQoetkQOgAWwWVAMKPY3eWfGuGNXjXzut3TcYeyzlf1jIKArntn0IkWAoKA
         RgZj7+a8NRImniUduFL3lqGRe80IuHSajY+ShHnZ6X8967MJqsl5xbooZD/MgVVZ5Hx1
         HVYw==
X-Gm-Message-State: AOJu0YyDdbWc+v+NTeDmXkM1Wo1i+uUMZVjRSvpt/R23q6JB7jfjyFF9
	R/+OyYGoaQgYY1MJE/LXWgjQgb/1xuoYpLER6q/2aeHV8SDs5HBekrZhXz98E9e0zF4=
X-Gm-Gg: ATEYQzyD746SWAx92x0rApCZgWtOpnfPSKKXcESJhRZAyaPNjlF7Gxr53+R6rj8VGvJ
	GrUo0Ybd2AUqZyN8x2yvcsMPFqEOsewigvqlrSayU7G7g0QOMTrmKVVTyPnM0pnJeE0IubwHQxi
	MUZwfBnwbLCEsrMEBxpxWY0KTObx4fapiiUm9gXXygqBLhA867UhNDMepCbyLqBCuTTp4WYIDRE
	sSxgp0bSXULDfCw+xuhZwexifvTwtG4jncS9sUA4kIiSX6TW6VtkwBqt0N60fkxzIRg3MvTZd4f
	hkdxBVn7RqL9b6OicqkeXfq9/CkLqYbYB4dtCcnF45LqezYfMY1G/U8NK/qQz87agIav0DfFonM
	3Lak/AfGQVixfvGgA2VEbFSCFkgyzoEGOaAjk/kZVDU+Rnb7yrfKnwznIx6W5I9kXJRAPdgbdNA
	tvYSuAa14h/NAaAv6GBKSTB62YFSAGyj5KCtK4LqqXq0GhSbbzKJiISqpUGOCJzKOXzcINNex4j
	LcWAA==
X-Received: by 2002:a05:600c:4f53:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-48727ee988cmr214094215e9.3.1774883675518;
        Mon, 30 Mar 2026 08:14:35 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873cd7d039sm72764705e9.15.2026.03.30.08.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:14:35 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 30 Mar 2026 19:14:15 +0400
Subject: [PATCH v5 1/2] dt-bindings: hwmon: Add TI INA4230 4-channel I2C
 power monitor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ina4230-v5-1-eeb322d95b3a@flipper.net>
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
In-Reply-To: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5469; i=alchark@flipper.net;
 h=from:subject:message-id; bh=aBqMH+pXtx2lPFe+U3MCl6hGT84m6NVw6corT3ozweg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSemhz+OOS4xt4Lr437+rQ4eRpi3sk36xofyXFtfyh04
 Hfy9d+SHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz1JE+G/+6Olj90d6ZmpO9pr+vJmrzH/+sTOzGpuu8Mq2MvdLNWXWBkuLL9X/n
 2eexrHUS3Hv3x7+rbxbq6y1elOHi1KmzKucn6kR0A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add TI INA4230, which is a 48V 4-channel 16-bit I2C-based
current/voltage/power/energy monitor with alert function.

Link: https://www.ti.com/product/INA4230
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 134 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
new file mode 100644
index 000000000000..d9b5f9857249
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,ina4230.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments INA4230 quad-channel power monitors
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description: |
+  The INA4230 is a 48V quad-channel 16-bit current, voltage, power and energy
+  monitor with an I2C interface.
+
+  Datasheet:
+    https://www.ti.com/product/INA4230
+
+properties:
+  compatible:
+    enum:
+      - ti,ina4230
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    description: Required only if a child node is present.
+    const: 1
+
+  "#size-cells":
+    description: Required only if a child node is present.
+    const: 0
+
+  vs-supply:
+    description: phandle to the regulator that provides the VS supply typically
+      in range from 1.7 V to 5.5 V.
+
+  ti,alert-polarity-active-high:
+    description: Alert pin is asserted based on the value of Alert polarity Bit
+      of the CONFIG2 register. Default value is 0, for which the alert pin
+      toggles from high to low during faults. When this property is set, the
+      corresponding register bit is set to 1, and the alert pin toggles from
+      low to high during faults.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+patternProperties:
+  "^input@[0-3]$":
+    description: Optional subnodes for four input channels. Each subnode
+      describes one input channel. Input channels default to enabled in the
+      chip. Unless channels are explicitly disabled in device-tree, input
+      channels will be enabled.
+    type: object
+    additionalProperties: false
+    properties:
+      reg:
+        description: Must be 0, 1, 2 or 3, corresponding to the IN1, IN2, IN3
+          or IN4 ports of the INA4230, respectively.
+        enum: [ 0, 1, 2, 3 ]
+
+      label:
+        description: name of the input source
+
+      shunt-resistor-micro-ohms:
+        description: shunt resistor value in micro-Ohm
+
+      ti,maximum-expected-current-microamp:
+        description: |
+          This value indicates the maximum current in microamps that you can
+          expect to measure with ina4230 in your circuit.
+
+          This value will be used to calculate the Current_LSB to maximize the
+          available precision while ensuring your expected maximum current fits
+          within the chip's ADC range. It will also enable built-in shunt gain
+          to increase ADC granularity by a factor of 4 if the provided maximum
+          current / shunt resistance combination does not produce more than
+          20.48 mV drop at the shunt.
+        minimum: 32768
+        maximum: 2147483647
+        default: 32768000
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: hwmon-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@44 {
+            compatible = "ti,ina4230";
+            reg = <0x44>;
+            vs-supply = <&vdd_3v0>;
+            ti,alert-polarity-active-high;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            input@0 {
+                reg = <0x0>;
+                /*
+                 * Input channels are enabled by default in the device and so
+                 * to disable, must be explicitly disabled in device-tree.
+                 */
+                status = "disabled";
+            };
+
+            input@1 {
+                reg = <0x1>;
+                shunt-resistor-micro-ohms = <50000>;
+                ti,maximum-expected-current-microamp = <300000>;
+            };
+
+            input@2 {
+                reg = <0x2>;
+                label = "VDD_5V";
+                shunt-resistor-micro-ohms = <10000>;
+                ti,maximum-expected-current-microamp = <5000000>;
+            };
+
+            input@3 {
+                reg = <0x3>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ff935e197c21..acfa0b0585a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12574,6 +12574,12 @@ S:	Maintained
 F:	Documentation/hwmon/ina233.rst
 F:	drivers/hwmon/pmbus/ina233.c
 
+INA4230 HWMON DRIVER
+M:	Alexey Charkov <alchark@flipper.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
+
 INDEX OF FURTHER KERNEL DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 S:	Maintained

-- 
2.52.0

