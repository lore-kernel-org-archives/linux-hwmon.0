Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:12095 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726647AbeIKRPB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Sep 2018 13:15:01 -0400
From: zhong jiang <zhongjiang@huawei.com>
To: <kronos.it@gmail.com>, <jdelvare@suse.com>, <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] hwmon: Use PTR_ERR_OR_ZERO instead of reimplementing its function
Date: Tue, 11 Sep 2018 20:03:37 +0800
Message-ID: <1536667417-11718-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

PTR_ERR_OR_ZERO has implemented the same function. We prefer to use
inlined function rather than code-opened implementation.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/hwmon/asus_atk0110.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index a6636fe..a7cf008 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -1210,10 +1210,8 @@ static int atk_register_hwmon(struct atk_data *data)
 	data->hwmon_dev = hwmon_device_register_with_groups(dev, "atk0110",
 							    data,
 							    data->attr_groups);
-	if (IS_ERR(data->hwmon_dev))
-		return PTR_ERR(data->hwmon_dev);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(data->hwmon_dev);
 }
 
 static int atk_probe_if(struct atk_data *data)
-- 
1.7.12.4
