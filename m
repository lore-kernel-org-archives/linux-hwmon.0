Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3BFC54EE9
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiIVXfq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiIVXfp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:35:45 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A556C98C94
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:35:43 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id v4so10653627pgi.10
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VeVuH5DZxcKt2sIekJQXHdp/dtUbqaS6ofUWeCmaoxI=;
        b=p+UacrO+Vzhuh+7HkNF+caU18ruUV6cmxneF568mDiFFH7T+3usZ7qfRbPNROe9gc+
         MhOWORKaH+0A5VzQe3GU3sEDChTH9pKU0QtuyrD2UX3dNMHwpvjXw5CER2YosxljvnSq
         Jwd9KVi3U4nQJ80KbEqSVjudhgoWjd+v2rz1AOEoE3xLrL672p08aqXCoyR3vxNRnG5x
         QH/tknXK5aNEMK1IJRzjjFEwtsDsA16KcDw8LnmjEDuAZM5ZHiu9uWpCZ9P2C3F8yGa0
         oKHLDyEiTPYu8komoTnpfM2RoNj5dVSMR4f0TFO6uIhjg/A48WdeHSJ9dK0V2g3HK0qe
         MVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VeVuH5DZxcKt2sIekJQXHdp/dtUbqaS6ofUWeCmaoxI=;
        b=KayQ8pb7bskTPj+FE8R6OJayckKwKsjl/YFmuWB07hIAl6GIf4V7DT/wSpixg4CLAt
         BzmYjxHkBtfN1/uBbhrxcTueNs5f8OSdQYSA3eCm7zyjdiZwevDHf23NOcsVXfHNkomd
         GWg15+QGRFZ9xuQ+ApplJmqG3junyiYUJf4tweIuSs6aSNs+RlhKgj0lgy0zU8BMSYI1
         Ci38L+Bi2AdC4JaBzSHoSVB5MNNC2VNX0on1O2cQ6cqFA4JQQATT+HPnXUYMIqMHVEm5
         2F3yzMQH6fQEhVvN2ELX1X8prxcrQEoQVUnknYJFfRCIMU1Xumj3/9kO17odEB12khgi
         8v4Q==
X-Gm-Message-State: ACrzQf2uhwlpozxAbmyZla+zmKab2QgLZ8TknDllCNVWvxs8OrxJsSZa
        YOqlPhIxJk1p0X6ch8CsFHG/334PiD08IA==
X-Google-Smtp-Source: AMsMyM57smtuPjsIz58VhuCHypqlhyxizeBSsTVEy3/JWezup/iNHPvqQjrlUNQIICj8cnf/xwwBmQ==
X-Received: by 2002:a63:5d4e:0:b0:41d:2966:74e7 with SMTP id o14-20020a635d4e000000b0041d296674e7mr5034753pgm.526.1663889743174;
        Thu, 22 Sep 2022 16:35:43 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id rv3-20020a17090b2c0300b00203ab277966sm357992pjb.7.2022.09.22.16.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 16:35:42 -0700 (PDT)
From:   Li Zhong <floridsleeves@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v1] drivers/hwmon/adm9240: fix data race in adm9240_fan_read
Date:   Thu, 22 Sep 2022 16:33:56 -0700
Message-Id: <20220922233356.1712262-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In
adm9240_read()
  adm9240_fan_read()
    adm9240_write_fan_div(),

it assumes that the caller of adm9240_write_fan_div() must hold
data->update_lock. Otherwise, it may cause data races when data is
updated by other threads.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/hwmon/adm9240.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 483cd757abd3..d93ae3147994 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -501,6 +501,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
 
 	switch (attr) {
 	case hwmon_fan_input:
+		mutex_lock(&data->update_lock);
 		err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
 		if (err < 0)
 			return err;
@@ -511,6 +512,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
 			if (err)
 				return err;
 		}
+		mutex_unlock(&data->update_lock);
 		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
 		break;
 	case hwmon_fan_div:
-- 
2.25.1

