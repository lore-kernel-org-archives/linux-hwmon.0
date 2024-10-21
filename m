Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2851DDC38
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Oct 2024 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513853; cv=none; b=uP4R5WYSuuh/+B9+ds+vwuYJFUcFXQKoi1KNHlREQGlOpCjDKO7hbvOHT47n18kq/Q+a7a23zezkfHY4To2Lc9rw1e6TVjmVMAIMdty4QA5m8jfr8Uf0r6mY06kwEn9yoInVwwktaXRkwBwcNpXQQ/Ll9nw384xOiBhvOG4VhBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513853; c=relaxed/simple;
	bh=dNHYhLYnCz57OOLIrQpTU04I6U4G+9ia8mwDBYvE6Hk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rsahQjE5p62zCnmi/HEsqpwxM96vhKmWrdWJfcbBQ47zS0zJNup+mbm9P56l5pPXvpdndmFi2CfML+qEprUgi7pKcZ+Fe49OG3Hxp+EoDBHsZ+wmrbassoBsqOCX9VEHU4GlutEbPTeEAyVlKXVOM+NGA9cZfiCwArD+HJAUynY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=A+f4afAs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="A+f4afAs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso43547175e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Oct 2024 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1729513848; x=1730118648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOcgV31d+YnFQlRPolkUo1sUslborEWsikCkSJr1UrA=;
        b=A+f4afAsFM5VkAq1TwBJgkgoK9XE2D7oUR+KmmYv+LNsuOTmShp+sfR9znJoNQ7U8b
         WyS91aU8zhwBVNpxdmxG+aly8xeZOaWq8gMOodau98MEuPBZpeZc0mugJsAxWobG+5oS
         r9poQyOruveWa3v6GWDGHNOjfIEQ1AElm65IU6lTjJFtHy6vqOT2CBVWr3z1fKcCYoMe
         9yG06biMbPhTTjqPQOwgpFalPXvDaJpW1Pf2uCW2ZIfZdSly21mbhLDAtVOr82yRdUw0
         LTrtfoGdHIjaNpUQqWIZs48EeMHoXFWtGKQ4x6s+W6Vv1F8oFhWBlqrjYC4jSH8PjGHt
         8iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513848; x=1730118648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOcgV31d+YnFQlRPolkUo1sUslborEWsikCkSJr1UrA=;
        b=X5Kj+UKAaGh4wvfJ76zlTqUBHO+l4hgxM6zSP6wByNnOZwr7C0wfOSRh8WyvWj4S/C
         jrjxYgmy64ZzG3NKS48Lvf9VpwPM4utVR0zNq1CUhbE24uCSE7NOi+I6w0gKcY2V+15W
         +KQKlUM+YewVNXEjCcr9E0OyZodgw7Hdf1UehFFlALBnrvz3g+qZAqlvd4LTKdxa+i7o
         HJx+E6cWF79iYT+9uVSmglg60I/KJrFFpVsDyyajJrgF7++bDY2Kn0TIO3DUqZFBmjV/
         c0GBu1LdqCCzUQFi0OKWHsPBl6qny1iJv2rOPz/A4LbyA94sxigkHnK0dM2vwZ83vMVy
         yDWA==
X-Forwarded-Encrypted: i=1; AJvYcCXC9mbfn2OXV7udu1DDfNVU3fkL2QvLYaoAgEhz52+/TdUdH4eIO9cUNSCRViQU05p79NIzXL7QzJFbmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVskhTP/6PH4sfz1mH91nBeDon4WkdPniGcPBkYgYTVJkFvK6
	qSENNKQcGK7NlEeNBlhs3VhJewLGHjipQ5Wz8H9N0NcSlr9f3nNdzAH8g8UbVfY=
X-Google-Smtp-Source: AGHT+IEtF3bT2QfrG/FSR80A5nCmoFdFM8oPeqFnxIfisEJZ31HCLKiDspKSvJLCb+LbGqlwdYfqJg==
X-Received: by 2002:a05:6000:b45:b0:37d:54d0:1f20 with SMTP id ffacd0b85a97d-37ea218b5ecmr7169863f8f.24.1729513848383;
        Mon, 21 Oct 2024 05:30:48 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37df9sm4237363f8f.19.2024.10.21.05.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:30:47 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: hwmon: pmbus: Add bindings for Vicor pli1209bc
Date: Mon, 21 Oct 2024 18:00:43 +0530
Message-ID: <20241021123044.3648960-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove vicor,pli1209bc from trivial-devices as it requires additional
properties and does not fit into the trivial devices category.

Add new bindings for Vicor pli1209bc, a Digital Supervisor with
Isolation for use with BCM Bus Converter Modules.

VR rails are defined under regulator node as expected by pmbus driver.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V3:
- Fix indentation
Changes in V2:
- Squash the two patch in patch into one.
- Update commit message.
---
 .../bindings/hwmon/pmbus/vicor,pli1209bc.yaml | 62 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml
new file mode 100644
index 000000000000..4aa62d67e1a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/vicor,pli1209bc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Vicor PLI1209BC Power Regulator
+
+maintainers:
+  - Marcello Sylvester Bauer <sylv@sylv.io>
+  - Naresh Solanki <naresh.solanki@9elements.com>
+
+description:
+  The Vicor PLI1209BC is a Digital Supervisor with Isolation for use
+  with BCM Bus Converter Modules.
+
+properties:
+  compatible:
+    enum:
+      - vicor,pli1209bc
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this controller.
+
+    properties:
+      vout2:
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@5f {
+            compatible = "vicor,pli1209bc";
+            reg = <0x5f>;
+
+            regulators {
+                p12v_d: vout2 {
+                    regulator-name = "bcm3";
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 15f89d7ecf73..00361b5cfc3c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -404,8 +404,6 @@ properties:
           - ti,tps546d24
             # I2C Touch-Screen Controller
           - ti,tsc2003
-            # Vicor Corporation Digital Supervisor
-          - vicor,pli1209bc
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
 

base-commit: d79616b04f0e08178ceb716a5d2ef60ab723d532
-- 
2.42.0

