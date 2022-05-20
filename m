Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6426C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiETJyQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347970AbiETJyP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:15 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E435F14AF5B
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:12 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:46 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for lm90
Date:   Fri, 20 May 2022 11:32:39 +0200
Message-Id: <20220520093243.2523749-4-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040307;
        bh=EGkm4dZ2OZYas/b+5k8K/CiGIywj9eMvu3WdswLRnrg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=tFnKkwf9i3AB9eytyYRwt0W06vX7VQn2Z7IlTPN9997l5nxUc94p7JoDelgl0mVuh
         XBfNjmXoHJ5XkiyettrGRXK1zsi3GAhDnpTWDnGUcr+Nb3RZsgzVAjtF5oZLqIEqXv
         DoqANY9xwoJGYIYLiXvCHjrmW4E/MbfM3B4jEj1Y=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Add binding description for temperature channels. Currently, support for
label and offset is implemented.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 .../bindings/hwmon/national,lm90.yaml         | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 066c02541fcf..9a5aa78d4db1 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -62,6 +62,37 @@ required:
 
 additionalProperties: false
 
+patternProperties:
+  "^channel@([0-2])$":
+    type: object
+    description: |
+      Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: |
+          The channel number. 0 is local channel, 1-2 are remote channels.
+        items:
+          minimum: 0
+          maximum: 2
+
+      label:
+        description: |
+          A descriptive name for this channel, like "ambient" or "psu".
+
+      offset:
+        description: |
+          The value (millidegree Celsius) to be programmed in the channel specific offset register
+          (if supported by device).
+          For remote channels only.
+        $ref: /schemas/types.yaml#/definitions/int32
+        default: 0
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -76,5 +107,13 @@ examples:
             vcc-supply = <&palmas_ldo6_reg>;
             interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
             #thermal-sensor-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0x0>;
+                label = "internal";
+                offset = <1000>;
+            };
         };
     };
-- 
2.36.1

