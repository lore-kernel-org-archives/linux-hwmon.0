Return-path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel-janitors@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 66/66] hwmon: (tmp401) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:35 +0100
Message-Id: <1482408335-3435-67-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-hwmon@vger.kernel.org>

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
 drivers/hwmon/tmp401.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index eeeed2c..6276003 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -449,7 +449,7 @@ static ssize_t reset_temp_history(struct device *dev,
 	return count;
 }
 
-static ssize_t show_update_interval(struct device *dev,
+static ssize_t update_interval_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
@@ -457,9 +457,9 @@ static ssize_t show_update_interval(struct device *dev,
 	return sprintf(buf, "%u\n", data->update_interval);
 }
 
-static ssize_t set_update_interval(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static ssize_t update_interval_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -521,8 +521,7 @@ static SENSOR_DEVICE_ATTR_2(temp2_max_alarm, S_IRUGO, show_status, NULL,
 static SENSOR_DEVICE_ATTR_2(temp2_crit_alarm, S_IRUGO, show_status, NULL,
 			    3, TMP432_STATUS_REMOTE1);
 
-static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_interval,
-		   set_update_interval);
+static DEVICE_ATTR_RW(update_interval);
 
 static struct attribute *tmp401_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
