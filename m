Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965367AbcLVM1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:03 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 37/66] hwmon: (smsc47m1) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:06 +0100
Message-Id: <1482408335-3435-38-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/smsc47m1.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 5d32318..c7b6a42 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -264,8 +264,8 @@ static ssize_t get_pwm_en(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", PWM_EN_FROM_REG(data->pwm[attr->index]));
 }
 
-static ssize_t get_alarms(struct device *dev, struct device_attribute
-			  *devattr, char *buf)
+static ssize_t alarms_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
 {
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
 	return sprintf(buf, "%d\n", data->alarms);
@@ -440,16 +440,16 @@ static SENSOR_DEVICE_ATTR(pwm##offset##_enable, S_IRUGO | S_IWUSR,	\
 fan_present(2);
 fan_present(3);
 
-static DEVICE_ATTR(alarms, S_IRUGO, get_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_name(struct device *dev, struct device_attribute
+static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
 {
 	struct smsc47m1_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct attribute *smsc47m1_attributes_fan1[] = {
 	&sensor_dev_attr_fan1_input.dev_attr.attr,

