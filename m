Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C1BC43460
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5E0761107
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhEJPZP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 11:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237899AbhEJPYX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 11:24:23 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15B2C06129E
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:00:24 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso14667730otn.3
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvMCFvQ9tkKu2Ir50TNoDxiDbNdlZon7ejGNGef7/p4=;
        b=kozrNdCUGyfgitLjQffnBM++4al8CADuaQijAlvn/isIpduqMZgtU0wDIuO7gKX69o
         +0Pe4DERuIamAyTZXrTHHEbt8TLU/9hGf0CKLh34vC97qlDeZWxDR01iMWBxP4H6Cjmy
         CTxaAQZjktWNYlM5L6AfOJmWtgNdLxJuJmfxY3ieGTbNu6tSN+CSzI3vn025ESS1YmdK
         wz7KTbDUSoK1i6kqb8aouPaqSnAmVsOm8AyU5A0d9Cr+sWFNfq5fOY8fwf5i1CO7fk+/
         OgDB1JkhPe7riPYiq4AX/BdjJkBNu05GgimNgzNucUPnB4a+fg4x5mZkpnF3alW3KgTS
         B7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=jvMCFvQ9tkKu2Ir50TNoDxiDbNdlZon7ejGNGef7/p4=;
        b=iu16pJhrZKLTE5sUw5pNSVfV0ItY5iqd8QgxEmfege+KYXfaYG4IbFCnYRKXY2J1fc
         ub6heqc1UIkjlem4W/uabMhQZfcrC7cYjAH8FK8P6n9RF4OGxuXqHvG7Bth2zzYjIc+G
         y1eyP5nzWCtpHhcDC2eno6L8PuTtNiZPnVePJQ/Je7bOy/OAKe6xJ/wchfuEfg3Z/G1p
         9D7TN0uvQiJbx8OlQ7v7Vn1F05lnqkaoIF2SNl1QQUwUzDxbkP4ebE4JdjVL1TuMgNE4
         mA3F9qndboD2UTWXjgWWQkZAu8oNdTblSoYPprILWgMZps4u0Bu71ooffGNh+mOtCmM+
         9a3g==
X-Gm-Message-State: AOAM533uLjLa2xMvYAahKzME60NXROwHUJyAFy/VSizCnl13uybj4APK
        4PjgJLCGbiodIR9vKbvn6B5b3sLubTI=
X-Google-Smtp-Source: ABdhPJy3wGC212BX/2BRBzGeutHsIbHchWT56kYO5eoNNPj60AZ/XoYh4g/zIe06IgwMi52K991K1Q==
X-Received: by 2002:a9d:6242:: with SMTP id i2mr21396589otk.273.1620658824011;
        Mon, 10 May 2021 08:00:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm3154530otu.79.2021.05.10.08.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:00:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrej Picej <andpicej@gmail.com>
Subject: [PATCH] hwmon: (lm70) Revert "hwmon: (lm70) Add support for ACPI"
Date:   Mon, 10 May 2021 08:00:21 -0700
Message-Id: <20210510150021.1914044-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This reverts commit b58bd4c6dfe709646ed9efcbba2a70643f9bc873.

None of the ACPI IDs introduced with the reverted patch is a valid ACPI
device ID. Any ACPI users of this driver are advised to use PRP0001 and
a devicetree-compatible device identification.

Fixes: b58bd4c6dfe7 ("hwmon: (lm70) Add support for ACPI")
Cc: Andrej Picej <andpicej@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm70.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index 40eab3349904..6b884ea00987 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -22,10 +22,10 @@
 #include <linux/hwmon.h>
 #include <linux/mutex.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/acpi.h>
 
 #define DRVNAME		"lm70"
 
@@ -148,29 +148,6 @@ static const struct of_device_id lm70_of_ids[] = {
 MODULE_DEVICE_TABLE(of, lm70_of_ids);
 #endif
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id lm70_acpi_ids[] = {
-	{
-		.id = "LM000070",
-		.driver_data = LM70_CHIP_LM70,
-	},
-	{
-		.id = "TMP00121",
-		.driver_data = LM70_CHIP_TMP121,
-	},
-	{
-		.id = "LM000071",
-		.driver_data = LM70_CHIP_LM71,
-	},
-	{
-		.id = "LM000074",
-		.driver_data = LM70_CHIP_LM74,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, lm70_acpi_ids);
-#endif
-
 static int lm70_probe(struct spi_device *spi)
 {
 	struct device *hwmon_dev;
@@ -217,7 +194,6 @@ static struct spi_driver lm70_driver = {
 	.driver = {
 		.name	= "lm70",
 		.of_match_table	= of_match_ptr(lm70_of_ids),
-		.acpi_match_table = ACPI_PTR(lm70_acpi_ids),
 	},
 	.id_table = lm70_ids,
 	.probe	= lm70_probe,
-- 
2.25.1

