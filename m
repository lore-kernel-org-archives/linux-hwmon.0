Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E239EC6FA90
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 05:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiIVFHj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 01:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiIVFHg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 01:07:36 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547C0AB064
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 22:07:35 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso46754wmk.2
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=98fexlxRfpJSj9U19lhLMWUWSDv2sFnVZiQiLSht6fY=;
        b=H7F49G5f8biIN7m9kNPvw13VteoYYTzwuHM/jr4juTN33xd+GxcIQajn+V9zRimUei
         g/yK3hJAuuFmivSkCgUGLb78HS57NfV1LG/zRHfF8NNfrv0ROTbUiNP5fBA2V4nt7hjq
         wPu7tWi8mULSf894HkgCzmPyV9FhQp6VJn9bGkeRacpj3v8K73lcEXoLAqL/+eDTsG21
         Gu/6CwqWHBjh47N2h4O8AzS9n7ae+fSgQUbo56I/jkmW7heU6gkPqpVwYldd7i1Ga/Qn
         TBLxsbvMxg2aMbCvPA3L73kBFgUXye0vz4ZMLsJgRL5zTx7LXePNaI8dFWh89A2dtPku
         K/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=98fexlxRfpJSj9U19lhLMWUWSDv2sFnVZiQiLSht6fY=;
        b=3+pzwUmMSUpyec6Hi6F50z+h/FQF70QFcU2Icimlu917GSkrBjm0kDCjrhHI3T41e6
         hT24Jm+BKqzN7y9XaUYHcsHMea6+UM+pSQvwH+TlYcZOORg00Pmi760lP1efUfnIf8BG
         z+AghHTRCI0sH28+8OdG4nMuzSnAHk7sSuFAOIvLpcjv4LQa0IxV87ViqWhIqvothIfU
         vjMhM9woIlKpym3c+BVKYhYSzIHyi1m7cAla6DLTsPvwpVK9xBKPn/OsOnDk4l4mTUea
         IRTpIv8L9pK0cEPZWkjCRimLP0wF5g4aE59SVcQWSxaNE/bKa9GmOEW+e1PVbEnjspW+
         lUYg==
X-Gm-Message-State: ACrzQf12rZd6pPIsisCxs7cD3yXpeMyRcgo/u1ijT7e9XIoAOMXP7wUt
        isjChrv2Y3dZkRHFMXCALqk2Qq9RxY9FiYBu
X-Google-Smtp-Source: AMsMyM4QFaf5dWmGb5Ud32IwjaSNAT/2waCXsKrtFf43o1dx9CHYaPLyJ5Hk7I8Ys3Jvapq9CE5k9g==
X-Received: by 2002:a05:600c:6025:b0:3b4:8c0c:f3c9 with SMTP id az37-20020a05600c602500b003b48c0cf3c9mr7794232wmb.206.1663823253709;
        Wed, 21 Sep 2022 22:07:33 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003b47ff307e1sm4569595wmd.31.2022.09.21.22.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 22:07:33 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roland Stigge <stigge@antcom.de>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
Date:   Thu, 22 Sep 2022 07:07:17 +0200
Message-Id: <20220922050718.1079651-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220922050718.1079651-1-Naresh.Solanki@9elements.com>
References: <20220922050718.1079651-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marcello Sylvester Bauer <sylv@sylv.io>

Add Devicetree binding documentation for Maxim MAX6639 temperature
monitor with PWM fan-speed controller.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..c845fb989af2
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
+  - "fan@0"
+  - "fan@1"
+
+additionalProperties: false
+
+patternProperties:
+  "^fan@[0-1]$":
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
+      maxim,rpm-range:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [2000, 4000, 8000, 16000]
+        default: 4000
+        description:
+          Scales the tachometer counter by setting the maximum (full-scale) value
+          of the RPM range for max6639.
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
+        fan@0 {
+          reg = <0x0>;
+          pwm-polarity = <1>;
+          pulses-per-revolution = <2>;
+          maxim,rpm-range = <4000>;
+        };
+
+        fan@1 {
+          reg = <0x1>;
+          pwm-polarity = <1>;
+          pulses-per-revolution = <2>;
+          maxim,rpm-range = <4000>;
+        };
+      };
+    };
+...
-- 
2.35.3

