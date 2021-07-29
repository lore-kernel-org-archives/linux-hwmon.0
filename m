Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1074BC4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 23:07:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D596069E
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 23:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbhG2XHx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jul 2021 19:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhG2XHw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jul 2021 19:07:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF317C061765
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jul 2021 16:07:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g13so13912568lfj.12
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jul 2021 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQDtu9kQfe9kDnqIYwpik/tMr0BFysHyyoJucVn6soA=;
        b=F2W6dM1Wy2BhI+j5+zrvn6gYFq7PnDxD5ehbRZi4Wn6RfgCr15Qk33IUMOCyUnRZbx
         Q4rkHe+PSPIx81aCsq9d1gBGasjek/bdN+g3Vp0yvBtmqXs2MxbX4ujwu33KFdfh6nIE
         VMxvjzAlda8aCnn6CtTMQdP59xO+Pn4em+jEb5Iamcp6yyO1PLsJKIulD9IMXLBEcSm/
         ATFP5EqkIfwGn5e0brOZ+rXBOID4dObibG+ok2ZasfYQVkrG77nhwQ815Z+kkCcK4ndU
         oLv3EDIp2WMYG42SpDglF1raWpzlLudYdOg0K1s2o4FtVXLmiDdXkwpGaFRpcfhBpxou
         CgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQDtu9kQfe9kDnqIYwpik/tMr0BFysHyyoJucVn6soA=;
        b=qpH6DfopVN6u8dJUT8ITBgAGQKS9FGrIaNyjq0pHFI9WZ73DJ6BQzIr0cYuHffM7pd
         0ebBdTMA8N28+Y2LX5AxLMXkZa+1Mv6dFniqOIVc8i59UTDrU5WYO5IsDjlxqhLyo3Ok
         +HbO7R3xS3IJJKATCkngRIzal6Eo4p2Pz1KIKtiwj64az0S/UL9jZ1nMxQuxT/XKxUSs
         cpRhc8dZrtVnM+vYXHmM6HUHdExdJSZXvqvtT+Yj1wziYImBe189M93Swgqs2YMj/OOO
         NnwIbcwlTe1YmjEe5AtmfUU13TDhV9Q/aVh0XStJoQxclgdai5TkJOe0bK+h6o1QXn6L
         TsCA==
X-Gm-Message-State: AOAM532wL6C5S5YUyDcgdezncR15omvB1d6jWO/T0DS9UjdoGdXLQ4xt
        77AoRlweVDiQUseKpTnSMaEHzA==
X-Google-Smtp-Source: ABdhPJwJwlEpwMuCS/yANWblqURrF3vek0SyO0gnTYztydUttuyYkeGtIlv9CNyt0M9rM/jC7UceTQ==
X-Received: by 2002:a05:6512:3d0f:: with SMTP id d15mr5550574lfv.246.1627600066954;
        Thu, 29 Jul 2021 16:07:46 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id l21sm248815ljc.94.2021.07.29.16.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:07:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: Add bindings for Winbond W83781D
Date:   Fri, 30 Jul 2021 01:05:42 +0200
Message-Id: <20210729230543.2853485-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds a device tree binding for the Winbond W83781D and its
sibling HW monitoring ICs. This is used in for example the Freecom
FSG-3 router/NAS.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/hwmon/winbond,w83781d.yaml       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/winbond,w83781d.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/winbond,w83781d.yaml b/Documentation/devicetree/bindings/hwmon/winbond,w83781d.yaml
new file mode 100644
index 000000000000..31ce77a4b087
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/winbond,w83781d.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/winbond,w83781d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Winbond W83781 and compatible hardware monitor IC
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - winbond,w83781d
+      - winbond,w83781g
+      - winbond,w83782d
+      - winbond,w83783s
+      - asus,as99127f
+
+  reg:
+    maxItems: 1
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
+        temperature-sensor@28 {
+            compatible = "winbond,w83781d";
+            reg = <0x28>;
+        };
+    };
-- 
2.31.1

