Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B711E3F0A9D
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374597; cv=none; b=O3k+0OYIiDMpJEPtltlN163z6QNwjs25BC0x76XoakGv19mn1yxrkOsbA9N20bXEMVCMNpZgFsYoel/ufMdMyBgo2+OTGKZHZ2vt/Yuxi4vyWXbPK/jhrps6sxkbrnXEHeEk1BfU4ymzv1Y8uqkjg332XqpIgY3ETBlnqUvwHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374597; c=relaxed/simple;
	bh=oeFPyjA8meNApf8ve0RVSH/vUQhsJf0hI4tW7uly2FI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DACE87JkgiJGWPcB3rSBA1fscJybv5kFQDZOTPXR0wkXVHWdYYjtqELZSxxlT1FWOHY4aDbRvNX+r+KQtKfvPC//7jEN5quzvvtMuHZUurd3UiIQ9mjTrNRaAGRIxPA81fZleV7iNIMRFQwcJHaxvdGWGv82xmEi7vn2rVi3/h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNEY+gPq; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNEY+gPq"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c796163fac5so6955927a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374594; x=1777979394; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j3ABCX0B44ntnsEcGXuWaL1D1UCxJef/aJwfylgH2uI=;
        b=KNEY+gPqzLV+aYWPZ+ak13wg54/I5d0huDwDtxaSOkwDpqSHlU7B+vuijwLzt9rQCU
         NI7NkITRHsJFyMMKhmS2acOTuIxDJyElduJ+cYzWZCblrMAkdDv9fNw7U3hZBnXkqSS1
         epMDjkaYBu+oNIzQ6+NvhlPz6gZxLJnHS7FO25jWDcCgEdh9Jc74VW03mvv855KzG7Rh
         UobCyM/6wnbE8dYT1glKMEcgOr6QqKPhRUtxJ+C24mEwoenRPdTqfEATguFetWFiVvAa
         vmDaWc7nbQwBgyUj+oCKv1pckrsk4mEoKzpP/w1SjZxY8pd6zyZZ5E7NTfc4ve/c9T9i
         kQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374594; x=1777979394;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3ABCX0B44ntnsEcGXuWaL1D1UCxJef/aJwfylgH2uI=;
        b=UyJhwnQJBM5xcihM7JKs48MSXyQYbBrWs0HS8X4EI0Axyp25wZxV6eBIjxdEDfw04m
         tmk0El6j6jdURvqFkAUD25ndnMCY6vl3DRalvi6aPjEjGc5jU+FU76K53oXTCsFTw4ay
         u4pmvhY21QoHklqis8PKJTFG/o9ZdbCpivbYpbFf2s6AOU+C9xLRHl8T7ytZg69QYQw7
         EODwOhp8vecBaP1E6bfhb/YN6xvn6ZildZ9s0zOvj+J4F6/I9Kl2BYUNDe+MQPrWrftf
         YHSkMRLYCNnFO5jK2jsyUoBGs0aGX9DrMVCsk3sHr+c40TfT6TKHeXwiky7j8KnF7K9b
         tYww==
X-Forwarded-Encrypted: i=1; AFNElJ/GvUdcI33qXSWAlE08xjePnz/5NyK+v9z7nFmgG3RymhyIbEKLngHYcc1xwWF55MFraDsiQuKCDTtXMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Qp0f75yLUlvyQVrKuDlm0dX5EXP7rCAzJHiN9fQb8vkHexOj
	0ygwAAqxLXnJKYAb9jIQEF2u9BVIldOJv0nR7C/TR0jK34IcySVtmOnZ
X-Gm-Gg: AeBDieuDIgE8FD+ZT/9JKpt302aaKKNdgpkM15NbgolLO6TfVEF/rh6wCF3wJFfyief
	uiaT8kIgX2yi5ONtp7YxCgto7zAgkTwN1Z+mzT6207mCR3QOTgwG8yZ4LBYn4jgFg8fPnWv1YvN
	7ZNN1Djd3a1t/Ch7OXw3LX7FzDjZeSDzfgVJv+1DtvOpncCMDUEgcallJmIEznJAzj7BMMnBas2
	etzQoMWZ/WhbENrw8IRBem5iUvO4m1L7Y79y3CEMQT+GDHuDKZOPEONUByiOCOtJVqOpOLvI34V
	/sVPKME4rwpxnIO2DKnTQcYjWSA+sqg9vXPIz01kFrWI85Xjqin97PC3j9mp0hADTxSJbVpjblD
	x3k7K7YWINOh+bmqMsL2N3h3xqKrdSrz7AK4G53oZ2VQcrnFm2M6TN6pscjEpHsSWZYfWLJQh5/
	EqbMDN2/5haDwbUE+2bvkn3hAJKGfVgBKC7VhGXbUZNlgO+d1e/xfLI7ueUt6liuk=
X-Received: by 2002:a17:902:ebca:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b97c437ccdmr26629835ad.15.1777374593744;
        Tue, 28 Apr 2026 04:09:53 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93bd4sm22828885ad.23.2026.04.28.04.09.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:09:53 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v6 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Tue, 28 Apr 2026 19:09:27 +0800
Message-Id: <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add YAML devicetree binding schema for Sensirion SHT30 series and the
compatible GXCAS GXHT30 sensors.

Use fallback compatibles for compatible chips and add optional
interrupts and vdd-supply properties.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht30.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
new file mode 100644
index 000000000000..9b120f8d303c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SHT3x and GXCAS GXHT30 humidity and temperature sensors
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - sensirion,sht30
+          - sensirion,sht31
+          - sensirion,sht35
+          - sensirion,sht85
+          - sensirion,sts30
+          - sensirion,sts31
+          - sensirion,sts32
+          - sensirion,sts35
+      - items:
+          - const: gxcas,gxht30
+          - const: sensirion,sht30
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the VDD pin.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the nRESET pin. Active low.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt connected to the ALERT pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        humidity-sensor@44 {
+            compatible = "gxcas,gxht30", "sensirion,sht30";
+            reg = <0x44>;
+            vdd-supply = <&vcc_3v3_reg>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.34.1

