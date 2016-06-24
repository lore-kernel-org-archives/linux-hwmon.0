Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60950 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbcFXRbx (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 13:31:53 -0400
From: Colin King <colin.king@canonical.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Kosina <trivial@kernel.org>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (emc6w201): trivial fix of spelling mistake "Unknwown" -> "Unknown"
Date: Fri, 24 Jun 2016 18:31:32 +0100
Message-Id: <1466789492-17928-1-git-send-email-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in dev_dbg message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/emc6w201.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
index ada9071..f37fe201 100644
--- a/drivers/hwmon/emc6w201.c
+++ b/drivers/hwmon/emc6w201.c
@@ -464,7 +464,7 @@ static int emc6w201_detect(struct i2c_client *client,
 	if (verstep < 0 || (verstep & 0xF0) != 0xB0)
 		return -ENODEV;
 	if ((verstep & 0x0F) > 2) {
-		dev_dbg(&client->dev, "Unknwown EMC6W201 stepping %d\n",
+		dev_dbg(&client->dev, "Unknown EMC6W201 stepping %d\n",
 			verstep & 0x0F);
 		return -ENODEV;
 	}
-- 
2.8.1

