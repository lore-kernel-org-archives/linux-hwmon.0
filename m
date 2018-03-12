Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:58991 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932242AbeCLVY0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Mar 2018 17:24:26 -0400
To: linux-hwmon@vger.kernel.org,
        =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jean Delvare <jdelvare@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] hwmon/sch5627: Use common error handling code in
 sch5627_probe()
Message-ID: <d08248a2-46d8-6f73-81f4-84ad21b7e640@users.sourceforge.net>
Date: Mon, 12 Mar 2018 22:23:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Mar 2018 22:15:59 +0100

Adjust jump targets so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwmon/sch5627.c | 60 ++++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 91544f2312e6..e7a2a974ab74 100644
--- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -480,72 +480,64 @@ static int sch5627_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, data);
 
 	val = sch56xx_read_virtual_reg(data->addr, SCH5627_REG_HWMON_ID);
-	if (val < 0) {
-		err = val;
-		goto error;
-	}
+	if (val < 0)
+		goto set_error_code;
+
 	if (val != SCH5627_HWMON_ID) {
 		pr_err("invalid %s id: 0x%02X (expected 0x%02X)\n", "hwmon",
 		       val, SCH5627_HWMON_ID);
-		err = -ENODEV;
-		goto error;
+		goto e_nodev;
 	}
 
 	val = sch56xx_read_virtual_reg(data->addr, SCH5627_REG_COMPANY_ID);
-	if (val < 0) {
-		err = val;
-		goto error;
-	}
+	if (val < 0)
+		goto set_error_code;
+
 	if (val != SCH5627_COMPANY_ID) {
 		pr_err("invalid %s id: 0x%02X (expected 0x%02X)\n", "company",
 		       val, SCH5627_COMPANY_ID);
-		err = -ENODEV;
-		goto error;
+		goto e_nodev;
 	}
 
 	val = sch56xx_read_virtual_reg(data->addr, SCH5627_REG_PRIMARY_ID);
-	if (val < 0) {
-		err = val;
-		goto error;
-	}
+	if (val < 0)
+		goto set_error_code;
+
 	if (val != SCH5627_PRIMARY_ID) {
 		pr_err("invalid %s id: 0x%02X (expected 0x%02X)\n", "primary",
 		       val, SCH5627_PRIMARY_ID);
-		err = -ENODEV;
-		goto error;
+		goto e_nodev;
 	}
 
 	build_code = sch56xx_read_virtual_reg(data->addr,
 					      SCH5627_REG_BUILD_CODE);
 	if (build_code < 0) {
 		err = build_code;
-		goto error;
+		goto remove_device;
 	}
 
 	build_id = sch56xx_read_virtual_reg16(data->addr,
 					      SCH5627_REG_BUILD_ID);
 	if (build_id < 0) {
 		err = build_id;
-		goto error;
+		goto remove_device;
 	}
 
 	hwmon_rev = sch56xx_read_virtual_reg(data->addr,
 					     SCH5627_REG_HWMON_REV);
 	if (hwmon_rev < 0) {
 		err = hwmon_rev;
-		goto error;
+		goto remove_device;
 	}
 
 	val = sch56xx_read_virtual_reg(data->addr, SCH5627_REG_CTRL);
-	if (val < 0) {
-		err = val;
-		goto error;
-	}
+	if (val < 0)
+		goto set_error_code;
+
 	data->control = val;
 	if (!(data->control & 0x01)) {
 		pr_err("hardware monitoring not enabled\n");
-		err = -ENODEV;
-		goto error;
+		goto e_nodev;
 	}
 	/* Trigger a Vbat voltage measurement, so that we get a valid reading
 	   the first time we read Vbat */
@@ -559,7 +551,7 @@ static int sch5627_probe(struct platform_device *pdev)
 	 */
 	err = sch5627_read_limits(data);
 	if (err)
-		goto error;
+		goto remove_device;
 
 	pr_info("found %s chip at %#hx\n", DEVNAME, data->addr);
 	pr_info("firmware build: code 0x%02X, id 0x%04X, hwmon: rev 0x%02X\n",
@@ -568,13 +560,13 @@ static int sch5627_probe(struct platform_device *pdev)
 	/* Register sysfs interface files */
 	err = sysfs_create_group(&pdev->dev.kobj, &sch5627_group);
 	if (err)
-		goto error;
+		goto remove_device;
 
 	data->hwmon_dev = hwmon_device_register(&pdev->dev);
 	if (IS_ERR(data->hwmon_dev)) {
 		err = PTR_ERR(data->hwmon_dev);
 		data->hwmon_dev = NULL;
-		goto error;
+		goto remove_device;
 	}
 
 	/* Note failing to register the watchdog is not a fatal error */
@@ -584,7 +576,13 @@ static int sch5627_probe(struct platform_device *pdev)
 
 	return 0;
 
-error:
+set_error_code:
+	err = val;
+	goto remove_device;
+
+e_nodev:
+	err = -ENODEV;
+remove_device:
 	sch5627_remove(pdev);
 	return err;
 }
-- 
2.16.2

