Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839DEC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Nov 2022 03:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiKXDGY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Nov 2022 22:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiKXDGQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2022 22:06:16 -0500
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F739CDFFC;
        Wed, 23 Nov 2022 19:06:11 -0800 (PST)
X-QQ-mid: bizesmtpipv602t1669259157tmql
Received: from localhost ( [255.189.44.3])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 24 Nov 2022 11:05:56 +0800 (CST)
X-QQ-SSF: 01400000000000506000000A0000000
X-QQ-FEAT: 7jw2iSiCazpZQoUIlRlr5Ga8aVxzjFitmBkR3frsxf7nmRLBJ3M4g9J5dCXoM
        79oTKcUm2uLJ70LO/nfgTWBffpDPa7D8VHA4E6dt3E2595S5R78WwgE1CWJuSxOOo/i4QcH
        B59Xb91ntv8MZydyFZMHM3PNKKFGPR4ODah4QRRsnqw497qiHlYfQaCK0Mu3OB1lTdLUGVk
        A/NohfRvg7GCvmPldIEdIDteJ93f2GltHsjzhTfMgcodUHT079HlbwlIjMvEs6aXDE4XSSm
        xMj1qKbat7NWxFUo6OQbHuCNYM/OadjMGAYS2YaxuLoMlmUWv524kldjJKEHnUEDmQgJ3Sw
        pcdYsYcFnAYTmWYY5Q9y/3rIl7igA==
X-QQ-GoodBg: 2
Date:   Thu, 24 Nov 2022 11:05:55 +0800
From:   Wang Honghui <honghui.wang@ucas.com.cn>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3]hwmon: Modify to support Phytium FT2000/4 CPU for acpi
Message-ID: <1CD578BA572E3037+Y37fk/eKlI3u5+77@TP-P15V.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:ucas.com.cn:qybglogicsvr:qybglogicsvr6
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Modify to support Phytium FT2000/4 CPU for acpi

Signed-off-by: Wang Honghui <honghui.wang@ucas.com.cn>
---
 drivers/hwmon/scpi-hwmon.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 4d75385f7d5e..6021ae00b334 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/thermal.h>
+#include <linux/acpi.h>
 
 struct sensor_data {
 	unsigned int scale;
@@ -132,6 +133,13 @@ static const struct of_device_id scpi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, scpi_of_match);
 
+/* Wang Honghui add to support Phytium FT2000/4 CPU for acpi */
+static const struct acpi_device_id scpi_sensors_acpi_match[] = {
+        { .id = "PHYT000D" },
+        { }
+};
+MODULE_DEVICE_TABLE(acpi, scpi_sensors_acpi_match);
+
 static int scpi_hwmon_probe(struct platform_device *pdev)
 {
 	u16 nr_sensors, i;
@@ -141,6 +149,7 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
 	struct scpi_ops *scpi_ops;
 	struct device *hwdev, *dev = &pdev->dev;
 	struct scpi_sensors *scpi_sensors;
+	const struct acpi_device_id *match;
 	int idx, ret;
 
 	scpi_ops = get_scpi_ops();
@@ -170,11 +179,22 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
 
 	scpi_sensors->scpi_ops = scpi_ops;
 
-	scale = of_device_get_match_data(&pdev->dev);
-	if (!scale) {
-		dev_err(&pdev->dev, "Unable to initialize scpi-hwmon data\n");
-		return -ENODEV;
-	}
+	/* Wang Honghui modified to support Phytium FT2000/4 CPU for acpi */
+	if (dev->of_node) {
+		scale = of_device_get_match_data(&pdev->dev);
+		if (!scale) {
+			dev_err(&pdev->dev, "Unable to initialize scpi-hwmon data\n");
+			return -ENODEV;
+		}
+	} else {
+                match = acpi_match_device(dev->driver->acpi_match_table, dev);
+                if (!match) {
+                        dev_err(dev, "scpi-hwmon: Error ACPI match data is missing\n");
+                        return -ENODEV;
+                }   
+    
+                scale = scpi_scale;
+        }
 
 	for (i = 0, idx = 0; i < nr_sensors; i++) {
 		struct sensor_data *sensor = &scpi_sensors->data[idx];
-- 
2.34.1

