Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.112]:17971 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727669AbeHGLMD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 07:12:03 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 2/4] hwmon: (adt7475) Change valid parameter to bool type
Date: Tue,  7 Aug 2018 17:57:31 +0900
Message-Id: <20180807085733.28756-3-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180807085733.28756-1-ikegami@allied-telesis.co.jp>
References: <20180807085733.28756-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Currently the valid paramter is char type but the type is not required.
So change the parameter to boot type correctly.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 270cabb49677..5f03a93632c3 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -195,7 +195,7 @@ struct adt7475_data {
 
 	unsigned long measure_updated;
 	unsigned long limits_updated;
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
 
 	/* Limits and settings, should never change update every 60 seconds */
@@ -1787,7 +1788,7 @@ static struct adt7475_data *adt7475_update_device(struct device *dev)
 	    !data->valid) {
 		adt7475_update_limits(dev);
 		data->limits_updated = jiffies;
-		data->valid = 1;
+		data->valid = true;
 	}
 	mutex_unlock(&data->lock);
 
-- 
2.16.1

