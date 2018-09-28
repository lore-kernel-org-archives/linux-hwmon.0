Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36658 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbeI2EPW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Sep 2018 00:15:22 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: ina3221: Add INA3221_CONFIG to volatile_table
Date: Fri, 28 Sep 2018 14:49:20 -0700
Message-Id: <20180928214921.11528-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180928214921.11528-1-nicoleotsuka@gmail.com>
References: <20180928214921.11528-1-nicoleotsuka@gmail.com>
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
