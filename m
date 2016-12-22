Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965386AbcLVM1E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:04 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 40/66] hwmon: (via686a) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:09 +0100
Message-Id: <1482408335-3435-41-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/via686a.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index 40dd93c..81f35e3 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -580,14 +580,14 @@ static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
 show_fan_offset(2);
 
 /* Alarms */
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct via686a_data *data = via686a_update_device(dev);
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -607,13 +607,13 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
 static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
 
-static ssize_t show_name(struct device *dev, struct device_attribute
+static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
 {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct attribute *via686a_attributes[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,

