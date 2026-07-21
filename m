Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D9E445AE2
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627994; cv=none; b=s/hJ62tWHQQHr/t3WI2DTLgwpbH5iJnQBUhum5+txSkp622tgVUMbOdacCPYfajQQBRKWxOFYfJ/G8EA11onisgOxH4AMA5S78sT5FUm1YFGxtvklzUKMKHbfd+Fnj3TXTqX4M/NixRWfkGcXmUIOFjlUrI/5zolduVF99hr9JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627994; c=relaxed/simple;
	bh=4hhsAxAJjA9CnHKxIGE5+DUar4FrPizlIRDXYPMfD4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hy/zdnJz45pLHRDRGRpkcg2P/FbXtLOjEco4BKbrDfei0nO7W7FAOyNlUS6pv3Yh1gG/+8xx5CfjikFRsAN3dlm6twpu58lPx/ij2zKfhpyUdPgNDmspWYWx7c9eN0nIpAK2eN0rjkBmoMVAvX1dFC+cmI3Jr2jxNa6cDvtcM78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQNraOng; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQNraOng"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso7241424f8f.3
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627989; x=1785232789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge4jOwru2gdBik+03SVRNyiDvso3mpjCVgnlsYEIFrM=;
        b=LQNraOngZes09ELhRxvcapcyEb8OUPktJff2L42ZeY22O5/NHADDF2l66NnV4sGZ1p
         qJifLkCKqbFLOXO3iymCqAb7XpPO+YVxvx6OycMIw3k6BwR8cOkfCqDAcjKg3NpjhqwZ
         ZQnxqjcgZPHJTV2rzezkVJOz27LUHnKIKoUZsPTXVpQxyye3ZeDgkkn6+bNp7EJ4Gjvi
         xTg3kTnO++esAC+JRYMukC7ISjTdWoNmmmxfU+T2p0mhYxBr76eghxIdr66P8voFrmGP
         ZAW3qHI5g9KTACr5g1MN6KpjJYM9Bw0km4ZmytgAMuuCauua4zVrlIOGHdgZw/xE189X
         pGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627989; x=1785232789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge4jOwru2gdBik+03SVRNyiDvso3mpjCVgnlsYEIFrM=;
        b=qPRmv6dFOfdG4CB2AwlV3i1TJFErJzi4xDhRGZg9kx2gyGGWP2tHMyc0S3auHl4FCO
         jK34Xi2h3+mmJwyzlv0SsolFuwY1Bp/QU3cgCfKlm/hH9dhEgRgpdwoCfWB270pls6Tk
         Y1B9La/9jgo4rHyGig250GkUTBCJeUBU8gUa8TCzVpaRLev6wikPIs7ceDsdLBRrnPFF
         Ir37cy6oO6HXP1Vpi8qmIt8RwGNGlhxCrJPwtuq6VrVqHIMH06ScvCY5CVoKihhqBEin
         HBQ2IXotL9aw3ricCHKGnTIfgu051aea63vPndujGbk1x6rIbYfE7FUxOqz/bhr5KBtL
         cndQ==
X-Gm-Message-State: AOJu0YyVI2mmifsr4biHlPDWAKD9BZ2fjL4/3Pq6zvHckqcWi11IMWN0
	RdRj5zD9E0/vtQ2+aRJYk4DIWdkup3oFrS5kgl0hfWyZOmwoYKbfrc7r
X-Gm-Gg: AR+sD10A1liL+K0QW7D5eKlRfREuAAzoGGCT9CbilJYTRhUo+BebI0vanucYmmVsn1c
	27B7HH2NsfRcjAwvemS+sUMmt6IotUC/7E3S1ksFHfNRMQg8eTdefKAmGgsMYl08l9cSQs8SJda
	I7zAas6jJvoUCuLuMsW/Pz22ewGlQzsdyXNnxoWsR+yMULXigg5Z2Hf/KLBD7ehWX0gyOHrpOoM
	YuP7aoMQ4p97I8vuqs0KD3TSEykeeEJE9q0n0YZMv7ot+oaD27wzMo+sMpdh9LtJVxVsBxDR3Hr
	dp7p/h3VmgeRBxYEd6uh///1hNO7WtpoU0iVuII6fQrdFDWNKOs7Hri5lDNsyJWRrvwdZ2Ayz3A
	P+agpows6MCL3w2W1Bp3rrAohw2G23IrRLEuJEp3aRooxOWYp8+oDn77GMz2XsSMzouLMiwgup+
	iMLdLRnzpTauXePRZz75g/jXE=
X-Received: by 2002:a5d:64e3:0:b0:47f:70f3:451d with SMTP id ffacd0b85a97d-47f70f3455cmr12905125f8f.8.1784627989466;
        Tue, 21 Jul 2026 02:59:49 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm35228691f8f.4.2026.07.21.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:59:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
Date: Tue, 21 Jul 2026 12:59:33 +0300
Message-ID: <20260721095935.439174-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095935.439174-1-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the basic hardware layout of SMSC (now Microchip)
EMC1402/1403/1404/1428 thermal sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 1 file changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
new file mode 100644
index 0000000000000..d7873a37c3295
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
@@ -0,0 +1,203 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/smsc,emc1403.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMSC EMC1402/1403/1404/1428 thermal sensors
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - smsc,emc1402
+          - smsc,emc1403
+          - smsc,emc1404
+          - smsc,emc1428
+
+      - items:
+          - enum:
+              - smsc,emc1412
+              - smsc,emc1422
+              - smsc,emc1442
+          - const: smsc,emc1402
+
+      - items:
+          - enum:
+              - smsc,emc1413
+              - smsc,emc1423
+          - const: smsc,emc1403
+
+      - items:
+          - enum:
+              - smsc,emc1414
+              - smsc,emc1424
+          - const: smsc,emc1404
+
+      - items:
+          - enum:
+              - smsc,emc1438
+          - const: smsc,emc1428
+
+  interrupts:
+    items:
+      - description: Sensors "ALERT" pin output.
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^channel@([0-7])$":
+    type: object
+    description: Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: The channel number. 0 is local channel, 1-7 are remote channels.
+        items:
+          minimum: 0
+          maximum: 7
+
+      label:
+        description: A descriptive name for this channel, like "ambient" or "psu".
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1402
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1403
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1404
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 3
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
+        sensor@4c {
+            compatible = "smsc,emc1412", "smsc,emc1402";
+            reg = <0x4c>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
+            vdd-supply = <&vdd_3v3_sys>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@29 {
+            compatible = "smsc,emc1428";
+            reg = <0x29>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0x0>;
+                label = "local";
+            };
+
+            channel@1 {
+                reg = <0x1>;
+                label = "chan1";
+            };
+
+            channel@2 {
+                reg = <0x2>;
+                label = "chan2";
+            };
+
+            channel@3 {
+                reg = <0x3>;
+                label = "chan3";
+            };
+
+            channel@4 {
+                reg = <0x4>;
+                label = "chan4";
+            };
+
+            channel@5 {
+                reg = <0x5>;
+                label = "chan5";
+            };
+
+            channel@6 {
+                reg = <0x6>;
+                label = "chan6";
+            };
+
+            channel@7 {
+                reg = <0x7>;
+                label = "chan7";
+            };
+        };
+    };
-- 
2.53.0

