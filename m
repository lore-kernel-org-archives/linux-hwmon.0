Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB8AC0015E
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 11:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbjGZLgZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 07:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbjGZLgY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 07:36:24 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3BE11F;
        Wed, 26 Jul 2023 04:36:22 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id ca18e2360f4ac-78bb3ff7cbcso133341139f.3;
        Wed, 26 Jul 2023 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690371381; x=1690976181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRk8jNKW91M6F3IDdxzdEP7tlLU/kkiuv6RO5d+Ih7A=;
        b=GdXuUHFLj3Su3OIEi1+R+uvvOko8WLt5AZIEmNMq7+btM3rpN2Z553+sH/hR6AMK9+
         PIOCkiYQk5+S611dqh8vg651hkD8RMP+deIXrMtXUXH30hoV0sNSo79JHtucj6q1j/88
         WeR2H6BK8kcko//k6hPgCfUvApgzEAZdtCxaYHjhohskuVOCfgi2zabI0lmeC/EVu74p
         TcT85HX0hK8T7Rr/vhqPMne/Eylnt79ZeEOSYjdcN1NHxeThN0Qpvy4QHv3KhXTo8zmu
         hRho01UspN9k2W5G0x9UDOkYfVPkd4CPiRHDNuiyiilaxM2JcgQ3BSQ7E8GMstA4/Nnf
         vkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690371381; x=1690976181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRk8jNKW91M6F3IDdxzdEP7tlLU/kkiuv6RO5d+Ih7A=;
        b=hb4o/HhvlLwFZYVOxkuJLqL1p77IA2G/Q1qggRp44FxNvgEBgcVxaAfFb3XFDmI8g5
         GdHStVg4fEaKeO4drpYLc1PVdFOHN2QF53UmkG+ie2c99i5cpVsDqBlMe4jnvji0maqD
         Au7yT5KXpupC8UxPDOvnhg/tl6sGZ0dJxekiRn0x9LnItGbzHD9cw7UOoyIJdTQLi7IR
         NWBH4ZnE3YZD1j7/FT+WYe0pXAtUSg2UdzfmpXBaUxgh1bzT7cVmbmwNXuQr3f4y3KlU
         oFp/Q98ucpUNPe6xHONXrKHCNIl5h+oBxs7vEDHUXagv5vagUDY7hqdcTiFkBQsw2RC+
         aOlg==
X-Gm-Message-State: ABy/qLb4Zy3w/tbP5zUd5k+rBwlxDOY0VNaWKLvvEhCNdTPckl8peTl+
        3G2ZCnD+4cW3OCP5wyHjjkY=
X-Google-Smtp-Source: APBJJlHngcP7NQJ5LDfs/E021VVff/0dHn0pIm5QixofeIytHZ0EUvcXYkTmcoUv3iPmuMwy85unXQ==
X-Received: by 2002:a05:6602:42ca:b0:783:63ac:25cf with SMTP id ce10-20020a05660242ca00b0078363ac25cfmr1707717iob.7.1690371381281;
        Wed, 26 Jul 2023 04:36:21 -0700 (PDT)
Received: from ws-565760.systec.local ([212.185.67.148])
        by smtp.gmail.com with ESMTPSA id i21-20020a02cc55000000b0041627abe120sm4111476jaq.160.2023.07.26.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 04:36:20 -0700 (PDT)
From:   werneazc@gmail.com
X-Google-Original-From: andre.werner@systec-electronic.com
To:     jdelvare@suse.com, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] hwmon: (hs3001) Fix unused variable compiler warning
Date:   Wed, 26 Jul 2023 13:36:05 +0200
Message-ID: <20230726113605.13966-1-andre.werner@systec-electronic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Andre Werner <andre.werner@systec-electronic.com>

Delete unused variable in drivers probe function.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307261819.VMDuxZOM-lkp@intel.com/

Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
---
---
 drivers/hwmon/hs3001.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/hs3001.c b/drivers/hwmon/hs3001.c
index 17c3455922eb..9972f6bbb22a 100644
--- a/drivers/hwmon/hs3001.c
+++ b/drivers/hwmon/hs3001.c
@@ -193,7 +193,6 @@ static int hs3001_probe(struct i2c_client *client)
 	struct hs3001_data *data;
 	struct device *hwmon_dev;
 	struct device *dev = &client->dev;
-	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EOPNOTSUPP;
-- 
2.41.0

