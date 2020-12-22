Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AD9C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 14:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E96AC2312E
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 14:31:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgLVObG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Dec 2020 09:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbgLVObF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Dec 2020 09:31:05 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F34FC0611CC
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Dec 2020 06:30:20 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id x16so18496042ejj.7
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Dec 2020 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mamze14+WiY2yuDsLyQBfAVHfVo7/eHBt2nEYPH4G8k=;
        b=P+tLYH814vFy8X3uaUxmmBuEZST3sh4KNwNPw5cq4yyLVZ24CC85n59ejW6iTCaiYy
         DAHXafVb8AK3v3JrYtp9SLr7f8LRQj4BFdPs657AEdq5kIF32i3XyDtcdUcjx9sTY2s1
         glzGUXEZE+OokTrCg518sECumfn6VrTfmItt8zWXPrt2FmNBGOZuJXnG1LweMp/tD7qx
         Ohvro7beW6cCP3+hv3oAGfJt1NxRl8soFq+8IonNseE3bReMCls26YmY2F8LU5finuf9
         VP9anXsQR6qJCDf1QkUG72LwAz4PegUQpowX5/gvoSceZYfGvGTH9khseG3k+2sQXE4X
         hxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mamze14+WiY2yuDsLyQBfAVHfVo7/eHBt2nEYPH4G8k=;
        b=hFtX5w6SxPwx3BWXE1ip7pMmNheSaTNrsAZ5LTGQ74cZeqVBcqVRDqn+fP1rPoibVC
         hwVlH95kd4G0tYm+4Ovh0kst1M2acE/qwBTfmQ1Ew6u7OTfqgMOK4USVXi01nn6xkgy4
         swRNGJYqNXeOuwAvArbRwBzwfogGnQjEV5hZkn8EKZLEKC5DpzP6MP8AXSUMne9S4XO7
         IeW9VdZNCU1L8uqQSidHC5yZygUo7Xp4R8XtTi0EmR3C1a0nORL0w+A19tXwhQRs/zs5
         zTn5Cg7Lz1cUZq0SnCVyP6d5/5NtYzjL6pCyshX+GlpRvCJgHJHFzt3gj9P7vZi1HT83
         1mYw==
X-Gm-Message-State: AOAM533ms7D5upHx2weECpopumXeuhlWM8d3sgSsVCl9yAF+ptbok2id
        4vCF69sTQHIBNtMMpdhkgufeDw==
X-Google-Smtp-Source: ABdhPJy1yQdgnSoNPEttYoUC5gC39TEY11L8aFkLEY4st3GwB0I7XW2JNrPkgay34R/PXDk+P2mHYg==
X-Received: by 2002:a17:906:350b:: with SMTP id r11mr20577385eja.143.1608647418876;
        Tue, 22 Dec 2020 06:30:18 -0800 (PST)
Received: from localhost.localdomain (dh207-99-167.xnet.hr. [88.207.99.167])
        by smtp.googlemail.com with ESMTPSA id z1sm8434896edm.89.2020.12.22.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:30:17 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v3 1/3] dt-bindings: hwmon: Add TI TPS23861 bindings
Date:   Tue, 22 Dec 2020 15:30:10 +0100
Message-Id: <20201222143012.1618807-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document bindings for the Texas Instruments TPS23861 driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 .../bindings/hwmon/ti,tps23861.yaml           | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
new file mode 100644
index 000000000000..a7a801f54398
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/ti,tps23861.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS23861 PoE PSE
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  The TPS23861 is a IEEE 802.3at Quad Port Power-over-Ethernet PSE Controller.
+
+  Datasheets:
+  https://www.ti.com/lit/gpn/tps23861
+
+
+properties:
+  compatible:
+    enum:
+      - ti,tps23861
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: |
+      The value of curent sense resistor in microohms.
+    items:
+      default: 255000
+      minimum: 250000
+      maximum: 255000
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
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tps23861@30 {
+              compatible = "ti,tps23861";
+              reg = <0x30>;
+              shunt-resistor-micro-ohms = <255000>;
+          };
+    };
-- 
2.29.2

