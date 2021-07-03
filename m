Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96874C07E97
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Jul 2021 17:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 682E861934
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Jul 2021 17:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhGCRjg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Jul 2021 13:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhGCRjf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Jul 2021 13:39:35 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E11BC061762
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Jul 2021 10:37:01 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u20so18127519ljo.12
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Jul 2021 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/wv+TFcotobDhEtS8rWg6Z26WEl2LawwW76VsOFomQ=;
        b=CrCfL+Tbr58valehPb0t0SWI1DRhi7efBslrwr6Olb5ygLf+Jtp+IqeidGtMbifgM0
         c13ML5+QjnM0zLd+bUJ1rRf18BvuSPU1IW1DexuzpvZuvA03GeuTAcnuXs/ddfe4iciW
         NwH1MNDjNxxfaImktK6Hdfdyb2iwfZCaBiiBdFFrV27z9KsCO7bof8ikSRg3hp37V7S7
         wlGqRO9FGcT5Gg42sh4X+aZefybyX3BtUNcj+yxQPJSipz+T5wwZvuAuh+vsoQeRFag+
         8OYEkGZNJzniErt4XBeR5q/djdfHXzEzWJNvnuDRkof1MQVLQi2AByZWPe0KY6alpx4H
         8tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/wv+TFcotobDhEtS8rWg6Z26WEl2LawwW76VsOFomQ=;
        b=ldA8FX7571RAN1dNZz1Cy+kqlw1oH1XM99wCLvtQBuMbHJfZcY+eCGKwC04UfTbrQW
         zAPF8vehtjbxN4zFp7k1cjiwDk42yZKAiLU2x09Vt9DfM7PeHcsefWxh35znRzKfbm8o
         kYo4h7pwyEVfFINFdoBhJw/JZYMt7BUJDv3ODLTq2MCVZVSmfjCOGCYcnVKSdOKqneF4
         NRvnGACIOsU58uDw3uMqfVc5V5SGyfUp8Fi33tjjly6xPZLRuh+n0WOyfJqzqjND+Uis
         Tv9LdEZpbSj3xh4fMm18Y1aO39OcwcBFA0U2vXCEhp1/29U/YdMpXgOAHtrxpVRCGGG6
         ODAg==
X-Gm-Message-State: AOAM533aDkbpMgD0qXQoyF5jNpFSz7YSZlcLaJeqgmsUKuzOxq7OmNj9
        hPtjAzKxnc9f/bwLXgVfDxm14Q==
X-Google-Smtp-Source: ABdhPJxB+tC21k3LQrjWnktbbanGbW8sQM4BYgl54Pn01so877tG4Hh68tDwgzGAWVGn2qo7+oZFbA==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr4244839ljk.468.1625333819552;
        Sat, 03 Jul 2021 10:36:59 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p18sm751166ljj.56.2021.07.03.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 10:36:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Johannes Pointner <johannes.pointner@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: hwmon: Convert NTC thermistor to YAML
Date:   Sat,  3 Jul 2021 19:34:56 +0200
Message-Id: <20210703173456.4002549-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This converts the NTC thermistor DT bindings to YAML. Some care had to
be taken since I had to add some illustrations to make the connection
layouts graspable.

Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Johannes Pointner <johannes.pointner@gmail.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Realize I need to CC devicetree@vger.kernel.org on this.
- Fix Javier's mail address.
- Drop Naveen's mail (bouncing)
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

