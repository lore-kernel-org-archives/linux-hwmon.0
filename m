Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C40C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Jul 2022 16:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbiGGQNs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Jul 2022 12:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235965AbiGGQNZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Jul 2022 12:13:25 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8063286EB
        for <linux-hwmon@vger.kernel.org>; Thu,  7 Jul 2022 09:12:58 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id r21so4481369eju.0
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Jul 2022 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98fexlxRfpJSj9U19lhLMWUWSDv2sFnVZiQiLSht6fY=;
        b=TAootPgDkyEr7NCRpxq3ydRzDBYgijLlKNbm0zTDgxD8VuR0Pv9UdGhLC+1WbOZrku
         Lj5kKKjrQ6YF4PHEbo31I8NWSsfhscm9lzFU4EGzrfOkjd5t3A6wyl8fZidIPsZ/atIy
         pDntcsUouv0bp7cG43Xs6HXB7SogJQbLbS2G6oI2IHxDPe0ipFe2DhtPFT5WvTVaGnNP
         dE9OpRtM1WbBwmPxZUOU8INyiqxYAlaGmG3zQ4oGscWwjHIActdXLExnqey8BZ8c+vTo
         Xi4ZSSv7Bf73c+QEpoIVGhkgB0m4lRazSHxmPAgaM4mZo+1eJuZilEbbe7m/TVW3iQf6
         fzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98fexlxRfpJSj9U19lhLMWUWSDv2sFnVZiQiLSht6fY=;
        b=Kl/BwKSYDYYFBqA17pYgKG5r557DsDliVftkYYGtPLYSdppMeB5Wb3wg8rCYRzIETf
         szC8WRXGHwVh5u/YX7+DP4y9iIpQsKgA0I3oONJs1Rq/GzwE9K21pPb9jnXnjaW6y+wQ
         4z5cBjwdr9r5w/FeOx+V5f6VnxivpWaeW3zs/90YYKBpVWzRlOMnTfAXWiFpFxjhbJg1
         ZrY8AtWEoFY4+Ri2Aq+mtV5NvlEcVT5hHOZN6c1sODxxV+egTxveiZ6Z6F1ae4/T6faq
         W0oWKF5sAYfKdGKeU/elK3ZpMzhK6FpLhC2AG8Vb1rY3rASycYseIvwms13QUZjgu4KF
         6sMA==
X-Gm-Message-State: AJIora+rD1l/5g88qNpr32pswgc10prlzEvFb9akGCKsb+BtZdF4bcJL
        5B5aQ34iFLp5fh6Q1M5NBarlyyk1OPsmSRWH
X-Google-Smtp-Source: AGRyM1vUB021g5/wGwGboZMxEkPwLEF4rRA6ugLvy5Lp8qa1INgpT/GJBPtjpfD+dKjzv3BxWJX4Vg==
X-Received: by 2002:a17:907:72d5:b0:722:def3:9160 with SMTP id du21-20020a17090772d500b00722def39160mr46046293ejc.164.1657210376827;
        Thu, 07 Jul 2022 09:12:56 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id ia10-20020a170907a06a00b0070b7875aa6asm18916727ejc.166.2022.07.07.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:12:56 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Roland Stigge <stigge@antcom.de>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
Date:   Thu,  7 Jul 2022 18:12:43 +0200
Message-Id: <20220707161245.1229280-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.35.3
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

