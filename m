Return-path: <jschaack@xes-inc.com>
From: Joe Schaack <jschaack@xes-inc.com>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	asierra@xes-inc.com,
	jschaack@xes-inc.com
Subject: [PATCH] hwmon: ina209: Handled signed registers
Date: Tue, 18 Apr 2017 07:15:50 -0500
Message-Id: <1492517750-20701-1-git-send-email-jschaack@xes-inc.com>
List-ID: <linux-hwmon@vger.kernel.org>

The shunt voltage and current registers are signed 16-bit values so
handle them as such.

Signed-off-by: Joe Schaack <jschaack@xes-inc.com>
Reviewed-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/hwmon/ina209.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index 5378fde..9fa975d 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -117,7 +117,7 @@ static long ina209_from_reg(const u8 reg, const u16 val)
 	case INA209_SHUNT_VOLTAGE_POS_WARN:
 	case INA209_SHUNT_VOLTAGE_NEG_WARN:
 		/* LSB=10 uV. Convert to mV. */
-		return DIV_ROUND_CLOSEST(val, 100);
+		return DIV_ROUND_CLOSEST((s16)val, 100);
 
 	case INA209_BUS_VOLTAGE:
 	case INA209_BUS_VOLTAGE_MAX_PEAK:
@@ -146,7 +146,7 @@ static long ina209_from_reg(const u8 reg, const u16 val)
 
 	case INA209_CURRENT:
 		/* LSB=1 mA (selected). Is in mA */
-		return val;
+		return (s16)val;
 	}
 
 	/* programmer goofed */
-- 
1.9.1
