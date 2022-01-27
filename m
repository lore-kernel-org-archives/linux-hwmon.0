Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD575C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 16:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbiA0QRu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 11:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238263AbiA0QRt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 11:17:49 -0500
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:1::465:111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19253C061714;
        Thu, 27 Jan 2022 08:17:49 -0800 (PST)
Received: from smtp202.mailbox.org (unknown [91.198.250.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4Jl5NC5YRgz9sH1;
        Thu, 27 Jan 2022 17:17:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1643300265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DX8SAIyGDR64YVDBy2Rvw45XBF+XAanxuS6zg87fdlo=;
        b=EMQ89OIPLfLNaYC+tzsvh8A7MceE8uL+mlnh+DhrBzAK0atuzHd1dty8Pe8Lx9OIY+4Hin
        PlrsRxxiDebb1xn/JvHCMRpLZ0YhZ7MrtaZ1VoOeqeK2ZMUvdLcMlg23rdtnqX2YGbfF+V
        Gr1wm+OXEP0KfLvzgtigWb8Hq/tC/PQVJ1NMfIIiNd4pDzxFF3cgT934rNtkuZJccIyOku
        c1A7WnUQLrvMkJsdL9fkXnfT63QyizyILTRA1KnUyMqZ0gKYUCWOV9Ezd0udgepiQmoJuo
        45Yt75hL4x2Fn5EzYBi6NcFDXmovCTpiL2kclU74SMiz+sR789StVf54UGJPWg==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: hwmon: Add binding for max6639
Date:   Thu, 27 Jan 2022 17:17:29 +0100
Message-Id: <224e73b57101aa744244bd396a700d5365eb72ec.1643299570.git.sylv@sylv.io>
In-Reply-To: <cover.1643299570.git.sylv@sylv.io>
References: <cover.1643299570.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add Devicetree binding documentation for Maxim MAX6639 temperature
monitor with PWM fan-speed controller.

The devicetree documentation for the SD3078 device tree.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
---
 .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..570e9fe07503
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max6639
+
+maintainers:
+  - Roland Stigge <stigge@antcom.de>
+
+description: |
+  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
+  fan-speed controller.  It monitors its own temperature and one external
+  diode-connected transistor or the temperatures of two external diode-connected
+  transistors, typically available in CPUs, FPGAs, or GPUs.
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
+
+properties:
+  compatible:
+    enum:
+      - maxim,max6639
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "channel@0"
+  - "channel@1"
+
+additionalProperties: false
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: |
+      Represents the two fans and their specific configuration.
+
+    properties:
+      reg:
+        description: |
+          The fan number.
+        items:
+          minimum: 0
+          maximum: 1
+
+      pwm-polarity:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        default: 1
+        description:
+          PWM output is low at 100% duty cycle when this bit is set to zero. PWM
+          output is high at 100% duty cycle when this bit is set to 1.
+
+      pulses-per-revolution:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [1, 2, 3, 4]
+        default: 2
+        description:
+          Value specifying the number of pulses per revolution of the controlled
+          FAN.
+
+      rpm-max:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [2000, 4000, 8000, 16000]
+        default: 4000
+        description:
+          Scales the tachometer counter by setting the maximum (full-scale) value
+          of the RPM range.
+
+    required:
+      - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      max6639@10 {
+        compatible = "maxim,max6639";
+        reg = <0x10>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0x0>;
+          pwm-polarity = <1>;
+          pulses-per-revolution = <2>;
+          rpm-range = <4000>;
+        };
+
+        channel@1 {
+          reg = <0x1>;
+          pwm-polarity = <1>;
+          pulses-per-revolution = <2>;
+          rpm-range = <4000>;
+        };
+      };
+    };
+...
-- 
2.34.1

