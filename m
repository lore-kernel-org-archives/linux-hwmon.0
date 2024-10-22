Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8F19B3D3
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Oct 2024 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593490; cv=none; b=dOEjqxXVNA5ImISEUXKUOOtVmrDQ8EjXlFsgDRf7zmtMYoJoN6tk946YEs+2gffptYWGKE13yEDpoRYvQ4JoTa6zQEJtgYx36HWuIf2Otd7d9aGLzgQfLw9EcVQriADkO8AjPWtVbDKoQ6ALYlgcc4MHAxb2y4TGXKVN1cwgBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593490; c=relaxed/simple;
	bh=iNwDcYtlbxvi4NbJQ1Qv0xRcHf3mR6Uqwsa3JIcyDJQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pCCSQqE+YK8f547S8EhuA/1VcF2M8EpcD8brdfQM2AKc7IGfAW5/5eprLeHTbSfpuzzp7/0m6F2hFfoybMbBMPNw4mOTWQBxJR9aZ35L0ubbIk52eH3A+73aBYZ3WaRWJb3xYuN+sG8YPvm//NOGzMuRWR1VlwER3iqPz1SKOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=BenDzSPg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="BenDzSPg"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d49a7207cso3949967f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Oct 2024 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1729593486; x=1730198286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DqeiQ/4GJHdOQ7JJjqx8kLtxbudI+1y5YQkYzghUQ8=;
        b=BenDzSPgWOLrLpDaZK3Y7k7nJncb/7CvK39OHhF0sKGhMdsIfMp1DDtrYFGvaDsNEf
         vEu6ax1vRJxK5N/OY9qdw8aLJX++sO7mhDD+/HbWwupBSlwRs6aTHO7RhdhnBEoQIw63
         V9JeA9VWILExwqKHjaAbDbXlgoH9S6yaQGZkYm6kLEvabvlxbOrjAzfOIEnccB4tvw2u
         YVVwypVi+EoB8rM+atG11lvFgV4YelGlobNK1eOdF3yrA8G+ARxix9k4GjhLnaiS5GQO
         HKLXnDO10a7B9O6WQ/DAzs68pQL3ykvt9e4tBBZVUTxhPBdQQFMYeFMVMNRSL4xO3TRA
         0RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729593486; x=1730198286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DqeiQ/4GJHdOQ7JJjqx8kLtxbudI+1y5YQkYzghUQ8=;
        b=WfpGQdbcCmX2tgiylozkX64RIDQTI9H90UrYeZbBd3jQcVsiy1Hese2GCNJFNboYIx
         8PKHJDXsesdylOped5IeFDcM75Z6sq3Pes+swz4KVQIE3shy72qL1oWe99W/p5bBci/G
         kv51L8LC0YmpArAAj1VNtTAmrNn07DAKO1gEym7H6clrvAu0xq0psRjve6dEM1QCIHiA
         oLP7hEtJCOgBSAm49wxkKD8E/h08N3GE4h7i3w2L4ou5R++577Lq+k5CKZJO6Gxrir5c
         EWl51vQi1tVgtBXnGbtYI+UP4zj5yJDsjFg61fHSrsss37Xvf6nVkf2LgVGXrdMdZS4e
         hkOg==
X-Forwarded-Encrypted: i=1; AJvYcCXx7R6Nx9VPOw4EpsUbLKMa2uECmsqnA/ckIpu0OMAK8Qjzu75/BmHZjF4ijLA9LVV6Sx4YDufy2C2kMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4VbYMiQzk27TAL27YS7sDeyuGq/nNXbPVQfBSs0H/KdvC1cO/
	SZ+heP7qrSluTuipGewo1IoWkHFPQIPM7elPaJjF/xQ0fmQQ1KXyT4IQxDJs/pQ=
X-Google-Smtp-Source: AGHT+IE2IQWBiMB+M/1I2TW/3oVxcQmmQ8LKMmQ9f08j/0oNw9aZKwVh5bm+wsUlo8PaGwno1otOKA==
X-Received: by 2002:a5d:4e49:0:b0:37d:3301:9891 with SMTP id ffacd0b85a97d-37ea2164d8bmr9308914f8f.17.1729593485673;
        Tue, 22 Oct 2024 03:38:05 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4864csm6352974f8f.35.2024.10.22.03.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:38:04 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	sylv@sylv.io,
	linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH] dt-bindings: hwmon: pmbus: Add bindings for MPS MP297x
Date: Tue, 22 Oct 2024 16:07:49 +0530
Message-ID: <20241022103750.572677-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove mps297x from trivial-devices as it requires
additional properties and does not fit into the trivial
devices category.

Add new bindings for MPS mp2971, mp2973 & mp2975.
It is Dual-Loop, Digital Multi-Phase Controller with PMBUS
interface

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../bindings/hwmon/pmbus/mps,mp2975.yaml      | 75 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  6 --
 2 files changed, 75 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml
new file mode 100644
index 000000000000..f7bc4f077929
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mp2975.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MPS MP2975 Synchronous Buck Regulator
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+
+description:
+  The MPS MP2971, MP2973 & MP2975 is a multi-phase voltage regulator
+  designed for use in high-performance computing and server
+  applications. It supports I2C/PMBus for control and monitoring.
+
+properties:
+  compatible:
+    enum:
+      - mps,mp2971
+      - mps,mp2973
+      - mps,mp2975
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this controller.
+
+    patternProperties:
+      "^vout[0-1]$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
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
+        regulator@58 {
+            compatible = "mps,mp2973";
+            reg = <0x58>;
+
+            interrupt-parent = <&smb_pex_cpu1_event>;
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                vout0 {
+                    regulator-name = "pvccin_cpu1";
+                    regulator-enable-ramp-delay = <200>;
+                };
+                vout1 {
+                    regulator-name = "pvccfa_ehv_fivra_cpu1";
+                    regulator-enable-ramp-delay = <200>;
+                };
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 15f89d7ecf73..08de873f9f98 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -281,12 +281,6 @@ properties:
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
-            # Monolithic Power Systems Inc. multi-phase controller mp2971
-          - mps,mp2971
-            # Monolithic Power Systems Inc. multi-phase controller mp2973
-          - mps,mp2973
-            # Monolithic Power Systems Inc. multi-phase controller mp2975
-          - mps,mp2975
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920

base-commit: d79616b04f0e08178ceb716a5d2ef60ab723d532
-- 
2.42.0

