Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.215]:51836 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387724AbeGLBMi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 21:12:38 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 3/5] hwmon: adt7475: Change to use adt7475_read macro
Date: Thu, 12 Jul 2018 10:04:48 +0900
Message-Id: <20180712010450.10586-4-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

It shoudl be same as with other functions to use adt7475_read.
So change to use it instead of i2c_smbus_read_byte_data.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index a40eb62ee6b1..bad250729e99 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1012,7 +1012,7 @@ static ssize_t pwm_use_point2_pwm_at_crit_store(struct device *dev,
 		return -EINVAL;
 
 	mutex_lock(&data->lock);
-	data->config4 = i2c_smbus_read_byte_data(client, REG_CONFIG4);
+	data->config4 = adt7475_read(REG_CONFIG4);
 	if (val)
 		data->config4 |= CONFIG4_MAXDUTY;
 	else
-- 
2.16.1

