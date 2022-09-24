Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5929DC04A95
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 00:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiIXASG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 20:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbiIXASG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 20:18:06 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D6812416A
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 17:18:05 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 129so202108pgc.5
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 17:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=dNmY41FSeHwLWx9pzDWHLuLrAuxRIW3iZmu5xCh/RKE=;
        b=M5fw44HT7EXQ6hQak8g8VtBkG8YsUs3vlUmg6tfmCp3NzRmMpndGWZNQHglrzEtWBO
         ccwku72LwSzGkm7MwcnFY5BFelvGHl/P03Bamkum5b6ac5dng7GLHe8MVPCdgBt2xMa4
         iYF/uiGXio4zU4bGbE/KfptX4pYmcKqAi+j0qHjcH29+UrsiuGl+KxBRqyiykkhmjWTk
         clCXWOc0RGPIEwvDk/F0sg4N8M04ysiSLV3m0NROFfedc2o1moktJaKGToln+Aej4Dka
         ozRdsFEURehWq6FmMgAKCzMCpAziHjzDt8ut0kJHhMEn/r4plbzDSZ3MCAVcp6Sx3m8A
         f15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=dNmY41FSeHwLWx9pzDWHLuLrAuxRIW3iZmu5xCh/RKE=;
        b=k+zP1HmhVZrRsYBfGr//aBrXU3c2OsHkk8je8HNuCqPza5q/sIuekTQEgxmwObGh9g
         2q8lv3cjKs//Yd7r1F6oQetkHWkL6tDNtjh83BiYX2wpmpIedvhJQ84WO+paxPxtHA8a
         cTaYrThb5GccJhDMF81tQZzp3568ipw703sw8AD5rByqVuhrgWPGv9Qgp2Y8SLIpz5I0
         /2cWWf08XbB3t+Rw4RhURixJHt/GvJrOTsORdFGb+lhzeUDhTlTsPp5SM/IewjQ/ia2P
         Dl01nzUjbfA6PRS6IKbRoIqH875610FMFuhclk5NYew+qFbMd/+QUVUm5Pnwwm2LkEdB
         IQFg==
X-Gm-Message-State: ACrzQf2jzAInF5FyT0Mg6G/w3h6CrSEg7PzjAx8017aohfwRAnmzjBiv
        Fz9C54gLVEaddXWgBsxSP04xuJBx/70=
X-Google-Smtp-Source: AMsMyM6ZE/1iZTbaKo+4KuZR9/e2eBSnl8ba+77GnJHjefS1YZ3OPLIwEiKpugG3zsvsbA/UjbtdVg==
X-Received: by 2002:a63:7984:0:b0:439:57e4:97a2 with SMTP id u126-20020a637984000000b0043957e497a2mr9970210pgc.191.1663978684211;
        Fri, 23 Sep 2022 17:18:04 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id om12-20020a17090b3a8c00b0020263b7177csm11495864pjb.3.2022.09.23.17.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 17:18:03 -0700 (PDT)
From:   Li Zhong <floridsleeves@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v3] drivers/hwmon/adm9240: fix data race in adm9240_fan_read
Date:   Fri, 23 Sep 2022 17:17:51 -0700
Message-Id: <20220924001751.1726369-1-floridsleeves@gmail.com>
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
 drivers/hwmon/adm9240.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 483cd757abd3..40e3558d3709 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -501,17 +501,23 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
 
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
 		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
+		mutex_unlock(&data->update_lock);
 		break;
 	case hwmon_fan_div:
 		*val = BIT(data->fan_div[channel]);
-- 
2.25.1

