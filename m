Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571290;
	b=2rk0CkxiqAaUH/i3RqNEJ6WUIsWPBgzQ5P6sOkZeuRpcOEAUghxcrVqU/A3ghBtRlctf
	 98lwEe0eU5Sz2uGIXEvKbAayDSAYl7zQW8Pu20zmWwr9BTflz9AsB0YcWpd9qDi5zwAWC
	 n5lzvKGm8gKfHr/5GjFABZQpUeis0LitqDrUQYYCs6wN+BYDLYDkOvEdNVF21ktf6UNLp
	 X/JpAL511D6AJqP8HkAQmeTEsTfljyaVlbmIglhMpxlnzDInUyjGm6iRk9oqC+sYDXqjw
	 ewegau9PJD8Nt47cdN+3UvT9BXYSCJA5Y2ksIwxixuAE02DtLWUIuYKE1nmsf1cJA7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571290;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=vVRN7WkiE3t1C9Cy29wA4wdbqE5m1RqnHkizzxaNbNc=;
	b=WI9wV3wqpoSkEnsbzpint4F0FWZpsCIEzS7FOs8GqE/jxhUxry4VCaOwylETi3fVD/v+
	 NDzACV8xdrArKkQ6hauPUlR9iRUya1jEKwcoHU8IeK6sAkQKyKzcuqocsB/Z8en34DAox
	 XXA9lSG+7SYpjRg5ay4CD1FOYJAkfD4sJk61bqWChWVLh39gHwszC50VbhejfXdOlIlmc
	 uUQ5km6Z2JOi29ngoGWpftD707VeTF4IlHMeWp4vbJ9u4lte/SPb+xG73IpPk9XgA8zqu
	 z+IkEsl7Voxw6+lYVHy2B6yHIND7dPLrqRMr+CB3qKruadGn9gK0kja0WYPxc3j+q+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fWH/9YQK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8643D606A326;
	Sun,  1 Nov 2026 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWH/9YQK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B51A1F00919;
	Sun,  1 Nov 2026 22:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571290;
	bh=vVRN7WkiE3t1C9Cy29wA4wdbqE5m1RqnHkizzxaNbNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fWH/9YQKh4UAf8iCZOoLLGonECfuH/KWclkzI8SxSfq1jLlr+arXH4ItINRDRHYHm
	 Rlo2mv/N++BNh7yoMc1Nw8U039kvS03cFkNnMXpPxrufxf+sQIz0ZhzUhPJPD+eZ2y
	 6rTZ8k1QkRJeKglMo7+rfwT0Pt3Azf7XbzaA6EqzYv7D6Mcz80wDgJjCSRhJJmyvOR
	 BSjacTt3ZvDeKfEhLf1JpCHxU9pkieJiKRNRzceJhGZGLp8VAEyAz3zYxGYBreC5ZP
	 /DDiP7xx3wryp5zWuxiu2o9r4fApdc5GuNbO3c6/qUHFDJJLMQpT9ZzzDLhPNQ7wHs
	 rXCoWx6OgqRjw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 01 Nov 2026 23:14:34 +0100
Subject: [PATCH v2 1/7] dt-bindings: mfd: Describe the BCM6846 PMC complex
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
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-1-455fe9eed5ee@kernel.org>
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

The third generation Power Management Controller (PMC3) has
different subdevices.

Identify the parent with the BCM6846-specific "brcm,bcm6846-pmc"
compatible.

Describe the complex as a simple-mfd with a PMB bus child owning its
register resource. Include the PMB clock and reset controllers and
PVTMON, with its acquisition clock and reset resources.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  | 82 ++++++++++++++++++++++
 MAINTAINERS                                        |  4 ++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
new file mode 100644
index 000000000000..78aef68bc318
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6846-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Power Management Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The third generation Power Management Controller (PMC3) contains several
+  register banks. This binding describes the Processor Monitor Bus (PMB)
+  interface within Procmon. The PMB child owns its register bank. The parent
+  provides address translation and does not own a register bank.
+
+properties:
+  compatible:
+    items:
+      - const: brcm,bcm6846-pmc
+      - const: simple-mfd
+
+  ranges:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  '^bus@[0-9a-f]+$':
+    $ref: /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+    description: PMB configuration, keyhole and address mapping registers
+
+required:
+  - compatible
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/brcm,bcm6846-pmb.h>
+    #include <dt-bindings/reset/brcm,bcm6846-pmb.h>
+
+    system-controller@ffb00000 {
+        /* Broadcom BCM6846 Power Management Controller complex */
+        compatible = "brcm,bcm6846-pmc", "simple-mfd";
+        ranges = <0x0 0xffb00000 0x21000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        /* Called PMB Processor Monitor Bus in vendor tree */
+        bus@20100 {
+            compatible = "brcm,bcm6846-pmb";
+            reg = <0x20100 0x200>;
+
+            pmb_clk: clock-controller {
+                compatible = "brcm,bcm6846-pmb-clock";
+                clocks = <&osc50m>;
+                clock-names = "ref";
+                #clock-cells = <1>;
+            };
+
+            pmb_reset: reset-controller {
+                compatible = "brcm,bcm6846-pmb-reset";
+                #reset-cells = <1>;
+            };
+
+            hwmon {
+                compatible = "brcm,bcm6846-pmb-pvtmon";
+                clocks = <&pmb_clk BCM6846_CLK_PVTMON>;
+                resets = <&pmb_reset BCM6846_RESET_PVTMON>;
+                #thermal-sensor-cells = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..eb4b3b631e82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5444,6 +5444,10 @@ N:	bcm[9]?6856
 N:	bcm[9]?6858
 N:	bcm[9]?6878
 
+BROADCOM BCMBCA PMC3 PMB DRIVER
+M:	Linus Walleij <linusw@kernel.org>
+F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
+
 BROADCOM BDC DRIVER
 M:	Justin Chen <justin.chen@broadcom.com>
 M:	Al Cooper <alcooperx@gmail.com>

-- 
2.56.0

