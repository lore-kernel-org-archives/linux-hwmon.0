Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B47C77B73
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Apr 2023 11:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbjDTLVW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Apr 2023 07:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbjDTLVA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Apr 2023 07:21:00 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30C8B44C
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Apr 2023 04:19:03 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f17edbc15eso5560245e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Apr 2023 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681989485; x=1684581485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4k5Fd94R9nLjCjAwI4E4MAJpGxclTYpMwHmMXByQv0=;
        b=cdLVhWQoxAkHBYdXzMuuUwNvj15Zc8MDSC5ep0imZVcVoFvKyF/XeNtvFIc3omyM0t
         0l2kDkuyMSca5eyhK3Cyzy2Nl0mNt1VrOd1rUDpDRhTZ0nEQtzTxiMf67nn3A4eo572h
         655YJumRKYb8iGxpO94vSuf+XtmE0ukB+WK2Hlo/tWin7aTjC6oITEvKNpbQHMDlJ/Ez
         mg/RXOloIXJPIvk9mH6zz3IbeMLhbUwDgsBntAV1nF37Ag7pSsVYNT6o4nLwDP7yjwf6
         YSdN8XmTqXx7OyUYXXfefLQQvH1YGl4bGJd++JgsHH38R1MKDy+JDyBC0mgJLG+HKURR
         nxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681989485; x=1684581485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4k5Fd94R9nLjCjAwI4E4MAJpGxclTYpMwHmMXByQv0=;
        b=PF+w27UYMDh5FU/JPKBXUFmIi6lD4NZX2YGQt5m/3a7Ee2GC+vARMO9n++BidsMzp3
         q5F4uJ1TuYW+QEgGU3thhEMfjOI2mWMBxQPAdjNqwV2Wl66tOm+afO7BWLWxkgbUehiL
         OSw76aWt6K86Em8dVR6UdIppA7PqNXRUIpex/dnNKmgAmB8MZkmBl0T0Yu7XJ79xnicO
         qPYrUDWJlJhtjmsH4pI7UNCldA9KFRlk5ua/mx/IUPdekZGY1oMZsTFfO2ZNCTepcTRY
         ZyFPwBB43JO/vJw/hNKvwCowwJ+fiS/U6UFKbyk9tj5eaZ+ubE0CCtzGnrgFXWy7dY0n
         P3fw==
X-Gm-Message-State: AAQBX9dTiuJ7tlZ9PLmos7nt7gaAPLheYJo2uVSaq36Xgia9dpL+d+xz
        aMmeXa+K//xgHv2C6DdPLdMz3g==
X-Google-Smtp-Source: AKy350byrrnVOJNt/Cuj6UEUIsfXADX07C+ZOFJV8Pt6UBM80NkWQ8m8g8Ir0J51KPl6jttGn4icrw==
X-Received: by 2002:adf:e84b:0:b0:2fc:37be:af9c with SMTP id d11-20020adfe84b000000b002fc37beaf9cmr986687wrn.71.1681989484931;
        Thu, 20 Apr 2023 04:18:04 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d5043000000b002c70ce264bfsm1680980wrt.76.2023.04.20.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 04:18:04 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (max6639) Add compatible string
Date:   Thu, 20 Apr 2023 13:17:58 +0200
Message-Id: <20230420111759.2687001-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230420111759.2687001-1-Naresh.Solanki@9elements.com>
References: <20230420111759.2687001-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use maxim,max6639 as compatible string for the driver.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
...
Changes in V2:
- None, Updated DT patch
---
 drivers/hwmon/max6639.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 9b895402c80d..ada410bfb7b6 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -618,11 +618,17 @@ MODULE_DEVICE_TABLE(i2c, max6639_id);
 
 static DEFINE_SIMPLE_DEV_PM_OPS(max6639_pm_ops, max6639_suspend, max6639_resume);
 
+static const struct of_device_id max6639_of_match[] = {
+	{ .compatible = "maxim,max6639", },
+	{ },
+};
+
 static struct i2c_driver max6639_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		   .name = "max6639",
 		   .pm = pm_sleep_ptr(&max6639_pm_ops),
+		   .of_match_table = max6639_of_match,
 		   },
 	.probe_new = max6639_probe,
 	.id_table = max6639_id,
-- 
2.39.1

