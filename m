Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4059BC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 02:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F54A60EFE
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 02:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhJICqj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 22:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbhJICqi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 22:46:38 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98044C061755
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 19:44:42 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 124-20020a251182000000b005a027223ed9so15015635ybr.13
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 19:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=kf7CalnyuFZkYhPjNjgl2jKwF5f9iQ5T88AqkNZlBhM=;
        b=PTm8Q58rLoMMQBjtuBNjPDDyRkDz2pwkEBRM+hXj/cayiP5UTNTs/DsIOuJIo2pr8j
         PsjUfcJCGaN+KPa3X5ToNlcEeDmhzr7AeUXyExEJk04ekHtZdwZT6APVAPF3w0gh9n2Z
         sex9qKGWNiDd/SFyFj2sGHBi5pHboJNtPLejyQ2eoQSDzXM6HKNLAXbUzjnxepC5r1oQ
         x9E8haah2ZJ3S89pr2zoKZwBH7QYCKa+ijIZlH0MORFigm7FRb87pmDnTjgzzfqdzsg0
         vJD5rNcIBrHYsh4n5i8Lqn4FXV2yeYFg5HMC7pH9k3tiFBMlGXoL1aG58kKG8BVCD2WO
         BAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=kf7CalnyuFZkYhPjNjgl2jKwF5f9iQ5T88AqkNZlBhM=;
        b=zuqkqWLLLKlIJA/irkze+Dz2RBqbDlm8NXjcN/IQ7VX7U78B4ZpoWXRkVCKCq2ksk1
         a1lLcNiWWFNGLR5rROvnYQYCoEvGgnxtNAV0YF8L5QqLUru60wVMpnP7MxPTr1G/CUaG
         1fGeWsyBAcGmuo09wZ4WVN7L4pODoqHjlq2nvJGRMYCdaysRfDi/k2IR2HmhcyHvXfZq
         daRSEDLYG/HeNABYucMGoLLKRojwqnJ2Qx01r31+gxdW7N6IeuwXCuYPB/s2L72feBW0
         TSEsN3ydksdlYXsz1j7v4aCilFF0Sdi6dxySyIIxk5yNKnklXxbFb0xK3HiA4Ze3bbj1
         7kag==
X-Gm-Message-State: AOAM53277KDXJPRj6z+gg8bOKsOEKNytpbZxksOHn7umeiqsgw87v5k4
        Lq6zAOklE9XmlbOsXTR197Y7hgI=
X-Google-Smtp-Source: ABdhPJxv7IhrL6cbOin6c3Hmh1FGR0aqH74Axlx+fYYUsYtHZdQZNXf1WQiLRFezxS6n6yK1LPJB5yI=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:acb9:8fa6:8db4:ee39])
 (user=osk job=sendgmr) by 2002:a25:610e:: with SMTP id v14mr7909627ybb.90.1633747481732;
 Fri, 08 Oct 2021 19:44:41 -0700 (PDT)
Date:   Fri,  8 Oct 2021 22:44:29 -0400
Message-Id: <20211009024430.3322230-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add nct7802 bindings
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

Document bindings for the Nuvoton NCT7802Y driver.

Signed-off-by: Oskar Senft <osk@google.com>
---
 .../bindings/hwmon/nuvoton,nct7802.yaml       | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml
new file mode 100644
index 000000000000..a97b89d0d197
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml
@@ -0,0 +1,142 @@
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
+  input@0:
+    type: object
+    description: Local Temperature Sensor ("LTD")
+    properties:
+      reg:
+        const: 0
+    required:
+      - reg
+
+  input@1:
+    type: object
+    description: Remote Temperature Sensor or Voltage Sensor ("RTD1")
+    properties:
+      reg:
+        const: 1
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
+      - sensor-type
+
+  input@2:
+    type: object
+    description: Remote Temperature Sensor or Voltage Sensor ("RTD2")
+    properties:
+      reg:
+        const: 2
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
+      - sensor-type
+
+  input@3:
+    type: object
+    description: Remote Temperature Sensor or Voltage Sensor ("RTD3")
+    properties:
+      reg:
+        const: 3
+      sensor-type:
+        items:
+          - enum:
+              - temperature
+              - voltage
+    required:
+      - reg
+      - sensor-type
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
+            input@0 { /* LTD */
+              reg = <0>;
+              status = "okay";
+            };
+
+            input@1 { /* RTD1 */
+              reg = <1>;
+              status = "okay";
+              sensor-type = "temperature";
+              temperature-mode = "thermistor";
+            };
+
+            input@2 { /* RTD2 */
+              reg = <2>;
+              status = "okay";
+              sensor-type = "temperature";
+              temperature-mode = "thermal-diode";
+            };
+
+            input@3 { /* RTD3 */
+              reg = <3>;
+              status = "okay";
+              sensor-type = "voltage";
+            };
+        };
+    };
-- 
2.33.0.882.g93a45727a2-goog

