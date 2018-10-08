Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35848 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725749AbeJIEil (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Oct 2018 00:38:41 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (ina3221) Validate shunt resistor value from DT
Date: Mon,  8 Oct 2018 14:24:51 -0700
Message-Id: <20181008212451.18637-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The input->shunt_resistor is int type while the value from DT is
unsigned int. Meanwhile, a divide-by-zero error would happen if
the value is 0. So this patch just simply validates the value.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v1->v2:
 * Validate the value and error out

 drivers/hwmon/ina3221.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index c3a497aed345..4f3ed24efe8e 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -536,8 +536,14 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 	of_property_read_string(child, "label", &input->label);
 
 	/* Overwrite default shunt resistor value optionally */
-	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val))
+	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
+		if (val < 1 || val > INT_MAX) {
+			dev_err(dev, "invalid shunt resistor value %u of %s\n",
+				val, child->name);
+			return -EINVAL;
+		}
 		input->shunt_resistor = val;
+	}
 
 	return 0;
 }
-- 
2.17.1
