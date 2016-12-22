Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965055AbcLVM0z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:55 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/66] hwmon: (ds1621) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:38 +0100
Message-Id: <1482408335-3435-10-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/ds1621.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index 8890870..5c317fc 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -263,7 +263,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t show_alarms(struct device *dev, struct device_attribute *da,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *da,
 			   char *buf)
 {
 	struct ds1621_data *data = ds1621_update_client(dev);
@@ -278,15 +278,16 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", !!(data->conf & attr->index));
 }
 
-static ssize_t show_convrate(struct device *dev, struct device_attribute *da,
-			  char *buf)
+static ssize_t update_interval_show(struct device *dev,
+				    struct device_attribute *da, char *buf)
 {
 	struct ds1621_data *data = dev_get_drvdata(dev);
 	return scnprintf(buf, PAGE_SIZE, "%hu\n", data->update_interval);
 }
 
-static ssize_t set_convrate(struct device *dev, struct device_attribute *da,
-			    const char *buf, size_t count)
+static ssize_t update_interval_store(struct device *dev,
+				     struct device_attribute *da,
+				     const char *buf, size_t count)
 {
 	struct ds1621_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -315,9 +316,8 @@ static ssize_t set_convrate(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
-static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_convrate,
-		   set_convrate);
+static DEVICE_ATTR_RO(alarms);
+static DEVICE_ATTR_RW(update_interval);
 
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
 static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp, set_temp, 1);

