Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D28EC4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Dec 2022 21:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiLQVEd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Dec 2022 16:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiLQVEc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Dec 2022 16:04:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB7038B1
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Dec 2022 13:04:30 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y16so5513846wrm.2
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Dec 2022 13:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoubCa7EcB3zMfAg72L+XuWRWZxRRGMO6kZ+wOPzJyw=;
        b=WOvgy/Xmj1a3V+LCw++iLlzAGkvxob77ceCef0rfs7C5VZr+BDwx5P+K7VnBKU7tPN
         X7bU6UXEmGLQ0G9HoRslibRanbEpbK0yy5Ba5J1fjnYm+2Ar+59vJy42V/4a3Q/YNsH6
         L/VcjEPIIZqgt2f+HY5G5aMdJqW7ckhfOaOPsYAuSxg6H6fot87iUIN9dzHf7PPxxWTZ
         SYNlsVAK4BFZYusYiJk7ezsUMC8oSKs+Oh7CDd2q4XYieraMoY7r5RUjMCdKoHv+vPMX
         2cMLDxnLPuwZAyp5JVgRuMWTuSjmEo0PvcKCl3yT2ohWktg7myZmx1BvGmsXKvNCDvmd
         S7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoubCa7EcB3zMfAg72L+XuWRWZxRRGMO6kZ+wOPzJyw=;
        b=R4RTpUTa9OsTQzDQ36qyLzVD0nV1g8Xb5d/j6uL9rLOg0RZrtT/CAaOveFWBxBZHy0
         dXDP0y71FwLzLletWHIbSa2cyw1lDib+D4LDWwW5SAXwKWEuG11X7MMimcVZHsoAbPHw
         fs0P+Rw8pb8jfliT+5QQF+PPv/Rq7Zir430oYKuU49rLhVmy28YwiOfwHxrRyUnxRNh4
         5iteOiRTJ4chX5EFB7378Ffnd/l2vfyZEegUNmJRec41LHPUFzGN1CWkOgUDTTTWRwUk
         X1DFCl5OM1iNZGTiw5QTVd3wB7PdAlwvrlmtNCJLgaDiqUxldYWefAi6xKppld2a5OQ0
         TKng==
X-Gm-Message-State: ANoB5pn8zFIZn12BgYmzEszd++0Aam1rGJnYcAHqf/fuLmP8P4J5O+Ps
        8CI4lxgAdyuiNPcDPzDkEsj6nA==
X-Google-Smtp-Source: AA0mqf4np/2MtzqJ6UAduJKLaFf1X+2/VphBahZhU89MbEB61xTtDiUIEHW5uAYTzEbwzPRPGDv7rg==
X-Received: by 2002:adf:bd93:0:b0:242:62df:9214 with SMTP id l19-20020adfbd93000000b0024262df9214mr27372619wrh.3.1671311068664;
        Sat, 17 Dec 2022 13:04:28 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z1-20020a5d6541000000b00241f029e672sm5726942wrv.107.2022.12.17.13.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 13:04:28 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org,
        linux@roeck-us.net, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, conor@kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2] dt-bindings: hwmon: gpio-fan: convert to YAML
Date:   Sat, 17 Dec 2022 21:04:23 +0000
Message-Id: <20221217210423.836948-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Converts hwmon/gpio-fan.txt to YAML

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Changes since v1:
- Keeped only one example and simplified it

 .../devicetree/bindings/hwmon/gpio-fan.txt    | 41 -------------
 .../devicetree/bindings/hwmon/gpio-fan.yaml   | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/gpio-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/gpio-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/gpio-fan.txt b/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
deleted file mode 100644
index f4cfa350f6a1..000000000000
--- a/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Bindings for fan connected to GPIO lines
-
-Required properties:
-- compatible : "gpio-fan"
-
-Optional properties:
-- gpios: Specifies the pins that map to bits in the control value,
-  ordered MSB-->LSB.
-- gpio-fan,speed-map: A mapping of possible fan RPM speeds and the
-  control value that should be set to achieve them. This array
-  must have the RPM values in ascending order.
-- alarm-gpios: This pin going active indicates something is wrong with
-  the fan, and a udev event will be fired.
-- #cooling-cells: If used as a cooling device, must be <2>
-  Also see:
-  Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
-  min and max states are derived from the speed-map of the fan.
-
-Note: At least one the "gpios" or "alarm-gpios" properties must be set.
-
-Examples:
-
-	gpio_fan {
-		compatible = "gpio-fan";
-		gpios = <&gpio1 14 1
-			 &gpio1 13 1>;
-		gpio-fan,speed-map = <0    0
-				      3000 1
-				      6000 2>;
-		alarm-gpios = <&gpio1 15 1>;
-	};
-	gpio_fan_cool: gpio_fan {
-		compatible = "gpio-fan";
-		gpios = <&gpio2 14 1
-			 &gpio2 13 1>;
-		gpio-fan,speed-map =	<0    0>,
-					<3000 1>,
-					<6000 2>;
-		alarm-gpios = <&gpio2 15 1>;
-		#cooling-cells = <2>; /* min followed by max */
-	};
diff --git a/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml b/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
new file mode 100644
index 000000000000..c522072c0d07
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for fan connected to GPIO lines
+
+maintainers:
+  - OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>
+
+properties:
+  compatible:
+    const: gpio-fan
+
+  gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Specifies the pins that map to bits in the control value,
+      ordered MSB-->LSB.
+
+  gpio-fan,speed-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: A mapping of possible fan RPM speeds and the
+      control value that should be set to achieve them. This array
+      must have the RPM values in ascending order.
+
+  alarm-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: This pin going active indicates something is wrong with
+      the fan, and a udev event will be fired.
+
+  "#cooling-cells":
+    const: 2
+    description: If used as a cooling device, must be <2>
+      Also see Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
+      min and max states are derived from the speed-map of the fan.
+
+anyOf:
+  - required:
+      - gpios
+  - required:
+      - alarm-gpios
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/cortina,gemini-clock.h>
+    #include <dt-bindings/reset/cortina,gemini-reset.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gpio_fan {
+      compatible = "gpio-fan";
+        gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+        gpio-fan,speed-map = <0    0>,
+                             <3000 1>,
+                             <6000 2>;
+        alarm-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.37.4

