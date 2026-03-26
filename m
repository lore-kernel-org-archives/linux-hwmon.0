Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7431393DE8
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555163; cv=none; b=PQA4uujo+5Xt2QNtdWHzDpHWWpZcArXtl8Oh+8/M46fErrz+r0D+JVMpArhEDAuwauxWcT03K+RQzzFbwfh49I6QOpj+wBAX24FjQKyJjoxgfoSC8OGIRhRZRpgqKVjdQO6IOu/7khKLC8gQhlHrgV1LyL1vrOiI3Rw5lfE0x2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555163; c=relaxed/simple;
	bh=pg18cJFdoxIiWqhryWU41mtt2pcNId3Z0xRyUEkJ7Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLLoQotyeBKzlGr+4x6GK/kOvR90CXjQmmHWaBfQPk0dUou2i3G6vUxCYyQfzabi1kUrMFh0ij4qG/3aaWGrWI2YZiOAN7juo/m2ddQgmUe4N7eO42loWA1bdE5pSP+hsj6KXffGVykUnTQRXgTyQelSGYoqN8LNP7phMpMvFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=PesAIS4F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="PesAIS4F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so11513215e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774555160; x=1775159960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3dA0/OmXMTjuCFxyS+Ww0yEAOk1EYtLRPmvSUBU78k=;
        b=PesAIS4FCJ++jn4veTDp41XEI0PDOtH8NCXQeMSkuA3xNCJP7kYVF3K8ETwi9ZPcAA
         rkB1tGJANOrPGjJpEiJqwETNVdUq7dCcCGt4jZVlZ9Z78gwafIILtKpLP8XlTcYh1//C
         Qk7n52kqx5g4TvWr5zJYtz78PJTimgMG1o+txdqO9ayH46LWqKaUJOPNg4oUxe5ZXDvc
         kkNO3cJxNSAJbFQnpFCo4nmIB/hKndRgAXJq37L5gky0UuypMfVO0feLB3uUkqiU/mG9
         0GTP9GYluaLN+gw5b/feBDVLMZP68VOjxIyRPRc2jVvwvyWjaHFe+XhzNUrxqE8cnuAb
         LLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555160; x=1775159960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E3dA0/OmXMTjuCFxyS+Ww0yEAOk1EYtLRPmvSUBU78k=;
        b=UemNRWoko9lei/4KgX7wg34x4K+YDEsQFi4pQLZ1zhSJdeo8L8SLZ7WDSKSmZ8WtK8
         zeivQTMKN/H6SycqX6F7Gn2knRfRffvvN9VbKw8tM8XCunoiDdnzmTAybbwl2yup/jtP
         rHEjxmWATGvRA6Ftzi1jtsFrTxrRNHYNRikksx6EB/AMGbXNUwdxi7LeX/GNxZaoe0jR
         lZQLnBVXFT5CmKzZZv0xDXA9QnEcoJyLqK1yHyil4oLeySu29lrJuW8RTvSJJnHQ8SDV
         8bjkesuzR5qCfI1T/eV+HDPwBJTX6xDyScQ8ZKJx7JuPiFokc6smP7PIteqErJSTbnLe
         NjUQ==
X-Gm-Message-State: AOJu0Yx22EtYDzFF+uPCkw6ZvzfohUrimsWy5XBUn8w9MJ8sXD8ty47q
	UFJMHTwJ3hZfrP1/CFDQLf5XVBkCrXY4MRzUerCKpePV/+jpK5LJK0Z3jqozVHWB8Nc=
X-Gm-Gg: ATEYQzyZ31uB+TdFlkh5n4kSMBjsqELYTfRi5mRCPxC/5I1dTR2uBleAtucSSsn4riW
	MUiZFYANk6BSaxKZlOQ1NqXhhT4kZscOA6doQL1g21ZzDbpsk25c641VkcxF7ysViI/JeDhHlvq
	W5FAA/fqpH1IOJ7SjVdyVQ5nkbbNPVs0q/447rTf5uP7sr1B4PjVqiSkbBLqryM28Icg2JB6Gwz
	IJIXHtw2BZ49+VdMlA9SjBNr5yzTqtqVQkJkPt2DaDa8GPF4P2D1+aCpn9/Q4L7M7rU0GOqoGG5
	uTDMVo2kTJYGm6TPoOCynW1i3lg/ta9RePsZB9LQ17rd6LOn6ubODjfMo08E9H7z50KpA17DNWk
	0cqI/6qx1AJ6xX0Y286E9yusV6Jxm1a7/Zb9VXHorTbe5GJSx12tme8uX1kdu7jgxVRUWeNTgA2
	rFTf61RZ7jCvTHHTxlA4wzWvQW+fKmmXZJgpWCzsjiJ7Gk/Cilck7iA8WwBnXGMtfjH1w6GTvW3
	Z/qcw==
X-Received: by 2002:a05:600c:8106:b0:485:3f58:d84 with SMTP id 5b1f17b1804b1-487160b496emr141865795e9.32.1774555160110;
        Thu, 26 Mar 2026 12:59:20 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm11339012f8f.27.2026.03.26.12.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 12:59:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Mar 2026 23:59:00 +0400
Subject: [PATCH v4 1/2] dt-bindings: hwmon: Add TI INA4230 4-channel I2C
 power monitor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-ina4230-v4-1-c1e312c09de7@flipper.net>
References: <20260326-ina4230-v4-0-c1e312c09de7@flipper.net>
In-Reply-To: <20260326-ina4230-v4-0-c1e312c09de7@flipper.net>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5501; i=alchark@flipper.net;
 h=from:subject:message-id; bh=pg18cJFdoxIiWqhryWU41mtt2pcNId3Z0xRyUEkJ7Js=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQenSCy/sYXkcdX327ZN2fSbeO7euY750br3OVmOcmu+
 ayI44bf9o6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BQx1jHiIGLUwCmuuwGw3+3cx1N64xXBAi2cIT9yO2UmlSYuWDvuxMPGMsvN0qtfLKG4X+M+9O
 HE+vubXzSGVW646HS5/e3Q6dtvRP3g03ni4ih7XwuAA==
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
index 000000000000..bed45c413206
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
index 9fbb619c6f42..3204e1b8753e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12536,6 +12536,12 @@ S:	Maintained
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

