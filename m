Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D149C4A0;
	Thu, 15 Oct 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054541; cv=none; b=iDVjvbW9DZ7TV8B4hv9sCmHo+4mun9J2tDNJEjEGatUql/sA1i33LlfEjPquL8nljlaPUbJyFmWVIcUxzkLo6BPi8asBZx6Cqop+kqJuaI0MPe/MJKtsc0JiWGiPtieEjUDb0/d/Maw7Z33KhQEMd8fl8OATaJgBhEH2qZHFySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054541; c=relaxed/simple;
	bh=rIAOSODvGETNrgtlbEsM0VVsbN5c1CumXeXnNHW+BoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAszjBVQkz6FL6CLbloZWVfortW7Mr7vr61iDNXq2rQPlQGClvDaJYkt5oUZpfLWhUCgypwkRdtQXECR7rudzLGhyKXnx8OXsFdGJZpveXmzpDc5x72kEnx/lJynfy/K/P+HDEmPINs9rkiAhU0XUDwTBdZUsUic8E6mBETdNbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGTuhBNb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGTuhBNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6431F000C5;
	Thu, 15 Oct 2026 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054540;
	bh=O1cghNXmz4ZIvMxuOITwbG/9Zx3JInp1iQicQlY1k94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fGTuhBNbXo0mCDTzFZ3lrlPPOdG+1ZymT1YPeMKu5rlFY+a7t1qlPIM80stZKHgcp
	 f9syIKaIDtA4lXOFdx1/3zvk/Ytwfc5NdG9ckE9s+C2H2y/YI7kKNbJ0U9CRfkR28l
	 TxJ8uwiuq3FlHVfCzpooSrD4XX75nyJfo6YY/MKlp5VRiYvmujUBe70RYOaRib2FYv
	 /pBh7kVNlcNIvU0qvvQSqow4bpHRbOpH6O4ZtBr3I6LwBkh94BoAF2g+rqoVnaC0Yp
	 XNwv28APkF+ubp6lOOJxrU3T5WcE3kkMw+E5FS85giNAv5fUj6UV3CagoJigvEiFcD
	 og4eDDwafPBXw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 15 Oct 2026 10:55:29 +0200
Subject: [PATCH v4 1/4] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792054531; l=2660;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=YiNV0CTcmBoT5Qg7OCXixFm5JCzN/pl9N3YOig5beSQ=;
 b=s6jrkMjcbNewAWsLoK0WLnAi5E7gmAv3T89LdBLJfS5O6MVEk8FZTm5a0XAt4ehfoelwy6xiK
 gYcOzR45coiAZYAIXg2IzJ6Ja/hrc2uf75YbGAndyjd0XadaTqrbicN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
least the Zenbook A14 and A16) expose a custom, somewhat
Qualcomm reference-derived EC interface. It allows for fan speed
reporting, keyboard backlight setting and receiving of a number of
miscellaneous sideband events.

Introduce a binding for that class of devices.

Two separate compatibles are maintained since the two laptops' ECs seem
to be generally alike, however assuming full compatibility with the
limited available information does not spark confidence.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../asus,zenbook-a16-ux3607oa-ec.yaml              | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml
new file mode 100644
index 000000000000..c0bfad5d21c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Zenbook A16 (UX3607OA)-class Embedded Controller
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description:
+  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
+  machines) come with a custom EC firmware, loosely based on the
+  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
+  customization.
+
+properties:
+  compatible:
+    enum:
+      - asus,zenbook-a14-ux3407na-ec
+      - asus,zenbook-a16-ux3607oa-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#thermal-sensor-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "asus,zenbook-a16-ux3607oa-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+            pinctrl-0 = <&ec_int_n_default>;
+            pinctrl-names = "default";
+
+            #thermal-sensor-cells = <1>;
+
+            wakeup-source;
+        };
+    };
+...

-- 
2.56.0

