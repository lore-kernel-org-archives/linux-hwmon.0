Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEF4C6FA8F
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Aug 2023 11:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjHXLjP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241148AbjHXLjN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 07:39:13 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE161993
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 04:39:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31c5a2e8501so3367313f8f.0
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692877148; x=1693481948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8P8h3nZuVSVyj4+1oLgR8uo687zytcW2n1CdZ9Cvp4=;
        b=TaXnMwAipQl3FDvx2v1/DbaxVtjE3A/eB5CBfKB38sg72oYcfyjq75HBS33XXqBjgg
         tBsao8CZHboV9r7Ny1vCuBTDaW8YhKOYpCg56SwTOmXMA9WC1UDSe+JuAcinEA05OtYT
         q+d9Pwe6jlVLatppHx8xpCz2fhaKbQAwez4YmAZUCfalzDhmupJ9dXX47nnoeYk6HBrH
         zGU0CF18t6QG0NbhVawJ87iAs+6gTWNf1GLzOPT8NpHI2/P3fRPPgEwtlIstQGH8m3+5
         MbCJjI0g6GZHl/ZAS+z6v7YhStvYy32PAKtEwb84X5XGtTD9x6b2tNjJODQjRKDCz4qF
         6O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692877148; x=1693481948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8P8h3nZuVSVyj4+1oLgR8uo687zytcW2n1CdZ9Cvp4=;
        b=kTkXfKwEV096xZYP0JBbUAM6rgB3ZtmoRfweH055/nWd7t9ZGZ3NG8X3vDCoZQjKYm
         JaTONPFGq4NpCuHCJCAhWtyr+fRSa2/+ZiwVxXeVtNJ2zOm8nNUV5sxNLbTLViML2251
         kQKR4TLVkRhjTp6I1L+qj4EcMZfkFmJNJKyJ46mRVWb7SVGQCWRQ5eEJj6g6zpHJNeOj
         jhrMDgJAC6Pf32doKn9zm8lr/1ZWxcqV8QhtYiuBcmOIKIjpqx2u32/z9xS8A+M13GWj
         GWQ1kGjRjH8DN/knnlIL5KzEbuAIs7blkejZNrQqxEEOs0+xCp3ZjQt0EPSmZb5PsNr0
         z3cw==
X-Gm-Message-State: AOJu0YxvBzgzfsQkSqnRHQTSLjFzKnfbAdLZj1CtsjmYWxXxe3OIVyGZ
        R9EkJePr/Llsyq/uc+i3IevSsQ==
X-Google-Smtp-Source: AGHT+IF81gViUrBXZpO/eI+tSgih9Hhazl+rE2J3yHY4GJVD2gcN8W/qC95hqZOUuj7uCt9GFQVlUg==
X-Received: by 2002:adf:fed1:0:b0:317:5b5f:2328 with SMTP id q17-20020adffed1000000b003175b5f2328mr13269744wrs.24.1692877148524;
        Thu, 24 Aug 2023 04:39:08 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe790000000b003188358e08esm21887650wrm.42.2023.08.24.04.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:39:08 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: hwmon: Add MAX6639
Date:   Thu, 24 Aug 2023 13:39:00 +0200
Message-ID: <20230824113901.2601238-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marcello Sylvester Bauer <sylv@sylv.io>

Add binding documentation for Maxim MAX6639 fan-speed controller.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V4:
- Drop property pulses-per-revolution
Changes in V3:
- Update title
- Add pulses-per-revolution, supplies & interrupts
Changes in V2:
- Update subject
- Drop blank lines
---
 .../bindings/hwmon/maxim,max6639.yaml         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..9c06a61d57c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX6639 Fan Controller
+
+maintainers:
+  - Naresh Solanki <Naresh.Solanki@9elements.com>
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
+  fan-supply:
+    description: Phandle to the regulator that provides power to the fan.
+
+  interrupts:
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
+      fan-controller@10 {
+        compatible = "maxim,max6639";
+        reg = <0x10>;
+      };
+    };
+...

base-commit: cb7022b8976e3c4d12cea2e7bb820a2944e2fd7b
-- 
2.41.0

