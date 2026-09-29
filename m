Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182952E7397;
	Tue, 29 Sep 2026 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723109; cv=none; b=Yqiomo6kIo41X3SrYzN9Br5iJStR38uDChTl4mN2LGVMAI8CsIvkQcgGl3PMocONO/Ea5+LjFaa8a4lA2riDudVGpvCxZSkfaWiwgTA80Mw47X6ryAGsZkhaIt+pzxaBA76Whv+YmP6CRNEbsbXc5otsoOclatkAnUswKDu1g5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723109; c=relaxed/simple;
	bh=2kakiLdcA/u10fzItVfdToStbxla6y3gdsmBTwGYEg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMNEJEnZbMY2wzfg151wN6jrkN00AQGdlq/HU0n9lSj/vbofo5v0RifzNw4mOMpbI3yuD2NRg8PfYhcxLq1iewcApbYLz77xO/hxJ4tuJ1pKoIFmxo1VTDnlIdQD7klhI8ag59l5kGfoj4eJzP6tCz4+Zknbh7e3DI/iGxY/CvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEHh1VEI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEHh1VEI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC1C9C2BCF6;
	Tue, 29 Sep 2026 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790723108;
	bh=2kakiLdcA/u10fzItVfdToStbxla6y3gdsmBTwGYEg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IEHh1VEIL+ZDG/tPakBB3T/m3MIofXgQXzUQAnY0KpMIFC91ysHRZGwpGTG8El9sv
	 6h2FC9A32WRyYgte3nXiF8p4Bd0MUQ1Fj5WUhMLE1cslUm57fMS/63CLdb/KJnSiEy
	 F2+Wi+WRe2tbFIsrPtR0L5t7WJdnOOW6QZ29XARGB8KT46tZKuC06ebAIkZD38akUB
	 9v4HWhFRvuomlsJ9GHXpHJizWh8oRUHo/edjB89XcYmPbXqGZVy0CqdMiEv7KAPKU+
	 EamwEw3tCHP5ZtS4GSTKeGjoi92GVfJHBvDdjyR6RVZ4hZ2+MlpjYUdjOGJ1U8tnXM
	 G1Q90w5G/cXew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D86CA5FAD;
	Tue, 29 Sep 2026 23:05:08 +0000 (UTC)
From: Luna Hart via B4 Relay <devnull+lhart.opensource.witekio.com@kernel.org>
Date: Tue, 29 Sep 2026 16:04:04 -0700
Subject: [PATCH 1/2] dt-bindings: hwmon: Add TI
 TPS389004/TPS389006/TPS389008
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Flaviu Nistor <flaviu.nistor@gmail.com>, 
 Luna Hart <lhart.opensource@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790723106; l=4385;
 i=lhart.opensource@witekio.com; s=20260928; h=from:subject:message-id;
 bh=p1yUfoKZkeWmINpK9hgk73/OepjSi3eHmCSturzY1lk=;
 b=rNQoEg4RDhqfyWgJji5dpZXf6a7TVwv9CgMej/u/rrdY2ih8uz/oRvWS7yBVaoSzT0uvDKRZR
 vqqvxDZbmjdA+WW+NGirqseH3i1totmEqNvgUVXujnuhiu3ERTWzq04
X-Developer-Key: i=lhart.opensource@witekio.com; a=ed25519;
 pk=Dm1WPzsg+HuKn11WChbCWrNOk7GD980BnpCdnUwyDuU=
X-Endpoint-Received: by B4 Relay for lhart.opensource@witekio.com/20260928
 with auth_id=1079
X-Original-From: Luna Hart <lhart.opensource@witekio.com>
Reply-To: lhart.opensource@witekio.com

From: Luna Hart <lhart.opensource@witekio.com>

Add a binding for the TI TPS389004, TPS389006, and TPS389008 I2C
voltage supervisors and monitors, which provide 4, 6, and 8 voltage
inputs respectively. Each input may be described by an optional child
node, containing additional properties including the label and ADC
scaling factor.

Based on an earlier binding by Flaviu Nistor.

Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
---
 .../devicetree/bindings/hwmon/ti,tps38900x.yaml    | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cdd74ddd03e748f271628f1cd2f2551b9c983785
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,tps38900x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPS38900x voltage monitor
+
+maintainers:
+  - Luna Hart <lhart.opensource@witekio.com>
+
+description: |
+  Voltage monitor from TI (TPS389008, TPS389006, TPS389004) on I2C bus.
+
+  Datasheets:
+    https://www.ti.com/lit/ds/symlink/tps389006.pdf
+    https://www.ti.com/lit/ds/symlink/tps389006-q1.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,tps389004
+      - ti,tps389006
+      - ti,tps389008
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    description: Required only if a child node is present.
+    const: 1
+
+  "#size-cells":
+    description: Required only if a child node is present.
+    const: 0
+
+patternProperties:
+  "^vmon@[0-7]$":
+    description: |
+      The node may have optional child nodes for each voltage channel.
+      There are either 4, 6, or 8 available depending on the specific part
+      being used.
+      If no child nodes are present, all channels will be exposed for
+      monitoring. Otherwise, only the provided nodes will be created.
+    type: object
+    additionalProperties: false
+    properties:
+      reg:
+        description: |
+          Must be 0 to 7, corresponding to respective
+          ports of the TPS38900x.
+        enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+
+      label:
+        description: Name of the input source.
+
+      ti,4x-scaling:
+        description: |
+          Enables the high range ADC voltage monitoring range. Default ADC
+          settings will read from 0.2V to 1.475V using 5mV steps. In the 4x
+          mode, the valid range is 0.8V to 5.9V using 20mV steps.
+        type: boolean
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: ti,tps389004
+    then:
+      patternProperties:
+        "^vmon@[4-7]$": false
+
+  - if:
+      properties:
+        compatible:
+          const: ti,tps389006
+    then:
+      patternProperties:
+        "^vmon@[67]$": false
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        voltage-monitor@30 {
+            compatible = "ti,tps389008";
+            reg = <0x30>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vmon@0 {
+                reg = <0x0>;
+                label = "input0";
+                ti,4x-scaling;
+            };
+            vmon@1 {
+                reg = <0x1>;
+                label = "input1";
+                ti,4x-scaling;
+            };
+            vmon@2 {
+                reg = <0x2>;
+                label = "input2";
+            };
+            vmon@3 {
+                reg = <0x3>;
+                label = "input3";
+            };
+            vmon@4 {
+                reg = <0x4>;
+                label = "input4";
+            };
+            vmon@5 {
+                reg = <0x5>;
+                label = "input5";
+            };
+            vmon@6 {
+                reg = <0x6>;
+                label = "input6";
+            };
+            vmon@7 {
+                reg = <0x7>;
+                label = "input7";
+            };
+        };
+    };

-- 
2.47.3


