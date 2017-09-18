Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:40300 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753071AbdIROqY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 10:46:24 -0400
From: Colin King <colin.king@canonical.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (sht15): remove redundant check on status and send of status value
Date: Mon, 18 Sep 2017 15:45:48 +0100
Message-Id: <20170918144548.32354-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A previous commit removed bit or'ing into to the integer status
so now status is now always zero. This means that the non-zero check on
status and the sht15_send_status call will never occur; it is deadcode.
Clean this up by removing the dead code.

Detected by: CoverityScan CID#1456835 ("Logically dead code")

Fixes: aa7ab80c578c ("hwmon: (sht15) Root out platform data")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/sht15.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 0e3e5f83f5cf..25d28343ba93 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -925,7 +925,6 @@ static int sht15_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct sht15_data *data;
-	u8 status = 0;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1002,13 +1001,6 @@ static int sht15_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_release_reg;
 
-	/* write status with platform data options */
-	if (status) {
-		ret = sht15_send_status(data, status);
-		if (ret)
-			goto err_release_reg;
-	}
-
 	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
 	if (ret) {
 		dev_err(&pdev->dev, "sysfs create failed\n");
-- 
2.14.1

