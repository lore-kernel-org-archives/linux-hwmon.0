Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959138F94A
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920351; cv=none; b=lOCdvsgAOvCBuu5lbFCqRRPipIJGlsJVyKMv01WIywTQwwgy8Yxjb9NZcLBm5nBjPYNl8h/2wezaZRQ82+BL4hfV6cqLYYnmhEvW1xMCs+L/qALpXyBxSZdGm5ZY3v6yrIZG5KHbHx9WpHa0RPyAZk2JBkz7xWwHJ80QktKtstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920351; c=relaxed/simple;
	bh=ciHLf7bevgqHXVV1Zx/xu9fwtsFudEQfZfvHtZh2a7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=uiMqDwgOzyWhuu04+IEbxyCYT+FAdjwLHqTwCcerZ0wiYx8UDWMXSOjbb0VzUnQgR/rg2M2/NgY6d3/9oc+zoqyPQByB/YZE3nbiTLo1CQDt1R2qlqbGHNqoDEyMfMqMHdXsyXh4FN7AEFmbps6efeQFXkkUty1TS7UneHmwR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCzGSb84; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCzGSb84"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-829b2018c94so523673b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920346; x=1774525146; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tFWl6KgxoNw3rtXQXYIsDCxT8H3n54d3r9FBVbrDtcA=;
        b=PCzGSb84hnhOnX8XOkBQwbjJgH0VWxyK1DCEFgUQyWtbniok9InjsKNk8Ei7lT63ht
         V33Btb8u8xC6d/m7A/ddpkjYiUt6UpU74+nvBSPtxQmChXm/p2Bpx77AyZuJA3Aa1hwA
         QzRfldYZBxFoOdaf4G2M5vnJcLoXDRWFj8n37c2nWCsBlBWy4eq5f+WSzeEYG1hpxdjQ
         Xp3OMqgq01+tdVnH62CmlDQKBq8GJ5s1YED49NXzZhDUyhK4N3Inq8OiUhhZblMbhonR
         BkJs1/FMnhF6HIORnIUrAhpl0+AkD3jtA8IDk5yKi/fbNKwoWL5wtqyBXsVwqhBb1+QA
         OZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920346; x=1774525146;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFWl6KgxoNw3rtXQXYIsDCxT8H3n54d3r9FBVbrDtcA=;
        b=lNiNUn47W0qswBpUB3mlqmwTgyTVTy9CSSppvGViIVWVsA1y+ZO8RiZ7VqLXqb988n
         tl1RACgpLmx0tyBIZgZJaSCCcI82y09G+iEkHbHqcZQzJvHZGqzm2RgFwUC5Pm0QYTcD
         haNmWgB2zdb7vNV34oaiXnhgil4PyWBytElsawbzquv1nMmBwmzRg0UF2N0R4CxtmKl3
         Ax3MzQPWV3UwQqnjcR01g9t/dhdoYwit85QFBOe/yhSl2BGfg909nhfRNcwsS9+lAq/N
         LcmTnYT9rEGflWPouBbG3w1jqg0StnAlLT6P5ncH9jVVlJA1/finQbBIUyWcqWqal6dA
         YSZg==
X-Forwarded-Encrypted: i=1; AJvYcCVmTYNgrPt6s31cGhQEVd9LrZAh44xXPGDSV40qwT7qH46Ez5v46Xgznv8lmdu+WYKbD5uUGlmxMaBcPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVVf7CBEQrzaHfVXm6J02q5pqqu9VL8j4be9YZK+c+nAq1Qilv
	or3RikxlHtH3udKSKrTRsU/v3QNl5WI4YZer6XYJ3sB6lTLm6RU+tw4k
X-Gm-Gg: ATEYQzyckHnejuoJoYvRienz9gdDhelaRzJ/UiLphT00auawoO7RKmwGwMhRbsUKgPH
	TO/BghORaEikcR3ER6wrLdn/xCKcIyV5V09x5/PQbvGMQ6uQwv6+1lkNOBNqRit0u/rh+grh0Yl
	2wjf6QQbIXpWmQYSUyR0Ibpji7Q27wE8MuGamY7oKuYaprlXRvpmW3lVJpOBUFfoTCmnJHQWbDt
	CLv9G9jrsHF9WK0JWRjqqSRhr7/+VPIYPFEYLlWqdqcr6qsJGwwoQYYAuZqnPNZBwYvIvvlZFQ1
	zAt/6c7/cDDgYp7m1W0kX/Q8CmxLD5d9SYoWAeyN4Tyw0YqCFh3iCSY+QQYno8IRGJuS2n8OVaS
	/ArLLszCh6aH19LcXyOA6Mge5ei3+AQCtLSkwk89L4S/BNzkqhLQNtBAbIH20YjRVWqquQak1Z/
	F/GArJ6qlYLwUwB1/O+GqxJaNA7Ypec9CwQFC1AJrA7lFCjKbUnbi2
X-Received: by 2002:a05:6a21:102:b0:38e:87b7:5f88 with SMTP id adf61e73a8af0-39b99d4c7a7mr6720256637.27.1773920346247;
        Thu, 19 Mar 2026 04:39:06 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e545d38sm4985706a12.19.2026.03.19.04.39.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:39:06 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v2 2/3] dt-bindings: hwmon: Add Sensirion SHT3x and GXCAS GXHT30
Date: Thu, 19 Mar 2026 19:38:33 +0800
Message-Id: <1773920314-17755-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add YAML devicetree binding schema for Sensirion SHT3x series and GXCAS GXHT30 humidity and temperature sensors.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht3x.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
new file mode 100644
index 000000000000..47dbb743e2ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht3x.yaml#
+$schema: http://devicetree.org/meta-schema.yaml#
+
+title: Sensirion SHT3x Humidity and Temperature Sensor
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+description: |
+  The SHT3x series is a family of humidity and temperature sensors by Sensirion.
+  It also includes compatible sensors like GXCAS GXHT30.
+
+properties:
+  compatible:
+    enum:
+      - sensirion,sht3x
+      - sensirion,sts3x
+      - sensirion,sht85
+      - gxcas,gxht30
+
+  reg:
+    maxItems: 1
+    description: I2C address (usually 0x44 or 0x45)
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
+        sensor@44 {
+            compatible = "gxcas,gxht30";
+            reg = <0x44>;
+        };
+    };
\ No newline at end of file
-- 
2.34.1

