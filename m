Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5591BC43217
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235932AbiEYHhU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbiEYHhT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:19 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466505E143
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:17 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:15 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 2/7] dt-bindings: hwmon: Allow specifying channels for lm90
Date:   Wed, 25 May 2022 09:36:52 +0200
Message-Id: <20220525073657.573327-3-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464236;
        bh=rEM5QmxdVxr970vyVi7zmu0TXbpADeblybnFq/v1NqI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=BMqjlDK3hSIJpsi1AWbk6CKeyT6VyRz3T32UJbJrHVFPxgYoJDkWkw+aEk/OX5I1N
         CbTGSTaUo/mQ/G9x0sVO3O+ttZ8Ulo89lF5RrtBZl0ikd4sPg6qsX3NYoMD0yO3gOP
         Rmu1AsdB2kHGk46/APowCf0UgUzprSzgDOCY3RUk=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Add binding description for temperature channels. Currently, support for
label and temperature-offset-millicelsius is implemented.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 .../bindings/hwmon/national,lm90.yaml         | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 82fce96498c7..e1719839faf0 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -51,6 +51,12 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
   vcc-supply:
     description: phandle to the regulator that provides the +VCC supply
 
@@ -62,6 +68,29 @@ required:
   - compatible
   - reg
 
+patternProperties:
+  "^channel@([0-2])$":
+    type: object
+    description: Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: The channel number. 0 is local channel, 1-2 are remote channels.
+        items:
+          minimum: 0
+          maximum: 2
+
+      label:
+        description: A descriptive name for this channel, like "ambient" or "psu".
+
+      temperature-offset-millicelsius:
+        description: Temperature offset to be added to or subtracted from remote temperature measurements.
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 allOf:
   - if:
       not:
@@ -78,6 +107,77 @@ allOf:
       properties:
         ti,extended-range-enable: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dallas,max6646
+              - dallas,max6647
+              - dallas,max6649
+              - dallas,max6657
+              - dallas,max6658
+              - dallas,max6659
+              - dallas,max6695
+              - dallas,max6696
+    then:
+      patternProperties:
+        "^channel@([0-2])$":
+          properties:
+            temperature-offset-millicelsius: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adt7461
+              - adi,adt7461a
+              - adi,adt7481
+              - onnn,nct1008
+    then:
+      patternProperties:
+        "^channel@([0-2])$":
+          properties:
+            temperature-offset-millicelsius:
+              maximum: 127750
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adm1032
+              - dallas,max6680
+              - dallas,max6681
+              - gmt,g781
+              - national,lm86
+              - national,lm89
+              - national,lm90
+              - national,lm99
+              - nxp,sa56004
+              - winbond,w83l771
+    then:
+      patternProperties:
+        "^channel@([0-2])$":
+          properties:
+            temperature-offset-millicelsius:
+              maximum: 127875
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tmp451
+              - ti,tmp461
+    then:
+      patternProperties:
+        "^channel@([0-2])$":
+          properties:
+            temperature-offset-millicelsius:
+              maximum: 127937
+
 additionalProperties: false
 
 examples:
@@ -96,3 +196,32 @@ examples:
             #thermal-sensor-cells = <1>;
         };
     };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4c {
+        compatible = "adi,adt7481";
+        reg = <0x4c>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0x0>;
+          label = "local";
+        };
+
+        channel@1 {
+          reg = <0x1>;
+          label = "front";
+          temperature-offset-millicelsius = <4000>;
+        };
+
+        channel@2 {
+          reg = <0x2>;
+          label = "back";
+          temperature-offset-millicelsius = <750>;
+        };
+      };
+    };
-- 
2.36.1

