Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:49903 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932779AbdJaU6R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2017 16:58:17 -0400
Received: by mail-pf0-f193.google.com with SMTP id i5so222470pfe.6
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2017 13:58:17 -0700 (PDT)
From: Hoan Tran <hotran@apm.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        lho@apm.com, patches@apm.com, Hoan Tran <hotran@apm.com>
Subject: [PATCH] hwmon: xgene: Minor clean up of ifdef and acpi_match_table reference
Date: Tue, 31 Oct 2017 13:58:07 -0700
Message-Id: <1509483487-10110-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch removes the un-necessary ifdef CONFIG_ACPI and directly
uses the acpi_match_table from the driver pdev.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 drivers/hwmon/xgene-hwmon.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 5783436..85c4e3d 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -665,16 +665,15 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 		}
 	} else {
 		struct acpi_pcct_hw_reduced *cppc_ss;
-		int version = XGENE_HWMON_V1;
-#ifdef CONFIG_ACPI
 		const struct acpi_device_id *acpi_id;
+		int version = XGENE_HWMON_V1;
 
-		acpi_id = acpi_match_device(xgene_hwmon_acpi_match, &pdev->dev);
+		acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
+					    &pdev->dev);
 		if (!acpi_id)
 			return -EINVAL;
 
 		version = (int)acpi_id->driver_data;
-#endif
 
 		if (device_property_read_u32(&pdev->dev, "pcc-channel",
 					     &ctx->mbox_idx)) {
-- 
2.7.4

