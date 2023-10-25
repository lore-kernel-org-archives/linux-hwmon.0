Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C272EC25B6B
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 21:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjJYVgy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 17:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjJYVgy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 17:36:54 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E272128
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 14:36:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc04494653so1256135ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698269811; x=1698874611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7J8CQ46sdWmgeVPJtCbfD8hQRmLkBLk5hYiX6M/hw8=;
        b=K/9yNe+aW1wJp0cbxmB3R6w6rlviuP9viejmPSqsQulEmm1SyqMmcTWnkBxwVU4SiW
         ThXC1S5L1BKyVIFPubwQ/JO+fP+Ec+Fwn5EUmkzjMfFcX8h7W93BWrwUBuNhdyySE0GM
         OEdjpobUzQe7/A/1QmWmmv8U0dYE4k8y4NIcm+cgm+Q0PX/h0Z8yVDczDbtMxbz8QJl+
         RQy/v6dviSIqOPCC+zhjCBjBeU5uzUQ6QQvCFUffgZwqqxLWzt7BBFJjQkE1n3Co+4wR
         0tJN5ni+NIlPa7Fjal+R7/vEDZNdXjcKRweUBf/vR0gm5mb+Vq26p4wuzUf4rqbGPFJW
         iBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698269811; x=1698874611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7J8CQ46sdWmgeVPJtCbfD8hQRmLkBLk5hYiX6M/hw8=;
        b=DfwALhVQYeSFHStNzTOtHLCzc/KLgEJKvaTx136z9YNIrBhCywotqM10tBYfhqZnFi
         kWy1NygXauI0DM4Wgk8K9IIWqAlNYLhNmDi02o6HRDVLcVNUUtwhgqOM6mFjdROFwKjg
         kXfdj8wMYHtY6ejMxM3AlEsDFOvsdYBME0SX9m0P5KGgP73PDnFzkngyYoc8pdwIV2ON
         lluxDP4VZUC+J1r4RXLjztGE2Rkup5HeVx3yc7nkx9Har87xcTPy/NiJcju7zvmotBLx
         e1ahtRLVijq6Xu8CdELjDiCmN3dBq+EBwlevEtKuwoJrwdGZFJWQ+oUBOuib510vwNzU
         SbwQ==
X-Gm-Message-State: AOJu0YynxXRysDjCsif0ZZClOUE+rPmL67EiCEhzH4BSY007+vk+qyFX
        rpZT3hYSrYpZyDFOFSkQWUam2zIZ9U8=
X-Google-Smtp-Source: AGHT+IHVrkv/BEAP509uS9xrzwasQihK8tL5tPoKPPyR6gje6vdkOPWIAsMxh3oPrzo6hYFRQNy5ew==
X-Received: by 2002:a17:903:110d:b0:1c9:e508:ad43 with SMTP id n13-20020a170903110d00b001c9e508ad43mr15940042plh.8.1698269810957;
        Wed, 25 Oct 2023 14:36:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902e74600b001bdd7579b5dsm9626717plf.240.2023.10.25.14.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:36:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Ian Nartowicz <deadbeef@nartowicz.co.uk>,
        Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH 2/2] Revert "hwmon: (sch56xx-common) Add automatic module loading on supported devices"
Date:   Wed, 25 Oct 2023 14:36:45 -0700
Message-Id: <20231025213645.832738-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025213645.832738-1-linux@roeck-us.net>
References: <20231025213645.832738-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This reverts commit 393935baa45e5ccb9603cf7f9f020ed1bc0915f7.

As reported by Ian Nartowicz, this and the next patch
result in a failure to load the driver on Celsius W280.
While the alternative would be to add the board to the DMI
override table, it is quite likely that other systems are
also affected. Revert the offending patches to avoid future
problems.

Fixes: 393935baa45e ("hwmon: (sch56xx-common) Add automatic module loading on supported devices")
Reported-by: Ian Nartowicz <deadbeef@nartowicz.co.uk>
Closes: https://lore.kernel.org/linux-hwmon/20231025192239.3c5389ae@debian.org/T/#t
Cc: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sch56xx-common.c | 40 ++--------------------------------
 1 file changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
index 3ece53adabd6..ac1f72580715 100644
--- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -7,10 +7,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
@@ -21,10 +19,7 @@
 #include <linux/slab.h>
 #include "sch56xx-common.h"
 
-static bool ignore_dmi;
-module_param(ignore_dmi, bool, 0);
-MODULE_PARM_DESC(ignore_dmi, "Omit DMI check for supported devices (default=0)");
-
+/* Insmod parameters */
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -523,42 +518,11 @@ static int __init sch56xx_device_add(int address, const char *name)
 	return PTR_ERR_OR_ZERO(sch56xx_pdev);
 }
 
-/* For autoloading only */
-static const struct dmi_system_id sch56xx_dmi_table[] __initconst = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-		},
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(dmi, sch56xx_dmi_table);
-
 static int __init sch56xx_init(void)
 {
-	const char *name = NULL;
 	int address;
+	const char *name = NULL;
 
-	if (!ignore_dmi) {
-		if (!dmi_check_system(sch56xx_dmi_table))
-			return -ENODEV;
-
-		/*
-		 * Some machines like the Esprimo P720 and Esprimo C700 have
-		 * onboard devices named " Antiope"/" Theseus" instead of
-		 * "Antiope"/"Theseus", so we need to check for both.
-		 */
-		if (!dmi_find_device(DMI_DEV_TYPE_OTHER, "Antiope", NULL) &&
-		    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Antiope", NULL) &&
-		    !dmi_find_device(DMI_DEV_TYPE_OTHER, "Theseus", NULL) &&
-		    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Theseus", NULL))
-			return -ENODEV;
-	}
-
-	/*
-	 * Some devices like the Esprimo C700 have both onboard devices,
-	 * so we still have to check manually
-	 */
 	address = sch56xx_find(0x4e, &name);
 	if (address < 0)
 		address = sch56xx_find(0x2e, &name);
-- 
2.39.2

