Return-path: <ahemme@pgcel-ws1.cisco.com>
From: Alex Hemme <ahemme@cisco.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, Alex Hemme <ahemme@cisco.com>
Subject: [PATCH] hwmon: (max31790) Set correct PWM value
Date: Tue,  7 Mar 2017 14:38:29 -0500
Message-Id: <1488915509-19547-1-git-send-email-ahemme@cisco.com>
List-ID: <linux-hwmon@vger.kernel.org>

Traced fans not spinning to incorrect PWM value being written.
The passed in value was written instead of the calulated value.

Fixes: 54187ff9d766 ("hwmon: (max31790) Convert to use new hwmon registration API")

Signed-off-by: Alex Hemme <ahemme@cisco.com>
---
 drivers/hwmon/max31790.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index c1b9275..281491c 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -311,7 +311,7 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 		data->pwm[channel] = val << 8;
 		err = i2c_smbus_write_word_swapped(client,
 						   MAX31790_REG_PWMOUT(channel),
-						   val);
+						   data->pwm[channel]);
 		break;
 	case hwmon_pwm_enable:
 		fan_config = data->fan_config[channel];
--
1.8.3.1
