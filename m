Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26218EB64DA
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 06:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbjGNGno (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 02:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjGNGnn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 02:43:43 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889BD2698;
        Thu, 13 Jul 2023 23:43:42 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id ca18e2360f4ac-7835e5fa459so59048339f.2;
        Thu, 13 Jul 2023 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689317022; x=1691909022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwSGlWoHJa4rFPq/AG8W9SdX1R0sAu/UGOBwhJyUd1U=;
        b=Q1VkLox7/DNj5NrUbTp+CgTofU1gIc7IqvVVSycWbIPGvpQ/5Uq7ftdlz4ujk7SmCA
         x+QYEHebGuj2URk917+4zs3pUP+z2Ip9Uq2WdoiP6H1b+6NklUynQe6MyyYQwKvudvsR
         rzANxrI6CMAgPRRMDlTYcdDUiNcDoHyo+siphqTtacf9ApJokRIHkOoAWPa+B8gb7bYy
         AlRHp825t3mZbDYJasldkr+2Q9j9yp/I2U8pN7VJ5AFNbwqGOJE3WvjnNPf63fmwhIej
         Cria8jvzjNSHefsiE8hja82HnNCMVa3fFfEvqX5f6ziGXeoshWz2zAnMr+3TFZnJ5Fvi
         t6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317022; x=1691909022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwSGlWoHJa4rFPq/AG8W9SdX1R0sAu/UGOBwhJyUd1U=;
        b=iV2VNvL67tcvWn792kMq1Ah62TjA6j6Rj5MonXqfyf6fFrA/eGzKCrGXY0TrzOcsra
         uhKoXLp4xeD15AAzUuTxlmsdJxvPw+MgrCm6sOWZgVsHmBjfRYJwVvjNvs/Y2jEat9Tf
         MSCPSnsrwVvimhc8W+GHBWmY0XvZ+c7YYvj6t+9oyOZOyBIjJkLrC1P+obkch+QOiFNf
         4RX0SmLyGjdMvi74oFCNUaNoB106nAUtT1uOOXuaoZJUvZf56etZL8htMMb1d/EYGVI7
         OO7YXHwAA1nBlCH7jYG2vWa4ZtNckEmeuucdn1YymwPncRZ90ceHrDKnPhjSg1pi9NFJ
         y8pw==
X-Gm-Message-State: ABy/qLadiVO7y66/L/adwRgQs0CNEbBe033VUbl7RhqPB7q1E5UsUyCZ
        2OJX3Y+vo4vXbsk17qVVxFRU10v7H9B32g==
X-Google-Smtp-Source: APBJJlHR/PhpujbjbQlBc2Kxo7pyqn5vmdJU2NKgaCEY0mfDanoO7z4EAOHx3MPO/mzIvj4jku1XtQ==
X-Received: by 2002:a5e:d614:0:b0:76c:5513:8b00 with SMTP id w20-20020a5ed614000000b0076c55138b00mr3819430iom.21.1689317021783;
        Thu, 13 Jul 2023 23:43:41 -0700 (PDT)
Received: from ws-565760.systec.local ([212.185.67.148])
        by smtp.gmail.com with ESMTPSA id t28-20020a02ccbc000000b0042b3bf0baacsm2390245jap.138.2023.07.13.23.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 23:43:41 -0700 (PDT)
From:   Andre Werner <werneazc@gmail.com>
X-Google-Original-From: Andre Werner <andre.werner@systec-electronic.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon driver hs3001
Date:   Fri, 14 Jul 2023 08:43:35 +0200
Message-ID: <20230714064336.28371-1-andre.werner@systec-electronic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is the initial description.

Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index ba2bfb547909..5a5de3f6cd37 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -320,6 +320,8 @@ properties:
             # Rohm DH2228FV
           - rohm,dh2228fv
             # S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
+          - renesas,hs3001
+            # Renesas HS300[1,2,3,4] Temperature and Relative Humidity Sensors
           - samsung,24ad0xd1
             # Samsung Exynos SoC SATA PHY I2C device
           - samsung,exynos-sataphy-i2c
-- 
2.41.0

