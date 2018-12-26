Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:17061 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726650AbeLZLVZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Dec 2018 06:21:25 -0500
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Kangjie Lu <kjlu@umn.edu>
CC: Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-hwmon@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] hwmon: (lm80) Fix missing unlock on error in set_fan_div()
Date: Wed, 26 Dec 2018 11:28:24 +0000
Message-ID: <1545823704-73836-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add the missing unlock before return from function set_fan_div()
in the error handling case.

Fixes: c9c63915519b ("hwmon: (lm80) fix a missing check of the status of SMBus read")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwmon/lm80.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 0e30fa0..f9b8e3e 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -393,8 +393,10 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	}
 
 	rv = lm80_read_value(client, LM80_REG_FANDIV);
-	if (rv < 0)
+	if (rv < 0) {
+		mutex_unlock(&data->update_lock);
 		return rv;
+	}
 	reg = (rv & ~(3 << (2 * (nr + 1))))
 	    | (data->fan_div[nr] << (2 * (nr + 1)));
 	lm80_write_value(client, LM80_REG_FANDIV, reg);
