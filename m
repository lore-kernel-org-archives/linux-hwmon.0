Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60175 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938945AbcLVM0x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:53 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/66] hwmon: (adm1031) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:32 +0100
Message-Id: <1482408335-3435-4-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adm1031.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index a581898..bcf5082 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -829,14 +829,14 @@ static SENSOR_DEVICE_ATTR(temp##offset##_crit, S_IRUGO | S_IWUSR,	\
 temp_reg(3);
 
 /* Alarms */
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", data->alarm);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev,
 			  struct device_attribute *attr, char *buf)
@@ -867,7 +867,7 @@ static ssize_t show_alarm(struct device *dev,
 	16000, 8000, 4000, 2000, 1000, 500, 250, 125,
 };
 
-static ssize_t show_update_interval(struct device *dev,
+static ssize_t update_interval_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
@@ -875,9 +875,9 @@ static ssize_t show_update_interval(struct device *dev,
 	return sprintf(buf, "%u\n", data->update_interval);
 }
 
-static ssize_t set_update_interval(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static ssize_t update_interval_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -912,8 +912,7 @@ static ssize_t set_update_interval(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_interval,
-		   set_update_interval);
+static DEVICE_ATTR_RW(update_interval);
 
 static struct attribute *adm1031_attributes[] = {
 	&sensor_dev_attr_fan1_input.dev_attr.attr,

