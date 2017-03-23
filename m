Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:58126 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754136AbdCWNBo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2017 09:01:44 -0400
From: Peter Huewe <peterhuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH 2/5] w83627ehf: Use octal values for access rights of sysfs files
Date: Thu, 23 Mar 2017 14:03:05 +0100
Message-Id: <20170323130308.29166-2-peterhuewe@gmx.de>
In-Reply-To: <20170323130308.29166-1-peterhuewe@gmx.de>
References: <20170323130308.29166-1-peterhuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

As indicated by checkpatch, use the octal representation for the access
rights.

S_IWUSR | S_IRUGO => 0644
S_IRUGO => 0444

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/hwmon/w83627ehf.c | 52 ++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index f2f33dd35fd4..0acadeece509 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1098,25 +1098,17 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 }
 
 static struct sensor_device_attribute sda_target_temp[] = {
-	SENSOR_ATTR(pwm1_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 0),
-	SENSOR_ATTR(pwm2_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 1),
-	SENSOR_ATTR(pwm3_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 2),
-	SENSOR_ATTR(pwm4_target, S_IWUSR | S_IRUGO, show_target_temp,
-		    store_target_temp, 3),
+	SENSOR_ATTR(pwm1_target, 0644, show_target_temp, store_target_temp, 0),
+	SENSOR_ATTR(pwm2_target, 0644, show_target_temp, store_target_temp, 1),
+	SENSOR_ATTR(pwm3_target, 0644, show_target_temp, store_target_temp, 2),
+	SENSOR_ATTR(pwm4_target, 0644, show_target_temp, store_target_temp, 3),
 };
 
 static struct sensor_device_attribute sda_tolerance[] = {
-	SENSOR_ATTR(pwm1_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 0),
-	SENSOR_ATTR(pwm2_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 1),
-	SENSOR_ATTR(pwm3_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 2),
-	SENSOR_ATTR(pwm4_tolerance, S_IWUSR | S_IRUGO, show_tolerance,
-		    store_tolerance, 3),
+	SENSOR_ATTR(pwm1_tolerance, 0644, show_tolerance, store_tolerance, 0),
+	SENSOR_ATTR(pwm2_tolerance, 0644, show_tolerance, store_tolerance, 1),
+	SENSOR_ATTR(pwm3_tolerance, 0644, show_tolerance, store_tolerance, 2),
+	SENSOR_ATTR(pwm4_tolerance, 0644, show_tolerance, store_tolerance, 3),
 };
 
 /* Smart Fan registers */
@@ -1194,24 +1186,24 @@ store_##reg(struct device *dev, struct device_attribute *attr, \
 fan_time_functions(fan_stop_time, FAN_STOP_TIME)
 
 static struct sensor_device_attribute sda_sf3_arrays_fan4[] = {
-	SENSOR_ATTR(pwm4_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
+	SENSOR_ATTR(pwm4_stop_time, 0644, show_fan_stop_time,
 		    store_fan_stop_time, 3),
-	SENSOR_ATTR(pwm4_start_output, S_IWUSR | S_IRUGO, show_fan_start_output,
+	SENSOR_ATTR(pwm4_start_output, 0644, show_fan_start_output,
 		    store_fan_start_output, 3),
-	SENSOR_ATTR(pwm4_stop_output, S_IWUSR | S_IRUGO, show_fan_stop_output,
+	SENSOR_ATTR(pwm4_stop_output, 0644, show_fan_stop_output,
 		    store_fan_stop_output, 3),
-	SENSOR_ATTR(pwm4_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
+	SENSOR_ATTR(pwm4_max_output, 0644, show_fan_max_output,
 		    store_fan_max_output, 3),
-	SENSOR_ATTR(pwm4_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
+	SENSOR_ATTR(pwm4_step_output, 0644, show_fan_step_output,
 		    store_fan_step_output, 3),
 };
 
 static struct sensor_device_attribute sda_sf3_arrays_fan3[] = {
-	SENSOR_ATTR(pwm3_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
+	SENSOR_ATTR(pwm3_stop_time, 0644, show_fan_stop_time,
 		    store_fan_stop_time, 2),
-	SENSOR_ATTR(pwm3_start_output, S_IWUSR | S_IRUGO, show_fan_start_output,
+	SENSOR_ATTR(pwm3_start_output, 0644, show_fan_start_output,
 		    store_fan_start_output, 2),
-	SENSOR_ATTR(pwm3_stop_output, S_IWUSR | S_IRUGO, show_fan_stop_output,
+	SENSOR_ATTR(pwm3_stop_output, 0644, show_fan_stop_output,
 		    store_fan_stop_output, 2),
 };
 
@@ -1233,17 +1225,17 @@ static SENSOR_DEVICE_ATTR(pwm2_stop_output, 0644, show_fan_stop_output,
  * Need to check support while generating/removing attribute files.
  */
 static struct sensor_device_attribute sda_sf3_max_step_arrays[] = {
-	SENSOR_ATTR(pwm1_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
+	SENSOR_ATTR(pwm1_max_output, 0644, show_fan_max_output,
 		    store_fan_max_output, 0),
-	SENSOR_ATTR(pwm1_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
+	SENSOR_ATTR(pwm1_step_output, 0644, show_fan_step_output,
 		    store_fan_step_output, 0),
-	SENSOR_ATTR(pwm2_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
+	SENSOR_ATTR(pwm2_max_output, 0644, show_fan_max_output,
 		    store_fan_max_output, 1),
-	SENSOR_ATTR(pwm2_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
+	SENSOR_ATTR(pwm2_step_output, 0644, show_fan_step_output,
 		    store_fan_step_output, 1),
-	SENSOR_ATTR(pwm3_max_output, S_IWUSR | S_IRUGO, show_fan_max_output,
+	SENSOR_ATTR(pwm3_max_output, 0644, show_fan_max_output,
 		    store_fan_max_output, 2),
-	SENSOR_ATTR(pwm3_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
+	SENSOR_ATTR(pwm3_step_output, 0644, show_fan_step_output,
 		    store_fan_step_output, 2),
 };
 
-- 
2.10.2

