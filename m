Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965364AbcLVM1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:03 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 36/66] hwmon: (sis5595) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:05 +0100
Message-Id: <1482408335-3435-37-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/sis5595.c |   36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 45a028f..6d789aa 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -304,22 +304,23 @@ static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,	\
 show_in_offset(4);
 
 /* Temperature */
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
 }
 
-static ssize_t show_temp_over(struct device *dev, struct device_attribute *attr,
+static ssize_t temp1_max_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
 }
 
-static ssize_t set_temp_over(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t temp1_max_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	long val;
@@ -336,15 +337,16 @@ static ssize_t set_temp_over(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp_hyst(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+static ssize_t temp1_max_hyst_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
 }
 
-static ssize_t set_temp_hyst(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t temp1_max_hyst_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	long val;
@@ -361,11 +363,9 @@ static ssize_t set_temp_hyst(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL);
-static DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR,
-		show_temp_over, set_temp_over);
-static DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR,
-		show_temp_hyst, set_temp_hyst);
+static DEVICE_ATTR_RO(temp1_input);
+static DEVICE_ATTR_RW(temp1_max);
+static DEVICE_ATTR_RW(temp1_max_hyst);
 
 /* 2 Fans */
 static ssize_t show_fan(struct device *dev, struct device_attribute *da,
@@ -492,13 +492,13 @@ static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
 show_fan_offset(2);
 
 /* Alarms */
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
 	return sprintf(buf, "%d\n", data->alarms);
 }
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
 			  char *buf)
@@ -516,13 +516,13 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
 static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 15);
 
-static ssize_t show_name(struct device *dev, struct device_attribute *attr,
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct attribute *sis5595_attributes[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,

