Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654237AA74;
	Fri,  5 Jun 2026 02:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625160; cv=none; b=JXMBBniy48h17IY6yNbrg1/UUqDTa+xc+2kKkdtFF+rPOKgXInjJEi5ONiROwI2q6ogo1kCKM6tBVVLh3yBWbcOv4TbBXwLK+q08k1XRskxZVgHMEOeg0rQscfoLSwi2W3GpWLRF8jpwq+bee+m0IhcZa1qJA23Bg+PPwfY0/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625160; c=relaxed/simple;
	bh=hKtJBj6NbpM+g6kmjkW4KSom4gFoNvlMbMdPkKuqkbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fv8ZRuKdEr29LiU4ecZ0M5L0WRD+JljltnBoEzUssMGi0qRQP38qjEAKYXf8nz51EHAYXZx0V/Uj7SvQdLB9eaymZEtkCRTGsYVPBv9nsZPM/BBGeYFU8YMh6HiDFKlJ1vEgteBargag3qAOvpcRPB9nypxaHdExP7PUpNV/Z1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T1CCDkZS; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T1CCDkZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PQ
	iPGhl1R3XE1rfbgWoU/FE0wGrBbGWg/k63y7WgUeQ=; b=T1CCDkZS+/npucgaCG
	xUdlWIVEbPtWBrqvWdF4fSDqw0dMVEuRQoccHchWFJk2YJDKEU2ZYrVv/XF5p8HJ
	i69+i/aqOd5p/wohAVCc4dp9xylh3O2JjbYU+FqAYejm69dwUdwBk6u2L+zq7jGB
	IEM7vOrYQtNYEo682zJIhA+2k=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXVW_FLiJq4ffOBQ--.62174S3;
	Fri, 05 Jun 2026 10:05:03 +0800 (CST)
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
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
Date: Fri,  5 Jun 2026 10:04:48 +0800
Message-Id: <20260605020450.89638-2-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605020450.89638-1-zmzhu0630@163.com>
References: <20260605020450.89638-1-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXVW_FLiJq4ffOBQ--.62174S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr18KF18uF15Xr4kWFy3Arb_yoW8Kw1DpF
	Z5uF9rJr48XryxWw47GFykZ3W5Zr1kAa1j9r9xJw1SyF98XFsYvrZIkrW5XF1UCr10yFy3
	ZFWqyryxt3s7Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbID7UUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbC6A-h2moiLs8JFQAA3p

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add devicetree binding documentation for the Silergy SQ24860 eFuse.

The device is a PMBus hardware monitoring device which reports voltage,
current, power, and temperature telemetry. The board-specific IMON
resistor value is described with silergy,rimon-micro-ohms.

Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
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

