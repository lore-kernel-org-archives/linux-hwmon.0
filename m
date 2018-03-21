Return-Path: <alvaro.gamez@hazent.com>
Return-path: <alvaro.gamez@hazent.com>
From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Subject: [PATCH v2] hwmon: (lm92) Remove spurious test that prevented max6635 detection
Date: Wed, 21 Mar 2018 10:27:09 +0100
Message-Id: <20180321092709.22377-1-alvaro.gamez@hazent.com>
List-ID: <linux-hwmon@vger.kernel.org>

An assumption was made that reads of a max6635 LM92_REG_MAN_ID register
would return the last value read from any other of its registers.

This assumption is not only something that is not documented anywhere,
but it is also untrue, so this prevented max6635 recognition.

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---

Changes in v2:
 Sorry, I seem to be slightly dyslexic and keep confusing max6635 <> max6335


 drivers/hwmon/lm92.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 2a91974a10bb..a2c3f3080192 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -272,16 +272,8 @@ static int max6635_check(struct i2c_client *client)
 	u8 conf;
 	int i;
 
-	/*
-	 * No manufacturer ID register, so a read from this address will
-	 * always return the last read value.
-	 */
 	temp_low = i2c_smbus_read_word_data(client, LM92_REG_TEMP_LOW);
-	if (i2c_smbus_read_word_data(client, LM92_REG_MAN_ID) != temp_low)
-		return 0;
 	temp_high = i2c_smbus_read_word_data(client, LM92_REG_TEMP_HIGH);
-	if (i2c_smbus_read_word_data(client, LM92_REG_MAN_ID) != temp_high)
-		return 0;
 
 	/* Limits are stored as integer values (signed, 9-bit). */
 	if ((temp_low & 0x7f00) || (temp_high & 0x7f00))
-- 
2.16.2
