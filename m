Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C04C4361B
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Dec 2020 13:04:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE78623A62
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Dec 2020 13:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgLRNES (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Dec 2020 08:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbgLRNES (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Dec 2020 08:04:18 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54A0C06138C
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Dec 2020 05:03:37 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id w5so2033104wrm.11
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Dec 2020 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mamze14+WiY2yuDsLyQBfAVHfVo7/eHBt2nEYPH4G8k=;
        b=k8lkPDdhkDhENNYgO5090SOzikz77aDzpntDip4B3Z6GAzZJOxtZ7Fqrq3Sx4G+aaV
         ji0cNXH3p/vrGJ+CkpXSoFJca9UqIm+ahdMzsVxN07vmq+ot/uRTz4/ZUhjqllSiWibP
         XqifJwNTDfTMUwb9L+240NfsnHbuJIUae7SU4ryce+B3EU2SyYtEZvQC+MwU/LgENOu5
         guHqiw2hzDXVP3/iE3nUoJoTMgS26emMggiswocsFORMN9eleVRrNsG/uoC++ZU2ZtD8
         tso+z6qaS7SPgDqi+IoLRwiKeJ3iGMh2Jtoq0QoiaSzVUoMV7GNV7TJF4pMMQ/MmIm2+
         Mjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mamze14+WiY2yuDsLyQBfAVHfVo7/eHBt2nEYPH4G8k=;
        b=B79k/tfqnXmFamZ41yewwVuzDcw3Kz5bmlJ0r1dk1yYziknNADrFhSD3Iu0nvHQNSd
         q3XomIzxealOxnCBkUixYkpyaEbly7vZsl2nmUD7+C7rMq+2yFDyMzoe/erEOjhcnURp
         L8o98ri1eromGvMsPd8GdDpKVyChY/yGLtkyecvkKx+WF94vCT3EhXFcKK8OjdA18syA
         EtxIkfVui3+y7fc3kSE3yse0T3yXMRvdroaO+IzLAvbKjhRt8GlQ/LFR48+foBGtoQcp
         E7s9yOnLAukTVVqW1z73yJys3UOcfAbEPmHwmQN2tSBy6aPGCRu6T2ow2fg2Ms+tOFwB
         jj8A==
X-Gm-Message-State: AOAM533Nb75k6YYpNCpXnt/motUFFP4abDZ+xMZ3/Ir1OdhvnecsQ9de
        wMB0EyeTDrsDXePaLnAakrTPrQ==
X-Google-Smtp-Source: ABdhPJztJTmvV0PhrMPz8lOnD4A76EI8Q6kCR5QfL5usiNGwhNfgb7RWnpSX1LV1wDUFf9BQTMa5Uw==
X-Received: by 2002:a05:6000:18c:: with SMTP id p12mr4372877wrx.7.1608296616208;
        Fri, 18 Dec 2020 05:03:36 -0800 (PST)
Received: from localhost.localdomain (dh207-99-82.xnet.hr. [88.207.99.82])
        by smtp.googlemail.com with ESMTPSA id l1sm13945720wrq.64.2020.12.18.05.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 05:03:35 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 1/3] dt-bindings: hwmon: Add TI TPS23861 bindings
Date:   Fri, 18 Dec 2020 14:03:27 +0100
Message-Id: <20201218130329.258254-1-robert.marko@sartura.hr>
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

