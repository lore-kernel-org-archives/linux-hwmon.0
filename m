Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3906 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965410AbcLVM1G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:06 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Rudolf Marek <r.marek@assembler.cz>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 48/66] hwmon: (w83793) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:17 +0100
Message-Id: <1482408335-3435-49-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/w83793.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index 816aa6c..dab5c51 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -324,7 +324,7 @@ static int w83793_detect(struct i2c_client *client,
 };
 
 static ssize_t
-show_vrm(struct device *dev, struct device_attribute *attr, char *buf)
+vrm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83793_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", data->vrm);
@@ -342,7 +342,7 @@ static int w83793_detect(struct i2c_client *client,
 }
 
 static ssize_t
-store_vrm(struct device *dev, struct device_attribute *attr,
+vrm_store(struct device *dev, struct device_attribute *attr,
 	  const char *buf, size_t count)
 {
 	struct w83793_data *data = dev_get_drvdata(dev);
@@ -1169,7 +1169,7 @@ static int w83793_detect(struct i2c_client *client,
 	SENSOR_ATTR_2(cpu0_vid, S_IRUGO, show_vid, NULL, NOT_USED, 0),
 	SENSOR_ATTR_2(cpu1_vid, S_IRUGO, show_vid, NULL, NOT_USED, 1),
 };
-static DEVICE_ATTR(vrm, S_IWUSR | S_IRUGO, show_vrm, store_vrm);
+static DEVICE_ATTR_RW(vrm);
 
 static struct sensor_device_attribute_2 sda_single_files[] = {
 	SENSOR_ATTR_2(intrusion0_alarm, S_IWUSR | S_IRUGO, show_alarm_beep,

