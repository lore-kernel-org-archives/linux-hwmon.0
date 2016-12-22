Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3906 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965368AbcLVM1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:03 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 23/66] hwmon: (lm85) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:52 +0100
Message-Id: <1482408335-3435-24-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/lm85.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 29c8136..691469f 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -604,8 +604,8 @@ static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
 
 /* vid, vrm, alarms */
 
-static ssize_t show_vid_reg(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct lm85_data *data = lm85_update_device(dev);
 	int vid;
@@ -621,17 +621,17 @@ static ssize_t show_vid_reg(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", vid);
 }
 
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid_reg, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
-static ssize_t show_vrm_reg(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct lm85_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%ld\n", (long) data->vrm);
 }
 
-static ssize_t store_vrm_reg(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct lm85_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -648,16 +648,16 @@ static ssize_t store_vrm_reg(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
+static DEVICE_ATTR_RW(vrm);
 
-static ssize_t show_alarms_reg(struct device *dev, struct device_attribute
-		*attr, char *buf)
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms_reg, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 		char *buf)

