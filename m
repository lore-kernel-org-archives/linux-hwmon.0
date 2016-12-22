Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3905 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965415AbcLVM1H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:07 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Juerg Haefliger <juergh@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 51/66] hwmon: (dme1737) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:20 +0100
Message-Id: <1482408335-3435-52-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/dme1737.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 8763c4a..a27e75a 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -1468,7 +1468,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
  * Miscellaneous sysfs attributes
  * --------------------------------------------------------------------- */
 
-static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1477,8 +1477,8 @@ static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", data->vrm);
 }
 
-static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct dme1737_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -1495,15 +1495,15 @@ static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct dme1737_data *data = dme1737_update_device(dev);
 
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
-static ssize_t show_name(struct device *dev, struct device_attribute *attr,
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct dme1737_data *data = dev_get_drvdata(dev);
@@ -1645,9 +1645,9 @@ static SENSOR_DEVICE_ATTR_2(pwm##ix##_enable, S_IRUGO, \
 
 /* Misc */
 
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);   /* for ISA devices */
+static DEVICE_ATTR_RW(vrm);
+static DEVICE_ATTR_RO(cpu0_vid);
+static DEVICE_ATTR_RO(name);   /* for ISA devices */
 
 /*
  * This struct holds all the attributes that are always present and need to be

