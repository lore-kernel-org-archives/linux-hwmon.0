Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40181 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbeJIDTO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Oct 2018 23:19:14 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (ina3221) Clamp shunt resistor value from DT
Date: Mon,  8 Oct 2018 13:05:37 -0700
Message-Id: <20181008200537.22062-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The input->shunt_resistor is int type while the value from DT is
unsigned int. Meanwhile, a divide-by-zero error would happen if
the value is 0. So this patch just simply clamps the value.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina3221.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index c3a497aed345..ce8f0a8c4982 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -536,8 +536,10 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 	of_property_read_string(child, "label", &input->label);
 
 	/* Overwrite default shunt resistor value optionally */
-	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val))
+	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
+		val = clamp_val(val, 1, INT_MAX);
 		input->shunt_resistor = val;
+	}
 
 	return 0;
 }
-- 
2.17.1
