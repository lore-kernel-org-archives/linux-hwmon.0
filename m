Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA267C19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 11:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240747AbiHILWW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237719AbiHILWU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 07:22:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FB21EC65
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 04:22:17 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id kb8so21646079ejc.4
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bs2fGCCkc2i9GgsvwKl491tj5ookRO+wJSTW2OEqR3M=;
        b=VJb9zJ/PZhORR9RBOkdVYOzLGPQtXBAhAx60nCXdVCdzLiU5rxjtt9t3SP68aJzPLf
         mJtLb2jPrL39bWcQUUUMs843YToAwhK13dbbbj4mugqcp+qRSO20fHbDAXmU8TRauV/F
         nSguaulCuRFKGL9hyMQm3T9Ch7pXUqseq5Wfm0Y6nIsWbf3MygTRna/8P79qNZZgePQQ
         aojxIxk4+gTbCDuFqFOZO1Yc/mR+nvQPeXNUs+71y0K5l7zEIxephLNe8A3pkvFsamuc
         dMW169eVljYxqeZ5aG/EFYGuVK7+yWIdsDuf2iKg0utAcZ7dWpAcelr9GRAmYz+bwd2M
         SupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bs2fGCCkc2i9GgsvwKl491tj5ookRO+wJSTW2OEqR3M=;
        b=n3QflryAdi7eXldeo/5ail3zRAWqvKSsUs5sioKF3938WvB3z3WOLMP8fNGSSLevWV
         +t/igUSfuyk4gJ2sKNi9XKF1z62DEufzVR+92+vMdLQvsh7NgAeTU5VX6VcB2S0SVDnU
         j49YZec+10vhrSVpAOx3tgRu2E/Ox90AMswHlWVpvJ6eOxJKU+GuJSESxjR4O8/i5v30
         VGSv0Zf4cAbdpVNO0K08emEEIWQJ0chUEIjENj3BvQKJYHk+rNQNMU53bKtgIE+Rdh9B
         sMtiFvsW9O/lDzEYSwQ+7ip/YYR1iNqStKFjDSa91IunB8i6xpCsiXwvP+iNWz0JP8L2
         44iA==
X-Gm-Message-State: ACgBeo13i8q+TIaiTDHTLCxOHTDbLp7AZQRlMmmttGCjEvRPmwopbURT
        aGsdw1KV+ZbU8wM+VKIVW1woCw==
X-Google-Smtp-Source: AA6agR78Z7HuD7og8dYS+mFbUdm3BH5S3Gw88EcrwaztVepcpvssJmeElwyEOWkYNPDlYQlEuuuWGA==
X-Received: by 2002:a17:907:9491:b0:72f:2827:37c3 with SMTP id dm17-20020a170907949100b0072f282737c3mr16629419ejc.306.1660044136529;
        Tue, 09 Aug 2022 04:22:16 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-188-129-118-148.dynamic.amis.hr. [188.129.118.148])
        by smtp.googlemail.com with ESMTPSA id me25-20020a170906aed900b007317f017e64sm1007581ejb.134.2022.08.09.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:22:16 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lars.povlsen@microchip.com,
        Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/2] dt-bindings: hwmon: sparx5: use correct clock
Date:   Tue,  9 Aug 2022 13:22:08 +0200
Message-Id: <20220809112209.241045-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SparX-5 temperature sensor uses system reference clock and not the AHB bus
clock as indicated by the register information [1].

So, correct the clock description as well the included example.

[1] https://microchip-ung.github.io/sparx-5_reginfo/reginfo_sparx-5.html?select=hsiowrap,temp_sensor,temp_sensor_cfg,clk_cycles_1us

Fixes: f5520753c16f ("dt-bindings: hwmon: Add Sparx5 temperature sensor")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/hwmon/microchip,sparx5-temp.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 76be625d5646..51e8619dbf3c 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -22,7 +22,7 @@ properties:
 
   clocks:
     items:
-      - description: AHB reference clock
+      - description: System reference clock
 
   '#thermal-sensor-cells':
     const: 0
@@ -40,5 +40,5 @@ examples:
         compatible = "microchip,sparx5-temp";
         reg = <0x10508110 0xc>;
         #thermal-sensor-cells = <0>;
-        clocks = <&ahb_clk>;
+        clocks = <&sys_clk>;
     };
-- 
2.37.1

