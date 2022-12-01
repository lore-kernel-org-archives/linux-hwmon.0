Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91BAC4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 04:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiLAErJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 23:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiLAErF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 23:47:05 -0500
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.152.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2B79950C
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 20:47:02 -0800 (PST)
Received: from atl1wswcm05.websitewelcome.com (unknown [50.6.129.166])
        by atl3wswob01.websitewelcome.com (Postfix) with ESMTP id 695D5313F2
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 04:47:02 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id 0bTPpfI8zP2h50bTRptCHG; Thu, 01 Dec 2022 04:47:02 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7lBuiEwdQJRdSXgGk7zBmlsJAsmAdgyU5GERb3tmT4g=; b=NIONRG06ekXPN/zDMgFJ7JuKgb
        tzVj5HFQWRcCP9a/p9R8SUF28RQ9UCXRiNzmkh6dQfDpjdct+Dp6TmqTOj/Iy7uHB/RezxuILF300
        JRb/TIoEgIySHUPoQVBv+qCCtk3oKWgGykzEnmp9qBw6AfvAIgnR4otp6kZBn9S8SturDuygxXH7z
        qU6XG/8iQ5+Fwsj2KFyoMumKAf2Hgiq6/ioal4QYcJ/tQKEbpli9xNhCqZFVjLmMFr0ynfKBs4sDS
        Yh2vQFSqqso2l7yWJ+2cx95Qwv1IS8KDMEvOvVs2mxIgjXgZJMOylcUU0kCn6twp3nrMhvuwp/kaw
        WKITwiZA==;
Received: from [223.187.112.123] (port=34121 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1p0bTO-003t5m-H7;
        Thu, 01 Dec 2022 04:46:58 +0000
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932 power-management IC
Date:   Thu,  1 Dec 2022 05:46:41 +0100
Message-Id: <20221201044643.1150870-3-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201044643.1150870-1-saravanan@linumiz.com>
References: <20221201044643.1150870-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 223.187.112.123
X-Source-L: No
X-Exim-ID: 1p0bTO-003t5m-H7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [223.187.112.123]:34121
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 24
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBDkftwjX3+aIHka534c9LbJGE9xalPbe5O5o9F/hVxzMJeKJ4uWvCPldHtR+PzS5l58q3msttyzNQBmLIQlVENUxC7KCahJi0y4LZKek1VbUTMCD8as
 uxAJujAJ4iySVPOl0WVaeEwhUbb8Rk0T/xi71SFs+LAog7rWOPqBWje7rbcq4UTnJVQOsJyRV0yv8C+qkBD+xyQldEvTflrmG5g=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document mpq7932 power-management IC

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 .../bindings/hwmon/pmbus/mps,mpq7932.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
new file mode 100644
index 000000000000..5f20c59eb7ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq7932.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power System MPQ7932 PMIC
+
+maintainers:
+  - Saravanan Sekar <saravanan@linumiz.com>
+
+properties:
+  compatible:
+    enum:
+      - mps,mpq7932
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts BUCK[1-6]
+
+      "^buck[1-6]$":
+        type: object
+        $ref: regulator.yaml#
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
+            compatible = "mps,mpq7932";
+            reg = <0x3>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <400000>;
+                    regulator-max-microvolt = <3587500>;
+                    regulator-min-microamp  = <460000>;
+                    regulator-max-microamp  = <7600000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
+...
-- 
2.34.1

