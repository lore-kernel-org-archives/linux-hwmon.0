Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA5BC43217
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Mar 2022 01:09:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbiCIBJ4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiCIBJP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Mar 2022 20:09:15 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C17DEA33;
        Tue,  8 Mar 2022 16:50:59 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net [174.21.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 07AC5663;
        Tue,  8 Mar 2022 16:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1646787059;
        bh=P/LG0Tv6Dj5QsLIhvJT27ETgaDgbX6kVZ8POr9JaRLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OHX3gNLwI0PRnH1RY2/8wXabqkQmOnsL7QRiWRAfrjvCemhP9HZhXgpk3FT1SNP9R
         lWS0MRG1euHUfRSTybFLYTJsbGp4nCE5l1xeTxBSI4hhyCuiz2RHIBFxORpQuAqB58
         QT/4u7Xv0HQSQVOmp6E2XG8hyTalNb2mbROHuypw=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v2 1/6] dt-bindings: hwmon: Add nuvoton,nct6775
Date:   Tue,  8 Mar 2022 16:50:42 -0800
Message-Id: <20220309005047.5107-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309005047.5107-1-zev@bewilderbeest.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These Super I/O chips have an i2c interface that some systems expose
to a BMC; the BMC's device tree can now describe that via this
binding.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/hwmon/nuvoton,nct6775.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
new file mode 100644
index 000000000000..7b1054db46b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct6775.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT6775 and compatible Super I/O chips
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct6106
+      - nuvoton,nct6116
+      - nuvoton,nct6775
+      - nuvoton,nct6776
+      - nuvoton,nct6779
+      - nuvoton,nct6791
+      - nuvoton,nct6792
+      - nuvoton,nct6793
+      - nuvoton,nct6795
+      - nuvoton,nct6796
+      - nuvoton,nct6797
+      - nuvoton,nct6798
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
+        superio@4d {
+            compatible = "nuvoton,nct6779";
+            reg = <0x4d>;
+        };
+    };
-- 
2.35.1

