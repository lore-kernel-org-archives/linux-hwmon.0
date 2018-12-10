Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46026 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWI5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:08:57 -0500
Received: by mail-pg1-f195.google.com with SMTP id y4so5599772pgc.12
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:08:56 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/30] hwmon: (ad7314) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:21 -0800
Message-Id: <1544479728-30077-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ad7314.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ad7314.c b/drivers/hwmon/ad7314.c
index 8ea35932fbaa..be521bdae114 100644
--- a/drivers/hwmon/ad7314.c
+++ b/drivers/hwmon/ad7314.c
@@ -53,9 +53,9 @@ static int ad7314_spi_read(struct ad7314_data *chip)
 	return be16_to_cpu(chip->rx);
 }
 
-static ssize_t ad7314_show_temperature(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
+static ssize_t ad7314_temperature_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
 {
 	struct ad7314_data *chip = dev_get_drvdata(dev);
 	s16 data;
@@ -87,8 +87,7 @@ static ssize_t ad7314_show_temperature(struct device *dev,
 	}
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
-			  ad7314_show_temperature, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, ad7314_temperature, 0);
 
 static struct attribute *ad7314_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4
