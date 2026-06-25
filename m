Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6558B30676A;
	Thu, 25 Jun 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367926; cv=none; b=GBjeMPC4c43xGyfM+5MDfKTo8G9JRF/KOg/0LYsj7DpDZ1uPir6PIZdtjfFX3PRzahceIRuRpfhdENceY6oSUnYUoCnXBeM4O2cuU2J+t84y9Q4RKF2R+uVXolxD4xSQJPVo4H0MOvNIpYbq+1iCgHDQ8AtSb29zsX7RB2tgFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367926; c=relaxed/simple;
	bh=iuB46UZdgapFhx1Puyf62XJCCaIBLTSicHKKFybvaoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erUEOOg9OdYI/TJ59VE/UppDrqN8bEBpbbYCjHddJFvO8WlCSsktqXjKHYOcYtcSlg17MS15WD8X0xy4qiJ1ACZPj0Ks+EWTIN2NbQhgxHFrXa9Ds/k/yle6ZY2YD4XLA2N0brQg7UU5aq1cnrgHlS4LrBQhsFnmakQu0hJxFUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app2 (Coremail) with SMTP id TQJkCgDX656lxjxq8FwuAA--.48901S2;
	Thu, 25 Jun 2026 14:11:51 +0800 (CST)
From: hehuan1@eswincomputing.com
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com,
	dongxuyang@eswincomputing.com,
	Huan He <hehuan1@eswincomputing.com>
Subject: [PATCH v8 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Date: Thu, 25 Jun 2026 14:11:46 +0800
Message-ID: <20260625061147.1631-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
In-Reply-To: <20260625061049.1614-1-hehuan1@eswincomputing.com>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDX656lxjxq8FwuAA--.48901S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw43XrWrXF4fKrW3WFyrCrg_yoW8Kw1UpF
	s7CFyUGr1IqryxZ3y3tF109F1ftws5CFW7Arn2q3WrKF1Dtas0qa13KFy5ua4fCr1fXFW3
	uFyaqry7A3WDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXJ5wUUUUU=
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/

From: Huan He <hehuan1@eswincomputing.com>

Add device tree binding documentation for ESWIN EIC7700 Voltage and
Temperature sensor.

The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
power domains respectively.

Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Signed-off-by: Huan He <hehuan1@eswincomputing.com>
---
 .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
new file mode 100644
index 000000000000..58ec8635dce3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/eswin,eic7700-pvt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EIC7700 PVT Sensor
+
+maintainers:
+  - Yulin Lu <luyulin@eswincomputing.com>
+  - Huan He <hehuan1@eswincomputing.com>
+
+description:
+  ESWIN EIC7700 SoC integrates embedded voltage and temperature sensors to
+  monitor the internal SoC environment. The system includes two PVT sensor
+  instances. The PVT0 monitors the main SoC power domain. The PVT1 sensor
+  monitors the DDR core power domain.
+
+allOf:
+  - $ref: /schemas/hwmon/hwmon-common.yaml#
+
+properties:
+  compatible:
+    const: eswin,eic7700-pvt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PVT enable clock
+      - description: APB bus clock
+
+  clock-names:
+    items:
+      - const: enable
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - resets
+  - '#thermal-sensor-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sensor@50b00000 {
+      compatible = "eswin,eic7700-pvt";
+      reg = <0x50b00000 0x10000>;
+      clocks = <&clocks 244>, <&clocks 234>;
+      clock-names = "enable", "apb";
+      interrupts = <349>;
+      interrupt-parent = <&plic>;
+      label = "pvt0";
+      resets = <&reset 111>;
+      #thermal-sensor-cells = <0>;
+    };
+...
-- 
2.34.1

