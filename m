Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC71C25B6E
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 07:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbjJYHal (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 03:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbjJYHaf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 03:30:35 -0400
Received: from mail-oa1-x43.google.com (mail-oa1-x43.google.com [IPv6:2001:4860:4864:20::43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8094133
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 00:30:31 -0700 (PDT)
Received: by mail-oa1-x43.google.com with SMTP id 586e51a60fabf-1dc9c2b2b79so2860841fac.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698219031; x=1698823831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=piuEhlKzYYwzHRc+GXT0yNRApgseVG2f389HXHULRS8=;
        b=LA+jTOHq+kLLjNr464zLo2HwRw5vb4otiouv0sQA4wEvnIWgpsx0tiGFygpf8UXyQV
         wj7giVsG1/6mxCZQ/KQTN5d/+YM0osOfdo123SGZLrnZ+2IMLFoB6DTikO6/GVn2m5gp
         8TBrUBZ622PhbB9EMvXx2f+djJXyeY3ibT9qxVhLL+RCrrXjHt0EQokietgouIL4vtV8
         R9BhKZflbTEA2Zn0icdVZdpMfbQZUL50CYHX9/5no4by/VQodkzsoh1/oqsO+92Hp9FO
         jOo0Ncep1ayZvCEZPw8SZW0PUlYfBXcltEOzk8E9mYFCMBKEuI002o4p5IgjNM/qqh6r
         /QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219031; x=1698823831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piuEhlKzYYwzHRc+GXT0yNRApgseVG2f389HXHULRS8=;
        b=Ktmi09VKD3JNJDtt5PfsVdPWirXOUbvEUfLdb0KP2pEytKtkh2dLSyN42e39vbb9ya
         HiKK550oIEavPIM97Dk4e8HRv5O5s8OjtFA8rdgo1hrFHY5/9m246IuN4vd/jqQgaXOg
         WrRMAk0wGRgIc7OZbBMmtAj2vei4swQtpKZplM+AeM1GS49BtYm/Qxc9QTEW9S515NOp
         sxSHgAzPNTjq5W0comUcYAe+PMn2VrozI5jfQZ/SrFXgVmzAg2GDT+vrcBnoYZo37VtD
         /aF9FMYIrllNaNh4S8KK0OhaZv9i+0y45s8y7a+QzWkaf6d0ikowqUJWQ9rZFTpPQGL3
         ZSBQ==
X-Gm-Message-State: AOJu0YyFZyjtJDWnkZVsxNHWzL5afqlaGx1O2rezx5NQ93rcO1cTB74g
        eU7QenP/1NyOPN6ajUsFgbV7qFQlk73+t1fK
X-Google-Smtp-Source: AGHT+IEozn2zcAkwkjqQjp7DPHXdYWzI6mWiOqkUwQ99x2r+Vpnw2up7Wl1m9fpLOrysUl3e7bTckg==
X-Received: by 2002:a05:6870:c6a1:b0:1ea:3525:9e99 with SMTP id cv33-20020a056870c6a100b001ea35259e99mr16048128oab.44.1698219030855;
        Wed, 25 Oct 2023 00:30:30 -0700 (PDT)
Received: from dawn-Aspire-A715-74G.. ([183.198.109.198])
        by smtp.gmail.com with ESMTPSA id r19-20020a632053000000b005b18c53d73csm8173061pgm.16.2023.10.25.00.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:30:30 -0700 (PDT)
From:   Li peiyu <579lpy@gmail.com>
To:     jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, Li peiyu <579lpy@gmail.com>
Subject: [PATCH] dt-bindings: hwmon: lm87: Convert to dtschema
Date:   Wed, 25 Oct 2023 15:30:01 +0800
Message-Id: <20231025073001.8929-1-579lpy@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert the lm87 hwmon sensor bindings to DT schema

Signed-off-by: Li peiyu <579lpy@gmail.com>
---
 .../devicetree/bindings/hwmon/lm87.txt        | 30 ----------
 .../devicetree/bindings/hwmon/lm87.yaml       | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
deleted file mode 100644
index 758ff398b67b..000000000000
--- a/Documentation/devicetree/bindings/hwmon/lm87.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-*LM87 hwmon sensor.
-
-Required properties:
-- compatible: Should be
-	"ti,lm87"
-
-- reg: I2C address
-
-optional properties:
-- has-temp3: This configures pins 18 and 19 to be used as a second
-             remote temperature sensing channel. By default the pins
-             are configured as voltage input pins in0 and in5.
-
-- has-in6: When set, pin 5 is configured to be used as voltage input
-           in6. Otherwise the pin is set as FAN1 input.
-
-- has-in7: When set, pin 6 is configured to be used as voltage input
-           in7. Otherwise the pin is set as FAN2 input.
-
-- vcc-supply: a Phandle for the regulator supplying power, can be
-              configured to measure 5.0V power supply. Default is 3.3V.
-
-Example:
-
-lm87@2e {
-	compatible = "ti,lm87";
-	reg = <0x2e>;
-	has-temp3;
-	vcc-supply = <&reg_5v0>;
-};
diff --git a/Documentation/devicetree/bindings/hwmon/lm87.yaml b/Documentation/devicetree/bindings/hwmon/lm87.yaml
new file mode 100644
index 000000000000..54d6ef6700ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm87.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lm87.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LM87 hwmon sensor
+
+maintainers:
+  - Jean Delvare <jdelvare@suse.com>
+  - Guenter Roeck <linux@roeck-us.net>
+
+properties:
+  compatible:
+    const: ti,lm87
+
+  reg:
+    maxItems: 1
+
+  has-temp3:
+    description: |
+      This configures pins 18 and 19 to be used as a second remote
+      temperature sensing channel. By default the pins are configured
+      as voltage input pins in0 and in5.
+
+  has-in6:
+    description: |
+      When set, pin 5 is configured to be used as voltage input in6.
+      Otherwise the pin is set as FAN1 input.
+
+  has-in7:
+    description: |
+      When set, pin 6 is configured to be used as voltage input in7.
+      Otherwise the pin is set as FAN2 input.
+
+  vcc-supply:
+    description: |
+      a Phandle for the regulator supplying power, can be configured to
+      measure 5.0V power supply. Default is 3.3V.
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
+      lm87@2e {
+        compatible = "ti,lm87";
+        reg = <0x2e>;
+        has-temp3;
+	vcc-supply = <&reg_5v0>;
+      };
+    };
-- 
2.34.1

