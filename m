Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FC1C6FA8B
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIVXoQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiIVXoN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:44:13 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5F3F9606
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:44:13 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s206so10718465pgs.3
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=zzAQ7miQ9heBZcb18zCMwhTPHTm75W4BR2SXwyh15cg=;
        b=iPfEguRTxwphzIQU+T1Br5r5h9BGMzOxf5Nlpqg5lgSEJVugZt0eltVErfy4it1t2d
         t52HJz3rfYH/r+cy/uqUjSv4xnvV93gYIKDzAi8135Fe7Rvc0s0zrn+M+Cwa8xf1g05S
         G/YiF0c3QtQeFCxX/oMBT7YPluPipvK7kMbDDlrwn0eC0wgPr0EPxBJvcXWNBTEtyz/M
         YFnRQ8q4KYufLA+vsMQ3hUhZ47RdjGefnwCy6+N11GKR+X6z40NI8l8nGYMWJvla+NPG
         q98nPQwPWBJ34/6wXESFXd0VLKpkKxgfB43mmvxO9Y8HnwlfM1UXSP5Jh7C/GCM9pqjB
         i9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=zzAQ7miQ9heBZcb18zCMwhTPHTm75W4BR2SXwyh15cg=;
        b=kgXqgzb68COtTD+s92HT0cF1n+3bZJrCruUBbAToZieuZ05C/0NjdbftxYJG/+3D47
         RD+BHd4CiQbKr1PCjtia2Ur1t4cdQU3NXDAbLiLA4V6cGmIYkrPT7zDjI9SGgqEDIklw
         vxchsaPsFZkcnrxmgqBzdbpYCYK4+KTLsXEAyGFaxyPEpFpi+3w07FZHw9C2YDEzVJ/G
         9DtK9DTgjgkDpSEUrQw5bqEcblOCS3z5zp5th8HVPS3zhHWFjlC9EAtHA16ieC40at1L
         dnlD1Uk9wTcPf506XY4yt/7bkXiqjKtrhb3NwZyfCRbcpp8xROovtx1kGpsRPP16u0d9
         ehgg==
X-Gm-Message-State: ACrzQf3Lct/laEP/srPS6/nFka73XxZQKPENDMkIwtBEUwuQEOHSPJAR
        vhAWeiE8ekuRctxKNlkPIhoMRr/uu/LwvQ==
X-Google-Smtp-Source: AMsMyM5yaCCDNGlPu89O7tRScdbjmxt6WCwCtnegS3ll8cTb7W71Sxs1+gHpI+qbE3L/vGj+Srqy/A==
X-Received: by 2002:a63:5a46:0:b0:434:e36b:438f with SMTP id k6-20020a635a46000000b00434e36b438fmr5124176pgm.351.1663890252385;
        Thu, 22 Sep 2022 16:44:12 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id o18-20020a17090aeb9200b001fb47692333sm342641pjy.23.2022.09.22.16.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 16:44:11 -0700 (PDT)
From:   Li Zhong <floridsleeves@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v2] drivers/hwmon/adm9240: fix data race in adm9240_fan_read
Date:   Thu, 22 Sep 2022 16:43:48 -0700
Message-Id: <20220922234348.1714344-1-floridsleeves@gmail.com>
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
v2: add mutex_unlock() in error handling

 drivers/hwmon/adm9240.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 483cd757abd3..d58999e186dc 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -501,16 +501,22 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
 
 	switch (attr) {
 	case hwmon_fan_input:
+		mutex_lock(&data->update_lock);
 		err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
-		if (err < 0)
+		if (err < 0) {
+			mutex_unlock(&data->update_lock);
 			return err;
+		}
 		if (regval == 255 && data->fan_div[channel] < 3) {
 			/* adjust fan clock divider on overflow */
 			err = adm9240_write_fan_div(data, channel,
 						    ++data->fan_div[channel]);
-			if (err)
+			if (err) {
+				mutex_unlock(&data->update_lock);
 				return err;
+			}
 		}
+		mutex_unlock(&data->update_lock);
 		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
 		break;
 	case hwmon_fan_div:
-- 
2.25.1

