Return-path: <jeroen.de_wachter.ext@nokia.com>
From: <jeroen.de_wachter.ext@nokia.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jeroen De
 Wachter <jeroen.de_wachter.ext@nokia.com>
Subject: [PATCH 2/2] hwmon/tmp401: Fix some checkstyle warnings
Date: Mon, 9 Jan 2017 17:47:38 +0100
Message-ID: <1483980458-28202-2-git-send-email-jeroen.de_wachter.ext@nokia.com>
In-Reply-To: <1483980458-28202-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
References: <1483980458-28202-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>

Signed-off-by: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>
---
 drivers/hwmon/tmp401.c | 66 +++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 88b17e4..853056d 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -498,40 +498,40 @@ static ssize_t set_update_interval(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp, NULL, 0, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_min, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp1_input, 0444, show_temp, NULL, 0, 0);
+static SENSOR_DEVICE_ATTR_2(temp1_min, 0644, show_temp,
 			    store_temp, 1, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_max, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp1_max, 0644, show_temp,
 			    store_temp, 2, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_crit, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp1_crit, 0644, show_temp,
 			    store_temp, 3, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO,
+static SENSOR_DEVICE_ATTR(temp1_crit_hyst, 0644,
 			  show_temp_crit_hyst, store_temp_crit_hyst, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_min_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp1_min_alarm, 0444, show_status, NULL,
 			    1, TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2(temp1_max_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp1_max_alarm, 0444, show_status, NULL,
 			    2, TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2(temp1_crit_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp1_crit_alarm, 0444, show_status, NULL,
 			    3, TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, 0, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_min, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp2_input, 0444, show_temp, NULL, 0, 1);
+static SENSOR_DEVICE_ATTR_2(temp2_min, 0644, show_temp,
 			    store_temp, 1, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp2_max, 0644, show_temp,
 			    store_temp, 2, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_crit, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp2_crit, 0644, show_temp,
 			    store_temp, 3, 1);
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO, show_temp_crit_hyst,
+static SENSOR_DEVICE_ATTR(temp2_crit_hyst, 0444, show_temp_crit_hyst,
 			  NULL, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_fault, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp2_fault, 0444, show_status, NULL,
 			    0, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2(temp2_min_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp2_min_alarm, 0444, show_status, NULL,
 			    1, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2(temp2_max_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp2_max_alarm, 0444, show_status, NULL,
 			    2, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2(temp2_crit_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp2_crit_alarm, 0444, show_status, NULL,
 			    3, TMP432_STATUS_REMOTE1);
 
-static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_interval,
+static DEVICE_ATTR(update_interval, 0644, show_update_interval,
 		   set_update_interval);
 
 static struct attribute *tmp401_attributes[] = {
@@ -570,11 +570,11 @@ static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_interval,
  * minimum and maximum register reset for both the local
  * and remote channels.
  */
-static SENSOR_DEVICE_ATTR_2(temp1_lowest, S_IRUGO, show_temp, NULL, 4, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_highest, S_IRUGO, show_temp, NULL, 5, 0);
-static SENSOR_DEVICE_ATTR_2(temp2_lowest, S_IRUGO, show_temp, NULL, 4, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_highest, S_IRUGO, show_temp, NULL, 5, 1);
-static SENSOR_DEVICE_ATTR(temp_reset_history, S_IWUSR, NULL, reset_temp_history,
+static SENSOR_DEVICE_ATTR_2(temp1_lowest, 0444, show_temp, NULL, 4, 0);
+static SENSOR_DEVICE_ATTR_2(temp1_highest, 0444, show_temp, NULL, 5, 0);
+static SENSOR_DEVICE_ATTR_2(temp2_lowest, 0444, show_temp, NULL, 4, 1);
+static SENSOR_DEVICE_ATTR_2(temp2_highest, 0444, show_temp, NULL, 5, 1);
+static SENSOR_DEVICE_ATTR(temp_reset_history, 0200, NULL, reset_temp_history,
 			  0);
 
 static struct attribute *tmp411_attributes[] = {
@@ -590,22 +590,22 @@ static SENSOR_DEVICE_ATTR(temp_reset_history, S_IWUSR, NULL, reset_temp_history,
 	.attrs = tmp411_attributes,
 };
 
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, 0, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_min, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp3_input, 0444, show_temp, NULL, 0, 2);
+static SENSOR_DEVICE_ATTR_2(temp3_min, 0644, show_temp,
 			    store_temp, 1, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_max, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp3_max, 0644, show_temp,
 			    store_temp, 2, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_crit, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp3_crit, 0644, show_temp,
 			    store_temp, 3, 2);
-static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO, show_temp_crit_hyst,
+static SENSOR_DEVICE_ATTR(temp3_crit_hyst, 0444, show_temp_crit_hyst,
 			  NULL, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_fault, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp3_fault, 0444, show_status, NULL,
 			    0, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2(temp3_min_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp3_min_alarm, 0444, show_status, NULL,
 			    1, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2(temp3_max_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp3_max_alarm, 0444, show_status, NULL,
 			    2, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2(temp3_crit_alarm, S_IRUGO, show_status, NULL,
+static SENSOR_DEVICE_ATTR_2(temp3_crit_alarm, 0444, show_status, NULL,
 			    3, TMP432_STATUS_REMOTE2);
 
 static struct attribute *tmp432_attributes[] = {
@@ -630,7 +630,7 @@ static SENSOR_DEVICE_ATTR_2(temp3_crit_alarm, S_IRUGO, show_status, NULL,
  * Additional features of the TMP461 chip.
  * The TMP461 temperature offset for the remote channel.
  */
-static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IWUSR | S_IRUGO, show_temp,
+static SENSOR_DEVICE_ATTR_2(temp2_offset, 0644, show_temp,
 			    store_temp, 6, 1);
 
 static struct attribute *tmp461_attributes[] = {
-- 
1.8.3.1
