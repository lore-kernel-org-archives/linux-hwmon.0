Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33541 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752063AbdGEFeW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jul 2017 01:34:22 -0400
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: adt7475: constify attribute_group structures.
Date: Wed,  5 Jul 2017 11:04:04 +0530
Message-Id: <6f75a80453097e5f05f26782b42ab48f0da8e502.1499232764.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work with const
attribute_group. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
  10055	   7032	      0	  17087	   42bf	drivers/hwmon/adt7475.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
  10567	   6520	      0	  17087	   42bf	drivers/hwmon/adt7475.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/hwmon/adt7475.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index c803e3c..973f17a 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1205,14 +1205,14 @@ static SENSOR_DEVICE_ATTR_2(pwm3_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
 	NULL
 };
 
-static struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
-static struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
-static struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
-static struct attribute_group in0_attr_group = { .attrs = in0_attrs };
-static struct attribute_group in3_attr_group = { .attrs = in3_attrs };
-static struct attribute_group in4_attr_group = { .attrs = in4_attrs };
-static struct attribute_group in5_attr_group = { .attrs = in5_attrs };
-static struct attribute_group vid_attr_group = { .attrs = vid_attrs };
+static const struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
+static const struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
+static const struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
+static const struct attribute_group in0_attr_group = { .attrs = in0_attrs };
+static const struct attribute_group in3_attr_group = { .attrs = in3_attrs };
+static const struct attribute_group in4_attr_group = { .attrs = in4_attrs };
+static const struct attribute_group in5_attr_group = { .attrs = in5_attrs };
+static const struct attribute_group vid_attr_group = { .attrs = vid_attrs };
 
 static int adt7475_detect(struct i2c_client *client,
 			  struct i2c_board_info *info)
-- 
1.9.1

