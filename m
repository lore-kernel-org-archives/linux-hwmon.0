Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3904 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965465AbcLVM1K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:10 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Marc Hulsman <m.hulsman@tudelft.nl>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 45/66] hwmon: (w83791d) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:14 +0100
Message-Id: <1482408335-3435-46-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/w83791d.c |   23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 001df85..8af6081 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -1041,14 +1041,14 @@ static ssize_t store_temp23(struct device *dev,
 };
 
 /* get realtime status of all sensors items: voltage, temp, fan */
-static ssize_t show_alarms_reg(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct w83791d_data *data = w83791d_update_device(dev);
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms_reg, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 /* Beep control */
 
@@ -1147,25 +1147,24 @@ static ssize_t store_beep_enable(struct device *dev,
 };
 
 /* cpu voltage regulation information */
-static ssize_t show_vid_reg(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct w83791d_data *data = w83791d_update_device(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid_reg, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
-static ssize_t show_vrm_reg(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct w83791d_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", data->vrm);
 }
 
-static ssize_t store_vrm_reg(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct w83791d_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -1188,7 +1187,7 @@ static ssize_t store_vrm_reg(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
+static DEVICE_ATTR_RW(vrm);
 
 #define IN_UNIT_ATTRS(X) \
 	&sda_in_input[X].dev_attr.attr,	\

