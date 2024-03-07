Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09112880A
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Mar 2024 11:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709811217; cv=none; b=HHRgM3lVT8JmAxQnSzaZF8lSA4SJSmBNnX/Q5uZJg7+JG9QN/vwGQhKKgv2LHPQeF6Y5rwQUvfPgc3BCN3Lx5iCE4frJDl4RKARuxzAHmjk3QFA+T1AHywmd9WomMKKTHeTnfQvFx0xP6lQqjNGUHsKOHyLGpOMq6QlXlPPo7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709811217; c=relaxed/simple;
	bh=dRJ+kAHjwTS6Xk3FNS5Z+qnro/vKxfEynKSGErBYZsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMfk1ot+VEHinjgvSDHMIiW6lAjPaa9LV5W5FYyrhcVoEkEopM8BJpNVWDuO8sFdpY6FgfyBBQ2IzodE3Fi6UhfUXpGm/jdeQfJYZzGm6VwAKfYhSY9Ok4YC/LSHSP/8TBe5izGUT4VGdQXQdBnJxiV33S0hSj7TRlwpFTIneNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=C6SYopqC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="C6SYopqC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41312880f8dso2403695e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Mar 2024 03:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1709811214; x=1710416014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDRapjKGygNsR+NakDuOIL7yy4efS+lDW0N/vOIav4E=;
        b=C6SYopqCp+bQ6WPLbfEytHwtiW6D07PdZDj1AnjZEakHmYBdlToIZAbrKCV5lkabKn
         X8vHuQO24/CwZH0xj3a/3PUKolf03dnDj/j7iYaaROhzUJsLHN2b7qyZT8VGFQhFOCig
         PxTNgec+oA7cLtjg/ZQYgJ0MrLs1V4c2h6J8qxwVOYPrEm8nFSWaPn1XasmNaQV9ActE
         h1NyMIKEqsSB0UYyrreDziS24Xr40xVkBuv1jb+GVHpLclCkSj5jdsP/ygCMwSdCNzIW
         dmrJtC4jFmzONqxsEL2R4S21+s2Uw1rLD5ujcdQd/HzZ5aoVYZwwXb/vYpGsWY0UWvau
         FoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709811214; x=1710416014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDRapjKGygNsR+NakDuOIL7yy4efS+lDW0N/vOIav4E=;
        b=B4h7LRblnq2K/oJu2YZnv50YScgLYyZc2142/NpwEiIdRE7iKux46homR0ZwCdY8B1
         X2DwkRx2Fo2tF/URyu/nX2ewpXb0qPM4kpfEkqyR5CTK2ztpXNrm8yhltKGZWrCnl2N4
         Oft1ulF7jbOvnwcmc/AAwOUTwP4QKq19Z1NyxeYgfleCzFdCbraWQqOF/O9DrQU/pq9D
         Z1o9V5idNMZqQJ255bN0R3a4WQhh/o0mqXN31Z2RUTjXUFski1Vq1+6NgHuL2wTvbWEL
         pf1eMb35ktqqzUHsa0kddBe46r2bfHt569wy4KZinvTbX1QSTVZHbO5nJiFv5oUtcbwm
         VqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKKL5asQTI+QixHpvmwBrgDU0CVqGoFOm3lNxL8BLzt3nfABcGKIPB86fyeS2euzqoNaSwXyCIcxkVHOUkjE7RPpwRocDUwMPebmY=
X-Gm-Message-State: AOJu0YysLEjz90UPYy+cLS+/I2UTAjbKG+ExZpoQslHRwcUIH8hTXsYB
	eCYF9TM0Z8bsDesFnrHCbplcEpSlRSmJ5ZRwPY90dvYQNYKI+KPyKXzFCSqg7bQ=
X-Google-Smtp-Source: AGHT+IGss+m1vf/IVS15u/Vc7sXlFTJh6hhNvzfoJex9mq1unXJ7Qeo/d50qnGfSrzgMJA689NiH8g==
X-Received: by 2002:a05:600c:45c6:b0:412:faa6:c56e with SMTP id s6-20020a05600c45c600b00412faa6c56emr2686316wmo.14.1709811213760;
        Thu, 07 Mar 2024 03:33:33 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b0041312bdcd6fsm887617wmo.40.2024.03.07.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:33:33 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Cc: mazziesaccount@gmail.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: hwmon: tda38640: Add interrupt & regulator properties
Date: Thu,  7 Mar 2024 17:03:24 +0530
Message-ID: <20240307113325.3800181-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tda38640 has a single regulator output along with CAT_FAULT# pin to
report internal events. Hence add properties for regulator & interrupt.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

---
Changes in V4:
1. Update commit message.

Changes in V3:
1. Update regulator node from vout0 to vout.

Changes in V2:
1. Remove TEST=..
2. Update regulator subnode property as vout0
3. Restore commented line in example
4. blank line after interrupts property in example.
---
 .../hwmon/pmbus/infineon,tda38640.yaml        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
index ded1c115764b..5c4e52b472ad 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
@@ -30,6 +30,23 @@ properties:
       unconnected(has internal pull-down).
     type: boolean
 
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -38,6 +55,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -45,5 +63,15 @@ examples:
         tda38640@40 {
             compatible = "infineon,tda38640";
             reg = <0x40>;
+
+            interrupt-parent = <&smb_pex_cpu0_event>;
+            interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                pvnn_main_cpu0: vout {
+                    regulator-name = "pvnn_main_cpu0";
+                    regulator-enable-ramp-delay = <200>;
+                };
+            };
         };
     };

base-commit: 78cc80d834ed3b792605bc9c2215ed9e63825459
-- 
2.42.0

