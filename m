Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD44EB64DD
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Aug 2023 08:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjHKIci (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Aug 2023 04:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjHKIch (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 04:32:37 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE4B2728
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 01:32:37 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe5695b180so14883495e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691742755; x=1692347555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4h0dqoBDh+43z9f7Y6u21biVjgdfDsXNnYwGUjHByA=;
        b=Lbgjx5NoKmUYwxFnvhURaoHGACQxO3xTElXaKHLlAcwZd7rtdLfHnyqNT4GhhWAiw8
         3RdZ/54DjMIoCefFpwYu8SIR+zMiKdrh77l6ArPeauqYntTtFGwEiWxjhsapVCk9oIs9
         xBR9PIlTcf49oV1SPYeJI/y5+jSM0OMQjnde0S4Y6Lbaz9hlaVryc9uHXTOf9AMT628x
         BnQHDEdQF7wuFAIlVNs6Z8gqpNf1KLP5gr68Pqcl8kNIxd7aB1QSEYxFC0YDxKQOsstz
         7r04i8gHrwKCxGiMtWeKeQsbqMLhdbRyBrUMPPtYR6BOHaI9Vr3ENyBcwju6NPQ2De1/
         Z30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691742755; x=1692347555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4h0dqoBDh+43z9f7Y6u21biVjgdfDsXNnYwGUjHByA=;
        b=ApxlOzXj6YXJd8GygRELVrXcTjcmo6Chjf58xjAz/ftEFiliVsh/5bj1n7qoVGBSp8
         uG2oIA7sdQHlNXmSxPqTSjv7uWD1/Txzb4Ib35ECx1uKyXGE2bDdafykuHhBy8Uy6yPA
         AMUkk4u8vs76v7Qx82IY9dYSQwXrKgupgnwJx9bebFwwDy/coAIt9k2ZWtKy7Yk1Z3rV
         IpbEqZFisSuKxowDbXeNra5Fa2MgPtFmLWwEDpcxJM3HMTe/8TaFtK63vA356NylhgO4
         U5raiyUzNWwRKVvYrdA6lFZEa2OLn+9u5vn4uepwudp8FMUHtDUKe6KuxFlGlmSWwbjR
         Dq9A==
X-Gm-Message-State: AOJu0YwxJs7Mdk6bnskx3eF2BOxJvNsnt3N0uy7nbnJQ2LqFdvYw5y8F
        PIzlPoqKz5ZwBO43r20joiXWwu+FaDU4Cw==
X-Google-Smtp-Source: AGHT+IHkD+pTPHSIiYB/3FVQusL4088JlvWgOcIQ3QIcd9x9Dxab4KGlGHgFHOyill5eKOuByC2EVw==
X-Received: by 2002:a05:600c:218f:b0:3fc:e7d:ca57 with SMTP id e15-20020a05600c218f00b003fc0e7dca57mr1115410wme.2.1691742755103;
        Fri, 11 Aug 2023 01:32:35 -0700 (PDT)
Received: from aura15.fritz.box ([2a0a:a547:9f55:0:8ea8:a136:a31f:7266])
        by smtp.gmail.com with ESMTPSA id y24-20020a05600c365800b003fe2b081661sm7306983wmq.30.2023.08.11.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 01:32:34 -0700 (PDT)
From:   Lothar Felten <lothar.felten@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux@roeck-us.net, jdelvare@suse.com,
        Lothar Felten <lothar.felten@gmail.com>
Subject: [PATCH v1 2/2] dt-bindings: hwmon: add adi,ltc4271
Date:   Fri, 11 Aug 2023 10:32:22 +0200
Message-Id: <20230811083222.15978-2-lothar.felten@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811083222.15978-1-lothar.felten@gmail.com>
References: <20230811083222.15978-1-lothar.felten@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add dt-bindings for Analog Devices LTC4271 PoE PSE.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 .../bindings/hwmon/adi,ltc4271.example.dts    | 28 ++++++++++
 .../bindings/hwmon/adi,ltc4271.yaml           | 51 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
new file mode 100644
index 000000000..829f7c5a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/; // silence any missing phandle references
+
+/{
+	compatible = "foo";
+model = "foo";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	example-0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		i2c {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ltc4271@20 {
+				compatible = "adi,ltc4271";
+				reg = <0x20>;
+				shunt-resistor-micro-ohms = <250000>;
+			};
+		};
+
+	};
+};
+
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
new file mode 100644
index 000000000..696e91a8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/adi,ltc4271.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC4271 PoE PSE
+
+maintainers:
+  - Lothar Felten <lothar.felten@gmail.com>
+
+description: |
+  The LTC4271 is a IEEE 802.3at Quad Port Power-over-Ethernet PSE Controller.
+
+  Datasheets:
+  https://www.analog.com/en/products/ltc4271.html
+
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4271
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: The value of current sense resistor in microohms.
+    default: 250000
+    minimum: 250000
+    maximum: 500000
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
+        ltc4271@20 {
+            compatible = "adi,ltc4271";
+            reg = <0x20>;
+            shunt-resistor-micro-ohms = <250000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 789742390..483956f76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,7 @@ LTC4271 ANALOG DEVICES PoE PSE DRIVER
 M:	Lothar Felten <lothar.felten@gmail.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
 F:	Documentation/hwmon/ltc4271.rst
 F:	drivers/hwmon/ltc4271.c
 
-- 
2.39.2

