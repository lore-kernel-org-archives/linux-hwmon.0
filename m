Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63945 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965076AbcLVM0z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:55 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/66] hwmon: (fschmd) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:40 +0100
Message-Id: <1482408335-3435-12-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/fschmd.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index d58abdc..5e78229 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -561,7 +561,7 @@ static ssize_t store_pwm_auto_point1_pwm(struct device *dev,
  * The FSC hwmon family has the ability to force an attached alert led to flash
  * from software, we export this as an alert_led sysfs attr
  */
-static ssize_t show_alert_led(struct device *dev,
+static ssize_t alert_led_show(struct device *dev,
 	struct device_attribute *devattr, char *buf)
 {
 	struct fschmd_data *data = fschmd_update_device(dev);
@@ -572,7 +572,7 @@ static ssize_t show_alert_led(struct device *dev,
 		return sprintf(buf, "0\n");
 }
 
-static ssize_t store_alert_led(struct device *dev,
+static ssize_t alert_led_store(struct device *dev,
 	struct device_attribute *devattr, const char *buf, size_t count)
 {
 	u8 reg;
@@ -602,7 +602,7 @@ static ssize_t store_alert_led(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(alert_led, 0644, show_alert_led, store_alert_led);
+static DEVICE_ATTR_RW(alert_led);
 
 static struct sensor_device_attribute fschmd_attr[] = {
 	SENSOR_ATTR(in0_input, 0444, show_in_value, NULL, 0),

