Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from secvs02.rockwellcollins.com ([205.175.225.241]:52317 "EHLO
        secvs02.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752174AbcKSEVP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2016 23:21:15 -0500
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-hwmon@vger.kernel.org
Cc: Jared Bents <jared.bents@rockwellcollins.com>,
        Matt Weber <matthew.weber@rockwellcollins.com>
Subject: [PATCH v2] hwmon: (amc6821) sign extension temperature
Date: Fri, 18 Nov 2016 22:20:38 -0600
Message-Id: <1479529238-9927-1-git-send-email-matthew.weber@rockwellcollins.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Jared Bents <jared.bents@rockwellcollins.com>

Converts the unsigned temperature values from the i2c read
to be sign extended as defined in the datasheet so that
negative temperatures are properly read.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
v1 -> v2
 - checkpatch cleanup, removed space between cast
   and function call.  truncated line over 80chars

---
 drivers/hwmon/amc6821.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 12e851a..eb53e0b 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -188,7 +188,8 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
 			!data->valid) {
 
 		for (i = 0; i < TEMP_IDX_LEN; i++)
-			data->temp[i] = i2c_smbus_read_byte_data(client,
+			data->temp[i] = (int8_t)i2c_smbus_read_byte_data(
+				client,
 				temp_reg[i]);
 
 		data->stat1 = i2c_smbus_read_byte_data(client,
-- 
1.9.1

