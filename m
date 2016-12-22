Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3903 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965047AbcLVM0z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:55 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/66] hwmon: (atxp1) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:37 +0100
Message-Id: <1482408335-3435-9-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/atxp1.c |   35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/atxp1.c b/drivers/hwmon/atxp1.c
index f2f2f2f..b7eadb5 100644
--- a/drivers/hwmon/atxp1.c
+++ b/drivers/hwmon/atxp1.c
@@ -81,8 +81,8 @@ static struct atxp1_data *atxp1_update_device(struct device *dev)
 }
 
 /* sys file functions for cpu0_vid */
-static ssize_t atxp1_showvcore(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int size;
 	struct atxp1_data *data;
@@ -95,9 +95,9 @@ static ssize_t atxp1_showvcore(struct device *dev,
 	return size;
 }
 
-static ssize_t atxp1_storevcore(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t cpu0_vid_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct atxp1_data *data = atxp1_update_device(dev);
 	struct i2c_client *client = data->client;
@@ -154,12 +154,11 @@ static ssize_t atxp1_storevcore(struct device *dev,
  * CPU core reference voltage
  * unit: millivolt
  */
-static DEVICE_ATTR(cpu0_vid, S_IRUGO | S_IWUSR, atxp1_showvcore,
-		   atxp1_storevcore);
+static DEVICE_ATTR_RW(cpu0_vid);
 
 /* sys file functions for GPIO1 */
-static ssize_t atxp1_showgpio1(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t gpio1_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int size;
 	struct atxp1_data *data;
@@ -171,9 +170,8 @@ static ssize_t atxp1_showgpio1(struct device *dev,
 	return size;
 }
 
-static ssize_t atxp1_storegpio1(struct device *dev,
-				struct device_attribute *attr, const char *buf,
-				size_t count)
+static ssize_t gpio1_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct atxp1_data *data = atxp1_update_device(dev);
 	struct i2c_client *client = data->client;
@@ -201,11 +199,11 @@ static ssize_t atxp1_storegpio1(struct device *dev,
  * GPIO1 data register
  * unit: Four bit as hex (e.g. 0x0f)
  */
-static DEVICE_ATTR(gpio1, S_IRUGO | S_IWUSR, atxp1_showgpio1, atxp1_storegpio1);
+static DEVICE_ATTR_RW(gpio1);
 
 /* sys file functions for GPIO2 */
-static ssize_t atxp1_showgpio2(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t gpio2_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int size;
 	struct atxp1_data *data;
@@ -217,9 +215,8 @@ static ssize_t atxp1_showgpio2(struct device *dev,
 	return size;
 }
 
-static ssize_t atxp1_storegpio2(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t gpio2_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct atxp1_data *data = atxp1_update_device(dev);
 	struct i2c_client *client = data->client;
@@ -246,7 +243,7 @@ static ssize_t atxp1_storegpio2(struct device *dev,
  * GPIO2 data register
  * unit: Eight bit as hex (e.g. 0xff)
  */
-static DEVICE_ATTR(gpio2, S_IRUGO | S_IWUSR, atxp1_showgpio2, atxp1_storegpio2);
+static DEVICE_ATTR_RW(gpio2);
 
 static struct attribute *atxp1_attrs[] = {
 	&dev_attr_gpio1.attr,

