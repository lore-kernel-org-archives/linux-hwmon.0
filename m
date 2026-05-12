Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF62BE053
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550304; cv=none; b=d7LW/Hd9seVucEm6tWylpzEm0TwasHPiuiNFUUF+IJrMzxtU+T32MAmTohKMcg2Jc1pKlnl3YQxz7ztI1WaUaNd4kchqrJyD89/doNgFFptYHsa2+kb2zhPeQPkUNquWE3hZHse0L6VAIZgSbkWmS2J83ICi7LIFmBkdNP3cqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550304; c=relaxed/simple;
	bh=Q3ioFudllYCjZyXshtVqqzDy5SHdDU7yOLr7dIoMnmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+OIoDDecoMuSdSrpWYxwyGh65r4SHhElDWIw9vm1Ad5uwcbd/rUf5JvymH1zmREcWmTYpxYoUYCtMtSwHEWqpmLhgZztj1gfK0HRSWCriAVH2Og06OrbIC8R3YsXox1uHscPmTwo9VNxj1rZV1ySnciojj/hY3Uo6aSFJ81quI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HHMPEMJP; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HHMPEMJP"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso5542945eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 18:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778550301; x=1779155101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQV4tzp3OFnBfvXl/boH92Xo54D5tVzuUnIAeuN4lII=;
        b=HHMPEMJPvPGevYMrRR8nuUTuQfE4p4zTXvYyExeub+thoYZbUy4Z48lUZH7V/ZgTrK
         RyFNMp7mCEX7rSR/zy4DYFQuvzgZ3tghCWgFf74bf6pZhhdczgDRPYbYfzHhhRsc4X93
         FBMnAVeaIjzngcH34yrUYnguxgOvyAEB0LzblsGa0fMbJ9aTiTnCBNkWvoY6UMMVxznN
         fWtdiLkjOmJPaZ/H48t9p7/EJb1G/L9g7wxrz+3Q/g/vewtoka1B8v4lOOWbxuoE+ri0
         kNSzahMWljZw/I6iaYkIoIEbcWNRMFumXYHCJL6L3vUqz7HhDwhQJ/d6fwyUDgTkHr8j
         aMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550301; x=1779155101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQV4tzp3OFnBfvXl/boH92Xo54D5tVzuUnIAeuN4lII=;
        b=hYSMX/AUvBlO+6hyfMcid9Ab6wOgZUlJiT1YAvBjW1E6tIhFNia6Mzq1Rc+GWuSYII
         g3ErU/Ovd8TAfwgcneiZiI1URgBlP43iRBuwO1JaedbY2PvkViOp+bwc6IVh9wB3v2eA
         VJIVokk3kcfUIT6At+7MWm2K7aJfJcD+wucJvTENGl/zWJoKLpWiZngiSyO5Qm6RayVd
         Ff5K3j0/GI/kQD7oYYTYlpste7sh+CjcXaX+efk0plb9oar/Lc1WYyiqW8+/ahFGsRy3
         I6GSOWe2XRKmlAj6/BjzHw471r4kJ3qaU2X7drOzWq4BEwl/Zqg4e6knEQmYJfhM6844
         3HFQ==
X-Gm-Message-State: AOJu0Ywbe3aW9Vzn9dAcWlgSx7J58rnNwVzsfQxZqPjFC8EjvA6GsCj5
	lLbNekYvXCiZsd0L4ohknG6Xm2iBq6jGZQ9heMPB6ODzNPTeNxMQQtCT1MmG3Rkc0vw=
X-Gm-Gg: Acq92OED87Vzy1u4I0YHCGasjZNT2CsXYYa1uOmpQm0R6B/d7jPs6CSQ6Xj93kFQUzZ
	mM3YLH3SR2XcbDfq6dzDLocphoZaNFVMgdRDHsse7Q79f+a0usGa3odhcuTOKfkBPSKHXIrUlsy
	FcQ+q6fqq64hDKA0SfrDkdWJvlL+OQUjLsHc1UiAJWquba9ysTOlh9pGDMHTBwnrZn8zeo414Ak
	2B4dgSrWlSmbQdEKzmmqUwi5creZX8mLfAB9LUlSeJcLCsQVYLo4XQ3vxsQog+QRfbhUHENs1PH
	fQGwYc9a0Dw5aDFTCTO0vehIsG/oSyhLSdJ4+X12I9+KYsmJT1JzWBLwjGCPLICrog8Z/r5YkgK
	EtWfEoGzTwrO9Ik0Vh7pxxq54w5zt6PJMqhsz799AmBiNnHzLxUptTMwDRqSBQyKKx4V+mrbXKf
	3b+klWMb92WzoNswbn3e/ysjJs3Xqys8gswitR
X-Received: by 2002:a05:7301:605:b0:2c5:50fe:c78f with SMTP id 5a478bee46e88-2ffd5cbbc42mr636806eec.12.1778550301253;
        Mon, 11 May 2026 18:45:01 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15815467eec.28.2026.05.11.18.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:00 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 18:44:27 -0700
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Murata D1U74T PSU
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-d1u74t-v1-1-623c2bc1532a@nexthop.ai>
References: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
In-Reply-To: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778550299; l=2107;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Q3ioFudllYCjZyXshtVqqzDy5SHdDU7yOLr7dIoMnmU=;
 b=35AdbhgGng4Ulx3Ss3OCrz7wF3UFRyzqexR8UATlBNaLsknkS0nPGKnLYVM+hmSFe4jmZSelK
 ScItKVyPVOEAhm9o60+3O/zeAdMpUjB42uygtdbjA6moKf8+qij4/8g
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add devicetree binding for the Murata D1U74T-W PMBus power supply
unit.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 .../bindings/hwmon/pmbus/murata,d1u74t.yaml        | 41 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
new file mode 100644
index 000000000000..ef080283bf79
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/murata,d1u74t.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Murata D1U74T-W power supply unit
+
+maintainers:
+  - Abdurrahman Hussain <abdurrahman@nexthop.ai>
+
+description:
+  The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit that
+  exposes input/output voltage, current and power telemetry, three
+  temperature sensors and dual fan monitoring over an I2C interface.
+
+properties:
+  compatible:
+    enum:
+      - murata,d1u74t
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        psu@58 {
+            compatible = "murata,d1u74t";
+            reg = <0x58>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..b6a055fbb870 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6803,6 +6803,12 @@ S:	Maintained
 F:	Documentation/hwmon/crps.rst
 F:	drivers/hwmon/pmbus/crps.c
 
+MURATA D1U74T PSU DRIVER
+M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
+
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 M:	"David S. Miller" <davem@davemloft.net>

-- 
2.53.0

