Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D89446BE7
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627369; cv=none; b=eOcMTLVIJj001XxQxx2q6k4m/5Q6uRhULFSVxRopia3gdzF6YDjxFEq9oMtt0MquDbYnehL0SPuKKgS8emGDjqj/LGhBFBGz6Boum8skORIqssJ1EA58E3QqbgLr9ShDSCjibPNlyWJGuYLXGiPoS0yQr2YObe+vu1DQ3ivBQoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627369; c=relaxed/simple;
	bh=pwHdc4xDidEyHRzJlxAAc+R3pcovIEipUYbPKrufAeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6NUoRdXj9idGVDU1KQsM5/dIdt0aFJbQ+ETtTunJxEYJQWCQ8iDcNPhn330FPUG35R1JlCOSoW8RG3dz8CTMsBRgEBYK7IHIKckfxLy6S1GSlQHKXInAAUXHZil/FG0s/qDjQ//s1kjpGCGkOA+naFvzGdmmS4lihwjKzM+WLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pyvXEh1+; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pyvXEh1+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecIDF5Sj0XPmZVRlQb90B073F56+xkmiRBC5iOSs/nA=;
	b=pyvXEh1+tlrCfD2VnkLJbAfteZBLn39pr99L6lmszmLHtinreRBBDArdcZjgYuZNHkqqTE
	NO06fqccFmNerAHyLk3wU59+aNwIFPzgxJMOhNjhOYlGT2GHz0tV1IotTaARQ58wOcxmQw
	ms+t+HrO5tZn9D5Xuz1CO7xThthOGTE=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:28 -0700
Subject: [PATCH v2 2/6] dt-bindings: hwmon: Move LM63 family to a dedicated
 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ctl2301-v2-2-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2985;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=pwHdc4xDidEyHRzJlxAAc+R3pcovIEipUYbPKrufAeo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDoUK8sesD0n7ZXzec1bwxBm2mQ8fLFnsdtdQUvluj
 unMVdGVHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABPJ+MXw3/dd99plMv+ar02Z
 xXJCaOI7z6030o5MMHPbffrIBanstd6MDF21YTs+PHZ1Xmlxc2XD4rlac35PXPAi1V96FZuU9aO
 pDhwA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
of trivial-devices.yaml and into a dedicated binding. Describe their
integrated fan control and permit use as thermal cooling devices through
the #cooling-cells property.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 .../devicetree/bindings/hwmon/national,lm63.yaml   | 50 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  6 ---
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
new file mode 100644
index 000000000000..92b0094ff303
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -0,0 +1,50 @@
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
index 435c4baab436..aa62d245464c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -364,16 +364,10 @@ properties:
           - mps,mp9945
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

