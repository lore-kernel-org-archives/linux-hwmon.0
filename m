Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB42288517
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Apr 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470663; cv=none; b=ALjkXEGihjbqA5qmmnVihZF0BZdbnSUNP7dgfQtdMysbyMe6EmaWkOeNPN5Jm4vIHB/O09Lx6Awsy/7Mc3ObhEOaxDcq1Yn6lyrGiFYvzztolcgb+gofl0W4o1F6dzK0Cog64/sKeJhWivNq8I7/YaDJ+eqpafve++w/XDy91ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470663; c=relaxed/simple;
	bh=/QOJtGfdr+JOj0LUTr+uZzROTqSHBvb6AEola5plcyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mQhjqotLm2w/gDnpzyMq15GQA+Dm/+FYOm7etzo7ZYj4WIJgUXJudX3OgNCAQvGX7Kfx5VlhDZry/GSwemkfbU8hlO9UFUsBn3003NwSDaZlYHEyKTCPqRmO0xPDT8CKzxpMrDtCWdJvVYwlmlltRmjD+B2HbLnz4jIcsqBfsyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPZ9cCXx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPZ9cCXx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d965648a2so2889404a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Apr 2026 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775470661; x=1776075461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91bKJs2UF/hPf879HWzWnCyGjzk/ABzmRajut20ibEk=;
        b=TPZ9cCXxhpAjroUI/CwYegqAmckUvFX1dXaQlNxo8P+bE9J+Kz6kKKg6Xo+BGytutu
         JD9jpzIPm03QJ0xZsE8EVvfmnqnZ8hCKVxjsA+R+tutxcTk8SyQyM1F9VdI/KMYoKR/p
         sv6IHtdvuI/S/A6sLNvUFo1oIsG+06/SnVt+o1OpxtbNmtc211xAJLcPxvjuhHVcDo4/
         Z9UcqgONI34nxZFyLHmRXZ19WNCcxUjTTjLAZV2gsiJgyE7817rqSPIRdNHhmeLOpODc
         le3kxZmFPjLtfkJ1o0HIXlqk5qkC+qPP6lExGhth3HJ9GvMcVeW97agCBjBaUc/G0IrE
         axBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775470661; x=1776075461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=91bKJs2UF/hPf879HWzWnCyGjzk/ABzmRajut20ibEk=;
        b=g/rl+XtzxzQjQ/zsGOTO0IiY+2W2jjEF1jYvuIRVFCGQ1RUjwJrA6NCoi8wqE87UM7
         qepZp+b3vuYvptaAOgDGUQc+jWeqYpuCYdnkcfdlSW3NTVRN+f15CfjizVA8jEqVrzIp
         aBd8q02CoaJAb47+hEKiOfY6UKUxXoaUFZOk/ugJJsIbQ1RwsGU/lCc8+DR8Z0JEWLi3
         LQxPRtTqoUl5/9rKFIzR5k1KDdP9Kwxe4uXbLM+w6jPxSZej02kmMi5oNMAWgWeVIzqA
         pRMjjNezbE3oOJBckH38qx+LOeScUHKSHuFfSF01KOk3LDinkMWQU5baWecWbbNSttMO
         b5NA==
X-Gm-Message-State: AOJu0YwMh576XjStllioQrDPjRV70B7eWDvGtmJWgRg2WkMzZLr5s31w
	8qgyOmR3N0lZ62ECL29FjLIkrJdOaOnGuTsbdBXW4lBNE1SdlpgQEA0t
X-Gm-Gg: AeBDievqEM6jOFlOXSATLI5bYEyj6esfxRj/+nHD2PnjX0/L3+pGZW9mST43D/FWeSF
	E31jw34ZWvKBmm5q3cWIL34suy7W6A0m9wzVaUOX9mEdKYslJBhFAxCdjbXjTrEtbC+75RGk9xN
	1xa23ofocKbfpgrCzxhgJ3Tg3toIOYrmBktrcWHXWtdNxrrXyYG+8cN0ISZO0/hmpzHlWxpBttT
	o0dOItsKtLENfAEovXOHSavvPEjQFRGmQpChx33+Qp695U5CwCsKFgWeOEb5T/FWKgoaJc0/5U3
	B4dhl2DfJR8+raTa44BkJOXm//h7y00aQWvD3afQ5AfsJ3FS0M71YKcKy7SMc5YleOgOirs679E
	SPwV+Jf/7jL2JqRdQ5mBMPURhC+AjxsGk1xzp+hihCA9PALi+9WtrJTth9tegYu/1iLmXRSTA5k
	OEWR7P/LX27zen/FvxK1HMWEkwTpBqd7WqVejUNMok2ZLj
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35de68ebf53mr12282940a91.17.1775470661157;
        Mon, 06 Apr 2026 03:17:41 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c94a:aad7:a860:f869:a68d:92e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm23332527a91.5.2026.04.06.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 03:17:40 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Date: Mon,  6 Apr 2026 15:46:46 +0530
Message-Id: <20260406101647.109667-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720 eFuse.
This patch introduces a YAML schema describing the required and optional
properties for the XDP720 eFuse device node. It includes details on the
compatible string, register mapping,supply and rimon-micro-ohms(RIMON).

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
new file mode 100644
index 000000000000..72bc3a5e7139
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP720 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP720 is an eFuse with integrated current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+  Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp720
+
+  reg:
+    maxItems: 1
+
+  infineon,rimon-micro-ohms:
+    description:
+      The value of the RIMON resistor, in micro ohms, required to enable
+      the system overcurrent protection.
+
+  vdd-vin-supply:
+    description:
+      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
+      Typically connected to the input bus (VIN) through a 100 ohm / 100 nF
+      RC filter.
+
+required:
+  - compatible
+  - reg
+  - vdd-vin-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@11 {
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

