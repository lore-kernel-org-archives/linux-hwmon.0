Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3905 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965401AbcLVM1F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:05 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 32/66] hwmon: (nct6683) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:01 +0100
Message-Id: <1482408335-3435-33-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/nct6683.c |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 559c596..8b0bc4f 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -979,7 +979,7 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 };
 
 static ssize_t
-show_global_beep(struct device *dev, struct device_attribute *attr, char *buf)
+beep_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	int ret;
@@ -1004,7 +1004,7 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 }
 
 static ssize_t
-store_global_beep(struct device *dev, struct device_attribute *attr,
+beep_enable_store(struct device *dev, struct device_attribute *attr,
 		  const char *buf, size_t count)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
@@ -1039,7 +1039,8 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 /* Case open detection */
 
 static ssize_t
-show_caseopen(struct device *dev, struct device_attribute *attr, char *buf)
+intrusion0_alarm_show(struct device *dev, struct device_attribute *attr,
+		      char *buf)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	int ret;
@@ -1064,8 +1065,8 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 }
 
 static ssize_t
-clear_caseopen(struct device *dev, struct device_attribute *attr,
-	       const char *buf, size_t count)
+intrusion0_alarm_store(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -1102,10 +1103,8 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 	return count;
 }
 
-static DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, show_caseopen,
-		   clear_caseopen);
-static DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, show_global_beep,
-		   store_global_beep);
+static DEVICE_ATTR_RW(intrusion0_alarm);
+static DEVICE_ATTR_RW(beep_enable);
 
 static struct attribute *nct6683_attributes_other[] = {
 	&dev_attr_intrusion0_alarm.attr,

