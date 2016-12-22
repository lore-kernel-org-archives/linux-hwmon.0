Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60175 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938941AbcLVM0v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:51 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/66] hwmon: (adm1021) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:30 +0100
Message-Id: <1482408335-3435-2-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adm1021.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
index 1fdcc3e..eacf10f 100644
--- a/drivers/hwmon/adm1021.c
+++ b/drivers/hwmon/adm1021.c
@@ -191,7 +191,7 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
 }
 
-static ssize_t show_alarms(struct device *dev,
+static ssize_t alarms_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
@@ -251,16 +251,16 @@ static ssize_t set_temp_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_low_power(struct device *dev,
+static ssize_t low_power_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct adm1021_data *data = adm1021_update_device(dev);
 	return sprintf(buf, "%d\n", data->low_power);
 }
 
-static ssize_t set_low_power(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+static ssize_t low_power_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct adm1021_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -303,8 +303,8 @@ static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_temp_min,
 static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 3);
 static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
-static DEVICE_ATTR(low_power, S_IWUSR | S_IRUGO, show_low_power, set_low_power);
+static DEVICE_ATTR_RO(alarms);
+static DEVICE_ATTR_RW(low_power);
 
 static struct attribute *adm1021_attributes[] = {
 	&sensor_dev_attr_temp1_max.dev_attr.attr,

