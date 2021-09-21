Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05697C43217
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4D476109E
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhIUKas (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 06:30:48 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:42824
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231947AbhIUKap (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 06:30:45 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CC0DE40267
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632220156;
        bh=JOXzjGlmPlXzv176OGMdy7msusTrGyBdhYwvlOul8IE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=l9iRyvWO+BUUUD5R5mk6lBtILzHNoDOaMLy0nonDWlzyFk6sSjdej2bgp63F2M6Bw
         UiK0YP33PvdSrDwd/TgDnLd5RWhzWYY67UgMVORqt6txHb8pUDdTuVhnvGwGs9UOY0
         +BXRUshVtNa+NC/kCjVVwQWlJS5o6nc5B1Y4801jqnLx4TNJRrJINdBDQ7lYo4Q3Xw
         5bPq/mVyOmT+qhF/ZOgrUA9ZcsCU4Eg6Wig1ERzeFbX8VUpZh452DMh4m2aexuveWK
         /Jb1umdZVqQqHpCIxhZwCw6vxfA/VWYvw9KUnvPfo7x0fn0LJP/y1/pSSz7MbNXYDM
         cvrBdVv6w/IAA==
Received: by mail-wr1-f70.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso8433065wrn.4
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 03:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOXzjGlmPlXzv176OGMdy7msusTrGyBdhYwvlOul8IE=;
        b=PtNp6SQ1fU/6KWgOCcYdtRpxxnXnySxB9px8gfDmPJm8225hdJk3er6kWJdQtq1Df4
         CIh0VLKdMYMa8os71b8cYGh0emM9srhSut2IYtTkZIKwagN/9B08BF+Foj/3G/c7uzXt
         gwJ00RZ8QO4qcfmIPe0qFB2E2J6Vyq+nZOabeydzvFPMnWd1kYgQjCbEkAQHx9Neh7zL
         ViI4Yu4gnLIrX0CZ1hu5kmGggG1tlqsKQRO7tmgTNFiv8FbuZILytj+inxf4UphI88AJ
         DqbnoJxe1ij6omw/N/rbJKXFDhu3n4zFfYDzLcj9NzL5OFm4wQDWsyOnJjM/qACgVVM5
         LL/g==
X-Gm-Message-State: AOAM533XMgPk5IOISLWsE+mKrgFKZ3P3p/7Ohel9VhFU0Ay7z3eDHXpE
        QObYI48LlJXuMWaJQWRCz9Lwzu7hzxYFpjLNgTR6w7pS3BxalXbB7/p7BFqTN0HsZvnVPMs6m0H
        CvJ6l3Avsw7x6PCJOMz3XjwyDMRH3qR1i2EwTrD/f
X-Received: by 2002:adf:d216:: with SMTP id j22mr34546931wrh.295.1632220156547;
        Tue, 21 Sep 2021 03:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKogt/K6fEvl4nqJryVGtR+Bgt5oZ44S6BpR4v8fZ6A8tSIu6NyHYuSz70bv4PYE6GoKy/oQ==
X-Received: by 2002:adf:d216:: with SMTP id j22mr34546915wrh.295.1632220156416;
        Tue, 21 Sep 2021 03:29:16 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id m29sm20072380wrb.89.2021.09.21.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 03:29:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: hwmon: microchip,mcp3021: convert to dtschema
Date:   Tue, 21 Sep 2021 12:28:31 +0200
Message-Id: <20210921102832.143352-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
References: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert the Microchip MCP3021 ADC bindings to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/hwmon/mcp3021.txt     | 21 ---------
 .../bindings/hwmon/microchip,mcp3021.yaml     | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/mcp3021.txt b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
deleted file mode 100644
index 294318ba6914..000000000000
--- a/Documentation/devicetree/bindings/hwmon/mcp3021.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-mcp3021 properties
-
-Required properties:
-- compatible: Must be one of the following:
-	- "microchip,mcp3021" for mcp3021
-	- "microchip,mcp3221" for mcp3221
-- reg: I2C address
-
-Optional properties:
-
-- reference-voltage-microvolt
-	Reference voltage in microvolt (uV)
-
-Example:
-
-mcp3021@4d {
-	compatible = "microchip,mcp3021";
-	reg = <0x4d>;
-
-	reference-voltage-microvolt = <4500000>; /* 4.5 V */
-};
diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml
new file mode 100644
index 000000000000..c42051f8a191
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,mcp3021.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP3021 A/D converter
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mcp3021
+      - microchip,mcp3221
+
+  reg:
+    maxItems: 1
+
+  reference-voltage-microvolt:
+    description:
+      VDD supply power and reference voltage
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
+        adc@4d {
+            compatible = "microchip,mcp3021";
+            reg = <0x4d>;
+
+            reference-voltage-microvolt = <4500000>; /* 4.5 V */
+        };
+    };
-- 
2.30.2

