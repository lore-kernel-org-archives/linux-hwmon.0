Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D56C4167B
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Nov 2022 17:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiKZRlA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Nov 2022 12:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKZRk7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Nov 2022 12:40:59 -0500
X-Greylist: delayed 1400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Nov 2022 09:40:58 PST
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.52.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291FD1A057
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 09:40:58 -0800 (PST)
Received: from atl1wswcm01.websitewelcome.com (unknown [50.6.129.162])
        by atl1wswob01.websitewelcome.com (Postfix) with ESMTP id C65564012C2F1
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 17:17:37 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id yyo2oBIdsR3ddyyo4oIS4Z; Sat, 26 Nov 2022 17:17:37 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7SaDT1boH6f615WyBNlcdyyVHsSLvKEmm92+NVE4l8c=; b=diD9BwAu7g/78hAv9MBug7zUgv
        zm+PxH8c4XabJG+oDVeN0ROGpODzqW8m2QH7Qv0VT/PmME7iKHEy5ZoC+2/5hUg6Q/r8Xg7DF1s3h
        R43NNWZf5Hka8wRwudPFKYhSwqgjbGT87G0Wibn6TmJ0guzMYotRfvQFh9ZgdY8XdF9W5WJsvaMBm
        yN11IC4Bra01stvEPNDTZOG1zCHD4boT8fTewARNJ+uwagVM+z6OPs+010XLWDg20SrT24LD0g+Bi
        /LUQV3Mj3GBQ/aIgNO9iiOxdjL9OpCnEUXwD2bNPwEzeeBe+0UWKVqmS2am6SrFwPqIB0WzF76EJE
        RyZVzjcQ==;
Received: from [106.203.5.91] (port=35801 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1oyyo1-001nHp-IT;
        Sat, 26 Nov 2022 17:17:33 +0000
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v1 1/3] dt-bindings: hwmon/pmbus: Add mps,mpq7932 power-management IC
Date:   Sat, 26 Nov 2022 18:17:09 +0100
Message-Id: <20221126171711.1078309-1-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 106.203.5.91
X-Source-L: No
X-Exim-ID: 1oyyo1-001nHp-IT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [106.203.5.91]:35801
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 1
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLKqxpXyBGcnpqCbi2OR6ZPKBtl3WQ5AY8RrDYo6JJl20/Gzp88vxVAC3OpVEVTK6MBy6VwuwTEHtaYhJlAxHX6/8NFsfNb1rqlma3Kyr81qaiRKYJRU
 IkYuMdCIi39nx67BSqzgxW/mK7c2bD8q8WHC5KvudrePuAoh0TfxX0qFCLNMgPJ9wF0r+OaxsV1fZEsqKhq2BxpMmTow2iB2PMs=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add bindings for mps,mpq7932 power-management IC

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 .../bindings/hwmon/pmbus/mps,mpq7932.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
new file mode 100644
index 000000000000..6ec072c287a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mps,mpq7932.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power System MPQ7932 PMIC
+
+maintainers:
+  - Saravanan Sekar <saravanan@linumiz.com>
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]{1,2}"
+  compatible:
+    enum:
+      - mps,mpq7932
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    $ref: regulator.yaml#
+
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts BUCK[1-6]
+
+      "^buck[1-6]$":
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
+        pmic@69 {
+          compatible = "mps,mpq7932";
+          reg = <0x69>;
+
+          regulators {
+
+            buck1 {
+             regulator-name = "buck1";
+             regulator-min-microvolt = <400000>;
+             regulator-max-microvolt = <3587500>;
+             regulator-min-microamp  = <460000>;
+             regulator-max-microamp  = <7600000>;
+             regulator-boot-on;
+            };
+
+         };
+       };
+     };
+...
-- 
2.34.1

