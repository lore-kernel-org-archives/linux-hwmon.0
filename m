Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E53EC3526C
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 19:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1406023602
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 19:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLSTM2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Dec 2020 14:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgLSTM2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Dec 2020 14:12:28 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0F0C061282
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 11:11:30 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id g20so8057780ejb.1
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 11:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mamze14+WiY2yuDsLyQBfAVHfVo7/eHBt2nEYPH4G8k=;
        b=2Ahdghb0OOvc1AqacmhlZBLWLqD8XbcxTImTHzL3iGXit5Q5jdN2lr/NQRBPmblvrQ
         7fGTjX2033LazIAbVuSFRfW9Vi5cfDE/QblO4lazXWeL39yG8tXfJ1V+0gKz360Ef5Tq
         RZQ5AU03CwlM4am2j/tAkJI1k5d8FhXlVE/lJ6Xr3L2i/UTny6vl1S9RPd3a0bz47gyM
         aI3/gckBmlxQW78tldjw0CBMVsl63WfLzQagKVS8pWAF6xNj2Th2z8eVBeZc+4Xkmc+v
         DKPfp2dBkD9hZR/nCwn1wyhK9SaMdy8Rzs/RAwRsDoFmg9+sqZuTdYrUKUuQtrRiWYyz
         DXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mamze14+WiY2yuDsLyQBfAVHfVo7/eHBt2nEYPH4G8k=;
        b=WPA9HS7mKvNOffLipmf1T62VuF11ui74Uqx1giX1YIiUEyJHWfUvJsFg1EUQTtAw4m
         73k3lb/Wzv2NviFYk3asAzrVH5jdHw35VDKooaj/dnfVgwWuu2fDmVTb6J4nouf2MhOq
         kptOweidftk/NMkScpvQKfuTPUv2IEhYqzw6Q/u9XqHfBhzu+Lbq9LI7ZmPuSF0rpUYE
         aYw8OtbVNuQRQMJfH0vi8XW4WfbwJcIhlajBjfxo6Y7qxrtZmjWtC2ct2FkTIRvmuiIw
         rk9SVL7QMlezhK4lCjEJKYiqFQFMkeCkFlGLP8K65Yk+aJ6TWLExqvNX/vBgPvydmccu
         npkQ==
X-Gm-Message-State: AOAM532Jsf0WvCdpAp7OHNdoTcctNfnF+oMsS2p4tZC26mQu943OkMT9
        InULDychB8L9l4qBjb1LuMGDgQ==
X-Google-Smtp-Source: ABdhPJz0qcm/+VzJYfGAJjU4D061HpbYham777R+yNcnQXOckELp4b8/ZW997jyMygKDmQPk4/qEWA==
X-Received: by 2002:a17:906:2707:: with SMTP id z7mr9574360ejc.418.1608405088829;
        Sat, 19 Dec 2020 11:11:28 -0800 (PST)
Received: from localhost.localdomain ([88.207.4.44])
        by smtp.googlemail.com with ESMTPSA id o10sm7081955eju.89.2020.12.19.11.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 11:11:28 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 1/3] dt-bindings: hwmon: Add TI TPS23861 bindings
Date:   Sat, 19 Dec 2020 20:11:19 +0100
Message-Id: <20201219191121.85142-1-robert.marko@sartura.hr>
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

