Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00566C4321E
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Nov 2022 12:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbiKUM3w (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Nov 2022 07:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiKUM3p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Nov 2022 07:29:45 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6314FBF74
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Nov 2022 04:29:44 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5so8353616wmo.1
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Nov 2022 04:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BRaWwAMGebNoGykx3XuMu8YkZSBESQuLHrSVaFuRcM=;
        b=RQoFUkkW5Zx+3GW0+cbvDbjfe6jWvx0d95QAlTBP9aNW4JxOqt08+yGXfc9Szu/UiO
         EoWV0RzB/Smh33j+4JaDeq/dwMXFkrlj8vbSd/cMoCcsbbJv/kVhS0Hb06eM9dQLWYpL
         MiFV8/OHF5i+f4jkObyBv7PY3Vc8XcqNTX7k09HOTv6TrIWdfTCV7Z6Y8GAfT8ccAC5z
         3BfqiysK9T4rHwKnmtB/4gtYKAKq4JvcFEUSqwey5IN1MrbLBeX0wxCOLwN4V3tRAAcu
         kBB8nTv4s3zuFXxxNHjGkm2mFCjm5plLyqrDWjiYt/TzhfXToP6Bu96fTQ7FgPmLycud
         /nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BRaWwAMGebNoGykx3XuMu8YkZSBESQuLHrSVaFuRcM=;
        b=N1OZFeRf4fVQYzeHOVXpZDgRZcyg40gY4E1oYepdQ8YGtJ+8D51KmJSkbGcvI/D9He
         KjQA4hrggt3FS+uWJ5FjD0ADvV0BF1S6qSlJpT9M46BnBFxey+mOEHuxG12LFnlgpxMu
         J0yBZnS3EY+j2gxRZyamFiDsyEgqZAtZt/SoDdE137mMP8gTlWcGLZSKeP7emnJQaK3j
         N1PtDre1TUCA1GC8hz+0ijW6kmkN1+S0yJNVitw+O5rXNy8FKGLU3HgYl/Z06B+jkRUW
         wb/P8EiKB8XMQK87XEODo6O6bvy51gsAeVRDNGQTE5eE2atpgm6j0wfo8lWAeRBMzKbi
         c25g==
X-Gm-Message-State: ANoB5plWvR+QTd8ztfCrdH/HQRl0XV//Qp8UzwYAr+5Eojeah3elkiwg
        TTPZegV4YjlrXT2RtMeM8H6BIw==
X-Google-Smtp-Source: AA0mqf4W0NWLDrtN8YSSF1bWEPq4SAUyqTKy3rmQY/zTB3qa0uUGNYU9fUbQ/k+cHkQfSW4lLk3xeA==
X-Received: by 2002:a05:600c:3ac9:b0:3cf:cfc8:9450 with SMTP id d9-20020a05600c3ac900b003cfcfc89450mr12332597wms.99.1669033782910;
        Mon, 21 Nov 2022 04:29:42 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id dn12-20020a05600c654c00b003cf6c2f9513sm13929015wmb.2.2022.11.21.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 04:29:42 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Naresh Solanki <naresh.solanki@9elements.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v7 1/4] dt-bindings: hwmon: fan: Add fan binding to schema
Date:   Mon, 21 Nov 2022 13:29:29 +0100
Message-Id: <20221121122932.2493174-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
References: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add common fan properties bindings to a schema.

Bindings for fan controllers can reference the common schema for the
fan

child nodes:

  patternProperties:
    "^fan@[0-2]":
      type: object
      $ref: fan-common.yaml#

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..0535d37624cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common fan properties
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+
+properties:
+  max-rpm:
+    description:
+      Max RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  min-rpm:
+    description:
+      Min RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pulses-per-revolution:
+    description:
+      The number of pulse from fan sensor per revolution.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  target-rpm:
+    description:
+      Target RPM the fan should be configured during driver probe.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwms:
+    description:
+      PWM provider.
+
+  label:
+    description:
+      Optional fan label
+
+  fan-supply:
+    description:
+      Power supply for fan.
+
+additionalProperties: true
+
+...
-- 
2.37.3

