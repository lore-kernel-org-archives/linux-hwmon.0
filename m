Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697086;
	b=GWOZikGnFqJRbT95uQxNnx89LCtxMk8jrb7CSOWQ9VlWpJFfhfzjY2SNryT5KkiU9Xia
	 89VrScg4bu8EvXapllXCNK/RRl3wLJ4AiIu+AbTuJMkw9N5Kq1C8Evce3HPEEP4EXz8QG
	 wP/HEeIV5EOZd866/AOgpSody5BSp61gni6+xB6N3/dPVDwmSgW6n0lbgwcHzE9yLY6Bc
	 qV3NT7D5EYotjuzGK+d6Ken7rg6OQBXO54hNBhsTiEv2UD7QgSXigWFyuKYMhfB8jZvi4
	 eDO1IgMbgLzF/xJnLN0slouMnQPiD40BxpNJ/oy0hpNdk9T2+GvNFucVj4IhKfbM75A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697086;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=A20fLKROFsB+9jgy05kR5kKvj3tj2h6ibj4IHp/qrKg=;
	b=uHJQK1IgwlDLT7JRSYQEk5WgY+iQFKx+OIeeD74u5Her76CCTXfw8RU3BvyCGvUq9jzr
	 dZPaJXGA8xNY4F5oKP/hzX4Yp+7V87UrAexX7z3aA4SiWAno2A8nRLjDGFt6msJZyvs3G
	 tMdG03c3s1TM4NJeCAmhshlEID0rge051LwOz9pjMYofok5hzYQDl5VEGJjwN2SYQ38P2
	 uOnj/V4paxxCaJ5A2kGdij4iJ0zNTtXuJtIeg8s7+IEYFpWjX5D6Z6gavrsJVrgWVmohR
	 j+ScC6zUPE8BbexoZBz3+dPR4jDqdnhsmePEHwJ9KOnPelEq2QhqtD7Wq7X2XdiIHZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MNtN0JMY;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233A606A33B;
	Thu, 26 Nov 2026 12:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6233A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MNtN0JMY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B17109597;
	Thu, 26 Nov 2026 13:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795697080; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=A20fLKROFsB+9jgy05kR5kKvj3tj2h6ibj4IHp/qrKg=;
	b=MNtN0JMYCosKEqcmPTVBuJrziYc0Q3Efs21+c88cNwqYcdpiCQblShv4j00diN5tgnciTD
	BgW97yBFnmvytnXB0B+B8PbUEfPdfBbjDNiJ7yBh418zf3e+bGXKRMvbhwubj7cQ+me3Lj
	rukBxyji42/ZrzvNbm+jzxB58Alp3QGO3yXzmd+xPrjRY/ZlLb8m0q4wtjGVMoaz57xWF7
	yuC8zXMnO5BsLBAx8e5KcM1RfSZi+gJxzimFzjFFW9W/U8zk5wfAJ5XxrpEnw7hdDz0TF3
	gmj1D3V3obqggFBr5LPDQAzFUC97mzkIGUtKbWjY8LtfaO4DmtrxBE1gKDw+Fg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
Date: Thu, 26 Nov 2026 13:44:01 +0100
Message-ID: <20261126124402.3015577-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126124402.3015577-1-lukma@nabladev.com>
References: <20261126124402.3015577-1-lukma@nabladev.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add binding description for National/TI LM77 temperature sensor.
When compared to LM75 - it has two output pins one for interrupt
and another one to signal the critical temperature alarm.

It also has only two I2C address pins (A0 and A1) - possible I2C
addresses are: 0x4[89ab].

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes for v3:
- New patch, as this IC description is added to Documentation/hwmon
  as a separate entry and not to trivial devices

Changes for v4:
- Add Reviewed-by tag

Changes for v5:
- Add Acked-by tag
---
 .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
new file mode 100644
index 000000000000..fbb6e711342c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm77.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: National Semiconductor / TI LM77 Temperature Sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM77 is a 9-bit plus sign digital temperature sensor and thermal window
+  comparator with a 2-wire (I2C) interface.
+
+  Unlike the LM75, which has a single alert output, the LM77 features two
+  separate open-drain outputs: an Interrupt (INT) output and a Critical
+  Temperature Alarm (T_CRIT_A) output.
+
+properties:
+  compatible:
+    const: national,lm77
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the device. Depending on the A0 and A1 pins, this
+      can be 0x48, 0x49, 0x4a, or 0x4b.
+
+  vs-supply:
+    description: +VS power supply regulator.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: |
+      The LM77 has two open-drain interrupt outputs.
+      - The first interrupt should be the INT pin (window comparator).
+      - The second (optional) interrupt is the T_CRIT_A pin (critical
+        over-temp limit).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@49 {
+            compatible = "national,lm77";
+            reg = <0x49>;
+            vs-supply = <&vcc_3v3_reg>;
+            interrupt-parent = <&gpio1>;
+
+            /* INT routed to GPIO1_12, T_CRIT_A routed to GPIO1_13 */
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
+                         <13 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
-- 
2.39.5

