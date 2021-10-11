Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4F6C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 01:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E32360241
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 01:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbhJKBYT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Oct 2021 21:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbhJKBYS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Oct 2021 21:24:18 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D39C06161C
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Oct 2021 18:22:18 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id v14-20020a05620a0f0e00b0043355ed67d1so13010974qkl.7
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Oct 2021 18:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=pelpqGop9lNK0ivkhrG4qKsEmnDb1OiP8EZo1Fz2vqE=;
        b=hp7SXw7jtocsPJY2qeNaqGCipXyVGn6axSHZaPOQaTyZ26+Xroo5tcvNvJ7ZipX/Yt
         KPq611KjO+9iLfrdcLY6JcLHrUp6OvfmMM++nkzaq2SetrEWyL8r32lOj6YyfoSXeAbH
         Fr/wOlK1kFMfP+nB54KD7G754v1lmkJIa4WbRj1jcOX+5Le/RCNazkJpvS77BNWUyuAp
         byhfpwzYyKsuqgdhQs2OMnES6J0dn7WuOPOwBixVtdqwHf8P+aWu4c75nMC8xemVADCT
         UafLuSCaCfwwYweoMppmYC52PdvcA02o/q4ywMEVWJeRJHG/Pm2Dh8/L9AR2Nr5wLA0Y
         0hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=pelpqGop9lNK0ivkhrG4qKsEmnDb1OiP8EZo1Fz2vqE=;
        b=Ag02AOErgJh/t1955lAqt3DyV/2HGBcA/j2ze9CwT5EvAntZ+MIz5PH3qbo6Lhm2+N
         lh1Y+dOvPmDmh9DfDyhS1dyDAVnlZRa6n/PW2pRJq6fIWrLf7/ww4haLy3X3awuzSKI2
         xnXUwHjBJUc89lMJL7NwuIghdxqlEI2mAPuirebq2p+Y/yFbdhVvgGRhC6K1B2177qH/
         6T+yq/e646z939jr7C9QYV9HllLrxqUhvo2mzkm7hn4ac3JucRj5TD/kS9ztqOvcBAjD
         WpwiHkfNNnWmlVkY1uKaHysi7CGA5O+fNwA3N8T0Kz0B6Ouo284R1F29u2nzPcoTT3ol
         SYFA==
X-Gm-Message-State: AOAM532uAtr1mJdCde90aKiT0Ky4zhHGmtM29Tz9mAiBRa+7LfmcnU2D
        25SEluDPbMsxaqsL+9MWPcHyhCo=
X-Google-Smtp-Source: ABdhPJxakqS3R8xOFBlupR06TVZ/cUaN2aXRdEF/OW4Gfgmo0Ro10oYgMUoHGtdJNMM/YAHTF5V+zHg=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:8461:b843:7404:1394])
 (user=osk job=sendgmr) by 2002:ac8:7e86:: with SMTP id w6mr11757072qtj.277.1633915336530;
 Sun, 10 Oct 2021 18:22:16 -0700 (PDT)
Date:   Sun, 10 Oct 2021 21:22:11 -0400
Message-Id: <20211011012212.91357-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v7 1/2] dt-bindings: hwmon: Add nct7802 bindings
From:   Oskar Senft <osk@google.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This change documents the device tree bindings for the Nuvoton
NCT7802Y driver.

Signed-off-by: Oskar Senft <osk@google.com>
---
Changes from PATCH v6:
- Fixed formatting error reported by yamllint

Changes from PATCH v5:
- Refactored to use patternProperties.
- Added validation for sensor-type and temperature-mode.
---
 .../bindings/hwmon/nuvoton,nct7802.yaml       | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml
new file mode 100644
index 000000000000..a0a245938528
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7802.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT7802Y Hardware Monitoring IC
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The NCT7802Y is a hardware monitor IC which supports one on-die and up to
+  5 remote temperature sensors with SMBus interface.
+
+  Datasheets:
+    https://www.nuvoton.com/export/resource-files/Nuvoton_NCT7802Y_Datasheet_V12.pdf
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7802
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-3]$":
+    type: object
+    properties:
+      reg:
+        items:
+          - enum:
+              - 0    # Local Temperature Sensor ("LTD")
+              - 1    # Remote Temperature Sensor or Voltage Sensor 1 ("RTD1")
+              - 2    # Remote Temperature Sensor or Voltage Sensor 2 ("RTD2")
+              - 3    # Remote Temperature Sensor or Voltage Sensor 3 ("RTD3")
+      sensor-type:
+        items:
+          - enum:
+              - temperature
+              - voltage
+      temperature-mode:
+        items:
+          - enum:
+              - thermistor
+              - thermal-diode
+    required:
+      - reg
+    allOf:
+      # For channels RTD1, RTD2 and RTD3, require sensor-type to be set.
+      # Otherwise (for all other channels), do not allow temperature-mode to be
+      # set.
+      - if:
+          properties:
+            reg:
+              items:
+                - enum:
+                    - 1
+                    - 2
+                    - 3
+        then:
+          required:
+            - sensor-type
+        else:
+          not:
+            required:
+              - sensor-type
+
+      # For channels RTD1 and RTD2 and if sensor-type is "temperature", require
+      # temperature-mode to be set. Otherwise (for all other channels or
+      # sensor-type settings), do not allow temperature-mode to be set
+      - if:
+          properties:
+            reg:
+              items:
+                - enum:
+                    - 1
+                    - 2
+            sensor-type:
+              items:
+                - enum:
+                    - temperature
+        then:
+          required:
+            - temperature-mode
+        else:
+          not:
+            required:
+              - temperature-mode
+
+    additionalProperties: false
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
+        nct7802@28 {
+            compatible = "nuvoton,nct7802";
+            reg = <0x28>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 { /* LTD */
+              reg = <0>;
+              status = "okay";
+            };
+
+            channel@1 { /* RTD1 */
+              reg = <1>;
+              status = "okay";
+              sensor-type = "voltage";
+            };
+
+            channel@2 { /* RTD2 */
+              reg = <2>;
+              status = "okay";
+              sensor-type = "temperature";
+              temperature-mode = "thermal-diode";
+            };
+
+            channel@3 { /* RTD3 */
+              reg = <3>;
+              status = "okay";
+              sensor-type = "temperature";
+            };
+        };
+    };
-- 
2.33.0.882.g93a45727a2-goog

