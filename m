Return-path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 64/66] hwmon: (adt7475) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:33 +0100
Message-Id: <1482408335-3435-65-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adt7475.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 3cefd1a..c646670 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -856,16 +856,17 @@ static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm_at_crit(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static ssize_t pwm_use_point2_pwm_at_crit_show(struct device *dev,
+					struct device_attribute *devattr,
+					char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
 	return sprintf(buf, "%d\n", !!(data->config4 & CONFIG4_MAXDUTY));
 }
 
-static ssize_t set_pwm_at_crit(struct device *dev,
-			       struct device_attribute *devattr,
-			       const char *buf, size_t count)
+static ssize_t pwm_use_point2_pwm_at_crit_store(struct device *dev,
+					struct device_attribute *devattr,
+					const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
@@ -888,15 +889,15 @@ static ssize_t set_pwm_at_crit(struct device *dev,
 	return count;
 }
 
-static ssize_t show_vrm(struct device *dev, struct device_attribute *devattr,
+static ssize_t vrm_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct adt7475_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", (int)data->vrm);
 }
 
-static ssize_t set_vrm(struct device *dev, struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct adt7475_data *data = dev_get_drvdata(dev);
 	long val;
@@ -910,8 +911,8 @@ static ssize_t set_vrm(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t show_vid(struct device *dev, struct device_attribute *devattr,
-			char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
@@ -1057,11 +1058,10 @@ static SENSOR_DEVICE_ATTR_2(pwm3_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MAX, 2);
 
 /* Non-standard name, might need revisiting */
-static DEVICE_ATTR(pwm_use_point2_pwm_at_crit, S_IWUSR | S_IRUGO,
-		   show_pwm_at_crit, set_pwm_at_crit);
+static DEVICE_ATTR_RW(pwm_use_point2_pwm_at_crit);
 
-static DEVICE_ATTR(vrm, S_IWUSR | S_IRUGO, show_vrm, set_vrm);
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RW(vrm);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 static struct attribute *adt7475_attrs[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,
