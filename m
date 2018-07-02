Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gateway23.websitewelcome.com ([192.185.50.129]:40880 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753312AbeGBVvM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 2 Jul 2018 17:51:12 -0400
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 80F1E6A0C
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Jul 2018 16:30:19 -0500 (CDT)
Date: Mon, 2 Jul 2018 16:30:17 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] hwmon: Mark expected switch fall-throughs
Message-ID: <20180702213017.GA27242@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwmon/emc1403.c | 2 ++
 drivers/hwmon/nct6775.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 1ea7ca5..aaebeb7 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -443,8 +443,10 @@ static int emc1403_probe(struct i2c_client *client,
 	switch (id->driver_data) {
 	case emc1404:
 		data->groups[2] = &emc1404_group;
+		/* fall through */
 	case emc1403:
 		data->groups[1] = &emc1403_group;
+		/* fall through */
 	case emc1402:
 		data->groups[0] = &emc1402_group;
 	}
diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 3714990..c6bd61e 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -2541,7 +2541,7 @@ static void pwm_update_registers(struct nct6775_data *data, int nr)
 	case thermal_cruise:
 		nct6775_write_value(data, data->REG_TARGET[nr],
 				    data->target_temp[nr]);
-		/* intentional */
+		/* fall through  */
 	default:
 		reg = nct6775_read_value(data, data->REG_FAN_MODE[nr]);
 		reg = (reg & ~data->tolerance_mask) |
-- 
2.7.4

