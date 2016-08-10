Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (it87) Features mask must be 32 bit wide
Date: Tue,  9 Aug 2016 22:33:21 -0700
Message-Id: <1470807201-8612-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Coverity reports:

result_independent_of_operands: data->features & (65536UL /* 1UL << 16 */)
is always 0 regardless of the values of its operands. This occurs as the
logical operand of if.

data->features needs to be 32 bit wide since there are more than 16 features.

Fixes: cc18da79d9b7 ("hwmon: (it87) Support up to 6 temperature sensors ... ");
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 730d84028260..d0203a115eff 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -491,7 +491,7 @@ struct it87_sio_data {
 struct it87_data {
 	const struct attribute_group *groups[7];
 	enum chips type;
-	u16 features;
+	u32 features;
 	u8 peci_mask;
 	u8 old_peci_mask;
 
-- 
2.5.0
