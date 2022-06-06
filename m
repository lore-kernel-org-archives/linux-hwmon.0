Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86573C43334
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 21:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbiFFVWg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 17:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiFFVW3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 17:22:29 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8829754F97;
        Mon,  6 Jun 2022 14:22:28 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id r200so7640344iod.5;
        Mon, 06 Jun 2022 14:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YkAlRuBkBGM9ewDuANrv7mVUzs/EQo+uPQZmHGb9L1U=;
        b=jcI2PdpXJdU7rQgG9hcNZFEiCOvDOSPUfmh8fSdkzGbqei4W0/DWm8yPuXU+8II3tc
         AA+cOkLuZpNZEKGs9EV6qQbxPfWXIyQRo+ScbVXwmvZ2vsjSlTb/Mvb3M9ynJnPFupnZ
         y4MRDeO6wUxEnoOh334x8jx/1DS3S6jrBuUfaGI3sfcOeFnVLu0v6WWWUwyW/BSqGbw3
         t/rMYMIVG6jm4hij072coAF8eWdeGhg97hBLzE+9HuLPzjFWTwStP4XWxRcBr2dgvj24
         TABPBIvyeu29IMWGYcx2g5i0cSV5Kx3afBydiiErVZNcxbC5TixgoyPufTg28stfbjtt
         aWgQ==
X-Gm-Message-State: AOAM5335aukQ1D+B8PJiXgXkIBQZitIYEzvkOfYwxqG6NIL42yunsct/
        AXS7I9XC6zFXbUAUQvzNmA==
X-Google-Smtp-Source: ABdhPJyOc0o0nk7Fh+wdRulfaZVXXTMVU1fBO4y6e4MK18h6d9S4GG8DJ7J9dUGiKCjNmjc5h04QHA==
X-Received: by 2002:a02:aa04:0:b0:32e:c9f8:87ba with SMTP id r4-20020a02aa04000000b0032ec9f887bamr14299595jam.254.1654550547772;
        Mon, 06 Jun 2022 14:22:27 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
        by smtp.googlemail.com with ESMTPSA id k2-20020a5d97c2000000b006656f9eefa3sm6000924ios.18.2022.06.06.14.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 14:22:27 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Camel Guo <camel.guo@axis.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: ti,tmp401: Drop 'items' from 'ti,n-factor' property
Date:   Mon,  6 Jun 2022 16:22:22 -0500
Message-Id: <20220606212223.1360395-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'ti,n-factor' is a scalar type, so 'items' should not be used as that is
for arrays/matrix.

A pending meta-schema change will catch future cases.

Fixes: bd90c5b93950 ("dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
index fe0ac08faa1a..0e8ddf0ad789 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
@@ -40,9 +40,8 @@ properties:
       value to be used for converting remote channel measurements to
       temperature.
     $ref: /schemas/types.yaml#/definitions/int32
-    items:
-      minimum: -128
-      maximum: 127
+    minimum: -128
+    maximum: 127
 
   ti,beta-compensation:
     description:
-- 
2.34.1

