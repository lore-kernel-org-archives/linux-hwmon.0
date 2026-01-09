Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B187B23D294;
	Fri,  9 Jan 2026 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949736; cv=none; b=ipy84vTNxEdvKB1zPSX71WHUzc4MPjP0F59Zjizw/c8XuTRNyEtTABVnAUqlPjTnrQlCpDFdSmo7xEUh77VMD9ZKfmNuE3wIOS6fueRizde2hQ/125Fu5pOoQ4WQY0uem6DT5KzREXtUV8tK7CawoTDvOt3k0C1lA0OQFb4qvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949736; c=relaxed/simple;
	bh=LRDMt9BCBusDLYZlrSQPH0gcBvR6YZomZPzxJtyhv0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NRBMKshfpLFzPP6sEf0ZJtInES09gq5P4LivcqETExOwi1bHghWzUT5HUJQxYzSXzY0DYWIs7blrl92+GEhwBN2fCXHNno3v2vhysjgWpRpCBb5oMnHeWqnSBIBOQk54QvNlQvRnXGM21jezLPUlfolxUz5VD/nqzjoKW/ubT6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
	by app1 (Coremail) with SMTP id TAJkCgAHAWmVxWBpCpGSAA--.63912S2;
	Fri, 09 Jan 2026 17:08:38 +0800 (CST)
From: hehuan1@eswincomputing.com
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com,
	hehuan1@eswincomputing.com,
	weishangjuan@eswincomputing.com
Subject: [PATCH v1 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Date: Fri,  9 Jan 2026 17:08:36 +0800
Message-Id: <20260109090836.512-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260109090718.442-1-hehuan1@eswincomputing.com>
References: <20260109090718.442-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgAHAWmVxWBpCpGSAA--.63912S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw15ur4DXF4xWF4xCF1DGFg_yoW5Ww1fpa
	1kCryUGr4fXryxu3y7tF10kF1ftws5CFWUAr1Iqa4rKF1DXas0qw43KF15Wa47Cr1xXay3
	uF4aqry2y3WDA3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHlksUUUUU=
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/

From: Huan He <hehuan1@eswincomputing.com>

Add device tree binding documentation for ESWIN EIC7700 Process, Voltage
and Temperature sensor.

The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
power domains respectively.

Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Signed-off-by: Huan He <hehuan1@eswincomputing.com>
---
 .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
new file mode 100644
index 000000000000..72693828a461
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
@@ -0,0 +1,92 @@
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
+  ESWIN EIC7700 SoC integrates embedded process, voltage and temperature
+  sensors to monitor the internal SoC environment. The system includes two
+  PVT sensor instances. The PVT0 monitors the main SoC power domain. The
+  PVT1 sensor monitors the DDR core power domain.
+
+properties:
+  compatible:
+    const: eswin,eic7700-pvt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: clk
+
+  interrupts:
+    maxItems: 1
+
+  label:
+    description:
+      Human readable identifier used to distinguish between different PVT
+      instances and generate descriptive sensor labels. Typically "pvt0"
+      for SoC PVT sensor and "pvt1" for DDR core PVT sensor.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: rst
+
+  '#thermal-sensor-cells':
+    description: Thermal sensor cells if used for thermal sensoring.
+    const: 0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - label
+  - resets
+  - reset-names
+
+examples:
+  - |
+    pvt@50b00000 {
+      compatible = "eswin,eic7700-pvt";
+      reg = <0x50b00000 0x10000>;
+      clocks = <&clocks 244>;
+      clock-names = "clk";
+      interrupts = <349>;
+      interrupt-parent = <&plic>;
+      label = "pvt0";
+      resets = <&reset 111>;
+      reset-names = "rst";
+      #thermal-sensor-cells = <0>;
+    };
+
+    pvt@52360000 {
+      compatible = "eswin,eic7700-pvt";
+      reg = <0x52360000 0x20000>;
+      clocks = <&clocks 245>;
+      clock-names = "clk";
+      interrupts = <350>;
+      interrupt-parent = <&plic>;
+      label = "pvt1";
+      resets = <&reset 112>;
+      reset-names = "rst";
+      #thermal-sensor-cells = <0>;
+    };
+...
-- 
2.25.1

