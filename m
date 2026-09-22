Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A5B56E044
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096271; cv=none; b=MTDCHxJ6NKWiPGSkC0Tazbsx/FkJJe8YY185I1e8CZnEt+FVNQYB4C/B+Fic8V+OKKndnbY34Kvnsm/0+zqGz461NS9y9mprDHjj91TD9oOFr0Lutls7Zjcw10p9gXP4S7oJJIbc+m6HhKhnrUOaIBKzCcrYs9TNC37QJxZwBzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096271; c=relaxed/simple;
	bh=aid97Yjimc76nz+M6o0QWk1KtiDp95Qtk/akmNNnZ3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqsqAcCSh3f5u44ibcRco9hgAwzb+/jYLOEC5vp+gcRa4xAbqUwMvmwEgagSWkmwM8sYWC/xx3zh25j5wMfIhY1sds2Eu3iNxzALnbmkOUp0BL6yrkwKd/lFIW+/ZZQjdMWxg+5YkcIXO4QG9lgJGmUSZ7t2+rje0tt7QQxDYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7MlO8GL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7MlO8GL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso38955995e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096268; x=1790701068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdwj3z7uTqgFd/9Tfs5y2p+1zT+FzwY0f8o+/81CJMs=;
        b=b7MlO8GLMCViwPcId7mm4Ioo2dqkBXcWt9Q/mxK1t+h0RkhUDQR3ZCtTMHiP6ORKqA
         r+mbYqcRTIy2eAZYNBHDzTa5OORT2inB3NsQbIVEb40CkTtML64Kjp1bHkfiROIgMbjr
         pvV9EKpfpC/x75de7w86rxcOoQHN8YTweBqL9Zurk+VeqMiwJ0G3nWX/rzLvZJCDzkRR
         5dBfbox/zL1JaJVrzD/QKscyTTZxqRrPu88UvTA9SYDl1gwed5BDNo2tP4p6JQ44pemp
         uazuvCnIpiry0ggzr0y2lea8PKDZxYZ6ilBwu6mF3m1pWxlygNoiV0Z2sGIGtskK3WBP
         frDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096268; x=1790701068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdwj3z7uTqgFd/9Tfs5y2p+1zT+FzwY0f8o+/81CJMs=;
        b=pDFL2wr/TKnKZ5J2U+ZuE4My+sJtLKpn4igUgYTAa1gY4VZM/JvtO0cnEsqG+hv5pY
         QffMaTyncH2vM3kN4YkV/Xb2boUQwadsMX63RbSxE8n9jMnu0CuadzOonRxFxyiV9YH2
         rRmI02ytFfUN0I67MBBZwNKJYNMXExX6+Oeg3wkRxDiO1uGSLE6jvmHBF81EPSX1vHYP
         l4gy5izp+tAq3ZiGkupps75PF8tdraxLFVvpnuAedSsjyrUr0OlWcPuTHmbxT2eWatCZ
         A1rvxgc2C/TKpiuY/F3h0YrDbn99P5z4edKxUrxEtnPHcOXACQzhGA+40B2MAHk6NxPX
         BLsw==
X-Forwarded-Encrypted: i=1; AKwUvBy1zuhNPWRixU0I2XQtqSIuNCFGB271DWj3cy3pVeYRPExXPLUj6KDo2w5PUlyfeoKXRmlCzk3Um7+5fw==@vger.kernel.org
X-Gm-Message-State: AFuF++mwuGVC3NskgCpIlVlPh4BmWv3Nl/qac6efQNu9o0t7GwQWH56x
	VcSeLP2YZvmwt50HL2YDxMaoaOrjG7kGT4DYDvQqrkNSZ0Mq4Nc9aYU8
X-Gm-Gg: AYBFou2NAUbm/CnLuAs7q/I139TZArawa4A903QoKeNym/cbK19oyTJl5ia57cO/YOL
	hR4Q6lRjyKpxJkF53bxoJg2Bh/s+n1Iajvn58sy7lTq1l0c2KYARgFVyGppbnkO3c+viWZ1vXVl
	sTV+kARJ9ht22QLZ1vcJRlQpHx0prGVGFWLcC/U9VFpD/ST+B1o5+UxHnm5h9gQO2UOleQNBOC2
	qtrX6IPh6fN2kLEJH8I/MLIx19aL5t8/BnP+BrmpTGdRW1Lub5MVbmM7jtDVYwvnO5nMn9Zv/yV
	4T8gvrPZbRu1Gs4rBb3KR5q+pP4/QgVkILGPXq3VwXtD8tzhD8rQJi5ov0XfjCH6JO3CXRCO8ZE
	JguYfHJE/JxHjgDb44hkrk+ik6mrGsb/plQygnKsGlo7m9LcYw2dmMED9blFyRfTf65+sW8dx3j
	q0G86QoU0hSGbdj/bAqhTr7SbTEX178nFFm4T95px6Btv5sJejosPaaA4i2Sm43iUpr0e/vs2r0
	P0emKdHS3MRzLhIng==
X-Received: by 2002:a05:600c:19cb:b0:49e:8184:f619 with SMTP id 5b1f17b1804b1-49fc57410f2mr206302025e9.22.1790096267744;
        Tue, 22 Sep 2026 09:57:47 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fdabe8a2asm68693625e9.4.2026.09.22.09.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:57:47 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Tue, 22 Sep 2026 18:57:35 +0200
Message-ID: <20260922165737.260443-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922165737.260443-1-okerixx@gmail.com>
References: <20260922165737.260443-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index be096be5fff6..11d459c17caf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14966,6 +14966,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

