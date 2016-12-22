Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965406AbcLVM1G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:06 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 47/66] hwmon: (f71805f) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:16 +0100
Message-Id: <1482408335-3435-48-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch for the RO case, in the case where the show function
already has the expected name, is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hwmon/f71805f.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/f71805f.c b/drivers/hwmon/f71805f.c
index facd05c..73c6811 100644
--- a/drivers/hwmon/f71805f.c
+++ b/drivers/hwmon/f71805f.c
@@ -946,7 +946,7 @@ static ssize_t set_temp_hyst(struct device *dev, struct device_attribute
 	return count;
 }
 
-static ssize_t show_alarms_in(struct device *dev, struct device_attribute
+static ssize_t alarms_in_show(struct device *dev, struct device_attribute
 			      *devattr, char *buf)
 {
 	struct f71805f_data *data = f71805f_update_device(dev);
@@ -954,7 +954,7 @@ static ssize_t show_alarms_in(struct device *dev, struct device_attribute
 	return sprintf(buf, "%lu\n", data->alarms & 0x7ff);
 }
 
-static ssize_t show_alarms_fan(struct device *dev, struct device_attribute
+static ssize_t alarms_fan_show(struct device *dev, struct device_attribute
 			       *devattr, char *buf)
 {
 	struct f71805f_data *data = f71805f_update_device(dev);
@@ -962,7 +962,7 @@ static ssize_t show_alarms_fan(struct device *dev, struct device_attribute
 	return sprintf(buf, "%lu\n", (data->alarms >> 16) & 0x07);
 }
 
-static ssize_t show_alarms_temp(struct device *dev, struct device_attribute
+static ssize_t alarms_temp_show(struct device *dev, struct device_attribute
 				*devattr, char *buf)
 {
 	struct f71805f_data *data = f71805f_update_device(dev);
@@ -980,7 +980,7 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute
 	return sprintf(buf, "%lu\n", (data->alarms >> bitnr) & 1);
 }
 
-static ssize_t show_name(struct device *dev, struct device_attribute
+static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
 {
 	struct f71805f_data *data = dev_get_drvdata(dev);
@@ -1176,11 +1176,11 @@ static SENSOR_DEVICE_ATTR_2(pwm3_auto_point3_fan, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 16);
 static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 17);
 static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 18);
-static DEVICE_ATTR(alarms_in, S_IRUGO, show_alarms_in, NULL);
-static DEVICE_ATTR(alarms_fan, S_IRUGO, show_alarms_fan, NULL);
-static DEVICE_ATTR(alarms_temp, S_IRUGO, show_alarms_temp, NULL);
+static DEVICE_ATTR_RO(alarms_in);
+static DEVICE_ATTR_RO(alarms_fan);
+static DEVICE_ATTR_RO(alarms_temp);
 
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct attribute *f71805f_attributes[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,

