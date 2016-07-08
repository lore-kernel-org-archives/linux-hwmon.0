Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36459 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753672AbcGHCqX (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Jul 2016 22:46:23 -0400
Received: by mail-pf0-f193.google.com with SMTP id i123so3308434pfg.3
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Jul 2016 19:46:23 -0700 (PDT)
From: Matt Ranostay <mranostay@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Matt Ranostay <mranostay@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	David Frey <david.frey@sensirion.com>
Subject: [PATCH] hwmon: sht3x: set initial jiffies to last_update
Date: Thu,  7 Jul 2016 19:46:11 -0700
Message-Id: <1467945971-23798-1-git-send-email-mranostay@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Handling the wraparound requires the data->last_update to be set to an
initial jiffies value. Otherwise you can start in a state where the
sensor will never request a reading.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: David Frey <david.frey@sensirion.com>
Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---
 drivers/hwmon/sht3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 450645b6053d..05a925257938 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -722,7 +722,7 @@ static int sht3x_probe(struct i2c_client *client,
 	data->setup.blocking_io = false;
 	data->setup.high_precision = true;
 	data->mode = 0;
-	data->last_update = 0;
+	data->last_update = jiffies;
 	data->client = client;
 	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
 
-- 
2.7.4

