Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965418AbcLVM1H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:07 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 52/66] hwmon: (it87) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:21 +0100
Message-Id: <1482408335-3435-53-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/it87.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ad82cb2..ef4e052 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1762,14 +1762,14 @@ static SENSOR_DEVICE_ATTR(pwm6_auto_slope, S_IRUGO | S_IWUSR,
 			  show_auto_pwm_slope, set_auto_pwm_slope, 5);
 
 /* Alarms */
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct it87_data *data = it87_update_device(dev);
 
 	return sprintf(buf, "%u\n", data->alarms);
 }
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -1877,16 +1877,16 @@ static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO, show_beep, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO, show_beep, NULL, 2);
 
-static ssize_t show_vrm_reg(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct it87_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%u\n", data->vrm);
 }
 
-static ssize_t store_vrm_reg(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct it87_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -1898,16 +1898,16 @@ static ssize_t store_vrm_reg(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
+static DEVICE_ATTR_RW(vrm);
 
-static ssize_t show_vid_reg(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct it87_data *data = it87_update_device(dev);
 
 	return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid_reg, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 static ssize_t show_label(struct device *dev, struct device_attribute *attr,
 			  char *buf)

