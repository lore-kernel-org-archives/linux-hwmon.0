Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC734EB64D9
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Jul 2023 21:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjGBVAD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Jul 2023 17:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGBVAD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Jul 2023 17:00:03 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435D5E50
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Jul 2023 14:00:02 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b7ffab7ff1so20908145ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Jul 2023 14:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688331601; x=1690923601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IF21B3Kw1hUvPkMwJQxUhuKwCvu6c0u2QIIKe9KSUCY=;
        b=ESFCTh3TSy1aEuAFxcgfympnkDIh0hzRCA28wvomespHSkHxNI8dwOIWxYdpQK6C+N
         pbnpknViekOEb8VUPOQqmlbX56T65EnZZL/b1Znu9tpRWDCh+nidJqzVehnsScOZI6Fa
         xyAl9hNByDzOkKw6sY703eR507XswyuinJKrHv5YItRtB0IFNZKpOB6RKtrk9KevpGxf
         +UjesUYlXqO10JCh7AT4BSojJzEsJkahIhy9WG2AM9durJlYgi2E9wjo1ygWXYQV39Z9
         i0dpQZ7bcWQOrLqyEK/f12EMM7ERq4eny1bCf59TRv0hsIrcHPHZ91nruNTbu1pytsX6
         kaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688331601; x=1690923601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF21B3Kw1hUvPkMwJQxUhuKwCvu6c0u2QIIKe9KSUCY=;
        b=aGlZLrr5XrrgEropufqoQWNp7Ptd0Q4S4G8GvXWRYfbB6c+3q3KpqSmLUFimH1cMYH
         xlU29gTic6ztu/+sqKr8wi2sgRln4MkSngZotHsBIDebxdO/fIqpoWyIUkNYCbHYTbKX
         HvrexXZUcMJ6hl/MxYm2MM8CCBVYu1kHuBthiGsY/mhT25CBc5XUGN2ynhuwF5nEEFIF
         HBmY5YCBvlxkpdSZhAt0utDXTH0csf1tjBgNtxc98O8ocl/L8mviTAew8rdnN67uBA4K
         1Lgoe76x14tLgaa31ux+UX4BGrbQSsvGLoiC9fQvGGADs+l3kYHz4ipJ0QH3nQcAhfYF
         TaWA==
X-Gm-Message-State: ABy/qLbTUFT+hnAaNEKDpQQbQcOoZhZQSzTOHnR2DAOwZowX7bXUMJAj
        frvgMyg4R/97iN9VHYjoQxoQlOblDa0=
X-Google-Smtp-Source: APBJJlH2wMmkdlDR0S5UMGhcrUvQuBx+iChWt1up3f+DobkAZvywgZCPKcT5Oemj7l7ujU/QwDhTKg==
X-Received: by 2002:a17:902:8f87:b0:1a6:45e5:a26a with SMTP id z7-20020a1709028f8700b001a645e5a26amr4657565plo.27.1688331601274;
        Sun, 02 Jul 2023 14:00:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id je4-20020a170903264400b001b679ec20f2sm13949841plb.31.2023.07.02.14.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 14:00:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus) Fix some checkpatch warnings
Date:   Sun,  2 Jul 2023 13:59:57 -0700
Message-Id: <20230702205957.3788702-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Checkpatch reports bad multi-line comments and a missing blank line
after a variable declaration.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 9d14954da94f..ba1ea06dfc63 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -40,8 +40,7 @@ struct pmbus_sensor {
 	enum pmbus_sensor_classes class;	/* sensor class */
 	bool update;		/* runtime sensor update needed */
 	bool convert;		/* Whether or not to apply linear/vid/direct */
-	int data;		/* Sensor data.
-				   Negative if there was a read error */
+	int data;		/* Sensor data; negative if there was a read error */
 };
 #define to_pmbus_sensor(_attr) \
 	container_of(_attr, struct pmbus_sensor, attribute)
@@ -1423,8 +1422,7 @@ struct pmbus_limit_attr {
 	u16 reg;		/* Limit register */
 	u16 sbit;		/* Alarm attribute status bit */
 	bool update;		/* True if register needs updates */
-	bool low;		/* True if low limit; for limits with compare
-				   functions only */
+	bool low;		/* True if low limit; for limits with compare functions only */
 	const char *attr;	/* Attribute name */
 	const char *alarm;	/* Alarm attribute name */
 };
@@ -3193,8 +3191,8 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 {
 	struct pmbus_data *data = pdata;
 	struct i2c_client *client = to_i2c_client(data->dev);
-
 	int i, status, event;
+
 	mutex_lock(&data->update_lock);
 	for (i = 0; i < data->info->pages; i++) {
 		_pmbus_get_flags(data, i, &status, &event, true);
-- 
2.39.2

