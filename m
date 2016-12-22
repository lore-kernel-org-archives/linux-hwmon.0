Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965391AbcLVM1F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:05 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 42/66] hwmon: (w83627hf) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:11 +0100
Message-Id: <1482408335-3435-43-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/w83627hf.c |   53 ++++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index 721295b..8ac89d0 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -575,26 +575,30 @@ static ssize_t show_in_0(struct w83627hf_data *data, char *buf, u8 reg)
 	return sprintf(buf,"%ld\n", in0);
 }
 
-static ssize_t show_regs_in_0(struct device *dev, struct device_attribute *attr, char *buf)
+static ssize_t in0_input_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return show_in_0(data, buf, data->in[0]);
 }
 
-static ssize_t show_regs_in_min0(struct device *dev, struct device_attribute *attr, char *buf)
+static ssize_t in0_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return show_in_0(data, buf, data->in_min[0]);
 }
 
-static ssize_t show_regs_in_max0(struct device *dev, struct device_attribute *attr, char *buf)
+static ssize_t in0_max_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return show_in_0(data, buf, data->in_max[0]);
 }
 
-static ssize_t store_regs_in_min0(struct device *dev, struct device_attribute *attr,
-	const char *buf, size_t count)
+static ssize_t in0_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -622,8 +626,9 @@ static ssize_t store_regs_in_min0(struct device *dev, struct device_attribute *a
 	return count;
 }
 
-static ssize_t store_regs_in_max0(struct device *dev, struct device_attribute *attr,
-	const char *buf, size_t count)
+static ssize_t in0_max_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -651,11 +656,9 @@ static ssize_t store_regs_in_max0(struct device *dev, struct device_attribute *a
 	return count;
 }
 
-static DEVICE_ATTR(in0_input, S_IRUGO, show_regs_in_0, NULL);
-static DEVICE_ATTR(in0_min, S_IRUGO | S_IWUSR,
-	show_regs_in_min0, store_regs_in_min0);
-static DEVICE_ATTR(in0_max, S_IRUGO | S_IWUSR,
-	show_regs_in_max0, store_regs_in_max0);
+static DEVICE_ATTR_RO(in0_input);
+static DEVICE_ATTR_RW(in0_min);
+static DEVICE_ATTR_RW(in0_max);
 
 static ssize_t
 show_fan_input(struct device *dev, struct device_attribute *devattr, char *buf)
@@ -796,21 +799,22 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO|S_IWUSR,	\
 sysfs_temp_decl(3);
 
 static ssize_t
-show_vid_reg(struct device *dev, struct device_attribute *attr, char *buf)
+cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return sprintf(buf, "%ld\n", (long) vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid_reg, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 static ssize_t
-show_vrm_reg(struct device *dev, struct device_attribute *attr, char *buf)
+vrm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%ld\n", (long) data->vrm);
 }
 static ssize_t
-store_vrm_reg(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+vrm_store(struct device *dev, struct device_attribute *attr, const char *buf,
+	  size_t count)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -826,15 +830,15 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO|S_IWUSR,	\
 
 	return count;
 }
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
+static DEVICE_ATTR_RW(vrm);
 
 static ssize_t
-show_alarms_reg(struct device *dev, struct device_attribute *attr, char *buf)
+alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return sprintf(buf, "%ld\n", (long) data->alarms);
 }
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms_reg, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t
 show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
@@ -860,7 +864,7 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO|S_IWUSR,	\
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 13);
 
 static ssize_t
-show_beep_mask(struct device *dev, struct device_attribute *attr, char *buf)
+beep_mask_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return sprintf(buf, "%ld\n",
@@ -868,7 +872,7 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO|S_IWUSR,	\
 }
 
 static ssize_t
-store_beep_mask(struct device *dev, struct device_attribute *attr,
+beep_mask_store(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
@@ -895,8 +899,7 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO|S_IWUSR,	\
 	return count;
 }
 
-static DEVICE_ATTR(beep_mask, S_IRUGO | S_IWUSR,
-		   show_beep_mask, store_beep_mask);
+static DEVICE_ATTR_RW(beep_mask);
 
 static ssize_t
 show_beep(struct device *dev, struct device_attribute *attr, char *buf)
@@ -1264,13 +1267,13 @@ static SENSOR_DEVICE_ATTR(temp##offset##_type, S_IRUGO | S_IWUSR, \
 sysfs_temp_type(3);
 
 static ssize_t
-show_name(struct device *dev, struct device_attribute *devattr, char *buf)
+name_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static int __init w83627hf_find(int sioaddr, unsigned short *addr,
 				struct w83627hf_sio_data *sio_data)

