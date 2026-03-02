Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E435DA4E
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448977; cv=none; b=eqI9fLA/2SZdDRcfLZKqZdcCDYpQWureeRzbY7xdHbm/n6yJtPwEvFsKqWOuVgymnAL/2N7SFK2I0e1ZKDGDHUbsDc6S8XTjb+fYcUQDG9RjjegDsLE46jef7KVPFdb55+tai/IsBaZdfqLExfOSd/Ec24capwjYV+IMagWhhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448977; c=relaxed/simple;
	bh=KH2uudCui9HwdJauTYFJGKmjM2/Vnk7LTtJu9DXEN/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S12rLwmxOHlc5lA46YHTOv3/83Ky2Uhxr1aGow4M3+gm7pPRha1JtasIWQbOVOcx8kjR057yOug0vxqxGXyBBc/3hNArLT/02YJxUWwLDgpEl3Z105+qpsMzTK0jZjKMle9Aad1vev357+wyz7fEVxfXVkNFZu91vUz2FXPfuB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=A3xmsNQg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="A3xmsNQg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso46976905e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772448971; x=1773053771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xZaOgwi6pvvEJlhn/vm/WnEuKkt2vDq71PZkVVqHzo=;
        b=A3xmsNQgNbHNRTr5JitmbuvlloYpd8C4O//6xYMgMIBlOXLRscc4iK/LcduHs03YXG
         105VWPxiAjEbSxbSI9RDhwdAA01dQf6kMkgGqZzsJsyg9w22qtIuKG2DqMEcDjST4PqZ
         IJkfQBss5cZUEK9RoAJWjT4XULP6Ly9YIBI2EDWuQABw/QXFnxuaEjburq9+ang8rCAg
         0yQqZagD5B7RhEO+wVK2mFDBhFXkc3G5wFBu8dtSXND2dapsimsrRwcyal7CbFpKVHeC
         7aJvJW3iw5AGcpfsScA5rzFu6VG9mwfyLEo8GQiDAC52jdwm9EsO3WlI8LKeJUTh/U+O
         oiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448971; x=1773053771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xZaOgwi6pvvEJlhn/vm/WnEuKkt2vDq71PZkVVqHzo=;
        b=uMLKrQjJJI+oiTDjxYG4XRiDb9ePmU5x14sVGEUPXlTqGoH1VtV9SJvznpT5wGzF7V
         2Dlf2y0qjlig9qxVDY4O4D4YsqUYDn5ETNd+XgGMJ3JXmnAuxs3HFXXcsb3ZAZe+PtDh
         Z4NFTipIiRZDPnlJyB9f/+Y6nUqIruuupf7265VyzTsbidUBUDYAET37gyIVzmsDWkGC
         vPzXuJg4rKe/Gz40vxQQHW5g1ZyE4xMH7+bJmy1BqX/kN4DNnjJJ27S0yVLUOvxzUQtp
         9S+63F4UNO/g810gU8CcZjQKmZUZBxa6cqqFpOVG5iS3x+nSEpx7bSmmoXNAJQVWFCOX
         XXtw==
X-Gm-Message-State: AOJu0YyEsw3vc3S8CbD2vSGmI7C9ijO5VswmErXcjTH1ahJgWyUy6bdY
	L+4AWGYN9Ipr9jz0284sRKKhSvXhsqWvmAWZ03o06Mb2mKJP0fcBMrx08RSsU+ZbR3c=
X-Gm-Gg: ATEYQzxKVc1iFYawBG+m3IOZcfziChjSYjpHDUpfmfjqAQsw6mwL+wmWeChSloLUYUQ
	jKBwGEZSTit0qAvRFs+CNz2k1Ts+b7sFtgac9axJ27NpHUJvAzcUz3SHCJfCG9y3bwZQCuCLgg6
	0ixxCwP+oztczTlti+POFnTBuSZT3YBDRxKF88kxg/06uPMkqjhYc5u7Ey0ZqLPEr0d/ZHz+xXI
	UTwyIX+rf+uGg5j1/i8+QcIMlyiDfBK2zu7dJq4Hhxo0Uss4RG2OxjIh0f7vxbAtmAoeItcmaQs
	0LCwhPyY/iiv47ImaQ/bNKpwV1Dxl4V9ct/Rn7qpDImTJhh4jcMGwqX+fYDQSZdP/Kd7N2yjQ9A
	rSwhdESl4ZmS9f+gIOIYO/C3vl0ZM19ml+Rm2n+OHT7EbTjilY2Th7PzT8RatnNWQ7f8G1DDyIc
	7hOnbXzLhD4ZaixpapBb0wAnDZ5v9xfFfi/ZvJDdoRr8YyhmobvzKVcNRYqBqkwwv1X1BF88tk4
	Ho=
X-Received: by 2002:a05:600c:3b1f:b0:483:7b99:131d with SMTP id 5b1f17b1804b1-483c993a063mr226630005e9.16.1772448970308;
        Mon, 02 Mar 2026 02:56:10 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-44-101.alshamil.net.ae. [94.59.44.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfccff00sm133263075e9.25.2026.03.02.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:56:10 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Mar 2026 14:55:55 +0400
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add TI INA4230 4-channel I2C
 power monitor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-ina4230-v2-1-55b49d19d2ab@flipper.net>
References: <20260302-ina4230-v2-0-55b49d19d2ab@flipper.net>
In-Reply-To: <20260302-ina4230-v2-0-55b49d19d2ab@flipper.net>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5204; i=alchark@flipper.net;
 h=from:subject:message-id; bh=KH2uudCui9HwdJauTYFJGKmjM2/Vnk7LTtJu9DXEN/g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQuzTmpq/How8qQtavuPNNbyHyg2nfSxA17a6O+z9vv8
 PxfkBtTU8dEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBTvaWe4Z8aY6vetQmzvRKKAmI8FxlLh6swaNzWVojsnf8s6OrM8A8M/0yer1V
 Lso3zt2s9cWF/antgAFvPSr0jBxlqZ9xmlig6zwMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add TI INA4230, which is a 48V 4-channel 16-bit I2C-based
current/voltage/power/energy monitor with alert function.

Link: https://www.ti.com/product/INA4230
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 130 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
new file mode 100644
index 000000000000..69839e7a3197
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
@@ -0,0 +1,130 @@
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
+    description: The node contains optional child nodes for four channels.
+      Each child node describes the information of input source. Input channels
+      default to enabled in the chip. Unless channels are explicitly disabled
+      in device-tree, input channels will be enabled.
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
+          This value will be used to calculate the Current_LSB and current/power
+          coefficient for the pmbus and to calibrate the IC.
+        minimum: 32768
+        maximum: 4294967295
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
index 4d879f6a7b51..bc6f1836bcb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12511,6 +12511,12 @@ S:	Maintained
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

