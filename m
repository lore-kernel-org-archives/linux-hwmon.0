Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35273 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752472AbdHGJgx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Aug 2017 05:36:53 -0400
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: adt7475: constify attribute_group structures
Date: Mon,  7 Aug 2017 15:06:29 +0530
Message-Id: <a067ef24035b924b03137a2e4dfa93eba6f6d080.1502098447.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

attribute_group are not supposed to change at runtime. All functions
working with attribute_group provided by <linux/sysfs.h> work with
const attribute_group. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
change in v2:
            subject was not correct. Removed 'wusbhc' and '.'.

 drivers/hwmon/adt7475.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 1baa213..9ef8499 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1319,14 +1319,14 @@ static SENSOR_DEVICE_ATTR_2(pwm3_stall_disable, S_IRUGO | S_IWUSR,
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

