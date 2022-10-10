Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD29C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Oct 2022 20:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiJJUdY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Oct 2022 16:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiJJUcw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Oct 2022 16:32:52 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467D27E81B
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Oct 2022 13:31:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a26so27233799ejc.4
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Oct 2022 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJXaub8jNOSU8CZBAJmxK76v0+6+Br/qqh6c+RTPcf0=;
        b=fdejB9q/hoveZSTuzuWDGHSiMM4dX/rh5rrYrHgLf9gsTdMMWBd5wDrVD6n1veEtf3
         FhOT2tD6k+eLwou2s7WJuVO5P49L4V7qAOzUCHVvGJTSWxYMcWciVfUM3mDizMSNvCui
         9E+M0t/8cNkgGubCS8xJKS7JKtklpAHkQuLkJz09yOUoH0/VTbEzu1LE9AZsepW48GC5
         44qc5MTolNBoVeZbxFlKOziqOi8VUDUBIe5kEt7juny4M6wVBAl3CAMAmOeeO4Qkd8lU
         JL7GtK8pkuij0FTp+5p9TD2q0eEd/Zn/aOS50sB7qu7ONU1lRy2GTZcezar3N5Jreaam
         VV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJXaub8jNOSU8CZBAJmxK76v0+6+Br/qqh6c+RTPcf0=;
        b=7vQooyjuQGWM5s5ip0RWtDVtR8VB9QNKs9oXVQFvO1ZAt/j/mr0IHLO7eCFbYQh0KL
         tKtrQgQofhnWt1OoQ2CaEi/dRKmmBiXgZkBB7Mdoqcts3Z1pFrdxEuCjbg7NxA2Pe4ns
         1K8FOqeGi9Sn1H/X9fjDgcfwaM1dLVcvy95AwIQer21IQjrYxvBMTOaFPl7TxK2h0kat
         IPHN+r7sXRi5CVeRVFjvIkxy3dUYt8ySk2qcADpI0mno+fxow3vFkeVhRuLKrMZgQ0++
         USul9/IDjysb6nPy7iHHIZEs9BB4QVkDkpnGadun7JreWKihTEQFYPSFqEeA8dcYrPVR
         SZcA==
X-Gm-Message-State: ACrzQf2Vp/r21UidMBMx8F1sVDv1ERo02K+OpkaNpaUuzfmlaeOBO410
        ih3CNVeWRwsD+pHUQY2OzGSnhw==
X-Google-Smtp-Source: AMsMyM7Usu159PqLfj1xM/5xl+Binkd9NYvzTw9uyFy4+kF/J4CVO6dHrIZ3VjJgw4hXPzeXRp7M2g==
X-Received: by 2002:a17:907:7f13:b0:782:9f6f:edbc with SMTP id qf19-20020a1709077f1300b007829f6fedbcmr16230778ejc.544.1665433883968;
        Mon, 10 Oct 2022 13:31:23 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id c18-20020aa7d612000000b0045720965c7asm7670385edr.11.2022.10.10.13.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 13:31:23 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roland Stigge <stigge@antcom.de>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 2/3] dt-bindings: hwmon: Add binding for max6639
Date:   Mon, 10 Oct 2022 22:30:45 +0200
Message-Id: <20221010203046.3673663-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010203046.3673663-1-Naresh.Solanki@9elements.com>
References: <20221010203046.3673663-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marcello Sylvester Bauer <sylv@sylv.io>

Add Devicetree binding documentation for Maxim MAX6639 temperature
monitor with PWM fan-speed controller.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../bindings/hwmon/maxim,max6639.yaml         | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..bbefb0a57ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max6639
+
+maintainers:
+  - Roland Stigge <stigge@antcom.de>
+
+description: |
+  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
+  fan-speed controller.  It monitors its own temperature and one external
+  diode-connected transistor or the temperatures of two external diode-connected
+  transistors, typically available in CPUs, FPGAs, or GPUs.
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
+
+properties:
+  compatible:
+    enum:
+      - maxim,max6639
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^ot[0-1]_indication$":
+    type: boolean
+    default: false
+    description:
+      If true then enable OT pin indication.
+
+  "^therm[0-1]_indication$":
+    type: boolean
+    default: false
+    description:
+      If true then enable THERM pin indication.
+
+  "^fan@[0-1]$":
+    type: object
+    description: |
+      Represents the two fans and their specific configuration.
+
+    $ref: fan-common.yaml#
+
+    properties:
+      reg:
+        description: |
+          The fan number.
+        items:
+          minimum: 0
+          maximum: 1
+
+      maxim,fan-spin-up:
+        type: boolean
+        description:
+          If true then whnever the fan starts up from zero drive, it
+          is driven with 100% duty cycle for 2s to ensure that it
+          starts.
+
+      maxim,full-speed-on-therm:
+        type: boolean
+        description:
+          If true then force fan to full speed if THERM pin goes low.
+
+      maxim,fanfail_indication:
+        type: boolean
+        description:
+          If true then enable fanfail pin indication.
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      max6639@10 {
+        compatible = "maxim,max6639";
+        reg = <0x10>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@0 {
+          reg = <0x0>;
+          pulses-per-revolution = <2>;
+          max-rpm = <4000>;
+          pwm-frequency = <25000>;
+        };
+
+        fan@1 {
+          reg = <0x1>;
+          pulses-per-revolution = <2>;
+          max-rpm = <32000>;
+          pwm-frequency = <25000>;
+        };
+      };
+    };
+...
-- 
2.37.3

