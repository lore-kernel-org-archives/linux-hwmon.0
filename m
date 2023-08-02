Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F51AC04A94
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 19:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjHBTcM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 15:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjHBTcM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 15:32:12 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CA41990
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 12:32:09 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso174386f8f.0
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2023 12:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1691004728; x=1691609528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FG/HvA/ZhPB46DVPJ1FluHZ8X/9xTIstvJa8fWyAL7s=;
        b=aTsL5G7mheOUz7tnXWywhC8ziDCKBSxTb575FaYpQBIM/DZkYwPjCr3TUqQo/D7KjM
         681xxo/H2QmzJKKL2zBfZCINoUgHqhhTCuRi/Zn4T2JRCMWoLAJnSSvdCo7qZByXp9S9
         ImGdJOfmB2l0dDlVv3aXGZI1ZROQ9TmrkRo/ioe1zJOBuRqKl8cqpwvNQ/ENKNEEptWz
         X54bIgMBjzQrAdCgDO3MSdlefWZFAzTPfrpqopcUk/fEiQ+AYQ9ka2t+G7h3P+XFqLZT
         kHE/yTqcMa4lIR1zDqn7JGJc9+G7+ReIXoyDBXgAW9tmPt4ybhXsCOyFsHO/FqOjW65u
         FWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691004728; x=1691609528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FG/HvA/ZhPB46DVPJ1FluHZ8X/9xTIstvJa8fWyAL7s=;
        b=eRok2nw3E4vc8Zw7d7mDZ/mXCJDb2CG55qtYwM/bpXJ4qRoVB6MGzzMi+OM6LblkWd
         8napGoYDVGx8QHb3fXFHqActJDj+rTlWHFKcIH3vjUuwBIaTv6h0wk1DpN8KiaRm5XCI
         n8Dn400GzcIGkZ8VcIwHEPRYKRnF4rlgTG2UU2ZRAm6Z2AIN+/QXcGdO/m3/4hiRa+iT
         zxOq3nrCbR0j0zJP4Zk97fLjMG0ndtU+ze521PTxxW4czZCghrqxcR8bEzKgPkhTXTwN
         dPBjIl9eTQSI28BWDcAdUNrFbQ+HYoCwMg2Ecr3oGslbQf5YyPhnuqKuUcjPk6fctEq8
         Icew==
X-Gm-Message-State: ABy/qLbe8P3U1fs3BjhnauR/KDG/SfJ8qCehHnCdsX5qPsfnO3GjoAP3
        rwkT6J3I4Ib9yo5ZR6D1JZUdcA==
X-Google-Smtp-Source: APBJJlGN4ok5HUHFSRnW8eQTuxLuRrNGvonXPO4jn/9w1U4oLoHipaE8+IUxSA3dfFg2caRnAVArBQ==
X-Received: by 2002:a05:6000:152:b0:314:5376:f0d6 with SMTP id r18-20020a056000015200b003145376f0d6mr5372863wrx.52.1691004727865;
        Wed, 02 Aug 2023 12:32:07 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b003177074f830sm19666773wrr.59.2023.08.02.12.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 12:32:07 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Naresh Solanki <naresh.solanki@9elements.com>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: hwmon: Add Infineon TDA38640
Date:   Wed,  2 Aug 2023 21:31:51 +0200
Message-ID: <20230802193155.2170935-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The TDA38640 chip has different output control mechanisms depending on
its mode of operation. When the chip is in SVID mode, only
hardware-based output control is supported via ENABLE pin. However, when
it operates in PMBus mode, software control works perfectly.

To enable software control as a workaround in SVID mode, add the DT
property 'infineon,en-svid-control'. This property will enable the
workaround, which utilizes ENABLE pin polarity flipping for output when
the chip is in SVID mode.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../hwmon/pmbus/infineon,tda38640.yaml        | 51 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
new file mode 100644
index 000000000000..c5924ddf1b47
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38640.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TDA38640 Synchronous Buck Regulator with SVID and I2C
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+
+description: |
+  The Infineon TDA38640 is a 40A Single-voltage Synchronous Buck
+  Regulator with SVID and I2C designed for Industrial use.
+
+  Datasheet: https://www.infineon.com/dgdl/Infineon-TDA38640-0000-DataSheet-v02_04-EN.pdf?fileId=8ac78c8c80027ecd018042f2337f00c9
+
+properties:
+  compatible:
+    enum:
+      - infineon,tda38640
+
+  reg:
+    maxItems: 1
+
+  infineon,en-svid-control:
+    description: |
+      When enabled, it allows the chip to utilize workaround for
+      software control of output when operating in SVID mode where
+      hardware-based output control is the default behavior.
+    type: boolean
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
+        tda38640@40 {
+            compatible = "infineon,tda38640";
+            reg = <0x40>;
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 40bc475ee7e1..86c7d34f63bf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -151,8 +151,6 @@ properties:
           - infineon,slb9645tt
             # Infineon SLB9673 I2C TPM 2.0
           - infineon,slb9673
-            # Infineon TDA38640 Voltage Regulator
-          - infineon,tda38640
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Infineon Multi-phase Digital VR Controller xdpe11280

base-commit: cb7022b8976e3c4d12cea2e7bb820a2944e2fd7b
-- 
2.41.0

