Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF462C001DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 11:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbjGYLlA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 07:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235012AbjGYLkt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 07:40:49 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316EF1FCC
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 04:40:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99b9161b94aso345490066b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690285233; x=1690890033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCWWBBRJa0PORsLtnTWiKQp9jCoJ7Z5w0rr05I0MhAM=;
        b=A65PLuZvDWSYYYDsjc1F+ZXpzZI+oamgjXR5RgxTp9cRoQ9Dne5I+Jh8psRSH78myb
         A7gqN0mwwpj20DcWesnpkiRR1y/0oDoxMW2YQF6jriAms+leXGFKjnklt/4wJaInyHnD
         pANYTfJu/uKiRwA8tPws/g+LXN+6so5TwwTgN30x8YjP+2P4iX0Bf5VzI49W5Rey7lcA
         m+dK9+9YHD//oL23pNz9tydLv7vA2IQtnvHSTwKcSe98dC3zblljuMHuDEsOVINXb535
         AI/BqWNjgFBPXrudag3p1/C1VjTcqKp+5yXHOVTkDkb3pRnZ1VohwoBv+4VrR4mJoCB8
         HKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690285233; x=1690890033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCWWBBRJa0PORsLtnTWiKQp9jCoJ7Z5w0rr05I0MhAM=;
        b=JCSCvGyITdgnHGKz/mraBL70I0NPA971mvIQGxdyT/j/ftl3IVryt7NpTCRCqjfjYL
         yoJ9offp4iLDLP7ojZnxkWICAZAhqogeKrZHB0rGVOI/2GVXHCMwVzd/FenUsFQ68eWW
         NqywfPCB13WrB+yE2BvuIlQw83vJjj99Y88eNLhDZ5QcVErvmXtkPu9F5MYNY2dgkFj1
         gtPKg0wWRj0GW8pBNvsHmgcxNfsfDgNtPWCwh2LD0i9Xtz2UqIIGGkTd7o94OcD675Q2
         p+Y9VcF6zgkZp3eGpAIiGgqBBvUh9Y2D0k3OwasfyHKDwtFUJ9ymmVtHlJ3TA+bMvhvq
         7X6w==
X-Gm-Message-State: ABy/qLaRK8nYe4JqUTovxzRsBDsA+nMddAxlkqmYxrTjlgoiYetHmmFG
        aS0dWtd4+S8GRoYiWpFmpaqbmw==
X-Google-Smtp-Source: APBJJlFS6kYrnmiucY9eWirPBclgdbF4vnVSeCw6/ChNL+5oAgMp6DRN0T580c2uPfxcC++hVTOUoQ==
X-Received: by 2002:a17:906:9bdd:b0:99b:4e75:52bb with SMTP id de29-20020a1709069bdd00b0099b4e7552bbmr12428460ejc.69.1690285233475;
        Tue, 25 Jul 2023 04:40:33 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id d6-20020a1709067f0600b009925cbafeaasm8088206ejr.100.2023.07.25.04.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 04:40:32 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: hwmon: Add Infineon TDA38640
Date:   Tue, 25 Jul 2023 13:40:26 +0200
Message-ID: <20230725114030.1860571-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The TDA38640 has a bug in SVID mode and to enable a workaround
remove the TDA38640 from trivial-devices and add a complete schema.

The schema adds the custom property 'infineon,en-pin-fixed-level' to
signal a fixed level on the ENABLE pin and to enable the workaround.
When the ENABLE pin is left floating it's internally pulled low.

If not specified the driver will continue to use the PMBUS_OPERATION
register to enable the regulator. When specified the driver will use
the PMBUS_ON_OFF_CONFIG register to enable the regulator.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../hwmon/pmbus/infineon,tda38640.yaml        | 50 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
new file mode 100644
index 000000000000..520112e4e271
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38640.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TDA38640 Synchronous Buck Regulator with SVID and I2C
+
+description: |
+  The Infineon TDA38640 is a 40A Single-voltage Synchronous Buck
+  Regulator with SVID and I2C designed for Industrial use.
+
+  Datasheet: https://www.infineon.com/dgdl/Infineon-TDA38640-0000-DataSheet-v02_04-EN.pdf?fileId=8ac78c8c80027ecd018042f2337f00c9
+
+properties:
+  compatible:
+    enum:
+      - infineon,tda38640
+
+  reg:
+    maxItems: 1
+
+  infineon,en-pin-fixed-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Fixed level of the ENABLE pin. When specified the PMBUS_ON_OFF_CONFIG
+      register is used to enable the regulator instead of the PMBUS_OPERATION
+      register to workaround a bug of the tda38640 when operating in SVID-mode.
+      If the ENABLE pin is left floating the internal pull-down causes a low
+      level on the pin.
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
+        tda38640@40 {
+            compatible = "infineon,tda38640";
+            reg = <0x40>;
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6e24c4d25ec3..2b1fbb2a672b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -151,8 +151,6 @@ properties:
           - infineon,slb9645tt
             # Infineon SLB9673 I2C TPM 2.0
           - infineon,slb9673
-            # Infineon TDA38640 Voltage Regulator
-          - infineon,tda38640
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Infineon Multi-phase Digital VR Controller xdpe11280

base-commit: 55612007f16b5d7b1fb83a7b0f5bb686829db7c7
-- 
2.41.0

