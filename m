Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A398C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 13:03:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C3061059
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 13:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbhIJNFG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 09:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhIJNFF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 09:05:05 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03D9C061757
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 06:03:54 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 63-20020a250d42000000b0059dc43162c9so2204012ybn.23
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=IeHMnwyPlntJ+9Kovc0kz68pxDiDtqq0mND+q+dKmuM=;
        b=sKgWvVagldMOdNDEECLqCwWve1jCCoinf+jkuI0uSKKaw87CwABTpCgJMa08G1sBog
         GSoQo7X+ohCUaprKgAFsuGvCHDI96KQu7rxQcNvWNqFrGSXJKZe7lJyWFxmL6vmF4+64
         Hj4ktl/1e/DfaF2imiRHWX5M7iZuzOKLTyJDZAG5AwI0AVsBTu1PTYGlNE7kwevibGMq
         uBhjxsfdfI7EIkYa/iBLYNO5qtn9/7maIqwssW3QGjfs5uuTt4C564oVC8elXz+IgtxR
         UUfxt/ZTl8ta6/TeBn6DX3X2C4yUoM/O4mtrgL7T6gO74ZZ9qrlX8E56fENOEZwAFPcs
         baKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=IeHMnwyPlntJ+9Kovc0kz68pxDiDtqq0mND+q+dKmuM=;
        b=sanTInakzIl1KUWUD61ODhC49BqyLWifsuukWHXRAmMfqwg+lRCm8N3Wgc04hnXHA1
         3L2hZ7g6FBCkytrTd7N/BTjpQndMH/aZTSZ6bkVgTAQxGIXje6+yT5bsSeYUXECRpDKr
         /N01riJhSZksEfXJY8zJF8JC1lLw1CoekM762OrWddL045YtBrvULMWVR/H5qmdJ4Ftx
         6TKOJ/ACYBUfi8SZWx0yDI1RrMByjlKHhSgd/EdtVmX4FEc59uUsOM19jn///uPh3v23
         5BUZX02M7FOF9TuEoSISqgjPWDSFj4xvhVV81e8ZvGCFG7bwDsVd1ybmtZ/i5e6fW7cQ
         k1bA==
X-Gm-Message-State: AOAM531uc8fR85i1DFU7x83FQDENtherXIpDv+yo52Rkfw2UZ+xlRyh8
        7o5Yry2r1C6HmWxgBglo6+9eeci/a7JuV8aFa9EZCW3SrDNxWsiZ1tSOcuhvemSUe8nRX77VhnV
        CKDI13l43KCSVTw4hIni2VJAXNylIv6mnnKhltBXF8NjDEJOTdoK1cMCX7hlz
X-Google-Smtp-Source: ABdhPJxECZOcpBv/gTuYUDejgHhSKgS8eXKrifNj6j6UICA9ZTxdVUE4iSeud8Rg6KKovjhPkNFB1hA=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:42c6:8506:76cb:83dc])
 (user=osk job=sendgmr) by 2002:a5b:9c9:: with SMTP id y9mr11340666ybq.460.1631279033973;
 Fri, 10 Sep 2021 06:03:53 -0700 (PDT)
Date:   Fri, 10 Sep 2021 09:03:37 -0400
Message-Id: <20210910130337.2025426-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH] dt-bindings: hwmon: Add nct7802 bindings
From:   Oskar Senft <osk@google.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document bindings for the Nuvoton NCT7802Y driver.

Signed-off-by: Oskar Senft <osk@google.com>
---
 .../bindings/hwmon/nuvoton,nct7802.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml
new file mode 100644
index 000000000000..bc4b69aeb116
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7802.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7802.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT7802Y Hardware Monitoring IC
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The NCT7802Y is a hardware monitor IC which supports one on-die and up to
+  5 remote temperature sensors with SMBus interface.
+
+  Datasheets:
+    https://www.nuvoton.com/export/resource-files/Nuvoton_NCT7802Y_Datasheet_V12.pdf
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7802
+
+  reg:
+    maxItems: 1
+
+  nuvoton,rtd-modes:
+    description: |
+      Select modes for the three RTDs.
+
+      The order is RTD1, RTD2, RTD3.
+
+      Valid values for RTD1 and RTD2 are:
+        "closed",
+        "current",
+        "thermistor",
+        "voltage"
+
+      Valid values for RTD3 are:
+        "closed",
+        "thermistor",
+        "voltage"
+    type: stringlist
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
+        nct7802@28 {
+            compatible = "nuvoton,nct7802";
+            reg = <0x28>;
+            nuvoton,sensor-modes =
+              /* RTD1 */ "thermistor",
+              /* RTD2 */ "voltage",
+              /* RTD3 */ "closed";
+        };
+    };
-- 
2.33.0.309.g3052b89438-goog

