Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938977AbcLVM0x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:53 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/66] hwmon: (adm9240) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:33 +0100
Message-Id: <1482408335-3435-5-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adm9240.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 72bf248..255413f 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -262,8 +262,8 @@ static struct adm9240_data *adm9240_update_device(struct device *dev)
 /*** sysfs accessors ***/
 
 /* temperature */
-static ssize_t show_temp(struct device *dev, struct device_attribute *dummy,
-		char *buf)
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *dummy, char *buf)
 {
 	struct adm9240_data *data = adm9240_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp / 128 * 500); /* 9-bit value */
@@ -298,7 +298,7 @@ static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL);
+static DEVICE_ATTR_RO(temp1_input);
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
 		show_max, set_max, 0);
 static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
@@ -501,13 +501,13 @@ static SENSOR_DEVICE_ATTR(fan##nr##_min, S_IRUGO | S_IWUSR,	\
 fan(2);
 
 /* alarms */
-static ssize_t show_alarms(struct device *dev,
+static ssize_t alarms_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct adm9240_data *data = adm9240_update_device(dev);
 	return sprintf(buf, "%u\n", data->alarms);
 }
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -527,25 +527,25 @@ static ssize_t show_alarm(struct device *dev,
 static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
 
 /* vid */
-static ssize_t show_vid(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct adm9240_data *data = adm9240_update_device(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 /* analog output */
-static ssize_t show_aout(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t aout_output_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct adm9240_data *data = adm9240_update_device(dev);
 	return sprintf(buf, "%d\n", AOUT_FROM_REG(data->aout));
 }
 
-static ssize_t set_aout(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t aout_output_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct adm9240_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -562,7 +562,7 @@ static ssize_t set_aout(struct device *dev,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static DEVICE_ATTR(aout_output, S_IRUGO | S_IWUSR, show_aout, set_aout);
+static DEVICE_ATTR_RW(aout_output);
 
 static ssize_t chassis_clear(struct device *dev,
 		struct device_attribute *attr,

