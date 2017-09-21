Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:50730 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753064AbdIURUi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2017 13:20:38 -0400
Received: by mail-pg0-f53.google.com with SMTP id p5so3867190pgn.7
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2017 10:20:38 -0700 (PDT)
From: Hoan Tran <hotran@apm.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        kdinh@apm.com, patches@apm.com, Hoan Tran <hotran@apm.com>
Subject: [PATCH 1/2] hwmon: xgene: Support hwmon v2
Date: Thu, 21 Sep 2017 10:17:09 -0700
Message-Id: <1506014230-13933-2-git-send-email-hotran@apm.com>
In-Reply-To: <1506014230-13933-1-git-send-email-hotran@apm.com>
References: <1506014230-13933-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch supports xgene-hwmon v2 which uses the non-cachable memory
as the PCC shared memory.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 drivers/hwmon/xgene-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 9c0dbb8..5cd327e 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -761,6 +761,7 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
 	{"APMC0D29", 0},
+	{"APMC0D8A", 0},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
-- 
1.9.1

