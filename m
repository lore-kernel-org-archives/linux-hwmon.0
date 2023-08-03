Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7C9C04A6A
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Aug 2023 14:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235880AbjHCOof (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Aug 2023 10:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235916AbjHCOoZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Aug 2023 10:44:25 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B37D4236
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Aug 2023 07:44:07 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98377c5d53eso145894066b.0
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Aug 2023 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1691073845; x=1691678645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJQoP+OlQsep7JicKgaIdwHZRhxScdcgkq1/BfxKseY=;
        b=QaXj4huY5XwJDj5dgKYPotJmlo6vd/UT1VwxEm6+zSboBzFWXaftbcixNgcNP/0Bhe
         jcJr4LgYdkNdTdy4P4pXBCUtbiBDxwzDWSLY4wb2rC8rdCTqrNXcvwnrrlpb3QIgCdGK
         FZlyfOwdf9XbCsqjr17Fqdppk3LAXTphgv3h498VIF5cD2Kt5YRa01zYumasyM9q+2cX
         eJfcPAOVACXJD7Upx/stiZmeKaLx04qF8vMCSo5Q5NxjvI6JP+TMY3fBSkc8brHQ7hKI
         WiX9O6K9UXzARZsILMIATPYro5c9VSsXLQ4gjIJf4gX8G9XiJ0knPECRhz5i9uDKEwKG
         uawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691073845; x=1691678645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJQoP+OlQsep7JicKgaIdwHZRhxScdcgkq1/BfxKseY=;
        b=YHo96xslCxnvu7A6lRrVr64Tx8GZwPylVi7AEwzzSwKNH3uxC9Of+/pes0OZqSa8G0
         kYsq4ojtmc+m2sPtmHnUrqYoaIty2bQ91Ge9SMm39+CdCYiUMoG8iHa53rYZvnLQWm9q
         gtdejwbndPYy83d+3b3YVdFmLBkGH8C5Cmn/hQR83i5iWzhKoxJQlPKG4MwMDPuxZgc2
         Iyz0tYMHfhzJkdqqIUNT01u2zp0YPXMHA3Q4IAQpLdJLrNOBuZA4AQpuuOhjiJPebksl
         iorP5dLii9uFUy9w23aDXpEYKJr4JEy0ypHMHKfNoEUnyt/k3cO7LbYuWY6oHYMsQwaL
         pZ/w==
X-Gm-Message-State: ABy/qLbsAxbJbBobTPNo/gWa+624m1305nne3TyG/gx3EwMqG/VGZ55o
        INqOG/zUK1UztiUaWRHj4hkm/A==
X-Google-Smtp-Source: APBJJlHA72M4h9rUEVgI/0cQsSvxZ4JN4xSFaGyCja+X/exWwEliU7yU+RAtXwl+xIWyYpBBAKrQ7Q==
X-Received: by 2002:a17:906:77d6:b0:992:b3a3:81f4 with SMTP id m22-20020a17090677d600b00992b3a381f4mr8361117ejn.50.1691073845548;
        Thu, 03 Aug 2023 07:44:05 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709064f1a00b0099bd86f9248sm10629859eju.63.2023.08.03.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:44:05 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        krzysztof.kozlowski+dt@linaro.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add MAX6639
Date:   Thu,  3 Aug 2023 16:43:59 +0200
Message-ID: <20230803144401.1151065-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marcello Sylvester Bauer <sylv@sylv.io>

Add binding documentation for Maxim MAX6639 fan-speed controller.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V3:
- Update title
- Add pulses-per-revolution, supplies & interrupts
Changes in V2:
- Update subject
- Drop blank lines
---
 .../bindings/hwmon/maxim,max6639.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..b3292061ca58
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX6639 Fan Controller
+
+maintainers:
+  - Naresh Solanki <Naresh.Solanki@9elements.com>
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
+  fan-supply:
+    description: Phandle to the regulator that provides power to the fan.
+
+  interrupts:
+    maxItems: 1
+
+  pulses-per-revolution:
+    description:
+      Define the number of pulses per fan revolution for each tachometer
+      input as an integer.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4]
+    default: 2
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      fan-controller@10 {
+        compatible = "maxim,max6639";
+        reg = <0x10>;
+      };
+    };
+...

base-commit: cb7022b8976e3c4d12cea2e7bb820a2944e2fd7b
-- 
2.41.0

