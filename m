Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3904 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965357AbcLVM1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:03 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 34/66] hwmon: (pcf8591) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:03 +0100
Message-Id: <1482408335-3435-35-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/pcf8591.c |   24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pcf8591.c b/drivers/hwmon/pcf8591.c
index 5740888..60e25c8 100644
--- a/drivers/hwmon/pcf8591.c
+++ b/drivers/hwmon/pcf8591.c
@@ -103,16 +103,16 @@ static DEVICE_ATTR(in##channel##_input, S_IRUGO,			\
 show_in_channel(2);
 show_in_channel(3);
 
-static ssize_t show_out0_ouput(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t out0_output_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct pcf8591_data *data = i2c_get_clientdata(to_i2c_client(dev));
 	return sprintf(buf, "%d\n", data->aout * 10);
 }
 
-static ssize_t set_out0_output(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static ssize_t out0_output_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	unsigned long val;
 	struct i2c_client *client = to_i2c_client(dev);
@@ -132,19 +132,18 @@ static ssize_t set_out0_output(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(out0_output, S_IWUSR | S_IRUGO,
-		   show_out0_ouput, set_out0_output);
+static DEVICE_ATTR_RW(out0_output);
 
-static ssize_t show_out0_enable(struct device *dev,
+static ssize_t out0_enable_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct pcf8591_data *data = i2c_get_clientdata(to_i2c_client(dev));
 	return sprintf(buf, "%u\n", !(!(data->control & PCF8591_CONTROL_AOEF)));
 }
 
-static ssize_t set_out0_enable(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static ssize_t out0_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct pcf8591_data *data = i2c_get_clientdata(client);
@@ -165,8 +164,7 @@ static ssize_t set_out0_enable(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(out0_enable, S_IWUSR | S_IRUGO,
-		   show_out0_enable, set_out0_enable);
+static DEVICE_ATTR_RW(out0_enable);
 
 static struct attribute *pcf8591_attributes[] = {
 	&dev_attr_out0_enable.attr,

