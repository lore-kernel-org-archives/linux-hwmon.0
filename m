Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB0CC07E95
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 23:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33ABE61410
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 23:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGBXth (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jul 2021 19:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhGBXtg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jul 2021 19:49:36 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8694C061762
        for <linux-hwmon@vger.kernel.org>; Fri,  2 Jul 2021 16:47:02 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q4so15516064ljp.13
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Jul 2021 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QaUQUW3FZVI6IicXvq3kQ7seQEU5FyLrNqSQSjuN7h0=;
        b=S4MlVXSFACHF/E/XFXXssEu/ZVEfVwQmN5CWJVc94/KMhFmBlKxT8Uk65FZ91plAHE
         PVLE0O6+41zMr3mKPguRc2kiR//dfoLioUGS86CdJiCy5xfLFu4LRmkP20pNaySlW+3z
         1e+J4QW1CIS2f9ZF4gk3xT1pXtZXSH5HBNt73KGJ22gQwwvY9ve7nHovtdo3Bs06DFjE
         1csAZj8nt3znxbgNYXEZRkVD84OqTahd+EUuLXf8QqUsrvH2ccN+HAhPhlLuG/OxgU4/
         Q3i1VGB41JbHceCqdbl1p3a36mWM9887gqtWsSrkDAO4pLRPEGtDygJh+eEDkHcAK5AF
         K3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QaUQUW3FZVI6IicXvq3kQ7seQEU5FyLrNqSQSjuN7h0=;
        b=XGHrIe2BFy7amUPYKuFMxtajCxeC6CkSf3RMqKNfnBCrXmA6r/n1SEGmsSTHD5QChj
         +Ji9m2Vi2LdSw2PNnTmUKq1cLVy0IBCTCO0yPYvvx4jtjI5YD12eFIrDQs+4mLKL8xyH
         6AJmgKbJ5UzNO1rlXxSObTp3hhOPPQlFQNH/MIPkjBT4whgdBeys3uE8N04p/jCbREgE
         clY8sdzp4fsTPKbOcj/3WzZxqfb98KyFtlrWXjTVMwtlOHalA35jxGsSYOGB55L1RioM
         et+MLEabQWoMwD6cJ4MhjEgNqesRA6jB/vFtJOpNO/Yo40uVKd/78tEPKXcjq7QM/6zV
         K3LA==
X-Gm-Message-State: AOAM531jozeHMARM3DzqYEqKv2nosG2wNvsuDHNfnaQAFWUfpH6l79vV
        8D7Fg2hH0Yvke/V/PJPWD7aBag==
X-Google-Smtp-Source: ABdhPJwbKMQ3QkQQU9elaw1fTvStjDwGqWAi7oX3UAHQ7yTu9CbFLdCejZke1uhumOpDjkbeYUD42A==
X-Received: by 2002:a2e:84cc:: with SMTP id q12mr1508188ljh.274.1625269621113;
        Fri, 02 Jul 2021 16:47:01 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id b23sm45758ljh.69.2021.07.02.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 16:47:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Naveen Krishna Chatradhi <ch.naveen@samsung.com>,
        Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
        Johannes Pointner <johannes.pointner@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH] dt-bindings: hwmon: Convert NTC thermistor to YAML
Date:   Sat,  3 Jul 2021 01:44:54 +0200
Message-Id: <20210702234454.3982216-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This converts the NTC thermistor DT bindings to YAML. Some care had to
be taken since I had to add some illustrations to make the connection
layouts graspable.

Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Johannes Pointner <johannes.pointner@gmail.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/hwmon/ntc-thermistor.yaml        | 142 ++++++++++++++++++
 .../bindings/hwmon/ntc_thermistor.txt         |  44 ------
 2 files changed, 142 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
new file mode 100644
index 000000000000..87589da631c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+---
+$id: http://devicetree.org/schemas/hwmon/ntc-thermistor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NTC thermistor temperature sensors
+
+maintainers:
+  - Naveen Krishna Chatradhi <ch.naveen@samsung.com>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  Thermistors with negative temperature coefficient (NTC) are resistors that
+  vary in resistance in an often non-linear way in relation to temperature.
+  The negative temperature coefficient means that the resistance decreases
+  as the temperature rises. Since the relationship between resistance and
+  temperature is non-linear, software drivers most often need to use a look
+  up table and interpolation to get from resistance to temperature.
+
+  When used in practice, a thermistor is often connected between ground, a
+  pull-up resistor or/and a pull-down resistor and a fixed voltage like this:
+
+      + e.g. 5V = pull-up voltage (puv)
+      |
+     +-+
+     | |
+     | | Pull-up resistor
+     | | (puo)
+     +-+
+      |-------------------------o
+     +-+ |                      ^
+     | |/                       |
+     | /                        |
+     |/| Thermistor             | Measured voltage (mv)
+     / |                        | "connected ground"
+    /| |                        |
+     +-+                        |
+      |-------------------------o
+     +-+                        ^
+     | |                        |
+     | | Pull-down resistor     | Measured voltage (mv)
+     | | (pdo)                  | "connected positive"
+     +-+                        |
+      |                         |
+      |                         v
+      + GND                     GND
+
+  The arrangements of where we measure the voltage over the thermistor are
+  called "connected ground" and "connected positive" and shall be understood as
+  the cases when either pull-up or pull-down resistance is zero.
+
+  If the pull-up resistance is 0 one end of the thermistor is connected to the
+  positive voltage and we get the thermistor on top of a pull-down resistor
+  and we take the measure between the thermistor and the pull-down resistor.
+
+  Conversely if the pull-down resistance is zero, one end of the thermistor is
+  connected to ground and we get the thermistor under the pull-up resistor
+  and we take the measure between the pull-up resistor and the thermistor.
+
+  We can use both pull-up and pull-down resistors at the same time, and then
+  the figure illustrates where the voltage will be measured for the "connected
+  ground" and "connected positive" cases.
+
+properties:
+  $nodename:
+    pattern: "^thermistor(.*)?$"
+
+  compatible:
+    oneOf:
+      - const: epcos,b57330v2103
+      - const: epcos,b57891s0103
+      - const: murata,ncp15wb473
+      - const: murata,ncp18wb473
+      - const: murata,ncp21wb473
+      - const: murata,ncp03wb473
+      - const: murata,ncp15wl333
+      - const: murata,ncp03wf104
+      - const: murata,ncp15xh103
+      # Deprecated "ntp," compatible strings
+      - const: ntc,ncp15wb473
+        deprecated: true
+      - const: ntc,ncp18wb473
+        deprecated: true
+      - const: ntc,ncp21wb473
+        deprecated: true
+      - const: ntc,ncp03wb473
+        deprecated: true
+      - const: ntc,ncp15wl333
+        deprecated: true
+
+  # See /schemas/thermal/thermal-sensor.yaml for details
+  "#thermal-sensor-cells":
+    description: Thermal sensor cells if used for thermal sensoring.
+    const: 0
+
+  pullup-uv:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Pull-up voltage in micro volts. Must always be specified.
+
+  pullup-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Pull-up resistance in ohms. Must always be specified, even
+      if zero.
+
+  pulldown-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Pull-down resistance in ohms. Must always be specified, even
+      if zero.
+
+  connected-positive:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Indicates how the thermistor is connected in series with
+      a pull-up and/or a pull-down resistor. See the description above for
+      an illustration. If this flag is NOT specified, the thermistor is assumed
+      to be connected-ground, which usually means a pull-down resistance of
+      zero but complex arrangements are possible.
+
+  # See /schemas/iio/adc/adc.yaml
+  io-channels:
+    maxItems: 1
+    description: IIO ADC channel to read the voltage over the resistor. Must
+      always be specified.
+
+required:
+  - compatible
+  - pullup-uv
+  - pullup-ohm
+  - pulldown-ohm
+  - io-channels
+
+additionalProperties: false
+
+examples:
+  - |
+    thermistor0 {
+      compatible = "murata,ncp18wb473";
+      io-channels = <&gpadc 0x06>;
+      pullup-uv = <1800000>;
+      pullup-ohm = <220000>;
+      pulldown-ohm = <0>;
+      #thermal-sensor-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
deleted file mode 100644
index 4c5c3712970e..000000000000
--- a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-NTC Thermistor hwmon sensors
--------------------------------
-
-Requires node properties:
-- "compatible" value : one of
-	"epcos,b57330v2103"
-	"epcos,b57891s0103"
-	"murata,ncp15wb473"
-	"murata,ncp18wb473"
-	"murata,ncp21wb473"
-	"murata,ncp03wb473"
-	"murata,ncp15wl333"
-	"murata,ncp03wf104"
-	"murata,ncp15xh103"
-
-/* Usage of vendor name "ntc" is deprecated */
-<DEPRECATED>	"ntc,ncp15wb473"
-<DEPRECATED>	"ntc,ncp18wb473"
-<DEPRECATED>	"ntc,ncp21wb473"
-<DEPRECATED>	"ntc,ncp03wb473"
-<DEPRECATED>	"ntc,ncp15wl333"
-
-- "pullup-uv"	Pull up voltage in micro volts
-- "pullup-ohm"	Pull up resistor value in ohms
-- "pulldown-ohm" Pull down resistor value in ohms
-- "connected-positive" Always ON, If not specified.
-		Status change is possible.
-- "io-channels"	Channel node of ADC to be used for
-		conversion.
-
-Optional node properties:
-- "#thermal-sensor-cells" Used to expose itself to thermal fw.
-
-Read more about iio bindings at
-	https://github.com/devicetree-org/dt-schema/blob/master/schemas/iio/
-
-Example:
-	ncp15wb473@0 {
-		compatible = "murata,ncp15wb473";
-		pullup-uv = <1800000>;
-		pullup-ohm = <47000>;
-		pulldown-ohm = <0>;
-		io-channels = <&adc 3>;
-	};
-- 
2.31.1

