Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA7F3403F7;
	Tue, 30 Jun 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810702; cv=none; b=KlOWG5HiWaw1W9+DuxG9cFZXbVkyqXXwPEEZcIbSQAkCIG1B6odsW5B0O8INgDvUHktuS2etv0nQs2fNMef3xF3AfR+c/MIk2TyxA3VI7yqrQY5SuIGE77K5X0IdshmbF2RF5D+fzPc/oNcX1ghbRCbUSUZKfB5LsYwr8q3bL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810702; c=relaxed/simple;
	bh=QNMwS0lMZsXdqbMsqFeYbmYpYB5amVx1FCR61nA8wR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AO3p/b810+luJwToh88oPTICxoKcs88fXMEXHx5eoBY4sn8eCmwUrL/KPZXDIO4GKpkgiZkiGBCfmrv4O/wjEtVr9k55AeWxpt0DudPx6KJhXLtQC2aeggKWvVWqAaSIMQvGjEj/uWwP19x2C6xbWBHuC477w/e7Ei/Wb0blYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgCHnaA6iENqoSUwAA--.36520S2;
	Tue, 30 Jun 2026 17:11:32 +0800 (CST)
From: dongxuyang@eswincomputing.com
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
	dongxuyang@eswincomputing.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Date: Tue, 30 Jun 2026 17:11:22 +0800
Message-Id: <20260630091122.1462-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgCHnaA6iENqoSUwAA--.36520S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr45AF1rKry5Gw47JF15twb_yoW5Jw13pF
	s7CFyUGr1xXryxZ3y3tF109F1ftws5CFy7Arn2q3WrKr1Dtas0qw43KFy5ua48Cr1fXFW3
	uFyaq34ay3WDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDgA7UUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Huan He <hehuan1@eswincomputing.com>

Add device tree binding documentation for ESWIN EIC7700 Voltage and
Temperature sensor.

The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
power domains respectively.

Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Signed-off-by: Huan He <hehuan1@eswincomputing.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
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

