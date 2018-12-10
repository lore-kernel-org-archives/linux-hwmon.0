Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37445 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:08 -0500
Received: by mail-pg1-f194.google.com with SMTP id 80so5623274pge.4
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:08 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/30] hwmon: (ads7871) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:29 -0800
Message-Id: <1544479728-30077-12-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ads7871.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 59bd7b9e1772..cd14c1501508 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -96,8 +96,8 @@ static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
 	return spi_write(spi, tmp, sizeof(tmp));
 }
 
-static ssize_t show_voltage(struct device *dev,
-		struct device_attribute *da, char *buf)
+static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
+			    char *buf)
 {
 	struct ads7871_data *pdata = dev_get_drvdata(dev);
 	struct spi_device *spi = pdata->spi;
@@ -138,14 +138,14 @@ static ssize_t show_voltage(struct device *dev,
 	}
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, show_voltage, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_voltage, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_voltage, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_voltage, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_voltage, NULL, 4);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, show_voltage, NULL, 5);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, show_voltage, NULL, 6);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, show_voltage, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, voltage, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, voltage, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, voltage, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, voltage, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_input, voltage, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, voltage, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_input, voltage, 7);
 
 static struct attribute *ads7871_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4
