Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965075AbcLVM0z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:55 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/66] hwmon: (f71882fg) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:39 +0100
Message-Id: <1482408335-3435-11-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/f71882fg.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index cb28e4b..ca54ce5 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -390,7 +390,7 @@ static ssize_t show_pwm_auto_point_temp(struct device *dev,
 static ssize_t store_pwm_auto_point_temp(struct device *dev,
 	struct device_attribute *devattr, const char *buf, size_t count);
 /* Sysfs misc */
-static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 	char *buf);
 
 static int f71882fg_probe(struct platform_device *pdev);
@@ -404,7 +404,7 @@ static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
 	.remove		= f71882fg_remove,
 };
 
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 /*
  * Temp attr for the f71858fg, the f71858fg is special as it has its
@@ -2212,7 +2212,7 @@ static ssize_t store_pwm_auto_point_temp(struct device *dev,
 	return count;
 }
 
-static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 	char *buf)
 {
 	struct f71882fg_data *data = dev_get_drvdata(dev);

