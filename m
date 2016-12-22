Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60175 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965398AbcLVM1F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:05 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 44/66] hwmon: (w83792d) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:13 +0100
Message-Id: <1482408335-3435-45-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/w83792d.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
index 0a8bce7..d764602 100644
--- a/drivers/hwmon/w83792d.c
+++ b/drivers/hwmon/w83792d.c
@@ -578,7 +578,7 @@ static ssize_t store_temp23(struct device *dev, struct device_attribute *attr,
 
 /* get realtime status of all sensors items: voltage, temp, fan */
 static ssize_t
-show_alarms_reg(struct device *dev, struct device_attribute *attr, char *buf)
+alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83792d_data *data = w83792d_update_device(dev);
 	return sprintf(buf, "%d\n", data->alarms);
@@ -735,16 +735,16 @@ static ssize_t show_alarm(struct device *dev,
 }
 
 static ssize_t
-show_chassis_clear(struct device *dev, struct device_attribute *attr,
-			char *buf)
+intrusion0_alarm_show(struct device *dev, struct device_attribute *attr,
+		      char *buf)
 {
 	struct w83792d_data *data = w83792d_update_device(dev);
 	return sprintf(buf, "%d\n", data->chassis);
 }
 
 static ssize_t
-store_chassis_clear(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+intrusion0_alarm_store(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct w83792d_data *data = i2c_get_clientdata(client);
@@ -1047,7 +1047,7 @@ static SENSOR_DEVICE_ATTR_2(temp2_max_hyst, S_IRUGO | S_IWUSR,
 			show_temp23, store_temp23, 0, 4);
 static SENSOR_DEVICE_ATTR_2(temp3_max_hyst, S_IRUGO | S_IWUSR,
 			show_temp23, store_temp23, 1, 4);
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms_reg, NULL);
+static DEVICE_ATTR_RO(alarms);
 static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
 static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 2);
@@ -1067,8 +1067,7 @@ static SENSOR_DEVICE_ATTR_2(temp3_max_hyst, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL, 21);
 static SENSOR_DEVICE_ATTR(fan5_alarm, S_IRUGO, show_alarm, NULL, 22);
 static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 23);
-static DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR,
-			show_chassis_clear, store_chassis_clear);
+static DEVICE_ATTR_RW(intrusion0_alarm);
 static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0);
 static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 1);
 static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 2);

