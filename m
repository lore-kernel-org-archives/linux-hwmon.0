Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3903 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965385AbcLVM1E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:04 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 39/66] hwmon: (via-cputemp) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:08 +0100
Message-Id: <1482408335-3435-40-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/via-cputemp.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index d1f209a..07a0cb0 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -88,8 +88,8 @@ static ssize_t show_temp(struct device *dev,
 	return sprintf(buf, "%lu\n", ((unsigned long)eax & 0xffffff) * 1000);
 }
 
-static ssize_t show_cpu_vid(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct via_cputemp_data *data = dev_get_drvdata(dev);
 	u32 eax, edx;
@@ -119,7 +119,7 @@ static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL,
 };
 
 /* Optional attributes */
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_cpu_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 static int via_cputemp_probe(struct platform_device *pdev)
 {

