Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3906 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965427AbcLVM1H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:07 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 55/66] hwmon: (pc87360) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:24 +0100
Message-Id: <1482408335-3435-56-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/pc87360.c |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index d50fbf9..7e36977 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -589,22 +589,22 @@ static ssize_t show_in_max_alarm(struct device *dev,
 	&in_min_alarm[X].dev_attr.attr,	\
 	&in_max_alarm[X].dev_attr.attr
 
-static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
-static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct pc87360_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%u\n", data->vrm);
 }
-static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct pc87360_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -620,15 +620,15 @@ static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
 	data->vrm = val;
 	return count;
 }
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);
+static DEVICE_ATTR_RW(vrm);
 
-static ssize_t show_in_alarms(struct device *dev,
+static ssize_t alarms_in_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	return sprintf(buf, "%u\n", data->in_alarms);
 }
-static DEVICE_ATTR(alarms_in, S_IRUGO, show_in_alarms, NULL);
+static DEVICE_ATTR_RO(alarms_in);
 
 static struct attribute *pc8736x_vin_attr_array[] = {
 	VIN_UNIT_ATTRS(0),
@@ -1006,14 +1006,14 @@ static ssize_t set_temp_crit(struct device *dev,
 		    show_temp_crit, set_temp_crit, 2),
 };
 
-static ssize_t show_temp_alarms(struct device *dev,
+static ssize_t alarms_temp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	return sprintf(buf, "%u\n", data->temp_alarms);
 }
 
-static DEVICE_ATTR(alarms_temp, S_IRUGO, show_temp_alarms, NULL);
+static DEVICE_ATTR_RO(alarms_temp);
 
 /*
  * show_temp_min/max_alarm() reads data from the per-channel status
@@ -1106,14 +1106,14 @@ static ssize_t show_temp_fault(struct device *dev,
 	{ .attrs = pc8736x_temp_attr[2] }
 };
 
-static ssize_t show_name(struct device *dev,
+static ssize_t name_show(struct device *dev,
 			struct device_attribute *devattr, char *buf)
 {
 	struct pc87360_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%s\n", data->name);
 }
 
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 /*
  * Device detection, registration and update

