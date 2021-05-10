Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE9EC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6F7461107
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhEJPZR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 11:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbhEJPYm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 11:24:42 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A37C046877
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:00:47 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id d21so16011987oic.11
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tav2EQOV4J2QvZxel0hKu+2PFR/JWCAUNdMBY9i4974=;
        b=seUxJkc7TBq1H2iXT/4NMgGnEDd1IniFHj4DY9a/5Vml0ULTzq9vjR8YXmfItqGUmC
         38TovaNlEZbIKhvexavrs1CQacsIn1jDBVaFudCZ36SccWP2dTU95hZW4eCiKqURQG1W
         JpK9PW2yKDZbFOf1golrrCOe91QlE8vaCW3IlZUsrMevvh5utLVw/eZDR5oeWL0X4Xz9
         JCembxd09mTy9LUMlUhja82zuJ1f+gzz2ii3nDIq2gisF7ZBFmcyCGsbEt5E0VJeiWh1
         pKj0IyLEZa1lQUm7/n3Yok5mgyc7DqXTqhwAEQT/ADV8h53knY82ScNp78Tx61t102Cl
         A5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tav2EQOV4J2QvZxel0hKu+2PFR/JWCAUNdMBY9i4974=;
        b=DeeRhF6ymfM+qAc9fdZxLWn0v6YL3UpuNBFF/o2ojaA8b8i+hA43Ohkm0zRl51oU1r
         wXixEnBsqeI6weSCVyVPd9zLIvQBm8AfO9at0GDhmWOA5NWs6N91Spseok08b/NS2yaf
         8dnN1gv9p0ZsIZbnCumX8/8cWbJVsWLbL2eMKKqaHh/xzI7hDK0HwNUC39h2/PiOIgQ5
         4kF4isTEkc/0gRFZFyThTHoX/3dj7NPRTbGh/rOz6UCgXGmeENCl2bUqzwJ5HEacUBpR
         zb2HxbuQZtkKvkzRFWTCcKQZW4QhKB7z39XMV4ZfMmtM0SD2mbcSf2XEdz+KiWYGbPpL
         dHcw==
X-Gm-Message-State: AOAM533TsVaKxTFF3HOny0zByCXWvylEc1ntTtzyDKfSVYUIYFdtAouN
        vIvZLmWDt1hexYzNgiuC9MTyM9XRMVM=
X-Google-Smtp-Source: ABdhPJxv2y2QD+9BiZkuX0J6T2j3WbCmNf+i3Kju7KZynrnlTeKtMXWBrTT0LngK0gtsRSEO67588A==
X-Received: by 2002:aca:c1d4:: with SMTP id r203mr1846510oif.176.1620658847046;
        Mon, 10 May 2021 08:00:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm2622545oiv.19.2021.05.10.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:00:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (max31722) Remove non-standard ACPI device IDs
Date:   Mon, 10 May 2021 08:00:44 -0700
Message-Id: <20210510150044.1932083-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Valid Maxim Integrated ACPI device IDs would start with MXIM,
not with MAX1. On top of that, ACPI device IDs reflecting chip names
are almost always invalid.

Remove the invalid ACPI IDs.

Fixes: 04e1e70afec6 ("hwmon: (max31722) Add support for MAX31722/MAX31723 temperature sensors")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31722.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/hwmon/max31722.c b/drivers/hwmon/max31722.c
index 062eceb7be0d..613338cbcb17 100644
--- a/drivers/hwmon/max31722.c
+++ b/drivers/hwmon/max31722.c
@@ -6,7 +6,6 @@
  * Copyright (c) 2016, Intel Corporation.
  */
 
-#include <linux/acpi.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/kernel.h>
@@ -133,20 +132,12 @@ static const struct spi_device_id max31722_spi_id[] = {
 	{"max31723", 0},
 	{}
 };
-
-static const struct acpi_device_id __maybe_unused max31722_acpi_id[] = {
-	{"MAX31722", 0},
-	{"MAX31723", 0},
-	{}
-};
-
 MODULE_DEVICE_TABLE(spi, max31722_spi_id);
 
 static struct spi_driver max31722_driver = {
 	.driver = {
 		.name = "max31722",
 		.pm = &max31722_pm_ops,
-		.acpi_match_table = ACPI_PTR(max31722_acpi_id),
 	},
 	.probe =            max31722_probe,
 	.remove =           max31722_remove,
-- 
2.25.1

