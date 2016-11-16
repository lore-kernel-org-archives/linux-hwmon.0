Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ch3vs02.rockwellcollins.com ([205.175.226.29]:62824 "EHLO
        ch3vs02.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753617AbcKPWek (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Nov 2016 17:34:40 -0500
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-hwmon@vger.kernel.org
Cc: Jared Bents <jared.bents@rockwellcollins.com>,
        Matt Weber <matthew.weber@rockwellcollins.com>
Subject: [PATCH] hwmon: (amc6821) sign extension temperature
Date: Wed, 16 Nov 2016 16:23:53 -0600
Message-Id: <1479335033-44479-1-git-send-email-matthew.weber@rockwellcollins.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Jared Bents <jared.bents@rockwellcollins.com>

Converts the unsigned temperature values from the i2c read
to be sign extended as defined in the datasheet so that
negative temperatures are properly read.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 drivers/hwmon/amc6821.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 12e851a..d7368f7 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -188,7 +188,7 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
 			!data->valid) {
 
 		for (i = 0; i < TEMP_IDX_LEN; i++)
-			data->temp[i] = i2c_smbus_read_byte_data(client,
+			data->temp[i] = (int8_t) i2c_smbus_read_byte_data(client,
 				temp_reg[i]);
 
 		data->stat1 = i2c_smbus_read_byte_data(client,
-- 
1.9.1

