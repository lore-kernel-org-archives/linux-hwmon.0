Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63945 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S964860AbcLVM0y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:54 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/66] hwmon: (adt7x10) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:35 +0100
Message-Id: <1482408335-3435-7-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adt7x10.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 98141f4..0f538f8 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -331,9 +331,8 @@ static ssize_t adt7x10_show_alarm(struct device *dev,
 	return sprintf(buf, "%d\n", !!(ret & attr->index));
 }
 
-static ssize_t adt7x10_show_name(struct device *dev,
-				 struct device_attribute *da,
-				 char *buf)
+static ssize_t name_show(struct device *dev, struct device_attribute *da,
+			 char *buf)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 
@@ -359,7 +358,7 @@ static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adt7x10_show_alarm,
 			  NULL, ADT7X10_STAT_T_HIGH);
 static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, adt7x10_show_alarm,
 			  NULL, ADT7X10_STAT_T_CRIT);
-static DEVICE_ATTR(name, S_IRUGO, adt7x10_show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct attribute *adt7x10_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,

