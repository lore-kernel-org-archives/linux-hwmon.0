Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847A5C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 14:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6202F610A3
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 14:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234852AbhITOG5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:06:57 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36492
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234639AbhITOG4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 10:06:56 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E5D223F320
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632146728;
        bh=fdpLjVmvKsg2Nwtt/QkPoL85cbsz/uoLku3sZOIHSi0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=RYj4ZitiQhNyuNDgqM1aeG5Ox55bn+HBpPjvLUjtLkake3u9WfBDEtJ7UDfQJjoD0
         dwTrMrsEk0BAE5+RDVJod0QY7lPDi1uFQl6FoP8pCEKkfhvaDTx0SeZIMboZs6YqIe
         faK4tE5f0JkObgNd7uO8/dPPSAsH2CzuDRd1OTX1hpI+yHfjfNv7h5fIg2ZxrOsewS
         0vGQsWdBl6YdjNm9GI1vLJzMSnW+TNbLlHQHqrPWX0HZ1tnHu64K6T61pHZ0sUV7mK
         hRv+QNSGPw4qbUZYmJCumV+Q8npKxMubhg2Fh7OHuib044NFkjvKQ/Q6tGjTc4ATv8
         lenAiJtRnwY9A==
Received: by mail-wr1-f70.google.com with SMTP id m18-20020adfe952000000b0015b0aa32fd6so6170351wrn.12
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 07:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdpLjVmvKsg2Nwtt/QkPoL85cbsz/uoLku3sZOIHSi0=;
        b=jkC3snieq+1L70RRwYDY9vkcUUOPpLF9kLLfe9LPxFCfNpH27+g5NQ5PMeQ0uaC2w8
         sWJFBD4gC5thiEVMK40yowCq5KkI1Z7ZEXwbA9YtDxnNYHqMB2h3RIzfsbMIFNihqGM/
         Ck4gh1QzYgPjzKwNlDU+Tez+KVLMDBnimInmdQBAZuVGFELADVwrKwmbWOokqF/JXvsa
         WKm+b7nayGNG1tgGAKAmwK3lDQB+CwsguEDvgHyz/hvKUIQa+KL8G0uRT53Hl2+sG8Qm
         7pNDm3ZhQ3G+4nqAEQbcW1/POCKu/VSbrBn3Vcyhj1DxEZRtOyjP9sjjB11TRIGHkDST
         e66Q==
X-Gm-Message-State: AOAM532O4CzgE/wR3xrPgGg3M6VmMS2x1LwfozGi9RpW03tBDo0DZAF5
        wniLJ90X2Oyzh7tZg94UmkLC+hEJ+CX3+MCF+wnfh7lwtkbcr/eKWgJRdbLcW5Goow6wm9iLp5l
        o+wdrKjYZo+RrreK0wBVGrjwJjg58WaEiN4i6eDI5
X-Received: by 2002:a1c:e915:: with SMTP id q21mr30136867wmc.180.1632146728541;
        Mon, 20 Sep 2021 07:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIDtc3RXnWuKWsXmWL/7mB7dq58VPcwOfG7BYj9OFQfEk3j1DGfBpNzneREBKQdY5+2+1+uw==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr30136843wmc.180.1632146728373;
        Mon, 20 Sep 2021 07:05:28 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id w5sm16179092wra.87.2021.09.20.07.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:05:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] dt-bindings: hwmon: lm90: convert to dtschema
Date:   Mon, 20 Sep 2021 16:05:25 +0200
Message-Id: <20210920140525.157013-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert the National LM90 hwmon sensor bindings to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/hwmon/lm90.txt        | 51 ------------
 .../bindings/hwmon/national,lm90.yaml         | 79 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 80 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/lm90.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm90.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt
deleted file mode 100644
index 398dcb965751..000000000000
--- a/Documentation/devicetree/bindings/hwmon/lm90.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-* LM90 series thermometer.
-
-Required node properties:
-- compatible: manufacturer and chip name, one of
-		"adi,adm1032"
-		"adi,adt7461"
-		"adi,adt7461a"
-		"gmt,g781"
-		"national,lm90"
-		"national,lm86"
-		"national,lm89"
-		"national,lm99"
-		"dallas,max6646"
-		"dallas,max6647"
-		"dallas,max6649"
-		"dallas,max6657"
-		"dallas,max6658"
-		"dallas,max6659"
-		"dallas,max6680"
-		"dallas,max6681"
-		"dallas,max6695"
-		"dallas,max6696"
-		"onnn,nct1008"
-		"winbond,w83l771"
-		"nxp,sa56004"
-		"ti,tmp451"
-
-- reg: I2C bus address of the device
-
-- vcc-supply: vcc regulator for the supply voltage.
-
-Optional properties:
-- interrupts: Contains a single interrupt specifier which describes the
-              LM90 "-ALERT" pin output.
-              See interrupt-controller/interrupts.txt for the format.
-
-- #thermal-sensor-cells: should be set to 1. See thermal/thermal-sensor.yaml
-	      for details. See <include/dt-bindings/thermal/lm90.h> for the
-	      definition of the local, remote and 2nd remote sensor index
-	      constants.
-
-Example LM90 node:
-
-temp-sensor {
-	compatible = "onnn,nct1008";
-	reg = <0x4c>;
-	vcc-supply = <&palmas_ldo6_reg>;
-	interrupt-parent = <&gpio>;
-	interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
-	#thermal-sensor-cells = <1>;
-}
diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
new file mode 100644
index 000000000000..e712117da3df
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm90.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LM90 series thermometer
+
+maintainers:
+  - Jean Delvare <jdelvare@suse.com>
+  - Guenter Roeck <linux@roeck-us.net>
+
+properties:
+  compatible:
+    enum:
+      - adi,adm1032
+      - adi,adt7461
+      - adi,adt7461a
+      - dallas,max6646
+      - dallas,max6647
+      - dallas,max6649
+      - dallas,max6657
+      - dallas,max6658
+      - dallas,max6659
+      - dallas,max6680
+      - dallas,max6681
+      - dallas,max6695
+      - dallas,max6696
+      - gmt,g781
+      - national,lm86
+      - national,lm89
+      - national,lm90
+      - national,lm99
+      - nxp,sa56004
+      - onnn,nct1008
+      - ti,tmp451
+      - winbond,w83l771
+
+
+  interrupts:
+    items:
+      - description: |
+          Single interrupt specifier which describes the LM90 "-ALERT" pin
+          output.
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  vcc-supply:
+    description: phandle to the regulator that provides the +VCC supply
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@4c {
+            compatible = "onnn,nct1008";
+            reg = <0x4c>;
+            vcc-supply = <&palmas_ldo6_reg>;
+            interrupt-parent = <&gpio>;
+            interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b990794ec35..b07679009af2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10928,7 +10928,7 @@ LM90 HARDWARE MONITOR DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/hwmon/lm90.txt
+F:	Documentation/devicetree/bindings/hwmon/national,lm90.yaml
 F:	Documentation/hwmon/lm90.rst
 F:	drivers/hwmon/lm90.c
 F:	include/dt-bindings/thermal/lm90.h
-- 
2.30.2

