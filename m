Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (tmp102) Improve error handling
Date: Tue, 26 Jul 2016 08:19:48 -0700
Message-Id: <1469546388-29907-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1469546388-29907-1-git-send-email-linux@roeck-us.net>
References: <1469546388-29907-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Use devm_add_action_or_reset() instead of devm_add_action(), and
check its return code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp102.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index a942a2574a4d..8479ac5eb853 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -227,7 +227,9 @@ static int tmp102_probe(struct i2c_client *client,
 
 	tmp102->config_orig = regval;
 
-	devm_add_action(dev, tmp102_restore_config, tmp102);
+	err = devm_add_action_or_reset(dev, tmp102_restore_config, tmp102);
+	if (err)
+		return err;
 
 	regval &= ~TMP102_CONFIG_CLEAR;
 	regval |= TMP102_CONFIG_SET;
-- 
2.5.0
