Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A35C38159
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Jan 2023 17:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjARRXF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Jan 2023 12:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjARRW5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Jan 2023 12:22:57 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E29747439
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jan 2023 09:22:55 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k16so4602266wms.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jan 2023 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTHrIMlF4V0ckFLxeB8DR9WhaVsZX5PbMH6MIzdQoL0=;
        b=OIPxQXahRqIyc5S3hnGhKnpU7KIAvICxeR/SBr7HP2wZIIz4A9gnLFxLRxkHKn03aD
         goy0kke/murf5dzTgMiZrklMxeeAlCQO+rLg553Dho2NwigPzGTo6wTf7eMDkxPDDKXO
         1WyY9nS75tuJlM/cW7yNuVcMLK3KzY+z98jLzpWIKSP8Zf3m3eUDUTS0bw9avJGdVsMK
         co131aVlmKeyoBU991VDl+S3DsSGDhA6CboymqEvmLiy6Cqlhf3rzaSTa6DPrSiC8Bwt
         dQ62n5lydam+cz4AW26aoLKUcVw9rwZWh5tN93Y7fMZv+6PlsuPMXRb2CfysyPTf30jk
         JiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTHrIMlF4V0ckFLxeB8DR9WhaVsZX5PbMH6MIzdQoL0=;
        b=AG++TnLH2ZR7xwGcx0cwz9h6UzaEdn9f0zK/0xjMP1xxEfCk4hlCBtSN9DKKvKMZWA
         g3nuUv2MWsrplDbLzzKXCRkETrscBhusnJ2qLDpx5ib1mbPlQj3+TpeQXk38berWjsFV
         aqDZkpgxOOA96rxHYZ6M7VkDOz2CZ/ViVaWtsHCtxHlqrC2gLz8yn76ZspU9FZYuxceR
         isDJGeeTMJNWXacwr4oMza9y9LPBPbAvy818q2LAQ2h3eZDp+sWw/Auu6oepfyitVBPN
         ghOPjQ8VEJKyFQFlOU8ZeKXAKasVfVgwM/BbGJ0jIpj8nyfTZqUGRZFlqUKg9RjZkuA+
         95lw==
X-Gm-Message-State: AFqh2koGyY5czmzMaE5opRoo0r/f+4VwnZKFSVMycxloY+vKKP4IIXGI
        oSqQIw4gW/5rKz2gtsUzjYPe1w==
X-Google-Smtp-Source: AMrXdXvGjjiLYQ6mh5t+ATqJa4pO1oWDgd9qn6J8/i6FO8XyLtcEOWAPZhSbqIBeo1hXusYDmYMDvg==
X-Received: by 2002:a05:600c:1d12:b0:3da:ff82:f627 with SMTP id l18-20020a05600c1d1200b003daff82f627mr7760045wms.25.1674062573622;
        Wed, 18 Jan 2023 09:22:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v20-20020a05600c215400b003d358beab9dsm2434746wml.47.2023.01.18.09.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 09:22:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        Akshay Gupta <Akshay.Gupta@amd.com>, Kun Yi <kunyi@google.com>,
        Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: adi,ltc2992: correct unit address in example
Date:   Wed, 18 Jan 2023 18:22:36 +0100
Message-Id: <20230118172237.349111-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

lower-case hex is expected for unit addresses:

  adi,ltc2992.example.dts:22.24-38.15: Warning (i2c_bus_reg): /example-0/i2c/ltc2992@6F: I2C bus unit address format error, expected "6f"

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add Rb tag
2. Reorder patches to silence warnings.
---
 Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
index 64a8fcb7bc46..ec984248219e 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
@@ -59,12 +59,12 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        ltc2992@6F {
+        ltc2992@6f {
                 #address-cells = <1>;
                 #size-cells = <0>;
 
                 compatible = "adi,ltc2992";
-                reg = <0x6F>;
+                reg = <0x6f>;
 
                 channel@0 {
                         reg = <0x0>;
-- 
2.34.1

