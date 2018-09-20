Return-Path: <zhongjiang@huawei.com>
Return-path: <zhongjiang@huawei.com>
From: zhong jiang <zhongjiang@huawei.com>
To: <linux@roeck-us.net>
CC: <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] hwmon: remove redundant continue
Date: Thu, 20 Sep 2018 16:11:10 +0800
Message-ID: <1537431070-38261-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

The continue will not truely skip any code. hence it is safe to
remove it.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/hwmon/scpi-hwmon.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 7e49da5..111d521 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -286,10 +286,8 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
 		 * any thermal zones or if the thermal subsystem is
 		 * not configured.
 		 */
-		if (IS_ERR(z)) {
+		if (IS_ERR(z))
 			devm_kfree(dev, zone);
-			continue;
-		}
 	}
 
 	return 0;
-- 
1.7.12.4
