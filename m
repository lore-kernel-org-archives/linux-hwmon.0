Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34173 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754021AbdDWOLX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Apr 2017 10:11:23 -0400
From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>
Subject: [PATCH] hwmon: tmp103: use SIMPLE_DEV_PM_OPS helper macro
Date: Sun, 23 Apr 2017 19:40:51 +0530
Message-Id: <1492956651-15321-1-git-send-email-rahulbedarkar89@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Replace ifdefs with SIMPLE_DEV_PM_OPS helper macro.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 drivers/hwmon/tmp103.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index d0bb28b..7f85b14 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -150,8 +150,7 @@ static int tmp103_probe(struct i2c_client *client,
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-#ifdef CONFIG_PM
-static int tmp103_suspend(struct device *dev)
+static int __maybe_unused tmp103_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
 
@@ -159,7 +158,7 @@ static int tmp103_suspend(struct device *dev)
 				  TMP103_CONF_SD_MASK, 0);
 }
 
-static int tmp103_resume(struct device *dev)
+static int __maybe_unused tmp103_resume(struct device *dev)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
 
@@ -167,15 +166,7 @@ static int tmp103_resume(struct device *dev)
 				  TMP103_CONF_SD_MASK, TMP103_CONF_SD);
 }
 
-static const struct dev_pm_ops tmp103_dev_pm_ops = {
-	.suspend	= tmp103_suspend,
-	.resume		= tmp103_resume,
-};
-
-#define TMP103_DEV_PM_OPS (&tmp103_dev_pm_ops)
-#else
-#define	TMP103_DEV_PM_OPS NULL
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(tmp103_dev_pm_ops, tmp103_suspend, tmp103_resume);
 
 static const struct i2c_device_id tmp103_id[] = {
 	{ "tmp103", 0 },
@@ -193,7 +184,7 @@ static struct i2c_driver tmp103_driver = {
 	.driver = {
 		.name	= "tmp103",
 		.of_match_table = of_match_ptr(tmp103_of_match),
-		.pm	= TMP103_DEV_PM_OPS,
+		.pm	= &tmp103_dev_pm_ops,
 	},
 	.probe		= tmp103_probe,
 	.id_table	= tmp103_id,
-- 
2.7.4

