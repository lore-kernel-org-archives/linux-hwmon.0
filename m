Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAB7C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56F161183
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhIUKaw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 06:30:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:42872
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231975AbhIUKaq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 06:30:46 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1FBA73F32A
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632220158;
        bh=T3tR462VfAp1i1pzt2P4d077ekPtmSrX+PhUDbMpO4c=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vd5lVmZnuloKToXNtCtM63iUdXSdZzHYwxo33zdR/tU/hLWErx6Uwf6GzRP33z77y
         jykPcKSTerUWiu6/6wSG2CUAMhRUgcuhojirEDU4Ljqt5cJUZjFuDDqb0e32t6TXEP
         W2Fsw7pKv4kRzehv2iyONWDo7+l2hZQ6rbqUTEJf3OqBx6pk3uOMJUsFz/stFFFgj1
         Doi/uA6JNOBJblR32BCF7U2EwX3vIQ1RhKY+TzWe+cO0WmNcsewYIhzr1qMgLeq08r
         DP37u9fMs0eSezSrV8xjKe08tqMheubbi6/y6mrDk042hBZvVi919BfHG+c8XxxM3s
         NI/1rq1WD9T/g==
Received: by mail-wr1-f72.google.com with SMTP id s14-20020adff80e000000b001601b124f50so1598748wrp.5
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 03:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T3tR462VfAp1i1pzt2P4d077ekPtmSrX+PhUDbMpO4c=;
        b=hHTJkDrV2TlO69GkCRMn7PJWxA5PFhnV2OYqqv0jmZ1+aWG4+X5BJraJLyXFTSdMhe
         dJqvbDZ80AaUmYtztYbKgEt0Nab4nhqnN+6hD6CSBGqZTaWve0OgI1xeR6hGAGcyW6cd
         V7lP7wJ47zfs/2yGg05h5MhttQw8EZKmj/DQvhVGE00XGEZJgmythqUav4RNsy97a6Rj
         l3iR9SVM6t+/+FXPWCagzha2B14qq3jnik9IoUDEWO0okRFOTVe/Xeng4i8dM+2wyPXt
         jOOwTGW8Ld8Ern9SybEADH9+SyrKMnQCzsrIIyA1ovhtSenaux7RMgxMo4ZgrOnvSI2T
         3DMA==
X-Gm-Message-State: AOAM530kWUfIH/WQyAp0a8WwcLR+luvxZ3qzZ7HgahqRj/FSxRmgYHKK
        SjCli9B2t7vpQvMswvHAon94K7RWN1ZR3FN6ukpJz1/EFHXmCTjbWJ1mdFm6hFIJgaVdNrU5bqg
        NO+yNhQmJUclGuptdp5iYVHNeVimO1XD6s1bkZ+Cs
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr33443272wrn.251.1632220157836;
        Tue, 21 Sep 2021 03:29:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnJvWL9Bi/X/lBFdqN24wBSMEKxNp9lhhc6jvJf/1Y8+u79SSxor7b8LphncTkeSWQrO5H5Q==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr33443250wrn.251.1632220157648;
        Tue, 21 Sep 2021 03:29:17 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id m29sm20072380wrb.89.2021.09.21.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 03:29:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] dt-bindings: hwmon: sensirion,sht15: convert to dtschema
Date:   Tue, 21 Sep 2021 12:28:32 +0200
Message-Id: <20210921102832.143352-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
References: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert the Sensirion SHT15 humidity sensor to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/hwmon/sensirion,sht15.yaml       | 43 +++++++++++++++++++
 .../devicetree/bindings/hwmon/sht15.txt       | 19 --------
 2 files changed, 43 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/sht15.txt

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml
new file mode 100644
index 000000000000..4669217d01e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht15.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SHT15 humidity and temperature sensor
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    const: sensirion,sht15
+
+  clk-gpios:
+    maxItems: 1
+
+  data-gpios:
+    maxItems: 1
+
+  vcc-supply:
+    description: regulator that drives the VCC pin
+
+required:
+  - compatible
+  - clk-gpios
+  - data-gpios
+  - vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    sensor {
+        compatible = "sensirion,sht15";
+        clk-gpios = <&gpio4 12 0>;
+        data-gpios = <&gpio4 13 0>;
+        vcc-supply = <&reg_sht15>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_sensor>;
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/sht15.txt b/Documentation/devicetree/bindings/hwmon/sht15.txt
deleted file mode 100644
index 6a80277cc426..000000000000
--- a/Documentation/devicetree/bindings/hwmon/sht15.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Sensirion SHT15 Humidity and Temperature Sensor
-
-Required properties:
-
- - "compatible": must be "sensirion,sht15".
- - "data-gpios": GPIO connected to the data line.
- - "clk-gpios": GPIO connected to the clock line.
- - "vcc-supply": regulator that drives the VCC pin.
-
-Example:
-
-	sensor {
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sensor>;
-		compatible = "sensirion,sht15";
-		clk-gpios = <&gpio4 12 0>;
-		data-gpios = <&gpio4 13 0>;
-		vcc-supply = <&reg_sht15>;
-	};
-- 
2.30.2

