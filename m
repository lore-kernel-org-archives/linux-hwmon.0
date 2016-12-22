Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63945 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965220AbcLVM1H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:07 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 50/66] hwmon: (k10temp) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:19 +0100
Message-Id: <1482408335-3435-51-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/k10temp.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 9cdfde6..ce3b91f 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -72,8 +72,8 @@ static void amd_nb_smu_index_read(struct pci_dev *pdev, unsigned int devfn,
 	mutex_unlock(&nb_smu_ind_mutex);
 }
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	u32 regval;
 	struct pci_dev *pdev = dev_get_drvdata(dev);
@@ -88,8 +88,8 @@ static ssize_t show_temp(struct device *dev,
 	return sprintf(buf, "%u\n", (regval >> 21) * 125);
 }
 
-static ssize_t show_temp_max(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t temp1_max_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d\n", 70 * 1000);
 }
@@ -110,8 +110,8 @@ static ssize_t show_temp_crit(struct device *dev,
 	return sprintf(buf, "%d\n", value);
 }
 
-static DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL);
-static DEVICE_ATTR(temp1_max, S_IRUGO, show_temp_max, NULL);
+static DEVICE_ATTR_RO(temp1_input);
+static DEVICE_ATTR_RO(temp1_max);
 static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp_crit, NULL, 0);
 static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO, show_temp_crit, NULL, 1);
 

