Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1E38945E
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143036; cv=none; b=WCiNCmnTqfTjXsiu/UVQjHkugDTe6IIOj/TArxM5ggnn734qsZ7eQoFvXcl4hqSRbpChoyrd7QS9G759iereLVm4VnxZ8jYkbxgPVKcfuvyNZ4ZctqpwbS5qiq+6ninHpEvTtWNRP41ryp540f/YP6rKDpM86vX4vJsIFk3JC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143036; c=relaxed/simple;
	bh=vYR6R0xAlGyJOKPka5f5e+VU0LDMPSCdIMPETAplrI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDLT/a4hHHR7cwHU/1KjHJ7DQRmUzIaDIG5H1Nr53EQKrjhTd37x1wJdgSsM9RS0QU7YjyA5W2b4XeyFXE8Ne/55nIVTyK3PMeutZSJ5II8yFWWa9Hjd3CsF0xkcTnWCTWbKLlocckKUYsGLUaE5QSRyJZl5w3SyNsZ8Z5cy5Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=KEhz80wH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="KEhz80wH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso27829005e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773143034; x=1773747834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUaHHGjX//QqgU4DYt1eH54CJSDOOAyxvdOGOgcLp5o=;
        b=KEhz80wHM33B2aZGDfOVmVEFg9vFxtiki//7PG7Rob3owNkRkxqHBlCMdRg7NoU60c
         QAKAtpX/BeKG5WNsB2cVxnYbBN+BSeqjmPblj23oWMj5g5pEIr5eiCdEaXyjl/10OvpW
         AGXwQ2WU8Gv5cagIKOr9MuspjD6hVjUU5mocXwz23/2z1+oI89ocmai6pZDltPzk37ME
         tnfiIHm5CgHWnl+rrlM0ZqHLQ8ToecNJ7CzxkwQqU3bg3rZs3sLI59mBPi5mazkkvxTl
         4Aix3U1hPUo0xI0c7L9CsK3/0k5BlTHxv3AloVfiX7ysXjZSjHGYwdObREBdloWS9JGh
         923A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143034; x=1773747834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FUaHHGjX//QqgU4DYt1eH54CJSDOOAyxvdOGOgcLp5o=;
        b=vL5fLxjyFJqGvqcISIM5vBVaUPMi/ZVXHzrSg9vrZsiUTGghNlgoxyvCGomdDNm4/u
         3RwoYfa3DOrCGZCoZs7dZuFJYr4m7QzdKVvdkVg41IqumcyQd5uFpLDtC+5NVvLqmsTR
         4ongdtIHkWyqLb2b/a6lLYEY5HkzjBcbM/LB+T6hH/A/x4vcBpu9nZLzGTG6bozSwcXJ
         n3VlWY1/6J6+TEt0GzRMOfgKOhBZhmOEDjBCtlgDIMvg9CY86mT/V48gjfzmktE8fLta
         Mf/B6AhakqGJzF7YNu9EjRnuevRRigaBTA+IUYJWBmsmR3oR2JrH6/9onrnH4p0yUQSm
         XZBQ==
X-Gm-Message-State: AOJu0YwBl7gRX1E+xijE8RfM86DPBZVA68j/LECrC6z9LGAOAlK0YaKt
	CuL78+N9+Yxgq7hFGc+g6HmzmZTv5C8mQXOBgQr2g3ex2BZRGHMluSuHk5C4n5BNn/w=
X-Gm-Gg: ATEYQzyr0dRn5NiD4uf8MiItjY5Tubb4zxajSGNIEE+hbNDeEtxijB7n/MAPLAlXsXo
	JVjtG1XbZ0rWCrTnRV25gybk420mFQsvyGlXyltRI0kYrnqQWIPd7/NPQIGOIkvDsxjyhI7EBUG
	oiNBvNSV3Hx6OrSOrGbccOtCwyse4eR74qrWxYFXSFpOa8+6gBU5l9sUaZIe+K4VYQ8YVIuDSHE
	fM94f6/w8G2k16sApOM5xfDmTrz0P58ypqy2Oiu/0R+UpFg01JPqj8PkAwbBLW6P1P286ggqUHW
	BnkmTO1sVsodR7Zw0l1+nmCO07KtIh7bBV1KC1yB45n+H1CNd8OYglK0l18zO43hqDxQyOewBdf
	v0O+6wZmclFANt3DjjLpqllumVpLsh+c0A4vC6oPi1yBDd3cnu67yq8nsRZ628cBDsWthI5xpg0
	h8kKNL3EjH2Y3FUdiwLQK4ag07w+3Vh3BcPrXOH19Px0BTGJtE9Mcgc5ConxIRlj+nzIdzQKj9R
	u3isQ==
X-Received: by 2002:a05:600c:8b26:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4852697a5c1mr238645245e9.27.1773143033512;
        Tue, 10 Mar 2026 04:43:53 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f182sm96234825e9.5.2026.03.10.04.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:43:53 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 10 Mar 2026 15:43:46 +0400
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add TI INA4230 4-channel I2C
 power monitor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-ina4230-v3-1-06ab3a77c570@flipper.net>
References: <20260310-ina4230-v3-0-06ab3a77c570@flipper.net>
In-Reply-To: <20260310-ina4230-v3-0-06ab3a77c570@flipper.net>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5501; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vYR6R0xAlGyJOKPka5f5e+VU0LDMPSCdIMPETAplrI8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRuYP6x62joNA097RW+e/t9q8su6uZpVeaHZ11ZdOv2E
 eGpLyKzOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 Q0MdYx0jBi5OAZhqo+0M/+ziHyffnSDgGjHj0dozRhtkvuybvCb9hdiSav98Q9c3avsY/nB7iyu
 53081uaScW5DyRPv0tdYv+41Nvzhn3HO5Ibb1Oi8A
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
index 000000000000..f33e52a12657
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
index 1121276c59a1..10a330c5b44d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12516,6 +12516,12 @@ S:	Maintained
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

