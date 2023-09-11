Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1413EEB58C
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 03:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbjIKDmP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Sep 2023 23:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbjIKDmN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Sep 2023 23:42:13 -0400
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF221A2
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Sep 2023 20:42:09 -0700 (PDT)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
        by cmsmtp with ESMTP
        id f6Phq7s7qez0CfXo3qPVc3; Mon, 11 Sep 2023 03:41:47 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id fXoMqutCMdD9dfXoNqqkQL; Mon, 11 Sep 2023 03:42:08 +0000
X-Authority-Analysis: v=2.4 cv=KvVeZEaN c=1 sm=1 tr=0 ts=64fe8c90
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=gEfo2CItAAAA:8
 a=Qu2vfR6uo-DFy1VMMD0A:9 a=rsP06fVo5MYu2ilr0aT5:22 a=sptkURWiP4Gy88Gu7hUp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ONfcRMHlflM5fg/tO0JI/F3V8Ui2rPyIZ8LgaZndhQw=; b=T/T+Ksm0DXFI8u9ncojmrPXs00
        4RjU+chBP1J7ll/PcATLLhT6SGyCaR2GpVmCOn/2U0jsQcpnWGvrAFKuNnjX4HGu22GC4e6fH5oaS
        MSue3NxCDbML7VDaW9FEdQ391ZdqVMGsj5bbj4BjfrdWdc4tMDjtMxHZrskIYKVe0p+kql+WSs88G
        eQrNdHGti2D5kuzXkdKL6jcDGBpvP4EfCozWUlpFTBkHHzAnFCeAT1216AbM8hAj1S81OPeVrh6Yv
        Ce9miCYJb6iXFVGjgNThQG/nVdE+vWuMLaYcwB4BEFkohCtGSjjEmbBoyJE5nsms3J4glmaxKxylt
        QupS177Q==;
Received: from [103.163.95.214] (port=46382 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qfXoI-002lKM-1y;
        Mon, 11 Sep 2023 09:12:02 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH 2/3] dt-bindings: regulator: Add mps,mpq2286 power-management IC
Date:   Mon, 11 Sep 2023 09:11:49 +0530
Message-Id: <20230911034150.181880-3-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911034150.181880-1-saravanan@linumiz.com>
References: <20230911034150.181880-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.163.95.214
X-Source-L: No
X-Exim-ID: 1qfXoI-002lKM-1y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.163.95.214]:46382
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 23
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL4cr36tzG/GGpFxgS3OsP6AZ3cLRBrtaGp4A02xEdO8yAc74i+Hy1x9/dSvnoUVcuaxc5S/Marm/PTAE8F/I9rYxozNSjD5hbDIDCaGtVq59jyGWwJT
 48EhtgcuVyojq2vQd7lm1ceWaht96vCV4EjGugzZdx1dWDkODXS+eMn5PF0YOfXLxKjqn8Vzt0ih/JG4Q6G97obGVoG3IycQBxA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document mpq2286 power-management IC

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
new file mode 100644
index 000000000000..d00d887870a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mps,mpq2286.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power System MPQ2286 PMIC
+
+maintainers:
+  - Saravanan Sekar <saravanan@linumiz.com>
+
+properties:
+  compatible:
+    enum:
+      - mps,mpq2286
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    properties:
+      "buck0":
+        type: object
+        $ref: regulator.yaml#
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@3 {
+            compatible = "mps,mpq2286";
+            reg = <0x3>;
+
+            regulators {
+                buck {
+                    regulator-name = "buck0";
+                    regulator-min-microvolt = <1600000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
+...
-- 
2.34.1

