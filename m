Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.112]:1615 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727429AbeHGRe2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 13:34:28 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/4] hwmon: (adt7475) Change valid parameter to bool type
Date: Wed,  8 Aug 2018 00:19:07 +0900
Message-Id: <20180807151909.24433-3-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180807151909.24433-1-ikegami@allied-telesis.co.jp>
References: <20180807151909.24433-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Currently the valid paramter is char type but the type is not required.
So change the parameter to boot type correctly.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
Changes since v1:
- Change to rebase on the v2 patch 1.

 drivers/hwmon/adt7475.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 42f48c6843c5..680fc9cecb7b 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -195,7 +195,7 @@ struct adt7475_data {
 
 	unsigned long measure_updated;
 	bool limits_updated;
-	char valid;
+	bool valid;
 
 	u8 config4;
 	u8 config5;
@@ -1780,6 +1780,7 @@ static struct adt7475_data *adt7475_update_device(struct device *dev)
 	    !data->valid) {
 		adt7475_update_measure(dev);
 		data->measure_updated = jiffies;
+		data->valid = true;
 	}
 
 	/* Limits and settings, should never change update more than once */
-- 
2.16.1

