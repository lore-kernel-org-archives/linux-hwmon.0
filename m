Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D3EC0032E
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 21:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJYVgx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 17:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjJYVgw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 17:36:52 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AAF128
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 14:36:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c9b95943beso1364875ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 14:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698269810; x=1698874610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf5azx0PONnzkDWlbusbeCRslK/CZDAHKo7vJp94sUo=;
        b=RtUMH8IzlmBD7gB+5Cr+yUsIHBQB9iJKV3dXpmzIoWnW9gTtfiPmGx0xzREVnUsFto
         92BG4n7eMJu6OOBkg9TCYtOqlMkV7c4dh4gtGM5Lk+8d4wsyNVBj+k5YKyesyHb9RNyo
         qZeMBgqRkvNzGFq4lX7/xUeLvXx30+bitVbQFEBtLkxAuqHkLGI5WV407DJpW65McZFg
         u9iGEbl08U2m7TPxt82lHqUYdTLngkjmjIIX5xzOjG36FTRiL1+Xt2Zk9FD6+mR3HGYc
         kEr49MnHPtHFLPqOQ2/zS07GSI8KvyeQ8X7txKSCuJSsWjfPXwisayvp6z+7SE8SkPnu
         YKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698269810; x=1698874610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kf5azx0PONnzkDWlbusbeCRslK/CZDAHKo7vJp94sUo=;
        b=JOhfsWbEUmm5Ay/DW3R9pUNNrvXgRzhqs2yQysQ/jKrpQa2TG25SfTMZzVw9L8d1SK
         PvAv8oQcYczcka08uAZoHIM1VYoqk6TQGMl8cziFq9cM/L8IMPxQEyqUHFkBD+3BDzFY
         amxZiimSqWeaRomK6b3BwujMGFDouPqZ+DkI8Z+MCSAzBxxCJVANf/47vHVJ9uiaQ4zg
         83hGNDJpYoogr3XUKziW+fS61m8I21z/x0Oh3Ci0NuvM5cxxIFfm940BATUMOwsY4nWJ
         QoZPQ4TWbdVbSoqKOmL0+hm8aqcgUH//UdInT99HoyjFnlTiLuZ9KGJ+taFHKi4wFcWd
         +Jlg==
X-Gm-Message-State: AOJu0YyMb3ENpnMblzl46elkkmQmSXuxHE2DXPGOyz5uIMsjAw8gWhzq
        /kCR04IBi9zRWLUaJzh4IilhHzXTl4o=
X-Google-Smtp-Source: AGHT+IHvzFUsrz6H4aQgq/VF5s4iRcPlSxOVafbqGY9i6vTgEo6vxOzYEpH9R0aVx6gnMg9c4zIerw==
X-Received: by 2002:a17:903:2846:b0:1c9:cc88:5029 with SMTP id kq6-20020a170903284600b001c9cc885029mr15768517plb.32.1698269809700;
        Wed, 25 Oct 2023 14:36:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902cec400b001c60d0a6d84sm9622017plg.127.2023.10.25.14.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:36:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Ian Nartowicz <deadbeef@nartowicz.co.uk>,
        Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH 1/2] Revert "hwmon: (sch56xx-common) Add DMI override table"
Date:   Wed, 25 Oct 2023 14:36:44 -0700
Message-Id: <20231025213645.832738-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This reverts commit fd2d53c367ae9983c2100ac733a834e0c79d7537.

As reported by Ian Nartowicz, this and the preceding patch
result in a failure to load the driver on Celsius W280.
While the alternative would be to add the board to the DMI
override table, it is quite likely that other systems are
also affected. Revert the offending patches to avoid future
problems.

Fixes: fd2d53c367ae ("hwmon: (sch56xx-common) Add DMI override table")
Reported-by: Ian Nartowicz <deadbeef@nartowicz.co.uk>
Closes: https://lore.kernel.org/linux-hwmon/20231025192239.3c5389ae@debian.org/T/#t
Cc: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sch56xx-common.c | 44 ++++++++--------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
index de3a0886c2f7..3ece53adabd6 100644
--- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -523,28 +523,6 @@ static int __init sch56xx_device_add(int address, const char *name)
 	return PTR_ERR_OR_ZERO(sch56xx_pdev);
 }
 
-static const struct dmi_system_id sch56xx_dmi_override_table[] __initconst = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CELSIUS W380"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ESPRIMO P710"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ESPRIMO E9900"),
-		},
-	},
-	{ }
-};
-
 /* For autoloading only */
 static const struct dmi_system_id sch56xx_dmi_table[] __initconst = {
 	{
@@ -565,18 +543,16 @@ static int __init sch56xx_init(void)
 		if (!dmi_check_system(sch56xx_dmi_table))
 			return -ENODEV;
 
-		if (!dmi_check_system(sch56xx_dmi_override_table)) {
-			/*
-			 * Some machines like the Esprimo P720 and Esprimo C700 have
-			 * onboard devices named " Antiope"/" Theseus" instead of
-			 * "Antiope"/"Theseus", so we need to check for both.
-			 */
-			if (!dmi_find_device(DMI_DEV_TYPE_OTHER, "Antiope", NULL) &&
-			    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Antiope", NULL) &&
-			    !dmi_find_device(DMI_DEV_TYPE_OTHER, "Theseus", NULL) &&
-			    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Theseus", NULL))
-				return -ENODEV;
-		}
+		/*
+		 * Some machines like the Esprimo P720 and Esprimo C700 have
+		 * onboard devices named " Antiope"/" Theseus" instead of
+		 * "Antiope"/"Theseus", so we need to check for both.
+		 */
+		if (!dmi_find_device(DMI_DEV_TYPE_OTHER, "Antiope", NULL) &&
+		    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Antiope", NULL) &&
+		    !dmi_find_device(DMI_DEV_TYPE_OTHER, "Theseus", NULL) &&
+		    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Theseus", NULL))
+			return -ENODEV;
 	}
 
 	/*
-- 
2.39.2

