Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB0325482
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Nov 2025 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373657; cv=none; b=SDJJxeWMNnLgpZIWeQ8PuHP0THkigbDiLur88SLnwZQJL4AqM3PR7O8BkvKpo27XVpyO86AxGvC5uUGXCJ5d1NRU3onsRn8Wdq/nXf+uXuBs+MO5pi5LykfQFtkVY8mhowZlJMZPDN5szSRoYHLVe5EMg25UJ2nzK1TIT2KyYP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373657; c=relaxed/simple;
	bh=Ykvay+KbmIz4mfBpsW6reUfGaWR/oBY1ov+y0XO0Gi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jszrb2doopBr2oRykdVCOG138SNVUXiRscsyGCMZR6No/Bf1nbxEJZENshf2nuktxAlJCS3Ia2dewJNsV/qbT/NDYveCqLzgCjCC+WQSz5tc2HhpcZjh1UYT/gQ8tQpZlGco/2Dap8TEX5wBOd2cmjIXuSbbix77If/I/08cWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=anF113TB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="anF113TB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-295f937d4c3so2034385ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Nov 2025 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762373655; x=1762978455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5UUjWOJCMb12I/BWzOWhp+eaG/l4rBJ5tx7KBsTma4=;
        b=anF113TBFdGCwBVy4exG+TjYZ8rzr6yppxd3TG4JUruavX8aRpZ5242FhEBoqvf9eQ
         iGRYFsr2GH9kpaZ1sCVXbQ1tZ/J8PBcpnjqN288VE7MxZY9J+ObQRdbBEjyj0E5rlZjx
         +YUtHGeTfnBNifJ3br6/rTX4suogwBQwF9YCMwRJc05La/D0un4fR42+XlbejBslkXm0
         CDxch6lWoPqKR7rpS5HyZmtwAOVAhGoBIvy66bJYdIGCW6gz3YUvIcpCCTPyvfNPh0ZC
         Hyg5Ge6AYsgTL9UWDwBvhkt0DDuXi1Aee+dqlfXqh1bPOsGjvo6eanPsCYc+F1q0i48o
         QOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762373655; x=1762978455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5UUjWOJCMb12I/BWzOWhp+eaG/l4rBJ5tx7KBsTma4=;
        b=caE7bd7nfdi68KSYhTedNLVTKs7Ur6IUv58rdQ247T6KqMErtDh8Y3vGKJdM5z9N9y
         Yub4V91I08mJraPnDTwWDiolIyMfTZ0ztO/4eizgb6GwY8vDXfUhcm7DvFbVYMxaG4sf
         tRIwsqo6Zpxydv19eFHg9xiLX6pUwTRhlo0EWjkSDLU3iXOMNlXk9MaI4ayda67uc/t9
         DGgZtE8pZ6j/uCSwrWGKWbGVm2bfH/Q+9KuqzBG4NNbmXEfOU0E9Q/YGOPK+RzuNeFfw
         kkcVNQyM8/PY/XLKqBRnctOlmlu4PzgriRolIvJf09HQTzlsDo0rBKTSutHtvogCxy+F
         OYRg==
X-Forwarded-Encrypted: i=1; AJvYcCV/zMUsJ+Nd/KkK/VkyTjf/U/gbZXe0PhvcRHmCbz1mHoPfPhDiwq14/JGzplLMCsHep5mA9ZBKfaDzSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bx4UYhWKjouCSTfLQnTDJeZPecN8ASfGARVYIzNrR+B19ybp
	ohzWkRmL0d8igWQmXmRQ5OR8V6Lj9B+oxZWGBmOc1SgMU/OMcAHDgQ+vASxsW5vehtk=
X-Gm-Gg: ASbGnctdKeqm+Wz0RIz08LV53FVzG0ZjmeOudHlgSBYJdrWdpDmrOgw79g8Oyi7JHUV
	0cJXYkgvYZvo8W8Y7uHu6qWYbu0396j174euiNMs8KWPRxVxVirCWsZ0eZQfsMwiOKhE5FVNI4/
	Li4Jk7gCMJNbGfHqzldizCEABbtVV/jFdY7bSsG3lWJMHuRy5EXOA6EeyBy1NzGbTTN8Lbd1eLX
	OLoTlfpQlMICqSbeJVCWB9jCLVbUTMHUecYqI9+u+0pMnQ2GxKIstdtqTIr+hsqqtf1qmb47+Ng
	oEP/JhK42yHmcR/KI15VempsgUSMtyJDG2DagMZfluV6dpxY277nmt5DERh6lWwhnfjJj3bC8w7
	57Bir6rIyKlT+a0aHj1urG94/aQDgAg4NytyA1dtarVOMT4/SDG3cWSB+si02kO6SBqm6u+1FAC
	tpnG2zy7A=
X-Google-Smtp-Source: AGHT+IFsZQ3ivEoCdxUegpplY25ctIsfGAFJ5rAU93tEd/MzTCmdN2ztCF+pwuYG4rHstc9J65so6Q==
X-Received: by 2002:a17:902:d2c6:b0:295:1e92:6b6d with SMTP id d9443c01a7336-2962adb2866mr67889775ad.46.1762373655002;
        Wed, 05 Nov 2025 12:14:15 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:3099:85d6:dec7:dbe0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b8ddsm4039435ad.5.2025.11.05.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:14:14 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v4 1/2] dt-bindings: hwmon: ST TSC1641 power monitor
Date: Wed,  5 Nov 2025 12:14:05 -0800
Message-ID: <20251105201406.1210856-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105201406.1210856-1-igor@reznichenko.net>
References: <20251105201406.1210856-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the TSC1641 I2C power monitor.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../devicetree/bindings/hwmon/st,tsc1641.yaml | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
new file mode 100644
index 000000000000..aaf244790663
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
@@ -0,0 +1,63 @@
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
+  TSC1641 is a 60 V, 16-bit high-precision power monitor with I2C and
+  MIPI I3C interface
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
+  interrupts:
+    description: Optional alert interrupt.
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: Shunt resistor value in micro-ohms. Since device has internal
+      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
+      655.35 mOhm.
+    minimum: 100
+    default: 1000
+    maximum: 655350
+
+  st,alert-polarity-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Default value is 0 which configures the normal polarity of the
+      ALERT pin, being active low open-drain. Setting this to 1 configures the
+      polarity of the ALERT pin to be inverted and active high open-drain.
+      Specify this property to set the alert polarity to active-high.
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
+            shunt-resistor-micro-ohms = <1000>;
+            st,alert-polarity-active-high;
+        };
+    };
-- 
2.43.0

