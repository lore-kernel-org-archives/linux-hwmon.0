Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959144;
	b=E5vDKoQzWXK0Mdf8R2qYBh+FQwhG2hz6caBwLnYLEfSi0Gi/F8tMBP8Q0oi7M/crZbjv
	 rUiPOTSjfZ/3A3gOKxs+q65YvWmT+TFQmwCJ+p423ggNYUqrpoy9WqdsEEnKt7OZs/yV0
	 cko+6x6id9T3nATrmjicR/Odw21bgR4xvKekUMWzUz+kfjovq7Y2wNUH6NJrbg2xtAoNB
	 lmUt+XtEkzJfwqu/vPvTRBYUuVGQdHkagBG9fdtNEaRosBpKeeZreyejsfGmr/bbUXQPa
	 d1CrZeK6erNdLP2jUlx2TPg9+T88hnCdb/REWDhezZv44CiyrBs8VNYc9ubJIETK7iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959144;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2LysZzf63v4nF8rzqQNLEVl+2ggmrZQ3Xj8QktRUqig=;
	b=PspV78cCdfLZh35S8lm+qtzB1yAjyRf16ZajYHPQv1b9a4lzTZWq5sgq/TMMOKW4Qy8Y
	 BftfkZBYXemziK4ONw1HM/BwLvtx9qhk3iftYvwUz+Hx5zHuFmZTDSFRANFGo5wnxmfqo
	 OR/WrsQjBUgVp3K05Kx1AU8EPpOkJvK6i+DaoNgBXe7cribGWx9OsgYVGQYRc7senQojz
	 8WqthGJC1o65r90WWdN76U6RttKvRb/cEYuQZKSeB62K5GBbmTX+xS2ShHDJFr1DbaAKv
	 lvAjbNBVbXSg/a9HtGN38jaTRYxTtYU4A/ah8ppnMq7Xa7jLDAxX6WPXZCMhr/7eFmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQvWrsI6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2301B606A882;
	Tue, 17 Nov 2026 23:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQvWrsI6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794959143;
	b=kzOMEu82v1imp1dLRrBXgPhFbrJuJNW4U9RoJjKN92o688NYQ6YdODIBv2AzgLybSoJJ
	 S2i0T42G1HtVGN/ffuEWUi3PYr59U8SKPFOyGPK3mJyfqJRXVsmdtCl1rji5/bRHoYrgh
	 7i1lcw2NjGy286LuZ8TsuzA0PPcd/KmFdbidokcWI5RWX+res4YciN3oBPs6gGSB41ZhY
	 LbcZGVCIKjZg7VWA+n1S/jOIfzDYBCWgDnNx/IUODA69/Iw8Xq7zhTXKaYXnETejQi+mX
	 1H2fyJmVyRcgPJSvWtD4pv0x7AQt6WgHSryDno56BJ8nZxPwr3LClguRd+bf3+EUpWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794959143;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2LysZzf63v4nF8rzqQNLEVl+2ggmrZQ3Xj8QktRUqig=;
	b=ev7DkbLJOwTgX+q38v5IovoZsO3rLvxdW6GaHjKsn9YfdvNvPu9/CgkJC6WaYOAKbzmD
	 VL/4IaACLEsPywrwnshsXbfvjhKSnP0NdZyZjcyUbDQg4jeB4xiGvzMDS6Tg4CTnpNn0A
	 6hFnZQH2g7Q1SlD6ONZg4+hGzcjisx2lIyAw9Fq0KxPqbF0OdDyFobAez2oxFwGLNTGEc
	 OZDzMr4deADMs4To9Cixxi3AB15X3pL6486La+R2UXiR+wF/vl4BrnrRs35YDbrJ7MKUu
	 8FA3/VeKijlA12OoXsuG0V0HoOJUl8pcDC1Cq+DO7JBa1/kOm5HuU/0Nok67uqWvz9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F03771F000C4;
	Tue, 17 Nov 2026 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959143;
	bh=2LysZzf63v4nF8rzqQNLEVl+2ggmrZQ3Xj8QktRUqig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RQvWrsI6e1YOZ2RmvyS9XcakTdC8kr2BvlF6F1k/+atyWQkDkuW8rFaBmnXpXy4xs
	 hquZ4ZBn9xsfE3CaIrAUatvwmAL3MZuoexJdRakvnTgfrb7LQhzpv5gFBZoQL/1tFp
	 mB72IAdD35b3vpPg8XuXwhFVE36VsthEE1Ns+sxlpDg71Ko83gS3VA/aAPHZuOcY0m
	 DZ9JJmDf5dE/akllUkZFHUj6wDAvR9jy6Qa39XyPjljpPmg3v1DQvVx4p2Dm+VL7IX
	 V+p9p6vmgiCLsXkecMZBa6KiSI+5JKnUUgrGM3JYrLQ3yu6NPWaQrZZMnVDecup+e3
	 5vvb7Ct2PrXsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 66A4F4AB57;
	Tue, 17 Nov 2026 23:45:41 +0000 (UTC)
From: Luna Hart via B4 Relay <devnull+lhart.opensource.witekio.com@kernel.org>
Date: Tue, 17 Nov 2026 15:45:35 -0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add TI TPS389006/TPS389008
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
Message-Id: <20261117-lhart-dev-tps38900x-v2-1-e5730523d3ee@witekio.com>
References: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
In-Reply-To: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Flaviu Nistor <flaviu.nistor@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Luna Hart <lhart.opensource@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794959140; l=3741;
 i=lhart.opensource@witekio.com; s=20260928; h=from:subject:message-id;
 bh=sMKtGRvbgftwE3ETBtOaj3gXiqiiDQvh1BO5KE2HTrQ=;
 b=/ZoAO2+zv0H+i6I5EVP5w1sDUmwHKvEExL3O4lqQw7gNlFqTfRSfhaIJrOHsrewabQkOSefp6
 yqIGP8lRHPFDiw9Fu3n13Lb0K5a1tmtiwmNrCCZ0yO2PJk2DOpPHyip
X-Developer-Key: i=lhart.opensource@witekio.com; a=ed25519;
 pk=Dm1WPzsg+HuKn11WChbCWrNOk7GD980BnpCdnUwyDuU=
X-Endpoint-Received: by B4 Relay for lhart.opensource@witekio.com/20260928
 with auth_id=1079
X-Original-From: Luna Hart <lhart.opensource@witekio.com>
Reply-To: lhart.opensource@witekio.com
Content-Transfer-Encoding: 7bit

From: Luna Hart <lhart.opensource@witekio.com>

Add a binding for the TI TPS389006 and TPS389008 I2C voltage
supervisors and monitors, which provide 6 and 8 voltage inputs
respectively. Each input may be described by an optional child node,
containing additional properties including the label and voltage
monitoring range. Inputs that are not connected can be marked with
status set to "disabled".

Based on an earlier binding by Flaviu Nistor.

Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
---
 .../devicetree/bindings/hwmon/ti,tps389006.yaml    | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2a26f6623adf06d1df38d5bc3683b5d2e06f3c0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,tps389006.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS389006/TPS389008 voltage supervisor and monitor
+
+maintainers:
+  - Luna Hart <lhart.opensource@witekio.com>
+
+description: |
+  Voltage supervisor and monitor from TI (TPS389006, TPS389008) on I2C bus.
+
+  Datasheets:
+    https://www.ti.com/lit/ds/symlink/tps389006.pdf
+    https://www.ti.com/lit/ds/symlink/tps389006-q1.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,tps389006
+      - ti,tps389008
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: NIRQ fault interrupt output (active low).
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-7]$":
+    description:
+      A monitored input. Inputs that are not connected can be marked with
+      status set to "disabled".
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        description: Input index, 0 for MON1 up to 7 for MON8.
+        enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+
+      label:
+        description: Name of the input source.
+
+      ti,vrange-multiplier:
+        description:
+          Voltage monitoring range of the input. 1 selects 0.2V to 1.475V in
+          5mV steps, 4 selects 0.8V to 5.5V in 20mV steps. If absent, the
+          range programmed in the device is used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 1, 4 ]
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
+          const: ti,tps389006
+    then:
+      patternProperties:
+        "^channel@[67]$": false
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
+        voltage-monitor@30 {
+            compatible = "ti,tps389008";
+            reg = <0x30>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0x0>;
+                label = "input0";
+                ti,vrange-multiplier = <4>;
+            };
+
+            channel@1 {
+                reg = <0x1>;
+                label = "input1";
+                ti,vrange-multiplier = <1>;
+            };
+
+            channel@7 {
+                reg = <0x7>;
+
+                status = "disabled";
+            };
+        };
+    };

-- 
2.47.3


