Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3905 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938940AbcLVM05 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:57 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/66] hwmon: (jz4740) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:48 +0100
Message-Id: <1482408335-3435-20-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/jz4740-hwmon.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/jz4740-hwmon.c b/drivers/hwmon/jz4740-hwmon.c
index 0621ee1..2d40a2e 100644
--- a/drivers/hwmon/jz4740-hwmon.c
+++ b/drivers/hwmon/jz4740-hwmon.c
@@ -44,8 +44,8 @@ static irqreturn_t jz4740_hwmon_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static ssize_t jz4740_hwmon_read_adcin(struct device *dev,
-	struct device_attribute *dev_attr, char *buf)
+static ssize_t in0_input_show(struct device *dev,
+			      struct device_attribute *dev_attr, char *buf)
 {
 	struct jz4740_hwmon *hwmon = dev_get_drvdata(dev);
 	struct platform_device *pdev = hwmon->pdev;
@@ -79,7 +79,7 @@ static ssize_t jz4740_hwmon_read_adcin(struct device *dev,
 	return ret;
 }
 
-static DEVICE_ATTR(in0_input, S_IRUGO, jz4740_hwmon_read_adcin, NULL);
+static DEVICE_ATTR_RO(in0_input);
 
 static struct attribute *jz4740_attrs[] = {
 	&dev_attr_in0_input.attr,

