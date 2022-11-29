Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFC0C4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 16:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbiK2QLv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 11:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbiK2QLr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 11:11:47 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EB156ED3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 08:11:44 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bx10so10802301wrb.0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvL3HW2HV2h6S+uZhbUuMx81NAIv7YRIQVk1rbQCvyQ=;
        b=W6dtGbUu2vRdZDspY4ddA1UdZcHbBBBXalQ1fdO9Unj9KFwUganl5wtfc7CsT0+utQ
         AUD9c29NI/qK0jFNawQL5zYwAZZUcAbrDtLyBqpHf06HIi0brzjWdMZqpskp/hOzCvVc
         A+SxDiycyQaFzf3I+5YO88+1+M1H09xyONLCzXOFJW2SsZkPZgIkdzNqDrkHkBH1NrNh
         AhTEl243+96pXqBx3RTWV+WwpZILEFsnUAc3nuify6LYpv7zDuhUuzua+c9bgVGqN0wC
         UObVzQSfb2NOsvx+yZ9aly9eqnf0APdt7GO30u9PwCGnAJIw0vQyXQQP49KvIlnHBvAp
         Irdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvL3HW2HV2h6S+uZhbUuMx81NAIv7YRIQVk1rbQCvyQ=;
        b=kmR7uN4+IwlWKNyZaWSDQHrLeLS2h7dITIDEps4Pf/8bwoP+zAAx3ZPUlZxlLtuLTq
         jsqU7CZ1cMpMXRfJzfM+GdqaRUD/oYvA+m+GBQDOH1sp+T/mFJIN24EKx2bB6sn6ElkP
         qAVdOZfOuVMvYjSEWSVcp1GtSPrROxGAtDmqP6A1J8WCaBFDDO4NFAOHt44Oqn/1ZWv1
         4WFpvTdHVg6uG+s3o2sMf5oHPmC6JT72qwXr7jDvLnaBnnHEh60xBwutAyQkRz9eCt5G
         WGIRhtK6ySgXl1kz32lTPha9vO4mvE8k4uHelX5Z0jGx4vsqgFnpRtq/jiWG55zgpIPu
         vfgw==
X-Gm-Message-State: ANoB5pnp5I8V8f774FgMUJ9p1kL4Xia7xKlSwrJWM2d1Fw8HudkF6T+b
        N181l/uZWaJ2woKg5lJJSqtO6g==
X-Google-Smtp-Source: AA0mqf58kiqlZ2V3oQAlTs/4txmkzemDP8pr3C+VoaiFcsx7pa3hYYt7gYLmMo8SeRAU6RUSRxcxJg==
X-Received: by 2002:a5d:55c3:0:b0:236:c12b:6e29 with SMTP id i3-20020a5d55c3000000b00236c12b6e29mr34693883wrw.98.1669738303344;
        Tue, 29 Nov 2022 08:11:43 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b003c6b70a4d69sm3144522wms.42.2022.11.29.08.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 08:11:43 -0800 (PST)
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
Subject: [PATCH v8 2/4] dt-bindings: hwmon: Add max6639
Date:   Tue, 29 Nov 2022 17:11:32 +0100
Message-Id: <20221129161134.2672474-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221129161134.2672474-1-Naresh.Solanki@9elements.com>
References: <20221129161134.2672474-1-Naresh.Solanki@9elements.com>
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
 .../bindings/hwmon/maxim,max6639.yaml         | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..78a09ce35986
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,92 @@
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
+  '#pwm-cells':
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^fan@[0-1]$":
+    type: object
+    description: |
+      Represents the two fans and their specific configuration.
+
+    $ref: fan-common.yaml#
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: |
+          The fan number.
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan1: fan-controller@10 {
+            compatible = "maxim,max6639";
+            reg = <0x10>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #pwm-cells = <3>;
+
+            fan@0 {
+                reg = <0x0>;
+                pulses-per-revolution = <2>;
+                max-rpm = <4000>;
+                target-rpm = <1000>;
+                pwms = <&fan1 0 25000 0>;
+            };
+
+            fan@1 {
+                reg = <0x1>;
+                pulses-per-revolution = <2>;
+                max-rpm = <8000>;
+                pwms = <&fan1 1 25000 0>;
+            };
+        };
+    };
+...
-- 
2.37.3

