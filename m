Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C3B2475D0
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777630892; cv=none; b=GlT28E5OdOr4q+ohZRNKJPNwPF/cXsFDXJW/smXNTUMpU5TgSWqWG63jiHO3LUiAXXYFinnV8Ckk0CldchrVZYzR1XXtKo5MS5JBtLf0S+8Hbmc40oH4CbSdj5pdppIZTTlct9ZlptOVA1r2o5eLUzeGMQZGFfCISJ4t1gg6/IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777630892; c=relaxed/simple;
	bh=Lo3+DqGac6IlEiZ2czM1lRh0/V9vMHG9J90YVU5aqGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiqLAcPOl6PvoQZCXV3SoT3J6WqR8lUIpHqlXjmvvXvfe7lLzM1cWfCBfV9pCQ0VTs8ap/RsJzBJjyQtNpC21eKLJuHuvjDKImr64C8ycmSu1zyqO3CNzpPubdeExm+hdbS43zaI9yhf5Jo5JyZhF3aqwBDf0Mul6VycVFsnHHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caqdJDgh; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caqdJDgh"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so681423a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777630890; x=1778235690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqnN+2BfCLE5+NYkaRPGHIh+GKWc00ij8KyAPoVlJGA=;
        b=caqdJDgh5UsIxg557i8chSK+q+6/tnhudYgtCawy72rgLlZs2ukgkBkPIfic6DOvDH
         f6arVHBF6J9KVEB5nAUT6n5rrhbOzgOYnWuRocRg1ZId6Agz4HsB47BiE51uXWt0VE9T
         D3bSvmjo8S24N7P6uBPg2skIp/1wEXkGktuSMhr4k6hgRX3GkhkLgCjc3sZ2v8P5qN9W
         +UodpyXpmCiwAaGvfduX0Cboh/cjI+yQtr9Tl3LzixShGAhTkvh6h59Qhl7sp0kpuzP4
         oCJSWfq57JQGaYvwONDelrOS4svxjgmbMBeNAwWjovnwOGvnQ7VaQbnQxh8PNFLBfMiq
         dfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777630890; x=1778235690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqnN+2BfCLE5+NYkaRPGHIh+GKWc00ij8KyAPoVlJGA=;
        b=ku20aHLd3AemLhhsZJSmfj9gtXOAk/et/TxlnZ8zezsn5TJkpdLNkHjloOGHWYfvEO
         tTGbQxTBi73wGoMW94KYpQhgeZwXWV/PplqqruSHpA09iFQYQ9hSbhxHlNdorQLdxprx
         AzE6R7kjfMwP1CUi+7Y0sfBEwxC79xUpwIRaFD3sBi9ojphSjWJcofHmReOF37jtmBFw
         re67lsnFfMZk554NH/Ja0+fiIZFxe765AbWfReCv6D5FoYz/Sl2NgVo7M/WHZXYvzAAP
         9URhe7PZAUOqyWNIK4BvoVHfB4fEFb2istMepZRMN0bkop3ptQ2QtE8yzBHww/Fi5GuW
         5/VQ==
X-Gm-Message-State: AOJu0Ywt6t7ctj14Nq1zl/1ndvs6RvRKH76HiVow96ETeLsowuvas8MG
	BF68ZflpoGkzNQ4D0W+z6oyWLAtAXTzMFCOuM43e0AiPS6DJ52ctHdUo
X-Gm-Gg: AeBDietm85f4s802lY0fAgst5LB2gy97l5kvfB1lj4j+GhCL5ggICEmWDyS19JA6tk4
	ei9hyOy1VCMXdOwh19nVvj/507HG6fzkms/bYpUXPJ+3MWyrJOSbA7TMPg5jCYwt/CkOtx6o5kz
	yiFhZMqmg6MXIY/kpPQl/yN5I0GcPIRBsxYJkDBtspOCi9Y2MgqcAnQ1hi2XNYOOfgd1BFI0TDy
	gfAycUfM4saUbNzqk8dMiJmNp6oEhS4T9bw56wZModxivgGZlbUa/yOK4G0iTgj8fDWa8ttf8ME
	+18pxu2F77G7U29IFRQ7NhyOIILzAX4FPtkesXSoJeW9LWozL0XMoWXg0oR4MwP7SuBBHlLgrS8
	9llX1jGfs+Lo92mXWvFyPU9uItSWcCSgm1nNiDaZ0Uc9NYeJhaPTpKcMkTYyEILFaoRnD9wbksH
	tdS4gB8YMIHxOISDje012kF5vQ8iRuqvYNAjzIu4fUfLNj+DQgMdTe0eThTGnvo+AZuLh0F6KCi
	d5ld0ihM9KPrDQ+
X-Received: by 2002:a05:6a20:5483:b0:395:ce56:4448 with SMTP id adf61e73a8af0-3a3cf68b511mr7357065637.25.1777630890111;
        Fri, 01 May 2026 03:21:30 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b87869sm2344295b3a.61.2026.05.01.03.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:21:29 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	linux@baker-net.org.uk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] dt-bindings: hwmon: zyxel,nsa320-mcu: convert to DT schema
Date: Fri,  1 May 2026 10:21:16 +0000
Message-ID: <20260501102116.8275-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ZyXEL NSA320 MCU bindings from text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/hwmon/nsa320-mcu.txt  | 20 -------
 .../bindings/hwmon/zyxel,nsa320-mcu.yaml      | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt b/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
deleted file mode 100644
index 0863e067c85b..000000000000
--- a/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Bindings for the fan / temperature monitor microcontroller used on
-the Zyxel NSA 320 and several subsequent models.
-
-Required properties:
-- compatible	: "zyxel,nsa320-mcu"
-- data-gpios	: The GPIO pin connected to the data line on the MCU
-- clk-gpios	: The GPIO pin connected to the clock line on the MCU
-- act-gpios	: The GPIO pin connected to the active line on the MCU
-
-Example:
-
-	hwmon {
-		compatible = "zyxel,nsa320-mcu";
-		pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act>;
-		pinctrl-names = "default";
-
-		data-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-		clk-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
-		act-gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml b/Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
new file mode 100644
index 000000000000..a111f8125e09
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/zyxel,nsa320-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZyXEL NSA320 MCU
+
+maintainers:
+  - Adam Baker <linux@baker-net.org.uk>
+  - Guenter Roeck <linux@roeck-us.net>
+
+description:
+  The ZyXEL NSA320 uses a dedicated microcontroller to manage system-critical
+  functions like fan speed and power monitoring. It is connected to the SoC
+  via a GPIO-based serial protocol.
+
+properties:
+  compatible:
+    const: zyxel,nsa320-mcu
+
+  data-gpios:
+    maxItems: 1
+    description: GPIO pin connected to the data line on the MCU.
+
+  clk-gpios:
+    maxItems: 1
+    description: GPIO pin connected to the clock line on the MCU.
+
+  act-gpios:
+    maxItems: 1
+    description: GPIO pin connected to the active line on the MCU.
+
+required:
+  - compatible
+  - data-gpios
+  - clk-gpios
+  - act-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    hwmon {
+        compatible = "zyxel,nsa320-mcu";
+        pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act>;
+        pinctrl-names = "default";
+
+        data-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+        clk-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+        act-gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
+    };
-- 
2.43.0

