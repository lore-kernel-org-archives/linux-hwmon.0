Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035B1C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Oct 2022 20:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiJLU7X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Oct 2022 16:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiJLU66 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Oct 2022 16:58:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA2911874F
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Oct 2022 13:58:11 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u10so27959401wrq.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Oct 2022 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTl7droVltKnXDsBoh0Qb/I0hZgySD4P2UJsI4/mO+E=;
        b=apEq+0Xzb5zZRiEUYdM/zyjMhjmphpGg+ZQ2kJPjX0Bh+jPdHvrSNypBTJmphxJcb+
         xBjhXs24rsIhV9VUeqLQiG1bxNPboBHZBKnS46KP3otgq++yqGHGb5l7jPk2MhlM/fdW
         K91N3xfOeXxPRbPbPOB25vjBnB7iCHIrz1L9T5IU2ejUtZgolyPzUI6EaHfH4MrqJT8V
         PQwNwQIDLM0ad5qHwuy3wgy1yL1Nu4v4sLzqd5795ynHExLOO41o1cWa07V8YelbmUig
         JQrtSdGEet2QxQOaLiTiNti/vRjbs3z0oyrwgG2tnLzUPasHlmHXGLMmZZHcKPJTOIoa
         7gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTl7droVltKnXDsBoh0Qb/I0hZgySD4P2UJsI4/mO+E=;
        b=quXImTqULbKG+0oNus76f+dwA/lO2CmSmQ6tvFzQqwkNXTwL5dWwLKNjQllwLkIyfA
         xGuXhgAXP193sly6SVKJCiBwgVEA0Wmz29J9lqKJbUeiAT9V5NjHgG4ENFB1Xu014U6Z
         Vb6rd3oMxDVAExkr4MDd5QQ3bB4QWt8HsxguHlGUs7gxycfxvJOO56fy1sWJ+YDkrLa2
         EN2QfVgcDKKvwgOenJIlTVQBQmHnqmP/CFdWj9zgdPa0bzs1YyyHnTmZ9njonCS7WxFc
         TcYe7ibZQJpeSfT6AXIY/2WLwDLe+LTUQfg9b3iNVzO5igr2NL2UC0K/ND0j9la7564k
         pQ3g==
X-Gm-Message-State: ACrzQf2ozz51IAij6XNVmB4c0I2z07wDc/55i3sj+7bICifMGmQe010W
        J6dCsMVDZFXWMGgoUdkyogUL1w==
X-Google-Smtp-Source: AMsMyM4z+MIBxJTWQVQ4YQP6nwYn4bT/zyo8Iypz2pbbvzHKXe6MbnRtEypx7MttLuyNHyifO51EhQ==
X-Received: by 2002:adf:d1c2:0:b0:22e:6499:3137 with SMTP id b2-20020adfd1c2000000b0022e64993137mr20632333wrd.658.1665608261833;
        Wed, 12 Oct 2022 13:57:41 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c354700b003c6cd82596esm3165443wmq.43.2022.10.12.13.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 13:57:41 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date:   Wed, 12 Oct 2022 22:57:34 +0200
Message-Id: <20221012205736.1231514-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221012205736.1231514-1-Naresh.Solanki@9elements.com>
References: <20221012205736.1231514-1-Naresh.Solanki@9elements.com>
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
 .../devicetree/bindings/hwmon/fan-common.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..224f5013c93f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,48 @@
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
+  pulses-per-revolution:
+    description:
+      The number of pulse from fan sensor per revolution.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  default-rpm:
+    description:
+      Target RPM the fan should be configured during driver probe.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwm-frequency:
+    description:
+      PWM frequency for fan in Hertz(Hz).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwm-polarity-inverse:
+    description:
+      Inverse PWM polarity for fan.
+    type: boolean
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

base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
-- 
2.37.3

