Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69862EB64DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 07:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjGRHB2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjGRHBV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 03:01:21 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBF810C7;
        Tue, 18 Jul 2023 00:01:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-3fbf1b82dc7so49186335e9.2;
        Tue, 18 Jul 2023 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689663678; x=1692255678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzNwIRCJDii2z2HylM8OR2d7FmOXx1t8e5WNUvK/gXY=;
        b=mATn4/yKGPeEHbuKeCs/J0dW3TIAHHlbN2i7JqQA+qXk3Fz96s1XnEjb48JBci0IZI
         vOJnmT10Ak1yUqOgzxfLoo0IGsvaFhu7hb7HX7jfFxRwdfeAVO8ywv3CixbUyOJYpyT4
         PBf0Ue7imtImM/0psHPxQgRTEVH4nfAwuzZBpyCooyHJzynsQhsaDUn6jZYCytYkmONs
         GMzD0ADz0kcpBUPDeNCxscuFwu1e1zx0+PIpmVV4CWjY5CtJEKum16JV/VF3O17D0zyM
         qdRX1SsdDwsaVQ6EZ+ZD1+oWPyxSuIHaormsX8RDm5hd+uRJb1XsYrg9MQWJyL66OpO+
         7C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663678; x=1692255678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzNwIRCJDii2z2HylM8OR2d7FmOXx1t8e5WNUvK/gXY=;
        b=TdxdnaGpvpfi/XUiIrGGf47jg9QjCSo+c4O5tYSxLLWrze1DtRjfIgINmgtPkWfEz2
         wsBhN0DdaP7nwEEMGvSw6p9JJCqilJYC2i1N0xl4laV0w3/GqTve7yT3XO+/YiNgMO5K
         M+TB6zUCVzxBsePdG9c7o7r4SALhRlEZ8toNGLgKySjrNSQ9CsiW2CY5hTorHxG7GmO3
         BqF/BdwMbgSEHvsU/u8AgHyq+XpOwH54FcEImyG+34UpVPrbkYc7jXYa3q641fq8kl1I
         +58M4RVEA4ySL7sfb35J27lEi44E5lX7NA+1cprMpfwNUHXr11JhFJ1In3TCxAk5eTtJ
         1kBw==
X-Gm-Message-State: ABy/qLaQ5R15ueYWvs3NixQzJdvA1W6nvffqUDMiXdVUvs+G/zMiu1Xz
        dwUKdWQVRR+PoxGgLInu5ab3lf5m2f7+gQ==
X-Google-Smtp-Source: APBJJlGEgW1VBaMFntOfjEIBLNqep878iwnxRBaAaRTeSYhRhRgwBAeCI/sLw4VgjybXTdrtIyOldg==
X-Received: by 2002:a7b:c354:0:b0:3f6:58ad:ed85 with SMTP id l20-20020a7bc354000000b003f658aded85mr974794wmj.10.1689663678014;
        Tue, 18 Jul 2023 00:01:18 -0700 (PDT)
Received: from ws-565760.systec.local ([212.185.67.148])
        by smtp.gmail.com with ESMTPSA id f8-20020a7bc8c8000000b003fc3b03caa5sm9106574wml.1.2023.07.18.00.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:01:17 -0700 (PDT)
From:   Andre Werner <werneazc@gmail.com>
X-Google-Original-From: Andre Werner <andre.werner@systec-electronic.com>
To:     jdelvare@suse.com, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon driver hs3001
Date:   Tue, 18 Jul 2023 09:01:13 +0200
Message-ID: <20230718070114.3871-1-andre.werner@systec-electronic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is the initial description.

Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>

v1: Using separate dt-binding hs300x.yaml
v2: Reviewer recommends documentation of driver dt-binding in
trivial-devices.yaml because the driver has no special properties
to describe.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index ba2bfb547909..a4f4701337cf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -315,6 +315,8 @@ properties:
           - plx,pex8648
             # Pulsedlight LIDAR range-finding sensor
           - pulsedlight,lidar-lite-v2
+            # Renesas HS300[1,2,3,4] Temperature and Relative Humidity Sensors
+          - renesas,hs3001
             # Renesas ISL29501 time-of-flight sensor
           - renesas,isl29501
             # Rohm DH2228FV
-- 
2.41.0

