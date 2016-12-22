Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3904 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965139AbcLVM04 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:56 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/66] hwmon: (g762) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:42 +0100
Message-Id: <1482408335-3435-14-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/g762.c |   86 ++++++++++++++++++++++++---------------------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 642fe50..6d1208b 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -738,8 +738,8 @@ static int g762_pdata_prop_import(struct i2c_client *client)
  * Read function for fan1_input sysfs file. Return current fan RPM value, or
  * 0 if fan is out of control.
  */
-static ssize_t get_fan_rpm(struct device *dev, struct device_attribute *da,
-			   char *buf)
+static ssize_t fan1_input_show(struct device *dev,
+			       struct device_attribute *da, char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 	unsigned int rpm = 0;
@@ -764,8 +764,8 @@ static ssize_t get_fan_rpm(struct device *dev, struct device_attribute *da,
  * Read and write functions for pwm1_mode sysfs file. Get and set fan speed
  * control mode i.e. PWM (1) or DC (0).
  */
-static ssize_t get_pwm_mode(struct device *dev, struct device_attribute *da,
-			    char *buf)
+static ssize_t pwm1_mode_show(struct device *dev, struct device_attribute *da,
+			      char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 
@@ -776,8 +776,9 @@ static ssize_t get_pwm_mode(struct device *dev, struct device_attribute *da,
 		       !!(data->fan_cmd1 & G762_REG_FAN_CMD1_OUT_MODE));
 }
 
-static ssize_t set_pwm_mode(struct device *dev, struct device_attribute *da,
-			    const char *buf, size_t count)
+static ssize_t pwm1_mode_store(struct device *dev,
+			       struct device_attribute *da, const char *buf,
+			       size_t count)
 {
 	unsigned long val;
 	int ret;
@@ -796,8 +797,8 @@ static ssize_t set_pwm_mode(struct device *dev, struct device_attribute *da,
  * Read and write functions for fan1_div sysfs file. Get and set fan
  * controller prescaler value
  */
-static ssize_t get_fan_div(struct device *dev,
-			   struct device_attribute *da, char *buf)
+static ssize_t fan1_div_show(struct device *dev, struct device_attribute *da,
+			     char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 
@@ -807,9 +808,8 @@ static ssize_t get_fan_div(struct device *dev,
 	return sprintf(buf, "%d\n", G762_CLKDIV_FROM_REG(data->fan_cmd1));
 }
 
-static ssize_t set_fan_div(struct device *dev,
-			   struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
+			      const char *buf, size_t count)
 {
 	unsigned long val;
 	int ret;
@@ -828,8 +828,8 @@ static ssize_t set_fan_div(struct device *dev,
  * Read and write functions for fan1_pulses sysfs file. Get and set number
  * of tachometer pulses per fan revolution.
  */
-static ssize_t get_fan_pulses(struct device *dev,
-			      struct device_attribute *da, char *buf)
+static ssize_t fan1_pulses_show(struct device *dev,
+				struct device_attribute *da, char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 
@@ -839,9 +839,9 @@ static ssize_t get_fan_pulses(struct device *dev,
 	return sprintf(buf, "%d\n", G762_PULSE_FROM_REG(data->fan_cmd1));
 }
 
-static ssize_t set_fan_pulses(struct device *dev,
-			      struct device_attribute *da,
-			      const char *buf, size_t count)
+static ssize_t fan1_pulses_store(struct device *dev,
+				 struct device_attribute *da, const char *buf,
+				 size_t count)
 {
 	unsigned long val;
 	int ret;
@@ -870,8 +870,8 @@ static ssize_t set_fan_pulses(struct device *dev,
  * but we do not accept 0 as this mode is not natively supported by the chip
  * and it is not emulated by g762 driver. -EINVAL is returned in this case.
  */
-static ssize_t get_pwm_enable(struct device *dev,
-			      struct device_attribute *da, char *buf)
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *da, char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 
@@ -882,9 +882,9 @@ static ssize_t get_pwm_enable(struct device *dev,
 		       (!!(data->fan_cmd1 & G762_REG_FAN_CMD1_FAN_MODE)) + 1);
 }
 
-static ssize_t set_pwm_enable(struct device *dev,
-			      struct device_attribute *da,
-			      const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *da, const char *buf,
+				 size_t count)
 {
 	unsigned long val;
 	int ret;
@@ -904,8 +904,8 @@ static ssize_t set_pwm_enable(struct device *dev,
  * (which affects fan speed) in open-loop mode. 0 stops the fan and 255
  * makes it run at full speed.
  */
-static ssize_t get_pwm(struct device *dev, struct device_attribute *da,
-		       char *buf)
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *da,
+			 char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 
@@ -915,8 +915,8 @@ static ssize_t get_pwm(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", data->set_out);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *da,
-		       const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev, struct device_attribute *da,
+			  const char *buf, size_t count)
 {
 	unsigned long val;
 	int ret;
@@ -942,8 +942,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *da,
  * Also note that due to rounding errors it is possible that you don't read
  * back exactly the value you have set.
  */
-static ssize_t get_fan_target(struct device *dev, struct device_attribute *da,
-			      char *buf)
+static ssize_t fan1_target_show(struct device *dev,
+				struct device_attribute *da, char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 	unsigned int rpm;
@@ -961,8 +961,9 @@ static ssize_t get_fan_target(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%u\n", rpm);
 }
 
-static ssize_t set_fan_target(struct device *dev, struct device_attribute *da,
-			      const char *buf, size_t count)
+static ssize_t fan1_target_store(struct device *dev,
+				 struct device_attribute *da, const char *buf,
+				 size_t count)
 {
 	unsigned long val;
 	int ret;
@@ -978,7 +979,7 @@ static ssize_t set_fan_target(struct device *dev, struct device_attribute *da,
 }
 
 /* read function for fan1_fault sysfs file. */
-static ssize_t get_fan_failure(struct device *dev, struct device_attribute *da,
+static ssize_t fan1_fault_show(struct device *dev, struct device_attribute *da,
 			       char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
@@ -993,8 +994,8 @@ static ssize_t get_fan_failure(struct device *dev, struct device_attribute *da,
  * read function for fan1_alarm sysfs file. Note that OOC condition is
  * enabled low
  */
-static ssize_t get_fan_ooc(struct device *dev, struct device_attribute *da,
-			   char *buf)
+static ssize_t fan1_alarm_show(struct device *dev,
+			       struct device_attribute *da, char *buf)
 {
 	struct g762_data *data = g762_update_client(dev);
 
@@ -1004,18 +1005,15 @@ static ssize_t get_fan_ooc(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%u\n", !(data->fan_sta & G762_REG_FAN_STA_OOC));
 }
 
-static DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm);
-static DEVICE_ATTR(pwm1_mode, S_IWUSR | S_IRUGO, get_pwm_mode, set_pwm_mode);
-static DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-		   get_pwm_enable, set_pwm_enable);
-static DEVICE_ATTR(fan1_input, S_IRUGO, get_fan_rpm, NULL);
-static DEVICE_ATTR(fan1_alarm, S_IRUGO, get_fan_ooc, NULL);
-static DEVICE_ATTR(fan1_fault, S_IRUGO, get_fan_failure, NULL);
-static DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO,
-		   get_fan_target, set_fan_target);
-static DEVICE_ATTR(fan1_div, S_IWUSR | S_IRUGO, get_fan_div, set_fan_div);
-static DEVICE_ATTR(fan1_pulses, S_IWUSR | S_IRUGO,
-		   get_fan_pulses, set_fan_pulses);
+static DEVICE_ATTR_RW(pwm1);
+static DEVICE_ATTR_RW(pwm1_mode);
+static DEVICE_ATTR_RW(pwm1_enable);
+static DEVICE_ATTR_RO(fan1_input);
+static DEVICE_ATTR_RO(fan1_alarm);
+static DEVICE_ATTR_RO(fan1_fault);
+static DEVICE_ATTR_RW(fan1_target);
+static DEVICE_ATTR_RW(fan1_div);
+static DEVICE_ATTR_RW(fan1_pulses);
 
 /* Driver data */
 static struct attribute *g762_attrs[] = {

