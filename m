Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3903 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965362AbcLVM1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:03 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 35/66] hwmon: (sht15) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:04 +0100
Message-Id: <1482408335-3435-36-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/sht15.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index a2fdbb7..f16687c 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -769,7 +769,7 @@ static ssize_t sht15_show_humidity(struct device *dev,
 	return ret ? ret : sprintf(buf, "%d\n", sht15_calc_humid(data));
 }
 
-static ssize_t show_name(struct device *dev,
+static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr,
 			 char *buf)
 {
@@ -787,7 +787,7 @@ static SENSOR_DEVICE_ATTR(humidity1_fault, S_IRUGO, sht15_show_status, NULL,
 			  SHT15_STATUS_LOW_BATTERY);
 static SENSOR_DEVICE_ATTR(heater_enable, S_IRUGO | S_IWUSR, sht15_show_status,
 			  sht15_store_heater, SHT15_STATUS_HEATER);
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 static struct attribute *sht15_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	&sensor_dev_attr_humidity1_input.dev_attr.attr,

