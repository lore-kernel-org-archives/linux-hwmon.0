Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60175 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965129AbcLVM0z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:55 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/66] hwmon: (g760a) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:41 +0100
Message-Id: <1482408335-3435-13-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/g760a.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/g760a.c b/drivers/hwmon/g760a.c
index ec6a77d..7be1371 100644
--- a/drivers/hwmon/g760a.c
+++ b/drivers/hwmon/g760a.c
@@ -107,8 +107,8 @@ static struct g760a_data *g760a_update_client(struct device *dev)
 	return data;
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *da,
-			char *buf)
+static ssize_t fan1_input_show(struct device *dev,
+			       struct device_attribute *da, char *buf)
 {
 	struct g760a_data *data = g760a_update_client(dev);
 	unsigned int rpm = 0;
@@ -121,8 +121,8 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", rpm);
 }
 
-static ssize_t show_fan_alarm(struct device *dev, struct device_attribute *da,
-			      char *buf)
+static ssize_t fan1_alarm_show(struct device *dev,
+			       struct device_attribute *da, char *buf)
 {
 	struct g760a_data *data = g760a_update_client(dev);
 
@@ -131,16 +131,16 @@ static ssize_t show_fan_alarm(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", fan_alarm);
 }
 
-static ssize_t get_pwm(struct device *dev, struct device_attribute *da,
-		       char *buf)
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *da,
+			 char *buf)
 {
 	struct g760a_data *data = g760a_update_client(dev);
 
 	return sprintf(buf, "%d\n", PWM_FROM_CNT(data->set_cnt));
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *da,
-		       const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev, struct device_attribute *da,
+			  const char *buf, size_t count)
 {
 	struct g760a_data *data = g760a_update_client(dev);
 	struct i2c_client *client = data->client;
@@ -157,9 +157,9 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm);
-static DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL);
-static DEVICE_ATTR(fan1_alarm, S_IRUGO, show_fan_alarm, NULL);
+static DEVICE_ATTR_RW(pwm1);
+static DEVICE_ATTR_RO(fan1_input);
+static DEVICE_ATTR_RO(fan1_alarm);
 
 static struct attribute *g760a_attrs[] = {
 	&dev_attr_pwm1.attr,

