Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC13F23AF
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040503; cv=none; b=ruatdulP2eKwM8MjqlCmUYb7onDtXcibO7YeQylWvYxSxTexF0QDWHfjSv+dPdnukkxooeLK+QurfXBjY7h94vIwIVM/G79O21N8yKsQhqOyt+kkfWEIAEF+tSwpHJk8dWdH46P5kKIgZ1gQedSBJiPPKaTDEy72C5QBhNSbdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040503; c=relaxed/simple;
	bh=8YZJdhOlyL39ffQ/A6qDVxTueJxnsiBwCKTKfFyt94w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXPb1NK+/PDfyzk8jMxxGJY1OJpXTy4qAjJfZAaZhfgzVfVWQeIfIi9fjpWTsvvjHsRtcGxpSZHrZ7Ed+KrY4rkx7LTB3OugONLGRVpA390ckpT2is73PldkTzgh7K7z4W/Bqv3taeHWC23O/0JLUTZmLle2FprBv0C9ifnGmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSyib6VU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSyib6VU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-829a9d08644so3635700b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775040502; x=1775645302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iMVKNP9g85KxWdh0B2OkgS2yUBZieMpq0qqQkDzEB0=;
        b=DSyib6VUzEEHYFwgTuGkeWy4KDXzoSQBl8QETpeAu+Zn98J7WEJkNOrbIAvITKDj/e
         yBHQkTkyqpkzbAcotx7Qo94vGvNaLGeraHDZpQK5Zltq5qZjJ8tJGArkIRSwlr5sT6lI
         L2ERgkmKbaIYjlmeUcFIZn3RFqOv+IBdwzKMvx4mOoMKoOaP52uu8nDCyNloUCki+lRZ
         E9+I3v2/d4diERUc7lZyFf5vJBAd+jLxaSHgJZuqnZn1jUYV1AV6pSNhPa4sSnLuDFwI
         pO2T95W/sngVNTWUx7MsKjp1SEzBwXM7BSGqjTU9d44s7xZsUUEJUftiEif+57mhRC9w
         PyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040502; x=1775645302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iMVKNP9g85KxWdh0B2OkgS2yUBZieMpq0qqQkDzEB0=;
        b=JWadY0A8u+2LNoJhFv7ljgCbQa9fjG2OJTQW6F0awXBgqlXOqq56H7imvUw7vx7kpj
         EE/G/Ro20OvvBD5EKnQ73tbqgFcnT0pluG6SVtcprnUEJ4ERnRQc8IGQHYQ6mB4liff9
         To13MlqCTiWx76+DoQDNhROpMPL7JWya9iwKE9ve5FJX3P+41m/JupqNn0sjWHindApn
         iSqPYVCL6nUCDQ842jzMp/h8YrJWXddMxOeodG4wzYVqMMLBO44bCS5POOwJdyaStavU
         e24XRpBhy+pec4ExAF+DTXQqlE+Mge9moz38ZXmZT6i78oK6ZVnhx/LzVO35vyjn8X0l
         hg/A==
X-Gm-Message-State: AOJu0YzKHeTMXo6Ge2/hLeUJjNjnBHQq2kSn8PCc6mpZIa9wtnZhfuw0
	PtqUb4Mb77S2MS+lq4K0UUgOWKdgKDeVrhwjCraQ7Wh+Y7ZTXGxiZIaxmo1agQ==
X-Gm-Gg: ATEYQzzWj7X7WP9shk4hx4RSX39uwEktOGMO3jZqBk+rbaj8jyM6y6MWSA4uSDrW+AK
	E61ocUVJaXNBYu2jxRjM4XouB+DzsXyRUEhyW2j1+ubcClCg14NndBfsce/fS45+WRIPhUoSp4+
	jThWebHQ6HsbpFtoguhhNOx5IwiBR+Wvpsh0UC3779m2NjhATRYZXzWFxk0/IQuZZnJaK5sJ/76
	/LQkj2/S4lLtCtj/ZHwmUAdvYXcrRmX74hqT9MlLKKcY7ZiKzXUChUx84jlSKWsgzD9Q3BrpvM6
	jbXRQ7aEf+nWcOaeZTCgkEzTVUK2BlylEQ06V1FJKN2OMWWNZwSXVUeEcNIe7DqM/nbLhQwb8Kl
	kckdu2uP+qrxSm+epMeQGPJ+R3DCZgYxSwOLmOC+13mi/a3VkKAQM69J8r3/2xioxoWY/O3yS8t
	td44x7ercycclLS74M1uB/4L5oYGbtu6BDwToD7/sQ
X-Received: by 2002:a05:6a00:1a10:b0:82c:eafa:8875 with SMTP id d2e1a72fcca58-82ceafa8927mr2605439b3a.2.1775040501866;
        Wed, 01 Apr 2026 03:48:21 -0700 (PDT)
Received: from localhost.localdomain ([27.61.46.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b818sm17010259b3a.6.2026.04.01.03.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:48:21 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Date: Wed,  1 Apr 2026 16:15:49 +0530
Message-Id: <20260401104550.115715-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
This patch introduces a YAML schema describing the required and optional
properties for the XDP720 eFuse device node. It includes details on the
compatible string, register mapping, and rimon-micro-ohms(RIMON).

The RIMON resistance is installed between the Imon pin and the ground
reference.
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
new file mode 100644
index 000000000000..bbde8ff92ae9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -0,0 +1,51 @@
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
+    description: |
+      The value of the RIMON resistor, in micro ohms, required to enable
+      the system overcurrent protection.
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
+        hwmon@11 {
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

