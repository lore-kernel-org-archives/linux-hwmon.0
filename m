Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E24A3DBD4D
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177396; cv=none; b=oKBYalRV/akoRlosH1WyLwXJ1yc8eNYFVNLUamtIukZpwfYOFt95WAzCyEU3ZsQzZ4KPGEV6bDr+lnDO/OZrCNJuuWblAm6FdFM3h5rqVoLqmfUIEqHhfLacRsJ3ekPLS9LfHoK2b2ZyxuQhWay10OTBrpdR4aoejfon7+i0dIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177396; c=relaxed/simple;
	bh=Sh/ti6qXHF35XoxoQyD9WRUyK1ZDYF1GoWwDmjUE72M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTATRZabLSixyV/wFXsCFtEJ2RD05m74N+6yxMAltDHrvdCeTZjTyBcUwKWuIoUrJQomxkpFSvaobCRvaNFmHi/o25HilfPQgu0SdGua/lMYcNa2bhPSDRX1M33mVvpLz/wul6JDKT7iyKUOJzIz55VmjaYmdzQ2W/punZKkET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAt3Rb9O; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAt3Rb9O"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so2754458a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177395; x=1779782195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE9NxNSmgFTXWaGpF8piD6Zi9f5RomnIPJRQYF5twSY=;
        b=UAt3Rb9Op9UYZej/m3O89Ginjkl3q4gBN4cQW/OHUwQZ/U9Zva/TtnBwYJWtxCgng/
         ZL5PoB6vZPTrmrVsdOQiY1COZZZCkVmyrqHoJ05OPGD6c9lWdBeU5vAubN7egOTrt/yZ
         FS2rIgjX26CFmzQ6U2lJTIvg3MItQBcuCAQ+50AgAS3ZoxdFUi5p3UXa5iTsX0E2Ba4b
         qUjlCLiYUor8Wt5Seb27Q5e5xA9Kppykyl84GhAPrt/4FuSJaOHm9YGBrEe7fFLDx582
         Ea9OhnOE/5h5aQ5/6nPWCT9dEpslNUP9NTSCX1ZG3vP0Lna0QVIhqFDzwLdPJRcwvxzy
         4ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177395; x=1779782195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE9NxNSmgFTXWaGpF8piD6Zi9f5RomnIPJRQYF5twSY=;
        b=k5QQVk5bJDelntHjEHYdZGfQc5dr4Njyr/f0zt9RdyrRedkbvNk7VVGjgVktNrBIqG
         JcjOIkKiBsYhTsFl3hqfPOTKiBHzY1LAOm0NwCrLUvXwPLIn71/TizCC9eTuVqfDkDHM
         sKviTyxkJLyy+/cjPPqtxwFkNXSoR8yIFGxRr4b2N9okc62ZFEwTJqQbYIN0sy2LnI2c
         sP5ITxbdORFump0lN3MOEDjn6d/Y99VuTB2CEiVEiveF2eN/3oLwX03Y6N2HVg5f8Ma1
         yTn4FcVSOaNsRDuFVku9dY9/EvCYBSvhQFOdCGeyShXmBPv8TK2OY0fCqtkHP8/vX6XJ
         jpcA==
X-Gm-Message-State: AOJu0YzguyG41uKDBAZdAM076VjAsuM/uQWFQ/RHCQLSY29wQr0IAJU/
	uhio4y/5TR7E85PvjA3HX8IN3cIGlKRm/+fbS/cAiojxKOPDBDgbnQ8F
X-Gm-Gg: Acq92OHYvdfTUMHO+jZP0BrvNPkFoLRVqsm78pAjkQoI+RUr3AX7pfSRMkCz+0SyamP
	/YhDWkatfv733U04Wpk2PGQRRURF3KZqdOeuv/QIywDOAp38z8P9dIRzX1ovYmZbMhP/RjpacTu
	nuk9vYX13USgsVA7e1Sq9v5wMA12CSBd7j2LoPKgWEsDC3dLaXRcMCcd68TUudPlxN4xcCzxi4z
	F59aq16JfNfdac2xEPXOaTJSE1uGW7SWytwVfUqyx2I5FyIohR42jcSoXGEljFWXggy9M1Nf1Kj
	620cTehBLJoDA+JUlTpvI2iV6woGydXV64HbhRmspG/AfbFDsM3BDkWi7IZIn1Td5AGsRVIc40Z
	Z0WjYHHlkKd/t9lmlMKNaj1r7X4Nc9ktENgNLt/vVMgNIffr38vO1G011KF8vU3r/J60pTtYpwR
	FjFRHEOSzTW8J4Gevk49tBUkxZajENCHZBhNrHIryuTL0L
X-Received: by 2002:a17:90a:c106:b0:365:c8e3:ec53 with SMTP id 98e67ed59e1d1-36951c953d1mr19112176a91.20.1779177394692;
        Tue, 19 May 2026 00:56:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:630b:f287:3279:f420:ef8:5c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm17116652a91.5.2026.05.19.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:56:34 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP730
Date: Tue, 19 May 2026 13:25:57 +0530
Message-Id: <20260519075558.91466-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP730 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp730.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
new file mode 100644
index 000000000000..a7361a07891c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP730 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP730 is an eFuse with integrated current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+  Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp730
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
+      Supply for the VDD_VIN pin (pin 20), the IC controller power supply.
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
+            compatible = "infineon,xdp730";
+            reg = <0x11>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

