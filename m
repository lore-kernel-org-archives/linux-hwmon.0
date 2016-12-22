Return-path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel-janitors@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 63/66] hwmon: (lm95234) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:32 +0100
Message-Id: <1482408335-3435-64-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/lm95234.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 8796de3..c7fcc9e 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -450,8 +450,8 @@ static ssize_t set_offset(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t update_interval_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int ret = lm95234_update_device(data);
@@ -463,8 +463,9 @@ static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
 		       DIV_ROUND_CLOSEST(data->interval * 1000, HZ));
 }
 
-static ssize_t set_interval(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t update_interval_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int ret = lm95234_update_device(data);
@@ -566,8 +567,7 @@ static SENSOR_DEVICE_ATTR(temp4_offset, S_IWUSR | S_IRUGO, show_offset,
 static SENSOR_DEVICE_ATTR(temp5_offset, S_IWUSR | S_IRUGO, show_offset,
 			  set_offset, 3);
 
-static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_interval,
-		   set_interval);
+static DEVICE_ATTR_RW(update_interval);
 
 static struct attribute *lm95234_common_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
