Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9573F54C5
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373081; cv=none; b=Z5iQ4Vx4ecvzETzF2MFCP82t7C7ow4pwjSbzqIOUAIgoIoqTRUWuHGXMmwUBz6OHuHaO0hr+xSck5Ap+aJhoWST6lP+VNoCa2+UWo1XJuRIsPscGJxqfhkxbuuSL22aAv5fusOSPm8scV50g4HB3Wyv5Pua/RYnMxhftmTv9r4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373081; c=relaxed/simple;
	bh=T2TbIB10b98M8VFnbRgkYEzSgOl2JI73PuH/i08J044=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWmdo4kVImpVR431UUOmvFNIckc39jYYLkcEZH/vVgGQyYTcDYCQUMITwMHOjlhSk4+PpzsnA4JQnDdyEeYzNxrOX+7aXDJNscb0kDIsylF+dBVlg5RfEBfB9zOOrIh3OjYLKbgJj5c9inEZ1ml6dYMjPn1tbijicxCwyxLjNCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zblgm2PK; arc=none smtp.client-ip=91.218.175.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zblgm2PK"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T2TbIB10b98M8VFnbRgkYEzSgOl2JI73PuH/i08J044=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789373075; v=1; x=1789977875;
 b=Zblgm2PKALYugzvDRWf9IF9Ys3ClEX0rguv1i5JhO9h6K74DCAigiTHanIx+nWPDoYQSkMnT
 ATW0hppLcOrT9TFoTCaDTlF4bNvPQwKCQv1iaF1LcSLYQNIiKYGmorpQvFXCz+OOFpL6IfZgRSk
 Gm3HahWM5ryVROBJmLYQQmvM=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 95a8c5560b05925a;
	Mon, 14 Sep 2026 08:04:35 +0000
X-Mizu-Trace-ID: 95a8c5560b05925a
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:03:54 +0800
Subject: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a dedicated
 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=T2TbIB10b98M8VFnbRgkYEzSgOl2JI73PuH/i08J044=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnLVxXsZdHWM1131i9na/d5B/8zkZlcXyN4dvLkb4zS8
 tuY6Di9o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCJOHYwMJ4p2KnTLf+Y67L/0
 98ub2scOzst+xPbF6Gzqb9cem/elkxgZFkW//RqtkzO/f+tWR0duw+u3r5Qt3RK6eOLEwOiSVgZ
 DDgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
of trivial-devices.yaml and into a dedicated binding. Describe their
integrated fan control and preserve the optional interrupt used by the
ALERT output. Permit use as thermal cooling devices via #cooling-cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 .../devicetree/bindings/hwmon/national,lm63.yaml   | 53 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  6 ---
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
new file mode 100644
index 0000000000000..f2e0993cfbef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm63.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LM63-compatible temperature sensors with integrated fan control
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM63 family provides local and remote temperature monitoring together
+  with fan speed monitoring and PWM fan control. Supported devices include
+  the National Semiconductor LM63, LM64 and LM96163.
+
+allOf:
+  - $ref: hwmon-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - national,lm63
+      - national,lm64
+      - national,lm96163
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@4c {
+            compatible = "national,lm63";
+            reg = <0x4c>;
+            #cooling-cells = <2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d1..e46912ba2fd66 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -368,16 +368,10 @@ properties:
           - mps,mpq82d00
             # Murata D1U74T-W power supply unit
           - murata,d1u74t
-            # Temperature sensor with integrated fan control
-          - national,lm63
-            # Temperature sensor with integrated fan control
-          - national,lm64
             # Temperature sensor
           - national,lm95235
             # Temperature sensor
           - national,lm95245
-            # Temperature sensor with integrated fan control
-          - national,lm96163
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor

-- 
2.55.0

