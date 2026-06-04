Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34AA37BE8B;
	Thu,  4 Jun 2026 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560346; cv=none; b=jaBncdBlejgDmKpt/Z/7LH+z4MZoBHKqTjEnSvRievzi5oboLzKtBFDI9hGN5luEJony3zyKzqVXzvQhZe98eXkD3L9BQp3jdLr95SAw1QY/ruuqiU4PfE1lldJtbw4hsQiUSJZUBHSLwpnuFXh5lAeFsM8yvqddztuggTA4qpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560346; c=relaxed/simple;
	bh=k/nZRHfqbAt0qxRgkvRw4WOdiOIXdQqfm31GU3E1xv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKCs/D/sakQVUDzVzINijxKbwrCEwlJiZ/qj0NReAgx/1fRzKy34Dwj0I+qWsFeasf7qf4TFmHhsHo1IdGpcg8aTVy5N/J0F7hS9BRcoNj/adNUW6BkOqZO6/xx7tL1O+1qDGOSZ5pr/4Wmhelv3I5aCpW1wlfwKeFC1cEPcz4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app2 (Coremail) with SMTP id TQJkCgB3i57IMSFqHZMhAA--.17950S2;
	Thu, 04 Jun 2026 16:05:29 +0800 (CST)
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
	Huan He <hehuan1@eswincomputing.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Date: Thu,  4 Jun 2026 16:05:25 +0800
Message-ID: <20260604080525.152-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
In-Reply-To: <20260604080430.126-1-hehuan1@eswincomputing.com>
References: <20260604080430.126-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgB3i57IMSFqHZMhAA--.17950S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw43XrWrXF4fKr15KF1UGFg_yoW8tw4kpF
	4kCryDGr10qryxX3y7tF109F1ftws5CFW7Arn2q3WrKF1DJas0yr43Kr15Was7Cr1fXFW3
	ZFyaq34jya1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
new file mode 100644
index 000000000000..27cc90e52d4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
@@ -0,0 +1,63 @@
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
+    maxItems: 1
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
+      clocks = <&clocks 244>;
+      interrupts = <349>;
+      interrupt-parent = <&plic>;
+      label = "pvt0";
+      resets = <&reset 111>;
+      #thermal-sensor-cells = <0>;
+    };
+...
-- 
2.25.1

