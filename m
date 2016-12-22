Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3906 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965387AbcLVM1F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:05 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 41/66] hwmon: (w83627ehf) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:10 +0100
Message-Id: <1482408335-3435-42-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/w83627ehf.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 697007a..ab346ed 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1687,14 +1687,14 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 
 fan_time_functions(fan_stop_time, FAN_STOP_TIME)
 
-static ssize_t show_name(struct device *dev, struct device_attribute *attr,
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct sensor_device_attribute sda_sf3_arrays_fan4[] = {
 	SENSOR_ATTR(pwm4_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
@@ -1754,12 +1754,12 @@ static ssize_t show_name(struct device *dev, struct device_attribute *attr,
 };
 
 static ssize_t
-show_vid(struct device *dev, struct device_attribute *attr, char *buf)
+cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 
 /* Case open detection */

