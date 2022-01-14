Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81691C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243421AbiANQf1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243405AbiANQf0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:26 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF9EC06161C
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:26 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id z25-20020a0568301db900b005946f536d85so1633049oti.9
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tK7zr05/ZSG5n32Cz99AkHg2XcDrMWtHo8IT0Z/LPcQ=;
        b=UUizvoY1bvpSUwbGJ06Llnr1n4soqRtsmBw1ib/3LWkg2HZovpfkxLxVeiqE+hLg0/
         lwv/NobctteVpsBahZPFloiSLzF/vMr3x6QGUHAqK/bEi84UHBk3Gs34YDik/2BABX0R
         MG3U8eVkog0eFmY5K3jGxeAxgELl8rveFuvEYksFxR9+/sm2wb1MB4RUxtet5n7BH+KK
         +9iPjbh2mdJgrN9oSbM9CIkmmhtqI0G7x8R8yqU8gZECuoi8+cqsUp6cWBPxbAgRiDul
         JmHQ4D7Ny12hbRUrpDR5SvtNcdDbjEgw4rcExCF7qODk1KNYLyjwuaALgVJ7p1+HXSww
         dFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=tK7zr05/ZSG5n32Cz99AkHg2XcDrMWtHo8IT0Z/LPcQ=;
        b=uv2rdUgwPe5aX1KcY7r0jJYVglG1WSC+OGPxxVfsBKUJlGyw4c7+OaDyWwmxm89Ugs
         HczG6bFINfYpmBkvO9GDpRPZ1dMuzOPDlKZcgPbPxohxA7DZQzJHKzCKJ53VIAqKTxS4
         fJtc9+abBMyLMUozAufSIQq35IIC8q8F+o/BI/wjtj8Zl4/KxnkCtEi7jlFnQoGfcp5L
         H+CRP96NA+70uiqtKWv+j5B/i6HVWvmS3YDEonauu2OFzb1Zm0QaVs/WYfZaZuih7U3A
         vjjstG+TacsFSQnpZhcINuy52ebMD590EcRbYjyz1Ve82xj5TJiFIu4/7D4Lsl3fAyzy
         cesg==
X-Gm-Message-State: AOAM533LpvMaw5mKllFqv1ZIAcp+wSS8bSKGJP4HzxCfhOOhEWbxLVCM
        cDiu0YMEUxu8V5l/rRCjdRpnxaZQHkE=
X-Google-Smtp-Source: ABdhPJyXSr6Ew/q4t87ZoDG4fLOOCnun44cLna039CabIX9TbS1IZL+J3EZ72Hz2MTEvq8SeylbIzw==
X-Received: by 2002:a05:6830:441f:: with SMTP id q31mr7756083otv.14.1642178125586;
        Fri, 14 Jan 2022 08:35:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z188sm2017544ooa.8.2022.01.14.08.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/8] hwmon: (lm83) Replace temperature conversion macros with standard functions
Date:   Fri, 14 Jan 2022 08:35:09 -0800
Message-Id: <20220114163512.1094472-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace TEMP_FROM_REG with direct calculation and TEMP_TO_REG
with standard functions/macros.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index c9605957e400..434bd5b903d2 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -66,17 +66,6 @@ enum chips { lm83, lm82 };
 #define LM83_REG_R_TCRIT		0x42
 #define LM83_REG_W_TCRIT		0x5A
 
-/*
- * Conversions and various macros
- * The LM83 uses signed 8-bit values with LSB = 1 degree Celsius.
- */
-
-#define TEMP_FROM_REG(val)	((val) * 1000)
-#define TEMP_TO_REG(val)	((val) <= -128000 ? -128 : \
-				 (val) >= 127000 ? 127 : \
-				 (val) < 0 ? ((val) - 500) / 1000 : \
-				 ((val) + 500) / 1000)
-
 static const u8 LM83_REG_TEMP[] = {
 	LM83_REG_R_LOCAL_TEMP,
 	LM83_REG_R_REMOTE1_TEMP,
@@ -181,7 +170,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", TEMP_FROM_REG((s8)regval));
+	return sprintf(buf, "%d\n", (s8)regval * 1000);
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -198,7 +187,7 @@ static ssize_t temp_store(struct device *dev,
 	if (err < 0)
 		return err;
 
-	regval = TEMP_TO_REG(val);
+	regval = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
 	err = regmap_write(data->regmap, LM83_REG_TEMP[attr->index], regval);
 	return err ? : count;
 }
-- 
2.33.0

