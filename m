Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC824C9DED;
	Thu, 17 Sep 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642527; cv=none; b=UllADSOxjYnSVMzjPyppuxtc5yN+Tgypi4am1s2K1V+4agkuVBV5KhSLgNWognMuwrEIDkSZzSJnCM1V4vK5Y41t8zKBGj7ay7iIwFFH6L0EsWCoDy7K9B9Tuf7Q0BUKkcHeCMSvLqNkiCKxq+DhYg+N+S4IZ/zJxxCMmDlNT3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642527; c=relaxed/simple;
	bh=PoAR3hupbDtlPibwsrlBJ+xtFcQNU2hdxBYV5/qFLpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3u4mFtlyHmGY8GiE41S64YR6s+u/5SjXoRVxeMhkwxCkuLXIe0V4XZPMUlMchxhNXQasqfq3jwCtyyPCPcNJWOsvyQNuLd+7HMvtCEcnhcq5QVAAahJHfUcjoghZQzyou/wF6AhOtGKwmTz4TRm7gpCrQWexzglhKJA+g4Lq2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUYll1zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUYll1zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6A71F000FF;
	Thu, 17 Sep 2026 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642516;
	bh=wHDObbB8BbjSPn9/VI/e2+anNPcai1BrOmtVw+ErO60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dUYll1ztdg5T+KzGtaRbIfTZIuHLcSXMrIRpK3+EVjIg9dyOM5fJGisN3j5AZ5l2V
	 ojVUtjQrWwhJCbgbalRKTp9o131oMd0k+RAhXC0zOc2aDQU2lYXrOW9NRMVXBcoZmr
	 Ig2dgJQYlHNiogwBDB8vaMDNsNzgQOfApG6S0NXRubgHTvi1J7BGkrEQ+9UiSrLqM+
	 C/76BtED5JdOftg5CNcW8i64ZdFz28YOco7BdXkUrD0vpf2oahd9nm/LrSeA6QOI//
	 /bspbjKuVEjszRd+VEq8b8lwFV9v/OvBK7iUFZYpUjbutvNn3aAhVdnz/9JYW2sVMw
	 fnpod9DdQQvpQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 17 Sep 2026 12:54:56 +0200
Subject: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook A16
 EC
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
In-Reply-To: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789642507; l=2464;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XJtNb5bCJEpgetI4Sny1AMd3zSFrD7OZS124VAW59+4=;
 b=s1yOCdHfh3ZNC8utT7V/LXcFCr0/G0tdZ9Fc+Ty3/JUwoxC9i0RcgHRbUvPzz+oqTfzq+aQui
 7ZUpCGuwDSwBNP4jF6OjLspWA0uarw+mzE4jt/xeSvifQlfF6vQaQDH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
least the Zenbook A14 and A16) expose a custom, somewhat
Qualcomm reference-derived EC interface. It allows for fan speed
reporting, keyboard backlight setting and receiving of a number of
miscellaneous sideband events.

Introduce a binding for that class of devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../asus,zenbook-a16-ux3607oa-ec.yaml              | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml
new file mode 100644
index 000000000000..27e03c011ad6
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml
@@ -0,0 +1,65 @@
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
+  - wakeup-source
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
+          compatible = "asus,zenbook-a16-ux3607oa-ec";
+          reg = <0x76>;
+
+          interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+          pinctrl-0 = <&ec_int_n_default>;
+          pinctrl-names = "default";
+
+          #thermal-sensor-cells = <1>;
+
+          wakeup-source;
+        };
+    };
+...

-- 
2.55.0

