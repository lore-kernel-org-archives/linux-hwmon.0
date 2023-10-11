Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AE6CDB467
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Oct 2023 16:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346979AbjJKQsZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346983AbjJKQsY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Oct 2023 12:48:24 -0400
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DC8A4
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Oct 2023 09:48:22 -0700 (PDT)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
        by cmsmtp with ESMTP
        id qcDKq0O42qBU3qcNhq6qkE; Wed, 11 Oct 2023 16:48:22 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id qcNfqUsNFdWrtqcNgq8qyG; Wed, 11 Oct 2023 16:48:21 +0000
X-Authority-Analysis: v=2.4 cv=UMbOoQTy c=1 sm=1 tr=0 ts=6526d1d5
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=J9R/PiKqv2o3jGxbVGXx4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=bhdUkHdE2iEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=gEfo2CItAAAA:8
 a=wef-vsbuwaLQw5HROOoA:9 a=rsP06fVo5MYu2ilr0aT5:22 a=sptkURWiP4Gy88Gu7hUp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=CWlWwmylNfiFwuKtCETiUX+lbNbpGAIN9nDK9/F9ujI=; b=jXju0ZusvnVDUFyOvP/QiAEnpv
        Of5FaGDJDaiq4vSuYUB7dUlprCJBs38Sa6bkTAxBTHtjkTHIOd1Ihvb+iVTvIbDxDVeBRn2vhb/Rz
        JxnzjM1LdGCTLmdH03Am5+kNBaiomCy2bgch/vx6Wboj3HMFsRSAb+sd9NuGwQu5sJ8rIRV69U21X
        9IOXFD3rCyf3ednR/rx34cbWw8+IOo7SS/wcOfn+OKY5MHff2FGNAfoqNrXEiZ5fp8jTjDH/fKF0O
        EbCPnm66SqSn5gUk9PORLOmecVstTM0o6LPzj/uYZTaZXjNjeAbm0pNt3S6wkFTP5pd67cy4ylVCN
        V2K6Ixtg==;
Received: from [103.186.120.251] (port=36530 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <saravanan@linumiz.com>)
        id 1qqcNb-002Xlh-2V;
        Wed, 11 Oct 2023 22:18:15 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v4 2/4] regulator: dt-bindings: Add mps,mpq2286 power-management IC
Date:   Wed, 11 Oct 2023 22:17:52 +0530
Message-Id: <20231011164754.449399-3-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011164754.449399-1-saravanan@linumiz.com>
References: <20231011164754.449399-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.186.120.251
X-Source-L: No
X-Exim-ID: 1qqcNb-002Xlh-2V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.186.120.251]:36530
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 23
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPdl3iiLCLPnt8A9uFc2NateC2gsZELQ7NA7tqK50gyFzlrwer1o43cbLOi8ofCeGBmktcDKgfFN47yusrUEx/gXuGq9Gc3Bul/cl55IWbviTf6D7nNT
 zEEwWw+c6E3Sm5lsXhWN+bdzonf3s2V0Iq01GvLlQWD2wM6sdYvVp6VCEG+/Eu3lv55zmtGmTM2ZedIWxvktVujCQNbC2ITu078=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document mpq2286 power-management IC.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
new file mode 100644
index 000000000000..1296f9b30862
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
+      buck:
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
+                    regulator-name = "buck";
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

