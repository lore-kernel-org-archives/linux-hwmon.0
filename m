Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049081D61B7;
	Fri, 12 Jun 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233439; cv=none; b=EsUve6BmQ/ScfDHjXbx/P83bCfbXXvjiU8FChTkiKNLv0W+3id6kd+orq/UBAX0zb8LMneUgb/C0PXtvbjrkrmdRR3bJirWOZdeQ9JuSY+utACVr7vrE9UlyDCDzxAzG4oc0Pw2u3zFH7x0r76ft+Iac06xKZ6ubVfdHISDZ6kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233439; c=relaxed/simple;
	bh=j2X+MA84vAwBRu3ivgpQi5hMeG3DjxwkdB24V8JcI00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BIOyxQvcofciuPqF37aPjHZQVVLEUr63CXRKEKglJLtBCrwgZivh10hF8cfOHoNqyWLp7Q+UoDFYw65ikZtGbOZAYlV7VFyYhKIHENgJbjgDraiH9rUM9zPkbRZTHtMqHUkoXJ0bP3RblYWvNdhoe+XQ6nIOkRTRHDjgH8Iyrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eA5+EoCF; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eA5+EoCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=46
	RsvdeETWrOH09RJ+ySWRL5LGyqtE6DLhYTz+CUvSg=; b=eA5+EoCFBlTtu+c0Qa
	bMOSzxLXwEx+7on4xbH9KbY7B8N+NKN6wmU/8qnaAqyGsAQLl70XgeUet4+9BD4f
	6M+q7vkZsEU0JNioNQLlF7qtlRVRyG1VdF8zCDuVdT6LjLxVJVkW0v5eZGdQUzbF
	V+9NihQtDg4xTRxKizNfqfMdA=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDHAqHqditqPP4wDA--.45071S3;
	Fri, 12 Jun 2026 11:03:10 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
Date: Fri, 12 Jun 2026 11:03:02 +0800
Message-Id: <20260612030304.5165-2-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260612030304.5165-1-zmzhu0630@163.com>
References: <20260612030304.5165-1-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHAqHqditqPP4wDA--.45071S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr18KF18uF15Xr4kWFy3Arb_yoW5JrWkpF
	Z5uF9rGrW8XryxW3y7GFy8Z3W5Zr1kCa1jgr9xJw1SyF98XFsYvrZIkrW5XF1UCr10yFy3
	ZFWqyryxt3s7CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jb73kUUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbC6A8+N2ordu80rgAA3s

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add devicetree binding documentation for the Silergy SQ24860 eFuse.

The device is a PMBus hardware monitoring device which reports voltage,
current, power, and temperature telemetry. The board-specific IMON
resistor value is described with silergy,rimon-micro-ohms.

Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/hwmon/pmbus/silergy,sq24860.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
new file mode 100644
index 000000000000..03ef82c11e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/silergy,sq24860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silergy SQ24860 eFuse
+
+maintainers:
+  - Ziming Zhu <ziming.zhu@silergycorp.com>
+
+description:
+  The Silergy SQ24860 is an integrated, high-current circuit protection and
+  power management device with PMBus interface.
+
+properties:
+  compatible:
+    const: silergy,sq24860
+
+  reg:
+    maxItems: 1
+
+  silergy,rimon-micro-ohms:
+    description:
+      Micro-ohms value of the resistance installed between the IMON pin and
+      the ground reference.
+
+  interrupts:
+    description: PMBus SMBAlert interrupt.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - silergy,rimon-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hw-monitor@40 {
+            compatible = "silergy,sq24860";
+            reg = <0x40>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <42 8>;
+            silergy,rimon-micro-ohms = <1600000000>;
+
+            regulators {
+                cpu0_vout: vout {
+                    regulator-name = "main_cpu0";
+                };
+            };
+        };
+    };
-- 
2.25.1

