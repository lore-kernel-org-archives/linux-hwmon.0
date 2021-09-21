Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA313C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD84861100
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhIUKan (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 06:30:43 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38526
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231858AbhIUKal (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 06:30:41 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D63113FE01
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632220152;
        bh=kkbd1KDb/nWZxhh/ldmlBfFp4mqYT4gxg/2gkTeLxNM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=PMT63a9+wUj8Ked82vumhOIP8SXCE2PuQur5KgHRFab7DbRgg11SsczmvHYVnzGxU
         jZS/nCWhYtHkBLfGbH0+HBOQCIlQon3Sm2ussmqN5ZDV2xKXiYcBqaIgkMOozXHojf
         Hdc8kjeCWVciWkju4YG1llymsSIK5JjllLqvFx3b8u1wcCbVYQeYXUnYb5AsGFNgF7
         hKFF3twn+GyEf4mBruYBp24aNTx2uuqIf03zwHzw8XQRNfhQpzzAIAl4KSCvynTaRz
         JSAhFA5BSfT0hZt3DLpZcix5muLbIw52dEd8YywZ4XhHrvsUAi9NDWhRBDQqPwFSS4
         EYZFkfODfDXfw==
Received: by mail-wr1-f71.google.com with SMTP id l9-20020adfc789000000b00160111fd4e8so3179466wrg.17
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 03:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkbd1KDb/nWZxhh/ldmlBfFp4mqYT4gxg/2gkTeLxNM=;
        b=KUm9BGgfE8HU9qzMIphctGu8sO3dOuzMtEImfbsqZZchLWNy6UBXdqWyrzXafq8quH
         OHD5b6uJ2u2qX1jjoIczCt6O41k0GR8qRO9IsFRB96/CikO12v2PEt2IpoFIpXiSrjAC
         ctrcKG06o2sRmU5VfeRl3RKAZtRVCmzaQozMpQ37Yuk7D8p91k9C7bEPi5QW8RXpQqVY
         CkOxqwHZjquo/QFNAwN6F9HIVrpjU693Nvp2CCwDTgPVY1FJgsEiOzKEMm1eDeJb79u+
         XGdGmzrQCfddSUGrCjGJhbtNAp8Z08nyK6ntV7Zw6nj2mXuqEw25ao7a9NL7HVRZNVaJ
         vBPA==
X-Gm-Message-State: AOAM531vj8q64bOVS3HDWRTn6PwaJdlMfzZq/4YR3ETAhqeOzJrUwJiG
        ZMtNAdDrPl8n3/t8oJ/qqpt2FRLTXJ2qbipay/X1h0qcNWZ2PtYshDnTVmPCuK2snxh+4g7v/b+
        fAJaLMWoWvuDQ6gfy2ysayB3ABcFaSVJqo4OXNnkb
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr33587487wrw.330.1632220152605;
        Tue, 21 Sep 2021 03:29:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynCvd3iC/PeHFEd5pjxqSIDrSlRmcR2Me65OCSTR5w4e17865m6RoWwEe2gXcDFUzI51ZGtQ==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr33587469wrw.330.1632220152423;
        Tue, 21 Sep 2021 03:29:12 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id m29sm20072380wrb.89.2021.09.21.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 03:29:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: hwmon: ti,tmp102: add bindings and remove from trivial devices
Date:   Tue, 21 Sep 2021 12:28:28 +0200
Message-Id: <20210921102832.143352-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
References: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The TI TMP102 temperature sensor does not fit into trivial devices
bindings due to additional properties.  Add separate bindings for it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/hwmon/ti,tmp102.yaml  | 47 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
new file mode 100644
index 000000000000..d3eff4fac107
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,tmp102.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMP102 temperature sensor
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tmp102
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "ti,tmp102";
+            reg = <0x48>;
+            interrupt-parent = <&gpio7>;
+            interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index c9333fb81fdf..6ad0628741cf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -317,8 +317,6 @@ properties:
             # I2C Touch-Screen Controller
           - ti,tsc2003
             # Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
-          - ti,tmp102
-            # Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
           - ti,tmp103
             # Thermometer with SPI interface
           - ti,tmp121
-- 
2.30.2

