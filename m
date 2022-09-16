Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D869ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 12:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiIPMJp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 08:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiIPMJo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 08:09:44 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617DE1704D
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 05:09:40 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id y17so43939011ejo.6
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=odQlfFAggBoep0bulEhsQiWvf71yxfezg5yPb2FCPJE=;
        b=DdF20jXfX3RHny4PKdPH07To/UOXczoytVNCt5KtBkNTTiUFXThhjo3SS46w3f5Mq4
         KL+io10y+YRDU94+wtU2ZxQnXOzQ62ud6qAEK0Jt9Rnmti9DYJGdBt2hf7Crp2mHzLdl
         eIn3IPAk3ZV8c/uB+yg0HDcSb0V42TPEfPEfguHa0rw509aivIiwlCpDaKPJ1J9TTxSg
         EA5/+YfHku5DCHCP0PI5sOmpmoJ6zuUr4z1paaldAhm8yx37QHNGAMKpGy25aPMjMoyX
         ckl1JW+I5P1Bfr0J7EvPkDP9cB0cl7HpOMxbLppagpPKhjerWQvA3V7fa0DbpHj3HVr/
         /bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=odQlfFAggBoep0bulEhsQiWvf71yxfezg5yPb2FCPJE=;
        b=fvCg7VF0K9FdcEt/Ouhf2Iu3eBcNytiAQGYhyfXlOjfD4xSaEqKyIBcdnJzKYxeIF/
         etAQqAGrfHy9/4Vc5BbjJHmHiLvmbJretDf+SZkqh6DUsJ09VD+nNHXDu0/TgpOg2lKZ
         1zmZ+OBqi5gjK6uM9UyGsS0QaGGGGSroHCmkDUW2yOmdYHxjeK5jLaN4drfh4nsDqWzs
         Av770yumt54DU6YIW5H8gUe50CJHb03L7HljQTXjeWfAWUDJiF/0/EDAsiRiXBjPR3VJ
         rf4W4UzAltX0Ed5GSWQvP/VXnKHX7qqFR0N05OeyLnlg+xqyH70zbmNVA+nfCw5fl+PK
         sTXQ==
X-Gm-Message-State: ACrzQf1gkMXllNQbekCj6uxyh7PEsO6mhHHqWcZmYKVkgeL2u6hwO8o3
        YBu6WEj7sQ6GzPuLAp3H78o=
X-Google-Smtp-Source: AMsMyM7HoCgpsovcuex1n/Zf/gq9x/QGD+G0XV+PHdh+YEuwGenD2Jg5KWnLhp3guOi7jrpi1Pqa9w==
X-Received: by 2002:a17:907:70a:b0:750:bf91:caa3 with SMTP id xb10-20020a170907070a00b00750bf91caa3mr3399319ejb.711.1663330179239;
        Fri, 16 Sep 2022 05:09:39 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id 9-20020a170906310900b00779cde476e4sm10305590ejx.62.2022.09.16.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 05:09:38 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho): Add dependency on ARCH_ASPEED
Date:   Fri, 16 Sep 2022 13:09:36 +0100
Message-Id: <20220916120936.372591-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The SENSORS_ASPEED is part of the Aspeed silicon so it makes
sense to depend on ARCH_ASPEED and for compile testing.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e70d9614bec2..006af099955f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -393,6 +393,7 @@ config SENSORS_ASB100
 
 config SENSORS_ASPEED
 	tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
+	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	select REGMAP
 	help
-- 
2.37.3

