Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6748B37D;
	Tue, 22 Sep 2026 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069634; cv=none; b=iddz4IPiH+fwYvGphUN95p7CoHGC18SDLIvBKQB20o6RJaLRrlvwr/uOdzz8qa8s8AhpvvURY/FRpW792WDFdMWQuiKkmte5yKYn7FtdloaLWkDtjb47gVWOw6TjT4N/YSvbUu9HjK8hgNsRigFqoxmwHXyIEg4Gj3OVjp7v8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069634; c=relaxed/simple;
	bh=fukG1Ui5PBkqvvdH3tW976cRJ8fnu/oq1u8P+G/BURM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYxrXgo25TReikASY0BlOWXr7f27ljuUzRC3j3oRzqup/WafBp4TGiK/5RuUFWF2seo9Fe8MFhmRAfAO+Nt9g9lCzlGU18To9JlzqUb5PFbVfW0JTn18QGZ3MFNQcd1Oj6o+4e90voYfV5nPgaDUokRwtUm5t++Nwh4k8YDSP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU1sl1rJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU1sl1rJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72061F000FF;
	Tue, 22 Sep 2026 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069633;
	bh=8i0cUFu0jRgK6xqFeljPYVRrStYw7lvWDEu8F1xhoQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VU1sl1rJj2/L5/1M/7OS2zYFU4jtcBr0at4ST9JTj3mUvgP9+3CXNEo7lIxTm1/sW
	 u+m0TdE33AW6Z4OVdmhEoA3h5xVTT2/3CouOL5Ll9U9U+Ptyl6LK63ly5lkbPtocwh
	 bNUGdNaSECkIQ62NKjQHsre6qw1hok3ChtNjDZhpXPcLsDxbaoVZV3Y0tEgjJsdRUe
	 I4WQ8qxQgkS4p+gZrSkszdxB8PzFmNFyMl1DAgltT1IbGEv/CCeZ+XAggxhKjrmxCn
	 AVCa9QRyDYWEkEXeo3oZ9k0601waplKNUNFFnNQKyOwt8poFkZfEj6rahn/mzXw2nc
	 OJdpxudv4+LsA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 22 Sep 2026 11:33:36 +0200
Subject: [PATCH v2 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-topic-asus_ec-v2-1-0bd923d1b853@oss.qualcomm.com>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
In-Reply-To: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790069623; l=2660;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=L+8Ieu/vm8qRqfna3o9GyZSa+EbA82FtLSEHNV5okJ8=;
 b=Y85MnJi6sKAdG1+InZofc8ZrdVjaxpp11Dg5U4BNXB9muH/HPVhmMxdXQrSaUsA2nYhPQMBGK
 SG4FCkcnDeUC00lL3BLz5P1PWtMmD5H0JMDy65FUiNlpF8Xk5QmM9vR
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
2.55.0

