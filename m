Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41623 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbeH1Wid (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Aug 2018 18:38:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id s15-v6so1137295pgv.8
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Aug 2018 11:45:37 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (iio_hwmon) Do not duplicate or sanitize fixed string
Date: Tue, 28 Aug 2018 11:45:35 -0700
Message-Id: <1535481935-28226-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Calling devm_kstrdup() on a fixed string is unnecessary, as is validating
its contents. Rearrange the code to avoid both.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/iio_hwmon.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index 7566991f1c04..eed66e533ee2 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -137,14 +137,15 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 	st->attr_group.attrs = st->attrs;
 	st->groups[0] = &st->attr_group;
 
-	if (dev->of_node)
+	if (dev->of_node) {
 		sname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-	else
-		sname = devm_kstrdup(dev, "iio_hwmon", GFP_KERNEL);
-	if (!sname)
-		return -ENOMEM;
+		if (!sname)
+			return -ENOMEM;
+		strreplace(sname, '-', '_');
+	} else {
+		sname = "iio_hwmon";
+	}
 
-	strreplace(sname, '-', '_');
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, sname, st,
 							   st->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
-- 
2.7.4
