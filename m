Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BF5EB64DD
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 08:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbjGLILc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 04:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjGLILb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 04:11:31 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6C110EF
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 01:11:29 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e4c868ee4so5513393a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689149488; x=1691741488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHkdHjFrM5AfGKbyzbpp4QoR422wNpy9DNc8+HlwIYs=;
        b=AzJbvXxgl40Rh5LpkFIrmNi/6CwG7cp23unkfzcyCmTh6Vfe+T7HaKu0u8e6ykzg8z
         95T0Ho47gQFvBalUnsu3IHe3eFf2cX0jj/hlHVrQjRdVT2IFsSGObXP+3s21P0MlcY3k
         jy/JBDKyKvq6v55fEeFaOAkDNM9jyuyuhB5md3cx1GKu2WpkcHN2gtUH1Bs/pZNq5L8j
         1DOyiNXPxUGruMBe9F0xnub1wQKKSLACgevYyxMUQmHo5JATS4U1iHcswqNQcq01J4TU
         y5bJJhyil0rBNkljL0YPehL6poUpoO9/hKvmRsC4IR6EeC3Idf0i1LpZtbUwOS2SuhON
         LM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689149488; x=1691741488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHkdHjFrM5AfGKbyzbpp4QoR422wNpy9DNc8+HlwIYs=;
        b=EegIk8WNSmdc5oHE3zvYPN60C/8jVLy1uF7igDrfHrWx5THGAN6FZQQl0dGToxtOD9
         cddKIZgXJD0wyBsnoV3Jv2PN8gnQyD+Rx4dUh2pODZOQtrjJWpSxHCCKJJz675NSCSV/
         Jae9zyRmq2FV9H3K42KRoUVbSocQ4J92PpRwIfg6+xhYfR9HDFhllK6qAfdqe+aYIPIt
         LnvdEWz8lmw+vMsiWI0DfY66VtmBvJqM5jkce9FHV8lt8FbS8McP2Lzqi4F7FNaGMxBc
         cQEOXuJ461VO/05BQ4QwHvNTaTVZczeDpH4BCtmxDtVf+RWay+VsWuTam8cWEGh9Zy7f
         +2DA==
X-Gm-Message-State: ABy/qLbVwYGGTz06WlEdeQJvc9pdT6HZvOG2L47/y9mKqld5iRCr6/wT
        7LseNUHCHXH8+zW3H82iQlhbjA==
X-Google-Smtp-Source: APBJJlG9168Y3yKpvGkO+PSj4hvN4VDwnF2KzycYIa/xWbJHW3ppkxTBzsAdI7Sty/NnqkSrhIdnRA==
X-Received: by 2002:aa7:c544:0:b0:51e:1bf3:f4ac with SMTP id s4-20020aa7c544000000b0051e1bf3f4acmr15556921edr.27.1689149488039;
        Wed, 12 Jul 2023 01:11:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t3-20020aa7d4c3000000b0051d87e72159sm2368024edr.13.2023.07.12.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:11:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rahul Tanwar <rtanwar@maxlinear.com>,
        Eliav Farber <farbere@amazon.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: hwmon: moortec,mr75203: fix multipleOf for coefficients
Date:   Wed, 12 Jul 2023 10:11:24 +0200
Message-Id: <20230712081124.110345-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Few coefficients use default values multiple of 100, not 1000 (in the
example DTS and in the Linux driver):

  moortec,mr75203.example.dtb: pvt@e0680000: moortec,ts-coeff-g:0:0: 61400 is not a multiple of 1000

Fixes: bf1fdafdbc61 ("dt-bindings: hwmon: (mr75203) add coefficient properties for the thermal equation")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwmon/moortec,mr75203.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
index ae4f68d4e696..bd67cfee6d19 100644
--- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
+++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
@@ -105,7 +105,7 @@ properties:
       G coefficient for temperature equation.
       Default for series 5 = 60000
       Default for series 6 = 57400
-    multipleOf: 1000
+    multipleOf: 100
     minimum: 1000
     $ref: /schemas/types.yaml#/definitions/uint32
 
@@ -114,7 +114,7 @@ properties:
       H coefficient for temperature equation.
       Default for series 5 = 200000
       Default for series 6 = 249400
-    multipleOf: 1000
+    multipleOf: 100
     minimum: 1000
     $ref: /schemas/types.yaml#/definitions/uint32
 
@@ -131,7 +131,7 @@ properties:
       J coefficient for temperature equation.
       Default for series 5 = -100
       Default for series 6 = 0
-    multipleOf: 1000
+    multipleOf: 100
     maximum: 0
     $ref: /schemas/types.yaml#/definitions/int32
 
-- 
2.34.1

