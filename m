Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D41FC678D6
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Jan 2023 13:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjARNIn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjARNHw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Jan 2023 08:07:52 -0500
Received: from mail.zeus06.de (www.zeus06.de [194.117.254.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0727312F1A
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jan 2023 04:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
        :cc:subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=k1; bh=/Hy8GmU7MXxxvHms8V+2Q3QgxQh
        /U7kSfIgodh33XnQ=; b=HNLGoi1gTOpz2Nm2zdDmX5KhIFQ3JrGfAgyy/icyQoL
        IKwycbHiNKLAaHrdQ4qS1M1+XoJxBTQmBfPZ1p3iDBlJFtxBB4krhj0r4HuY47wq
        9fAANuygDaXqi0DH5FF9BoHdF5BpgUGo+tb6uZ/Z0ySZdpFHZkds9P1PAOPT2lbA
        =
Received: (qmail 1506420 invoked from network); 18 Jan 2023 13:30:25 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2023 13:30:25 +0100
X-UD-Smtp-Session: l3s6476p2@YDrZ+ojyrffCtAHJ
From:   Mario Kicherer <dev@kicherer.org>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Mario Kicherer <dev@kicherer.org>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: add nxp,mc34vr500
Date:   Wed, 18 Jan 2023 13:30:17 +0100
Message-Id: <20230118123019.3041303-2-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118123019.3041303-1-dev@kicherer.org>
References: <20230118123019.3041303-1-dev@kicherer.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add dt-bindings for the NXP MC34VR500 PMIC.

Signed-off-by: Mario Kicherer <dev@kicherer.org>
---
 .../bindings/hwmon/nxp,mc34vr500.yaml         | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml b/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
new file mode 100644
index 000000000000..306f67315835
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/nxp,mc34vr500.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC34VR500 hwmon sensor
+
+maintainers:
+  - Mario Kicherer <dev@kicherer.org>
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc34vr500
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@8 {
+        compatible = "nxp,mc34vr500";
+        reg = <0x08>;
+      };
+    };
-- 
2.34.1

