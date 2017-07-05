Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34744 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750871AbdGEFGu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jul 2017 01:06:50 -0400
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: nct7802: constify attribute_group structures.
Date: Wed,  5 Jul 2017 10:36:33 +0530
Message-Id: <7a32d92ba635b2c14442ce2df8d82cd9e32e42a2.1499231145.git.arvind.yadav.cs@gmail.com>
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
 drivers/hwmon/nct7802.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 12b94b0..2876c18 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -704,7 +704,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static struct attribute_group nct7802_temp_group = {
+static const struct attribute_group nct7802_temp_group = {
 	.attrs = nct7802_temp_attrs,
 	.is_visible = nct7802_temp_is_visible,
 };
@@ -802,7 +802,7 @@ static umode_t nct7802_in_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static struct attribute_group nct7802_in_group = {
+static const struct attribute_group nct7802_in_group = {
 	.attrs = nct7802_in_attrs,
 	.is_visible = nct7802_in_is_visible,
 };
@@ -880,7 +880,7 @@ static umode_t nct7802_fan_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static struct attribute_group nct7802_fan_group = {
+static const struct attribute_group nct7802_fan_group = {
 	.attrs = nct7802_fan_attrs,
 	.is_visible = nct7802_fan_is_visible,
 };
@@ -898,7 +898,7 @@ static umode_t nct7802_fan_is_visible(struct kobject *kobj,
 	NULL
 };
 
-static struct attribute_group nct7802_pwm_group = {
+static const struct attribute_group nct7802_pwm_group = {
 	.attrs = nct7802_pwm_attrs,
 };
 
@@ -1011,7 +1011,7 @@ static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, S_IRUGO | S_IWUSR,
 	NULL
 };
 
-static struct attribute_group nct7802_auto_point_group = {
+static const struct attribute_group nct7802_auto_point_group = {
 	.attrs = nct7802_auto_point_attrs,
 };
 
-- 
1.9.1

