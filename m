Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:12664 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388299AbeIUH2y (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 03:28:54 -0400
From: zhong jiang <zhongjiang@huawei.com>
To: <linux@roeck-us.net>
CC: <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCHv2] hwmon: scpi-hwmon:  remove redundant continue
Date: Fri, 21 Sep 2018 09:30:03 +0800
Message-ID: <1537493403-15745-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

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
