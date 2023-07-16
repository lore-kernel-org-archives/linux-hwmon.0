Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE17BEB64DA
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 15:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjGPPGF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 11:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGPPGE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 11:06:04 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EF11B7;
        Sun, 16 Jul 2023 08:06:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so36745675e9.3;
        Sun, 16 Jul 2023 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689519960; x=1692111960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwSGlWoHJa4rFPq/AG8W9SdX1R0sAu/UGOBwhJyUd1U=;
        b=VTCcsSCUe22YtjgsOjl+gMv9uOGC/X6GAjJhQAmr3wEbgzbhbOL4bpqLsfNYQ7QWC4
         FLfr0DoSChW5XRJBtFICdJW0zW6bXjC8zee5XoOzMaNStkr9tvbDetuBSz/O/IwMMQoV
         UFxfe1obBNrUJeegjbRa9VlJO77fxZpri1Q0pwA3uQ+g/y1Rk/oaAlwZ3zFAAsGvC8VS
         bE4U0VSL6jBYQkk3wnX19SxvSW4wnW8DyqYPqJtrWIaw5GGQHQPwpZHPp79/gPY4QJvH
         EhtZyzZhBufZo0Ck+T5Krj1jkRCNOvPJnrAaEUyGNHGB4sJhxGXmKsi+A4SL7oz3F1Ze
         zozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689519961; x=1692111961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwSGlWoHJa4rFPq/AG8W9SdX1R0sAu/UGOBwhJyUd1U=;
        b=HasV13E0bBJKFyuEmdhWE4yx28hmTsYtbCuAEtJYz4vEs0TlUKmb/ipf6Eillkga5E
         xquCwb067U3IpTOd5ayTG+y6I830hd40HvDbmvz+imeg4uCAn8wzzWWDn5wArObaHGmZ
         LifLAzP8C/0D5iRkibINx0hKILfSzPamiWbUeFI6f38YLA3zfXBd7EaSt5BmAJ74qvXe
         IK2ymXKVRcyEofrvMxmOUArYDo315gg/I+SKePJBIkBWd8X0IGaJxFwJOFpa6DuhDVPg
         ELHdh5S2SDWfZe728RHRAQvSAHC4kzD3la6AvskcreTFXt/C30rIIZOUg3ls8icJgXpr
         ysTQ==
X-Gm-Message-State: ABy/qLaQA5F1S1biY/4p0v2GuJD39LHC14gdSt64YPEX3TWZidyWbWzx
        X5/yHjuV4VNgKMjd0Zc6bU3JJmqZn57J6A==
X-Google-Smtp-Source: APBJJlG3Qx2qmZvKycaedS9BSWPksVngGu2Yf3jK+3l6ec+3VYPpD+aQTVmniPoiUgvWLOtv96xF1w==
X-Received: by 2002:a1c:ed0a:0:b0:3fc:4ee:12b4 with SMTP id l10-20020a1ced0a000000b003fc04ee12b4mr8293531wmh.32.1689519960465;
        Sun, 16 Jul 2023 08:06:00 -0700 (PDT)
Received: from ws-565760.systec.local ([212.185.67.148])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b003143ac73fd0sm16791442wrm.1.2023.07.16.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 08:06:00 -0700 (PDT)
From:   Andre Werner <werneazc@gmail.com>
X-Google-Original-From: Andre Werner <andre.werner@systec-electronic.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon driver hs3001
Date:   Sun, 16 Jul 2023 17:05:55 +0200
Message-ID: <20230716150556.26155-1-andre.werner@systec-electronic.com>
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

