Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33133 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752115AbdGEFB0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jul 2017 01:01:26 -0400
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: constify attribute_group structures.
Date: Wed,  5 Jul 2017 10:31:05 +0530
Message-Id: <916222c47f3f47d11b6fca5b0ad2e8a7384ddcc2.1499230740.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work with const
attribute_group. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
   6655	    304	      0	   6959	   1b2f	drivers/hwmon/hwmon.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   6703	    240	      0	   6943	   1b1f	drivers/hwmon/hwmon.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/hwmon/hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index dd6e17c..2ac578a 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -85,7 +85,7 @@ static umode_t hwmon_dev_name_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static struct attribute_group hwmon_dev_attr_group = {
+static const struct attribute_group hwmon_dev_attr_group = {
 	.attrs		= hwmon_dev_attrs,
 	.is_visible	= hwmon_dev_name_is_visible,
 };
-- 
1.9.1

