Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:32836 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752434AbcGYAGH (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 24 Jul 2016 20:06:07 -0400
Received: by mail-pf0-f196.google.com with SMTP id i6so10837590pfe.0
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Jul 2016 17:06:06 -0700 (PDT)
From: Matt Ranostay <mranostay@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.de, Matt Ranostay <mranostay@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	David Frey <david.frey@sensirion.com>
Subject: [PATCH v2] hwmon: (sht3x) set initial jiffies to last_update
Date: Sun, 24 Jul 2016 17:05:32 -0700
Message-Id: <1469405132-7044-1-git-send-email-mranostay@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Handling the wraparound requires the data->last_update to be set to an
initial jiffies value. Otherwise on 32-bit systems you will not be able
to request a reading till the 5 minute jiffies rollover happens.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: David Frey <david.frey@sensirion.com>
Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---

Changes from v1:
 * document more in commit message the reason for the patch
 * mark last sample before driver load so initial reading can happen
   shortly after boot

 drivers/hwmon/sht3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index b73a48832732..6ea99cd6ae79 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -720,7 +720,7 @@ static int sht3x_probe(struct i2c_client *client,
 	data->setup.blocking_io = false;
 	data->setup.high_precision = true;
 	data->mode = 0;
-	data->last_update = 0;
+	data->last_update = jiffies - msecs_to_jiffies(3000);
 	data->client = client;
 	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
 
-- 
2.7.4

