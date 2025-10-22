Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F722D9792
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 04:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108439; cv=none; b=Cmjrboo1sIZH7D2y1x8fDCoL7snDrezJfPe5bl3QhZBr5YhY9T2da3UFYomUWk8GLMo0K2SJyjmtV2c4ORCjw8ENCauhLKEFMQ5Q2/2ij8Tm3/HLM9+SGkxhfYPsqBagl42hFgVrLsvxd8fao1k/KZfv9Dz12ZBL8el3aklhpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108439; c=relaxed/simple;
	bh=tRmg0nM0yOi19ddPpyllwAng8EhI2p+zBWRtANG9g3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhbeSLqXwu0HUVmNb8M4+KZu46XOL9K5vm5Kwq5OWgZp6unhHLTz/rYrsbFiOcOrgJGYW/eQEgV8PFX8gbiggkwbW1zVEnwph+Ke0HCCDXS3W5eRHnvcFkk+ei1Y2sS1+TnO/7EY8po6mW3gYlul/5RAAuh9dm3mENp36RHUh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=j4d9Ouqh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="j4d9Ouqh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33d28dbced5so5468898a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 21:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108436; x=1761713236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g3w2/WDXSoRhXJMMBp8Ljyd85I3LbiCuNCDyo4g5rM=;
        b=j4d9OuqhMHAUkHo181/Gg+2LpYBMjVOn+EjuqLI6WnAJ4m/nNctyqVRH8sYABxkuP5
         puLk0Ajaz9HJSG0Ra2VoOO4AC+MaW2CYBm2PDWBkrLt6YhXvBPnthMW+Gop0hhqtrlj3
         gQ6vJ4CNYmvAg9Ys7n1zL0KirVbzmtVnD+R+2sLCeHM3aJxgnjjEttHrQXdhS1u/TzVy
         T5xmxh4E5/N3zIh6JuFl+YVKkxz+5c3FIAqfBgOdNVZcuPhRD3iu6PCYCDEOE81YmZoy
         yd3vbhQAMQKGJYhjf72jyVBWhyRtg2gAnmdxkO+Vx65QInG1jfeidKqU3Vr/xqaGWzNo
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108436; x=1761713236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+g3w2/WDXSoRhXJMMBp8Ljyd85I3LbiCuNCDyo4g5rM=;
        b=KRyFkyubm7J62+vIDfBQ/osBT5mOhTpIEZQCEVRsJ6yFbFjz3+6McqVl/+6F+5yVCM
         Qkw+4KV8F+9pRS1RIFB5C6ad1n/DNDpy9b66nzVfaUaInDrsYrDl3R6UplQzbxCDC6oN
         RtqPLPeaGXY1Gkf46QRfP3funwC4FfpybuLeHZSiHYzi8NZ4QUH9j9oAFvlj+2VKoJXP
         o5abiR1eQhSeHZvDQvkm7JlyIao14VQCdkqTMCyYsdpw01JkUknx9UiGGerUy8XHcGWm
         KSVPOja0+KXmEvpAjm5w9m9AHRI9jRRIchMXBcj5ABMyOBC90T9HrqSZkYK1u0S8t1PY
         6N7Q==
X-Gm-Message-State: AOJu0YzQdDkbHlAIfiINZZPzbXzmU3ECnD8uLWYosWA5lfZCX4hs+ylI
	YlGFNd8uj5uLfG3AyUXlM4c/og+DzKd6+b65cZivPVFRq3hM8pIiPaF5GCBMWZPx2wA=
X-Gm-Gg: ASbGnctB1LQaOn7aBY056OLe4eXaNpGPvJRw0zNujgZ/VaJS4ON3U+fP6aTwtR3Hz0h
	Iv3VAPImAP7YSF+3FnehSTIzbOSCOuERRfOxigvr4LlmdXNkrtGb1DAEADWKmpojiR5sVZaYTYz
	1ZHPvvUji8sO1oFhJsFUjmb//PtxI6NM9SZBK7l+IqmCD+lm5aQVOAACtTkbUrFVCYC6kdAfbuC
	7miSQuaf4H7ziIz2qmUXtjLTkTokFB1xUzWblM7OZ9J966sBoJCi8Gld3CiwcWGmDwtjX4nKu21
	5Fbn6ekHEhoOpgAxl59MJ97j6AreqNqzS7FSqCpVkZuLTrTtFn3opWiS0MAkBJHFp+vEOdNW0lB
	u41mmfera3AXB59sD+Ri3N6AV1J5ktPnHQ9yCoxYvDcKaA8FfV9YR8LiC6YwyeEWMOavW8GhzSH
	YQ8G+u
X-Google-Smtp-Source: AGHT+IFW1zF3iL/OYtMt8e8D26V/k4CY22GYL4vfqmAbUGpIaxRLd5gEXU0u21nkZey/eOJ5HimP6w==
X-Received: by 2002:a17:90b:2d8b:b0:336:bfce:13c9 with SMTP id 98e67ed59e1d1-33bcf8e3d37mr25973339a91.20.1761108436088;
        Tue, 21 Oct 2025 21:47:16 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:15 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/5] Documentation/devicetree/bindings/hwmon: Add TSC1641 binding
Date: Tue, 21 Oct 2025 21:47:08 -0700
Message-ID: <20251022044708.314287-6-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a devicetree binding for the TSC1641 I2C power monitor.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../devicetree/bindings/hwmon/st,tsc1641.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
new file mode 100644
index 000000000000..e79f6dab4a87
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/st,tsc1641.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics TSC1641 I2C power monitor
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+description: |
+  TSC1641 is a 60 V, 16-bit high-precision power monitor with I2C and MIPI I3C interface
+
+  Datasheets:
+    https://www.st.com/resource/en/datasheet/tsc1641.pdf
+
+properties:
+  compatible:
+    const: st,tsc1641
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor:
+    description:
+      Shunt resistor value in micro-ohms.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st,alert-polarity-active-high:
+    description: Default value is 0 which configures the normal polarity of the ALERT pin, being active low open-drain.
+      Setting this to 1 configures the polarity of the ALERT pin to be inverted and active high open-drain.
+      Specify this property to set the alert polarity to active-high.
+    $ref: /schemas/types.yaml#/definitions/flag
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
+        power-sensor@40 {
+            compatible = "st,tsc1641";
+            reg = <0x40>;
+            shunt-resistor = <5000>;
+            st,alert-polarity-active-high;
+        };
+    };
-- 
2.43.0

