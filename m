Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3904 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965377AbcLVM1E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:04 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 38/66] hwmon: (smsc47m192) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:07 +0100
Message-Id: <1482408335-3435-39-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/smsc47m192.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
index 15650f2..6989408 100644
--- a/drivers/hwmon/smsc47m192.c
+++ b/drivers/hwmon/smsc47m192.c
@@ -400,23 +400,23 @@ static SENSOR_DEVICE_ATTR(temp##index##_offset, S_IRUGO | S_IWUSR,	\
 show_temp_index(3)
 
 /* VID */
-static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct smsc47m192_data *data = smsc47m192_update_device(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
-static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct smsc47m192_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", data->vrm);
 }
 
-static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct smsc47m192_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -431,7 +431,7 @@ static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
 	data->vrm = val;
 	return count;
 }
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);
+static DEVICE_ATTR_RW(vrm);
 
 /* Alarms */
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,

