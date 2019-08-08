Return-Path: <SRS0=ExcQ=WE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1B3C41514
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Aug 2019 19:13:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D504521743
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Aug 2019 19:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoGUOxsE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404034AbfHHTNb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Aug 2019 15:13:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42784 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405195AbfHHTN0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Aug 2019 15:13:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so44613649pff.9
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Aug 2019 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=x9aVoBCcUzhgUwC3Nxl3unG+0lM/tnNGfGwCyeSNY4A=;
        b=SoGUOxsEoEBpLh5wrYk6xSxm4mXrxcYX3UCf//haMSFRYWm0U22uRl8da8oPdc06hO
         w3jCDycY5LgIFHDN5RrtE8kHDe7RtRIRZBAR6Dp3Q1soSG/pskUqoxXARLeptAtgNXqQ
         tscAfsnoJf186pXFK0ju3cRloztvjen0cio+XPaNG7+VoGfehtWIWa4HrCvy4WJiOFMw
         FYBmQsxd7D156umPqNFRwACBKlipxG4uepYo3yF70aeTUDoCv8p7k4K6h2fmGz9pdr3A
         z6vdstf1wsA9WAd6uFzXDH3zYgba0sABQTchYpcmUGktNWt8uH16gCZWxdf1Faukg/fJ
         rWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=x9aVoBCcUzhgUwC3Nxl3unG+0lM/tnNGfGwCyeSNY4A=;
        b=clcTHWAi9xzeqbGXtz0Kei+QjM2/rkHRXmURikkTNiJHvqNHcoRULarXr5O7jMJCD1
         OaBqS18Q0GNO1qxlBpUW8cJJFNgekngIS+jYuLTnhLCa2QOnnxR902zm7+0wuLEWn2e8
         IbaE31+G0F3+8xq2TJ+vccMZOsvCEnjjZayFjQHBNl2CEIvUpiQc53xquBgI7ljd3rkn
         vsDFwlKtYE9XvMy9rAqvT20XZpvgrmbdIigd8CBj/G5/xRB3F7Laf4BQyNHLMJhfJZEF
         c3Wi1c9tt0alN0+OB95+G5iwdlZXBAVq7lcXxNkhagM9sAtgBlo+3zJtZluZuKJFvKAi
         nz1Q==
X-Gm-Message-State: APjAAAXR6VuQjsoxXEGWxEOJL1GyztBfpt4+MeybV1WuTenbVcVANLKv
        KqUhb3toHz49ddxqc/01V8pdEMpYL3s=
X-Google-Smtp-Source: APXvYqx41z+eTYkGFUT6pPWG1r3F/HJ2aBCzQOJtsItIogNIW7oh4N0hrcnvcDVTjeo+eXcX97dpLg==
X-Received: by 2002:a17:90a:d998:: with SMTP id d24mr5511506pjv.89.1565291605807;
        Thu, 08 Aug 2019 12:13:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm2796108pjs.31.2019.08.08.12.13.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 12:13:24 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH] hwmon: (lm75) Fix write operations for negative temperatures
Date:   Thu,  8 Aug 2019 12:13:22 -0700
Message-Id: <1565291602-10505-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Writes into limit registers fail if the temperature written is negative.
The regmap write operation checks the value range, regmap_write accepts
an unsigned int as parameter, and the temperature value passed to
regmap_write is kept in a variable declared as long. Negative values
are converted large unsigned integers, which fails the range check.
Fix by type casting the temperature to u16 when calling regmap_write().

Cc: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Fixes: e65365fed87f ("hwmon: (lm75) Convert to use regmap")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index ce5ec403ec73..cbabab7ac788 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -154,7 +154,7 @@ static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
 	temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
 				 1000) << (16 - resolution);
 
-	return regmap_write(data->regmap, reg, temp);
+	return regmap_write(data->regmap, reg, (u16)temp);
 }
 
 static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
-- 
2.7.4

