Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39192 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbeI3EOR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Sep 2018 00:14:17 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: ina3221: Add INA3221_CONFIG to volatile_table
Date: Sat, 29 Sep 2018 14:44:05 -0700
Message-Id: <20180929214407.27208-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180929214407.27208-1-nicoleotsuka@gmail.com>
References: <20180929214407.27208-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The MSB (15th bit) of INA3221_CONFIG is a self-clear reset bit.
So this register should be added to the volatile_table of the
regmap_config. Otherwise, we will see this bit is sticky in the
regcache which might accidentally reset the chip when an actual
write happens to the register.

This might not be a severe bug for the current code line since
there's no second place touching the INA3221_CONFIG except the
reset routine in the probe().

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina3221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e6b49500c52a..cfe65ff01051 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -353,7 +353,7 @@ static struct attribute *ina3221_attrs[] = {
 ATTRIBUTE_GROUPS(ina3221);
 
 static const struct regmap_range ina3221_yes_ranges[] = {
-	regmap_reg_range(INA3221_SHUNT1, INA3221_BUS3),
+	regmap_reg_range(INA3221_CONFIG, INA3221_BUS3),
 	regmap_reg_range(INA3221_MASK_ENABLE, INA3221_MASK_ENABLE),
 };
 
-- 
2.17.1
