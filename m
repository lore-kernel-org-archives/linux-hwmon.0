Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35304 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbeI3EOS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Sep 2018 00:14:18 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] hwmon: ina3221: Fix INA3221_CONFIG_MODE macros
Date: Sat, 29 Sep 2018 14:44:06 -0700
Message-Id: <20180929214407.27208-3-nicoleotsuka@gmail.com>
In-Reply-To: <20180929214407.27208-1-nicoleotsuka@gmail.com>
References: <20180929214407.27208-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The three INA3221_CONFIG_MODE macros are not correctly defined here.
The MODE3-1 filed is loacted at BIT 2-0 according to the datasheet.

So this patch just fixes them by shifting all of them with a correct
offset. However, this isn't a crital bug fix as the driver does not
use any of them at this point.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina3221.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index cfe65ff01051..e0c4f4d83f4e 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -38,9 +38,9 @@
 #define INA3221_WARN3			0x0c
 #define INA3221_MASK_ENABLE		0x0f
 
-#define INA3221_CONFIG_MODE_SHUNT	BIT(1)
-#define INA3221_CONFIG_MODE_BUS		BIT(2)
-#define INA3221_CONFIG_MODE_CONTINUOUS	BIT(3)
+#define INA3221_CONFIG_MODE_SHUNT	BIT(0)
+#define INA3221_CONFIG_MODE_BUS		BIT(1)
+#define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
 
 #define INA3221_RSHUNT_DEFAULT		10000
 
-- 
2.17.1
