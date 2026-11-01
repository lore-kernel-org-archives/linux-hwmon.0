Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571296;
	b=nJnm4DB1AETe8olN6afMESLhIVUSjq9buvp7PWGhEe1DES+IKT6KCJ1pzONoViDs2YfR
	 faPJAd2TuQSsizM3joBAulGS5SMuo335zSAoi2njACcbJoG1+15ae7VWnkcUN53+eURQV
	 XszLKEzjqZv5cge4z6QvwYzOUI9a3oFBYIIo96tCHqAfhF3IswZkejTCfxpcQlIgu8ocS
	 0iZmXUmyv3934HpB2XNKxbcTS6xwq6yA813aFQ6wO2Dw/mqIbEsZjXak9RpFlUeLgWU54
	 I1qF2aW7gB652P62gXe3bfASPlnQZMqyHlEfKTUdS9lSC96taZJjcV/qNa1jhhcnkgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571296;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=EJsgn5oEcuMKaetEplzdzOWCgpJy7BGEs2cR/7yqfdc=;
	b=D8SzRllxdnP4VDPxksfo7s32oXKfAe9xfAH4KYzGApVMyy2HRIPxOb1wKYhKaSz6WtZR
	 e3fBW5J8Hbu2OxmVBd7ql0hAeSvLwolDnFybppKqw48U0PZx2LyqSvCcxClLgHaCMgi7U
	 itIhn+0v1fUTpEKjMw3B34DbwbyqsqPqLuX4o85vdKfs/sECdh2ZChsmtrE47sY6uWf8w
	 c9R4aU0P3ysJqQhC+qrLdxvpqE4JosQrNzqtuVA4VW5kfe+ltCUtjMEO/U4s/QJHsOWgh
	 kHpjU1NtGGCCaduU5C2ellDcpppkwXiOhrfpb1t0zVpVe06AAoX3DCqmm9BJqEx+7Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PM5ZYU4Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D3606A327;
	Sun,  1 Nov 2026 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PM5ZYU4Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83A21F00A16;
	Sun,  1 Nov 2026 22:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571295;
	bh=EJsgn5oEcuMKaetEplzdzOWCgpJy7BGEs2cR/7yqfdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PM5ZYU4YZ/vyzhQ0LqUFTyaRk3hCNjjuNnZL2Z5D+m7R33umEaDDbETOx7WebzVWO
	 0Fwy9LwK8Gxz6MX8st2IxnvcV4tOFxTKHFcJ2Cp2fH72/Qrnwk2oNHNTbgJHPDgVF2
	 ZkLBAwI89axlWRBFDaTRRoAsN5imQz83mKEgB4lNcTooc0xvCYTnj/jLQPSiQbR9MQ
	 yCUgHD2jMaaiJvNfpAwhMVbtafrE9W0jyDhe2xaAwbxzxt9iUoI+splebBRyWB+Mz0
	 wJlqS6knDMceggTxm/OtzvxpChj04xCZ2tcUR821l6r8S551Wc2lj3a7GkwjR3zF+z
	 RvSoA4YdMZxyw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 01 Nov 2026 23:14:35 +0100
Subject: [PATCH v2 2/7] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-2-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.16.0

The third generation Power Management Controller (PMC3) accesses SoC
block control and reset registers through the Processor Monitor Bus
(PMB). Describe the BCM6846 PMC and PMB.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
I considered even just using the PMB but the PMC has more stuff and
it seems natural to let it live in a simple-mfd node.
---
 .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     | 39 +++++++++++
 .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    | 42 ++++++++++++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     | 31 +++++++++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         | 80 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 include/dt-bindings/clock/brcm,bcm6846-pmb.h       | 42 ++++++++++++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       | 11 +++
 7 files changed, 251 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
new file mode 100644
index 000000000000..519606522c8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm6846-pmb-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 PMB clocks
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The Processor Monitor Bus (PMB) provides access to the RDP and BIU PLL
+  outputs, the Runner clock, the crystal output, the PVTMON acquisition
+  clock and the clock gates in block power-control zones. Clock indices
+  are defined in dt-bindings/clock/brcm,bcm6846-pmb.h.
+  The PLLs and crystal output use a 50 MHz reference clock.
+  Zone clocks require their associated blocks to be powered.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-clock
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ref
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml b/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
new file mode 100644
index 000000000000..9bf52cf097a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/brcm,bcm6846-pmb-pvtmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 PMB process, voltage and temperature monitor
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The process, voltage and temperature monitor (PVTMON) is a child of
+  the Processor Monitor Bus (PMB) controller and uses its indirect
+  register interface. It measures die temperature and seven voltages,
+  including a diagnostic test input.
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-pvtmon
+
+  clocks:
+    maxItems: 1
+    description: PVTMON acquisition clock
+
+  resets:
+    maxItems: 1
+    description: PVTMON analog-acquisition reset
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - resets
+  - '#thermal-sensor-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
new file mode 100644
index 000000000000..d2a85266e36a
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus reset controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The reset controller is a child of the Processor Monitor Bus (PMB)
+  controller and uses its indirect register interface.
+
+  Each reset specifier identifies a logical reset group, which may span
+  several blocks that must be reset together.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-reset
+
+  '#reset-cells':
+    const: 1
+    description: Reset group ID from dt-bindings/reset/brcm,bcm6846-pmb.h
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
new file mode 100644
index 000000000000..a4a77fed94d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The Processor Monitor Bus (PMB) connects the third generation Power
+  Management Controller (PMC3) to the control registers of miscellaneous
+  independent hardware blocks.
+
+  The controller provides configuration, arbitration and four keyhole
+  interfaces for indirect register access.
+
+  Child nodes describe independent hardware blocks accessed over the PMB.
+  These provide global resources and even resources for each other.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb
+
+  reg:
+    maxItems: 1
+    description: PMB configuration, keyhole and address mapping registers
+
+  clock-controller:
+    type: object
+    $ref: /schemas/clock/brcm,bcm6846-pmb-clock.yaml#
+
+  reset-controller:
+    type: object
+    $ref: /schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+
+  hwmon:
+    type: object
+    $ref: /schemas/hwmon/brcm,bcm6846-pmb-pvtmon.yaml#
+
+required:
+  - compatible
+  - reg
+  - clock-controller
+  - reset-controller
+  - hwmon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/brcm,bcm6846-pmb.h>
+    #include <dt-bindings/reset/brcm,bcm6846-pmb.h>
+
+    /* Called PMB Processor Monitor Bus in vendor tree */
+    bus@ffb20100 {
+        compatible = "brcm,bcm6846-pmb";
+        reg = <0xffb20100 0x200>;
+
+        pmb_clk: clock-controller {
+            compatible = "brcm,bcm6846-pmb-clock";
+            clocks = <&osc50m>;
+            clock-names = "ref";
+            #clock-cells = <1>;
+        };
+
+        pmb_reset: reset-controller {
+            compatible = "brcm,bcm6846-pmb-reset";
+            #reset-cells = <1>;
+        };
+
+        hwmon {
+            compatible = "brcm,bcm6846-pmb-pvtmon";
+            clocks = <&pmb_clk BCM6846_CLK_PVTMON>;
+            resets = <&pmb_reset BCM6846_RESET_PVTMON>;
+            #thermal-sensor-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eb4b3b631e82..fa95f2dec63c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5446,7 +5446,13 @@ N:	bcm[9]?6878
 
 BROADCOM BCMBCA PMC3 PMB DRIVER
 M:	Linus Walleij <linusw@kernel.org>
+F:	Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
+F:	Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
 F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
+F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
+F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
+F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
+F:	include/dt-bindings/reset/brcm,bcm6846-pmb.h
 
 BROADCOM BDC DRIVER
 M:	Justin Chen <justin.chen@broadcom.com>
diff --git a/include/dt-bindings/clock/brcm,bcm6846-pmb.h b/include/dt-bindings/clock/brcm,bcm6846-pmb.h
new file mode 100644
index 000000000000..548a18ed7959
--- /dev/null
+++ b/include/dt-bindings/clock/brcm,bcm6846-pmb.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_BRCM_BCM6846_PMB_H
+#define _DT_BINDINGS_CLOCK_BRCM_BCM6846_PMB_H
+
+#define BCM6846_CLK_RDPPLL_CH0	0
+#define BCM6846_CLK_RDPPLL_CH1	1
+#define BCM6846_CLK_RDPPLL_CH2	2
+#define BCM6846_CLK_RDPPLL_CH3	3
+#define BCM6846_CLK_RDPPLL_CH4	4
+#define BCM6846_CLK_RDPPLL_CH5	5
+#define BCM6846_CLK_BIUPLL_CH0	6
+#define BCM6846_CLK_BIUPLL_CH1	7
+#define BCM6846_CLK_BIUPLL_CH2	8
+#define BCM6846_CLK_BIUPLL_CH3	9
+#define BCM6846_CLK_BIUPLL_CH4	10
+#define BCM6846_CLK_BIUPLL_CH5	11
+#define BCM6846_CLK_RUNNER	12
+#define BCM6846_CLK_XTAL_OUT	13
+#define BCM6846_CLK_PVTMON	14
+#define BCM6846_CLK_PERIPH_ZONE0	15
+#define BCM6846_CLK_PERIPH_ZONE1	16
+#define BCM6846_CLK_PERIPH_ZONE2	17
+#define BCM6846_CLK_PERIPH_ZONE3	18
+#define BCM6846_CLK_MEMC		19
+#define BCM6846_CLK_USB_ZONE0	20
+#define BCM6846_CLK_USB_ZONE1	21
+#define BCM6846_CLK_USB_ZONE2	22
+#define BCM6846_CLK_USB_ZONE3	23
+#define BCM6846_CLK_WAN_ZONE0	24
+#define BCM6846_CLK_WAN_ZONE1	25
+#define BCM6846_CLK_WAN_ZONE2	26
+#define BCM6846_CLK_XRDP_ZONE0	27
+#define BCM6846_CLK_XRDP_ZONE1	28
+#define BCM6846_CLK_XRDP_ZONE2	29
+#define BCM6846_CLK_RUNNER0	30
+#define BCM6846_CLK_RUNNER1	31
+#define BCM6846_CLK_RUNNER2	32
+#define BCM6846_CLK_PCIE0		33
+#define BCM6846_CLK_PCIE1		34
+#define BCM6846_CLK_BIU		35
+
+#endif
diff --git a/include/dt-bindings/reset/brcm,bcm6846-pmb.h b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
new file mode 100644
index 000000000000..6b1a6baac1c6
--- /dev/null
+++ b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
+#define _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
+
+/* XRDP packet engine and its three Runner cores. */
+#define BCM6846_RESET_XRDP	0
+
+/* Process, voltage and temperature monitor analog acquisition reset. */
+#define BCM6846_RESET_PVTMON	3
+
+#endif

-- 
2.56.0

